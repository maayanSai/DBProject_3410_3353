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
