--view1
CREATE OR REPLACE VIEW TicketPassengerDetails AS
SELECT
    p.name AS passenger_name,
    t.idticket AS ticket_id,
    t.accumulatedvalue AS accumulated_value,
    tp.travelcost AS travel_cost,
    (SELECT MAX(travelcost) FROM travelpayment) AS max_travel_cost
FROM
    ticket t
JOIN
    passenger p ON t.idticket = p.idticket
JOIN
    travelpayment tp ON tp.idticket = t.idticket;
    
--quiery
SELECT * FROM TicketPassengerDetails;

--quiery
SELECT
    passenger_name,
    ticket_id,
    accumulated_value
FROM
    TicketPassengerDetails
WHERE
    accumulated_value < max_travel_cost
ORDER BY
    accumulated_value ASC; 
    
--quiery
SELECT
    passenger_name,
    ticket_id,
    accumulated_value,
    travel_cost
FROM
    TicketPassengerDetails
WHERE
    accumulated_value = 0
ORDER BY
    travel_cost DESC;
    
--view2
CREATE OR REPLACE VIEW CustomerPaymentDetails AS
SELECT
    c.cid,
    c.cname,
    c.cphone,
    c.cemail,
    p.price AS rental_payment,
    o.returndate,
    o.did AS dress
FROM
    Customer c
JOIN
    Orders o ON c.cid = o.cid
JOIN
    Payment p ON o.oid= p.oid;
    
--quiery
SELECT * FROM CustomerPaymentDetails;

--quiery
SELECT 
    cid,
    cname,
    SUM(rental_payment) AS total_rental_payment
FROM 
    CustomerPaymentDetails
WHERE 
    cid =405
GROUP BY 
    cid, cname;
    
--quiery
SELECT 
    cname,
    rental_payment,
    returndate
FROM 
    CustomerPaymentDetails
WHERE 
    returndate BETWEEN TO_DATE('2022-07-01', 'YYYY-MM-DD') AND TO_DATE('2023-07-31', 'YYYY-MM-DD');



