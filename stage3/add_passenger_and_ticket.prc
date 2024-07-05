CREATE OR REPLACE PROCEDURE add_passenger_and_ticket(
    p_passenger_id NUMBER,
    p_passenger_name VARCHAR2,
    p_passenger_phone VARCHAR2,
    p_passenger_birth_date DATE,
    p_stored_value NUMBER
) IS
    v_profile VARCHAR2(20);
    v_age NUMBER;
    v_ticket_number NUMBER;
BEGIN
    -- Calculate the age of the passenger
    v_age := FLOOR(MONTHS_BETWEEN(SYSDATE, p_passenger_birth_date) / 12);

    -- Determine the profile based on age
    IF v_age BETWEEN 5 AND 18 THEN
        v_profile := 'Student';
    ELSIF v_age BETWEEN 19 AND 29 THEN
        v_profile := 'Youth';
    ELSIF v_age BETWEEN 30 AND 65 THEN
        v_profile := 'Adult';
    ELSIF v_age > 65 THEN
        v_profile := 'Senior';
    ELSE
        v_profile := 'Invalid'; -- In case the age doesn't fall into any range
    END IF;

    -- Find the highest ticket number and increment by one
    SELECT NVL(MAX(idticket), 0) + 1 INTO v_ticket_number FROM ticket;

    -- Insert the ticket into the tickets table
    INSERT INTO ticket (cardprofile, idticket, accumulatedvalue)
    VALUES (v_profile, v_ticket_number, p_stored_value);

    -- Insert the passenger into the passengers table
    INSERT INTO passenger (name, idpassenger, phone, idticket, bdate)
    VALUES (p_passenger_name, p_passenger_id, p_passenger_phone, v_ticket_number, p_passenger_birth_date);

    -- Commit the transaction
    COMMIT;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20001, 'An error occurred: ' || SQLERRM);
END;
/
