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
    SET idbusline = idbusline 
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
