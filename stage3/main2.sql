CREATE OR REPLACE FUNCTION Get_Busline_Info (
    p_line_id IN NUMBER
) RETURN SYS_REFCURSOR IS
    result_cursor SYS_REFCURSOR;
    v_station_count NUMBER;
    v_duration NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_station_count 
    FROM StationToBus
    WHERE IdBusLine = p_line_id;
    v_duration := v_station_count * 5;
    OPEN result_cursor FOR
        SELECT stb.idbusline,
               s.idstation,
               s.name AS station_name,
               v_duration AS total_duration
        FROM stationtobus stb
        JOIN station s ON stb.idstation = s.idstation
        WHERE stb.idbusline = p_line_id
        ORDER BY s.idstation;

    RETURN result_cursor;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No data found for the given bus line.');
        RETURN NULL;
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);
        RETURN NULL;
END;
/
CREATE OR REPLACE PROCEDURE GetBusLineDepartureTimes (
    p_line_id IN NUMBER
) IS
    v_frequency_string VARCHAR2(20);
    v_frequency NUMBER;
    v_start_time DATE := TRUNC(SYSDATE) + INTERVAL '6' HOUR; -- Start time at 06:00 AM
    v_end_time DATE := TRUNC(SYSDATE) + INTERVAL '24' HOUR - INTERVAL '1' SECOND; -- End time at 11:59:59 PM
    v_departure_time DATE;

    CURSOR c_departures IS
        SELECT BusLine.Frequency
        FROM BusLine
        WHERE Idbusline = p_line_id;

BEGIN
    -- Fetching frequency using explicit cursor
    OPEN c_departures;
    FETCH c_departures INTO v_frequency_string;
    CLOSE c_departures;

    IF v_frequency_string IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'Invalid line_id or no data found.');
    END IF;

    -- Extracting frequency as number from the string
    v_frequency := TO_NUMBER(REGEXP_SUBSTR(v_frequency_string, '^\d+'));

    -- Debugging output
    DBMS_OUTPUT.PUT_LINE('the frequency: ' || v_frequency_string);

    -- Loop to print departure times
    v_departure_time := v_start_time;
    WHILE v_departure_time <= v_end_time LOOP
        DBMS_OUTPUT.PUT_LINE(TO_CHAR(v_departure_time, 'HH24:MI'));
        v_departure_time := v_departure_time + NUMTODSINTERVAL(v_frequency, 'MINUTE');
    END LOOP;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END;
/

DECLARE
    p_line_id NUMBER := &p_line_id_input;
    result_cursor SYS_REFCURSOR;
    v_idbusline NUMBER;
    v_idstation NUMBER;
    v_station_name VARCHAR2(100);
    v_total_duration NUMBER;
BEGIN
    -- קריאה לפונקציה Get_Busline_Info
    result_cursor := Get_Busline_Info(p_line_id);

    -- קריאת השורה הראשונה מה-cursor להוצאת זמן המסלול
    FETCH result_cursor INTO v_idbusline, v_idstation, v_station_name, v_total_duration;
    
    -- בדיקה אם לא נמצאו נתונים
    IF result_cursor%NOTFOUND THEN
        DBMS_OUTPUT.PUT_LINE('No data found for the given bus line.');
    ELSE
        -- הדפסת זמן המסלול
        DBMS_OUTPUT.PUT_LINE('Total Duration: ' || v_total_duration || ' minutes');
     

        -- המשך לולאה להדפסת שאר התחנות
        LOOP
            FETCH result_cursor INTO v_idbusline, v_idstation, v_station_name, v_total_duration;
            EXIT WHEN result_cursor%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE('Bus Line ID: ' || v_idbusline || 
                                 ', Station ID: ' || v_idstation || 
                                 ', Station Name: ' || v_station_name);
        END LOOP;
    END IF;

    CLOSE result_cursor;

    -- קריאה לפרוצדורה GetBusLineDepartureTimes להדפסת זמני היציאה
    DBMS_OUTPUT.PUT_LINE('Departure Times for Bus Line ID: ' || p_line_id);
    GetBusLineDepartureTimes(p_line_id);

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/

