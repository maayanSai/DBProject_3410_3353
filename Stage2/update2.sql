UPDATE ticket
SET cardprofile =
    CASE 
        WHEN EXTRACT(YEAR FROM (SELECT bdate FROM passenger WHERE idticket = ticket.idticket)) < EXTRACT(YEAR FROM CURRENT_DATE - INTERVAL '65' YEAR) THEN  'Veteran'
        WHEN EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM (SELECT bdate FROM passenger WHERE idticket = ticket.idticket)) BETWEEN 5 AND 18 THEN 'youth'
    END
WHERE EXISTS (
    SELECT 1
    FROM passenger
    WHERE idticket = ticket.idticket
    AND (
        EXTRACT(YEAR FROM bdate) < EXTRACT(YEAR FROM CURRENT_DATE - INTERVAL '65' YEAR)
        OR EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM bdate) BETWEEN 5 AND 18
    )
);
 
