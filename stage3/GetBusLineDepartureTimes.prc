CREATE OR REPLACE PROCEDURE GetBusLineDepartureTimes (
    p_line_id IN NUMBER
) IS
    v_frequency_string VARCHAR2(20);
    v_frequency NUMBER;
    v_start_time DATE := TRUNC(SYSDATE) + INTERVAL '6' HOUR; -
    v_end_time DATE := TRUNC(SYSDATE) + INTERVAL '24' HOUR - INTERVAL '1' SECOND; 
    v_departure_time DATE;

    CURSOR c_departures IS
        SELECT BusLine.Frequency
        FROM BusLine
        WHERE Idbusline = p_line_id;

BEGIN
    OPEN c_departures;
    FETCH c_departures INTO v_frequency_string;
    CLOSE c_departures;

    IF v_frequency_string IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'Invalid line_id or no data found.');
    END IF;

    v_frequency := TO_NUMBER(REGEXP_SUBSTR(v_frequency_string, '^\d+'));

    DBMS_OUTPUT.PUT_LINE('the frequency: ' || v_frequency_string);

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
