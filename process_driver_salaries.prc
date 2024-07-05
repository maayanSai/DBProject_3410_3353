CREATE OR REPLACE PROCEDURE process_driver_salaries IS
    -- Declare variables
    v_driver_id driver.idriver%TYPE;
    v_driver_name driver.name%TYPE;
    v_experience driver.seniority%TYPE;
    v_salary driver.salary%TYPE;
    v_total_salaries NUMBER := 0;
    v_num_drivers_raised NUMBER := 0; 
    v_cursor SYS_REFCURSOR;
BEGIN
    -- Open cursor to fetch driver data
    OPEN v_cursor FOR
        SELECT idriver, name, seniority, salary
        FROM driver;

    -- Loop through cursor to process each driver
    LOOP
        FETCH v_cursor INTO v_driver_id, v_driver_name, v_experience, v_salary;
        EXIT WHEN v_cursor%NOTFOUND;

        -- Check condition for salary increase based on experience
        IF v_experience >= 10 THEN
            -- Increase salary by 1500
            v_salary := v_salary + 1500;
            v_num_drivers_raised := v_num_drivers_raised + 1;  -- Increment count of raised drivers
        END IF;

        -- Update driver record with new salary
        UPDATE driver SET salary = v_salary WHERE idriver = v_driver_id;

        -- Accumulate total salaries processed
        v_total_salaries := v_total_salaries + v_salary;
    END LOOP;

    -- Close cursor
    CLOSE v_cursor;

    -- Display total salaries processed
    DBMS_OUTPUT.PUT_LINE('Total driver salaries processed: ' || v_total_salaries);

    -- Display number of drivers who received a raise
    DBMS_OUTPUT.PUT_LINE('Number of drivers who received a raise: ' || v_num_drivers_raised);

    COMMIT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No driver data found.');
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20001, 'An error occurred: ' || SQLERRM);
END;
/
