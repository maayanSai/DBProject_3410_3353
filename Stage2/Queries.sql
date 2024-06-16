/* select 1 */
WITH station_counts AS (
    SELECT idstation, COUNT(DISTINCT idbusline) AS busline_count
    FROM stationtobus
    GROUP BY idstation
), 
max_station AS (
    SELECT idstation
    FROM station_counts
    WHERE busline_count = (
        SELECT MAX(busline_count)
        FROM station_counts
    )
)
SELECT s.idstation, stb.idbusline
FROM stationtobus stb
JOIN max_station s ON stb.idstation = s.idstation;

/* select 2 */

SELECT d.name, COUNT(*) AS appearances
FROM driver d
JOIN busline b ON d.idbusline = b.idbusline
GROUP BY d.name
HAVING COUNT(*) = (
    SELECT MAX(appearances)
    FROM (
        SELECT COUNT(*) AS appearances
        FROM driver
        JOIN busline ON driver.idbusline = busline.idbusline
        GROUP BY driver.name
    ) counts
);

/* select 3 */

SELECT passenger.name, ticket.idticket, ticket.ACCUMULATEDVALUE
FROM ticket
JOIN passenger ON ticket.idticket = passenger.idticket
JOIN (
    SELECT MAX(TRAVELCOST) AS max_travel_cost
    FROM travelpayment
) max_cost ON ticket.ACCUMULATEDVALUE < max_cost.max_travel_cost
ORDER BY ticket.accumulatedvalue ASC;

/* select 4 */

SELECT b.idbusline
FROM (
    SELECT idbusline
    FROM Busline
    WHERE TO_NUMBER(REGEXP_SUBSTR(frequency, '^\d+')) < 30
) b
JOIN busride r ON b.idbusline = r.idbusline
WHERE TO_CHAR(r.starttime, 'HH24:MI:SS') < '13:00:00'
ORDER BY b.idbusline ASC;
