/*1*/
ALTER TABLE busride
ADD CONSTRAINT check_start_time
CHECK (TO_NUMBER(TO_CHAR(starttime, 'HH24')) BETWEEN 6 AND 23);

/*2*/

ALTER TABLE bus
ADD CONSTRAINT check_bus_licenseNumber
CHECK (REGEXP_LIKE(licenseNumber, '^[0-9]{2}-[0-9]{3}-[0-9]{2}$'));

/*3*/

alter table passenger
add constraint cheak_passenger_phone
check (phone LIKE '0%');
