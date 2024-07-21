CREATE OR REPLACE FUNCTION Driver_Bonus(percent IN NUMBER, threshold_hour IN INTEGER)
RETURN SYS_REFCURSOR IS
  message VARCHAR2(100); 
   CURSOR c_drivers IS 
    SELECT idriver, name, salary, work_hours
    FROM driver
    FOR UPDATE OF salary;

  result_cursor SYS_REFCURSOR;

  illegal_hour EXCEPTION; 
  illegal_percent EXCEPTION; 
  v_new_salary NUMBER; 
  max_work_hours CONSTANT INTEGER := 182; 

BEGIN
  IF threshold_hour < 150 OR threshold_hour > max_work_hours THEN
    message := 'Threshold hour should be an integer between 150 to 182';
    RAISE illegal_hour; 
  END IF;
  IF percent <= 0 OR percent > 100 THEN
    message := 'Percent should be a number between 1 to 100'; 
    RAISE illegal_percent; 
  END IF;
  FOR driver IN c_drivers LOOP
    IF driver.work_hours BETWEEN 150 AND 182 THEN
      v_new_salary := driver.salary + ((driver.salary * percent) / 100); 
      UPDATE driver
      SET salary = v_new_salary
      WHERE CURRENT OF c_drivers; 

    END IF;
  END LOOP;

  COMMIT;
 
  OPEN result_cursor FOR
    SELECT idriver, name,
           salary AS new_salary,
           TRUNC(salary / (1 + (percent / 100))) AS old_salary
    FROM driver
    WHERE work_hours BETWEEN 150 AND 182; 

  RETURN result_cursor; 

EXCEPTION
  WHEN illegal_hour THEN
    DBMS_OUTPUT.PUT_LINE(message); 
    RETURN NULL; 
  WHEN illegal_percent THEN
    DBMS_OUTPUT.PUT_LINE(message); 
    RETURN NULL; 
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM); 
    ROLLBACK; 
    RETURN NULL; 
END;
/
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

DECLARE
  percent NUMBER := &percent_input;
  threshold_hour NUMBER := &threshold_hour_input;
  p_passenger_id NUMBER := &p_passenger_id_input;
  p_passenger_name VARCHAR2(100) := '&p_passenger_name_input';
  p_passenger_phone VARCHAR2(15) := '&p_passenger_phone_input';
  p_passenger_birth_date DATE := TO_DATE('&p_passenger_birth_date_input', 'DD-MM-YYYY');
  p_stored_value NUMBER := &p_stored_value_input;
    
  result_bonus SYS_REFCURSOR;
  idriver NUMBER;
  name VARCHAR2(100);
  new_salary NUMBER;
  old_salary NUMBER;

BEGIN
  result_bonus := Driver_Bonus(percent, threshold_hour);

  LOOP
    FETCH result_bonus INTO idriver, name, new_salary, old_salary;
    EXIT WHEN result_bonus%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('Driver ID: ' || idriver || 
                         ', Name: ' || name || 
                         ', New Salary: ' || new_salary || 
                         ', Old Salary: ' || TRUNC(old_salary));
  END LOOP;

  CLOSE result_bonus;

  add_passenger_and_ticket(
    p_passenger_id,
    p_passenger_name,
    p_passenger_phone,
    p_passenger_birth_date,
    p_stored_value
  );
  DBMS_OUTPUT.PUT_LINE('Passenger and ticket added successfully.');

EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/


