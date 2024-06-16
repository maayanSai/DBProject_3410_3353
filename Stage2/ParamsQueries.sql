/*1*/
SELECT d.idbusline, d.name
FROM travelpayment t
JOIN bus b ON b.licensenumber = t.licensenumber
JOIN driver d ON b.licensenumber = d.icensenumber
WHERE t.travelcost  in (&<name= "travel cost"  list="5, 6, 7, 8, 9, 10, 11, 12"  type= string>)

/*2*/

select d.idbusline,d.icensenumber, b.capacity
from driver d
join bus b on d.icensenumber= b.licensenumber
where b.capacity < &<name="id bus" hint= "capacity value between 10-60" type=integer required=true>

/*3*/

SELECT p.name, p.idpassenger, t.cardprofile
FROM passenger p
JOIN ticket t ON p.idticket = t.idticket
WHERE p.bdate BETWEEN &<name=date_from type="date"> AND &<name=date_to type="date">;

/*4*/

SELECT s.idstation, b.frequency
FROM stationtobus s
JOIN busline b ON s.idbusline = b.idbusline
WHERE s.serial IN (&<name = "Id serial" list="1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 26, 17, 18, 19, 20, 21,
                                              22, 23, 24, 25, 26, 27, 28, 29, 30"  type= string>);

