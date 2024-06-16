UPDATE TravelPayment
SET travelcost = 15
WHERE Licensenumber IN (
    SELECT TravelPayment.Licensenumber
    FROM TravelPayment
    INNER JOIN Driver ON TravelPayment.Licensenumber = Driver.Icensenumber
    INNER JOIN BusLine ON Driver.Idbusline = BusLine.Idbusline
    WHERE TravelPayment.travelcost > BusLine.maxprice
);
