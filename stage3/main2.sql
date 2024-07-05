CREATE OR REPLACE PROCEDURE process_driver_salaries IS
    -- Declare variables
    v_driver_id driver.idriver%TYPE;
    v_driver_name driver.name%TYPE;
    v_experience driver.seniority%TYPE;
    v_salary driver.salary%TYPE;
    v_total_salaries NUMBER := 0;
    v_num_drivers_raised NUMBER := 0;  -- Variable to count drivers who received a raise
    v_cursor SYS_REFCURSOR;
BEGIN
    -- Open cursor to fetch driver data
    OPEN v_cursor FOR
        SELECT idriver, name, seniority, salary
        FROM driver;

    -- Loop through cursor to process each driver
    LOOP
        FETCH v_cursor INTO v_driver_id, v_driver_name, v_experience, v_salary;
        EXIT WHEN v_cursor%NOTFOUND;

        -- Check condition for salary increase based on experience
        IF v_experience >= 10 THEN
            -- Increase salary by 1500
            v_salary := v_salary + 1500;
            v_num_drivers_raised := v_num_drivers_raised + 1;  -- Increment count of raised drivers
        END IF;

        -- Update driver record with new salary
        UPDATE driver SET salary = v_salary WHERE idriver = v_driver_id;

        -- Accumulate total salaries processed
        v_total_salaries := v_total_salaries + v_salary;
    END LOOP;

    -- Close cursor
    CLOSE v_cursor;

    -- Display total salaries processed
    DBMS_OUTPUT.PUT_LINE('Total driver salaries processed: ' || v_total_salaries);

    -- Display number of drivers who received a raise
    DBMS_OUTPUT.PUT_LINE('Number of drivers who received a raise: ' || v_num_drivers_raised);

    COMMIT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No driver data found.');
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20001, 'An error occurred: ' || SQLERRM);
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
  -- Variables for Driver_Bonus function
  result SYS_REFCURSOR;
  idriver NUMBER;
  name VARCHAR2(100);
  new_salary NUMBER;
  old_salary NUMBER;
  percent NUMBER := 10; -- אחוז העלאת שכר
  threshold_hour NUMBER := 160; -- סף שעות העבודה

BEGIN
  -- קריאה לפונקציה Driver_Bonus
  BEGIN
    result := Driver_Bonus(percent, threshold_hour);

    -- הצגת התוצאות מהפונקציה
    LOOP
      FETCH result INTO idriver, name, new_salary, old_salary;
      EXIT WHEN result%NOTFOUND;
      DBMS_OUTPUT.PUT_LINE('Driver ID: ' || idriver || 
                           ', Name: ' || name || 
                           ', New Salary: ' || new_salary || 
                           ', Old Salary: ' || TRUNC(old_salary));
    END LOOP;

    -- סגירת ה-cursor
    CLOSE result;
  EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Error calling Driver_Bonus: ' || SQLERRM);
  END;

  -- קריאה לפרוצידורה process_driver_salaries
  BEGIN
    process_driver_salaries;
  EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Error calling process_driver_salaries: ' || SQLERRM);
  END;

END;
/


