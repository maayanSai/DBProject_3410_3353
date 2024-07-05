CREATE OR REPLACE FUNCTION Driver_Bonus(percent IN NUMBER, threshold_hour IN INTEGER)
RETURN SYS_REFCURSOR IS
  message VARCHAR2(100); -- משתנה לאחסון הודעת שגיאה
  CURSOR c_drivers IS -- קורסור לקריאת הנהגים מבטבלת DRIVER
    SELECT idriver, name, salary, work_hours
    FROM driver
    FOR UPDATE OF salary;

  result_cursor SYS_REFCURSOR;

  illegal_hour EXCEPTION; -- חריגה לשעות סף לא חוקיות
  illegal_percent EXCEPTION; -- חריגה לאחוז לא חוקי
  v_new_salary NUMBER; -- משתנה לחישוב השכר החדש
  max_work_hours CONSTANT INTEGER := 182; -- קבוע עבור מקסימום שעות עבודה

BEGIN
  -- בדיקת תקינות הקלט
  IF threshold_hour < 150 OR threshold_hour > max_work_hours THEN
    message := 'Threshold hour should be an integer between 150 to 182'; -- הודעת שגיאה לסף שעות
    RAISE illegal_hour; -- זריקת חריגה
  END IF;

  IF percent <= 0 OR percent > 100 THEN
    message := 'Percent should be a number between 1 to 100'; -- הודעת שגיאה לאחוז
    RAISE illegal_percent; -- זריקת חריגה
  END IF;

  -- פעולות DML - עדכון השכר לפי הפרמטרים הנתונים
  FOR driver IN c_drivers LOOP
    -- בדיקה אם שעות העבודה של הנהג נמצאות בטווח המותר
    IF driver.work_hours BETWEEN 150 AND 182 THEN
      v_new_salary := driver.salary + ((driver.salary * percent) / 100); -- חישוב השכר החדש

      -- עדכון השכר של הנהג בטבלה
      UPDATE driver
      SET salary = v_new_salary
      WHERE CURRENT OF c_drivers; -- עדכון לפי רשומה הנוכחית בקורסור

    END IF;
  END LOOP;

  -- ביצוע COMMIT לשמירת השינויים
  COMMIT;

  -- הכנת ה-REF CURSOR להחזרת התוצאות
  OPEN result_cursor FOR
    SELECT idriver, name,
           salary AS new_salary,
           TRUNC(salary / (1 + (percent / 100))) AS old_salary
    FROM driver
    WHERE work_hours BETWEEN 150 AND 182; -- בחירת נתונים להחזרה עבור נהגים עם שעות עבודה בטווח

  RETURN result_cursor; -- החזרת ה-REF CURSOR לקורא הפונקציה

EXCEPTION
  WHEN illegal_hour THEN
    DBMS_OUTPUT.PUT_LINE(message); -- הדפסת הודעת השגיאה לסף השעות
    RETURN NULL; -- החזרת ערך NULL במקרה של חריגה
  WHEN illegal_percent THEN
    DBMS_OUTPUT.PUT_LINE(message); -- הדפסת הודעת השגיאה לאחוז
    RETURN NULL; -- החזרת ערך NULL במקרה של חריגה
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM); -- הדפסת הודעת שגיאה לא צפויה
    ROLLBACK; -- ביצוע ROLLBACK במקרה של חריגה
    RETURN NULL; -- החזרת ערך NULL במקרה של חריגה
END;
/
CREATE OR REPLACE FUNCTION Get_Busline_Stations
RETURN SYS_REFCURSOR IS
  result_cursor SYS_REFCURSOR;

  -- Cursor explicit
  CURSOR c_buslines IS
    SELECT DISTINCT idbusline
    FROM stationtobus;

  -- Cursor implicit
  c_stations SYS_REFCURSOR;

  -- Record variable
  v_station_id station.idstation%TYPE;
  v_station_name station.name%TYPE;

BEGIN
  -- Loop through explicit cursor
  FOR busline_record IN c_buslines LOOP
    -- Update the busline record (Example DML operation)
    UPDATE stationtobus
    SET idbusline = idbusline -- No actual change, just an example
    WHERE idbusline = busline_record.idbusline;
    
    -- Commit the update
    COMMIT;
    
    -- Open implicit cursor
    OPEN c_stations FOR
      SELECT s.idstation, s.name
      FROM stationtobus stb
      JOIN station s ON stb.idstation = s.idstation
      WHERE stb.idbusline = busline_record.idbusline;
    
    -- Fetch stations for each busline
    LOOP
      FETCH c_stations INTO v_station_id, v_station_name;
      EXIT WHEN c_stations%NOTFOUND;
      
      -- Process each station (Example output to DBMS_OUTPUT)
      DBMS_OUTPUT.PUT_LINE('Busline ID: ' || busline_record.idbusline ||
                           ', Station ID: ' || v_station_id ||
                           ', Station Name: ' || v_station_name);
    END LOOP;
    
    -- Close the implicit cursor
    CLOSE c_stations;
  END LOOP;

  -- Prepare REF CURSOR result
  OPEN result_cursor FOR
    SELECT stb.idbusline, s.idstation, s.name AS station_name
    FROM stationtobus stb
    JOIN station s ON stb.idstation = s.idstation
    ORDER BY stb.idbusline, s.idstation;

  RETURN result_cursor;

EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);
    RETURN NULL;
END;
/

DECLARE
  result_bonus SYS_REFCURSOR;
  result_stations SYS_REFCURSOR;
  idriver NUMBER;
  name VARCHAR2(100);
  new_salary NUMBER;
  old_salary NUMBER;
  percent NUMBER := 10; -- אחוז העלאת שכר (הכנס ערך חוקי)
  threshold_hour NUMBER := 160; -- סף שעות העבודה

  -- משתנים עבור תוצאת Get_Busline_Stations
  busline_id NUMBER;
  station_id NUMBER;
  station_name VARCHAR2(100);

BEGIN
  BEGIN
    -- קריאה לפונקציה Driver_Bonus
    result_bonus := Driver_Bonus(percent, threshold_hour);

    -- הצגת התוצאות של Driver_Bonus
    LOOP
      FETCH result_bonus INTO idriver, name, new_salary, old_salary;
      EXIT WHEN result_bonus%NOTFOUND;
      DBMS_OUTPUT.PUT_LINE('Driver ID: ' || idriver || 
                           ', Name: ' || name || 
                           ', New Salary: ' || new_salary || 
                           ', Old Salary: ' || TRUNC(old_salary));
    END LOOP;

    -- סגירת ה-cursor של Driver_Bonus
    CLOSE result_bonus;
  EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Error in Driver_Bonus: ' || SQLERRM);
  END;

  BEGIN
    -- קריאה לפונקציה Get_Busline_Stations
    result_stations := Get_Busline_Stations();

    -- הצגת התוצאות של Get_Busline_Stations
    LOOP
      FETCH result_stations INTO busline_id, station_id, station_name;
      EXIT WHEN result_stations%NOTFOUND;
      DBMS_OUTPUT.PUT_LINE('Busline ID: ' || busline_id || 
                           ', Station ID: ' || station_id || 
                           ', Station Name: ' || station_name);
    END LOOP;

    -- סגירת ה-cursor של Get_Busline_Stations
    CLOSE result_stations;
  EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Error in Get_Busline_Stations: ' || SQLERRM);
  END;
END;
