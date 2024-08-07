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
