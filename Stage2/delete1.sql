DELETE FROM stationtobus
WHERE idbusline IN (
    SELECT busline.idbusline
    FROM busline
    LEFT JOIN stationtobus ON busline.idbusline = stationtobus.idbusline
    LEFT JOIN busride ON busline.idbusline = busride.idbusline
    LEFT JOIN bus ON busride.licensenumber = bus.licensenumber
    WHERE stationtobus.idstation IS NULL OR bus.capacity < 20
);

DELETE FROM busride
WHERE idbusline IN (
    SELECT busline.idbusline
    FROM busline
    LEFT JOIN stationtobus ON busline.idbusline = stationtobus.idbusline
    LEFT JOIN busride ON busline.idbusline = busride.idbusline
    LEFT JOIN bus ON busride.licensenumber = bus.licensenumber
    WHERE stationtobus.idstation IS NULL OR bus.capacity < 20
);
DELETE FROM busline
WHERE idbusline IN (
    SELECT busline.idbusline
    FROM busline
    LEFT JOIN stationtobus ON busline.idbusline = stationtobus.idbusline
    LEFT JOIN busride ON busline.idbusline = busride.idbusline
    LEFT JOIN bus ON busride.licensenumber = bus.licensenumber
    WHERE stationtobus.idstation IS NULL OR bus.capacity < 20
);
