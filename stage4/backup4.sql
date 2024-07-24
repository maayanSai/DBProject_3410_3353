prompt PL/SQL Developer import file
prompt Created on éåí øáéòé 24 éåìé 2024 by Maayan
set feedback off
set define off
prompt Creating BUS...
create table BUS
(
  model         VARCHAR2(15) not null,
  licensenumber VARCHAR2(15) not null,
  capacity      INTEGER default 25 not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table BUS
  add primary key (LICENSENUMBER)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table BUS
  add constraint CHECK_BUS_LICENSENUMBER
  check (REGEXP_LIKE(licenseNumber, '^[0-9]{2}-[0-9]{3}-[0-9]{2}$'));

prompt Creating DRIVER...
create table DRIVER
(
  idriver        INTEGER not null,
  seniority      INTEGER not null,
  icensenumber   VARCHAR2(15) not null,
  idbusline      INTEGER,
  work_hours     INTEGER,
  max_work_hours INTEGER,
  salary         INTEGER
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DRIVER
  add primary key (IDRIVER)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating BUSDRIVER...
create table BUSDRIVER
(
  idriver       INTEGER not null,
  licensenumber VARCHAR2(15) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table BUSDRIVER
  add primary key (IDRIVER, LICENSENUMBER)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table BUSDRIVER
  add foreign key (IDRIVER)
  references DRIVER (IDRIVER);
alter table BUSDRIVER
  add foreign key (LICENSENUMBER)
  references BUS (LICENSENUMBER);

prompt Creating BUSLINE...
create table BUSLINE
(
  idbusline INTEGER not null,
  frequency VARCHAR2(15) not null,
  maxprice  INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table BUSLINE
  add primary key (IDBUSLINE)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating BUSRIDE...
create table BUSRIDE
(
  starttime     DATE not null,
  idbusline     INTEGER not null,
  licensenumber VARCHAR2(15) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table BUSRIDE
  add primary key (IDBUSLINE, LICENSENUMBER)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table BUSRIDE
  add foreign key (IDBUSLINE)
  references BUSLINE (IDBUSLINE);
alter table BUSRIDE
  add foreign key (LICENSENUMBER)
  references BUS (LICENSENUMBER);
alter table BUSRIDE
  add constraint CHECK_START_TIME
  check (TO_NUMBER(TO_CHAR(starttime, 'HH24')) BETWEEN 6 AND 23);

prompt Creating CUSTOMER...
create table CUSTOMER
(
  cid    NUMBER(3) not null,
  cname  VARCHAR2(15),
  cemail VARCHAR2(15) not null,
  cphone VARCHAR2(15),
  bdate  DATE
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CUSTOMER
  add primary key (CID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating DRESS...
create table DRESS
(
  did    NUMBER(3) not null,
  length NUMBER(3),
  color  VARCHAR2(15),
  price  NUMBER(3) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DRESS
  add primary key (DID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating EMPLOYEE...
create table EMPLOYEE
(
  eid    NUMBER(3) not null,
  ename  VARCHAR2(15),
  eemail VARCHAR2(15) not null,
  ephone VARCHAR2(15)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EMPLOYEE
  add primary key (EID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating EMPLOYEESHOP...
create table EMPLOYEESHOP
(
  employeeid NUMBER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EMPLOYEESHOP
  add primary key (EMPLOYEEID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EMPLOYEESHOP
  add foreign key (EMPLOYEEID)
  references EMPLOYEE (EID);

prompt Creating ORDERS...
create table ORDERS
(
  oid        NUMBER(3) not null,
  orderdate  DATE not null,
  returndate DATE not null,
  eid        NUMBER(3) not null,
  did        NUMBER(3) not null,
  cid        NUMBER(3) not null,
  employeeid NUMBER
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ORDERS
  add primary key (OID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ORDERS
  add constraint FK_EMPLOYEE_SHOP foreign key (EMPLOYEEID)
  references EMPLOYEESHOP (EMPLOYEEID);
alter table ORDERS
  add foreign key (DID)
  references DRESS (DID);
alter table ORDERS
  add foreign key (CID)
  references CUSTOMER (CID);

prompt Creating LAUNDRY...
create table LAUNDRY
(
  lid         NUMBER(3) not null,
  cost        NUMBER(3) not null,
  lname       VARCHAR2(15),
  pickingdate DATE not null,
  oid         NUMBER(3) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table LAUNDRY
  add primary key (LID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table LAUNDRY
  add foreign key (OID)
  references ORDERS (OID);

prompt Creating PASSENGER...
create table PASSENGER
(
  name        VARCHAR2(15) not null,
  idpassenger INTEGER not null,
  phone       VARCHAR2(15) not null,
  idticket    INTEGER not null,
  bdate       DATE
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PASSENGER
  add primary key (IDPASSENGER)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PASSENGER
  add constraint CHEAK_PASSENGER_PHONE
  check (phone LIKE '0%');

prompt Creating PAYMENT...
create table PAYMENT
(
  pid       NUMBER(3) not null,
  price     NUMBER(3) not null,
  ispaid    NUMBER(3) not null,
  fineprice NUMBER(3) not null,
  oid       NUMBER(3) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PAYMENT
  add primary key (PID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PAYMENT
  add foreign key (OID)
  references ORDERS (OID);
alter table PAYMENT
  add check (IsPaid = 0 or IsPaid = 1);
alter table PAYMENT
  add check (IsPaid = 0 or IsPaid = 1);

prompt Creating STATION...
create table STATION
(
  name      VARCHAR2(15) not null,
  idstation INTEGER not null,
  adrress   VARCHAR2(15) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table STATION
  add primary key (IDSTATION)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating STATIONTOBUS...
create table STATIONTOBUS
(
  serial    INTEGER not null,
  idbusline INTEGER not null,
  idstation INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table STATIONTOBUS
  add primary key (IDBUSLINE, IDSTATION)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table STATIONTOBUS
  add foreign key (IDBUSLINE)
  references BUSLINE (IDBUSLINE);
alter table STATIONTOBUS
  add foreign key (IDSTATION)
  references STATION (IDSTATION);

prompt Creating TICKET...
create table TICKET
(
  cardprofile      VARCHAR2(15) not null,
  idticket         INTEGER not null,
  accumulatedvalue INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TICKET
  add primary key (IDTICKET)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating TRAVELPAYMENT...
create table TRAVELPAYMENT
(
  traveltime    DATE not null,
  travelcost    INTEGER not null,
  idticket      INTEGER not null,
  licensenumber VARCHAR2(15) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TRAVELPAYMENT
  add primary key (IDTICKET, LICENSENUMBER)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TRAVELPAYMENT
  add foreign key (IDTICKET)
  references TICKET (IDTICKET);
alter table TRAVELPAYMENT
  add foreign key (LICENSENUMBER)
  references BUS (LICENSENUMBER);

prompt Disabling triggers for BUS...
alter table BUS disable all triggers;
prompt Disabling triggers for DRIVER...
alter table DRIVER disable all triggers;
prompt Disabling triggers for BUSDRIVER...
alter table BUSDRIVER disable all triggers;
prompt Disabling triggers for BUSLINE...
alter table BUSLINE disable all triggers;
prompt Disabling triggers for BUSRIDE...
alter table BUSRIDE disable all triggers;
prompt Disabling triggers for CUSTOMER...
alter table CUSTOMER disable all triggers;
prompt Disabling triggers for DRESS...
alter table DRESS disable all triggers;
prompt Disabling triggers for EMPLOYEE...
alter table EMPLOYEE disable all triggers;
prompt Disabling triggers for EMPLOYEESHOP...
alter table EMPLOYEESHOP disable all triggers;
prompt Disabling triggers for ORDERS...
alter table ORDERS disable all triggers;
prompt Disabling triggers for LAUNDRY...
alter table LAUNDRY disable all triggers;
prompt Disabling triggers for PASSENGER...
alter table PASSENGER disable all triggers;
prompt Disabling triggers for PAYMENT...
alter table PAYMENT disable all triggers;
prompt Disabling triggers for STATION...
alter table STATION disable all triggers;
prompt Disabling triggers for STATIONTOBUS...
alter table STATIONTOBUS disable all triggers;
prompt Disabling triggers for TICKET...
alter table TICKET disable all triggers;
prompt Disabling triggers for TRAVELPAYMENT...
alter table TRAVELPAYMENT disable all triggers;
prompt Disabling foreign key constraints for BUSDRIVER...
alter table BUSDRIVER disable constraint SYS_C007921;
alter table BUSDRIVER disable constraint SYS_C007922;
prompt Disabling foreign key constraints for BUSRIDE...
alter table BUSRIDE disable constraint SYS_C007916;
alter table BUSRIDE disable constraint SYS_C007917;
prompt Disabling foreign key constraints for EMPLOYEESHOP...
alter table EMPLOYEESHOP disable constraint SYS_C008164;
prompt Disabling foreign key constraints for ORDERS...
alter table ORDERS disable constraint FK_EMPLOYEE_SHOP;
alter table ORDERS disable constraint SYS_C008147;
alter table ORDERS disable constraint SYS_C008148;
prompt Disabling foreign key constraints for LAUNDRY...
alter table LAUNDRY disable constraint SYS_C008154;
prompt Disabling foreign key constraints for PAYMENT...
alter table PAYMENT disable constraint SYS_C008161;
prompt Disabling foreign key constraints for STATIONTOBUS...
alter table STATIONTOBUS disable constraint SYS_C007910;
alter table STATIONTOBUS disable constraint SYS_C007911;
prompt Disabling foreign key constraints for TRAVELPAYMENT...
alter table TRAVELPAYMENT disable constraint SYS_C007904;
alter table TRAVELPAYMENT disable constraint SYS_C007905;
prompt Deleting TRAVELPAYMENT...
delete from TRAVELPAYMENT;
commit;
prompt Deleting TICKET...
delete from TICKET;
commit;
prompt Deleting STATIONTOBUS...
delete from STATIONTOBUS;
commit;
prompt Deleting STATION...
delete from STATION;
commit;
prompt Deleting PAYMENT...
delete from PAYMENT;
commit;
prompt Deleting PASSENGER...
delete from PASSENGER;
commit;
prompt Deleting LAUNDRY...
delete from LAUNDRY;
commit;
prompt Deleting ORDERS...
delete from ORDERS;
commit;
prompt Deleting EMPLOYEESHOP...
delete from EMPLOYEESHOP;
commit;
prompt Deleting EMPLOYEE...
delete from EMPLOYEE;
commit;
prompt Deleting DRESS...
delete from DRESS;
commit;
prompt Deleting CUSTOMER...
delete from CUSTOMER;
commit;
prompt Deleting BUSRIDE...
delete from BUSRIDE;
commit;
prompt Deleting BUSLINE...
delete from BUSLINE;
commit;
prompt Deleting BUSDRIVER...
delete from BUSDRIVER;
commit;
prompt Deleting DRIVER...
delete from DRIVER;
commit;
prompt Deleting BUS...
delete from BUS;
commit;
prompt Loading BUS...
insert into BUS (model, licensenumber, capacity)
values ('Volvo B8R', '56-789-02', 26);
insert into BUS (model, licensenumber, capacity)
values ('Volvo B8R', '67-890-13', 47);
insert into BUS (model, licensenumber, capacity)
values ('Volvo B8R', '78-901-24', 52);
insert into BUS (model, licensenumber, capacity)
values ('Volvo 8900', '89-012-35', 59);
insert into BUS (model, licensenumber, capacity)
values ('Hino Liesse', '90-123-46', 17);
insert into BUS (model, licensenumber, capacity)
values ('Neoplan ', '01-234-57', 30);
insert into BUS (model, licensenumber, capacity)
values ('Irisbus ', '12-345-69', 14);
insert into BUS (model, licensenumber, capacity)
values ('Solaris ', '23-456-70', 45);
insert into BUS (model, licensenumber, capacity)
values ('Setra S ', '34-567-81', 33);
insert into BUS (model, licensenumber, capacity)
values ('BCI Cruiser', '45-678-92', 22);
insert into BUS (model, licensenumber, capacity)
values ('Temsa ', '56-789-03', 10);
insert into BUS (model, licensenumber, capacity)
values ('Zhongtong ', '67-890-14', 39);
insert into BUS (model, licensenumber, capacity)
values ('Ayats ', '78-901-25', 55);
insert into BUS (model, licensenumber, capacity)
values ('BMC ', '89-012-36', 18);
insert into BUS (model, licensenumber, capacity)
values ('Daewoo ', '90-123-47', 12);
insert into BUS (model, licensenumber, capacity)
values ('Golden', '01-234-58', 29);
insert into BUS (model, licensenumber, capacity)
values ('JAC ', '12-345-70', 54);
insert into BUS (model, licensenumber, capacity)
values ('King Long ', '23-456-81', 20);
insert into BUS (model, licensenumber, capacity)
values ('Marcopolo ', '34-567-92', 13);
insert into BUS (model, licensenumber, capacity)
values ('Maxus V80', '45-678-03', 44);
insert into BUS (model, licensenumber, capacity)
values ('Mitsubishi ', '56-789-14', 10);
insert into BUS (model, licensenumber, capacity)
values ('Setra S 416', '67-890-25', 23);
insert into BUS (model, licensenumber, capacity)
values ('Tata Starbus', '78-901-36', 49);
insert into BUS (model, licensenumber, capacity)
values ('VDL Futura', '89-012-47', 15);
insert into BUS (model, licensenumber, capacity)
values ('Ashok ', '90-123-58', 31);
insert into BUS (model, licensenumber, capacity)
values ('BYD K7M', '01-234-69', 42);
insert into BUS (model, licensenumber, capacity)
values ('DAF SB200', '12-345-71', 10);
insert into BUS (model, licensenumber, capacity)
values ('Fiat Ducato', '23-456-82', 58);
insert into BUS (model, licensenumber, capacity)
values ('Hyundai ', '34-567-93', 27);
insert into BUS (model, licensenumber, capacity)
values ('Irisbus', '45-678-04', 51);
insert into BUS (model, licensenumber, capacity)
values ('Isuzu ', '56-789-15', 36);
insert into BUS (model, licensenumber, capacity)
values ('King Long', '67-890-26', 24);
insert into BUS (model, licensenumber, capacity)
values ('MAN ', '78-901-37', 40);
insert into BUS (model, licensenumber, capacity)
values ('Mercedes ', '89-012-48', 10);
insert into BUS (model, licensenumber, capacity)
values ('Mitsubishi ', '90-123-59', 57);
insert into BUS (model, licensenumber, capacity)
values ('Neoplan', '01-234-60', 34);
insert into BUS (model, licensenumber, capacity)
values ('Scania ', '12-345-72', 11);
insert into BUS (model, licensenumber, capacity)
values ('Tata ', '23-456-83', 48);
insert into BUS (model, licensenumber, capacity)
values ('Volvo B9R', '34-567-94', 37);
insert into BUS (model, licensenumber, capacity)
values ('BMC Levend', '45-678-05', 53);
insert into BUS (model, licensenumber, capacity)
values ('Daewoo ', '56-789-16', 10);
insert into BUS (model, licensenumber, capacity)
values ('Dennis Dart', '67-890-27', 41);
insert into BUS (model, licensenumber, capacity)
values ('Golden', '78-901-38', 32);
insert into BUS (model, licensenumber, capacity)
values ('Higer A30', '89-012-49', 10);
insert into BUS (model, licensenumber, capacity)
values ('Irizar i4', '90-123-60', 46);
insert into BUS (model, licensenumber, capacity)
values ('Iveco', '01-234-71', 60);
insert into BUS (model, licensenumber, capacity)
values ('JAC ', '12-345-73', 14);
insert into BUS (model, licensenumber, capacity)
values ('Jonckheere ', '23-456-84', 10);
insert into BUS (model, licensenumber, capacity)
values ('Kia Granbird', '34-567-95', 19);
insert into BUS (model, licensenumber, capacity)
values ('Marcopolo ', '45-678-06', 25);
insert into BUS (model, licensenumber, capacity)
values ('Maz-Annino', '56-789-17', 30);
insert into BUS (model, licensenumber, capacity)
values ('Mercedes ', '67-890-28', 10);
insert into BUS (model, licensenumber, capacity)
values ('Mitsubishi ', '78-901-39', 36);
insert into BUS (model, licensenumber, capacity)
values ('Optare Solo', '89-012-50', 49);
insert into BUS (model, licensenumber, capacity)
values ('Scania K ', '90-123-61', 53);
insert into BUS (model, licensenumber, capacity)
values ('Setra S 417', '01-234-72', 11);
insert into BUS (model, licensenumber, capacity)
values ('Skoda 14Tr', '12-345-74', 45);
insert into BUS (model, licensenumber, capacity)
values ('Tata', '23-456-85', 50);
insert into BUS (model, licensenumber, capacity)
values ('Toyota ', '34-567-96', 10);
insert into BUS (model, licensenumber, capacity)
values ('VDL Berkhof', '45-678-07', 29);
insert into BUS (model, licensenumber, capacity)
values ('Volvo 8700LE', '56-789-18', 32);
insert into BUS (model, licensenumber, capacity)
values ('Ashok ', '67-890-29', 37);
insert into BUS (model, licensenumber, capacity)
values ('BMC ', '78-901-40', 10);
insert into BUS (model, licensenumber, capacity)
values ('BYD K9', '89-012-51', 57);
insert into BUS (model, licensenumber, capacity)
values ('Daewoo ', '90-123-62', 16);
insert into BUS (model, licensenumber, capacity)
values ('Dennis Javelin', '01-234-73', 21);
insert into BUS (model, licensenumber, capacity)
values ('Ford Transit', '12-345-75', 10);
insert into BUS (model, licensenumber, capacity)
values ('Higer A80', '23-456-86', 46);
insert into BUS (model, licensenumber, capacity)
values ('Hyundai ', '34-567-97', 59);
insert into BUS (model, licensenumber, capacity)
values ('Irizar PB', '45-678-08', 10);
insert into BUS (model, licensenumber, capacity)
values ('Isuzu Gala', '56-789-19', 41);
insert into BUS (model, licensenumber, capacity)
values ('Iveco', '67-890-30', 27);
insert into BUS (model, licensenumber, capacity)
values ('JAC HK6124', '78-901-41', 31);
insert into BUS (model, licensenumber, capacity)
values ('Jonckheere ', '89-012-52', 10);
insert into BUS (model, licensenumber, capacity)
values ('Karsan Jest', '90-123-63', 54);
insert into BUS (model, licensenumber, capacity)
values ('MAN ', '01-234-74', 48);
insert into BUS (model, licensenumber, capacity)
values ('Marcopolo ', '12-345-76', 33);
insert into BUS (model, licensenumber, capacity)
values ('Maz-Annino', '23-456-87', 10);
insert into BUS (model, licensenumber, capacity)
values ('Mercedes ', '34-567-98', 14);
insert into BUS (model, licensenumber, capacity)
values ('Mitsubishi ', '45-678-09', 38);
insert into BUS (model, licensenumber, capacity)
values ('Neoplan ', '56-789-20', 44);
insert into BUS (model, licensenumber, capacity)
values ('Optare', '67-890-31', 56);
insert into BUS (model, licensenumber, capacity)
values ('Scania ', '78-901-42', 10);
insert into BUS (model, licensenumber, capacity)
values ('Setra ', '89-012-53', 12);
insert into BUS (model, licensenumber, capacity)
values ('Skoda ', '90-123-64', 22);
insert into BUS (model, licensenumber, capacity)
values ('Tata ', '01-234-75', 52);
insert into BUS (model, licensenumber, capacity)
values ('Toyota ', '12-345-77', 35);
insert into BUS (model, licensenumber, capacity)
values ('VDL ', '23-456-88', 10);
insert into BUS (model, licensenumber, capacity)
values ('Volvo', '34-567-99', 47);
insert into BUS (model, licensenumber, capacity)
values ('Ashok', '45-678-10', 23);
insert into BUS (model, licensenumber, capacity)
values ('BMC ', '56-789-21', 20);
insert into BUS (model, licensenumber, capacity)
values ('BYD K9A', '67-890-32', 58);
insert into BUS (model, licensenumber, capacity)
values ('Daewoo ', '78-901-43', 39);
insert into BUS (model, licensenumber, capacity)
values ('Dennis ', '89-012-54', 54);
insert into BUS (model, licensenumber, capacity)
values ('Ford ', '90-123-65', 10);
insert into BUS (model, licensenumber, capacity)
values ('Higer ', '01-234-76', 28);
insert into BUS (model, licensenumber, capacity)
values ('Hyundai ', '12-345-78', 42);
insert into BUS (model, licensenumber, capacity)
values ('Irizar', '23-456-89', 10);
insert into BUS (model, licensenumber, capacity)
values ('Isuzu ', '34-567-00', 15);
insert into BUS (model, licensenumber, capacity)
values ('Iveco ', '45-678-11', 11);
commit;
prompt 100 records committed...
insert into BUS (model, licensenumber, capacity)
values ('JAC ', '56-789-22', 13);
insert into BUS (model, licensenumber, capacity)
values ('Jonckheere ', '67-890-33', 51);
insert into BUS (model, licensenumber, capacity)
values ('King Long', '78-901-44', 10);
insert into BUS (model, licensenumber, capacity)
values ('MAN', '89-012-55', 30);
insert into BUS (model, licensenumber, capacity)
values ('Marcopolo ', '90-123-66', 40);
insert into BUS (model, licensenumber, capacity)
values ('Maz', '01-234-77', 55);
insert into BUS (model, licensenumber, capacity)
values ('Mercedes ', '12-345-79', 10);
insert into BUS (model, licensenumber, capacity)
values ('Mitsubishi ', '23-456-90', 34);
insert into BUS (model, licensenumber, capacity)
values ('Neoplan ', '34-567-01', 17);
insert into BUS (model, licensenumber, capacity)
values ('Optare ', '45-678-12', 19);
insert into BUS (model, licensenumber, capacity)
values ('Scania ', '56-789-23', 50);
insert into BUS (model, licensenumber, capacity)
values ('Setra S ', '67-890-34', 10);
insert into BUS (model, licensenumber, capacity)
values ('Skoda ', '78-901-45', 29);
insert into BUS (model, licensenumber, capacity)
values ('Tata LP ', '89-012-56', 43);
insert into BUS (model, licensenumber, capacity)
values ('Toyota ', '90-123-67', 31);
insert into BUS (model, licensenumber, capacity)
values ('VDL ', '01-234-78', 36);
insert into BUS (model, licensenumber, capacity)
values ('Volvo', '12-345-80', 10);
insert into BUS (model, licensenumber, capacity)
values ('Ashok ', '23-456-91', 26);
insert into BUS (model, licensenumber, capacity)
values ('BMC ', '34-567-02', 52);
insert into BUS (model, licensenumber, capacity)
values ('BYD K9S', '45-678-13', 47);
insert into BUS (model, licensenumber, capacity)
values ('Daewoo ', '56-789-24', 41);
insert into BUS (model, licensenumber, capacity)
values ('Dennis ', '67-890-35', 10);
insert into BUS (model, licensenumber, capacity)
values ('Ford ', '78-901-46', 45);
insert into BUS (model, licensenumber, capacity)
values ('Higer ', '89-012-57', 58);
insert into BUS (model, licensenumber, capacity)
values ('Hyundai ', '90-123-68', 55);
insert into BUS (model, licensenumber, capacity)
values ('Irizar ', '01-234-79', 24);
insert into BUS (model, licensenumber, capacity)
values ('Isuzu ', '12-345-81', 10);
insert into BUS (model, licensenumber, capacity)
values ('Iveco ', '23-456-92', 57);
insert into BUS (model, licensenumber, capacity)
values ('JAC ', '34-567-03', 37);
insert into BUS (model, licensenumber, capacity)
values ('Jonckheere ', '45-678-14', 48);
insert into BUS (model, licensenumber, capacity)
values ('King Long ', '56-789-25', 20);
insert into BUS (model, licensenumber, capacity)
values ('MAN A93 ', '67-890-36', 10);
insert into BUS (model, licensenumber, capacity)
values ('Marcopolo ', '78-901-47', 38);
insert into BUS (model, licensenumber, capacity)
values ('Maz', '89-012-58', 14);
insert into BUS (model, licensenumber, capacity)
values ('Mercedes ', '90-123-69', 32);
insert into BUS (model, licensenumber, capacity)
values ('Mitsubishi', '01-234-80', 18);
insert into BUS (model, licensenumber, capacity)
values ('Neoplan ', '12-345-82', 10);
insert into BUS (model, licensenumber, capacity)
values ('Optare ', '23-456-93', 49);
insert into BUS (model, licensenumber, capacity)
values ('Scania ', '34-567-04', 56);
insert into BUS (model, licensenumber, capacity)
values ('Setra ', '45-678-15', 59);
insert into BUS (model, licensenumber, capacity)
values ('Skoda ', '56-789-26', 34);
insert into BUS (model, licensenumber, capacity)
values ('Tata ', '67-890-37', 10);
insert into BUS (model, licensenumber, capacity)
values ('Toyota', '78-901-48', 23);
insert into BUS (model, licensenumber, capacity)
values ('VDL ', '89-012-59', 12);
insert into BUS (model, licensenumber, capacity)
values ('Volvo ', '90-123-70', 21);
insert into BUS (model, licensenumber, capacity)
values ('Ashok ', '01-234-81', 26);
insert into BUS (model, licensenumber, capacity)
values ('BMC ', '12-345-83', 10);
insert into BUS (model, licensenumber, capacity)
values ('BYD ', '23-456-94', 50);
insert into BUS (model, licensenumber, capacity)
values ('Daewoo', '34-567-05', 53);
insert into BUS (model, licensenumber, capacity)
values ('Dennis ', '45-678-16', 15);
insert into BUS (model, licensenumber, capacity)
values ('Ford ', '56-789-27', 39);
insert into BUS (model, licensenumber, capacity)
values ('Higer', '67-890-38', 10);
insert into BUS (model, licensenumber, capacity)
values ('Hyundai ', '78-901-49', 51);
insert into BUS (model, licensenumber, capacity)
values ('Irizar', '89-012-60', 60);
insert into BUS (model, licensenumber, capacity)
values ('Isuzu ', '90-123-71', 42);
insert into BUS (model, licensenumber, capacity)
values ('Iveco Bus ', '01-234-82', 28);
insert into BUS (model, licensenumber, capacity)
values ('JAC HK61', '12-345-84', 10);
insert into BUS (model, licensenumber, capacity)
values ('Jonckheere ', '23-456-95', 44);
insert into BUS (model, licensenumber, capacity)
values ('King Long ', '34-567-06', 31);
insert into BUS (model, licensenumber, capacity)
values ('MAN A95 ', '45-678-17', 52);
insert into BUS (model, licensenumber, capacity)
values ('Marcopolo', '56-789-28', 29);
insert into BUS (model, licensenumber, capacity)
values ('volvo 7700', '12-584-78', 25);
insert into BUS (model, licensenumber, capacity)
values ('Volvo B8R', '12-345-67', 16);
insert into BUS (model, licensenumber, capacity)
values ('Volvo B8R', '23-456-78', 28);
insert into BUS (model, licensenumber, capacity)
values ('Volvo B8R', '34-567-89', 43);
insert into BUS (model, licensenumber, capacity)
values ('Saba Band', '45-678-90', 21);
insert into BUS (model, licensenumber, capacity)
values ('Iveco Daily', '56-789-01', 35);
insert into BUS (model, licensenumber, capacity)
values ('Higer KLQ', '67-890-12', 50);
insert into BUS (model, licensenumber, capacity)
values ('Volvo B8R', '78-901-23', 25);
insert into BUS (model, licensenumber, capacity)
values ('Volvo B8R', '89-012-34', 14);
insert into BUS (model, licensenumber, capacity)
values ('Yutong E12', '90-123-45', 10);
insert into BUS (model, licensenumber, capacity)
values ('Eletra E2', '01-234-56', 11);
insert into BUS (model, licensenumber, capacity)
values ('DAF XF', '12-345-68', 38);
insert into BUS (model, licensenumber, capacity)
values ('Volvo B8R', '23-456-79', 12);
insert into BUS (model, licensenumber, capacity)
values ('Volvo B8R', '34-567-80', 19);
insert into BUS (model, licensenumber, capacity)
values ('Volvo 7900', '45-678-91', 56);
commit;
prompt 176 records loaded
prompt Loading DRIVER...
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (500, 2, '12-345-67', 1, 79, 182, 5325);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (507, 9, '89-012-34', 8, 32, 182, 4651);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (515, 17, '67-890-13', 16, 45, 182, 5018);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (523, 25, '45-678-92', 24, 78, 182, 4097);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (531, 33, '23-456-81', 32, 172, 182, 10418);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (612, 12, '34-567-00', 113, 188, 182, 4911);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (582, 16, '34-567-97', 83, 156, 182, 9354);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (657, 23, '89-012-59', 158, 68, 182, 4131);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (521, 23, '23-456-70', 22, 148, 182, 4658);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (666, 32, '78-901-49', 167, 73, 182, 5163);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (627, 27, '89-012-56', 128, 109, 182, 5156);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (636, 2, '78-901-46', 137, 193, 182, 5841);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (644, 10, '56-789-25', 145, 120, 182, 4914);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (652, 18, '34-567-04', 153, 110, 182, 5468);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (660, 26, '12-345-83', 161, 42, 182, 5253);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (668, 34, '90-123-71', 169, 103, 182, 4333);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (676, 8, '78-901-50', 177, 123, 182, 5482);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (684, 16, '56-789-29', 185, 33, 182, 4582);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (692, 24, '34-567-08', 193, 176, 182, 9551);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (506, 8, '78-901-23', 7, 40, 182, 4486);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (508, 10, '90-123-45', 9, 94, 182, 4077);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (509, 11, '01-234-56', 10, 62, 182, 4815);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (510, 12, '12-345-68', 11, 81, 182, 4968);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (511, 13, '23-456-79', 12, 48, 182, 4895);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (512, 14, '34-567-80', 13, 41, 182, 4672);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (513, 15, '45-678-91', 14, 122, 182, 4364);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (514, 16, '56-789-02', 15, 119, 182, 4507);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (516, 18, '78-901-24', 17, 57, 182, 5729);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (517, 19, '89-012-35', 18, 115, 182, 5138);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (518, 20, '90-123-46', 19, 138, 182, 5695);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (519, 21, '01-234-57', 20, 40, 182, 4181);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (520, 22, '12-345-69', 21, 99, 182, 5414);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (522, 24, '34-567-81', 23, 185, 182, 4668);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (524, 26, '56-789-03', 25, 129, 182, 5202);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (525, 27, '67-890-14', 26, 116, 182, 5530);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (526, 28, '78-901-25', 27, 130, 182, 4373);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (527, 29, '89-012-36', 28, 81, 182, 5356);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (528, 30, '90-123-47', 29, 164, 182, 11463);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (529, 31, '01-234-58', 30, 91, 182, 4266);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (530, 32, '12-345-70', 31, 182, 182, 9926);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (532, 34, '34-567-92', 33, 176, 182, 9165);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (534, 2, '56-789-14', 35, 84, 182, 5826);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (535, 3, '67-890-25', 36, 106, 182, 4454);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (536, 4, '78-901-36', 37, 140, 182, 5750);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (537, 5, '89-012-47', 38, 63, 182, 4540);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (538, 6, '90-123-58', 39, 150, 182, 9659);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (539, 7, '01-234-69', 40, 59, 182, 5743);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (540, 8, '12-345-71', 41, 79, 182, 4825);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (541, 9, '23-456-82', 42, 179, 182, 11407);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (542, 10, '34-567-93', 43, 55, 182, 5648);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (543, 11, '45-678-04', 44, 112, 182, 4180);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (544, 12, '56-789-15', 45, 76, 182, 4231);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (545, 13, '67-890-26', 46, 58, 182, 5455);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (546, 14, '78-901-37', 47, 177, 182, 10252);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (547, 15, '89-012-48', 48, 77, 182, 4438);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (548, 16, '90-123-59', 49, 157, 182, 9854);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (549, 17, '01-234-60', 50, 82, 182, 4508);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (550, 18, '12-345-72', 51, 84, 182, 5109);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (551, 19, '23-456-83', 52, 55, 182, 5958);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (552, 20, '34-567-94', 53, 154, 182, 11073);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (553, 21, '45-678-05', 54, 161, 182, 8303);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (554, 22, '56-789-16', 55, 177, 182, 10314);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (555, 23, '67-890-27', 56, 157, 182, 9924);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (556, 24, '78-901-38', 57, 105, 182, 5638);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (557, 25, '89-012-49', 58, 164, 182, 10825);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (558, 26, '90-123-60', 59, 69, 182, 5850);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (559, 27, '01-234-71', 60, 120, 182, 5660);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (560, 28, '12-345-73', 61, 40, 182, 5025);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (561, 29, '23-456-84', 62, 180, 182, 10879);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (562, 30, '34-567-95', 63, 199, 182, 5727);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (563, 31, '45-678-06', 64, 198, 182, 5290);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (564, 32, '56-789-17', 65, 193, 182, 5372);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (565, 33, '67-890-28', 66, 175, 182, 11102);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (566, 34, '78-901-39', 67, 145, 182, 4085);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (567, 35, '89-012-50', 68, 78, 182, 5034);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (568, 2, '90-123-61', 69, 177, 182, 10456);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (569, 3, '01-234-72', 70, 53, 182, 4695);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (570, 4, '12-345-74', 71, 114, 182, 5181);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (571, 5, '23-456-85', 72, 176, 182, 10009);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (572, 6, '34-567-96', 73, 156, 182, 9683);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (573, 7, '45-678-07', 74, 149, 182, 5479);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (574, 8, '56-789-18', 75, 114, 182, 5532);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (575, 9, '67-890-29', 76, 125, 182, 5079);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (576, 10, '78-901-40', 77, 88, 182, 5135);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (577, 11, '89-012-51', 78, 37, 182, 5427);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (578, 12, '90-123-62', 79, 127, 182, 4969);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (579, 13, '01-234-73', 80, 186, 182, 4364);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (580, 14, '12-345-75', 81, 184, 182, 4890);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (581, 15, '23-456-86', 82, 54, 182, 4785);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (583, 17, '45-678-08', 84, 97, 182, 4427);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (584, 18, '56-789-19', 85, 178, 182, 12120);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (585, 19, '67-890-30', 86, 70, 182, 5634);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (586, 20, '78-901-41', 87, 139, 182, 5908);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (587, 21, '89-012-52', 88, 79, 182, 5202);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (588, 22, '90-123-63', 89, 125, 182, 5796);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (589, 23, '01-234-74', 90, 124, 182, 5030);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (590, 24, '12-345-76', 91, 196, 182, 5676);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (591, 25, '23-456-87', 92, 150, 182, 8018);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (592, 26, '34-567-98', 93, 42, 182, 4775);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (593, 27, '45-678-09', 94, 149, 182, 5323);
commit;
prompt 100 records committed...
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (594, 28, '56-789-20', 95, 57, 182, 4684);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (595, 29, '67-890-31', 96, 71, 182, 5033);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (596, 30, '78-901-42', 97, 153, 182, 8181);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (597, 31, '89-012-53', 98, 170, 182, 10341);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (598, 32, '90-123-64', 99, 161, 182, 11172);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (599, 33, '01-234-75', 100, 52, 182, 5214);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (600, 34, '12-345-77', 101, 81, 182, 5389);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (601, 35, '23-456-88', 102, 91, 182, 4150);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (602, 2, '34-567-99', 103, 52, 182, 4238);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (604, 4, '56-789-21', 105, 31, 182, 5375);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (605, 5, '67-890-32', 106, 168, 182, 7847);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (606, 6, '78-901-43', 107, 151, 182, 11669);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (607, 7, '89-012-54', 108, 42, 182, 4642);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (608, 8, '90-123-65', 109, 168, 182, 9818);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (609, 9, '01-234-76', 110, 104, 182, 4817);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (610, 10, '12-345-78', 111, 142, 182, 5687);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (613, 13, '45-678-11', 114, 196, 182, 4056);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (614, 14, '56-789-22', 115, 187, 182, 5457);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (615, 15, '67-890-33', 116, 188, 182, 4528);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (616, 16, '78-901-44', 117, 49, 182, 4340);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (617, 17, '89-012-55', 118, 138, 182, 4278);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (618, 18, '90-123-66', 119, 76, 182, 5637);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (620, 20, '12-345-79', 121, 98, 182, 4659);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (621, 21, '23-456-90', 122, 140, 182, 4691);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (622, 22, '34-567-01', 123, 199, 182, 4929);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (623, 23, '45-678-12', 124, 189, 182, 5086);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (624, 24, '56-789-23', 125, 172, 182, 8927);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (625, 25, '67-890-34', 126, 142, 182, 5151);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (626, 26, '78-901-45', 127, 46, 182, 4199);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (628, 28, '90-123-67', 129, 119, 182, 5809);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (629, 29, '01-234-78', 130, 74, 182, 4481);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (630, 30, '12-345-80', 131, 148, 182, 5378);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (631, 31, '23-456-91', 132, 140, 182, 4215);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (632, 32, '34-567-02', 133, 98, 182, 5134);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (633, 33, '45-678-13', 134, 149, 182, 4069);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (634, 34, '56-789-24', 135, 98, 182, 5213);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (635, 35, '67-890-35', 136, 185, 182, 4746);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (637, 3, '89-012-57', 138, 107, 182, 4467);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (638, 4, '90-123-68', 139, 110, 182, 5285);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (639, 5, '01-234-79', 140, 146, 182, 5665);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (640, 6, '12-345-81', 141, 144, 182, 4344);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (641, 7, '23-456-92', 142, 81, 182, 4390);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (642, 8, '34-567-03', 143, 137, 182, 4877);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (643, 9, '45-678-14', 144, 112, 182, 5427);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (645, 11, '67-890-36', 146, 183, 182, 5464);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (646, 12, '78-901-47', 147, 137, 182, 4794);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (647, 13, '89-012-58', 148, 61, 182, 5320);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (648, 14, '90-123-69', 149, 86, 182, 5964);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (649, 15, '01-234-80', 150, 104, 182, 4660);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (650, 16, '12-345-82', 151, 158, 182, 8426);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (651, 17, '23-456-93', 152, 51, 182, 5370);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (653, 19, '45-678-15', 154, 159, 182, 11601);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (654, 20, '56-789-26', 155, 41, 182, 5751);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (655, 21, '67-890-37', 156, 53, 182, 5435);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (656, 22, '78-901-48', 157, 32, 182, 4014);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (658, 24, '90-123-70', 159, 192, 182, 5613);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (659, 25, '01-234-81', 160, 120, 182, 4120);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (661, 27, '23-456-94', 162, 98, 182, 4600);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (662, 28, '34-567-05', 163, 153, 182, 8287);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (663, 29, '45-678-16', 164, 66, 182, 5933);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (664, 30, '56-789-27', 165, 53, 182, 5023);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (665, 31, '67-890-38', 166, 40, 182, 5869);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (667, 33, '89-012-60', 168, 180, 182, 12574);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (669, 35, '01-234-82', 170, 97, 182, 4452);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (670, 2, '12-345-84', 171, 134, 182, 4509);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (671, 3, '23-456-95', 172, 163, 182, 7983);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (672, 4, '34-567-06', 173, 190, 182, 5200);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (673, 5, '45-678-17', 174, 184, 182, 5388);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (674, 6, '56-789-28', 175, 199, 182, 5504);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (675, 7, '67-890-39', 176, 189, 182, 4102);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (677, 9, '89-012-61', 178, 136, 182, 5351);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (678, 10, '90-123-72', 179, 50, 182, 4400);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (679, 11, '01-234-83', 180, 58, 182, 5848);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (680, 12, '12-345-85', 181, 45, 182, 5405);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (681, 13, '23-456-96', 182, 174, 182, 11693);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (682, 14, '34-567-07', 183, 130, 182, 5742);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (683, 15, '45-678-18', 184, 199, 182, 4430);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (685, 17, '67-890-40', 186, 159, 182, 11655);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (686, 18, '78-901-51', 187, 163, 182, 9067);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (687, 19, '89-012-62', 188, 101, 182, 5589);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (688, 20, '90-123-73', 189, 188, 182, 5410);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (689, 21, '01-234-84', 190, 89, 182, 5773);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (690, 22, '12-345-86', 191, 105, 182, 5105);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (691, 23, '23-456-97', 192, 34, 182, 5950);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (693, 25, '45-678-19', 194, 62, 182, 5244);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (694, 26, '56-789-30', 195, 183, 182, 4494);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (695, 27, '67-890-41', 196, 167, 182, 9727);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (696, 28, '78-901-52', 197, 91, 182, 4334);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (697, 29, '89-012-63', 198, 181, 182, 13046);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (698, 30, '90-123-74', 199, 92, 182, 4321);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (699, 31, '01-234-85', 200, 193, 182, 5146);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (501, 3, '23-456-78', 2, 70, 182, 5769);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (502, 4, '34-567-89', 3, 195, 182, 4337);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (503, 5, '45-678-90', 4, 76, 182, 4813);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (504, 6, '56-789-01', 5, 87, 182, 4117);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (505, 7, '67-890-12', 6, 157, 182, 9458);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (533, 35, '45-678-03', 34, 45, 182, 4786);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (603, 3, '45-678-10', 104, 113, 182, 4243);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (611, 11, '23-456-89', 112, 88, 182, 4416);
insert into DRIVER (idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values (619, 19, '01-234-77', 120, 117, 182, 4345);
commit;
prompt 200 records loaded
prompt Loading BUSDRIVER...
insert into BUSDRIVER (idriver, licensenumber)
values (500, '12-345-67');
insert into BUSDRIVER (idriver, licensenumber)
values (501, '23-456-78');
insert into BUSDRIVER (idriver, licensenumber)
values (502, '34-567-89');
insert into BUSDRIVER (idriver, licensenumber)
values (503, '45-678-90');
insert into BUSDRIVER (idriver, licensenumber)
values (504, '56-789-01');
insert into BUSDRIVER (idriver, licensenumber)
values (505, '67-890-12');
insert into BUSDRIVER (idriver, licensenumber)
values (506, '78-901-23');
insert into BUSDRIVER (idriver, licensenumber)
values (507, '89-012-34');
insert into BUSDRIVER (idriver, licensenumber)
values (508, '90-123-45');
insert into BUSDRIVER (idriver, licensenumber)
values (509, '01-234-56');
insert into BUSDRIVER (idriver, licensenumber)
values (510, '12-345-68');
insert into BUSDRIVER (idriver, licensenumber)
values (511, '23-456-79');
insert into BUSDRIVER (idriver, licensenumber)
values (512, '34-567-80');
insert into BUSDRIVER (idriver, licensenumber)
values (513, '45-678-91');
insert into BUSDRIVER (idriver, licensenumber)
values (514, '56-789-02');
insert into BUSDRIVER (idriver, licensenumber)
values (515, '67-890-13');
insert into BUSDRIVER (idriver, licensenumber)
values (516, '78-901-24');
insert into BUSDRIVER (idriver, licensenumber)
values (517, '89-012-35');
insert into BUSDRIVER (idriver, licensenumber)
values (518, '90-123-46');
insert into BUSDRIVER (idriver, licensenumber)
values (519, '01-234-57');
insert into BUSDRIVER (idriver, licensenumber)
values (520, '12-345-69');
insert into BUSDRIVER (idriver, licensenumber)
values (521, '23-456-70');
insert into BUSDRIVER (idriver, licensenumber)
values (522, '34-567-81');
insert into BUSDRIVER (idriver, licensenumber)
values (523, '45-678-92');
insert into BUSDRIVER (idriver, licensenumber)
values (524, '56-789-03');
insert into BUSDRIVER (idriver, licensenumber)
values (525, '67-890-14');
insert into BUSDRIVER (idriver, licensenumber)
values (526, '78-901-25');
insert into BUSDRIVER (idriver, licensenumber)
values (527, '89-012-36');
insert into BUSDRIVER (idriver, licensenumber)
values (528, '90-123-47');
insert into BUSDRIVER (idriver, licensenumber)
values (529, '01-234-58');
insert into BUSDRIVER (idriver, licensenumber)
values (530, '12-345-70');
insert into BUSDRIVER (idriver, licensenumber)
values (531, '23-456-81');
insert into BUSDRIVER (idriver, licensenumber)
values (532, '34-567-92');
insert into BUSDRIVER (idriver, licensenumber)
values (533, '45-678-03');
insert into BUSDRIVER (idriver, licensenumber)
values (534, '56-789-14');
insert into BUSDRIVER (idriver, licensenumber)
values (535, '67-890-25');
insert into BUSDRIVER (idriver, licensenumber)
values (536, '78-901-36');
insert into BUSDRIVER (idriver, licensenumber)
values (537, '89-012-47');
insert into BUSDRIVER (idriver, licensenumber)
values (538, '90-123-58');
insert into BUSDRIVER (idriver, licensenumber)
values (539, '01-234-69');
insert into BUSDRIVER (idriver, licensenumber)
values (540, '12-345-71');
insert into BUSDRIVER (idriver, licensenumber)
values (541, '23-456-82');
insert into BUSDRIVER (idriver, licensenumber)
values (542, '34-567-93');
insert into BUSDRIVER (idriver, licensenumber)
values (543, '45-678-04');
insert into BUSDRIVER (idriver, licensenumber)
values (543, '90-123-59');
insert into BUSDRIVER (idriver, licensenumber)
values (544, '56-789-15');
insert into BUSDRIVER (idriver, licensenumber)
values (545, '67-890-26');
insert into BUSDRIVER (idriver, licensenumber)
values (546, '78-901-37');
insert into BUSDRIVER (idriver, licensenumber)
values (547, '89-012-48');
insert into BUSDRIVER (idriver, licensenumber)
values (548, '90-123-59');
insert into BUSDRIVER (idriver, licensenumber)
values (549, '01-234-60');
insert into BUSDRIVER (idriver, licensenumber)
values (550, '12-345-72');
insert into BUSDRIVER (idriver, licensenumber)
values (551, '23-456-83');
insert into BUSDRIVER (idriver, licensenumber)
values (552, '34-567-94');
insert into BUSDRIVER (idriver, licensenumber)
values (553, '45-678-05');
insert into BUSDRIVER (idriver, licensenumber)
values (554, '56-789-16');
insert into BUSDRIVER (idriver, licensenumber)
values (555, '67-890-27');
insert into BUSDRIVER (idriver, licensenumber)
values (556, '78-901-38');
insert into BUSDRIVER (idriver, licensenumber)
values (557, '89-012-49');
insert into BUSDRIVER (idriver, licensenumber)
values (558, '90-123-60');
insert into BUSDRIVER (idriver, licensenumber)
values (559, '01-234-71');
insert into BUSDRIVER (idriver, licensenumber)
values (560, '12-345-73');
insert into BUSDRIVER (idriver, licensenumber)
values (561, '23-456-84');
insert into BUSDRIVER (idriver, licensenumber)
values (562, '34-567-95');
insert into BUSDRIVER (idriver, licensenumber)
values (563, '45-678-06');
insert into BUSDRIVER (idriver, licensenumber)
values (564, '56-789-17');
insert into BUSDRIVER (idriver, licensenumber)
values (565, '67-890-28');
insert into BUSDRIVER (idriver, licensenumber)
values (566, '78-901-39');
insert into BUSDRIVER (idriver, licensenumber)
values (567, '89-012-50');
insert into BUSDRIVER (idriver, licensenumber)
values (568, '90-123-61');
insert into BUSDRIVER (idriver, licensenumber)
values (569, '01-234-72');
insert into BUSDRIVER (idriver, licensenumber)
values (570, '12-345-74');
insert into BUSDRIVER (idriver, licensenumber)
values (571, '23-456-85');
insert into BUSDRIVER (idriver, licensenumber)
values (572, '34-567-96');
insert into BUSDRIVER (idriver, licensenumber)
values (573, '45-678-07');
insert into BUSDRIVER (idriver, licensenumber)
values (574, '56-789-18');
insert into BUSDRIVER (idriver, licensenumber)
values (575, '67-890-29');
insert into BUSDRIVER (idriver, licensenumber)
values (576, '78-901-40');
insert into BUSDRIVER (idriver, licensenumber)
values (577, '89-012-51');
insert into BUSDRIVER (idriver, licensenumber)
values (578, '90-123-62');
insert into BUSDRIVER (idriver, licensenumber)
values (579, '01-234-73');
insert into BUSDRIVER (idriver, licensenumber)
values (580, '12-345-75');
insert into BUSDRIVER (idriver, licensenumber)
values (581, '23-456-86');
insert into BUSDRIVER (idriver, licensenumber)
values (582, '34-567-97');
insert into BUSDRIVER (idriver, licensenumber)
values (583, '45-678-08');
insert into BUSDRIVER (idriver, licensenumber)
values (584, '56-789-19');
insert into BUSDRIVER (idriver, licensenumber)
values (585, '67-890-30');
insert into BUSDRIVER (idriver, licensenumber)
values (586, '78-901-41');
insert into BUSDRIVER (idriver, licensenumber)
values (587, '89-012-52');
insert into BUSDRIVER (idriver, licensenumber)
values (588, '90-123-63');
insert into BUSDRIVER (idriver, licensenumber)
values (589, '01-234-74');
insert into BUSDRIVER (idriver, licensenumber)
values (590, '12-345-76');
insert into BUSDRIVER (idriver, licensenumber)
values (591, '23-456-87');
insert into BUSDRIVER (idriver, licensenumber)
values (592, '34-567-98');
insert into BUSDRIVER (idriver, licensenumber)
values (593, '45-678-09');
insert into BUSDRIVER (idriver, licensenumber)
values (594, '56-789-20');
insert into BUSDRIVER (idriver, licensenumber)
values (595, '67-890-31');
insert into BUSDRIVER (idriver, licensenumber)
values (596, '78-901-42');
insert into BUSDRIVER (idriver, licensenumber)
values (597, '89-012-53');
insert into BUSDRIVER (idriver, licensenumber)
values (598, '90-123-64');
commit;
prompt 100 records committed...
insert into BUSDRIVER (idriver, licensenumber)
values (599, '01-234-75');
insert into BUSDRIVER (idriver, licensenumber)
values (600, '12-345-77');
insert into BUSDRIVER (idriver, licensenumber)
values (601, '23-456-88');
insert into BUSDRIVER (idriver, licensenumber)
values (602, '34-567-99');
insert into BUSDRIVER (idriver, licensenumber)
values (603, '45-678-10');
insert into BUSDRIVER (idriver, licensenumber)
values (604, '56-789-21');
insert into BUSDRIVER (idriver, licensenumber)
values (605, '67-890-32');
insert into BUSDRIVER (idriver, licensenumber)
values (606, '78-901-43');
insert into BUSDRIVER (idriver, licensenumber)
values (607, '89-012-54');
insert into BUSDRIVER (idriver, licensenumber)
values (608, '90-123-65');
insert into BUSDRIVER (idriver, licensenumber)
values (609, '01-234-76');
insert into BUSDRIVER (idriver, licensenumber)
values (610, '12-345-78');
insert into BUSDRIVER (idriver, licensenumber)
values (610, '23-456-82');
insert into BUSDRIVER (idriver, licensenumber)
values (611, '23-456-89');
insert into BUSDRIVER (idriver, licensenumber)
values (612, '34-567-00');
insert into BUSDRIVER (idriver, licensenumber)
values (613, '45-678-11');
insert into BUSDRIVER (idriver, licensenumber)
values (614, '56-789-22');
insert into BUSDRIVER (idriver, licensenumber)
values (615, '67-890-33');
insert into BUSDRIVER (idriver, licensenumber)
values (616, '78-901-44');
insert into BUSDRIVER (idriver, licensenumber)
values (617, '89-012-55');
insert into BUSDRIVER (idriver, licensenumber)
values (618, '90-123-66');
insert into BUSDRIVER (idriver, licensenumber)
values (619, '01-234-77');
insert into BUSDRIVER (idriver, licensenumber)
values (620, '12-345-79');
insert into BUSDRIVER (idriver, licensenumber)
values (621, '23-456-90');
insert into BUSDRIVER (idriver, licensenumber)
values (622, '34-567-01');
insert into BUSDRIVER (idriver, licensenumber)
values (622, '67-890-29');
insert into BUSDRIVER (idriver, licensenumber)
values (623, '45-678-12');
insert into BUSDRIVER (idriver, licensenumber)
values (624, '56-789-23');
insert into BUSDRIVER (idriver, licensenumber)
values (625, '67-890-34');
insert into BUSDRIVER (idriver, licensenumber)
values (626, '78-901-45');
insert into BUSDRIVER (idriver, licensenumber)
values (627, '89-012-56');
insert into BUSDRIVER (idriver, licensenumber)
values (628, '90-123-67');
insert into BUSDRIVER (idriver, licensenumber)
values (629, '01-234-78');
insert into BUSDRIVER (idriver, licensenumber)
values (630, '12-345-80');
insert into BUSDRIVER (idriver, licensenumber)
values (631, '23-456-91');
insert into BUSDRIVER (idriver, licensenumber)
values (632, '34-567-02');
insert into BUSDRIVER (idriver, licensenumber)
values (633, '45-678-13');
insert into BUSDRIVER (idriver, licensenumber)
values (634, '56-789-24');
insert into BUSDRIVER (idriver, licensenumber)
values (635, '67-890-35');
insert into BUSDRIVER (idriver, licensenumber)
values (636, '78-901-46');
insert into BUSDRIVER (idriver, licensenumber)
values (637, '89-012-57');
insert into BUSDRIVER (idriver, licensenumber)
values (638, '90-123-68');
insert into BUSDRIVER (idriver, licensenumber)
values (639, '01-234-79');
insert into BUSDRIVER (idriver, licensenumber)
values (640, '12-345-81');
insert into BUSDRIVER (idriver, licensenumber)
values (641, '23-456-92');
insert into BUSDRIVER (idriver, licensenumber)
values (642, '34-567-03');
insert into BUSDRIVER (idriver, licensenumber)
values (643, '45-678-14');
insert into BUSDRIVER (idriver, licensenumber)
values (644, '56-789-25');
insert into BUSDRIVER (idriver, licensenumber)
values (645, '67-890-36');
insert into BUSDRIVER (idriver, licensenumber)
values (645, '78-901-40');
insert into BUSDRIVER (idriver, licensenumber)
values (646, '78-901-47');
insert into BUSDRIVER (idriver, licensenumber)
values (647, '89-012-58');
insert into BUSDRIVER (idriver, licensenumber)
values (648, '90-123-69');
insert into BUSDRIVER (idriver, licensenumber)
values (649, '01-234-80');
insert into BUSDRIVER (idriver, licensenumber)
values (650, '12-345-82');
insert into BUSDRIVER (idriver, licensenumber)
values (651, '23-456-93');
insert into BUSDRIVER (idriver, licensenumber)
values (652, '34-567-04');
insert into BUSDRIVER (idriver, licensenumber)
values (653, '45-678-15');
insert into BUSDRIVER (idriver, licensenumber)
values (654, '56-789-26');
insert into BUSDRIVER (idriver, licensenumber)
values (655, '67-890-37');
insert into BUSDRIVER (idriver, licensenumber)
values (656, '78-901-48');
insert into BUSDRIVER (idriver, licensenumber)
values (657, '89-012-59');
insert into BUSDRIVER (idriver, licensenumber)
values (658, '90-123-70');
insert into BUSDRIVER (idriver, licensenumber)
values (659, '01-234-81');
insert into BUSDRIVER (idriver, licensenumber)
values (660, '12-345-83');
insert into BUSDRIVER (idriver, licensenumber)
values (661, '23-456-94');
insert into BUSDRIVER (idriver, licensenumber)
values (662, '34-567-05');
insert into BUSDRIVER (idriver, licensenumber)
values (663, '45-678-16');
insert into BUSDRIVER (idriver, licensenumber)
values (664, '56-789-27');
insert into BUSDRIVER (idriver, licensenumber)
values (665, '67-890-38');
insert into BUSDRIVER (idriver, licensenumber)
values (666, '78-901-49');
insert into BUSDRIVER (idriver, licensenumber)
values (667, '89-012-60');
insert into BUSDRIVER (idriver, licensenumber)
values (668, '90-123-71');
insert into BUSDRIVER (idriver, licensenumber)
values (669, '01-234-82');
insert into BUSDRIVER (idriver, licensenumber)
values (670, '12-345-84');
insert into BUSDRIVER (idriver, licensenumber)
values (671, '23-456-95');
insert into BUSDRIVER (idriver, licensenumber)
values (672, '34-567-06');
insert into BUSDRIVER (idriver, licensenumber)
values (673, '45-678-17');
insert into BUSDRIVER (idriver, licensenumber)
values (674, '56-789-28');
commit;
prompt 179 records loaded
prompt Loading BUSLINE...
insert into BUSLINE (idbusline, frequency, maxprice)
values (106, '44 min', 12);
insert into BUSLINE (idbusline, frequency, maxprice)
values (111, '11 min', 6);
insert into BUSLINE (idbusline, frequency, maxprice)
values (116, '24 min', 10);
insert into BUSLINE (idbusline, frequency, maxprice)
values (120, '57 min', 11);
insert into BUSLINE (idbusline, frequency, maxprice)
values (128, '59 min', 11);
insert into BUSLINE (idbusline, frequency, maxprice)
values (129, '12 min', 7);
insert into BUSLINE (idbusline, frequency, maxprice)
values (133, '26 min', 9);
insert into BUSLINE (idbusline, frequency, maxprice)
values (134, '3 min', 8);
insert into BUSLINE (idbusline, frequency, maxprice)
values (135, '38 min', 6);
insert into BUSLINE (idbusline, frequency, maxprice)
values (137, '52 min', 7);
insert into BUSLINE (idbusline, frequency, maxprice)
values (143, '20 min', 6);
insert into BUSLINE (idbusline, frequency, maxprice)
values (144, '54 min', 11);
insert into BUSLINE (idbusline, frequency, maxprice)
values (149, '44 min', 9);
insert into BUSLINE (idbusline, frequency, maxprice)
values (154, '6 min', 12);
insert into BUSLINE (idbusline, frequency, maxprice)
values (162, '49 min', 12);
insert into BUSLINE (idbusline, frequency, maxprice)
values (163, '28 min', 5);
insert into BUSLINE (idbusline, frequency, maxprice)
values (165, '37 min', 9);
insert into BUSLINE (idbusline, frequency, maxprice)
values (168, '16 min', 11);
insert into BUSLINE (idbusline, frequency, maxprice)
values (169, '32 min', 7);
insert into BUSLINE (idbusline, frequency, maxprice)
values (172, '34 min', 10);
insert into BUSLINE (idbusline, frequency, maxprice)
values (173, '51 min', 9);
insert into BUSLINE (idbusline, frequency, maxprice)
values (174, '24 min', 8);
insert into BUSLINE (idbusline, frequency, maxprice)
values (176, '27 min', 11);
insert into BUSLINE (idbusline, frequency, maxprice)
values (177, '40 min', 7);
insert into BUSLINE (idbusline, frequency, maxprice)
values (178, '56 min', 12);
insert into BUSLINE (idbusline, frequency, maxprice)
values (182, '17 min', 8);
insert into BUSLINE (idbusline, frequency, maxprice)
values (184, '33 min', 11);
insert into BUSLINE (idbusline, frequency, maxprice)
values (186, '10 min', 12);
insert into BUSLINE (idbusline, frequency, maxprice)
values (188, '48 min', 10);
insert into BUSLINE (idbusline, frequency, maxprice)
values (190, '23 min', 8);
insert into BUSLINE (idbusline, frequency, maxprice)
values (193, '1 min', 7);
insert into BUSLINE (idbusline, frequency, maxprice)
values (195, '14 min', 5);
insert into BUSLINE (idbusline, frequency, maxprice)
values (197, '3 min', 9);
insert into BUSLINE (idbusline, frequency, maxprice)
values (198, '38 min', 8);
insert into BUSLINE (idbusline, frequency, maxprice)
values (5, '7 min', 9);
insert into BUSLINE (idbusline, frequency, maxprice)
values (6, '42 min', 6);
insert into BUSLINE (idbusline, frequency, maxprice)
values (11, '4 min', 5);
insert into BUSLINE (idbusline, frequency, maxprice)
values (18, '9 min', 12);
insert into BUSLINE (idbusline, frequency, maxprice)
values (20, '5 min', 10);
insert into BUSLINE (idbusline, frequency, maxprice)
values (23, '20 min', 6);
insert into BUSLINE (idbusline, frequency, maxprice)
values (31, '47 min', 6);
insert into BUSLINE (idbusline, frequency, maxprice)
values (34, '6 min', 12);
insert into BUSLINE (idbusline, frequency, maxprice)
values (37, '25 min', 9);
insert into BUSLINE (idbusline, frequency, maxprice)
values (39, '35 min', 6);
insert into BUSLINE (idbusline, frequency, maxprice)
values (40, '8 min', 11);
insert into BUSLINE (idbusline, frequency, maxprice)
values (42, '49 min', 12);
insert into BUSLINE (idbusline, frequency, maxprice)
values (45, '37 min', 9);
insert into BUSLINE (idbusline, frequency, maxprice)
values (49, '32 min', 7);
insert into BUSLINE (idbusline, frequency, maxprice)
values (50, '19 min', 12);
insert into BUSLINE (idbusline, frequency, maxprice)
values (53, '51 min', 9);
insert into BUSLINE (idbusline, frequency, maxprice)
values (54, '24 min', 8);
insert into BUSLINE (idbusline, frequency, maxprice)
values (56, '27 min', 11);
insert into BUSLINE (idbusline, frequency, maxprice)
values (57, '40 min', 7);
insert into BUSLINE (idbusline, frequency, maxprice)
values (59, '43 min', 5);
insert into BUSLINE (idbusline, frequency, maxprice)
values (60, '45 min', 10);
insert into BUSLINE (idbusline, frequency, maxprice)
values (65, '42 min', 7);
insert into BUSLINE (idbusline, frequency, maxprice)
values (67, '30 min', 5);
insert into BUSLINE (idbusline, frequency, maxprice)
values (71, '9 min', 6);
insert into BUSLINE (idbusline, frequency, maxprice)
values (72, '56 min', 11);
insert into BUSLINE (idbusline, frequency, maxprice)
values (75, '14 min', 5);
insert into BUSLINE (idbusline, frequency, maxprice)
values (89, '19 min', 7);
insert into BUSLINE (idbusline, frequency, maxprice)
values (90, '41 min', 12);
insert into BUSLINE (idbusline, frequency, maxprice)
values (94, '50 min', 8);
insert into BUSLINE (idbusline, frequency, maxprice)
values (95, '16 min', 6);
insert into BUSLINE (idbusline, frequency, maxprice)
values (96, '55 min', 11);
insert into BUSLINE (idbusline, frequency, maxprice)
values (101, '37 min', 9);
commit;
prompt 66 records loaded
prompt Loading BUSRIDE...
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('29-07-2024 12:35:00', 'dd-mm-yyyy hh24:mi:ss'), 106, '67-890-32');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('06-11-2024 14:10:00', 'dd-mm-yyyy hh24:mi:ss'), 111, '12-345-78');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('17-03-2024 09:40:00', 'dd-mm-yyyy hh24:mi:ss'), 116, '67-890-33');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('02-01-2024 11:00:00', 'dd-mm-yyyy hh24:mi:ss'), 120, '01-234-77');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('01-11-2024 10:00:00', 'dd-mm-yyyy hh24:mi:ss'), 128, '89-012-56');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('12-05-2024 14:25:00', 'dd-mm-yyyy hh24:mi:ss'), 129, '90-123-67');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('26-04-2024 12:45:00', 'dd-mm-yyyy hh24:mi:ss'), 133, '34-567-02');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('07-10-2024 15:00:00', 'dd-mm-yyyy hh24:mi:ss'), 134, '45-678-13');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('18-02-2024 11:25:00', 'dd-mm-yyyy hh24:mi:ss'), 135, '56-789-24');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('11-01-2024 14:05:00', 'dd-mm-yyyy hh24:mi:ss'), 137, '78-901-46');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('17-12-2024 09:25:00', 'dd-mm-yyyy hh24:mi:ss'), 143, '34-567-03');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('27-02-2024 14:50:00', 'dd-mm-yyyy hh24:mi:ss'), 144, '45-678-14');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('24-03-2024 09:55:00', 'dd-mm-yyyy hh24:mi:ss'), 149, '90-123-69');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('18-05-2024 15:00:00', 'dd-mm-yyyy hh24:mi:ss'), 154, '45-678-15');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('16-05-2024 09:20:00', 'dd-mm-yyyy hh24:mi:ss'), 162, '23-456-94');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('27-11-2024 13:45:00', 'dd-mm-yyyy hh24:mi:ss'), 163, '34-567-05');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('18-04-2024 12:35:00', 'dd-mm-yyyy hh24:mi:ss'), 165, '56-789-27');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('20-06-2024 08:50:00', 'dd-mm-yyyy hh24:mi:ss'), 168, '89-012-60');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('01-02-2024 13:15:00', 'dd-mm-yyyy hh24:mi:ss'), 169, '90-123-71');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('05-12-2024 10:30:00', 'dd-mm-yyyy hh24:mi:ss'), 172, '23-456-95');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('16-08-2024 14:55:00', 'dd-mm-yyyy hh24:mi:ss'), 173, '34-567-06');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('27-04-2024 09:20:00', 'dd-mm-yyyy hh24:mi:ss'), 174, '45-678-17');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('19-01-2024 10:55:00', 'dd-mm-yyyy hh24:mi:ss'), 5, '56-789-01');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('30-09-2024 08:25:00', 'dd-mm-yyyy hh24:mi:ss'), 6, '67-890-12');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('08-04-2024 10:50:00', 'dd-mm-yyyy hh24:mi:ss'), 11, '12-345-68');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('29-10-2024 09:45:00', 'dd-mm-yyyy hh24:mi:ss'), 18, '89-012-35');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('20-03-2024 13:35:00', 'dd-mm-yyyy hh24:mi:ss'), 20, '01-234-57');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('23-07-2024 09:50:00', 'dd-mm-yyyy hh24:mi:ss'), 23, '34-567-81');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('22-09-2024 10:30:00', 'dd-mm-yyyy hh24:mi:ss'), 31, '12-345-70');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('25-07-2024 16:35:00', 'dd-mm-yyyy hh24:mi:ss'), 34, '45-678-03');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('27-02-2024 14:50:00', 'dd-mm-yyyy hh24:mi:ss'), 37, '78-901-36');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('20-06-2024 12:40:00', 'dd-mm-yyyy hh24:mi:ss'), 39, '90-123-58');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('01-02-2024 17:05:00', 'dd-mm-yyyy hh24:mi:ss'), 40, '01-234-69');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('24-03-2024 09:55:00', 'dd-mm-yyyy hh24:mi:ss'), 42, '23-456-82');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('25-01-2024 13:10:00', 'dd-mm-yyyy hh24:mi:ss'), 45, '56-789-15');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('09-07-2024 13:50:00', 'dd-mm-yyyy hh24:mi:ss'), 49, '90-123-59');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('20-03-2024 18:15:00', 'dd-mm-yyyy hh24:mi:ss'), 50, '01-234-60');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('23-01-2024 10:30:00', 'dd-mm-yyyy hh24:mi:ss'), 53, '34-567-94');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('05-09-2024 14:55:00', 'dd-mm-yyyy hh24:mi:ss'), 54, '45-678-05');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('27-11-2024 13:45:00', 'dd-mm-yyyy hh24:mi:ss'), 56, '67-890-27');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('07-08-2024 08:10:00', 'dd-mm-yyyy hh24:mi:ss'), 57, '78-901-38');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('29-12-2024 10:00:00', 'dd-mm-yyyy hh24:mi:ss'), 59, '90-123-60');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('09-10-2024 14:25:00', 'dd-mm-yyyy hh24:mi:ss'), 60, '01-234-71');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('05-12-2024 10:30:00', 'dd-mm-yyyy hh24:mi:ss'), 65, '56-789-17');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('27-04-2024 09:20:00', 'dd-mm-yyyy hh24:mi:ss'), 67, '78-901-39');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('09-01-2024 10:00:00', 'dd-mm-yyyy hh24:mi:ss'), 71, '12-345-74');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('20-09-2024 14:25:00', 'dd-mm-yyyy hh24:mi:ss'), 72, '23-456-85');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('24-07-2024 17:40:00', 'dd-mm-yyyy hh24:mi:ss'), 75, '56-789-18');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('27-07-2024 18:30:00', 'dd-mm-yyyy hh24:mi:ss'), 89, '90-123-63');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('07-02-2024 12:55:00', 'dd-mm-yyyy hh24:mi:ss'), 90, '01-234-74');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('20-08-2024 10:35:00', 'dd-mm-yyyy hh24:mi:ss'), 94, '45-678-09');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('01-04-2024 14:00:00', 'dd-mm-yyyy hh24:mi:ss'), 95, '56-789-20');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('12-10-2024 08:25:00', 'dd-mm-yyyy hh24:mi:ss'), 96, '67-890-31');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('06-04-2024 10:30:00', 'dd-mm-yyyy hh24:mi:ss'), 101, '12-345-77');
commit;
prompt 54 records loaded
prompt Loading CUSTOMER...
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (226, 'Trey', 'T@example.com', '076-7890123', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (227, 'Troy', 'T@example.com', '076-8901234', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (229, 'Vera', 'V@example.com', '076-0123456', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (230, 'Vince', 'V@example.com', '077-1234567', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (232, 'Walt', 'W@example.com', '077-3456789', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (233, 'Will', 'W@example.com', '077-4567890', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (235, 'Zane', 'Z@example.com', '077-6789012', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (237, 'Zoey', 'Z@example.com', '077-8901234', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (238, 'Aida', 'A@example.com', '077-9012345', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (239, 'Amos', 'A@example.com', '077-0123456', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (240, 'Beau', 'B@example.com', '078-1234567', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (242, 'Boyd', 'B@example.com', '078-3456789', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (243, 'Bryn', 'B@example.com', '078-4567890', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (244, 'Cade', 'C@example.com', '078-5678901', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (245, 'Cain', 'C@example.com', '078-6789012', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (246, 'Cate', 'C@example.com', '078-7890123', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (247, 'Chad', 'C@example.com', '078-8901234', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (248, 'Cher', 'C@example.com', '078-9012345', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (249, 'Chip', 'C@example.com', '078-0123456', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (250, 'Clem', 'C@example.com', '079-1234567', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (251, 'Cole', 'C@example.com', '079-2345678', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (252, 'Cory', 'C@example.com', '079-3456789', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (254, 'Cyan', 'C@example.com', '079-5678901', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (255, 'Dale', 'D@example.com', '079-6789012', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (257, 'Davy', 'D@example.com', '079-8901234', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (259, 'Drew', 'D@example.com', '079-0123456', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (260, 'Earl', 'E@example.com', '080-1234567', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (261, 'Eden', 'E@example.com', '080-2345678', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (262, 'Edie', 'E@example.com', '080-3456789', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (263, 'Elio', 'E@example.com', '080-4567890', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (264, 'Elly', 'E@example.com', '080-5678901', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (266, 'Evan', 'E@example.com', '080-7890123', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (267, 'Ezra', 'E@example.com', '080-8901234', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (271, 'Fred', 'F@example.com', '081-2345678', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (272, 'Gale', 'G@example.com', '081-3456789', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (273, 'Gary', 'G@example.com', '081-4567890', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (274, 'Gena', 'G@example.com', '081-5678901', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (277, 'Hans', 'H@example.com', '081-8901234', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (278, 'Hank', 'H@example.com', '081-9012345', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (280, 'Imre', 'I@example.com', '082-1234567', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (284, 'Jake', 'J@example.com', '082-5678901', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (286, 'Javi', 'J@example.com', '082-7890123', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (289, 'Joel', 'J@example.com', '082-0123456', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (290, 'Joey', 'J@example.com', '083-1234567', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (295, 'Kate', 'K@example.com', '083-6789012', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (296, 'Katy', 'K@example.com', '083-7890123', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (297, 'Kyle', 'K@example.com', '083-8901234', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (300, 'Lars', 'L@example.com', '084-1234567', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (306, 'Lou', 'L@example.com', '084-7890123', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (307, 'Luca', 'L@example.com', '084-8901234', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (309, 'Mack', 'M@example.com', '084-0123456', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (310, 'Mae', 'M@example.com', '085-1234567', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (312, 'Mary', 'M@example.com', '085-3456789', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (313, 'Matt', 'M@example.com', '085-4567890', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (314, 'Max', 'M@example.com', '085-5678901', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (319, 'Neil', 'N@example.com', '085-0123456', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (322, 'Noah', 'N@example.com', '086-3456789', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (323, 'Noel', 'N@example.com', '086-4567890', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (324, 'Owen', 'O@example.com', '086-5678901', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (327, 'Pete', 'P@example.com', '086-8901234', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (329, 'Ralf', 'R@example.com', '086-0123456', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (331, 'Rene', 'R@example.com', '087-2345678', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (333, 'Rick', 'R@example.com', '087-4567890', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (334, 'Rolf', 'R@example.com', '087-5678901', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (336, 'Ryan', 'R@example.com', '087-7890123', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (337, 'Sage', 'S@example.com', '087-8901234', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (339, 'Sean', 'S@example.com', '087-0123456', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (340, 'Seth', 'S@example.com', '088-1234567', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (101, 'Adam', 'A@example.com', '050-2345678', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (102, 'Alan', 'A@example.com', '050-3456789', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (107, 'Anne', 'A@example.com', '050-8901234', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (109, 'Aron', 'A@example.com', '050-0123456', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (111, 'Barb', 'B@example.com', '052-2345678', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (112, 'Bart', 'B@example.com', '052-3456789', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (114, 'Beth', 'B@example.com', '052-5678901', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (118, 'Carl', 'C@example.com', '052-9012345', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (122, 'Cory', 'C@example.com', '053-3456789', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (124, 'Dale', 'D@example.com', '053-5678901', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (127, 'Dave', 'D@example.com', '053-8901234', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (128, 'Dean', 'D@example.com', '053-9012345', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (129, 'Drew', 'D@example.com', '053-0123456', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (131, 'Duke', 'D@example.com', '054-2345678', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (132, 'Earl', 'E@example.com', '054-3456789', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (134, 'Ella', 'E@example.com', '054-5678901', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (135, 'Elle', 'E@example.com', '054-6789012', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (136, 'Eric', 'E@example.com', '054-7890123', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (141, 'Gary', 'G@example.com', '055-2345678', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (142, 'Gina', 'G@example.com', '055-3456789', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (144, 'Greg', 'G@example.com', '055-5678901', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (146, 'Hans', 'H@example.com', '055-7890123', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (148, 'Hugh', 'H@example.com', '055-9012345', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (149, 'Ian', 'I@example.com', '055-0123456', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (154, 'Jase', 'J@example.com', '056-5678901', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (155, 'Javi', 'J@example.com', '056-6789012', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (158, 'Jenn', 'J@example.com', '056-9012345', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (159, 'Jess', 'J@example.com', '056-0123456', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (161, 'Jodi', 'J@example.com', '057-2345678', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (163, 'Joey', 'J@example.com', '057-4567890', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (165, 'Josh', 'J@example.com', '057-6789012', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (168, 'Kara', 'K@example.com', '057-9012345', null);
commit;
prompt 100 records committed...
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (169, 'Kate', 'K@example.com', '057-0123456', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (171, 'Kaye', 'K@example.com', '058-2345678', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (172, 'Kyle', 'K@example.com', '058-3456789', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (173, 'Lana', 'L@example.com', '058-4567890', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (176, 'Lila', 'L@example.com', '058-7890123', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (179, 'Lois', 'L@example.com', '058-0123456', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (181, 'Luca', 'L@example.com', '059-2345678', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (182, 'Lucy', 'L@example.com', '059-3456789', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (183, 'Luis', 'L@example.com', '059-4567890', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (106, 'Andy', 'A@example.com', '050-7890123', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (110, 'Axel', 'A@example.com', '052-1234567', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (116, 'Brad', 'B@example.com', '052-7890123', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (123, 'Cruz', 'C@example.com', '053-4567890', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (126, 'Dani', 'D@example.com', '053-7890123', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (130, 'Duan', 'D@example.com', '054-1234567', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (133, 'Edie', 'E@example.com', '054-4567890', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (140, 'Gail', 'G@example.com', '055-1234567', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (143, 'Glen', 'G@example.com', '055-4567890', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (150, 'Jack', 'J@example.com', '056-1234567', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (153, 'Jane', 'J@example.com', '056-4567890', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (157, 'Jeff', 'J@example.com', '056-8901234', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (160, 'Jill', 'J@example.com', '057-1234567', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (164, 'John', 'J@example.com', '057-5678901', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (174, 'Leah', 'L@example.com', '058-5678901', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (180, 'Lori', 'L@example.com', '059-1234567', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (185, 'Mace', 'M@example.com', '059-6789012', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (199, 'Owen', 'O@example.com', '072-0123456', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (214, 'Sam', 'S@example.com', '074-5678901', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (228, 'Ty', 'T@example.com', '076-9012345', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (241, 'Bing', 'B@example.com', '078-2345678', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (285, 'Jame', 'J@example.com', '082-6789012', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (305, 'Liza', 'L@example.com', '084-6789012', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (326, 'Paul', 'P@example.com', '086-7890123', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (125, 'Dana', 'D@example.com', '053-6789012', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (166, 'Juan', 'J@example.com', '057-7890123', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (605, 'shay', 's@example.com', '058-1458796', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (606, 'yosi', 'y@example.com', '054-8596487', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (903, 'maayan', 'm@example.com', '0512214074', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (904, 'maayan', 'm@example.com', '0512214074', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (906, 'naama', 'n@example.com', '0518745698', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (845, 'Lin-MacPherson', 'lin.macpherson@', '18428028', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (485, 'Donal-Harary', 'donal.harary@am', '1226769376', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (38, 'Goran-Heald', 'goran.heald@bri', '3472645645', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (360, 'Nikka-Thurman', 'nikka.thurman@p', '2846927587', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (889, 'Mary-Louise-Man', 'marylouisem@den', '4224062640', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (902, 'Val-Steenburgen', 'val.steenburgen', '3058815776', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (928, 'Radney-Cruise', 'radney@y2market', '2166985774', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (848, 'Joaquim-Jane', 'jjane@netnumina', '2457612996', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (649, 'Grace-Brolin', 'grace.brolin@sp', '2631776471', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (857, 'Mika-Malkovich', 'm.malkovich@mat', '1759481672', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (645, 'Juan-Feore', 'j.feore@gha.com', '4126108396', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (511, 'Naomi-Mahoney', 'n.mahoney@kwraf', '2265481556', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (648, 'Beverley-Costa', 'beverley@author', '31213022', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (311, 'Juliet-Atlas', 'juliet.atlas@ss', '3211049956', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (988, 'Loren-Kapanka', 'loren.kapanka@m', '1159920677', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (765, 'Adrien-Thewlis', 'a.thewlis@hospi', '899719915', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (932, 'Carrie-Edmunds', 'c.edmunds@qls.d', '3756808272', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (303, 'Gary-Checker', 'gary.checker@bi', '1357333059', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (17, 'Chris-Connick', 'cconnick@medsou', '3210634331', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (68, 'Vertical-Belles', 'vertical.belles', '2388370667', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (279, 'Solomon-Uggams', 'solomon.uggams@', '2803639500', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (811, 'Bernard-Bryson', 'bernard.bryson@', '3029730528', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (215, 'Tommy-Aaron', 'tommy.aaron@big', '3469669115', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (942, 'King-Copeland', 'k.copeland@amer', '4083114705', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (302, 'Ted-Magnuson', 'ted@paintedword', '3720365951', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (535, 'Geoffrey-Playbo', 'geoffrey.playbo', '2072259994', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (269, 'Darius-Giannini', 'darius.g@youngi', '637064367', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (930, 'Ike-Forrest', 'ike.forrest@ahl', '1384427922', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (572, 'Treat-Dreyfuss', 'treat.dreyfuss@', '1059643543', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (549, 'Richie-Burke', 'richie@bashen.z', '2775887742', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (23, 'CeCe-Aaron', 'cece.aaron@swi.', '2832466084', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (234, 'Debi-Borden', 'debi.borden@nlx', '2761395904', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (253, 'Eileen-Adkins', 'eadkins@inzone.', '671518750', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (343, 'Tate', 'T@example.com', '088-4567890', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (344, 'Todd', 'T@example.com', '088-5678901', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (347, 'Tory', 'T@example.com', '088-8901234', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (348, 'Trey', 'T@example.com', '088-9012345', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (350, 'Tyra', 'T@example.com', '089-1234567', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (351, 'Vick', 'V@example.com', '089-2345678', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (353, 'Will', 'W@example.com', '089-4567890', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (354, 'Yves', 'Y@example.com', '089-5678901', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (355, 'Zane', 'Z@example.com', '089-6789012', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (356, 'Zeke', 'Z@example.com', '089-7890123', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (358, 'Axel', 'A@example.com', '089-9012345', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (359, 'Brad', 'B@example.com', '089-0123456', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (361, 'Cary', 'C@example.com', '090-2345678', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (362, 'Chad', 'C@example.com', '090-3456789', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (363, 'Clay', 'C@example.com', '090-4567890', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (364, 'Dale', 'D@example.com', '090-5678901', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (366, 'Edie', 'E@example.com', '090-7890123', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (369, 'Faye', 'F@example.com', '090-0123456', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (370, 'Finn', 'F@example.com', '091-1234567', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (371, 'Fred', 'F@example.com', '091-2345678', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (372, 'Greg', 'G@example.com', '091-3456789', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (373, 'Hank', 'H@example.com', '091-4567890', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (376, 'Jack', 'J@example.com', '091-7890123', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (379, 'Joel', 'J@example.com', '091-0123456', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (380, 'John', 'J@example.com', '092-1234567', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (381, 'Juan', 'J@example.com', '092-2345678', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (384, 'Liam', 'L@example.com', '092-5678901', null);
commit;
prompt 200 records committed...
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (385, 'Lois', 'L@example.com', '092-6789012', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (387, 'Mack', 'M@example.com', '092-8901234', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (388, 'Mark', 'M@example.com', '092-9012345', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (391, 'Owen', 'O@example.com', '093-2345678', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (392, 'Paul', 'P@example.com', '093-3456789', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (394, 'Rhys', 'R@example.com', '093-5678901', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (396, 'Ross', 'R@example.com', '093-7890123', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (398, 'Saul', 'S@example.com', '093-9012345', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (400, 'Stan', 'S@example.com', '094-1234567', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (403, 'Vera', 'V@example.com', '094-4567890', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (404, 'Walt', 'W@example.com', '094-5678901', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (406, 'Abby', 'A@example.com', '094-7890123', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (407, 'Adam', 'A@example.com', '094-8901234', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (409, 'Alex', 'A@example.com', '094-0123456', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (410, 'Amir', 'A@example.com', '095-1234567', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (411, 'Andy', 'A@example.com', '095-2345678', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (413, 'Aron', 'A@example.com', '095-4567890', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (416, 'Bart', 'B@example.com', '095-7890123', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (417, 'Beau', 'B@example.com', '095-8901234', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (418, 'Bill', 'B@example.com', '095-9012345', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (419, 'Brad', 'B@example.com', '095-0123456', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (421, 'Chad', 'C@example.com', '096-2345678', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (422, 'Cody', 'C@example.com', '096-3456789', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (423, 'Cory', 'C@example.com', '096-4567890', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (424, 'Cruz', 'C@example.com', '096-5678901', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (426, 'Dani', 'D@example.com', '096-7890123', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (427, 'Dave', 'D@example.com', '096-8901234', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (429, 'Duke', 'D@example.com', '096-0123456', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (430, 'Earl', 'E@example.com', '097-1234567', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (431, 'Evan', 'E@example.com', '097-2345678', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (432, 'Finn', 'F@example.com', '097-3456789', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (435, 'Glen', 'G@example.com', '097-6789012', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (436, 'Greg', 'G@example.com', '097-7890123', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (438, 'Jack', 'J@example.com', '097-9012345', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (439, 'Jade', 'J@example.com', '097-0123456', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (442, 'Joel', 'J@example.com', '098-3456789', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (443, 'Joey', 'J@example.com', '098-4567890', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (445, 'Josh', 'J@example.com', '098-6789012', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (446, 'Jude', 'J@example.com', '098-7890123', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (447, 'Kyle', 'K@example.com', '098-8901234', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (448, 'Lana', 'L@example.com', '098-9012345', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (449, 'Leah', 'L@example.com', '098-0123456', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (450, 'Liam', 'L@example.com', '099-1234567', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (451, 'Lily', 'L@example.com', '099-2345678', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (452, 'Luca', 'L@example.com', '099-3456789', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (453, 'Lucy', 'L@example.com', '099-4567890', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (454, 'Luis', 'L@example.com', '099-5678901', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (455, 'Luke', 'L@example.com', '099-6789012', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (456, 'Mark', 'M@example.com', '099-7890123', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (457, 'Mary', 'M@example.com', '099-8901234', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (458, 'Matt', 'M@example.com', '099-9012345', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (459, 'Maya', 'M@example.com', '099-0123456', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (460, 'Mike', 'M@example.com', '070-1234567', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (461, 'Nate', 'N@example.com', '070-2345678', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (463, 'Noah', 'N@example.com', '070-4567890', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (464, 'Owen', 'O@example.com', '070-5678901', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (465, 'Paul', 'P@example.com', '070-6789012', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (467, 'Pete', 'P@example.com', '070-7890123', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (468, 'Quinn', 'Q@example.com', '070-8901234', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (470, 'Rick', 'R@example.com', '070-0123456', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (471, 'Rob', 'R@example.com', '071-1234567', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (473, 'Seth', 'S@example.com', '071-3456789', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (474, 'Stan', 'S@example.com', '071-4567890', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (475, 'Tate', 'T@example.com', '071-5678901', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (476, 'Toby', 'T@example.com', '071-6789012', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (477, 'Todd', 'T@example.com', '071-7890123', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (478, 'Tom', 'T@example.com', '071-8901234', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (479, 'Troy', 'T@example.com', '071-9012345', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (483, 'Zoey', 'Z@example.com', '073-3456789', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (489, 'Cory', 'C@example.com', '073-9012345', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (490, 'Cyan', 'C@example.com', '073-0123456', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (492, 'Elio', 'E@example.com', '074-2345678', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (493, 'Faye', 'F@example.com', '074-3456789', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (494, 'Gena', 'G@example.com', '074-4567890', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (496, 'Imre', 'I@example.com', '074-6789012', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (500, 'Lara', 'L@example.com', '074-5874123', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (288, 'Jess', 'J@example.com', '082-9012345', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (294, 'Karl', 'K@example.com', '083-5678901', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (304, 'Lisa', 'L@example.com', '084-5678901', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (308, 'Lyle', 'L@example.com', '084-9012345', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (315, 'Mike', 'M@example.com', '085-6789012', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (321, 'Nils', 'N@example.com', '086-2345678', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (325, 'Paco', 'P@example.com', '086-6789012', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (335, 'Ross', 'R@example.com', '087-6789012', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (338, 'Saul', 'S@example.com', '087-9012345', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (103, 'Alex', 'A@example.com', '050-4567890', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (184, 'Luke', 'L@example.com', '059-5678901', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (186, 'Mara', 'M@example.com', '059-7890123', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (188, 'Mary', 'M@example.com', '059-9012345', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (189, 'Matt', 'M@example.com', '059-0123456', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (190, 'Max', 'M@example.com', '072-1234567', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (191, 'Maya', 'M@example.com', '072-2345678', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (192, 'Meg', 'M@example.com', '072-3456789', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (193, 'Mike', 'M@example.com', '072-4567890', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (196, 'Nick', 'N@example.com', '072-7890123', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (197, 'Noah', 'N@example.com', '072-8901234', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (200, 'Paul', 'P@example.com', '073-1234567', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (202, 'Phil', 'P@example.com', '073-3456789', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (203, 'Quinn', 'Q@example.com', '073-4567890', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (204, 'Raul', 'R@example.com', '073-5678901', null);
commit;
prompt 300 records committed...
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (205, 'Reed', 'R@example.com', '073-6789012', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (206, 'Rhys', 'R@example.com', '073-7890123', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (207, 'Rick', 'R@example.com', '073-8901234', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (210, 'Rosa', 'R@example.com', '074-1234567', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (211, 'Ross', 'R@example.com', '074-2345678', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (212, 'Ryan', 'R@example.com', '074-3456789', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (217, 'Shaw', 'S@example.com', '074-8901234', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (219, 'Tate', 'T@example.com', '074-0123456', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (220, 'Teri', 'T@example.com', '076-1234567', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (221, 'Tess', 'T@example.com', '076-2345678', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (222, 'Toby', 'T@example.com', '076-3456789', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (223, 'Todd', 'T@example.com', '076-4567890', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (225, 'Tony', 'T@example.com', '076-6789012', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (15, 'Mike-McGriff', 'mikem@fetchlogi', '2654265182', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (119, 'Wayman-Baker', 'wayman.baker@so', '2270586717', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (256, 'Alicia-Creek', 'alicia.c@target', '3712472533', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (52, 'Martha-Whitwam', 'martha.whitwam@', '1441117242', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (756, 'Hope-Capshaw', 'hope.capshaw@ca', '28838152', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (63, 'Gavin-McCain', 'g.mccain@oriser', '2330652643', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (959, 'Joan-Guest', 'joan@generalmot', '3062052741', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (420, 'Liquid-Marsden', 'l.marsden@taste', '850074985', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (575, 'Noah-Bugnon', 'noah.b@spinnake', '2451008547', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (551, 'Julie-Horizon', 'julieh@insurmar', '3762714280', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (755, 'Kate-Magnuson', 'kate.m@logistic', '1029865395', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (428, 'Kate-Wine', 'kate.wine@nmr.c', '761048004', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (138, 'Amanda-Thewlis', 'amanda.thewlis@', '913752806', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (861, 'Philip-England', 'philip.england@', '782555660', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (121, 'Brian-Hudson', 'bhudson@catamou', '1757587950', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (84, 'Lindsay-Keener', 'lindsay.keener@', '2984494320', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (617, 'Madeline-Potter', 'madeline.potter', '624120968', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (11, 'Rascal-Withers', 'rascal.withers@', '3668236870', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (281, 'Kenny-Flack', 'kenny.f@ksj.com', '2320995528', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (770, 'Radney-Tinsley', 'radney.tinsley@', '2995648440', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (14, 'Kyle-Wincott', 'kyle@tilia.com', '3979541254', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (30, 'Eddie-Meniketti', 'eddie.meniketti', '2283995079', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (983, 'Christina-Whitm', 'christina.whitm', '2384598262', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (936, 'Armand-Singh', 'armand.singh@we', '1456514642', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (437, 'Boz-Rodriguez', 'boz@studiobprod', '2614273188', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (151, 'Gary-Young', 'gary.young@mast', '3666213741', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (806, 'Bridgette-Green', 'bridgetteg@dsp.', '2217515395', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (70, 'Philip-Braugher', 'philip.braugher', '3123074303', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (659, 'Herbie-Scheider', 'herbie.scheider', '3488135319', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (767, 'Lynn-LaSalle', 'llasalle@telech', '647181112', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (743, 'Shelby-Numan', 'shelby@electric', '824714998', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (919, 'Machine-Leachma', 'machine.leachma', '1639049548', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (268, 'William-Fiennes', 'william.fiennes', '2257265079', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (521, 'Busta-Wiest', 'busta.wiest@3ts', '1080789092', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (170, 'Temuera-Colton', 'temuerac@micros', '679560738', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (104, 'Leslie-Stamp', 'l.stamp@efcbanc', '3674894175', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (632, 'Kenny-Coburn', 'kennyc@nike.com', '3132640080', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (375, 'Lara-Ramirez', 'lramirez@epamsy', '545568228', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (53, 'Natacha-Collie', 'natacha.c@everg', '4226552235', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (399, 'Cledus-Phifer', 'cledus.phifer@m', '2840670431', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (292, 'Anthony-Shatner', 'anthony.shatner', '1391037383', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (895, 'Morgan-Bates', 'morgan.bates@sm', '4256551174', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (231, 'Charlie-Sedaka', 'csedaka@kiamoto', '3037903540', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (769, 'Cyndi-Latifah', 'cyndi.latifah@u', '2144330714', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (754, 'Naomi-Phifer', 'nphifer@gdi.ca', '4231482438', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (177, 'Julie-Karyo', 'julie.karyo@sys', '1434393075', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (402, 'Sean-Bello', 'seanb@adeasolut', '3374871786', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (783, 'Crispin-Estevez', 'cestevez@wci.co', '3809789055', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (69, 'Marianne-Lauper', 'marianne.l@albe', '1100855486', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (377, 'Catherine-Butle', 'catherine.butle', '3355041267', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (162, 'Danni-Herndon', 'danni.herndon@g', '2922015841', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (759, 'Cuba-Costner', 'cuba.costner@am', '3990670701', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (276, 'Jennifer-Krumho', 'jennifer.krumho', '2821483143', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (73, 'Clint-Steagall', 'csteagall@cmi.d', '1142929992', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (693, 'Karon-Heston', 'karon.heston@as', '2943928219', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (491, 'Temuera-Liotta', 't.liotta@bioref', '1161826707', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (777, 'Loreena-Whitmor', 'loreenaw@anwort', '1434215247', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (989, 'Machine-Baez', 'machine.baez@ma', '3370642028', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (689, 'Holland-Bright', 'hbright@ccfhold', '1335265123', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (514, 'Talvin-Patton', 'talvin.patton@p', '1915267541', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (927, 'Sinead-Cervine', 'sinead@proclari', '3748430992', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (209, 'Mae-Nunn', 'mae@terrafirma.', '1148826746', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (224, 'Roberta-Joli', 'robertaj@electr', '1586687188', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (532, 'Vendetta-Marx', 'vendetta.marx@u', '3593280755', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (147, 'Clea-Lucien', 'clea.lucien@exi', '2470266446', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (990, 'Cary-Roy Parnel', 'croyparnell@ame', '3047620441', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (145, 'Emilio-Broza', 'emilio@abs.com', '3596336400', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (357, 'Ruth-Loggins', 'ruthl@cns.za', '3905561554', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (588, 'Clarence-Bates', 'clarence.bates@', '1269479430', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (751, 'Suzanne-Vinton', 'suzanne.vinton@', '1859455150', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (91, 'Glenn-Cash', 'glenn.cash@park', '2545224182', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (620, 'Lea-Palin', 'lea.palin@gener', '4225003621', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (393, 'Willem-Rollins', 'willem@officede', '1253456915', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (9, 'Elle-Levin', 'elle@berkshireh', '653182032', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (598, 'Emerson-Garcia', 'emerson@verizon', '1899343491', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (34, 'Stephanie-Parke', 'stephanie.parke', '1195200980', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (495, 'Maury-Farina', 'maury.farina@us', '1053374057', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (786, 'Tom-Hanks', 'tom.hanks@fetch', '810253289', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (480, 'Davy-Quatro', 'davy.quatro@nta', '923212137', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (198, 'Kenneth-Withers', 'k.witherspoon@k', '891751447', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (216, 'Colleen-Hutton', 'c.hutton@tlsser', '1610119815', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (600, 'Mitchell-Pride', 'mitchell.pride@', '2114553523', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (618, 'Richard-Dunst', 'richard.dunst@a', '3674768993', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (732, 'Queen-Jamal', 'queen.jamal@ams', '3435370038', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (433, 'Miranda-Apple', 'miranda.apple@e', '2720952158', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (565, 'Vern-Cage', 'vern@dillards.d', '3300830969', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (586, 'Judi-Rhames', 'judi@pioneerdat', '1233172289', null);
commit;
prompt 400 records committed...
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (115, 'Emerson-Place', 'emerson@ezecast', '967376656', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (317, 'Chris-Hector', 'chris@greenmoun', '1274844879', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (536, 'Patti-Rea', 'patti.rea@visio', '1610052648', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (345, 'Boyd-Sharp', 'boyd@marlabs.jp', '3253618161', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (916, 'Miranda-Duvall', 'miranda.d@gtp.z', '599140118', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (863, 'Tilda-Fariq', 't.fariq@volkswa', '1192693271', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (71, 'Nelly-Ribisi', 'nelly.ribisi@pr', '3090862295', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (440, 'Luis-Flanagan', 'luis@venoco.com', '4058568726', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (678, 'Carla-Vai', 'carla@kis.uk', '1928840076', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (909, 'Neve-Reed', 'neve.reed@ccfho', '2387187814', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (795, 'Judi-Ramirez', 'judi.ramirez@he', '1570208231', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (867, 'Kurtwood-Madsen', 'kurtwood@bat.co', '2729851058', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (57, 'Holland-Arquett', 'holland.arquett', '2705307107', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (320, 'Rosanna-Tucker', 'rosanna.tucker@', '1784869904', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (796, 'Jean-Claude-McC', 'jeanclaude.mcca', '1947021888', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (872, 'Winona-White', 'wwhite@generale', '2889396583', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (395, 'Loretta-Rourke', 'lrourke@ataserv', '2642569898', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (301, 'Giancarlo-Tenni', 'giancarlot@flav', '964082871', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (318, 'Collective-Free', 'cfreeman@meridi', '3801500357', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (955, 'Hank-Strong', 'hank.strong@nsd', '3884423418', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (208, 'Nicole-Rucker', 'nicole.rucker@c', '2691197628', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (108, 'Ray-Kline', 'r.kline@grs.com', '1488086880', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (967, 'Alec-Boorem', 'alec.b@linacsys', '1839710812', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (509, 'Jose-Li', 'jli@ogiointerna', '846896267', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (484, 'Dionne-Lachey', 'dionne.lachey@f', '3754847089', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (218, 'Rhona-Perry', 'rhonap@componen', '4005975737', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (772, 'Eileen-Haynes', 'eileen.haynes@n', '535308298', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (501, 'Sarah-Yorn', 'sarah.yorn@aris', '3801333002', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (945, 'Shawn-Renfro', 'shawn.renfro@ma', '3556961100', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (12, 'Garland-Oldman', 'g.oldman@provid', '1932113920', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (508, 'Maceo-Maxwell', 'maceo.maxwell@n', '1895614204', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (382, 'Rene-Dunaway', 'rene.dunaway@mo', '664528874', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (993, 'Yolanda-McDonne', 'ymcdonnell@tech', '3054679165', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (414, 'Casey-Travolta', 'casey.t@gltg.co', '2779830282', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (973, 'Parker-Molina', 'parker.molina@p', '1096686876', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (713, 'Gilbert-Burrows', 'gilbert@mathis.', '3331867031', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (876, 'Reese-Woodard', 'rwoodard@multim', '3048616589', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (76, 'Isaac-Tyson', 'isaac.tyson@spe', '2029994164', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (41, 'Fionnula-Sartai', 'fionnula.sartai', '2592918693', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (1, 'Crystal-Haynes', 'crystal.haynes@', '1492867790', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (545, 'Scott-El-Saher', 'scott.elsaher@c', '2428918053', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (596, 'Harry-Galecki', 'harry.g@horizon', '2373538644', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (18, 'Drew-Skaggs', 'drew@ccb.uk', '1065859559', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (879, 'Nick-Shelton', 'nick.s@target.c', '3194754490', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (481, 'Jill-Neill', 'jill.neill@swi.', '3703090924', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (29, 'Cledus-Vassar', 'cledus.vassar@t', '730734565', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (900, 'Kim-Clooney', 'kimc@virbac.jp', '669946732', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (187, 'Harvey-Bachman', 'harvey.bachman@', '616234840', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (640, 'Uma-Nivola', 'uma.nivola@wrgs', '4043810097', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (441, 'Boyd-Rucker', 'boyd.r@atxforms', '4166236316', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (567, 'Juliana-Snipes', 'julianas@carter', '3600542341', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (784, 'Hikaru-Cleary', 'hikaru.c@mattel', '2065879945', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (595, 'Bonnie-Mattea', 'bmattea@esoftso', '1622123213', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (152, 'Jackson-Coughla', 'jackson.coughla', '1339903322', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (341, 'Grant-Blaine', 'grant.blaine@em', '2152502955', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (352, 'Eileen-Shawn', 'eileen@trinityh', '2686836627', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (842, 'Gaby-Ontiveros', 'gaby@topicsente', '1010850268', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (195, 'Goldie-Gugino', 'goldie.gugino@a', '3405205686', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (389, 'Michelle-Vince', 'mvince@allstar.', '2997357767', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (787, 'Sandra-Giraldo', 'sandra.giraldo@', '1017267070', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (908, 'Sal-Brandt', 'sal.brandt@well', '2679787434', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (797, 'Oded-McDowall', 'oded.mcdowall@h', '815587364', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (258, 'Michael-Lloyd', 'michael@entelli', '522887581', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (412, 'Leon-Gough', 'leon.gough@mult', '2818252113', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (97, 'Vincent-Bell', 'vincent.bell@nr', '3960003655', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (378, 'Terence-Davies', 'terenced@neogen', '616946868', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (283, 'George-Peterson', 'george.peterson', '2274427089', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (790, 'Ozzy-Getty', 'ozzy@myricom.za', '3176876736', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (656, 'Marlon-Emmett', 'marlon.emmett@d', '2283472457', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (291, 'Lois-Senior', 'lois.senior@anh', '2064143042', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (675, 'Dar-Mohr', 'dar.m@spenser.c', '2369182846', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (365, 'James-Merchant', 'james.merchant@', '2057738767', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (994, 'Mitchell-Crysta', 'm.crystal@colga', '2762008759', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (633, 'Bobby-Brosnan', 'bobby.brosnan@t', '1776018292', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (282, 'Caroline-Prinze', 'caroline.prinze', '2533825955', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (401, 'Juliet-Choice', 'juliet.choice@f', '3081377274', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (946, 'Ashton-Duke', 'ashton.duke@evi', '3473133526', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (139, 'Jean-Claude-Bel', 'j.bello@pib.com', '3316388122', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (488, 'Horace-Reid', 'horacer@saralee', '1413001920', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (178, 'Brad-Lipnicki', 'bradl@sds.fi', '719219685', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (293, 'Bruce-Gibbons', 'bruce@ceom.com', '3216342117', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (386, 'Chi-Hamilton', 'chi.hamilton@og', '592020105', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (846, 'William-Eldard', 'william@verizon', '3693554284', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (844, 'Liquid-Allen', 'liquida@nsd.com', '3373563180', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (836, 'Andrae-Short', 'andrae.short@sh', '3470207940', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (976, 'Demi-Cheadle', 'demi.cheadle@bi', '1858364832', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (839, 'Avril-Hingle', 'avril@priorityl', '566344697', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (589, 'Bridgette-Nelli', 'bridgette@fetch', '3353572319', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (408, 'Lila-Malone', 'lilam@studiobpr', '1636792009', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (100, 'Lonnie-Aiken', 'lonniea@kiamoto', '3289217596', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (533, 'Deborah-Cusack', 'deborah.cusack@', '982898859', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (316, 'Malcolm-Judd', 'malcolm.judd@ab', '714922900', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (840, 'Charles-Loeb', 'charles.loeb@ds', '1486084953', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (747, 'Amanda-Phillips', 'amanda.phillips', '2006003891', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (99, 'Delroy-Curtis', 'delroy.curtis@i', '3819054809', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (631, 'Brittany-Curtis', 'brittany.curtis', '3075190623', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (740, 'Jesus-Skaggs', 'jesus.skaggs@ax', '3272970185', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (77, 'Nikka-Pfeiffer', 'nikka.pfeiffer@', '2298696546', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (757, 'Thomas-Eckhart', 'thomas.eckhart@', '3696969188', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (346, 'Keith-Leary', 'keith@randomwal', '2523510879', null);
commit;
prompt 500 records committed...
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (865, 'Rosco-Davies', 'rosco.davies@kn', '2700513590', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (330, 'Balthazar-Jonze', 'balthazar.jonze', '2030038165', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (705, 'Ned-Redford', 'nredford@consul', '4123302985', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (749, 'Rebecca-Gere', 'rebecca.gere@in', '1777909269', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (852, 'Bette-Schiff', 'bette.schiff@st', '2074778849', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (487, 'Rip-Hyde', 'rip.hyde@contra', '4260512493', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (275, 'Giovanni-Cherry', 'giovanni.cherry', '766562289', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (349, 'Joshua-Donelly', 'joshua.donelly@', '895025102', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (425, 'Gord-Monk', 'gord.monk@alter', '3195468446', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (528, 'Vickie-Fierstei', 'vickie.fierstei', '3949064355', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (972, 'Alec-Zappacosta', 'alec.zappacosta', '59116495', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (66, 'Clint-Gill', 'c.gill@globalwi', '835908787', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (635, 'Lily-Charles', 'l.charles@infov', '3656099963', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (975, 'Kelli-Evett', 'kelli.evett@ubp', '3789692440', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (299, 'Joanna-Cochran', 'joannac@priorit', '2481349511', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (117, 'Jeremy-Venora', 'jeremy@calence.', '2657913434', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (554, 'Ned-Manning', 'ned.manning@uni', '1995340926', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (824, 'Goran-Neville', 'goran.neville@m', '2374007156', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (939, 'Jeremy-Griffith', 'jeremy.griffith', '3647317442', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (26, 'Jay-Tyson', 'jayt@aoltimewar', '1483329094', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (499, 'Freda-Dillane', 'freda.dillane@t', '1676862361', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (599, 'Vickie-Lewin', 'vickie.lewin@as', '4030853967', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (368, 'Wally-Magnuson', 'wally.magnuson@', '1075591363', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (287, 'Lydia-Derringer', 'lderringer@bene', '1731560776', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (527, 'Freddy-Rucker', 'freddyr@timevis', '821845631', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (65, 'Sigourney-Phill', 'sphillips@summi', '1596348976', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (85, 'Sydney-Bean', 'sydney.bean@ufs', '2731996739', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (469, 'Kitty-Kudrow', 'kitty.kudrow@se', '1472519275', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (964, 'Hope-LaSalle', 'hopel@generalmi', '1155589755', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (808, 'Javon-Deschanel', 'javon.deschanel', '1929539443', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (907, 'Rebeka-Cattrall', 'rebeka.cattrall', '2974964442', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (397, 'Oded-Tate', 'oded@capitolban', '1942705101', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (342, 'Ian-Sepulveda', 'ians@spotfireho', '55137777', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (938, 'Roberta-Roberts', 'robertar@ubp.za', '1768462700', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (738, 'Dabney-Perrinea', 'dabney.p@whitew', '1255527002', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (571, 'Tal-Romijn-Stam', 'tal.romijnstamo', '3684615271', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (677, 'Johnny-Branagh', 'j.branagh@nexxt', '2536970542', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (175, 'Geena-Whitman', 'geena.whitman@c', '1440475633', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (89, 'Freddie-Peet', 'freddie.peet@aq', '1243683319', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (482, 'Isaac-Dalley', 'isaac@gsat.com', '1621455800', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (746, 'Kyra-Garza', 'kyra@iss.ca', '4153835807', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (965, 'Gloria-Kier', 'gkier@smartroni', '4277127489', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (40, 'Juan-Lucas', 'j.lucas@tama.de', '506958119', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (985, 'Rosco-Frampton', 'rosco.frampton@', '1050257418', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (332, 'Marley-Numan', 'marley.numan@so', '2865209163', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (555, 'Brenda-Tyler', 'btyler@ciwservi', '1179663847', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (523, 'Juan-Connery', 'juan.c@data.fr', '2005505656', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (32, 'Lili-Singh', 'lili.singh@vms.', '3649629659', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (798, 'Loren-Peniston', 'loren.p@sfgo.ca', '1861052875', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (113, 'Keith-Pepper', 'keith.pepper@pr', '4069388170', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (701, 'Lionel-Union', 'lionel@dillards', '2030966712', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (194, 'Molly-Green', 'molly@clorox.fi', '3866383896', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (105, 'Mindy-Myers', 'mindy.myers@ari', '2536523912', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (298, 'Joely-Albright', 'joely.a@ubp.de', '2728929836', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (660, 'Geoff-Numan', 'geoff.numan@sta', '1847243041', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (265, 'Vern-Sarsgaard', 'vern.sarsgaard@', '2118659549', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (830, 'Mena-Kweller', 'mena.k@kitba.co', '2651355106', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (201, 'Jim-Schwarzeneg', 'jim.s@tama.ch', '1068780418', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (764, 'Ani-Sweet', 'ani.sweet@eastm', '3292937838', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (328, 'Dylan-Favreau', 'dylan.favreau@m', '3448773387', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (794, 'Christopher-Hol', 'christopher@aoe', '1937144760', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (931, 'Chuck-Hiatt', 'chuck.hiatt@nor', '2124018733', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (462, 'Armin-Olin', 'armin.olin@joll', '2686232973', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (415, 'Olga-Goodall', 'olga.goodall@ar', '1174497826', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (167, 'Andrew-Daniels', 'andrewd@gagwear', '971733588', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (603, 'Sigourney-Wooda', 'sigourney.w@sol', '4232171588', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (977, 'Joanna-Coverdal', 'joanna.c@team.c', '4113323463', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (729, 'Aida-Perlman', 'aida.perlman@ca', '1602615407', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (497, 'Lynette-McDonal', 'lynette.mcdonal', '3534369884', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (5, 'Nicolas-Keaton', 'nicolas.keaton@', '1929378273', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (137, 'Kiefer-Lennox', 'kiefer.lennox@z', '1678542245', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (72, 'Suzanne-William', 'swilliamson@ass', '1636716192', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (405, 'Michael-Holbroo', 'michaelh@faef.d', '707738883', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (120, 'Lauren-Short', 'lauren.short@ti', '4153236284', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (672, 'Mac-Clarkson', 'mac.clarkson@mc', '3412583186', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (557, 'Lisa-Humphrey', 'lisa.humphrey@g', '1190241922', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (914, 'Catherine-Voigh', 'catherine.voigh', '755017234', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (780, 'Jeffery-Jessee', 'jeffery@fpf.com', '1120525873', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (503, 'Victor-Copeland', 'victor.copeland', '2542669515', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (374, 'Albertina-Roth', 'albertina.roth@', '3814200202', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (828, 'Marley-Armatrad', 'marley.armatrad', '631747546', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (608, 'Moe-Weaver', 'm.weaver@tropic', '3123465756', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (486, 'Darius-Hector', 'darius.hector@w', '4048366738', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (858, 'Kylie-Hannah', 'khannah@nsd.uk', '686745645', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (984, 'Arturo-Lawrence', 'arturo@ataservi', '2412447104', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (935, 'Bobbi-Sawa', 'bobbi.sawa@univ', '551178982', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (949, 'Blair-Briscoe', 'blair.briscoe@s', '3656062995', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (498, 'Carole-Dillane', 'c.dillane@kello', '2808736567', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (434, 'Barry-Colon', 'barry.colon@ape', '2142183790', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (849, 'Matt-Stigers', 'm.stigers@cis.c', '1319605181', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (36, 'Pam-Deejay', 'pam.deejay@cata', '2564457421', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (367, 'Carrie-Anne-Rai', 'crain@accuship.', '890380862', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (390, 'Thin-Cattrall', 'thin.cattrall@k', '2383339312', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (21, 'Mel-Womack', 'mel.womack@worl', '2072319453', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (64, 'Jay-Lavigne', 'jay.lavigne@sm.', '1460552962', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (566, 'Lenny-Cook', 'lenny.cook@pra.', '1043731008', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (383, 'Roberta-Hobson', 'r.hobson@infini', '1697528263', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (534, 'Yolanda-Morriso', 'yolanda@telepoi', '2567153947', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (213, 'Raymond-Skarsga', 'rskarsgard@mont', '8163302', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (270, 'Juliette-Hayes', 'juliette.hayes@', '3131292085', null);
commit;
prompt 600 records committed...
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (444, 'Kevn-Warden', 'kevn.w@digitalm', '1369713939', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (236, 'Emma-Moraz', 'emma.moraz@staf', '1801105643', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (156, 'Brothers-Karyo', 'bkaryo@vspan.br', '582483459', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (472, 'Ivan-Fiorentino', 'i.fiorentino@pr', '786433786', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (622, 'Wes-Santana', 'wess@gagwear.pt', '706996003', null);
insert into CUSTOMER (cid, cname, cemail, cphone, bdate)
values (854, 'Vince-Faithfull', 'vince@networkdi', '2669702203', null);
commit;
prompt 606 records loaded
prompt Loading DRESS...
insert into DRESS (did, length, color, price)
values (280, 173, 'Khaki', 571);
insert into DRESS (did, length, color, price)
values (336, 186, 'Orange', 701);
insert into DRESS (did, length, color, price)
values (523, 106, 'Khaki', 570);
insert into DRESS (did, length, color, price)
values (705, 171, 'Red', 980);
insert into DRESS (did, length, color, price)
values (617, 172, 'Indigo', 961);
insert into DRESS (did, length, color, price)
values (769, 101, 'Crimson', 270);
insert into DRESS (did, length, color, price)
values (396, 141, 'Purple', 181);
insert into DRESS (did, length, color, price)
values (384, 151, 'Red', 896);
insert into DRESS (did, length, color, price)
values (697, 133, 'Aquamarine', 719);
insert into DRESS (did, length, color, price)
values (137, 108, 'Khaki', 731);
insert into DRESS (did, length, color, price)
values (200, 178, 'Aquamarine', 895);
insert into DRESS (did, length, color, price)
values (64, 106, 'Maroon', 800);
insert into DRESS (did, length, color, price)
values (9, 118, 'Aquamarine', 808);
insert into DRESS (did, length, color, price)
values (195, 120, 'Red', 990);
insert into DRESS (did, length, color, price)
values (58, 169, 'Red', 555);
insert into DRESS (did, length, color, price)
values (513, 114, 'Maroon', 436);
insert into DRESS (did, length, color, price)
values (914, 141, 'Mauv', 836);
insert into DRESS (did, length, color, price)
values (912, 141, 'Purple', 747);
insert into DRESS (did, length, color, price)
values (576, 149, 'Orange', 329);
insert into DRESS (did, length, color, price)
values (284, 170, 'Purple', 864);
insert into DRESS (did, length, color, price)
values (629, 178, 'Indigo', 364);
insert into DRESS (did, length, color, price)
values (642, 138, 'Blue', 899);
insert into DRESS (did, length, color, price)
values (817, 182, 'Blue', 646);
insert into DRESS (did, length, color, price)
values (383, 187, 'Orange', 506);
insert into DRESS (did, length, color, price)
values (39, 100, 'Puce', 559);
insert into DRESS (did, length, color, price)
values (501, 153, 'Violet', 809);
insert into DRESS (did, length, color, price)
values (424, 155, 'Fuscia', 579);
insert into DRESS (did, length, color, price)
values (73, 186, 'Crimson', 308);
insert into DRESS (did, length, color, price)
values (552, 130, 'Violet', 742);
insert into DRESS (did, length, color, price)
values (335, 181, 'Yellow', 660);
insert into DRESS (did, length, color, price)
values (468, 167, 'Turquoise', 758);
insert into DRESS (did, length, color, price)
values (489, 178, 'Purple', 370);
insert into DRESS (did, length, color, price)
values (988, 122, 'Mauv', 705);
insert into DRESS (did, length, color, price)
values (564, 181, 'Yellow', 968);
insert into DRESS (did, length, color, price)
values (451, 187, 'Orange', 767);
insert into DRESS (did, length, color, price)
values (743, 153, 'Teal', 258);
insert into DRESS (did, length, color, price)
values (690, 178, 'Khaki', 904);
insert into DRESS (did, length, color, price)
values (437, 135, 'Khaki', 500);
insert into DRESS (did, length, color, price)
values (422, 140, 'Green', 792);
insert into DRESS (did, length, color, price)
values (135, 110, 'Fuscia', 189);
insert into DRESS (did, length, color, price)
values (571, 171, 'Red', 808);
insert into DRESS (did, length, color, price)
values (281, 109, 'Crimson', 731);
insert into DRESS (did, length, color, price)
values (677, 115, 'Teal', 940);
insert into DRESS (did, length, color, price)
values (215, 153, 'Orange', 468);
insert into DRESS (did, length, color, price)
values (725, 177, 'Aquamarine', 943);
insert into DRESS (did, length, color, price)
values (487, 162, 'Turquoise', 518);
insert into DRESS (did, length, color, price)
values (744, 124, 'Turquoise', 700);
insert into DRESS (did, length, color, price)
values (859, 112, 'Teal', 992);
insert into DRESS (did, length, color, price)
values (943, 128, 'Pink', 495);
insert into DRESS (did, length, color, price)
values (49, 120, 'Orange', 523);
insert into DRESS (did, length, color, price)
values (638, 189, 'Blue', 759);
insert into DRESS (did, length, color, price)
values (86, 117, 'Goldenrod', 647);
insert into DRESS (did, length, color, price)
values (586, 128, 'Red', 108);
insert into DRESS (did, length, color, price)
values (428, 172, 'Teal', 158);
insert into DRESS (did, length, color, price)
values (993, 168, 'Blue', 126);
insert into DRESS (did, length, color, price)
values (406, 128, 'Orange', 938);
insert into DRESS (did, length, color, price)
values (555, 123, 'Pink', 277);
insert into DRESS (did, length, color, price)
values (950, 161, 'Turquoise', 601);
insert into DRESS (did, length, color, price)
values (843, 187, 'Fuscia', 568);
insert into DRESS (did, length, color, price)
values (680, 132, 'Pink', 805);
insert into DRESS (did, length, color, price)
values (894, 158, 'Red', 282);
insert into DRESS (did, length, color, price)
values (890, 188, 'Orange', 162);
insert into DRESS (did, length, color, price)
values (621, 179, 'Khaki', 608);
insert into DRESS (did, length, color, price)
values (865, 121, 'Pink', 331);
insert into DRESS (did, length, color, price)
values (896, 115, 'Goldenrod', 552);
insert into DRESS (did, length, color, price)
values (855, 156, 'Green', 815);
insert into DRESS (did, length, color, price)
values (301, 131, 'Mauv', 446);
insert into DRESS (did, length, color, price)
values (936, 128, 'Yellow', 650);
insert into DRESS (did, length, color, price)
values (197, 144, 'Turquoise', 614);
insert into DRESS (did, length, color, price)
values (27, 157, 'Purple', 210);
insert into DRESS (did, length, color, price)
values (246, 167, 'Orange', 658);
insert into DRESS (did, length, color, price)
values (57, 137, 'Violet', 843);
insert into DRESS (did, length, color, price)
values (937, 106, 'Puce', 985);
insert into DRESS (did, length, color, price)
values (902, 118, 'Crimson', 638);
insert into DRESS (did, length, color, price)
values (84, 180, 'Blue', 377);
insert into DRESS (did, length, color, price)
values (771, 179, 'Khaki', 235);
insert into DRESS (did, length, color, price)
values (544, 142, 'Maroon', 381);
insert into DRESS (did, length, color, price)
values (401, 128, 'Indigo', 584);
insert into DRESS (did, length, color, price)
values (279, 167, 'Green', 410);
insert into DRESS (did, length, color, price)
values (626, 155, 'Green', 317);
insert into DRESS (did, length, color, price)
values (818, 103, 'Purple', 956);
insert into DRESS (did, length, color, price)
values (90, 175, 'Indigo', 703);
insert into DRESS (did, length, color, price)
values (436, 117, 'Orange', 118);
insert into DRESS (did, length, color, price)
values (867, 122, 'Blue', 878);
insert into DRESS (did, length, color, price)
values (125, 138, 'Goldenrod', 631);
insert into DRESS (did, length, color, price)
values (565, 111, 'Blue', 350);
insert into DRESS (did, length, color, price)
values (444, 185, 'Purple', 991);
insert into DRESS (did, length, color, price)
values (927, 132, 'Green', 210);
insert into DRESS (did, length, color, price)
values (342, 101, 'Indigo', 106);
insert into DRESS (did, length, color, price)
values (211, 175, 'Mauv', 454);
insert into DRESS (did, length, color, price)
values (87, 181, 'Fuscia', 490);
insert into DRESS (did, length, color, price)
values (553, 105, 'Blue', 908);
insert into DRESS (did, length, color, price)
values (456, 182, 'Red', 103);
insert into DRESS (did, length, color, price)
values (334, 125, 'Turquoise', 489);
insert into DRESS (did, length, color, price)
values (820, 112, 'Crimson', 890);
insert into DRESS (did, length, color, price)
values (567, 184, 'Goldenrod', 493);
insert into DRESS (did, length, color, price)
values (149, 129, 'Pink', 257);
insert into DRESS (did, length, color, price)
values (356, 180, 'Puce', 194);
insert into DRESS (did, length, color, price)
values (533, 122, 'Aquamarine', 733);
insert into DRESS (did, length, color, price)
values (952, 135, 'Crimson', 943);
commit;
prompt 100 records committed...
insert into DRESS (did, length, color, price)
values (599, 174, 'Puce', 246);
insert into DRESS (did, length, color, price)
values (634, 159, 'Orange', 735);
insert into DRESS (did, length, color, price)
values (525, 122, 'Green', 185);
insert into DRESS (did, length, color, price)
values (373, 120, 'Aquamarine', 212);
insert into DRESS (did, length, color, price)
values (318, 139, 'Violet', 538);
insert into DRESS (did, length, color, price)
values (806, 116, 'Fuscia', 372);
insert into DRESS (did, length, color, price)
values (538, 158, 'Red', 683);
insert into DRESS (did, length, color, price)
values (395, 173, 'Yellow', 169);
insert into DRESS (did, length, color, price)
values (409, 148, 'Violet', 789);
insert into DRESS (did, length, color, price)
values (919, 108, 'Khaki', 114);
insert into DRESS (did, length, color, price)
values (61, 180, 'Goldenrod', 591);
insert into DRESS (did, length, color, price)
values (473, 129, 'Turquoise', 114);
insert into DRESS (did, length, color, price)
values (602, 118, 'Yellow', 627);
insert into DRESS (did, length, color, price)
values (415, 144, 'Violet', 300);
insert into DRESS (did, length, color, price)
values (147, 182, 'Mauv', 105);
insert into DRESS (did, length, color, price)
values (416, 149, 'Teal', 582);
insert into DRESS (did, length, color, price)
values (107, 114, 'Red', 461);
insert into DRESS (did, length, color, price)
values (443, 187, 'Green', 527);
insert into DRESS (did, length, color, price)
values (263, 177, 'Aquamarine', 441);
insert into DRESS (did, length, color, price)
values (296, 121, 'Puce', 254);
insert into DRESS (did, length, color, price)
values (209, 125, 'Pink', 782);
insert into DRESS (did, length, color, price)
values (106, 176, 'Purple', 401);
insert into DRESS (did, length, color, price)
values (288, 144, 'Indigo', 899);
insert into DRESS (did, length, color, price)
values (257, 158, 'Khaki', 613);
insert into DRESS (did, length, color, price)
values (397, 164, 'Crimson', 825);
insert into DRESS (did, length, color, price)
values (458, 142, 'Yellow', 876);
insert into DRESS (did, length, color, price)
values (640, 119, 'Indigo', 151);
insert into DRESS (did, length, color, price)
values (371, 182, 'Aquamarine', 769);
insert into DRESS (did, length, color, price)
values (734, 186, 'Pink', 205);
insert into DRESS (did, length, color, price)
values (591, 113, 'Puce', 422);
insert into DRESS (did, length, color, price)
values (143, 123, 'Crimson', 238);
insert into DRESS (did, length, color, price)
values (506, 178, 'Khaki', 924);
insert into DRESS (did, length, color, price)
values (970, 120, 'Purple', 962);
insert into DRESS (did, length, color, price)
values (823, 143, 'Fuscia', 274);
insert into DRESS (did, length, color, price)
values (98, 132, 'Green', 746);
insert into DRESS (did, length, color, price)
values (340, 106, 'Teal', 151);
insert into DRESS (did, length, color, price)
values (333, 140, 'Maroon', 213);
insert into DRESS (did, length, color, price)
values (266, 180, 'Green', 170);
insert into DRESS (did, length, color, price)
values (853, 161, 'Violet', 924);
insert into DRESS (did, length, color, price)
values (979, 159, 'Yellow', 481);
insert into DRESS (did, length, color, price)
values (685, 153, 'Pink', 336);
insert into DRESS (did, length, color, price)
values (733, 119, 'Puce', 357);
insert into DRESS (did, length, color, price)
values (368, 185, 'Mauv', 742);
insert into DRESS (did, length, color, price)
values (394, 138, 'Aquamarine', 377);
insert into DRESS (did, length, color, price)
values (838, 184, 'Orange', 291);
insert into DRESS (did, length, color, price)
values (156, 138, 'Maroon', 785);
insert into DRESS (did, length, color, price)
values (819, 128, 'Crimson', 831);
insert into DRESS (did, length, color, price)
values (541, 145, 'Blue', 802);
insert into DRESS (did, length, color, price)
values (228, 176, 'Red', 629);
insert into DRESS (did, length, color, price)
values (72, 102, 'Yellow', 960);
insert into DRESS (did, length, color, price)
values (783, 168, 'Fuscia', 434);
insert into DRESS (did, length, color, price)
values (382, 124, 'Teal', 889);
insert into DRESS (did, length, color, price)
values (996, 160, 'Green', 729);
insert into DRESS (did, length, color, price)
values (747, 132, 'Green', 798);
insert into DRESS (did, length, color, price)
values (773, 102, 'Maroon', 747);
insert into DRESS (did, length, color, price)
values (414, 148, 'Puce', 557);
insert into DRESS (did, length, color, price)
values (995, 135, 'Maroon', 763);
insert into DRESS (did, length, color, price)
values (223, 120, 'Indigo', 187);
insert into DRESS (did, length, color, price)
values (459, 162, 'Yellow', 918);
insert into DRESS (did, length, color, price)
values (204, 138, 'Fuscia', 401);
insert into DRESS (did, length, color, price)
values (870, 178, 'Goldenrod', 368);
insert into DRESS (did, length, color, price)
values (438, 176, 'Mauv', 229);
insert into DRESS (did, length, color, price)
values (944, 152, 'Yellow', 107);
insert into DRESS (did, length, color, price)
values (955, 150, 'Teal', 869);
insert into DRESS (did, length, color, price)
values (457, 160, 'Puce', 160);
insert into DRESS (did, length, color, price)
values (732, 138, 'Crimson', 114);
insert into DRESS (did, length, color, price)
values (449, 189, 'Indigo', 533);
insert into DRESS (did, length, color, price)
values (269, 101, 'Red', 768);
insert into DRESS (did, length, color, price)
values (10, 171, 'Red', 559);
insert into DRESS (did, length, color, price)
values (134, 168, 'Fuscia', 815);
insert into DRESS (did, length, color, price)
values (230, 150, 'Turquoise', 723);
insert into DRESS (did, length, color, price)
values (51, 165, 'Red', 249);
insert into DRESS (did, length, color, price)
values (19, 129, 'Khaki', 277);
insert into DRESS (did, length, color, price)
values (231, 162, 'Orange', 699);
insert into DRESS (did, length, color, price)
values (155, 144, 'Aquamarine', 775);
insert into DRESS (did, length, color, price)
values (174, 151, 'Goldenrod', 481);
insert into DRESS (did, length, color, price)
values (387, 130, 'Turquoise', 930);
insert into DRESS (did, length, color, price)
values (980, 189, 'Red', 446);
insert into DRESS (did, length, color, price)
values (623, 118, 'Blue', 760);
insert into DRESS (did, length, color, price)
values (173, 105, 'Puce', 367);
insert into DRESS (did, length, color, price)
values (1, 107, 'Indigo', 596);
insert into DRESS (did, length, color, price)
values (517, 100, 'Turquoise', 361);
insert into DRESS (did, length, color, price)
values (210, 130, 'Aquamarine', 508);
insert into DRESS (did, length, color, price)
values (213, 177, 'Khaki', 149);
insert into DRESS (did, length, color, price)
values (562, 168, 'Green', 321);
insert into DRESS (did, length, color, price)
values (270, 117, 'Teal', 215);
insert into DRESS (did, length, color, price)
values (997, 190, 'Orange', 111);
insert into DRESS (did, length, color, price)
values (846, 111, 'Indigo', 664);
insert into DRESS (did, length, color, price)
values (949, 152, 'Khaki', 445);
insert into DRESS (did, length, color, price)
values (16, 126, 'Violet', 532);
insert into DRESS (did, length, color, price)
values (829, 161, 'Fuscia', 356);
insert into DRESS (did, length, color, price)
values (784, 112, 'Purple', 665);
insert into DRESS (did, length, color, price)
values (326, 147, 'Purple', 295);
insert into DRESS (did, length, color, price)
values (88, 158, 'Green', 118);
insert into DRESS (did, length, color, price)
values (347, 182, 'Mauv', 917);
insert into DRESS (did, length, color, price)
values (399, 179, 'Crimson', 806);
insert into DRESS (did, length, color, price)
values (133, 132, 'Orange', 289);
insert into DRESS (did, length, color, price)
values (717, 107, 'Teal', 561);
insert into DRESS (did, length, color, price)
values (169, 117, 'Khaki', 558);
insert into DRESS (did, length, color, price)
values (895, 158, 'Yellow', 297);
commit;
prompt 200 records committed...
insert into DRESS (did, length, color, price)
values (749, 181, 'Turquoise', 575);
insert into DRESS (did, length, color, price)
values (947, 126, 'Yellow', 343);
insert into DRESS (did, length, color, price)
values (302, 108, 'Red', 153);
insert into DRESS (did, length, color, price)
values (167, 102, 'Green', 505);
insert into DRESS (did, length, color, price)
values (736, 118, 'Pink', 847);
insert into DRESS (did, length, color, price)
values (946, 139, 'Blue', 536);
insert into DRESS (did, length, color, price)
values (256, 132, 'Pink', 800);
insert into DRESS (did, length, color, price)
values (431, 112, 'Turquoise', 882);
insert into DRESS (did, length, color, price)
values (573, 182, 'Turquoise', 475);
insert into DRESS (did, length, color, price)
values (32, 134, 'Indigo', 308);
insert into DRESS (did, length, color, price)
values (875, 138, 'Turquoise', 783);
insert into DRESS (did, length, color, price)
values (647, 100, 'Crimson', 322);
insert into DRESS (did, length, color, price)
values (4, 112, 'Green', 210);
insert into DRESS (did, length, color, price)
values (45, 116, 'Blue', 129);
insert into DRESS (did, length, color, price)
values (754, 136, 'Blue', 332);
insert into DRESS (did, length, color, price)
values (942, 143, 'Mauv', 485);
insert into DRESS (did, length, color, price)
values (466, 128, 'Red', 242);
insert into DRESS (did, length, color, price)
values (82, 104, 'Aquamarine', 573);
insert into DRESS (did, length, color, price)
values (227, 120, 'Mauv', 563);
insert into DRESS (did, length, color, price)
values (989, 113, 'Fuscia', 225);
insert into DRESS (did, length, color, price)
values (303, 164, 'Goldenrod', 624);
insert into DRESS (did, length, color, price)
values (153, 149, 'Maroon', 586);
insert into DRESS (did, length, color, price)
values (366, 169, 'Aquamarine', 141);
insert into DRESS (did, length, color, price)
values (50, 185, 'Crimson', 536);
insert into DRESS (did, length, color, price)
values (275, 104, 'Yellow', 565);
insert into DRESS (did, length, color, price)
values (140, 179, 'Khaki', 286);
insert into DRESS (did, length, color, price)
values (328, 143, 'Turquoise', 749);
insert into DRESS (did, length, color, price)
values (268, 178, 'Crimson', 161);
insert into DRESS (did, length, color, price)
values (25, 122, 'Red', 869);
insert into DRESS (did, length, color, price)
values (528, 133, 'Purple', 339);
insert into DRESS (did, length, color, price)
values (879, 169, 'Yellow', 845);
insert into DRESS (did, length, color, price)
values (845, 129, 'Turquoise', 168);
insert into DRESS (did, length, color, price)
values (402, 146, 'Puce', 669);
insert into DRESS (did, length, color, price)
values (329, 116, 'Yellow', 706);
insert into DRESS (did, length, color, price)
values (112, 114, 'Puce', 579);
insert into DRESS (did, length, color, price)
values (620, 182, 'Purple', 112);
insert into DRESS (did, length, color, price)
values (657, 183, 'Orange', 351);
insert into DRESS (did, length, color, price)
values (13, 139, 'Yellow', 593);
insert into DRESS (did, length, color, price)
values (80, 189, 'Green', 535);
insert into DRESS (did, length, color, price)
values (886, 168, 'Puce', 174);
insert into DRESS (did, length, color, price)
values (188, 140, 'Blue', 674);
insert into DRESS (did, length, color, price)
values (247, 187, 'Green', 835);
insert into DRESS (did, length, color, price)
values (376, 166, 'Pink', 927);
insert into DRESS (did, length, color, price)
values (63, 165, 'Aquamarine', 210);
insert into DRESS (did, length, color, price)
values (372, 103, 'Aquamarine', 751);
insert into DRESS (did, length, color, price)
values (226, 102, 'Maroon', 367);
insert into DRESS (did, length, color, price)
values (665, 118, 'Puce', 284);
insert into DRESS (did, length, color, price)
values (14, 135, 'Aquamarine', 465);
insert into DRESS (did, length, color, price)
values (240, 151, 'Mauv', 112);
insert into DRESS (did, length, color, price)
values (994, 108, 'Red', 866);
insert into DRESS (did, length, color, price)
values (312, 174, 'Teal', 566);
insert into DRESS (did, length, color, price)
values (718, 134, 'Yellow', 850);
insert into DRESS (did, length, color, price)
values (96, 174, 'Yellow', 547);
insert into DRESS (did, length, color, price)
values (866, 165, 'Maroon', 136);
insert into DRESS (did, length, color, price)
values (959, 166, 'Goldenrod', 172);
insert into DRESS (did, length, color, price)
values (559, 105, 'Purple', 224);
insert into DRESS (did, length, color, price)
values (826, 154, 'Green', 348);
insert into DRESS (did, length, color, price)
values (159, 167, 'Blue', 263);
insert into DRESS (did, length, color, price)
values (47, 130, 'Crimson', 361);
insert into DRESS (did, length, color, price)
values (187, 166, 'Aquamarine', 677);
insert into DRESS (did, length, color, price)
values (877, 117, 'Maroon', 567);
insert into DRESS (did, length, color, price)
values (574, 179, 'Fuscia', 366);
insert into DRESS (did, length, color, price)
values (67, 155, 'Goldenrod', 912);
insert into DRESS (did, length, color, price)
values (479, 137, 'Maroon', 147);
insert into DRESS (did, length, color, price)
values (419, 133, 'Violet', 700);
insert into DRESS (did, length, color, price)
values (292, 143, 'Purple', 565);
insert into DRESS (did, length, color, price)
values (526, 126, 'Violet', 944);
insert into DRESS (did, length, color, price)
values (508, 122, 'Khaki', 617);
insert into DRESS (did, length, color, price)
values (476, 156, 'Khaki', 602);
insert into DRESS (did, length, color, price)
values (671, 155, 'Orange', 471);
insert into DRESS (did, length, color, price)
values (713, 187, 'Maroon', 963);
insert into DRESS (did, length, color, price)
values (921, 179, 'Orange', 551);
insert into DRESS (did, length, color, price)
values (824, 175, 'Mauv', 902);
insert into DRESS (did, length, color, price)
values (848, 103, 'Violet', 913);
insert into DRESS (did, length, color, price)
values (928, 100, 'Crimson', 463);
insert into DRESS (did, length, color, price)
values (926, 107, 'Violet', 499);
insert into DRESS (did, length, color, price)
values (761, 136, 'Aquamarine', 907);
insert into DRESS (did, length, color, price)
values (309, 177, 'Goldenrod', 519);
insert into DRESS (did, length, color, price)
values (219, 148, 'Pink', 981);
insert into DRESS (did, length, color, price)
values (532, 111, 'Puce', 484);
insert into DRESS (did, length, color, price)
values (563, 181, 'Red', 575);
insert into DRESS (did, length, color, price)
values (635, 144, 'Puce', 333);
insert into DRESS (did, length, color, price)
values (507, 163, 'Yellow', 440);
insert into DRESS (did, length, color, price)
values (898, 133, 'Maroon', 941);
insert into DRESS (did, length, color, price)
values (658, 130, 'Goldenrod', 775);
insert into DRESS (did, length, color, price)
values (756, 187, 'Puce', 726);
insert into DRESS (did, length, color, price)
values (369, 190, 'Maroon', 999);
insert into DRESS (did, length, color, price)
values (798, 151, 'Blue', 490);
insert into DRESS (did, length, color, price)
values (362, 129, 'Teal', 222);
insert into DRESS (did, length, color, price)
values (693, 161, 'Crimson', 745);
insert into DRESS (did, length, color, price)
values (596, 109, 'Blue', 313);
insert into DRESS (did, length, color, price)
values (675, 180, 'Goldenrod', 413);
insert into DRESS (did, length, color, price)
values (365, 140, 'Fuscia', 304);
insert into DRESS (did, length, color, price)
values (453, 142, 'Aquamarine', 299);
insert into DRESS (did, length, color, price)
values (277, 119, 'Crimson', 300);
insert into DRESS (did, length, color, price)
values (447, 125, 'Orange', 295);
insert into DRESS (did, length, color, price)
values (276, 104, 'Crimson', 751);
insert into DRESS (did, length, color, price)
values (920, 113, 'Pink', 334);
insert into DRESS (did, length, color, price)
values (297, 100, 'Mauv', 355);
insert into DRESS (did, length, color, price)
values (662, 170, 'Fuscia', 813);
commit;
prompt 300 records committed...
insert into DRESS (did, length, color, price)
values (885, 176, 'Aquamarine', 800);
insert into DRESS (did, length, color, price)
values (199, 160, 'Orange', 999);
insert into DRESS (did, length, color, price)
values (352, 105, 'Mauv', 966);
insert into DRESS (did, length, color, price)
values (619, 133, 'Teal', 269);
insert into DRESS (did, length, color, price)
values (184, 121, 'Aquamarine', 344);
insert into DRESS (did, length, color, price)
values (847, 129, 'Maroon', 587);
insert into DRESS (did, length, color, price)
values (308, 132, 'Crimson', 839);
insert into DRESS (did, length, color, price)
values (482, 102, 'Aquamarine', 856);
insert into DRESS (did, length, color, price)
values (282, 114, 'Indigo', 836);
insert into DRESS (did, length, color, price)
values (698, 163, 'Purple', 384);
insert into DRESS (did, length, color, price)
values (750, 133, 'Turquoise', 130);
insert into DRESS (did, length, color, price)
values (361, 143, 'Maroon', 450);
insert into DRESS (did, length, color, price)
values (956, 169, 'Turquoise', 315);
insert into DRESS (did, length, color, price)
values (499, 148, 'Puce', 887);
insert into DRESS (did, length, color, price)
values (510, 106, 'Puce', 740);
insert into DRESS (did, length, color, price)
values (460, 116, 'Puce', 653);
insert into DRESS (did, length, color, price)
values (320, 158, 'Orange', 766);
insert into DRESS (did, length, color, price)
values (589, 108, 'Purple', 835);
insert into DRESS (did, length, color, price)
values (95, 143, 'Violet', 510);
insert into DRESS (did, length, color, price)
values (321, 130, 'Teal', 829);
insert into DRESS (did, length, color, price)
values (922, 190, 'Teal', 440);
insert into DRESS (did, length, color, price)
values (953, 185, 'Purple', 774);
insert into DRESS (did, length, color, price)
values (161, 104, 'Puce', 538);
insert into DRESS (did, length, color, price)
values (289, 113, 'Turquoise', 841);
insert into DRESS (did, length, color, price)
values (446, 101, 'Maroon', 116);
insert into DRESS (did, length, color, price)
values (529, 123, 'Violet', 181);
insert into DRESS (did, length, color, price)
values (425, 162, 'Purple', 640);
insert into DRESS (did, length, color, price)
values (102, 169, 'Pink', 343);
insert into DRESS (did, length, color, price)
values (130, 120, 'Indigo', 423);
commit;
prompt 329 records loaded
prompt Loading EMPLOYEE...
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (611, 'Linda', 'L@example.com', '053344279');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (619, 'Maddie', 'M@example.com', '052774746');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (627, 'Megan', 'M@example.com', '056045316');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (636, 'Nick', 'N@example.com', '051377582');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (644, 'Pam', 'P@example.com', '053281175');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (652, 'Randy', 'R@example.com', '051149358');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (660, 'Louis', 'L@example.com', '058106437');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (668, 'Scott', 'S@example.com', '054241362');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (676, 'Steve', 'S@example.com', '058065494');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (684, 'Tom', 'T@example.com', '055521028');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (692, 'Will', 'W@example.com', '056631546');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (500, 'Louis', 'L@example.com', '052576709');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (507, 'Alvin', 'A@example.com', '054587736');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (515, 'Avery', 'A@example.com', '059895428');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (523, 'Bruce', 'B@example.com', '057181473');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (531, 'Cindy', 'C@example.com', '055230891');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (612, 'Lisa', 'L@example.com', '051161508');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (582, 'Edwin', 'E@example.com', '055054728');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (657, 'Louis', 'L@example.com', '054448619');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (521, 'Brett', 'B@example.com', '056420388');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (666, 'Sam', 'S@example.com', '051392849');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (635, 'Nelly', 'N@example.com', '055051004');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (637, 'Nikki', 'N@example.com', '052227239');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (638, 'Nina', 'N@example.com', '058787265');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (639, 'Noah', 'N@example.com', '055386827');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (640, 'Nora', 'N@example.com', '057955681');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (641, 'Louis', 'L@example.com', '058133814');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (642, 'Oscar', 'O@example.com', '054827373');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (643, 'Louis', 'L@example.com', '051862531');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (645, 'Paula', 'P@example.com', '055873909');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (646, 'Pearl', 'P@example.com', '052045258');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (647, 'Penny', 'P@example.com', '058358402');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (648, 'Peter', 'P@example.com', '051504733');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (649, 'Phil', 'P@example.com', '053432307');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (650, 'Polly', 'P@example.com', '054310048');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (651, 'Quinn', 'Q@example.com', '056597226');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (653, 'Ray', 'R@example.com', '053366538');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (654, 'Reese', 'R@example.com', '059250894');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (655, 'Renee', 'R@example.com', '055466954');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (656, 'Rhys', 'R@example.com', '057172389');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (658, 'Riley', 'R@example.com', '059411011');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (659, 'Robin', 'R@example.com', '059065967');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (101, ' ''Alice Smith''', ' ''alice@ex.com''', ' ''050-123-0101''');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (102, ' ''Bob Johnson''', ' ''bob@ex.com''', ' ''050-123-0102''');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (104, ' ''Diana King''', ' ''diana@ex.com''', ' ''050-123-0104''');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (106, ' ''Fiona Brown''', ' ''fiona@ex.com''', ' ''050-123-0106''');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (109, ' ''Ian Clark''', ' ''ian@ex.com''', ' ''050-123-0109''');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (110, ' ''Julia Lewis''', ' ''julia@ex.com''', ' ''050-123-0110''');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (534, 'Craig', 'C@example.com', '056451601');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (535, 'Craig', 'C@example.com', '058323076');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (536, 'Craig', 'C@example.com', '053556992');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (537, 'Craig', 'C@example.com', '057063504');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (538, 'Craig', 'C@example.com', '057584486');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (539, 'Derek', 'D@example.com', '055440314');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (540, 'Diana', 'D@example.com', '051116956');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (541, 'Diane', 'D@example.com', '059328497');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (542, 'Dolly', 'D@example.com', '054924139');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (543, 'Donna', 'D@example.com', '051969236');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (544, 'Doris', 'D@example.com', '056168025');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (545, 'Drew', 'D@example.com', '057198814');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (546, 'Dolly', 'D@example.com', '053488399');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (547, 'Dolly', 'D@example.com', '051483577');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (548, 'Edith', 'E@example.com', '054770733');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (549, 'Edwin', 'E@example.com', '053768622');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (550, 'Elena', 'E@example.com', '052548489');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (551, 'Eli', 'E@example.com', '059835863');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (552, 'Ellie', 'E@example.com', '058210239');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (553, 'Elton', 'E@example.com', '057438299');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (554, 'Emily', 'E@example.com', '054694991');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (555, 'Emma', 'E@example.com', '059087195');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (556, 'Erica', 'E@example.com', '056790474');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (557, 'Erin', 'E@example.com', '057882429');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (558, 'Edwin', 'E@example.com', '058782578');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (559, 'Fiona', 'F@example.com', '059653667');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (560, 'Flora', 'F@example.com', '055125700');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (561, 'Frank', 'F@example.com', '051425548');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (562, 'Fred', 'F@example.com', '051750738');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (563, 'Gabe', 'G@example.com', '059473373');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (564, 'Gavin', 'G@example.com', '051507296');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (565, 'Grace', 'G@example.com', '052081203');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (566, 'Grant', 'G@example.com', '055650677');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (567, 'Greg', 'G@example.com', '053661121');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (568, 'Gwen', 'G@example.com', '059370947');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (569, 'Haley', 'H@example.com', '051373913');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (570, 'Hank', 'H@example.com', '054636886');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (571, 'Helen', 'H@example.com', '059920150');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (572, 'Henry', 'H@example.com', '051343020');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (573, 'Holly', 'H@example.com', '059218082');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (574, 'Isaac', 'I@example.com', '051420647');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (575, 'Ivy', 'I@example.com', '056688264');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (576, 'Jamie', 'J@example.com', '052214538');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (577, 'James', 'J@example.com', '058261540');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (578, 'Jamie', 'J@example.com', '057551953');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (579, 'Jane', 'J@example.com', '054020062');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (580, 'Jared', 'J@example.com', '052840668');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (581, 'Jason', 'J@example.com', '058893394');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (583, 'Jenna', 'J@example.com', '059349780');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (584, 'Jenny', 'J@example.com', '052620480');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (585, 'Jesse', 'J@example.com', '053658562');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (586, 'Jill', 'J@example.com', '059257788');
commit;
prompt 100 records committed...
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (587, 'Jimmy', 'J@example.com', '051325049');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (588, 'Joan', 'J@example.com', '055678905');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (589, 'Jodie', 'J@example.com', '059821400');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (590, 'Joe', 'J@example.com', '055234179');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (591, 'Joel', 'J@example.com', '057976745');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (592, 'John', 'J@example.com', '057682692');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (593, 'Jonah', 'J@example.com', '057489052');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (594, 'Joni', 'J@example.com', '058335224');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (595, 'Judy', 'J@example.com', '054913688');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (596, 'Julia', 'J@example.com', '051624252');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (597, 'Julie', 'J@example.com', '051409701');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (598, 'Justin', 'J@example.com', '059574816');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (599, 'Karen', 'K@example.com', '054630357');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (600, 'Kate', 'K@example.com', '055538973');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (601, 'Kathy', 'K@example.com', '057572727');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (602, 'Kayla', 'K@example.com', '057125286');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (604, 'Kelly', 'K@example.com', '051403728');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (605, 'Kevin', 'K@example.com', '055113753');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (606, 'Kim', 'K@example.com', '052986705');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (607, 'Kyle', 'K@example.com', '052969136');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (608, 'Laura', 'L@example.com', '056524128');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (609, 'Leila', 'L@example.com', '059424777');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (610, 'Liam', 'L@example.com', '055699840');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (613, 'Liz', 'L@example.com', '052246944');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (614, 'Logan', 'L@example.com', '053107258');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (615, 'Louis', 'L@example.com', '058631142');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (616, 'Lucy', 'L@example.com', '056775825');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (617, 'Lydia', 'L@example.com', '058132358');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (618, 'Jamie', 'J@example.com', '052274149');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (620, 'Jamie', 'J@example.com', '057784261');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (621, 'Mandy', 'M@example.com', '059683336');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (622, 'Maria', 'M@example.com', '052075787');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (623, 'Marie', 'M@example.com', '055152279');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (624, 'Mark', 'M@example.com', '051328697');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (625, 'Mason', 'M@example.com', '056315383');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (626, 'Matt', 'M@example.com', '053627423');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (628, 'Mel', 'M@example.com', '051343814');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (629, 'Mia', 'M@example.com', '056860000');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (630, 'Mike', 'M@example.com', '058709137');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (631, 'Molly', 'M@example.com', '058550574');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (632, 'Nancy', 'N@example.com', '051544403');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (633, 'Naomi', 'N@example.com', '051752721');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (634, 'Nell', 'N@example.com', '058792899');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (661, 'Rosa', 'R@example.com', '051952949');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (662, 'Rose', 'R@example.com', '056725084');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (663, 'Ruby', 'R@example.com', '053202240');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (664, 'Ryan', 'R@example.com', '054974171');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (665, 'Sally', 'S@example.com', '052398975');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (667, 'Sarah', 'S@example.com', '056281865');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (669, 'Sean', 'S@example.com', '055675861');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (670, 'Seth', 'S@example.com', '051948131');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (671, 'Shane', 'S@example.com', '055866473');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (672, 'Shawn', 'S@example.com', '051779605');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (673, 'Simon', 'S@example.com', '057020140');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (674, 'Sonia', 'S@example.com', '057751367');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (675, 'Stacy', 'S@example.com', '058212043');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (677, 'Louis', 'L@example.com', '051086669');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (678, 'Sybil', 'S@example.com', '059202625');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (679, 'Terry', 'T@example.com', '051241073');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (680, 'Tim', 'T@example.com', '053458516');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (681, 'Louis', 'L@example.com', '057638356');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (682, 'Toby', 'T@example.com', '054006268');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (683, 'Todd', 'T@example.com', '053319407');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (685, 'Tony', 'T@example.com', '056142664');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (686, 'Tracy', 'T@example.com', '051188070');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (687, 'Tyler', 'T@example.com', '054508093');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (688, 'Vera', 'V@example.com', '058462326');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (689, 'Vicky', 'V@example.com', '056925924');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (690, 'Vince', 'V@example.com', '058681921');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (691, 'Wendy', 'W@example.com', '052878317');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (693, 'Willa', 'W@example.com', '055810769');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (694, 'Louis', 'L@example.com', '054032390');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (695, 'Yara', 'Y@example.com', '058120149');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (696, 'Louis', 'L@example.com', '057616542');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (697, 'Yvonne', 'Y@example.com', '052497352');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (698, 'Zack', 'Z@example.com', '057477805');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (699, 'Zoe', 'Z@example.com', '051995141');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (501, 'Abby', 'A@example.com', '059025176');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (502, 'Adam', 'A@example.com', '053626213');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (503, 'Alan', 'A@example.com', '055069131');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (504, 'Alex', 'A@example.com', '051062689');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (505, 'Alice', 'A@example.com', '058903811');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (506, 'Allie', 'A@example.com', '054000289');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (508, 'Andy', 'A@example.com', '055606978');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (509, 'Amy', 'A@example.com', '057882671');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (510, 'Andy', 'A@example.com', '053625277');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (511, 'Anna', 'A@example.com', '059257301');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (512, 'Annie', 'A@example.com', '058445071');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (513, 'April', 'A@example.com', '059707358');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (514, 'Ariel', 'A@example.com', '053673380');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (516, 'Bella', 'B@example.com', '056768563');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (517, 'Ben', 'B@example.com', '054235584');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (518, 'Benny', 'B@example.com', '056372807');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (519, 'Bill', 'B@example.com', '052570301');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (520, 'Blake', 'B@example.com', '051609620');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (522, 'Brian', 'B@example.com', '057360458');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (524, 'Andy', 'A@example.com', '053919105');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (525, 'Carla', 'C@example.com', '057528294');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (526, 'Carol', 'C@example.com', '057878872');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (527, 'Casey', 'C@example.com', '055407006');
commit;
prompt 200 records committed...
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (528, 'Cathy', 'C@example.com', '055080558');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (529, 'Chad', 'C@example.com', '059784940');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (530, 'Andy', 'A@example.com', '055431365');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (532, 'Clara', 'C@example.com', '054402015');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (533, 'Andy', 'A@example.com', '053292404');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (603, 'Keith', 'K@example.com', '053445482');
commit;
prompt 206 records loaded
prompt Loading EMPLOYEESHOP...
insert into EMPLOYEESHOP (employeeid)
values (101);
insert into EMPLOYEESHOP (employeeid)
values (102);
insert into EMPLOYEESHOP (employeeid)
values (104);
insert into EMPLOYEESHOP (employeeid)
values (106);
insert into EMPLOYEESHOP (employeeid)
values (109);
insert into EMPLOYEESHOP (employeeid)
values (110);
commit;
prompt 6 records loaded
prompt Loading ORDERS...
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (560, to_date('01-11-2023', 'dd-mm-yyyy'), to_date('04-10-2023', 'dd-mm-yyyy'), 101, 853, 316, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (278, to_date('08-02-2023', 'dd-mm-yyyy'), to_date('09-04-2022', 'dd-mm-yyyy'), 110, 167, 854, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (546, to_date('09-04-2024', 'dd-mm-yyyy'), to_date('11-06-2023', 'dd-mm-yyyy'), 110, 137, 30, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (306, to_date('24-05-2022', 'dd-mm-yyyy'), to_date('25-10-2022', 'dd-mm-yyyy'), 104, 914, 740, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (353, to_date('15-02-2022', 'dd-mm-yyyy'), to_date('25-12-2023', 'dd-mm-yyyy'), 102, 806, 375, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (912, to_date('18-03-2023', 'dd-mm-yyyy'), to_date('12-06-2022', 'dd-mm-yyyy'), 104, 479, 872, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (629, to_date('03-05-2022', 'dd-mm-yyyy'), to_date('11-04-2023', 'dd-mm-yyyy'), 109, 553, 746, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (153, to_date('24-01-2023', 'dd-mm-yyyy'), to_date('15-01-2022', 'dd-mm-yyyy'), 106, 1, 282, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (531, to_date('22-01-2024', 'dd-mm-yyyy'), to_date('12-09-2023', 'dd-mm-yyyy'), 109, 879, 713, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (573, to_date('25-05-2022', 'dd-mm-yyyy'), to_date('24-03-2022', 'dd-mm-yyyy'), 110, 147, 567, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (737, to_date('07-11-2023', 'dd-mm-yyyy'), to_date('13-02-2022', 'dd-mm-yyyy'), 101, 387, 865, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (674, to_date('08-09-2023', 'dd-mm-yyyy'), to_date('17-10-2022', 'dd-mm-yyyy'), 101, 125, 486, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (996, to_date('05-06-2023', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 110, 428, 236, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (706, to_date('27-01-2022', 'dd-mm-yyyy'), to_date('04-04-2023', 'dd-mm-yyyy'), 106, 761, 842, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (75, to_date('23-05-2024', 'dd-mm-yyyy'), to_date('30-09-2022', 'dd-mm-yyyy'), 110, 947, 399, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (37, to_date('05-08-2023', 'dd-mm-yyyy'), to_date('01-11-2023', 'dd-mm-yyyy'), 102, 211, 298, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (166, to_date('25-09-2022', 'dd-mm-yyyy'), to_date('28-10-2022', 'dd-mm-yyyy'), 102, 443, 495, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (314, to_date('03-06-2023', 'dd-mm-yyyy'), to_date('20-11-2023', 'dd-mm-yyyy'), 106, 997, 935, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (947, to_date('13-12-2023', 'dd-mm-yyyy'), to_date('05-03-2022', 'dd-mm-yyyy'), 101, 953, 52, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (776, to_date('27-09-2023', 'dd-mm-yyyy'), to_date('04-08-2022', 'dd-mm-yyyy'), 104, 371, 303, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (985, to_date('03-05-2024', 'dd-mm-yyyy'), to_date('24-01-2023', 'dd-mm-yyyy'), 102, 61, 415, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (963, to_date('20-04-2023', 'dd-mm-yyyy'), to_date('18-08-2022', 'dd-mm-yyyy'), 109, 195, 588, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (523, to_date('09-02-2022', 'dd-mm-yyyy'), to_date('23-09-2023', 'dd-mm-yyyy'), 110, 468, 85, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (410, to_date('14-10-2023', 'dd-mm-yyyy'), to_date('21-04-2023', 'dd-mm-yyyy'), 101, 125, 949, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (0, to_date('17-02-2022', 'dd-mm-yyyy'), to_date('01-06-2022', 'dd-mm-yyyy'), 102, 372, 317, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (558, to_date('17-04-2022', 'dd-mm-yyyy'), to_date('03-02-2022', 'dd-mm-yyyy'), 104, 10, 677, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (219, to_date('18-02-2024', 'dd-mm-yyyy'), to_date('26-06-2023', 'dd-mm-yyyy'), 101, 979, 535, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (708, to_date('03-04-2023', 'dd-mm-yyyy'), to_date('03-07-2022', 'dd-mm-yyyy'), 110, 501, 486, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (824, to_date('21-06-2022', 'dd-mm-yyyy'), to_date('26-01-2023', 'dd-mm-yyyy'), 109, 853, 145, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (677, to_date('08-03-2022', 'dd-mm-yyyy'), to_date('12-07-2022', 'dd-mm-yyyy'), 104, 750, 9, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (663, to_date('23-07-2023', 'dd-mm-yyyy'), to_date('10-08-2022', 'dd-mm-yyyy'), 110, 223, 218, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (481, to_date('17-04-2023', 'dd-mm-yyyy'), to_date('25-02-2024', 'dd-mm-yyyy'), 106, 848, 514, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (786, to_date('18-11-2022', 'dd-mm-yyyy'), to_date('29-09-2022', 'dd-mm-yyyy'), 109, 533, 645, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (449, to_date('28-04-2024', 'dd-mm-yyyy'), to_date('14-10-2022', 'dd-mm-yyyy'), 101, 155, 377, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (341, to_date('22-09-2022', 'dd-mm-yyyy'), to_date('07-05-2023', 'dd-mm-yyyy'), 101, 912, 786, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (857, to_date('20-02-2024', 'dd-mm-yyyy'), to_date('24-01-2022', 'dd-mm-yyyy'), 102, 64, 484, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (254, to_date('18-05-2023', 'dd-mm-yyyy'), to_date('29-09-2023', 'dd-mm-yyyy'), 106, 277, 656, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (799, to_date('30-07-2022', 'dd-mm-yyyy'), to_date('14-01-2022', 'dd-mm-yyyy'), 104, 647, 928, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (949, to_date('09-12-2023', 'dd-mm-yyyy'), to_date('13-04-2024', 'dd-mm-yyyy'), 102, 936, 11, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (39, to_date('02-07-2023', 'dd-mm-yyyy'), to_date('12-12-2022', 'dd-mm-yyyy'), 104, 769, 769, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (924, to_date('15-09-2022', 'dd-mm-yyyy'), to_date('25-03-2024', 'dd-mm-yyyy'), 102, 402, 234, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (740, to_date('10-09-2022', 'dd-mm-yyyy'), to_date('19-04-2024', 'dd-mm-yyyy'), 104, 937, 84, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (4, to_date('08-02-2023', 'dd-mm-yyyy'), to_date('10-11-2022', 'dd-mm-yyyy'), 109, 847, 253, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (444, to_date('03-12-2022', 'dd-mm-yyyy'), to_date('07-04-2024', 'dd-mm-yyyy'), 106, 446, 34, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (128, to_date('19-06-2023', 'dd-mm-yyyy'), to_date('27-04-2022', 'dd-mm-yyyy'), 109, 747, 147, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (902, to_date('16-09-2023', 'dd-mm-yyyy'), to_date('16-03-2023', 'dd-mm-yyyy'), 110, 922, 633, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (367, to_date('25-04-2022', 'dd-mm-yyyy'), to_date('28-06-2023', 'dd-mm-yyyy'), 106, 356, 316, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (782, to_date('22-01-2023', 'dd-mm-yyyy'), to_date('04-02-2022', 'dd-mm-yyyy'), 102, 713, 844, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (260, to_date('08-03-2023', 'dd-mm-yyyy'), to_date('21-06-2022', 'dd-mm-yyyy'), 110, 680, 115, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (15, to_date('22-04-2024', 'dd-mm-yyyy'), to_date('14-10-2022', 'dd-mm-yyyy'), 109, 829, 675, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (475, to_date('21-01-2024', 'dd-mm-yyyy'), to_date('11-02-2022', 'dd-mm-yyyy'), 104, 995, 12, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (855, to_date('20-09-2023', 'dd-mm-yyyy'), to_date('05-11-2023', 'dd-mm-yyyy'), 109, 247, 70, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (116, to_date('02-08-2023', 'dd-mm-yyyy'), to_date('09-09-2022', 'dd-mm-yyyy'), 109, 501, 689, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (416, to_date('21-02-2023', 'dd-mm-yyyy'), to_date('17-01-2023', 'dd-mm-yyyy'), 109, 443, 755, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (990, to_date('17-02-2022', 'dd-mm-yyyy'), to_date('29-01-2023', 'dd-mm-yyyy'), 106, 988, 299, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (218, to_date('02-07-2023', 'dd-mm-yyyy'), to_date('25-12-2022', 'dd-mm-yyyy'), 106, 63, 523, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (251, to_date('21-05-2022', 'dd-mm-yyyy'), to_date('15-03-2022', 'dd-mm-yyyy'), 110, 586, 839, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (265, to_date('02-04-2022', 'dd-mm-yyyy'), to_date('25-09-2022', 'dd-mm-yyyy'), 106, 288, 316, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (417, to_date('21-01-2024', 'dd-mm-yyyy'), to_date('03-06-2022', 'dd-mm-yyyy'), 106, 419, 927, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (33, to_date('05-04-2024', 'dd-mm-yyyy'), to_date('25-10-2023', 'dd-mm-yyyy'), 104, 211, 231, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (66, to_date('07-10-2023', 'dd-mm-yyyy'), to_date('04-05-2022', 'dd-mm-yyyy'), 102, 555, 701, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (398, to_date('19-12-2022', 'dd-mm-yyyy'), to_date('14-12-2022', 'dd-mm-yyyy'), 104, 95, 635, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (819, to_date('19-08-2023', 'dd-mm-yyyy'), to_date('03-09-2022', 'dd-mm-yyyy'), 101, 269, 495, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (731, to_date('03-06-2023', 'dd-mm-yyyy'), to_date('08-03-2023', 'dd-mm-yyyy'), 104, 372, 215, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (727, to_date('23-08-2023', 'dd-mm-yyyy'), to_date('24-01-2022', 'dd-mm-yyyy'), 101, 416, 554, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (458, to_date('26-07-2023', 'dd-mm-yyyy'), to_date('16-05-2022', 'dd-mm-yyyy'), 106, 308, 972, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (78, to_date('04-03-2023', 'dd-mm-yyyy'), to_date('01-07-2023', 'dd-mm-yyyy'), 110, 513, 440, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (995, to_date('26-09-2023', 'dd-mm-yyyy'), to_date('09-11-2023', 'dd-mm-yyyy'), 102, 750, 311, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (405, to_date('25-10-2022', 'dd-mm-yyyy'), to_date('17-11-2023', 'dd-mm-yyyy'), 101, 949, 360, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (979, to_date('01-02-2024', 'dd-mm-yyyy'), to_date('20-10-2022', 'dd-mm-yyyy'), 109, 507, 97, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (263, to_date('05-10-2023', 'dd-mm-yyyy'), to_date('04-09-2023', 'dd-mm-yyyy'), 104, 489, 565, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (768, to_date('26-07-2023', 'dd-mm-yyyy'), to_date('08-03-2024', 'dd-mm-yyyy'), 102, 926, 293, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (160, to_date('30-05-2022', 'dd-mm-yyyy'), to_date('28-05-2022', 'dd-mm-yyyy'), 106, 394, 755, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (180, to_date('14-03-2024', 'dd-mm-yyyy'), to_date('11-12-2022', 'dd-mm-yyyy'), 109, 870, 77, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (958, to_date('20-09-2022', 'dd-mm-yyyy'), to_date('21-04-2023', 'dd-mm-yyyy'), 109, 921, 599, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (231, to_date('03-10-2023', 'dd-mm-yyyy'), to_date('24-07-2023', 'dd-mm-yyyy'), 102, 750, 839, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (38, to_date('12-04-2023', 'dd-mm-yyyy'), to_date('22-10-2023', 'dd-mm-yyyy'), 101, 919, 919, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (107, to_date('12-08-2023', 'dd-mm-yyyy'), to_date('16-01-2024', 'dd-mm-yyyy'), 102, 451, 434, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (903, to_date('26-05-2024', 'dd-mm-yyyy'), to_date('07-07-2022', 'dd-mm-yyyy'), 102, 538, 469, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (894, to_date('23-05-2022', 'dd-mm-yyyy'), to_date('23-11-2022', 'dd-mm-yyyy'), 104, 859, 73, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (518, to_date('13-04-2024', 'dd-mm-yyyy'), to_date('19-01-2022', 'dd-mm-yyyy'), 109, 112, 599, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (802, to_date('03-01-2022', 'dd-mm-yyyy'), to_date('04-06-2022', 'dd-mm-yyyy'), 110, 246, 533, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (369, to_date('25-11-2022', 'dd-mm-yyyy'), to_date('04-04-2022', 'dd-mm-yyyy'), 104, 321, 976, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (967, to_date('04-04-2022', 'dd-mm-yyyy'), to_date('24-08-2022', 'dd-mm-yyyy'), 101, 896, 99, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (725, to_date('01-05-2023', 'dd-mm-yyyy'), to_date('05-12-2023', 'dd-mm-yyyy'), 101, 361, 618, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (659, to_date('27-10-2023', 'dd-mm-yyyy'), to_date('12-07-2022', 'dd-mm-yyyy'), 110, 573, 268, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (83, to_date('19-04-2024', 'dd-mm-yyyy'), to_date('11-12-2022', 'dd-mm-yyyy'), 101, 227, 660, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (211, to_date('02-06-2023', 'dd-mm-yyyy'), to_date('09-10-2023', 'dd-mm-yyyy'), 101, 482, 764, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (918, to_date('08-08-2022', 'dd-mm-yyyy'), to_date('16-03-2022', 'dd-mm-yyyy'), 101, 994, 282, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (791, to_date('18-02-2023', 'dd-mm-yyyy'), to_date('11-11-2023', 'dd-mm-yyyy'), 104, 275, 420, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (364, to_date('13-04-2023', 'dd-mm-yyyy'), to_date('11-11-2022', 'dd-mm-yyyy'), 104, 195, 291, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (805, to_date('01-02-2024', 'dd-mm-yyyy'), to_date('28-07-2022', 'dd-mm-yyyy'), 102, 460, 790, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (163, to_date('07-02-2024', 'dd-mm-yyyy'), to_date('31-08-2023', 'dd-mm-yyyy'), 106, 366, 469, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (932, to_date('20-01-2022', 'dd-mm-yyyy'), to_date('09-04-2024', 'dd-mm-yyyy'), 106, 268, 224, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (653, to_date('30-08-2022', 'dd-mm-yyyy'), to_date('25-05-2022', 'dd-mm-yyyy'), 102, 671, 656, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (721, to_date('09-01-2023', 'dd-mm-yyyy'), to_date('18-11-2023', 'dd-mm-yyyy'), 102, 9, 77, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (793, to_date('18-03-2022', 'dd-mm-yyyy'), to_date('17-07-2022', 'dd-mm-yyyy'), 106, 19, 401, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (762, to_date('15-02-2024', 'dd-mm-yyyy'), to_date('23-01-2023', 'dd-mm-yyyy'), 101, 499, 283, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (437, to_date('05-09-2023', 'dd-mm-yyyy'), to_date('22-05-2023', 'dd-mm-yyyy'), 110, 88, 484, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (673, to_date('15-07-2023', 'dd-mm-yyyy'), to_date('02-04-2024', 'dd-mm-yyyy'), 106, 312, 508, null);
commit;
prompt 100 records committed...
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (627, to_date('21-04-2022', 'dd-mm-yyyy'), to_date('30-09-2023', 'dd-mm-yyyy'), 106, 890, 659, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (139, to_date('23-01-2024', 'dd-mm-yyyy'), to_date('17-05-2024', 'dd-mm-yyyy'), 104, 705, 480, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (833, to_date('09-06-2022', 'dd-mm-yyyy'), to_date('03-03-2024', 'dd-mm-yyyy'), 109, 211, 152, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (597, to_date('14-05-2022', 'dd-mm-yyyy'), to_date('23-02-2022', 'dd-mm-yyyy'), 104, 438, 137, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (453, to_date('08-07-2023', 'dd-mm-yyyy'), to_date('31-05-2023', 'dd-mm-yyyy'), 110, 425, 330, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (620, to_date('18-09-2022', 'dd-mm-yyyy'), to_date('23-01-2023', 'dd-mm-yyyy'), 102, 402, 523, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (689, to_date('11-09-2022', 'dd-mm-yyyy'), to_date('01-01-2022', 'dd-mm-yyyy'), 109, 32, 533, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (64, to_date('12-03-2022', 'dd-mm-yyyy'), to_date('27-09-2023', 'dd-mm-yyyy'), 101, 223, 534, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (40, to_date('02-02-2022', 'dd-mm-yyyy'), to_date('23-07-2022', 'dd-mm-yyyy'), 109, 280, 755, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (3, to_date('07-07-2022', 'dd-mm-yyyy'), to_date('19-06-2022', 'dd-mm-yyyy'), 101, 769, 73, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (865, to_date('27-06-2023', 'dd-mm-yyyy'), to_date('16-04-2023', 'dd-mm-yyyy'), 102, 867, 600, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (430, to_date('13-11-2023', 'dd-mm-yyyy'), to_date('28-11-2023', 'dd-mm-yyyy'), 109, 63, 64, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (610, to_date('29-07-2022', 'dd-mm-yyyy'), to_date('06-07-2023', 'dd-mm-yyyy'), 106, 761, 675, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (556, to_date('06-01-2022', 'dd-mm-yyyy'), to_date('30-03-2022', 'dd-mm-yyyy'), 109, 489, 618, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (310, to_date('05-10-2022', 'dd-mm-yyyy'), to_date('20-09-2022', 'dd-mm-yyyy'), 110, 308, 73, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (647, to_date('07-06-2022', 'dd-mm-yyyy'), to_date('16-05-2023', 'dd-mm-yyyy'), 102, 846, 527, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (886, to_date('03-05-2024', 'dd-mm-yyyy'), to_date('15-07-2022', 'dd-mm-yyyy'), 102, 482, 292, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (602, to_date('13-04-2023', 'dd-mm-yyyy'), to_date('06-06-2023', 'dd-mm-yyyy'), 106, 754, 139, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (119, to_date('13-04-2023', 'dd-mm-yyyy'), to_date('21-07-2023', 'dd-mm-yyyy'), 104, 473, 352, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (888, to_date('22-09-2023', 'dd-mm-yyyy'), to_date('19-03-2022', 'dd-mm-yyyy'), 106, 736, 70, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (693, to_date('29-07-2022', 'dd-mm-yyyy'), to_date('22-03-2023', 'dd-mm-yyyy'), 101, 268, 902, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (754, to_date('22-05-2023', 'dd-mm-yyyy'), to_date('10-10-2022', 'dd-mm-yyyy'), 109, 87, 551, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (687, to_date('28-07-2023', 'dd-mm-yyyy'), to_date('30-01-2023', 'dd-mm-yyyy'), 101, 13, 848, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (871, to_date('21-11-2023', 'dd-mm-yyyy'), to_date('16-01-2023', 'dd-mm-yyyy'), 104, 562, 198, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (713, to_date('12-01-2024', 'dd-mm-yyyy'), to_date('02-03-2023', 'dd-mm-yyyy'), 104, 553, 71, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (331, to_date('23-07-2023', 'dd-mm-yyyy'), to_date('15-09-2023', 'dd-mm-yyyy'), 104, 329, 120, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (736, to_date('07-04-2023', 'dd-mm-yyyy'), to_date('03-10-2022', 'dd-mm-yyyy'), 106, 437, 328, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (154, to_date('16-01-2023', 'dd-mm-yyyy'), to_date('14-06-2023', 'dd-mm-yyyy'), 106, 296, 117, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (709, to_date('01-04-2022', 'dd-mm-yyyy'), to_date('01-01-2022', 'dd-mm-yyyy'), 106, 947, 352, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (601, to_date('24-09-2023', 'dd-mm-yyyy'), to_date('29-01-2024', 'dd-mm-yyyy'), 101, 277, 352, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (650, to_date('09-02-2024', 'dd-mm-yyyy'), to_date('22-02-2023', 'dd-mm-yyyy'), 101, 32, 428, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (757, to_date('08-05-2022', 'dd-mm-yyyy'), to_date('14-03-2024', 'dd-mm-yyyy'), 101, 416, 316, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (541, to_date('04-03-2022', 'dd-mm-yyyy'), to_date('04-09-2022', 'dd-mm-yyyy'), 106, 213, 218, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (842, to_date('25-07-2022', 'dd-mm-yyyy'), to_date('27-10-2023', 'dd-mm-yyyy'), 109, 384, 484, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (699, to_date('19-02-2022', 'dd-mm-yyyy'), to_date('25-10-2022', 'dd-mm-yyyy'), 104, 312, 5, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (494, to_date('13-06-2023', 'dd-mm-yyyy'), to_date('02-04-2024', 'dd-mm-yyyy'), 106, 215, 462, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (652, to_date('26-10-2023', 'dd-mm-yyyy'), to_date('28-04-2024', 'dd-mm-yyyy'), 109, 57, 857, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (397, to_date('05-03-2022', 'dd-mm-yyyy'), to_date('14-01-2024', 'dd-mm-yyyy'), 106, 288, 311, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (788, to_date('26-05-2024', 'dd-mm-yyyy'), to_date('12-03-2022', 'dd-mm-yyyy'), 102, 685, 879, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (555, to_date('24-06-2023', 'dd-mm-yyyy'), to_date('03-05-2024', 'dd-mm-yyyy'), 102, 256, 508, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (515, to_date('11-02-2024', 'dd-mm-yyyy'), to_date('23-09-2022', 'dd-mm-yyyy'), 110, 818, 389, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (413, to_date('01-07-2022', 'dd-mm-yyyy'), to_date('07-02-2023', 'dd-mm-yyyy'), 102, 366, 41, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (563, to_date('15-01-2022', 'dd-mm-yyyy'), to_date('10-07-2023', 'dd-mm-yyyy'), 102, 995, 224, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (148, to_date('03-01-2024', 'dd-mm-yyyy'), to_date('22-07-2023', 'dd-mm-yyyy'), 101, 396, 256, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (836, to_date('27-04-2023', 'dd-mm-yyyy'), to_date('02-06-2022', 'dd-mm-yyyy'), 110, 195, 414, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (472, to_date('21-01-2022', 'dd-mm-yyyy'), to_date('12-11-2022', 'dd-mm-yyyy'), 110, 853, 287, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (183, to_date('18-10-2022', 'dd-mm-yyyy'), to_date('18-06-2023', 'dd-mm-yyyy'), 110, 979, 749, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (26, to_date('25-02-2024', 'dd-mm-yyyy'), to_date('15-03-2024', 'dd-mm-yyyy'), 102, 596, 557, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (548, to_date('07-02-2022', 'dd-mm-yyyy'), to_date('21-10-2022', 'dd-mm-yyyy'), 101, 771, 675, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (186, to_date('04-07-2022', 'dd-mm-yyyy'), to_date('29-02-2024', 'dd-mm-yyyy'), 101, 47, 972, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (562, to_date('26-08-2023', 'dd-mm-yyyy'), to_date('01-01-2024', 'dd-mm-yyyy'), 101, 459, 374, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (313, to_date('05-10-2023', 'dd-mm-yyyy'), to_date('22-01-2022', 'dd-mm-yyyy'), 101, 680, 486, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (358, to_date('20-07-2022', 'dd-mm-yyyy'), to_date('26-10-2023', 'dd-mm-yyyy'), 109, 371, 377, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (337, to_date('09-05-2022', 'dd-mm-yyyy'), to_date('09-10-2022', 'dd-mm-yyyy'), 101, 898, 689, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (643, to_date('15-04-2023', 'dd-mm-yyyy'), to_date('10-08-2022', 'dd-mm-yyyy'), 101, 80, 780, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (806, to_date('29-01-2023', 'dd-mm-yyyy'), to_date('20-04-2022', 'dd-mm-yyyy'), 104, 914, 38, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (275, to_date('28-11-2023', 'dd-mm-yyyy'), to_date('10-03-2022', 'dd-mm-yyyy'), 101, 853, 318, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (815, to_date('16-05-2023', 'dd-mm-yyyy'), to_date('08-10-2023', 'dd-mm-yyyy'), 104, 510, 328, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (870, to_date('29-04-2022', 'dd-mm-yyyy'), to_date('28-12-2022', 'dd-mm-yyyy'), 104, 153, 342, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (424, to_date('01-06-2023', 'dd-mm-yyyy'), to_date('07-07-2023', 'dd-mm-yyyy'), 106, 297, 487, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (205, to_date('10-07-2022', 'dd-mm-yyyy'), to_date('10-04-2023', 'dd-mm-yyyy'), 101, 215, 346, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (482, to_date('15-02-2024', 'dd-mm-yyyy'), to_date('05-07-2023', 'dd-mm-yyyy'), 110, 602, 757, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (432, to_date('18-12-2023', 'dd-mm-yyyy'), to_date('28-09-2023', 'dd-mm-yyyy'), 106, 950, 858, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (981, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('24-12-2022', 'dd-mm-yyyy'), 101, 269, 879, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (361, to_date('08-01-2024', 'dd-mm-yyyy'), to_date('20-03-2022', 'dd-mm-yyyy'), 104, 538, 17, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (339, to_date('31-08-2022', 'dd-mm-yyyy'), to_date('27-03-2022', 'dd-mm-yyyy'), 109, 416, 740, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (266, to_date('03-04-2022', 'dd-mm-yyyy'), to_date('01-12-2023', 'dd-mm-yyyy'), 104, 143, 367, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (35, to_date('16-02-2024', 'dd-mm-yyyy'), to_date('19-07-2023', 'dd-mm-yyyy'), 102, 227, 617, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (287, to_date('02-01-2022', 'dd-mm-yyyy'), to_date('04-02-2024', 'dd-mm-yyyy'), 104, 384, 484, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (431, to_date('26-04-2022', 'dd-mm-yyyy'), to_date('20-12-2022', 'dd-mm-yyyy'), 104, 635, 26, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (868, to_date('17-02-2024', 'dd-mm-yyyy'), to_date('15-12-2023', 'dd-mm-yyyy'), 102, 997, 390, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (625, to_date('24-10-2022', 'dd-mm-yyyy'), to_date('29-01-2024', 'dd-mm-yyyy'), 110, 167, 156, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (703, to_date('17-11-2022', 'dd-mm-yyyy'), to_date('16-10-2023', 'dd-mm-yyyy'), 110, 416, 195, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (717, to_date('04-11-2023', 'dd-mm-yyyy'), to_date('21-03-2023', 'dd-mm-yyyy'), 102, 424, 858, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (513, to_date('07-11-2023', 'dd-mm-yyyy'), to_date('07-10-2023', 'dd-mm-yyyy'), 104, 169, 177, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (393, to_date('23-11-2022', 'dd-mm-yyyy'), to_date('15-08-2023', 'dd-mm-yyyy'), 106, 747, 408, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (315, to_date('15-03-2024', 'dd-mm-yyyy'), to_date('25-04-2022', 'dd-mm-yyyy'), 106, 373, 352, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (885, to_date('02-06-2022', 'dd-mm-yyyy'), to_date('25-01-2023', 'dd-mm-yyyy'), 104, 565, 595, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (915, to_date('23-04-2024', 'dd-mm-yyyy'), to_date('18-08-2022', 'dd-mm-yyyy'), 102, 90, 281, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (234, to_date('08-07-2023', 'dd-mm-yyyy'), to_date('15-07-2023', 'dd-mm-yyyy'), 110, 806, 916, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (448, to_date('06-09-2023', 'dd-mm-yyyy'), to_date('20-04-2024', 'dd-mm-yyyy'), 109, 14, 91, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (400, to_date('06-03-2024', 'dd-mm-yyyy'), to_date('15-06-2022', 'dd-mm-yyyy'), 104, 947, 26, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (46, to_date('24-03-2024', 'dd-mm-yyyy'), to_date('26-03-2022', 'dd-mm-yyyy'), 109, 82, 955, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (20, to_date('07-10-2023', 'dd-mm-yyyy'), to_date('20-10-2023', 'dd-mm-yyyy'), 101, 576, 618, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (742, to_date('03-04-2023', 'dd-mm-yyyy'), to_date('21-04-2024', 'dd-mm-yyyy'), 110, 210, 378, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (285, to_date('14-01-2024', 'dd-mm-yyyy'), to_date('24-04-2022', 'dd-mm-yyyy'), 104, 890, 1, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (658, to_date('24-04-2024', 'dd-mm-yyyy'), to_date('01-02-2023', 'dd-mm-yyyy'), 110, 717, 955, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (561, to_date('28-05-2022', 'dd-mm-yyyy'), to_date('22-07-2023', 'dd-mm-yyyy'), 104, 921, 955, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (232, to_date('07-01-2022', 'dd-mm-yyyy'), to_date('18-04-2023', 'dd-mm-yyyy'), 102, 944, 772, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (514, to_date('23-10-2023', 'dd-mm-yyyy'), to_date('22-02-2022', 'dd-mm-yyyy'), 106, 372, 367, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (951, to_date('06-08-2023', 'dd-mm-yyyy'), to_date('23-06-2022', 'dd-mm-yyyy'), 104, 525, 780, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (773, to_date('02-07-2022', 'dd-mm-yyyy'), to_date('05-11-2023', 'dd-mm-yyyy'), 102, 937, 889, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (480, to_date('11-05-2022', 'dd-mm-yyyy'), to_date('24-03-2023', 'dd-mm-yyyy'), 109, 446, 571, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (959, to_date('22-06-2022', 'dd-mm-yyyy'), to_date('19-09-2022', 'dd-mm-yyyy'), 104, 928, 536, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (147, to_date('25-02-2022', 'dd-mm-yyyy'), to_date('31-05-2024', 'dd-mm-yyyy'), 109, 263, 270, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (763, to_date('15-06-2022', 'dd-mm-yyyy'), to_date('10-12-2022', 'dd-mm-yyyy'), 109, 263, 632, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (298, to_date('21-09-2022', 'dd-mm-yyyy'), to_date('05-06-2023', 'dd-mm-yyyy'), 104, 211, 73, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (864, to_date('30-12-2023', 'dd-mm-yyyy'), to_date('31-08-2023', 'dd-mm-yyyy'), 106, 680, 269, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (189, to_date('15-06-2022', 'dd-mm-yyyy'), to_date('01-08-2023', 'dd-mm-yyyy'), 106, 302, 749, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (978, to_date('01-04-2022', 'dd-mm-yyyy'), to_date('26-05-2022', 'dd-mm-yyyy'), 106, 544, 872, null);
commit;
prompt 200 records committed...
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (779, to_date('20-01-2022', 'dd-mm-yyyy'), to_date('03-03-2022', 'dd-mm-yyyy'), 110, 818, 14, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (404, to_date('17-04-2024', 'dd-mm-yyyy'), to_date('21-04-2023', 'dd-mm-yyyy'), 101, 266, 481, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (290, to_date('15-07-2022', 'dd-mm-yyyy'), to_date('07-08-2023', 'dd-mm-yyyy'), 110, 125, 491, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (598, to_date('20-09-2023', 'dd-mm-yyyy'), to_date('20-03-2022', 'dd-mm-yyyy'), 104, 538, 85, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (47, to_date('31-03-2024', 'dd-mm-yyyy'), to_date('15-02-2022', 'dd-mm-yyyy'), 101, 959, 743, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (750, to_date('01-06-2022', 'dd-mm-yyyy'), to_date('25-06-2022', 'dd-mm-yyyy'), 101, 167, 759, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (720, to_date('10-11-2022', 'dd-mm-yyyy'), to_date('14-07-2023', 'dd-mm-yyyy'), 106, 806, 620, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (134, to_date('17-06-2022', 'dd-mm-yyyy'), to_date('28-12-2022', 'dd-mm-yyyy'), 109, 508, 395, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (456, to_date('18-04-2024', 'dd-mm-yyyy'), to_date('03-06-2022', 'dd-mm-yyyy'), 104, 371, 678, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (495, to_date('10-04-2023', 'dd-mm-yyyy'), to_date('22-04-2024', 'dd-mm-yyyy'), 102, 64, 5, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (956, to_date('30-03-2023', 'dd-mm-yyyy'), to_date('25-10-2022', 'dd-mm-yyyy'), 101, 482, 622, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (770, to_date('30-03-2022', 'dd-mm-yyyy'), to_date('26-10-2022', 'dd-mm-yyyy'), 106, 246, 71, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (686, to_date('25-07-2022', 'dd-mm-yyyy'), to_date('04-12-2022', 'dd-mm-yyyy'), 102, 95, 777, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (104, to_date('11-06-2022', 'dd-mm-yyyy'), to_date('28-02-2022', 'dd-mm-yyyy'), 110, 952, 895, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (338, to_date('30-04-2024', 'dd-mm-yyyy'), to_date('04-01-2024', 'dd-mm-yyyy'), 106, 352, 491, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (738, to_date('24-11-2022', 'dd-mm-yyyy'), to_date('03-09-2022', 'dd-mm-yyyy'), 104, 532, 508, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (972, to_date('08-11-2023', 'dd-mm-yyyy'), to_date('04-02-2022', 'dd-mm-yyyy'), 109, 756, 256, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (778, to_date('22-11-2023', 'dd-mm-yyyy'), to_date('17-02-2024', 'dd-mm-yyyy'), 110, 541, 341, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (268, to_date('31-07-2022', 'dd-mm-yyyy'), to_date('20-04-2022', 'dd-mm-yyyy'), 106, 210, 495, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (21, to_date('28-08-2023', 'dd-mm-yyyy'), to_date('20-05-2022', 'dd-mm-yyyy'), 102, 665, 256, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (530, to_date('11-12-2023', 'dd-mm-yyyy'), to_date('16-02-2023', 'dd-mm-yyyy'), 101, 936, 17, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (443, to_date('21-09-2023', 'dd-mm-yyyy'), to_date('22-04-2023', 'dd-mm-yyyy'), 102, 959, 649, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (170, to_date('14-12-2022', 'dd-mm-yyyy'), to_date('24-10-2023', 'dd-mm-yyyy'), 106, 39, 895, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (994, to_date('25-12-2022', 'dd-mm-yyyy'), to_date('26-11-2022', 'dd-mm-yyyy'), 106, 453, 738, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (460, to_date('14-05-2024', 'dd-mm-yyyy'), to_date('27-03-2023', 'dd-mm-yyyy'), 104, 88, 292, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (76, to_date('22-06-2023', 'dd-mm-yyyy'), to_date('16-03-2022', 'dd-mm-yyyy'), 102, 226, 63, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (62, to_date('14-04-2023', 'dd-mm-yyyy'), to_date('29-08-2023', 'dd-mm-yyyy'), 110, 980, 754, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (567, to_date('05-09-2022', 'dd-mm-yyyy'), to_date('22-07-2022', 'dd-mm-yyyy'), 104, 247, 119, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (70, to_date('23-10-2022', 'dd-mm-yyyy'), to_date('08-04-2023', 'dd-mm-yyyy'), 102, 437, 32, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (942, to_date('27-10-2022', 'dd-mm-yyyy'), to_date('13-03-2024', 'dd-mm-yyyy'), 101, 894, 994, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (715, to_date('05-12-2022', 'dd-mm-yyyy'), to_date('10-12-2022', 'dd-mm-yyyy'), 101, 275, 503, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (267, to_date('18-10-2022', 'dd-mm-yyyy'), to_date('28-06-2022', 'dd-mm-yyyy'), 104, 161, 806, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (872, to_date('24-09-2023', 'dd-mm-yyyy'), to_date('23-01-2024', 'dd-mm-yyyy'), 102, 19, 586, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (934, to_date('10-03-2022', 'dd-mm-yyyy'), to_date('05-03-2023', 'dd-mm-yyyy'), 110, 416, 66, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (379, to_date('11-07-2023', 'dd-mm-yyyy'), to_date('25-02-2022', 'dd-mm-yyyy'), 102, 292, 732, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (507, to_date('03-09-2022', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 109, 955, 367, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (614, to_date('20-09-2023', 'dd-mm-yyyy'), to_date('15-11-2022', 'dd-mm-yyyy'), 110, 456, 99, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (810, to_date('27-12-2023', 'dd-mm-yyyy'), to_date('10-10-2022', 'dd-mm-yyyy'), 101, 84, 63, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (426, to_date('27-10-2022', 'dd-mm-yyyy'), to_date('12-01-2022', 'dd-mm-yyyy'), 102, 13, 797, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (29, to_date('06-01-2024', 'dd-mm-yyyy'), to_date('17-12-2022', 'dd-mm-yyyy'), 109, 980, 848, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (382, to_date('28-12-2022', 'dd-mm-yyyy'), to_date('31-03-2022', 'dd-mm-yyyy'), 109, 67, 330, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (42, to_date('27-07-2022', 'dd-mm-yyyy'), to_date('07-04-2024', 'dd-mm-yyyy'), 110, 642, 293, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (374, to_date('13-10-2023', 'dd-mm-yyyy'), to_date('19-05-2023', 'dd-mm-yyyy'), 109, 321, 701, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (114, to_date('17-10-2022', 'dd-mm-yyyy'), to_date('13-08-2022', 'dd-mm-yyyy'), 106, 528, 167, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (439, to_date('09-10-2022', 'dd-mm-yyyy'), to_date('07-05-2023', 'dd-mm-yyyy'), 101, 619, 292, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (901, to_date('28-10-2023', 'dd-mm-yyyy'), to_date('17-10-2022', 'dd-mm-yyyy'), 102, 87, 357, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (631, to_date('06-04-2023', 'dd-mm-yyyy'), to_date('27-04-2023', 'dd-mm-yyyy'), 109, 296, 497, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (476, to_date('09-05-2022', 'dd-mm-yyyy'), to_date('09-07-2023', 'dd-mm-yyyy'), 109, 947, 77, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (214, to_date('03-01-2024', 'dd-mm-yyyy'), to_date('04-08-2022', 'dd-mm-yyyy'), 104, 956, 89, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (999, to_date('14-05-2023', 'dd-mm-yyyy'), to_date('05-06-2022', 'dd-mm-yyyy'), 109, 446, 18, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (506, to_date('10-09-2023', 'dd-mm-yyyy'), to_date('21-07-2023', 'dd-mm-yyyy'), 106, 98, 907, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (853, to_date('15-04-2024', 'dd-mm-yyyy'), to_date('26-10-2023', 'dd-mm-yyyy'), 106, 414, 808, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (937, to_date('28-03-2024', 'dd-mm-yyyy'), to_date('01-02-2023', 'dd-mm-yyyy'), 106, 80, 572, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (173, to_date('03-03-2022', 'dd-mm-yyyy'), to_date('25-01-2024', 'dd-mm-yyyy'), 104, 61, 985, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (283, to_date('03-07-2023', 'dd-mm-yyyy'), to_date('02-11-2022', 'dd-mm-yyyy'), 102, 914, 85, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (271, to_date('18-06-2023', 'dd-mm-yyyy'), to_date('16-04-2024', 'dd-mm-yyyy'), 104, 135, 964, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (355, to_date('29-05-2022', 'dd-mm-yyyy'), to_date('22-12-2023', 'dd-mm-yyyy'), 102, 853, 565, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (97, to_date('26-05-2023', 'dd-mm-yyyy'), to_date('14-02-2023', 'dd-mm-yyyy'), 104, 675, 395, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (399, to_date('01-01-2024', 'dd-mm-yyyy'), to_date('08-08-2022', 'dd-mm-yyyy'), 110, 914, 201, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (993, to_date('16-03-2022', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 102, 446, 617, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (572, to_date('08-01-2022', 'dd-mm-yyyy'), to_date('05-06-2022', 'dd-mm-yyyy'), 109, 247, 352, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (488, to_date('17-05-2024', 'dd-mm-yyyy'), to_date('24-02-2024', 'dd-mm-yyyy'), 102, 482, 586, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (796, to_date('25-01-2023', 'dd-mm-yyyy'), to_date('27-10-2023', 'dd-mm-yyyy'), 110, 397, 382, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (176, to_date('09-09-2023', 'dd-mm-yyyy'), to_date('25-01-2024', 'dd-mm-yyyy'), 101, 280, 909, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (867, to_date('29-07-2022', 'dd-mm-yyyy'), to_date('08-05-2022', 'dd-mm-yyyy'), 110, 647, 797, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (691, to_date('08-10-2023', 'dd-mm-yyyy'), to_date('30-07-2022', 'dd-mm-yyyy'), 109, 437, 29, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (307, to_date('07-07-2022', 'dd-mm-yyyy'), to_date('06-08-2023', 'dd-mm-yyyy'), 106, 197, 26, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (838, to_date('28-08-2023', 'dd-mm-yyyy'), to_date('11-08-2022', 'dd-mm-yyyy'), 110, 823, 566, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (179, to_date('27-09-2022', 'dd-mm-yyyy'), to_date('19-11-2022', 'dd-mm-yyyy'), 102, 457, 147, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (887, to_date('26-10-2022', 'dd-mm-yyyy'), to_date('18-05-2022', 'dd-mm-yyyy'), 106, 769, 645, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (512, to_date('04-11-2023', 'dd-mm-yyyy'), to_date('23-09-2022', 'dd-mm-yyyy'), 106, 277, 796, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (723, to_date('28-03-2024', 'dd-mm-yyyy'), to_date('07-02-2023', 'dd-mm-yyyy'), 104, 174, 32, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (536, to_date('25-12-2022', 'dd-mm-yyyy'), to_date('06-05-2022', 'dd-mm-yyyy'), 109, 617, 311, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (589, to_date('31-01-2023', 'dd-mm-yyyy'), to_date('29-08-2022', 'dd-mm-yyyy'), 109, 134, 415, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (638, to_date('28-01-2023', 'dd-mm-yyyy'), to_date('03-05-2023', 'dd-mm-yyyy'), 110, 736, 844, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (466, to_date('23-03-2022', 'dd-mm-yyyy'), to_date('09-08-2022', 'dd-mm-yyyy'), 109, 466, 565, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (156, to_date('05-04-2023', 'dd-mm-yyyy'), to_date('31-10-2023', 'dd-mm-yyyy'), 101, 438, 846, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (324, to_date('18-03-2022', 'dd-mm-yyyy'), to_date('14-08-2023', 'dd-mm-yyyy'), 109, 49, 551, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (419, to_date('30-04-2024', 'dd-mm-yyyy'), to_date('02-04-2022', 'dd-mm-yyyy'), 110, 453, 769, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (789, to_date('01-06-2023', 'dd-mm-yyyy'), to_date('20-07-2023', 'dd-mm-yyyy'), 101, 329, 415, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (661, to_date('21-01-2023', 'dd-mm-yyyy'), to_date('15-06-2023', 'dd-mm-yyyy'), 101, 280, 993, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (975, to_date('03-12-2022', 'dd-mm-yyyy'), to_date('03-04-2023', 'dd-mm-yyyy'), 109, 640, 765, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (710, to_date('19-01-2023', 'dd-mm-yyyy'), to_date('20-10-2023', 'dd-mm-yyyy'), 106, 369, 959, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (499, to_date('04-05-2023', 'dd-mm-yyyy'), to_date('27-03-2024', 'dd-mm-yyyy'), 104, 761, 945, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (587, to_date('28-10-2022', 'dd-mm-yyyy'), to_date('03-04-2022', 'dd-mm-yyyy'), 106, 369, 139, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (946, to_date('14-11-2022', 'dd-mm-yyyy'), to_date('08-02-2022', 'dd-mm-yyyy'), 106, 246, 551, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (406, to_date('26-05-2024', 'dd-mm-yyyy'), to_date('11-02-2023', 'dd-mm-yyyy'), 102, 620, 586, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (303, to_date('27-04-2024', 'dd-mm-yyyy'), to_date('03-02-2022', 'dd-mm-yyyy'), 101, 383, 656, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (216, to_date('28-04-2024', 'dd-mm-yyyy'), to_date('18-03-2023', 'dd-mm-yyyy'), 106, 204, 787, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (125, to_date('07-12-2023', 'dd-mm-yyyy'), to_date('18-11-2023', 'dd-mm-yyyy'), 110, 944, 967, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (681, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('26-10-2022', 'dd-mm-yyyy'), 104, 147, 108, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (438, to_date('27-09-2023', 'dd-mm-yyyy'), to_date('21-07-2022', 'dd-mm-yyyy'), 110, 268, 618, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (672, to_date('07-05-2022', 'dd-mm-yyyy'), to_date('18-05-2022', 'dd-mm-yyyy'), 102, 67, 751, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (540, to_date('23-09-2023', 'dd-mm-yyyy'), to_date('11-09-2022', 'dd-mm-yyyy'), 104, 855, 405, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (106, to_date('27-02-2024', 'dd-mm-yyyy'), to_date('14-02-2022', 'dd-mm-yyyy'), 109, 928, 618, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (624, to_date('29-01-2024', 'dd-mm-yyyy'), to_date('07-03-2022', 'dd-mm-yyyy'), 109, 80, 434, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (615, to_date('01-03-2023', 'dd-mm-yyyy'), to_date('15-12-2022', 'dd-mm-yyyy'), 104, 371, 53, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (675, to_date('11-10-2023', 'dd-mm-yyyy'), to_date('24-05-2023', 'dd-mm-yyyy'), 101, 693, 302, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (728, to_date('18-04-2024', 'dd-mm-yyyy'), to_date('07-08-2023', 'dd-mm-yyyy'), 104, 396, 535, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (550, to_date('13-05-2023', 'dd-mm-yyyy'), to_date('13-01-2024', 'dd-mm-yyyy'), 102, 956, 635, null);
commit;
prompt 300 records committed...
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (255, to_date('02-06-2023', 'dd-mm-yyyy'), to_date('17-09-2023', 'dd-mm-yyyy'), 102, 395, 270, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (641, to_date('09-10-2023', 'dd-mm-yyyy'), to_date('03-06-2022', 'dd-mm-yyyy'), 110, 713, 936, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (10, to_date('22-03-2022', 'dd-mm-yyyy'), to_date('13-01-2023', 'dd-mm-yyyy'), 106, 920, 842, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (321, to_date('10-03-2022', 'dd-mm-yyyy'), to_date('09-02-2024', 'dd-mm-yyyy'), 106, 297, 487, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (389, to_date('23-01-2022', 'dd-mm-yyyy'), to_date('24-12-2023', 'dd-mm-yyyy'), 106, 620, 352, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (343, to_date('21-04-2024', 'dd-mm-yyyy'), to_date('15-03-2024', 'dd-mm-yyyy'), 102, 276, 389, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (818, to_date('10-07-2023', 'dd-mm-yyyy'), to_date('24-01-2024', 'dd-mm-yyyy'), 104, 50, 876, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (344, to_date('17-12-2023', 'dd-mm-yyyy'), to_date('30-03-2022', 'dd-mm-yyyy'), 110, 626, 437, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (342, to_date('08-10-2022', 'dd-mm-yyyy'), to_date('29-11-2023', 'dd-mm-yyyy'), 104, 571, 900, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (835, to_date('24-06-2022', 'dd-mm-yyyy'), to_date('04-02-2023', 'dd-mm-yyyy'), 104, 320, 201, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (866, to_date('27-01-2023', 'dd-mm-yyyy'), to_date('23-12-2023', 'dd-mm-yyyy'), 110, 529, 660, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (317, to_date('19-01-2023', 'dd-mm-yyyy'), to_date('01-01-2024', 'dd-mm-yyyy'), 106, 886, 863, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (814, to_date('28-05-2022', 'dd-mm-yyyy'), to_date('01-06-2022', 'dd-mm-yyyy'), 104, 333, 757, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (428, to_date('26-11-2022', 'dd-mm-yyyy'), to_date('04-03-2022', 'dd-mm-yyyy'), 109, 98, 104, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (223, to_date('01-03-2023', 'dd-mm-yyyy'), to_date('15-04-2022', 'dd-mm-yyyy'), 102, 875, 320, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (242, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('03-06-2022', 'dd-mm-yyyy'), 102, 510, 849, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (537, to_date('27-10-2023', 'dd-mm-yyyy'), to_date('28-01-2023', 'dd-mm-yyyy'), 101, 289, 18, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (120, to_date('01-07-2023', 'dd-mm-yyyy'), to_date('12-08-2022', 'dd-mm-yyyy'), 106, 240, 599, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (622, to_date('22-10-2022', 'dd-mm-yyyy'), to_date('26-10-2022', 'dd-mm-yyyy'), 104, 197, 797, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (761, to_date('24-01-2023', 'dd-mm-yyyy'), to_date('05-10-2022', 'dd-mm-yyyy'), 101, 847, 828, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (748, to_date('16-03-2022', 'dd-mm-yyyy'), to_date('10-12-2023', 'dd-mm-yyyy'), 110, 875, 29, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (326, to_date('21-05-2024', 'dd-mm-yyyy'), to_date('05-04-2022', 'dd-mm-yyyy'), 106, 134, 889, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (590, to_date('11-02-2024', 'dd-mm-yyyy'), to_date('13-01-2022', 'dd-mm-yyyy'), 110, 58, 528, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (468, to_date('31-12-2022', 'dd-mm-yyyy'), to_date('16-07-2022', 'dd-mm-yyyy'), 106, 73, 234, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (931, to_date('26-08-2023', 'dd-mm-yyyy'), to_date('22-05-2023', 'dd-mm-yyyy'), 101, 137, 482, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (386, to_date('18-04-2024', 'dd-mm-yyyy'), to_date('26-04-2022', 'dd-mm-yyyy'), 109, 894, 377, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, employeeid)
values (502, to_date('03-04-2022', 'dd-mm-yyyy'), to_date('05-07-2022', 'dd-mm-yyyy'), 102, 675, 746, null);
commit;
prompt 327 records loaded
prompt Loading LAUNDRY...
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (664, 196, 'Comm-Works', to_date('03-02-2023', 'dd-mm-yyyy'), 313);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (719, 299, 'Alternative Tec', to_date('01-04-2024', 'dd-mm-yyyy'), 251);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (791, 217, 'Cendant Corp.', to_date('05-10-2023', 'dd-mm-yyyy'), 610);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (631, 137, 'SALT Group', to_date('07-12-2022', 'dd-mm-yyyy'), 754);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (25, 182, 'Microsoft Corp.', to_date('17-07-2023', 'dd-mm-yyyy'), 567);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (284, 346, 'News Corp.', to_date('09-05-2023', 'dd-mm-yyyy'), 432);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (934, 152, 'Spectrum Commun', to_date('19-07-2023', 'dd-mm-yyyy'), 460);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (484, 194, 'Cynergy Data', to_date('14-12-2023', 'dd-mm-yyyy'), 814);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (872, 329, 'esoftsolutions', to_date('24-01-2023', 'dd-mm-yyyy'), 738);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (373, 180, 'Blue Ocean Soft', to_date('11-06-2022', 'dd-mm-yyyy'), 963);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (231, 163, 'SYS-CON Media', to_date('25-01-2024', 'dd-mm-yyyy'), 563);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (420, 227, 'Alliance of Pro', to_date('11-10-2023', 'dd-mm-yyyy'), 967);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (548, 68, 'HealthCare Fina', to_date('06-03-2023', 'dd-mm-yyyy'), 915);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (380, 231, 'DataTrend Infor', to_date('09-10-2023', 'dd-mm-yyyy'), 173);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (845, 347, 'Club One', to_date('30-08-2023', 'dd-mm-yyyy'), 791);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (208, 170, 'Home Depot', to_date('25-11-2023', 'dd-mm-yyyy'), 555);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (896, 129, 'Digital Motorwo', to_date('04-03-2023', 'dd-mm-yyyy'), 358);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (543, 256, 'Tilia', to_date('04-09-2022', 'dd-mm-yyyy'), 710);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (765, 51, 'Magnet Communic', to_date('10-02-2023', 'dd-mm-yyyy'), 602);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (687, 298, 'Ogio Internatio', to_date('22-12-2022', 'dd-mm-yyyy'), 255);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (210, 165, 'Sandy Spring Ba', to_date('08-08-2022', 'dd-mm-yyyy'), 382);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (219, 238, 'Allegiant Banco', to_date('21-03-2022', 'dd-mm-yyyy'), 232);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (736, 233, 'Mercantile Bank', to_date('04-10-2023', 'dd-mm-yyyy'), 186);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (294, 254, 'Pragmatech Soft', to_date('18-04-2023', 'dd-mm-yyyy'), 691);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (169, 310, 'Synovis Life Te', to_date('26-04-2022', 'dd-mm-yyyy'), 254);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (178, 293, 'Restaurant Part', to_date('21-10-2022', 'dd-mm-yyyy'), 562);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (583, 266, 'Network Managem', to_date('30-01-2023', 'dd-mm-yyyy'), 338);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (316, 212, 'Advanced Techno', to_date('21-09-2023', 'dd-mm-yyyy'), 398);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (323, 273, 'USA Environment', to_date('06-02-2023', 'dd-mm-yyyy'), 344);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (344, 183, 'Formatech', to_date('17-11-2023', 'dd-mm-yyyy'), 833);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (389, 348, 'Cardinal Cartri', to_date('26-01-2022', 'dd-mm-yyyy'), 33);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (441, 51, 'Pioneer Data Sy', to_date('03-03-2024', 'dd-mm-yyyy'), 788);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (293, 212, 'Cardinal Cartri', to_date('06-09-2023', 'dd-mm-yyyy'), 399);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (489, 79, 'Cynergy Data', to_date('20-06-2022', 'dd-mm-yyyy'), 723);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (125, 74, 'Conquest', to_date('06-06-2023', 'dd-mm-yyyy'), 979);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (252, 243, 'Contract Counse', to_date('04-01-2023', 'dd-mm-yyyy'), 937);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (932, 251, 'Veri-Tek Intern', to_date('13-10-2022', 'dd-mm-yyyy'), 186);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (230, 189, 'Smartronix', to_date('10-09-2023', 'dd-mm-yyyy'), 661);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (229, 328, 'Elite Medical', to_date('21-03-2024', 'dd-mm-yyyy'), 546);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (55, 341, 'Navigator Syste', to_date('26-10-2023', 'dd-mm-yyyy'), 731);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (504, 96, 'Liners Direct', to_date('29-05-2024', 'dd-mm-yyyy'), 361);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (99, 120, 'Diageo', to_date('29-03-2022', 'dd-mm-yyyy'), 620);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (854, 340, 'General Electri', to_date('09-01-2023', 'dd-mm-yyyy'), 763);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (998, 89, 'Max & Erma''s Re', to_date('14-09-2023', 'dd-mm-yyyy'), 125);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (352, 134, 'Morgan Stanley ', to_date('29-01-2023', 'dd-mm-yyyy'), 4);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (328, 308, 'Outta the Box D', to_date('23-10-2022', 'dd-mm-yyyy'), 727);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (713, 289, 'Bioanalytical S', to_date('06-01-2024', 'dd-mm-yyyy'), 887);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (935, 214, 'IPS Advisory', to_date('24-08-2023', 'dd-mm-yyyy'), 778);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (762, 243, 'Allegiant Banco', to_date('12-02-2024', 'dd-mm-yyyy'), 754);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (705, 91, 'Kingston', to_date('17-12-2023', 'dd-mm-yyyy'), 514);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (105, 89, 'GulfMark Offsho', to_date('13-06-2023', 'dd-mm-yyyy'), 104);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (455, 179, 'Walt Disney Co.', to_date('04-12-2022', 'dd-mm-yyyy'), 404);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (989, 283, 'Hilton Hotels C', to_date('20-05-2022', 'dd-mm-yyyy'), 871);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (814, 208, 'ATA Services', to_date('02-07-2022', 'dd-mm-yyyy'), 382);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (926, 338, 'Kingston', to_date('21-01-2022', 'dd-mm-yyyy'), 573);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (79, 170, 'Service Link', to_date('03-02-2022', 'dd-mm-yyyy'), 674);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (128, 266, 'SafeHome Securi', to_date('03-10-2022', 'dd-mm-yyyy'), 37);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (878, 242, 'MidAmerica Auto', to_date('15-01-2023', 'dd-mm-yyyy'), 590);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (353, 77, 'American Megaco', to_date('06-02-2023', 'dd-mm-yyyy'), 788);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (915, 241, 'Knightsbridge S', to_date('04-11-2022', 'dd-mm-yyyy'), 731);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (201, 189, 'Providence Serv', to_date('29-12-2023', 'dd-mm-yyyy'), 254);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (841, 131, 'Integrated Deci', to_date('21-05-2024', 'dd-mm-yyyy'), 610);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (726, 293, 'ProSys Informat', to_date('18-04-2024', 'dd-mm-yyyy'), 993);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (532, 179, 'Team', to_date('11-09-2023', 'dd-mm-yyyy'), 587);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (265, 232, 'Lydian Trust', to_date('21-01-2023', 'dd-mm-yyyy'), 981);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (901, 84, 'VoiceLog', to_date('27-02-2022', 'dd-mm-yyyy'), 205);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (443, 256, 'Omega Insurance', to_date('23-02-2024', 'dd-mm-yyyy'), 449);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (45, 77, 'Caliber Collisi', to_date('17-05-2024', 'dd-mm-yyyy'), 460);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (683, 167, 'Tastefully Simp', to_date('15-12-2022', 'dd-mm-yyyy'), 652);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (953, 265, 'Active Services', to_date('07-03-2024', 'dd-mm-yyyy'), 389);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (826, 148, 'Socket Internet', to_date('07-02-2022', 'dd-mm-yyyy'), 562);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (94, 69, 'NLX', to_date('05-03-2024', 'dd-mm-yyyy'), 494);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (766, 68, 'Scott Pipitone ', to_date('19-06-2023', 'dd-mm-yyyy'), 791);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (372, 237, 'Tarragon Realty', to_date('12-05-2023', 'dd-mm-yyyy'), 597);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (260, 223, 'MQ Software', to_date('15-04-2024', 'dd-mm-yyyy'), 703);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (69, 271, 'McKee Wallwork ', to_date('18-07-2022', 'dd-mm-yyyy'), 382);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (508, 171, 'Bigdough.com', to_date('23-02-2024', 'dd-mm-yyyy'), 10);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (686, 69, 'Coridian Techno', to_date('09-07-2022', 'dd-mm-yyyy'), 763);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (485, 157, 'Circuit City St', to_date('08-03-2022', 'dd-mm-yyyy'), 353);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (118, 216, 'Manhattan Assoc', to_date('23-03-2023', 'dd-mm-yyyy'), 47);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (530, 97, 'Pioneer Data Sy', to_date('10-04-2024', 'dd-mm-yyyy'), 506);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (336, 336, 'Hilton Hotels C', to_date('14-04-2024', 'dd-mm-yyyy'), 502);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (724, 255, 'Greene County B', to_date('28-03-2024', 'dd-mm-yyyy'), 541);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (401, 273, 'Deutsche Teleko', to_date('06-07-2023', 'dd-mm-yyyy'), 870);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (851, 88, 'Coadvantage Res', to_date('15-04-2023', 'dd-mm-yyyy'), 62);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (862, 290, 'Medical Action ', to_date('12-03-2024', 'dd-mm-yyyy'), 708);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (43, 199, 'Ford Motor Co.', to_date('02-04-2023', 'dd-mm-yyyy'), 432);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (810, 201, 'Multimedia Live', to_date('08-12-2022', 'dd-mm-yyyy'), 537);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (621, 214, 'Unit', to_date('12-10-2022', 'dd-mm-yyyy'), 139);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (669, 318, 'Data Company', to_date('01-11-2022', 'dd-mm-yyyy'), 488);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (402, 325, 'Tilson Landscap', to_date('24-07-2022', 'dd-mm-yyyy'), 757);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (991, 188, 'Maverick Techno', to_date('26-02-2022', 'dd-mm-yyyy'), 62);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (927, 135, 'Digital Visual ', to_date('19-05-2023', 'dd-mm-yyyy'), 39);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (211, 282, 'Loss Mitigation', to_date('25-07-2023', 'dd-mm-yyyy'), 788);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (681, 294, 'MindIQ', to_date('09-02-2022', 'dd-mm-yyyy'), 835);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (506, 207, 'Dearborn Bancor', to_date('03-04-2022', 'dd-mm-yyyy'), 223);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (313, 68, 'Summit Energy', to_date('16-08-2023', 'dd-mm-yyyy'), 556);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (972, 205, 'Serentec', to_date('05-12-2023', 'dd-mm-yyyy'), 946);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (707, 260, 'Sequoia System ', to_date('23-06-2023', 'dd-mm-yyyy'), 885);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (973, 83, 'PrivateBancorp', to_date('06-10-2023', 'dd-mm-yyyy'), 567);
commit;
prompt 100 records committed...
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (479, 141, 'GCI', to_date('17-02-2024', 'dd-mm-yyyy'), 567);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (281, 209, 'Softworld', to_date('19-02-2023', 'dd-mm-yyyy'), 314);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (432, 308, 'North Highland', to_date('27-10-2022', 'dd-mm-yyyy'), 946);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (745, 206, 'Savela & Associ', to_date('05-01-2023', 'dd-mm-yyyy'), 315);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (142, 173, 'Urstadt Biddle ', to_date('10-01-2022', 'dd-mm-yyyy'), 386);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (280, 138, 'Miller Systems', to_date('22-08-2023', 'dd-mm-yyyy'), 397);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (254, 86, 'Call Henry', to_date('09-09-2023', 'dd-mm-yyyy'), 818);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (439, 130, 'TRX', to_date('01-08-2023', 'dd-mm-yyyy'), 399);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (556, 99, 'Taycor Financia', to_date('07-08-2023', 'dd-mm-yyyy'), 653);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (888, 126, 'Myricom', to_date('20-01-2023', 'dd-mm-yyyy'), 740);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (785, 105, 'Mitsubishi Moto', to_date('22-02-2024', 'dd-mm-yyyy'), 76);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (152, 148, 'Wal-Mart Stores', to_date('31-12-2022', 'dd-mm-yyyy'), 214);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (315, 215, 'Universal Solut', to_date('29-04-2022', 'dd-mm-yyyy'), 26);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (13, 255, 'Texas Residenti', to_date('19-03-2024', 'dd-mm-yyyy'), 449);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (738, 155, 'Kelmoore Invest', to_date('02-02-2024', 'dd-mm-yyyy'), 389);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (64, 73, 'Tropical Oasis', to_date('10-03-2022', 'dd-mm-yyyy'), 799);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (247, 83, 'Joe Lombardo Pl', to_date('02-06-2022', 'dd-mm-yyyy'), 835);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (509, 68, 'Enterprise Comp', to_date('17-05-2023', 'dd-mm-yyyy'), 432);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (753, 298, 'Navarro Researc', to_date('04-05-2024', 'dd-mm-yyyy'), 134);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (109, 98, 'Mathis, Earnest', to_date('18-04-2023', 'dd-mm-yyyy'), 315);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (77, 96, 'Spinnaker Explo', to_date('08-02-2024', 'dd-mm-yyyy'), 472);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (289, 207, 'Heartland Payme', to_date('31-07-2023', 'dd-mm-yyyy'), 838);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (773, 350, 'Bluff City Stee', to_date('17-08-2023', 'dd-mm-yyyy'), 972);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (187, 229, 'Tigris Consulti', to_date('31-03-2023', 'dd-mm-yyyy'), 439);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (48, 104, 'State Farm Mutu', to_date('15-04-2022', 'dd-mm-yyyy'), 750);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (754, 323, 'Dearborn Bancor', to_date('17-04-2023', 'dd-mm-yyyy'), 736);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (603, 289, 'Liners Direct', to_date('21-04-2024', 'dd-mm-yyyy'), 283);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (53, 343, 'Jewett-Cameron ', to_date('20-12-2023', 'dd-mm-yyyy'), 727);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (413, 209, 'Traffic Managem', to_date('29-07-2023', 'dd-mm-yyyy'), 757);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (623, 327, 'Alogent', to_date('26-01-2024', 'dd-mm-yyyy'), 399);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (175, 165, 'StoneTech Profe', to_date('03-07-2023', 'dd-mm-yyyy'), 806);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (818, 80, 'Staff Force', to_date('29-02-2024', 'dd-mm-yyyy'), 278);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (947, 330, 'Teamstudio', to_date('10-08-2023', 'dd-mm-yyyy'), 290);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (882, 271, 'Zaiq Technologi', to_date('08-12-2022', 'dd-mm-yyyy'), 139);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (253, 347, 'Myricom', to_date('09-02-2024', 'dd-mm-yyyy'), 278);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (517, 191, 'School Technolo', to_date('18-06-2023', 'dd-mm-yyyy'), 622);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (939, 280, 'Neogen', to_date('05-03-2024', 'dd-mm-yyyy'), 513);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (36, 104, 'Priority Expres', to_date('10-12-2023', 'dd-mm-yyyy'), 942);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (29, 95, 'Monitronics Int', to_date('06-06-2022', 'dd-mm-yyyy'), 959);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (885, 299, 'Consultants'' Ch', to_date('07-11-2022', 'dd-mm-yyyy'), 901);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (613, 205, 'TLS Service Bur', to_date('25-05-2022', 'dd-mm-yyyy'), 313);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (653, 235, 'Summit Energy', to_date('21-07-2023', 'dd-mm-yyyy'), 437);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (499, 341, 'Cima Consulting', to_date('22-10-2023', 'dd-mm-yyyy'), 868);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (905, 214, 'Microsoft Corp.', to_date('28-03-2022', 'dd-mm-yyyy'), 931);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (585, 317, 'V-Span', to_date('12-08-2023', 'dd-mm-yyyy'), 567);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (908, 240, 'American Megaco', to_date('04-05-2023', 'dd-mm-yyyy'), 587);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (218, 82, 'Medical Action ', to_date('07-04-2022', 'dd-mm-yyyy'), 530);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (31, 208, 'Technica', to_date('09-03-2023', 'dd-mm-yyyy'), 523);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (520, 108, 'Shirt Factory', to_date('17-01-2022', 'dd-mm-yyyy'), 942);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (586, 316, 'Hi-Tech Pharmac', to_date('22-08-2022', 'dd-mm-yyyy'), 29);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (895, 314, 'Flow Management', to_date('27-04-2022', 'dd-mm-yyyy'), 275);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (871, 178, 'ASAP Staffing', to_date('21-01-2023', 'dd-mm-yyyy'), 180);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (456, 119, 'U.S. Energy Ser', to_date('23-01-2023', 'dd-mm-yyyy'), 70);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (200, 213, 'First American ', to_date('06-08-2023', 'dd-mm-yyyy'), 353);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (322, 237, 'Marlabs', to_date('13-04-2022', 'dd-mm-yyyy'), 934);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (562, 347, 'Synovis Life Te', to_date('30-05-2023', 'dd-mm-yyyy'), 502);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (949, 247, 'IPS Advisory', to_date('20-06-2023', 'dd-mm-yyyy'), 416);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (249, 138, 'Sears, Roebuck ', to_date('30-08-2023', 'dd-mm-yyyy'), 686);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (68, 297, 'Paisley Consult', to_date('21-05-2024', 'dd-mm-yyyy'), 629);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (153, 336, 'Vertex Solution', to_date('13-09-2023', 'dd-mm-yyyy'), 947);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (97, 107, 'MHF Logistical ', to_date('19-03-2024', 'dd-mm-yyyy'), 810);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (960, 317, 'Evergreen Resou', to_date('09-12-2022', 'dd-mm-yyyy'), 313);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (332, 257, 'Diageo', to_date('13-01-2024', 'dd-mm-yyyy'), 994);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (567, 135, 'MicroTek', to_date('28-05-2023', 'dd-mm-yyyy'), 21);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (756, 346, 'Summit Energy', to_date('26-08-2022', 'dd-mm-yyyy'), 234);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (523, 71, 'Uniserve Facili', to_date('16-09-2022', 'dd-mm-yyyy'), 975);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (384, 323, 'Legacy Financia', to_date('19-05-2024', 'dd-mm-yyyy'), 153);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (67, 127, 'Tracer Technolo', to_date('29-07-2023', 'dd-mm-yyyy'), 773);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (374, 240, 'Morgan Research', to_date('15-09-2022', 'dd-mm-yyyy'), 271);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (747, 169, 'Bluff City Stee', to_date('27-11-2022', 'dd-mm-yyyy'), 750);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (536, 208, 'MasterCard Inte', to_date('05-06-2022', 'dd-mm-yyyy'), 627);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (572, 133, 'FlavorX', to_date('31-03-2024', 'dd-mm-yyyy'), 76);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (391, 197, 'Coca-Cola Co.', to_date('30-09-2023', 'dd-mm-yyyy'), 625);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (709, 154, 'Horizon Organic', to_date('13-12-2023', 'dd-mm-yyyy'), 573);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (646, 298, 'Flow Management', to_date('01-08-2022', 'dd-mm-yyyy'), 912);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (794, 180, 'S.C. Johnson & ', to_date('27-04-2024', 'dd-mm-yyyy'), 689);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (151, 325, 'Prosum', to_date('20-04-2024', 'dd-mm-yyyy'), 736);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (575, 329, 'PSC Info Group', to_date('09-05-2024', 'dd-mm-yyyy'), 424);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (376, 290, 'Democracy Data ', to_date('19-12-2022', 'dd-mm-yyyy'), 480);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (417, 141, 'Diamond Pharmac', to_date('14-01-2024', 'dd-mm-yyyy'), 389);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (617, 198, 'Prometheus Labo', to_date('15-09-2022', 'dd-mm-yyyy'), 97);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (714, 241, 'Mattel', to_date('16-08-2022', 'dd-mm-yyyy'), 672);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (15, 204, 'Viacom', to_date('28-07-2023', 'dd-mm-yyyy'), 652);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (668, 129, 'Heartlab', to_date('28-05-2023', 'dd-mm-yyyy'), 405);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (333, 73, 'Tarragon Realty', to_date('14-02-2024', 'dd-mm-yyyy'), 674);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (495, 68, 'American Health', to_date('05-01-2024', 'dd-mm-yyyy'), 183);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (80, 285, 'Network Hardwar', to_date('19-05-2022', 'dd-mm-yyyy'), 128);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (51, 88, 'Diamond Technol', to_date('03-01-2022', 'dd-mm-yyyy'), 791);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (107, 224, 'ATA Services', to_date('08-11-2022', 'dd-mm-yyyy'), 561);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (642, 247, 'Nike', to_date('09-11-2023', 'dd-mm-yyyy'), 995);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (764, 230, 'Pioneer Mortgag', to_date('01-02-2022', 'dd-mm-yyyy'), 263);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (262, 337, 'Federated Depar', to_date('26-06-2022', 'dd-mm-yyyy'), 120);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (564, 204, 'Comnet Internat', to_date('13-11-2022', 'dd-mm-yyyy'), 254);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (647, 202, 'Bristol-Myers S', to_date('13-01-2022', 'dd-mm-yyyy'), 786);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (918, 88, 'AQuickDelivery', to_date('27-02-2022', 'dd-mm-yyyy'), 728);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (179, 120, 'Freedom Medical', to_date('12-02-2022', 'dd-mm-yyyy'), 120);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (856, 139, 'Calence', to_date('28-12-2022', 'dd-mm-yyyy'), 658);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (502, 122, 'First Place Fin', to_date('11-08-2022', 'dd-mm-yyyy'), 514);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (406, 197, 'Business Plus C', to_date('16-12-2023', 'dd-mm-yyyy'), 147);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (434, 294, 'Hencie', to_date('14-04-2022', 'dd-mm-yyyy'), 994);
commit;
prompt 200 records committed...
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (948, 105, 'Data Company', to_date('11-10-2023', 'dd-mm-yyyy'), 691);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (812, 207, 'Hi-Tech Pharmac', to_date('01-04-2022', 'dd-mm-yyyy'), 448);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (869, 330, 'Client Network ', to_date('28-05-2022', 'dd-mm-yyyy'), 736);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (317, 338, 'Professional Pl', to_date('03-06-2022', 'dd-mm-yyyy'), 641);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (959, 86, 'Terra Firma', to_date('17-06-2023', 'dd-mm-yyyy'), 972);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (3, 314, 'American Land L', to_date('28-10-2022', 'dd-mm-yyyy'), 650);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (807, 83, 'Data Company', to_date('17-01-2024', 'dd-mm-yyyy'), 643);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (670, 347, 'Johnson & Johns', to_date('30-11-2022', 'dd-mm-yyyy'), 472);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (890, 185, 'GDA Technologie', to_date('04-12-2022', 'dd-mm-yyyy'), 548);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (861, 68, 'Cardtronics', to_date('01-06-2023', 'dd-mm-yyyy'), 514);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (688, 298, 'Astute', to_date('29-04-2022', 'dd-mm-yyyy'), 432);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (544, 179, 'Multimedia Live', to_date('01-06-2023', 'dd-mm-yyyy'), 789);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (62, 155, 'SBC Communicati', to_date('29-02-2024', 'dd-mm-yyyy'), 20);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (565, 231, 'ConAgra', to_date('19-01-2023', 'dd-mm-yyyy'), 951);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (825, 300, 'KSJ & Associate', to_date('20-04-2024', 'dd-mm-yyyy'), 563);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (610, 203, 'Hudson River Ba', to_date('23-05-2023', 'dd-mm-yyyy'), 942);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (704, 251, 'Portfolio Recov', to_date('19-05-2022', 'dd-mm-yyyy'), 918);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (104, 312, 'Noodles & Co.', to_date('29-03-2022', 'dd-mm-yyyy'), 661);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (239, 233, 'Homebuilders Fi', to_date('03-08-2023', 'dd-mm-yyyy'), 687);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (999, 211, 'GDA Technologie', to_date('23-12-2022', 'dd-mm-yyyy'), 399);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (404, 173, 'Span-America Me', to_date('24-02-2023', 'dd-mm-yyyy'), 338);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (850, 248, 'Horizon Consult', to_date('29-03-2022', 'dd-mm-yyyy'), 275);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (18, 247, 'Quaker City Ban', to_date('31-05-2022', 'dd-mm-yyyy'), 66);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (994, 338, 'Mission West Pr', to_date('27-06-2023', 'dd-mm-yyyy'), 278);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (63, 215, 'Freedom Medical', to_date('06-10-2023', 'dd-mm-yyyy'), 562);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (7, 156, 'Green Mountain ', to_date('29-06-2023', 'dd-mm-yyyy'), 219);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (965, 76, 'Hospital Soluti', to_date('21-09-2022', 'dd-mm-yyyy'), 762);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (954, 74, 'Mosaic', to_date('11-04-2023', 'dd-mm-yyyy'), 659);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (639, 98, 'Parker Compound', to_date('06-12-2023', 'dd-mm-yyyy'), 791);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (85, 83, 'Digital Visual ', to_date('17-03-2023', 'dd-mm-yyyy'), 868);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (526, 190, 'Pulaski Financi', to_date('04-09-2022', 'dd-mm-yyyy'), 170);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (741, 191, 'Conquest', to_date('19-03-2024', 'dd-mm-yyyy'), 523);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (354, 96, 'PepsiCo', to_date('05-12-2022', 'dd-mm-yyyy'), 214);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (237, 192, 'Authoria', to_date('21-01-2024', 'dd-mm-yyyy'), 558);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (894, 254, 'National Herita', to_date('04-01-2024', 'dd-mm-yyyy'), 537);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (997, 248, 'Kimberly-Clark ', to_date('14-01-2024', 'dd-mm-yyyy'), 647);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (740, 305, 'Blue Angel Tech', to_date('04-09-2023', 'dd-mm-yyyy'), 652);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (838, 181, 'Linksys', to_date('08-01-2023', 'dd-mm-yyyy'), 283);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (832, 291, 'Campbell Soup C', to_date('13-10-2022', 'dd-mm-yyyy'), 710);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (410, 209, 'Accurate Autobo', to_date('06-07-2022', 'dd-mm-yyyy'), 537);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (301, 134, 'Nature''s Cure', to_date('21-12-2023', 'dd-mm-yyyy'), 106);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (557, 337, 'Orange Glo Inte', to_date('02-02-2022', 'dd-mm-yyyy'), 871);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (426, 171, 'Larkin Enterpri', to_date('15-05-2022', 'dd-mm-yyyy'), 810);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (599, 265, 'Kimberly-Clark ', to_date('18-07-2022', 'dd-mm-yyyy'), 894);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (593, 53, 'GDA Technologie', to_date('16-05-2024', 'dd-mm-yyyy'), 507);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (492, 233, 'Providence Serv', to_date('14-08-2022', 'dd-mm-yyyy'), 659);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (618, 106, 'Boldtech System', to_date('05-03-2023', 'dd-mm-yyyy'), 567);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (684, 210, 'Kellogg Co.', to_date('13-03-2023', 'dd-mm-yyyy'), 819);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (792, 54, 'Eze Castle Soft', to_date('24-07-2023', 'dd-mm-yyyy'), 186);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (503, 240, 'Joseph Sheairs ', to_date('17-06-2022', 'dd-mm-yyyy'), 782);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (981, 231, 'Genex Technolog', to_date('29-03-2022', 'dd-mm-yyyy'), 728);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (469, 301, 'Ositis Software', to_date('21-03-2022', 'dd-mm-yyyy'), 482);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (478, 152, 'Open Software S', to_date('09-02-2022', 'dd-mm-yyyy'), 560);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (154, 184, 'Great Lakes Tec', to_date('29-03-2024', 'dd-mm-yyyy'), 602);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (672, 58, 'PowerLight', to_date('28-03-2024', 'dd-mm-yyyy'), 419);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (408, 318, 'Hencie', to_date('20-05-2024', 'dd-mm-yyyy'), 147);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (444, 156, 'Imaging Busines', to_date('27-05-2022', 'dd-mm-yyyy'), 949);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (914, 107, 'Alden Systems', to_date('05-06-2023', 'dd-mm-yyyy'), 757);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (292, 127, 'Tigris Consulti', to_date('31-07-2022', 'dd-mm-yyyy'), 166);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (468, 148, 'Multimedia Live', to_date('21-09-2023', 'dd-mm-yyyy'), 481);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (899, 254, 'SCI', to_date('07-09-2022', 'dd-mm-yyyy'), 116);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (122, 266, 'Amerisource Fun', to_date('27-08-2023', 'dd-mm-yyyy'), 721);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (535, 242, 'CapTech Venture', to_date('27-02-2022', 'dd-mm-yyyy'), 563);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (144, 120, 'Comm-Works', to_date('27-03-2024', 'dd-mm-yyyy'), 703);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (605, 61, 'SmartDraw.com', to_date('29-02-2024', 'dd-mm-yyyy'), 629);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (889, 219, 'Vivendi Univers', to_date('02-04-2022', 'dd-mm-yyyy'), 379);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (114, 340, 'VoiceLog', to_date('06-10-2023', 'dd-mm-yyyy'), 10);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (968, 146, 'Flake-Wilkerson', to_date('04-01-2024', 'dd-mm-yyyy'), 290);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (251, 152, 'Sterling Financ', to_date('23-07-2023', 'dd-mm-yyyy'), 985);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (711, 105, 'Eze Castle Soft', to_date('27-01-2024', 'dd-mm-yyyy'), 824);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (165, 104, 'Gillani', to_date('10-09-2022', 'dd-mm-yyyy'), 531);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (574, 252, 'Blue Angel Tech', to_date('08-11-2022', 'dd-mm-yyyy'), 439);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (491, 78, 'Span-America Me', to_date('16-07-2023', 'dd-mm-yyyy'), 518);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (199, 223, 'TEOCO', to_date('25-09-2022', 'dd-mm-yyyy'), 806);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (134, 156, 'Advertising Ven', to_date('26-12-2023', 'dd-mm-yyyy'), 709);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (299, 145, 'Virbac', to_date('22-05-2024', 'dd-mm-yyyy'), 659);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (790, 97, 'Coadvantage Res', to_date('07-12-2022', 'dd-mm-yyyy'), 38);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (132, 271, 'Aventis', to_date('22-08-2022', 'dd-mm-yyyy'), 924);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (783, 310, 'Strategic Produ', to_date('04-03-2022', 'dd-mm-yyyy'), 367);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (120, 235, 'Mitsubishi Moto', to_date('10-06-2023', 'dd-mm-yyyy'), 186);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (843, 111, 'Saks Inc.', to_date('06-01-2022', 'dd-mm-yyyy'), 770);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (730, 276, 'Peerless Manufa', to_date('04-05-2023', 'dd-mm-yyyy'), 119);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (685, 57, 'IntegraMed Amer', to_date('28-03-2023', 'dd-mm-yyyy'), 624);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (757, 122, 'Vitacost.com', to_date('04-05-2023', 'dd-mm-yyyy'), 66);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (198, 198, 'Dell Computer C', to_date('14-05-2024', 'dd-mm-yyyy'), 0);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (855, 119, 'Extreme Pizza', to_date('11-03-2023', 'dd-mm-yyyy'), 460);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (511, 320, 'WRG Services', to_date('11-08-2023', 'dd-mm-yyyy'), 106);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (145, 287, 'Interface Softw', to_date('22-02-2022', 'dd-mm-yyyy'), 337);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (225, 141, 'Cardtronics', to_date('15-07-2023', 'dd-mm-yyyy'), 216);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (170, 177, 'Sensor Technolo', to_date('20-07-2022', 'dd-mm-yyyy'), 610);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (127, 342, 'IBM Corp.', to_date('03-01-2023', 'dd-mm-yyyy'), 536);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (976, 286, 'SALT Group', to_date('14-07-2023', 'dd-mm-yyyy'), 400);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (733, 163, 'Tropical Oasis', to_date('18-08-2022', 'dd-mm-yyyy'), 211);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (870, 334, 'Tripwire', to_date('28-01-2022', 'dd-mm-yyyy'), 546);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (102, 230, 'Mars Inc.', to_date('29-10-2023', 'dd-mm-yyyy'), 672);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (38, 277, 'American Land L', to_date('19-01-2023', 'dd-mm-yyyy'), 260);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (382, 138, 'Direct Data', to_date('18-12-2023', 'dd-mm-yyyy'), 814);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (156, 220, 'Electrical Solu', to_date('14-01-2024', 'dd-mm-yyyy'), 344);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (677, 246, 'Integrated Deci', to_date('27-10-2023', 'dd-mm-yyyy'), 598);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (474, 159, 'Capital Crossin', to_date('23-10-2023', 'dd-mm-yyyy'), 355);
commit;
prompt 300 records committed...
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (620, 72, 'ATX Forms', to_date('13-04-2024', 'dd-mm-yyyy'), 937);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (907, 315, 'Computer Source', to_date('08-06-2023', 'dd-mm-yyyy'), 985);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (820, 304, 'Anheuser-Busch ', to_date('07-04-2022', 'dd-mm-yyyy'), 39);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (606, 256, 'Amerisource Fun', to_date('27-01-2022', 'dd-mm-yyyy'), 15);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (923, 271, 'Paisley Consult', to_date('01-09-2022', 'dd-mm-yyyy'), 205);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (801, 271, 'IVCi', to_date('27-04-2022', 'dd-mm-yyyy'), 134);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (42, 325, 'Sterling Financ', to_date('30-05-2024', 'dd-mm-yyyy'), 537);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (400, 67, 'Biosite', to_date('22-07-2022', 'dd-mm-yyyy'), 148);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (1, 247, 'Mindworks', to_date('18-11-2023', 'dd-mm-yyyy'), 271);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (445, 193, 'Meridian Gold', to_date('07-02-2024', 'dd-mm-yyyy'), 537);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (34, 178, 'Solution Builde', to_date('27-03-2023', 'dd-mm-yyyy'), 615);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (992, 229, 'Sandy Spring Ba', to_date('12-03-2022', 'dd-mm-yyyy'), 306);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (429, 350, 'Prosperity Banc', to_date('10-12-2023', 'dd-mm-yyyy'), 46);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (658, 262, 'Calence', to_date('09-04-2022', 'dd-mm-yyyy'), 763);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (450, 153, 'U.S. Government', to_date('23-05-2022', 'dd-mm-yyyy'), 675);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (167, 169, 'S.C. Johnson & ', to_date('17-03-2024', 'dd-mm-yyyy'), 728);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (938, 341, 'Infinity Contra', to_date('03-08-2023', 'dd-mm-yyyy'), 934);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (238, 52, 'MindIQ', to_date('03-09-2023', 'dd-mm-yyyy'), 946);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (743, 329, 'Synovis Life Te', to_date('04-03-2022', 'dd-mm-yyyy'), 721);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (375, 229, 'AT&T Corp.', to_date('03-09-2023', 'dd-mm-yyyy'), 106);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (933, 90, 'SPS Commerce', to_date('12-12-2022', 'dd-mm-yyyy'), 331);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (828, 161, 'Synhrgy HR Tech', to_date('28-08-2023', 'dd-mm-yyyy'), 405);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (505, 164, 'Data Company', to_date('19-08-2022', 'dd-mm-yyyy'), 481);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (240, 50, 'Analytics Opera', to_date('10-01-2022', 'dd-mm-yyyy'), 358);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (266, 94, 'Auction Systems', to_date('13-04-2024', 'dd-mm-yyyy'), 885);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (874, 251, 'Invision.com', to_date('04-05-2022', 'dd-mm-yyyy'), 833);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (283, 129, 'PrivateBancorp', to_date('10-05-2022', 'dd-mm-yyyy'), 598);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (581, 180, 'Colgate-Palmoli', to_date('31-01-2023', 'dd-mm-yyyy'), 472);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (129, 219, 'Heritage Microf', to_date('02-08-2022', 'dd-mm-yyyy'), 419);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (922, 329, 'Asta Funding', to_date('03-08-2023', 'dd-mm-yyyy'), 650);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (945, 319, 'AOL Time Warner', to_date('17-03-2023', 'dd-mm-yyyy'), 397);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (819, 322, 'Procurement Cen', to_date('06-08-2023', 'dd-mm-yyyy'), 119);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (17, 140, 'Alogent', to_date('22-04-2022', 'dd-mm-yyyy'), 614);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (597, 325, 'Brandt Informat', to_date('02-10-2023', 'dd-mm-yyyy'), 231);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (348, 291, 'Palm Beach Tan', to_date('29-08-2023', 'dd-mm-yyyy'), 232);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (775, 147, 'Great Lakes Med', to_date('25-01-2022', 'dd-mm-yyyy'), 842);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (364, 217, 'ZonePerfect Nut', to_date('26-01-2023', 'dd-mm-yyyy'), 389);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (311, 78, 'Blue Pumpkin So', to_date('01-09-2023', 'dd-mm-yyyy'), 819);
commit;
prompt 338 records loaded
prompt Loading PASSENGER...
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Luca', 181, '059-2345678', 1081, to_date('05-06-2003', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Lucy', 182, '059-3456789', 1082, to_date('08-10-1952', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Luis', 183, '059-4567890', 1083, to_date('11-06-1991', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Andy', 106, '050-7890123', 1006, to_date('06-07-1959', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Axel', 110, '052-1234567', 1010, to_date('23-09-2013', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Beau', 113, '052-4567890', 1013, to_date('19-07-2012', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Brad', 116, '052-7890123', 1016, to_date('16-09-2007', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Clay', 120, '053-1234567', 1020, to_date('15-04-1973', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Cruz', 123, '053-4567890', 1023, to_date('28-05-2013', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Dani', 126, '053-7890123', 1026, to_date('22-05-2019', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Duan', 130, '054-1234567', 1030, to_date('04-06-2001', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Edie', 133, '054-4567890', 1033, to_date('22-06-2019', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Evan', 137, '054-8901234', 1037, to_date('10-11-2000', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Gail', 140, '055-1234567', 1040, to_date('21-08-1987', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Glen', 143, '055-4567890', 1043, to_date('29-06-2012', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Herb', 147, '055-8901234', 1047, to_date('20-11-1957', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Jack', 150, '056-1234567', 1050, to_date('10-12-2006', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Jane', 153, '056-4567890', 1053, to_date('29-07-1953', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Jeff', 157, '056-8901234', 1057, to_date('11-10-1995', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Jill', 160, '057-1234567', 1060, to_date('06-03-1955', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('John', 164, '057-5678901', 1064, to_date('28-11-1978', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Jude', 167, '057-8901234', 1067, to_date('13-03-1978', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Katy', 170, '058-1234567', 1070, to_date('25-11-1972', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Leah', 174, '058-5678901', 1074, to_date('02-12-2006', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Lily', 177, '058-8901234', 1077, to_date('10-11-1961', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Lori', 180, '059-1234567', 1080, to_date('05-05-1998', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Mace', 185, '059-6789012', 1085, to_date('06-10-1957', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Owen', 199, '072-0123456', 1099, to_date('14-03-1994', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Sam', 214, '074-5678901', 1114, to_date('26-03-2000', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Ty', 228, '076-9012345', 1128, to_date('08-07-2002', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Bing', 241, '078-2345678', 1141, to_date('08-03-2008', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Darl', 256, '079-7890123', 1156, to_date('24-08-2006', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Ford', 270, '081-1234567', 1170, to_date('16-10-1950', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Jame', 285, '082-6789012', 1185, to_date('24-07-1976', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Liza', 305, '084-6789012', 1205, to_date('15-10-2009', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Paul', 326, '086-7890123', 1226, to_date('28-08-1962', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Ally', 104, '050-5678901', 1004, to_date('15-03-1995', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Dana', 125, '053-6789012', 1025, to_date('03-06-1968', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Hank', 145, '055-6789012', 1045, to_date('14-04-2004', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Juan', 166, '057-7890123', 1066, to_date('03-09-2007', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('shay', 605, '058-1458796', 1400, to_date('15-02-2000', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('yosi', 606, '054-8596487', 1401, to_date('05-07-2024', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('hadas', 900, '0528745896', 1402, to_date('14-02-2000', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('maayan', 903, '0512214074', 1403, to_date('15-07-2000', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('maayan', 904, '0512214074', 1404, to_date('15-07-2000', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('naama', 906, '0518745698', 1405, to_date('15-08-2019', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('maayan', 908, '0512214074', 1406, to_date('15-07-2000', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('naama', 909, '0518745698', 1407, to_date('15-08-2019', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('naama', 914, '0512214074', 1408, to_date('15-07-2000', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Lois', 179, '058-0123456', 1079, to_date('02-12-1993', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Nils', 321, '086-2345678', 1221, to_date('30-10-2018', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Paco', 325, '086-6789012', 1225, to_date('28-09-1997', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Quinn', 328, '086-9012345', 1228, to_date('20-11-1967', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Rhys', 332, '087-3456789', 1232, to_date('22-05-1994', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Ross', 335, '087-6789012', 1235, to_date('05-09-1981', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Saul', 338, '087-9012345', 1238, to_date('16-06-1994', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Abby', 100, '050-1234567', 1000, to_date('03-02-2015', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Alex', 103, '050-4567890', 1003, to_date('24-09-1958', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Luke', 184, '059-5678901', 1084, to_date('10-05-2014', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Mara', 186, '059-7890123', 1086, to_date('03-08-1963', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Mark', 187, '059-8901234', 1087, to_date('06-02-1979', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Mary', 188, '059-9012345', 1088, to_date('17-05-1984', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Matt', 189, '059-0123456', 1089, to_date('21-11-1964', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Max', 190, '072-1234567', 1090, to_date('26-04-1961', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Maya', 191, '072-2345678', 1091, to_date('11-03-1968', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Meg', 192, '072-3456789', 1092, to_date('09-05-1952', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Mike', 193, '072-4567890', 1093, to_date('14-03-1950', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Nate', 194, '072-5678901', 1094, to_date('17-07-2014', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Neal', 195, '072-6789012', 1095, to_date('16-11-1993', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Nick', 196, '072-7890123', 1096, to_date('25-12-1957', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Noah', 197, '072-8901234', 1097, to_date('18-01-1953', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Noel', 198, '072-9012345', 1098, to_date('23-02-2014', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Paul', 200, '073-1234567', 1100, to_date('31-10-2003', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Pete', 201, '073-2345678', 1101, to_date('06-10-2006', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Phil', 202, '073-3456789', 1102, to_date('23-09-2013', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Quinn', 203, '073-4567890', 1103, to_date('22-07-1972', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Raul', 204, '073-5678901', 1104, to_date('14-07-1987', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Reed', 205, '073-6789012', 1105, to_date('30-09-2012', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Rhys', 206, '073-7890123', 1106, to_date('12-05-2012', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Rick', 207, '073-8901234', 1107, to_date('14-09-1960', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Rob', 208, '073-9012345', 1108, to_date('01-03-1953', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Rolf', 209, '073-0123456', 1109, to_date('30-03-2013', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Rosa', 210, '074-1234567', 1110, to_date('07-08-1994', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Ross', 211, '074-2345678', 1111, to_date('25-02-1990', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Ryan', 212, '074-3456789', 1112, to_date('30-01-1980', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Sage', 213, '074-4567890', 1113, to_date('04-09-1978', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Sean', 215, '074-6789012', 1115, to_date('23-03-1953', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Seth', 216, '074-7890123', 1116, to_date('09-08-1964', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Shaw', 217, '074-8901234', 1117, to_date('06-10-1966', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Stan', 218, '074-9012345', 1118, to_date('11-03-1957', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Tate', 219, '074-0123456', 1119, to_date('23-09-1977', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Teri', 220, '076-1234567', 1120, to_date('11-07-1981', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Tess', 221, '076-2345678', 1121, to_date('13-12-1956', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Toby', 222, '076-3456789', 1122, to_date('11-08-1980', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Todd', 223, '076-4567890', 1123, to_date('19-10-1973', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Tom', 224, '076-5678901', 1124, to_date('04-07-2017', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Tony', 225, '076-6789012', 1125, to_date('01-11-2019', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Trey', 226, '076-7890123', 1126, to_date('07-11-1955', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Troy', 227, '076-8901234', 1127, to_date('21-07-2017', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Vera', 229, '076-0123456', 1129, to_date('10-01-1958', 'dd-mm-yyyy'));
commit;
prompt 100 records committed...
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Vince', 230, '077-1234567', 1130, to_date('08-07-1978', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Wade', 231, '077-2345678', 1131, to_date('15-09-2002', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Walt', 232, '077-3456789', 1132, to_date('21-07-1984', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Will', 233, '077-4567890', 1133, to_date('30-08-1961', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Wynn', 234, '077-5678901', 1134, to_date('11-12-2016', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Zane', 235, '077-6789012', 1135, to_date('19-03-2019', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Zara', 236, '077-7890123', 1136, to_date('02-04-1987', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Zoey', 237, '077-8901234', 1137, to_date('02-07-2007', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Aida', 238, '077-9012345', 1138, to_date('07-06-1969', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Amos', 239, '077-0123456', 1139, to_date('08-07-2017', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Beau', 240, '078-1234567', 1140, to_date('20-01-1951', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Boyd', 242, '078-3456789', 1142, to_date('03-04-2019', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Bryn', 243, '078-4567890', 1143, to_date('16-06-2014', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Cade', 244, '078-5678901', 1144, to_date('26-07-1993', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Cain', 245, '078-6789012', 1145, to_date('21-07-2011', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Cate', 246, '078-7890123', 1146, to_date('01-06-1971', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Chad', 247, '078-8901234', 1147, to_date('16-12-1966', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Cher', 248, '078-9012345', 1148, to_date('17-12-1966', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Chip', 249, '078-0123456', 1149, to_date('13-10-1951', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Clem', 250, '079-1234567', 1150, to_date('27-08-1951', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Cole', 251, '079-2345678', 1151, to_date('04-07-1989', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Cory', 252, '079-3456789', 1152, to_date('01-01-1960', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Cruz', 253, '079-4567890', 1153, to_date('21-10-1974', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Cyan', 254, '079-5678901', 1154, to_date('30-12-2017', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Dale', 255, '079-6789012', 1155, to_date('20-05-2001', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Davy', 257, '079-8901234', 1157, to_date('31-07-2019', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Dean', 258, '079-9012345', 1158, to_date('27-02-1970', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Drew', 259, '079-0123456', 1159, to_date('04-02-1970', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Earl', 260, '080-1234567', 1160, to_date('27-10-1950', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Eden', 261, '080-2345678', 1161, to_date('05-12-1970', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Edie', 262, '080-3456789', 1162, to_date('29-05-2013', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Elio', 263, '080-4567890', 1163, to_date('20-09-1987', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Elly', 264, '080-5678901', 1164, to_date('15-12-1954', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Eryn', 265, '080-6789012', 1165, to_date('04-08-1991', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Evan', 266, '080-7890123', 1166, to_date('30-05-1989', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Ezra', 267, '080-8901234', 1167, to_date('01-05-2017', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Faye', 268, '080-9012345', 1168, to_date('23-03-1966', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Finn', 269, '080-0123456', 1169, to_date('01-09-2019', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Fred', 271, '081-2345678', 1171, to_date('29-08-1965', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Gale', 272, '081-3456789', 1172, to_date('29-12-1954', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Gary', 273, '081-4567890', 1173, to_date('28-06-1956', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Gena', 274, '081-5678901', 1174, to_date('26-03-1972', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Glen', 275, '081-6789012', 1175, to_date('21-02-1955', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Hank', 276, '081-7890123', 1176, to_date('03-07-2018', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Hans', 277, '081-8901234', 1177, to_date('09-01-2002', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Hank', 278, '081-9012345', 1178, to_date('04-10-1990', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Hugh', 279, '081-0123456', 1179, to_date('07-07-1964', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Imre', 280, '082-1234567', 1180, to_date('30-08-1951', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Jace', 281, '082-2345678', 1181, to_date('03-07-1957', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Jada', 282, '082-3456789', 1182, to_date('09-02-1987', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Jade', 283, '082-4567890', 1183, to_date('07-07-2012', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Jake', 284, '082-5678901', 1184, to_date('31-10-1982', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Javi', 286, '082-7890123', 1186, to_date('19-02-1984', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Jean', 287, '082-8901234', 1187, to_date('31-03-1971', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Joel', 289, '082-0123456', 1189, to_date('16-04-1961', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Joey', 290, '083-1234567', 1190, to_date('24-02-1967', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('June', 292, '083-3456789', 1192, to_date('09-05-1969', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Kara', 293, '083-4567890', 1193, to_date('27-01-1988', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Kate', 295, '083-6789012', 1195, to_date('22-06-1958', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Katy', 296, '083-7890123', 1196, to_date('21-11-1962', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Kyle', 297, '083-8901234', 1197, to_date('13-04-1985', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Lara', 299, '083-0123456', 1199, to_date('04-01-1956', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Lars', 300, '084-1234567', 1200, to_date('28-10-1979', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Leon', 302, '084-3456789', 1202, to_date('16-09-1988', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Liam', 303, '084-4567890', 1203, to_date('01-11-2011', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Lou', 306, '084-7890123', 1206, to_date('07-04-2011', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Luca', 307, '084-8901234', 1207, to_date('15-03-1972', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Mack', 309, '084-0123456', 1209, to_date('14-08-1982', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Mae', 310, '085-1234567', 1210, to_date('15-12-1971', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Mary', 312, '085-3456789', 1212, to_date('09-04-1958', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Matt', 313, '085-4567890', 1213, to_date('19-11-1973', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Max', 314, '085-5678901', 1214, to_date('25-08-1994', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Nala', 316, '085-7890123', 1216, to_date('20-07-1958', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Nate', 317, '085-8901234', 1217, to_date('16-11-1956', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Neil', 319, '085-0123456', 1219, to_date('20-10-1988', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Nick', 320, '086-1234567', 1220, to_date('24-11-2015', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Noah', 322, '086-3456789', 1222, to_date('22-04-2008', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Noel', 323, '086-4567890', 1223, to_date('17-02-1957', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Owen', 324, '086-5678901', 1224, to_date('07-04-2007', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Pete', 327, '086-8901234', 1227, to_date('26-08-1983', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Ralf', 329, '086-0123456', 1229, to_date('27-06-1997', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Reid', 330, '087-1234567', 1230, to_date('04-08-1977', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Rene', 331, '087-2345678', 1231, to_date('17-12-2008', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Rick', 333, '087-4567890', 1233, to_date('31-03-1966', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Rolf', 334, '087-5678901', 1234, to_date('27-09-2008', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Ryan', 336, '087-7890123', 1236, to_date('06-10-2008', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Sage', 337, '087-8901234', 1237, to_date('13-06-1985', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Sean', 339, '087-0123456', 1239, to_date('12-09-1974', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Seth', 340, '088-1234567', 1240, to_date('08-08-1962', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Shea', 341, '088-2345678', 1241, to_date('26-01-1986', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Adam', 101, '050-2345678', 1001, to_date('02-09-1971', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Alan', 102, '050-3456789', 1002, to_date('25-10-1984', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Amir', 105, '050-6789012', 1005, to_date('11-02-1964', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Anne', 107, '050-8901234', 1007, to_date('06-12-2014', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Aria', 108, '050-9012345', 1008, to_date('24-10-2009', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Aron', 109, '050-0123456', 1009, to_date('11-04-1954', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Barb', 111, '052-2345678', 1011, to_date('03-06-1953', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Bart', 112, '052-3456789', 1012, to_date('21-06-1986', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Beth', 114, '052-5678901', 1014, to_date('07-12-1959', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Bill', 115, '052-6789012', 1015, to_date('22-05-1981', 'dd-mm-yyyy'));
commit;
prompt 200 records committed...
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Burt', 117, '052-8901234', 1017, to_date('20-10-1961', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Carl', 118, '052-9012345', 1018, to_date('10-02-1951', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Chad', 119, '052-0123456', 1019, to_date('16-09-1989', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Cody', 121, '053-2345678', 1021, to_date('13-05-2015', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Cory', 122, '053-3456789', 1022, to_date('30-01-1980', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Dale', 124, '053-5678901', 1024, to_date('07-08-1959', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Dave', 127, '053-8901234', 1027, to_date('18-06-1954', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Dean', 128, '053-9012345', 1028, to_date('04-01-1982', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Drew', 129, '053-0123456', 1029, to_date('09-10-1951', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Duke', 131, '054-2345678', 1031, to_date('17-12-2005', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Earl', 132, '054-3456789', 1032, to_date('24-06-1990', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Ella', 134, '054-5678901', 1034, to_date('17-04-1974', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Elle', 135, '054-6789012', 1035, to_date('02-04-1972', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Eric', 136, '054-7890123', 1036, to_date('11-08-1968', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Finn', 138, '054-9012345', 1038, to_date('10-07-1977', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Fran', 139, '054-0123456', 1039, to_date('30-04-1977', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Gary', 141, '055-2345678', 1041, to_date('14-07-1964', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Gina', 142, '055-3456789', 1042, to_date('30-11-1953', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Greg', 144, '055-5678901', 1044, to_date('10-04-2008', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Hans', 146, '055-7890123', 1046, to_date('09-10-2006', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Hugh', 148, '055-9012345', 1048, to_date('22-06-2003', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Ian', 149, '055-0123456', 1049, to_date('31-12-1987', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Jade', 151, '056-2345678', 1051, to_date('16-08-1989', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Jake', 152, '056-3456789', 1052, to_date('12-05-2018', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Jase', 154, '056-5678901', 1054, to_date('25-02-1961', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Javi', 155, '056-6789012', 1055, to_date('23-03-1992', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Jean', 156, '056-7890123', 1056, to_date('31-05-1982', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Jenn', 158, '056-9012345', 1058, to_date('29-03-2018', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Jess', 159, '056-0123456', 1059, to_date('09-07-1988', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Jodi', 161, '057-2345678', 1061, to_date('25-01-2019', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Joel', 162, '057-3456789', 1062, to_date('07-10-1963', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Joey', 163, '057-4567890', 1063, to_date('28-05-1953', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Josh', 165, '057-6789012', 1065, to_date('24-11-1992', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Kara', 168, '057-9012345', 1068, to_date('24-07-2018', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Kate', 169, '057-0123456', 1069, to_date('31-08-1984', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Kaye', 171, '058-2345678', 1071, to_date('15-03-2013', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Kyle', 172, '058-3456789', 1072, to_date('27-10-1970', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Lana', 173, '058-4567890', 1073, to_date('21-03-1987', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Liam', 175, '058-6789012', 1075, to_date('14-09-1960', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Lila', 176, '058-7890123', 1076, to_date('30-01-2003', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Lisa', 178, '058-9012345', 1078, to_date('13-05-2010', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Matt', 458, '099-9012345', 1358, to_date('14-06-1961', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Maya', 459, '099-0123456', 1359, to_date('12-08-1993', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Mike', 460, '070-1234567', 1360, to_date('30-06-2015', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Nate', 461, '070-2345678', 1361, to_date('01-01-2007', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Nick', 462, '070-3456789', 1362, to_date('08-11-2016', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Noah', 463, '070-4567890', 1363, to_date('24-12-1988', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Owen', 464, '070-5678901', 1364, to_date('11-05-1982', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Paul', 465, '070-6789012', 1365, to_date('19-05-1963', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Pete', 467, '070-7890123', 1366, to_date('17-08-1970', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Quinn', 468, '070-8901234', 1367, to_date('02-10-1998', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Reed', 469, '070-9012345', 1368, to_date('22-04-2001', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Rick', 470, '070-0123456', 1369, to_date('08-10-1989', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Rob', 471, '071-1234567', 1370, to_date('16-05-1959', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Ryan', 472, '071-2345678', 1371, to_date('18-06-2015', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Seth', 473, '071-3456789', 1372, to_date('23-12-2016', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Stan', 474, '071-4567890', 1373, to_date('01-07-1966', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Tate', 475, '071-5678901', 1374, to_date('10-07-2000', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Toby', 476, '071-6789012', 1375, to_date('20-04-2011', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Todd', 477, '071-7890123', 1376, to_date('01-06-1957', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Tom', 478, '071-8901234', 1377, to_date('23-09-2001', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Troy', 479, '071-9012345', 1378, to_date('01-10-1972', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Wade', 480, '071-0123456', 1379, to_date('23-06-2006', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Will', 481, '073-1234567', 1380, to_date('22-06-2001', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Zane', 482, '073-2345678', 1381, to_date('20-10-1981', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Zoey', 483, '073-3456789', 1382, to_date('09-12-1982', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Amir', 484, '073-4567890', 1383, to_date('07-01-2008', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Aida', 485, '073-5678901', 1384, to_date('30-11-1998', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Bing', 486, '073-6789012', 1385, to_date('02-02-1958', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Cate', 487, '073-7890123', 1386, to_date('29-10-1961', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Clem', 488, '073-8901234', 1387, to_date('17-05-1975', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Cory', 489, '073-9012345', 1388, to_date('11-05-1995', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Cyan', 490, '073-0123456', 1389, to_date('18-03-1950', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Davy', 491, '074-1234567', 1390, to_date('22-06-1958', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Elio', 492, '074-2345678', 1391, to_date('30-07-2005', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Faye', 493, '074-3456789', 1392, to_date('16-07-1983', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Gena', 494, '074-4567890', 1393, to_date('03-07-1991', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Hans', 495, '074-5678901', 1394, to_date('28-10-1958', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Imre', 496, '074-6789012', 1395, to_date('04-11-1956', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Jace', 497, '074-7890123', 1396, to_date('05-03-1953', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Jame', 498, '074-8901234', 1397, to_date('17-01-1998', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Lane', 499, '074-9012345', 1398, to_date('22-04-2013', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Lara', 500, '074-5874123', 1399, to_date('20-08-1966', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Jess', 288, '082-9012345', 1188, to_date('02-08-2015', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('John', 291, '083-2345678', 1191, to_date('03-06-1962', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Karl', 294, '083-5678901', 1194, to_date('13-06-1971', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Lane', 298, '083-9012345', 1198, to_date('22-04-2017', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Stan', 342, '088-3456789', 1242, to_date('18-07-1989', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Tate', 343, '088-4567890', 1243, to_date('18-02-1988', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Todd', 344, '088-5678901', 1244, to_date('23-10-1992', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Tom', 345, '088-6789012', 1245, to_date('26-01-1983', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Toni', 346, '088-7890123', 1246, to_date('11-07-1960', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Tory', 347, '088-8901234', 1247, to_date('03-08-1990', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Trey', 348, '088-9012345', 1248, to_date('12-04-2004', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Troy', 349, '088-0123456', 1249, to_date('05-03-1952', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Tyra', 350, '089-1234567', 1250, to_date('01-03-1965', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Vick', 351, '089-2345678', 1251, to_date('16-08-2018', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Walt', 352, '089-3456789', 1252, to_date('10-02-1974', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Will', 353, '089-4567890', 1253, to_date('07-04-2004', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Yves', 354, '089-5678901', 1254, to_date('11-05-2009', 'dd-mm-yyyy'));
commit;
prompt 300 records committed...
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Zane', 355, '089-6789012', 1255, to_date('26-08-1962', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Zeke', 356, '089-7890123', 1256, to_date('08-08-1998', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Zola', 357, '089-8901234', 1257, to_date('10-04-1997', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Axel', 358, '089-9012345', 1258, to_date('06-10-1988', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Brad', 359, '089-0123456', 1259, to_date('14-12-1967', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Brie', 360, '090-1234567', 1260, to_date('12-08-1959', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Cary', 361, '090-2345678', 1261, to_date('17-08-1969', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Chad', 362, '090-3456789', 1262, to_date('19-01-1992', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Clay', 363, '090-4567890', 1263, to_date('06-06-1967', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Dale', 364, '090-5678901', 1264, to_date('16-02-1960', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Dean', 365, '090-6789012', 1265, to_date('06-07-2015', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Edie', 366, '090-7890123', 1266, to_date('27-11-1970', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Ella', 367, '090-8901234', 1267, to_date('15-03-1965', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Erik', 368, '090-9012345', 1268, to_date('08-11-2011', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Faye', 369, '090-0123456', 1269, to_date('16-01-2013', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Finn', 370, '091-1234567', 1270, to_date('19-12-2012', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Fred', 371, '091-2345678', 1271, to_date('02-01-1985', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Greg', 372, '091-3456789', 1272, to_date('30-05-2012', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Hank', 373, '091-4567890', 1273, to_date('21-06-1975', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Hugh', 374, '091-5678901', 1274, to_date('23-06-1983', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Ivan', 375, '091-6789012', 1275, to_date('23-10-1961', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Jack', 376, '091-7890123', 1276, to_date('08-04-1993', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Jake', 377, '091-8901234', 1277, to_date('25-07-1975', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Jeff', 378, '091-9012345', 1278, to_date('20-08-2003', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Joel', 379, '091-0123456', 1279, to_date('21-12-1961', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('John', 380, '092-1234567', 1280, to_date('02-03-1957', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Juan', 381, '092-2345678', 1281, to_date('25-05-1961', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Kent', 382, '092-3456789', 1282, to_date('03-01-1986', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Lara', 383, '092-4567890', 1283, to_date('03-03-1997', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Liam', 384, '092-5678901', 1284, to_date('02-12-1979', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Lois', 385, '092-6789012', 1285, to_date('26-05-1951', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Luca', 386, '092-7890123', 1286, to_date('16-02-1985', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Mack', 387, '092-8901234', 1287, to_date('09-08-1991', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Mark', 388, '092-9012345', 1288, to_date('03-11-1975', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Neil', 389, '092-0123456', 1289, to_date('18-06-1980', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Nick', 390, '093-1234567', 1290, to_date('24-08-1980', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Owen', 391, '093-2345678', 1291, to_date('23-06-1983', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Paul', 392, '093-3456789', 1292, to_date('30-11-1954', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Raul', 393, '093-4567890', 1293, to_date('20-01-2013', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Rhys', 394, '093-5678901', 1294, to_date('01-09-2019', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Rick', 395, '093-6789012', 1295, to_date('23-05-1965', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Ross', 396, '093-7890123', 1296, to_date('16-03-1992', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Ryan', 397, '093-8901234', 1297, to_date('14-06-2010', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Saul', 398, '093-9012345', 1298, to_date('03-05-2003', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Seth', 399, '093-0123456', 1299, to_date('16-09-1984', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Stan', 400, '094-1234567', 1300, to_date('28-02-1976', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Todd', 401, '094-2345678', 1301, to_date('17-07-1953', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Troy', 402, '094-3456789', 1302, to_date('22-08-1955', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Vera', 403, '094-4567890', 1303, to_date('27-09-1996', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Walt', 404, '094-5678901', 1304, to_date('24-08-1977', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Zane', 405, '094-6789012', 1305, to_date('22-08-1998', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Abby', 406, '094-7890123', 1306, to_date('25-06-1960', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Adam', 407, '094-8901234', 1307, to_date('19-05-2017', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Alan', 408, '094-9012345', 1308, to_date('17-11-1959', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Alex', 409, '094-0123456', 1309, to_date('14-01-1993', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Amir', 410, '095-1234567', 1310, to_date('15-08-1974', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Andy', 411, '095-2345678', 1311, to_date('07-10-2005', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Anne', 412, '095-3456789', 1312, to_date('01-09-2008', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Aron', 413, '095-4567890', 1313, to_date('27-10-1954', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Axel', 414, '095-5678901', 1314, to_date('14-02-2015', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Barb', 415, '095-6789012', 1315, to_date('12-07-1989', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Bart', 416, '095-7890123', 1316, to_date('10-01-1971', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Beau', 417, '095-8901234', 1317, to_date('24-03-1957', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Bill', 418, '095-9012345', 1318, to_date('12-01-2009', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Brad', 419, '095-0123456', 1319, to_date('19-12-1985', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Carl', 420, '096-1234567', 1320, to_date('08-01-1976', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Chad', 421, '096-2345678', 1321, to_date('21-07-2001', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Cody', 422, '096-3456789', 1322, to_date('05-09-1998', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Cory', 423, '096-4567890', 1323, to_date('06-10-2016', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Cruz', 424, '096-5678901', 1324, to_date('23-02-2006', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Dana', 425, '096-6789012', 1325, to_date('05-09-2012', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Dani', 426, '096-7890123', 1326, to_date('25-05-2000', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Dave', 427, '096-8901234', 1327, to_date('31-08-1984', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Drew', 428, '096-9012345', 1328, to_date('20-12-1965', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Duke', 429, '096-0123456', 1329, to_date('09-11-1966', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Earl', 430, '097-1234567', 1330, to_date('09-07-1996', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Evan', 431, '097-2345678', 1331, to_date('06-06-2019', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Finn', 432, '097-3456789', 1332, to_date('08-02-1979', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Gail', 433, '097-4567890', 1333, to_date('10-04-2009', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Gary', 434, '097-5678901', 1334, to_date('16-09-2008', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Glen', 435, '097-6789012', 1335, to_date('24-10-1984', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Greg', 436, '097-7890123', 1336, to_date('13-01-2010', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Hugh', 437, '097-8901234', 1337, to_date('27-06-1996', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Jack', 438, '097-9012345', 1338, to_date('07-08-1994', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Jade', 439, '097-0123456', 1339, to_date('17-10-1989', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Jake', 440, '098-1234567', 1340, to_date('09-06-1994', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Jane', 441, '098-2345678', 1341, to_date('01-10-2009', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Joel', 442, '098-3456789', 1342, to_date('02-06-1977', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Joey', 443, '098-4567890', 1343, to_date('22-07-1964', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('John', 444, '098-5678901', 1344, to_date('13-04-1985', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Josh', 445, '098-6789012', 1345, to_date('26-10-1975', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Jude', 446, '098-7890123', 1346, to_date('19-01-1953', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Kyle', 447, '098-8901234', 1347, to_date('09-12-1975', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Lana', 448, '098-9012345', 1348, to_date('01-05-1950', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Leah', 449, '098-0123456', 1349, to_date('29-09-2008', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Liam', 450, '099-1234567', 1350, to_date('11-05-2001', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Lily', 451, '099-2345678', 1351, to_date('24-03-2018', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Luca', 452, '099-3456789', 1352, to_date('19-01-1992', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Lucy', 453, '099-4567890', 1353, to_date('22-01-1982', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Luis', 454, '099-5678901', 1354, to_date('10-07-1981', 'dd-mm-yyyy'));
commit;
prompt 400 records committed...
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Luke', 455, '099-6789012', 1355, to_date('09-05-1962', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Mark', 456, '099-7890123', 1356, to_date('22-03-2016', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Mary', 457, '099-8901234', 1357, to_date('14-01-2006', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Leah', 301, '084-2345678', 1201, to_date('17-04-1955', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Lisa', 304, '084-5678901', 1204, to_date('05-12-1981', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Lyle', 308, '084-9012345', 1208, to_date('28-07-2009', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Mark', 311, '085-2345678', 1211, to_date('20-06-1999', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Mike', 315, '085-6789012', 1215, to_date('01-11-1963', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Neal', 318, '085-9012345', 1218, to_date('09-04-2004', 'dd-mm-yyyy'));
commit;
prompt 409 records loaded
prompt Loading PAYMENT...
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (28, 269, 0, 173, 675);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (333, 174, 0, 9, 731);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (292, 771, 1, 114, 26);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (756, 598, 0, 149, 480);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (864, 904, 0, 40, 601);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (456, 873, 0, 150, 663);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (685, 680, 1, 55, 709);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (670, 364, 0, 33, 723);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (344, 214, 0, 68, 833);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (51, 908, 0, 98, 458);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (233, 337, 0, 44, 536);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (151, 183, 1, 73, 234);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (673, 402, 1, 51, 819);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (459, 460, 1, 170, 894);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (338, 303, 0, 85, 915);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (651, 665, 1, 40, 0);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (895, 848, 0, 67, 573);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (411, 103, 0, 21, 374);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (928, 239, 1, 82, 934);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (103, 997, 1, 146, 540);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (587, 376, 0, 43, 641);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (982, 148, 1, 120, 590);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (451, 757, 0, 68, 710);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (316, 684, 0, 151, 255);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (847, 220, 1, 165, 548);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (318, 499, 1, 165, 601);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (345, 709, 0, 55, 512);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (341, 598, 0, 187, 494);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (591, 931, 0, 172, 857);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (775, 213, 0, 112, 888);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (623, 869, 1, 104, 481);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (226, 259, 1, 68, 260);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (359, 847, 0, 159, 374);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (885, 146, 0, 93, 456);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (296, 896, 0, 68, 386);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (723, 706, 0, 5, 736);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (428, 406, 0, 54, 788);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (8, 590, 1, 33, 663);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (811, 849, 0, 59, 219);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (78, 472, 0, 65, 791);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (791, 683, 0, 13, 723);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (285, 707, 0, 102, 731);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (802, 820, 1, 142, 482);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (568, 182, 1, 94, 163);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (991, 114, 0, 87, 468);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (352, 771, 1, 140, 437);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (268, 545, 0, 56, 413);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (351, 483, 1, 186, 337);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (773, 312, 0, 20, 870);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (578, 490, 1, 108, 567);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (747, 822, 1, 165, 46);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (371, 201, 0, 32, 708);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (492, 830, 1, 35, 120);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (690, 868, 0, 22, 709);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (47, 192, 0, 98, 472);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (298, 966, 1, 190, 806);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (416, 743, 1, 75, 341);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (899, 210, 1, 109, 903);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (309, 375, 1, 20, 924);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (737, 453, 0, 93, 638);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (382, 842, 0, 91, 835);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (879, 272, 1, 183, 242);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (476, 863, 0, 76, 406);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (193, 720, 1, 157, 218);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (458, 472, 0, 132, 867);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (216, 120, 1, 66, 513);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (437, 219, 0, 61, 776);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (531, 744, 0, 98, 865);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (525, 354, 0, 111, 439);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (176, 438, 1, 131, 364);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (414, 223, 0, 165, 443);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (894, 995, 1, 103, 507);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (977, 473, 0, 131, 779);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (912, 806, 1, 118, 556);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (383, 278, 0, 131, 587);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (349, 390, 1, 92, 189);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (935, 318, 1, 124, 310);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (464, 536, 0, 193, 946);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (566, 258, 0, 182, 531);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (710, 417, 1, 1, 139);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (661, 917, 1, 189, 337);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (166, 436, 0, 92, 40);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (307, 559, 0, 156, 562);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (295, 828, 0, 21, 706);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (87, 193, 1, 99, 931);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (303, 349, 0, 36, 482);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (867, 893, 0, 107, 466);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (593, 328, 1, 25, 417);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (640, 430, 0, 43, 625);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (160, 166, 1, 137, 278);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (938, 530, 1, 99, 367);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (74, 628, 1, 29, 424);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (782, 535, 1, 104, 439);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (926, 183, 0, 171, 231);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (633, 723, 1, 198, 160);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (92, 599, 0, 60, 791);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (395, 914, 1, 164, 413);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (538, 652, 1, 165, 42);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (194, 239, 1, 167, 536);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (527, 195, 1, 96, 128);
commit;
prompt 100 records committed...
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (869, 299, 1, 54, 615);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (164, 247, 1, 141, 432);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (999, 105, 0, 187, 546);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (479, 174, 1, 26, 886);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (689, 485, 0, 98, 872);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (662, 798, 0, 85, 218);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (513, 164, 1, 176, 560);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (204, 559, 1, 112, 189);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (413, 608, 1, 119, 179);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (567, 772, 1, 97, 708);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (400, 394, 0, 123, 731);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (518, 747, 1, 165, 713);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (136, 453, 1, 65, 708);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (720, 620, 0, 5, 598);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (694, 301, 1, 42, 389);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (866, 410, 0, 121, 341);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (882, 819, 1, 199, 686);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (589, 828, 0, 11, 271);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (744, 447, 0, 36, 872);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (282, 837, 0, 172, 430);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (12, 375, 0, 197, 951);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (777, 408, 1, 122, 410);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (494, 611, 1, 33, 572);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (579, 812, 0, 60, 242);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (523, 620, 1, 3, 885);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (542, 417, 1, 137, 620);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (886, 181, 0, 195, 355);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (108, 368, 1, 175, 364);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (159, 736, 1, 132, 627);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (269, 647, 1, 36, 488);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (207, 725, 0, 199, 369);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (150, 111, 1, 190, 506);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (355, 494, 1, 11, 932);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (798, 680, 0, 74, 967);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (848, 404, 0, 13, 601);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (621, 807, 1, 197, 799);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (914, 313, 0, 175, 590);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (340, 293, 0, 199, 314);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (235, 548, 0, 36, 967);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (841, 960, 1, 26, 267);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (807, 156, 1, 196, 179);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (279, 635, 0, 26, 650);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (951, 270, 0, 116, 189);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (402, 530, 0, 68, 83);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (585, 714, 0, 24, 663);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (814, 503, 1, 103, 64);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (901, 649, 1, 105, 116);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (880, 116, 1, 136, 460);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (363, 299, 0, 82, 748);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (109, 148, 1, 36, 180);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (592, 708, 0, 158, 793);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (789, 546, 1, 75, 530);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (975, 860, 1, 13, 218);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (822, 386, 1, 172, 205);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (5, 247, 1, 126, 975);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (634, 343, 0, 180, 615);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (24, 420, 0, 120, 918);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (942, 489, 1, 129, 29);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (902, 286, 1, 64, 303);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (132, 764, 1, 63, 693);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (540, 869, 0, 79, 156);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (291, 378, 0, 64, 531);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (929, 636, 0, 48, 842);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (516, 845, 1, 174, 317);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (90, 678, 1, 10, 285);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (844, 621, 1, 121, 867);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (173, 477, 0, 7, 426);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (606, 162, 0, 199, 482);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (769, 678, 0, 29, 699);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (114, 135, 0, 102, 677);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (564, 904, 1, 31, 912);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (565, 362, 0, 20, 674);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (743, 123, 1, 58, 263);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (732, 883, 0, 87, 475);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (571, 947, 0, 56, 255);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (75, 802, 1, 163, 37);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (229, 206, 1, 103, 548);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (772, 954, 1, 114, 740);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (181, 424, 1, 61, 972);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (985, 320, 1, 194, 303);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (482, 747, 1, 192, 393);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (271, 779, 0, 64, 303);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (678, 224, 0, 99, 482);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (407, 137, 1, 103, 389);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (386, 115, 0, 167, 924);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (918, 992, 1, 40, 709);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (308, 866, 0, 167, 870);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (267, 376, 0, 184, 448);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (209, 760, 1, 107, 663);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (964, 473, 1, 28, 815);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (919, 912, 1, 133, 868);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (415, 612, 1, 114, 838);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (221, 745, 0, 35, 263);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (36, 754, 1, 62, 978);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (812, 451, 0, 55, 530);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (698, 209, 0, 95, 865);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (986, 603, 0, 99, 160);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (909, 178, 0, 194, 443);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (569, 573, 0, 179, 681);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (804, 349, 1, 69, 709);
commit;
prompt 200 records committed...
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (188, 839, 0, 32, 42);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (4, 790, 0, 192, 687);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (794, 854, 0, 20, 494);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (392, 915, 1, 86, 981);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (622, 709, 1, 130, 254);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (874, 504, 0, 150, 21);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (115, 139, 1, 79, 298);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (475, 748, 1, 166, 218);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (750, 531, 0, 175, 430);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (833, 938, 0, 180, 114);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (198, 754, 0, 9, 458);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (450, 908, 1, 52, 894);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (477, 994, 1, 160, 658);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (520, 986, 0, 86, 833);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (945, 897, 0, 9, 703);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (59, 176, 0, 120, 513);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (639, 461, 0, 183, 555);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (281, 973, 0, 154, 453);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (994, 185, 1, 71, 104);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (219, 500, 1, 64, 231);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (288, 599, 1, 80, 742);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (31, 404, 1, 7, 762);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (453, 207, 1, 137, 614);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (503, 353, 1, 194, 661);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (202, 342, 1, 151, 750);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (745, 731, 1, 90, 393);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (304, 299, 0, 155, 271);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (715, 107, 1, 151, 728);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (496, 436, 1, 103, 931);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (760, 904, 1, 131, 562);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (354, 474, 0, 113, 999);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (842, 405, 0, 28, 426);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (682, 139, 0, 117, 40);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (172, 447, 0, 141, 806);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (816, 895, 1, 104, 343);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (836, 756, 1, 48, 761);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (650, 246, 0, 18, 341);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (771, 702, 1, 127, 681);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (711, 541, 1, 7, 791);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (957, 320, 0, 143, 541);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (825, 720, 0, 7, 956);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (388, 447, 1, 129, 993);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (851, 415, 0, 195, 21);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (859, 439, 1, 52, 205);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (0, 551, 1, 14, 134);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (815, 792, 1, 81, 214);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (666, 893, 0, 70, 810);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (234, 506, 0, 126, 572);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (758, 309, 1, 37, 946);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (599, 125, 0, 28, 699);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (417, 352, 1, 62, 35);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (586, 747, 0, 62, 995);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (324, 408, 0, 44, 38);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (984, 168, 1, 148, 870);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (270, 569, 1, 43, 33);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (509, 711, 1, 177, 805);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (117, 979, 0, 173, 29);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (500, 769, 1, 160, 614);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (619, 502, 0, 158, 404);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (601, 385, 0, 6, 789);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (644, 925, 1, 62, 234);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (2, 654, 1, 192, 949);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (328, 224, 1, 58, 513);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (343, 482, 0, 158, 386);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (387, 608, 1, 181, 355);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (764, 240, 1, 179, 475);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (892, 142, 0, 200, 629);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (923, 645, 0, 136, 232);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (261, 727, 0, 142, 810);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (955, 167, 0, 56, 271);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (384, 170, 0, 53, 211);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (412, 365, 0, 93, 782);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (821, 288, 0, 141, 833);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (493, 248, 0, 112, 975);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (212, 920, 1, 25, 791);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (934, 815, 0, 20, 686);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (800, 882, 1, 19, 275);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (441, 652, 0, 14, 990);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (191, 656, 0, 15, 748);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (373, 394, 1, 168, 706);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (562, 570, 1, 150, 979);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (11, 848, 1, 115, 561);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (707, 851, 1, 39, 46);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (287, 901, 0, 183, 495);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (301, 611, 1, 44, 513);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (905, 721, 0, 109, 999);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (52, 885, 0, 173, 482);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (736, 562, 0, 36, 265);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (953, 709, 0, 141, 802);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (425, 669, 1, 168, 266);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (50, 343, 0, 9, 39);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (62, 957, 0, 65, 494);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (614, 794, 0, 119, 290);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (315, 814, 1, 136, 903);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (675, 419, 0, 127, 659);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (305, 497, 0, 13, 183);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (419, 383, 1, 175, 147);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (959, 306, 1, 35, 750);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (444, 508, 0, 108, 556);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (823, 523, 1, 173, 21);
commit;
prompt 300 records committed...
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (13, 150, 0, 6, 448);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (510, 155, 0, 111, 703);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (932, 623, 0, 79, 853);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (596, 608, 0, 24, 219);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (313, 988, 1, 168, 298);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (408, 669, 1, 95, 886);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (872, 119, 1, 200, 303);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (435, 722, 1, 37, 456);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (165, 398, 1, 0, 687);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (688, 821, 0, 45, 283);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (404, 750, 0, 190, 306);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (697, 351, 0, 90, 601);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (272, 602, 1, 10, 287);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (973, 296, 0, 11, 622);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (186, 300, 0, 183, 15);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (858, 607, 1, 39, 218);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (427, 221, 1, 78, 21);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (907, 991, 1, 133, 416);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (624, 140, 0, 182, 737);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (524, 279, 0, 141, 602);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (182, 514, 1, 35, 959);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (608, 927, 1, 59, 629);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (227, 233, 0, 13, 864);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (138, 209, 0, 190, 393);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (937, 355, 1, 24, 466);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (199, 767, 1, 175, 887);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (379, 643, 1, 155, 815);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (704, 622, 1, 70, 706);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (541, 138, 0, 196, 337);
commit;
prompt 329 records loaded
prompt Loading STATION...
insert into STATION (name, idstation, adrress)
values ('99 Cazale Stree', 82550, '99 Cazale Stree');
insert into STATION (name, idstation, adrress)
values ('802 Los Angeles', 87856, '802 Los Angeles');
insert into STATION (name, idstation, adrress)
values ('46 Botti Street', 74312, '46 Botti Street');
insert into STATION (name, idstation, adrress)
values ('12nd Street', 54623, '12nd StreetMech');
insert into STATION (name, idstation, adrress)
values ('97 Barueri Stre', 38099, '97 Barueri Stre');
insert into STATION (name, idstation, adrress)
values ('41 Ricci Road', 41409, '41 Ricci RoadOl');
insert into STATION (name, idstation, adrress)
values ('52nd Street', 25356, '52nd StreetLuze');
insert into STATION (name, idstation, adrress)
values ('232 Griffin Str', 72023, '232 Griffin Str');
insert into STATION (name, idstation, adrress)
values ('89 Glen Street', 68849, '89 Glen StreetO');
insert into STATION (name, idstation, adrress)
values ('42 Holiday Ave', 28745, '42 Holiday AveL');
insert into STATION (name, idstation, adrress)
values ('455 Colin Young', 12329, '455 Colin Young');
insert into STATION (name, idstation, adrress)
values ('94 Alana Street', 14512, '94 Alana Street');
insert into STATION (name, idstation, adrress)
values ('74 Eugene Drive', 13081, '74 Eugene Drive');
insert into STATION (name, idstation, adrress)
values ('67 Paltrow', 41761, '67 PaltrowAmste');
insert into STATION (name, idstation, adrress)
values ('18 Statham Stre', 78711, '18 Statham Stre');
insert into STATION (name, idstation, adrress)
values ('34 Tisdale', 13796, '34 TisdaleSan D');
insert into STATION (name, idstation, adrress)
values ('60 Gavin Drive', 99452, '60 Gavin DriveM');
insert into STATION (name, idstation, adrress)
values ('76 Geena', 40574, '76 GeenaDubai');
insert into STATION (name, idstation, adrress)
values ('44 Beaverton St', 85260, '44 Beaverton St');
insert into STATION (name, idstation, adrress)
values ('39 Eindhoven Dr', 37296, '39 Eindhoven Dr');
insert into STATION (name, idstation, adrress)
values ('76 Annandale St', 59452, '76 Annandale St');
insert into STATION (name, idstation, adrress)
values ('140 Rifkin Driv', 61747, '140 Rifkin Driv');
insert into STATION (name, idstation, adrress)
values ('9 Parker Street', 47937, '9 Parker Street');
insert into STATION (name, idstation, adrress)
values ('90 Stevenson Dr', 43695, '90 Stevenson Dr');
insert into STATION (name, idstation, adrress)
values ('75 Kane', 29757, '75 KaneNorthbro');
insert into STATION (name, idstation, adrress)
values ('92 Butler Stree', 65964, '92 Butler Stree');
insert into STATION (name, idstation, adrress)
values ('51 Trick Road', 99504, '51 Trick RoadWa');
insert into STATION (name, idstation, adrress)
values ('670 Liu Drive', 28295, '670 Liu DriveKu');
insert into STATION (name, idstation, adrress)
values ('6 Graham Street', 50322, '6 Graham Street');
insert into STATION (name, idstation, adrress)
values ('48 Monmouth Ave', 68096, '48 Monmouth Ave');
insert into STATION (name, idstation, adrress)
values ('7 Skerritt Blvd', 80286, '7 Skerritt Blvd');
insert into STATION (name, idstation, adrress)
values ('877 Hector Stre', 52728, '877 Hector Stre');
insert into STATION (name, idstation, adrress)
values ('49 Lydia Ave', 52681, '49 Lydia AveJoh');
insert into STATION (name, idstation, adrress)
values ('10 Hurley', 84991, '10 HurleyNaha');
insert into STATION (name, idstation, adrress)
values ('96 Curfman Ave', 39679, '96 Curfman AveC');
insert into STATION (name, idstation, adrress)
values ('54 Lara Road', 72142, '54 Lara RoadPer');
insert into STATION (name, idstation, adrress)
values ('20 Gleeson Blvd', 45619, '20 Gleeson Blvd');
insert into STATION (name, idstation, adrress)
values ('59 Torres Drive', 98046, '59 Torres Drive');
insert into STATION (name, idstation, adrress)
values ('47 McDormand Dr', 45680, '47 McDormand Dr');
insert into STATION (name, idstation, adrress)
values ('38 Arkin Road', 60715, '38 Arkin RoadCa');
insert into STATION (name, idstation, adrress)
values ('41 Debi Ave', 76727, '41 Debi AveYucc');
insert into STATION (name, idstation, adrress)
values ('9 Houston Stree', 14390, '9 Houston Stree');
insert into STATION (name, idstation, adrress)
values ('23rd Street', 36447, '23rd StreetFair');
insert into STATION (name, idstation, adrress)
values ('22 Seatle Blvd', 90342, '22 Seatle BlvdW');
insert into STATION (name, idstation, adrress)
values ('62 Gagnon Ave', 92080, '62 Gagnon AveAt');
insert into STATION (name, idstation, adrress)
values ('31 Daniels Road', 59861, '31 Daniels Road');
insert into STATION (name, idstation, adrress)
values ('60 Milsap Blvd', 83216, '60 Milsap BlvdK');
insert into STATION (name, idstation, adrress)
values ('57 Schenectady ', 16997, '57 Schenectady ');
insert into STATION (name, idstation, adrress)
values ('39 Remar Blvd', 37799, '39 Remar BlvdBe');
insert into STATION (name, idstation, adrress)
values ('911 Tinsley Blv', 35562, '911 Tinsley Blv');
insert into STATION (name, idstation, adrress)
values ('51st Street', 96822, '51st StreetCass');
insert into STATION (name, idstation, adrress)
values ('32 Masur Drive', 87185, '32 Masur DriveK');
insert into STATION (name, idstation, adrress)
values ('486 Keeslar Roa', 31293, '486 Keeslar Roa');
insert into STATION (name, idstation, adrress)
values ('608 Kenneth', 53901, '608 KennethSait');
insert into STATION (name, idstation, adrress)
values ('92nd Street', 45094, '92nd StreetYoko');
insert into STATION (name, idstation, adrress)
values ('96 Istanbul Str', 92366, '96 Istanbul Str');
insert into STATION (name, idstation, adrress)
values ('82 Fukui Street', 86868, '82 Fukui Street');
insert into STATION (name, idstation, adrress)
values ('25 Weisberg Roa', 74144, '25 Weisberg Roa');
insert into STATION (name, idstation, adrress)
values ('72 Everett Road', 78855, '72 Everett Road');
insert into STATION (name, idstation, adrress)
values ('94 Natacha Driv', 47843, '94 Natacha Driv');
insert into STATION (name, idstation, adrress)
values ('95 Waldbronn Ro', 37284, '95 Waldbronn Ro');
insert into STATION (name, idstation, adrress)
values ('80 Shannon Blvd', 65642, '80 Shannon Blvd');
insert into STATION (name, idstation, adrress)
values ('73rd Street', 56591, '73rd StreetFire');
insert into STATION (name, idstation, adrress)
values ('55 Barksdale af', 37346, '55 Barksdale af');
insert into STATION (name, idstation, adrress)
values ('93 Enfield Stre', 63137, '93 Enfield Stre');
insert into STATION (name, idstation, adrress)
values ('6 Rockwell Blvd', 66816, '6 Rockwell Blvd');
insert into STATION (name, idstation, adrress)
values ('419 Utsunomiya ', 19299, '419 Utsunomiya ');
insert into STATION (name, idstation, adrress)
values ('37 Myers Street', 44027, '37 Myers Street');
insert into STATION (name, idstation, adrress)
values ('83 Casey Ave', 73085, '83 Casey AveAlc');
insert into STATION (name, idstation, adrress)
values ('19 Bragg Drive', 65920, '19 Bragg DriveH');
insert into STATION (name, idstation, adrress)
values ('25 Marin Drive', 71060, '25 Marin DriveW');
insert into STATION (name, idstation, adrress)
values ('990 Hilversum R', 78321, '990 Hilversum R');
insert into STATION (name, idstation, adrress)
values ('73 Birkenhead S', 45287, '73 Birkenhead S');
insert into STATION (name, idstation, adrress)
values ('60 Kenny', 19863, '60 KennyKuraby');
insert into STATION (name, idstation, adrress)
values ('17 McDormand Dr', 60061, '17 McDormand Dr');
insert into STATION (name, idstation, adrress)
values ('77 Pasadena Blv', 14718, '77 Pasadena Blv');
insert into STATION (name, idstation, adrress)
values ('19 Brothers Dri', 44492, '19 Brothers Dri');
insert into STATION (name, idstation, adrress)
values ('744 Koeln Stree', 54072, '744 Koeln Stree');
insert into STATION (name, idstation, adrress)
values ('11st Street', 31770, '11st StreetMuni');
insert into STATION (name, idstation, adrress)
values ('46 Ernie Street', 23866, '46 Ernie Street');
insert into STATION (name, idstation, adrress)
values ('31st Street', 66945, '31st StreetWich');
insert into STATION (name, idstation, adrress)
values ('237 Kimberly Dr', 86099, '237 Kimberly Dr');
insert into STATION (name, idstation, adrress)
values ('931 Moraz Blvd', 58381, '931 Moraz BlvdL');
insert into STATION (name, idstation, adrress)
values ('39 Wen Street', 95799, '39 Wen StreetAl');
insert into STATION (name, idstation, adrress)
values ('87 Springfield ', 68931, '87 Springfield ');
insert into STATION (name, idstation, adrress)
values ('94 Sarah Road', 42382, '94 Sarah RoadSu');
insert into STATION (name, idstation, adrress)
values ('604 Natal Blvd', 98722, '604 Natal BlvdN');
insert into STATION (name, idstation, adrress)
values ('91st Street', 18983, '91st StreetDear');
insert into STATION (name, idstation, adrress)
values ('32 Perry Road', 33636, '32 Perry RoadBa');
insert into STATION (name, idstation, adrress)
values ('30 Sydney Drive', 51427, '30 Sydney Drive');
insert into STATION (name, idstation, adrress)
values ('23rd Street', 57557, '23rd StreetShel');
insert into STATION (name, idstation, adrress)
values ('998 Salonga Dri', 97488, '998 Salonga Dri');
insert into STATION (name, idstation, adrress)
values ('51st Street', 90196, '51st StreetEsch');
insert into STATION (name, idstation, adrress)
values ('9 Popper Drive', 53796, '9 Popper DriveO');
insert into STATION (name, idstation, adrress)
values ('23rd Street', 61213, '23rd StreetPont');
insert into STATION (name, idstation, adrress)
values ('46 Pearland Ave', 77247, '46 Pearland Ave');
insert into STATION (name, idstation, adrress)
values ('4 McDowell Blvd', 95550, '4 McDowell Blvd');
insert into STATION (name, idstation, adrress)
values ('14 Gano Street', 65562, '14 Gano StreetC');
insert into STATION (name, idstation, adrress)
values ('43rd Street', 42490, '43rd StreetElli');
insert into STATION (name, idstation, adrress)
values ('49 Hingle Drive', 86860, '49 Hingle Drive');
commit;
prompt 100 records committed...
insert into STATION (name, idstation, adrress)
values ('43rd Street', 87403, '43rd StreetPirm');
insert into STATION (name, idstation, adrress)
values ('3 McFadden Road', 77278, '3 McFadden Road');
insert into STATION (name, idstation, adrress)
values ('74 Tcheky Road', 68389, '74 Tcheky RoadL');
insert into STATION (name, idstation, adrress)
values ('207 Harold Road', 48030, '207 Harold Road');
insert into STATION (name, idstation, adrress)
values ('17 Wavre Street', 64116, '17 Wavre Street');
insert into STATION (name, idstation, adrress)
values ('816 Regensburg ', 41968, '816 Regensburg ');
insert into STATION (name, idstation, adrress)
values ('3 Lois Road', 13478, '3 Lois RoadHoun');
insert into STATION (name, idstation, adrress)
values ('66 Cleese Drive', 72106, '66 Cleese Drive');
insert into STATION (name, idstation, adrress)
values ('26 Popper Stree', 15363, '26 Popper Stree');
insert into STATION (name, idstation, adrress)
values ('62nd Street', 90966, '62nd StreetFram');
insert into STATION (name, idstation, adrress)
values ('96 Gummersbach ', 47585, '96 Gummersbach ');
insert into STATION (name, idstation, adrress)
values ('31st Street', 84922, '31st StreetMain');
insert into STATION (name, idstation, adrress)
values ('85 Mars Street', 39341, '85 Mars StreetJ');
insert into STATION (name, idstation, adrress)
values ('88 Elijah Drive', 76644, '88 Elijah Drive');
insert into STATION (name, idstation, adrress)
values ('47 Owen Drive', 64635, '47 Owen DriveSa');
insert into STATION (name, idstation, adrress)
values ('97 Wilder Road', 61004, '97 Wilder RoadC');
insert into STATION (name, idstation, adrress)
values ('62 Tallahassee ', 30179, '62 Tallahassee ');
insert into STATION (name, idstation, adrress)
values ('88 Omaha', 18582, '88 OmahaHearst');
insert into STATION (name, idstation, adrress)
values ('84 Roberts Road', 62469, '84 Roberts Road');
insert into STATION (name, idstation, adrress)
values ('51 Mac Street', 95309, '51 Mac StreetCo');
insert into STATION (name, idstation, adrress)
values ('59 Hannah Drive', 99317, '59 Hannah Drive');
insert into STATION (name, idstation, adrress)
values ('61st Street', 54537, '61st StreetFort');
insert into STATION (name, idstation, adrress)
values ('89 Kennedy Blvd', 63822, '89 Kennedy Blvd');
insert into STATION (name, idstation, adrress)
values ('87 Belo Horizon', 28613, '87 Belo Horizon');
insert into STATION (name, idstation, adrress)
values ('716 Gold Street', 84027, '716 Gold Street');
insert into STATION (name, idstation, adrress)
values ('26 Campbell Dri', 21594, '26 Campbell Dri');
insert into STATION (name, idstation, adrress)
values ('74 Moss Road', 39826, '74 Moss RoadDon');
insert into STATION (name, idstation, adrress)
values ('17 Caracas Driv', 42785, '17 Caracas Driv');
insert into STATION (name, idstation, adrress)
values ('618 Holderbank ', 75463, '618 Holderbank ');
insert into STATION (name, idstation, adrress)
values ('62 Bryson Road', 30890, '62 Bryson RoadL');
insert into STATION (name, idstation, adrress)
values ('82nd Street', 62169, '82nd StreetUnio');
insert into STATION (name, idstation, adrress)
values ('299 Roy Blvd', 97849, '299 Roy BlvdLak');
insert into STATION (name, idstation, adrress)
values ('42 Lupe Street', 89820, '42 Lupe StreetB');
insert into STATION (name, idstation, adrress)
values ('56 Hilton', 78359, '56 HiltonBolton');
insert into STATION (name, idstation, adrress)
values ('8 Ben-Gurion St', 88269, '8 Ben-Gurion St');
insert into STATION (name, idstation, adrress)
values ('44 Drew Street', 64153, '44 Drew StreetB');
insert into STATION (name, idstation, adrress)
values ('29 Hanks Road', 35991, '29 Hanks RoadMa');
insert into STATION (name, idstation, adrress)
values ('27 Ossie Ave', 34428, '27 Ossie AveBer');
insert into STATION (name, idstation, adrress)
values ('26 Hatfield Roa', 30104, '26 Hatfield Roa');
insert into STATION (name, idstation, adrress)
values ('20 Sarah Blvd', 10771, '20 Sarah BlvdAn');
insert into STATION (name, idstation, adrress)
values ('836 Bello Road', 90102, '836 Bello RoadO');
insert into STATION (name, idstation, adrress)
values ('21 Jun-nam Stre', 89830, '21 Jun-nam Stre');
insert into STATION (name, idstation, adrress)
values ('72nd Street', 30123, '72nd StreetBelg');
insert into STATION (name, idstation, adrress)
values ('77 Vicious Stre', 37927, '77 Vicious Stre');
insert into STATION (name, idstation, adrress)
values ('68 Armand Drive', 25421, '68 Armand Drive');
insert into STATION (name, idstation, adrress)
values ('71 Williams Blv', 30271, '71 Williams Blv');
insert into STATION (name, idstation, adrress)
values ('61 Patrick Road', 85192, '61 Patrick Road');
insert into STATION (name, idstation, adrress)
values ('15 Marina', 59427, '15 MarinaEllico');
insert into STATION (name, idstation, adrress)
values ('878 Dennis Road', 22434, '878 Dennis Road');
insert into STATION (name, idstation, adrress)
values ('7 Strathairn St', 23136, '7 Strathairn St');
insert into STATION (name, idstation, adrress)
values ('49 Tyrone Blvd', 62915, '49 Tyrone BlvdO');
insert into STATION (name, idstation, adrress)
values ('72 Bloch Blvd', 88589, '72 Bloch BlvdVe');
insert into STATION (name, idstation, adrress)
values ('57 Nicholas Roa', 26478, '57 Nicholas Roa');
insert into STATION (name, idstation, adrress)
values ('69 Mumbai Ave', 79866, '69 Mumbai AveAr');
insert into STATION (name, idstation, adrress)
values ('1 Haggard Road', 99355, '1 Haggard RoadB');
insert into STATION (name, idstation, adrress)
values ('61 De Niro Driv', 44378, '61 De Niro Driv');
insert into STATION (name, idstation, adrress)
values ('11 Coward Stree', 87638, '11 Coward Stree');
insert into STATION (name, idstation, adrress)
values ('99 Saxon Street', 76133, '99 Saxon Street');
insert into STATION (name, idstation, adrress)
values ('4 Rosas Street', 25129, '4 Rosas StreetR');
insert into STATION (name, idstation, adrress)
values ('22nd Street', 72143, '22nd StreetFlus');
insert into STATION (name, idstation, adrress)
values ('81 Wilson Road', 87751, '81 Wilson RoadR');
insert into STATION (name, idstation, adrress)
values ('26 McGovern Str', 91466, '26 McGovern Str');
insert into STATION (name, idstation, adrress)
values ('656 Allan Blvd', 33543, '656 Allan BlvdB');
insert into STATION (name, idstation, adrress)
values ('91 Nizhnevartov', 90165, '91 Nizhnevartov');
insert into STATION (name, idstation, adrress)
values ('10 Lengdorf Ave', 47875, '10 Lengdorf Ave');
insert into STATION (name, idstation, adrress)
values ('957 Catherine D', 70576, '957 Catherine D');
insert into STATION (name, idstation, adrress)
values ('92 Dave Ave', 94329, '92 Dave AveMenl');
insert into STATION (name, idstation, adrress)
values ('59 Andrea Stree', 42048, '59 Andrea Stree');
insert into STATION (name, idstation, adrress)
values ('50 DiFranco Str', 12962, '50 DiFranco Str');
insert into STATION (name, idstation, adrress)
values ('9 Wavre Drive', 27160, '9 Wavre DriveJu');
insert into STATION (name, idstation, adrress)
values ('7 Evanswood Str', 64702, '7 Evanswood Str');
insert into STATION (name, idstation, adrress)
values ('97 Maintenon Ro', 28927, '97 Maintenon Ro');
insert into STATION (name, idstation, adrress)
values ('18 Schneider Av', 59032, '18 Schneider Av');
insert into STATION (name, idstation, adrress)
values ('45 Lily Road', 37255, '45 Lily RoadCed');
insert into STATION (name, idstation, adrress)
values ('87 Stevie Drive', 62654, '87 Stevie Drive');
insert into STATION (name, idstation, adrress)
values ('33 Eastwood', 40328, '33 EastwoodCass');
insert into STATION (name, idstation, adrress)
values ('92 Spector Road', 42303, '92 Spector Road');
insert into STATION (name, idstation, adrress)
values ('63 Storrington ', 69778, '63 Storrington ');
insert into STATION (name, idstation, adrress)
values ('11 Leonardo Dri', 82568, '11 Leonardo Dri');
insert into STATION (name, idstation, adrress)
values ('87 Machine Blvd', 43615, '87 Machine Blvd');
insert into STATION (name, idstation, adrress)
values ('43 Howard Ave', 31379, '43 Howard AveYa');
insert into STATION (name, idstation, adrress)
values ('19 Bright Drive', 53823, '19 Bright Drive');
insert into STATION (name, idstation, adrress)
values ('45 Gord Street', 78640, '45 Gord StreetN');
insert into STATION (name, idstation, adrress)
values ('56 King', 65913, '56 KingSao roqu');
insert into STATION (name, idstation, adrress)
values ('96 Sylvian Road', 48734, '96 Sylvian Road');
insert into STATION (name, idstation, adrress)
values ('13rd Street', 43822, '13rd StreetLund');
insert into STATION (name, idstation, adrress)
values ('61 Hayes Ave', 35089, '61 Hayes AveLak');
insert into STATION (name, idstation, adrress)
values ('74 Wainwright B', 53750, '74 Wainwright B');
insert into STATION (name, idstation, adrress)
values ('851 Hutton Ave', 80366, '851 Hutton AveK');
insert into STATION (name, idstation, adrress)
values ('15 Samuel Drive', 54870, '15 Samuel Drive');
insert into STATION (name, idstation, adrress)
values ('11 DiBiasio Ave', 79080, '11 DiBiasio Ave');
insert into STATION (name, idstation, adrress)
values ('52 Coley Street', 36593, '52 Coley Street');
insert into STATION (name, idstation, adrress)
values ('93 Rhea Drive', 64269, '93 Rhea DriveHo');
insert into STATION (name, idstation, adrress)
values ('2 Mapo-gu Road', 84750, '2 Mapo-gu RoadB');
insert into STATION (name, idstation, adrress)
values ('85 Hauer', 31895, '85 HauerTustin');
insert into STATION (name, idstation, adrress)
values ('80 Brenda Road', 94224, '80 Brenda RoadV');
insert into STATION (name, idstation, adrress)
values ('63 Jeff Ave', 14610, '63 Jeff AveBedf');
insert into STATION (name, idstation, adrress)
values ('99 Giessen Road', 75529, '99 Giessen Road');
insert into STATION (name, idstation, adrress)
values ('40 Kiefer', 81150, '40 KieferFort L');
insert into STATION (name, idstation, adrress)
values ('44 Wright Stree', 32995, '44 Wright Stree');
commit;
prompt 200 records committed...
insert into STATION (name, idstation, adrress)
values ('57 Garland Stre', 37125, '57 Garland Stre');
insert into STATION (name, idstation, adrress)
values ('87 von Sydow Ro', 65235, '87 von Sydow Ro');
insert into STATION (name, idstation, adrress)
values ('113 North Point', 94300, '113 North Point');
insert into STATION (name, idstation, adrress)
values ('91 Jason Blvd', 41740, '91 Jason BlvdBe');
insert into STATION (name, idstation, adrress)
values ('97 Andrews Stre', 94629, '97 Andrews Stre');
insert into STATION (name, idstation, adrress)
values ('38 Ojeda Road', 65391, '38 Ojeda RoadRo');
insert into STATION (name, idstation, adrress)
values ('816 Boyle Stree', 31201, '816 Boyle Stree');
insert into STATION (name, idstation, adrress)
values ('13rd Street', 90098, '13rd StreetRimi');
insert into STATION (name, idstation, adrress)
values ('38 Laws Road', 47792, '38 Laws RoadSev');
insert into STATION (name, idstation, adrress)
values ('92nd Street', 12439, '92nd StreetTern');
insert into STATION (name, idstation, adrress)
values ('52 Junior Stree', 44993, '52 Junior Stree');
insert into STATION (name, idstation, adrress)
values ('14 Torino Blvd', 74898, '14 Torino BlvdH');
insert into STATION (name, idstation, adrress)
values ('89 Mumbai Road', 81573, '89 Mumbai RoadW');
insert into STATION (name, idstation, adrress)
values ('216 Kennedy', 47025, '216 KennedyFarn');
insert into STATION (name, idstation, adrress)
values ('49 Winans Road', 89471, '49 Winans RoadP');
insert into STATION (name, idstation, adrress)
values ('15 Gaby Street', 98791, '15 Gaby StreetW');
insert into STATION (name, idstation, adrress)
values ('31 Buckingham S', 83124, '31 Buckingham S');
insert into STATION (name, idstation, adrress)
values ('2 Casselberry R', 40358, '2 Casselberry R');
insert into STATION (name, idstation, adrress)
values ('70 Sheen Street', 82332, '70 Sheen Street');
insert into STATION (name, idstation, adrress)
values ('10 Stevenson Ro', 55308, '10 Stevenson Ro');
insert into STATION (name, idstation, adrress)
values ('33rd Street', 20715, '33rd StreetFort');
insert into STATION (name, idstation, adrress)
values ('33rd Street', 97737, '33rd StreetRegi');
insert into STATION (name, idstation, adrress)
values ('18 Pitney Ave', 79217, '18 Pitney AveDr');
insert into STATION (name, idstation, adrress)
values ('707 Gaza', 15193, '707 GazaChur');
insert into STATION (name, idstation, adrress)
values ('30 Nik Road', 54132, '30 Nik RoadDart');
insert into STATION (name, idstation, adrress)
values ('77 Dean Drive', 58363, '77 Dean DriveCa');
insert into STATION (name, idstation, adrress)
values ('18 Venora Road', 79144, '18 Venora RoadS');
insert into STATION (name, idstation, adrress)
values ('43 Cesena Drive', 42168, '43 Cesena Drive');
insert into STATION (name, idstation, adrress)
values ('49 Sydney Road', 29540, '49 Sydney RoadD');
insert into STATION (name, idstation, adrress)
values ('56 Nagoya', 85319, '56 NagoyaOoster');
insert into STATION (name, idstation, adrress)
values ('3 Wuerzburg Dri', 66132, '3 Wuerzburg Dri');
insert into STATION (name, idstation, adrress)
values ('33rd Street', 66301, '33rd StreetKarl');
insert into STATION (name, idstation, adrress)
values ('687 Rain Street', 75481, '687 Rain Street');
insert into STATION (name, idstation, adrress)
values ('61st Street', 14889, '61st StreetBisc');
insert into STATION (name, idstation, adrress)
values ('36 Presley Stre', 91233, '36 Presley Stre');
insert into STATION (name, idstation, adrress)
values ('35 Denzel Road', 84052, '35 Denzel RoadL');
insert into STATION (name, idstation, adrress)
values ('96 Edgar Street', 92343, '96 Edgar Street');
insert into STATION (name, idstation, adrress)
values ('78 Wageningen R', 38318, '78 Wageningen R');
insert into STATION (name, idstation, adrress)
values ('38 Brookfield D', 57957, '38 Brookfield D');
insert into STATION (name, idstation, adrress)
values ('70 Gandolfini S', 57434, '70 Gandolfini S');
insert into STATION (name, idstation, adrress)
values ('43 Annette Stre', 91994, '43 Annette Stre');
insert into STATION (name, idstation, adrress)
values ('59 Thurman Ave', 82236, '59 Thurman AveW');
insert into STATION (name, idstation, adrress)
values ('7 Waterloo Road', 45459, '7 Waterloo Road');
insert into STATION (name, idstation, adrress)
values ('20 Rawls Drive', 26560, '20 Rawls DriveS');
insert into STATION (name, idstation, adrress)
values ('63 Cliff Road', 72042, '63 Cliff RoadL''');
insert into STATION (name, idstation, adrress)
values ('35 South Weber ', 72019, '35 South Weber ');
insert into STATION (name, idstation, adrress)
values ('34 Pottendorf S', 70221, '34 Pottendorf S');
insert into STATION (name, idstation, adrress)
values ('57 Vega Road', 60141, '57 Vega RoadDre');
insert into STATION (name, idstation, adrress)
values ('665 May Street', 24039, '665 May StreetK');
insert into STATION (name, idstation, adrress)
values ('24 Harper Blvd', 56479, '24 Harper BlvdN');
insert into STATION (name, idstation, adrress)
values ('166 Sao caetano', 23981, '166 Sao caetano');
insert into STATION (name, idstation, adrress)
values ('827 Brothers St', 52388, '827 Brothers St');
insert into STATION (name, idstation, adrress)
values ('427 Phoenix Str', 37133, '427 Phoenix Str');
insert into STATION (name, idstation, adrress)
values ('41st Street', 98847, '41st StreetHern');
insert into STATION (name, idstation, adrress)
values ('81st Street', 82438, '81st StreetBrat');
insert into STATION (name, idstation, adrress)
values ('6 Mahood Street', 12676, '6 Mahood Street');
insert into STATION (name, idstation, adrress)
values ('67 Derringer Bl', 62232, '67 Derringer Bl');
insert into STATION (name, idstation, adrress)
values ('972 Orlando Str', 63692, '972 Orlando Str');
insert into STATION (name, idstation, adrress)
values ('21st Street', 10391, '21st StreetMepp');
insert into STATION (name, idstation, adrress)
values ('15 Regina Blvd', 98563, '15 Regina BlvdS');
insert into STATION (name, idstation, adrress)
values ('93 Dukakis Stre', 40900, '93 Dukakis Stre');
insert into STATION (name, idstation, adrress)
values ('64 Whoopi Drive', 28307, '64 Whoopi Drive');
insert into STATION (name, idstation, adrress)
values ('996 Vilafranca ', 24284, '996 Vilafranca ');
insert into STATION (name, idstation, adrress)
values ('89 Andrea Road', 46859, '89 Andrea RoadM');
insert into STATION (name, idstation, adrress)
values ('10 Chaam Drive', 47487, '10 Chaam DriveI');
insert into STATION (name, idstation, adrress)
values ('59 Ft. Leavenwo', 70340, '59 Ft. Leavenwo');
insert into STATION (name, idstation, adrress)
values ('91 Vannelli', 28545, '91 VannelliKong');
insert into STATION (name, idstation, adrress)
values ('22nd Street', 36583, '22nd StreetRich');
insert into STATION (name, idstation, adrress)
values ('23 Shepherd Dri', 86722, '23 Shepherd Dri');
insert into STATION (name, idstation, adrress)
values ('6 Fiona Blvd', 26440, '6 Fiona BlvdLov');
insert into STATION (name, idstation, adrress)
values ('82 Oldman Stree', 53053, '82 Oldman Stree');
insert into STATION (name, idstation, adrress)
values ('13rd Street', 92061, '13rd StreetVadu');
insert into STATION (name, idstation, adrress)
values ('8 Jodie Ave', 92116, '8 Jodie AveMilw');
insert into STATION (name, idstation, adrress)
values ('16 Coley Blvd', 96304, '16 Coley BlvdFa');
insert into STATION (name, idstation, adrress)
values ('46 Wendy Street', 88862, '46 Wendy Street');
insert into STATION (name, idstation, adrress)
values ('100 Bratislava ', 72359, '100 Bratislava ');
insert into STATION (name, idstation, adrress)
values ('93 Brock Road', 54892, '93 Brock RoadPo');
insert into STATION (name, idstation, adrress)
values ('12 Patton Ave', 77265, '12 Patton AveWa');
insert into STATION (name, idstation, adrress)
values ('33 Sepulveda St', 31742, '33 Sepulveda St');
insert into STATION (name, idstation, adrress)
values ('72 Wainwright R', 15115, '72 Wainwright R');
insert into STATION (name, idstation, adrress)
values ('13rd Street', 96575, '13rd StreetMech');
insert into STATION (name, idstation, adrress)
values ('89 Pesci Blvd', 14003, '89 Pesci BlvdGi');
insert into STATION (name, idstation, adrress)
values ('919 Gertner Roa', 48219, '919 Gertner Roa');
insert into STATION (name, idstation, adrress)
values ('17 Halfway hous', 11057, '17 Halfway hous');
insert into STATION (name, idstation, adrress)
values ('67 Davey Ave', 72101, '67 Davey AveSte');
insert into STATION (name, idstation, adrress)
values ('11st Street', 47492, '11st StreetWarr');
insert into STATION (name, idstation, adrress)
values ('526 Vai Road', 33573, '526 Vai RoadBud');
insert into STATION (name, idstation, adrress)
values ('41 Mandrell Roa', 34697, '41 Mandrell Roa');
insert into STATION (name, idstation, adrress)
values ('79 Shirley Road', 77801, '79 Shirley Road');
insert into STATION (name, idstation, adrress)
values ('58 Horace Stree', 20978, '58 Horace Stree');
insert into STATION (name, idstation, adrress)
values ('12 Sainte-foy B', 45617, '12 Sainte-foy B');
insert into STATION (name, idstation, adrress)
values ('854 Monument', 66264, '854 MonumentInd');
insert into STATION (name, idstation, adrress)
values ('385 Lillard Dri', 57634, '385 Lillard Dri');
insert into STATION (name, idstation, adrress)
values ('88 Milsap Drive', 42756, '88 Milsap Drive');
insert into STATION (name, idstation, adrress)
values ('541 Thorton Str', 49967, '541 Thorton Str');
insert into STATION (name, idstation, adrress)
values ('33 Haverhill Dr', 33032, '33 Haverhill Dr');
insert into STATION (name, idstation, adrress)
values ('362 Carl Road', 35873, '362 Carl RoadWa');
insert into STATION (name, idstation, adrress)
values ('2 Belp Drive', 18184, '2 Belp DrivePho');
insert into STATION (name, idstation, adrress)
values ('77 Conners Driv', 29212, '77 Conners Driv');
insert into STATION (name, idstation, adrress)
values ('388 Crystal Roa', 51703, '388 Crystal Roa');
commit;
prompt 300 records committed...
insert into STATION (name, idstation, adrress)
values ('29 Kennedy Ave', 31905, '29 Kennedy AveM');
insert into STATION (name, idstation, adrress)
values ('80 Ivan Ave', 17153, '80 Ivan AveMich');
insert into STATION (name, idstation, adrress)
values ('66 Joshua Stree', 18210, '66 Joshua Stree');
insert into STATION (name, idstation, adrress)
values ('87 Kimball Stre', 88870, '87 Kimball Stre');
insert into STATION (name, idstation, adrress)
values ('6 Janssen Drive', 52223, '6 Janssen Drive');
insert into STATION (name, idstation, adrress)
values ('89 Mifune Stree', 28254, '89 Mifune Stree');
insert into STATION (name, idstation, adrress)
values ('86 Craig Street', 40134, '86 Craig Street');
insert into STATION (name, idstation, adrress)
values ('321 Lithgow Dri', 54472, '321 Lithgow Dri');
insert into STATION (name, idstation, adrress)
values ('85 Emily Drive', 56918, '85 Emily DriveT');
insert into STATION (name, idstation, adrress)
values ('541 Hanover Dri', 85323, '541 Hanover Dri');
insert into STATION (name, idstation, adrress)
values ('33 Claire Blvd', 86584, '33 Claire BlvdM');
insert into STATION (name, idstation, adrress)
values ('53 Wincott Stre', 86108, '53 Wincott Stre');
insert into STATION (name, idstation, adrress)
values ('26 Luongo Road', 96211, '26 Luongo RoadB');
insert into STATION (name, idstation, adrress)
values ('9 Princeton Str', 87036, '9 Princeton Str');
insert into STATION (name, idstation, adrress)
values ('39 Gary Road', 75980, '39 Gary RoadFra');
insert into STATION (name, idstation, adrress)
values ('40 DiBiasio Dri', 64045, '40 DiBiasio Dri');
insert into STATION (name, idstation, adrress)
values ('54 Spring Valle', 38886, '54 Spring Valle');
insert into STATION (name, idstation, adrress)
values ('81st Street', 28672, '81st StreetTamp');
insert into STATION (name, idstation, adrress)
values ('47 Appenzell Ro', 49248, '47 Appenzell Ro');
insert into STATION (name, idstation, adrress)
values ('206 McCann Driv', 94393, '206 McCann Driv');
insert into STATION (name, idstation, adrress)
values ('600 Wolf Street', 25360, '600 Wolf Street');
insert into STATION (name, idstation, adrress)
values ('93 Garth Road', 67154, '93 Garth RoadWh');
insert into STATION (name, idstation, adrress)
values ('52nd Street', 17035, '52nd StreetCoro');
insert into STATION (name, idstation, adrress)
values ('77 Rispoli Road', 98520, '77 Rispoli Road');
insert into STATION (name, idstation, adrress)
values ('52 Freddie Ave', 41969, '52 Freddie AveW');
insert into STATION (name, idstation, adrress)
values ('82 New Haven Ro', 10491, '82 New Haven Ro');
insert into STATION (name, idstation, adrress)
values ('9 Sigourney Dri', 14944, '9 Sigourney Dri');
insert into STATION (name, idstation, adrress)
values ('84 Hopkins', 87202, '84 HopkinsSale');
insert into STATION (name, idstation, adrress)
values ('71 Elkins Park ', 90230, '71 Elkins Park ');
insert into STATION (name, idstation, adrress)
values ('88 Milano Stree', 40939, '88 Milano Stree');
insert into STATION (name, idstation, adrress)
values ('78 Feore Road', 53302, '78 Feore RoadFa');
insert into STATION (name, idstation, adrress)
values ('62 Victoria Dri', 56402, '62 Victoria Dri');
insert into STATION (name, idstation, adrress)
values ('93rd Street', 34278, '93rd StreetMapo');
insert into STATION (name, idstation, adrress)
values ('49 Royston', 77376, '49 RoystonKoeln');
insert into STATION (name, idstation, adrress)
values ('94 Helen Street', 83968, '94 Helen Street');
insert into STATION (name, idstation, adrress)
values ('5 LaMond Blvd', 64734, '5 LaMond BlvdPa');
insert into STATION (name, idstation, adrress)
values ('15 Santiago Dri', 18528, '15 Santiago Dri');
insert into STATION (name, idstation, adrress)
values ('21st Street', 97095, '21st StreetMt. ');
insert into STATION (name, idstation, adrress)
values ('88 Hawke Drive', 78503, '88 Hawke DriveY');
insert into STATION (name, idstation, adrress)
values ('45 Jake Road', 70314, '45 Jake RoadBre');
insert into STATION (name, idstation, adrress)
values ('39 Mifune Road', 73180, '39 Mifune RoadM');
insert into STATION (name, idstation, adrress)
values ('52nd Street', 36499, '52nd StreetVale');
insert into STATION (name, idstation, adrress)
values ('64 Dylan Road', 84897, '64 Dylan RoadSa');
insert into STATION (name, idstation, adrress)
values ('28 Gladys Stree', 34459, '28 Gladys Stree');
insert into STATION (name, idstation, adrress)
values ('506 Selma Road', 79573, '506 Selma RoadC');
insert into STATION (name, idstation, adrress)
values ('82 Barry Blvd', 66103, '82 Barry BlvdSt');
insert into STATION (name, idstation, adrress)
values ('44 Phoenix Stre', 31565, '44 Phoenix Stre');
insert into STATION (name, idstation, adrress)
values ('13rd Street', 34105, '13rd StreetColu');
insert into STATION (name, idstation, adrress)
values ('376 Eckhart Roa', 49065, '376 Eckhart Roa');
insert into STATION (name, idstation, adrress)
values ('86 Shue Road', 49462, '86 Shue RoadTor');
insert into STATION (name, idstation, adrress)
values ('72 Hagar', 57682, '72 HagarRegina');
insert into STATION (name, idstation, adrress)
values ('25 Paymer Drive', 10578, '25 Paymer Drive');
insert into STATION (name, idstation, adrress)
values ('66 Toyama Road', 71368, '66 Toyama RoadB');
insert into STATION (name, idstation, adrress)
values ('69 Breslin Road', 87164, '69 Breslin Road');
insert into STATION (name, idstation, adrress)
values ('100 Coolidge', 71613, '100 CoolidgeGie');
insert into STATION (name, idstation, adrress)
values ('77 Gunton Stree', 49982, '77 Gunton Stree');
insert into STATION (name, idstation, adrress)
values ('45 Isaac Street', 49030, '45 Isaac Street');
insert into STATION (name, idstation, adrress)
values ('11 Julianna Blv', 74339, '11 Julianna Blv');
insert into STATION (name, idstation, adrress)
values ('58 Chaam Drive', 79622, '58 Chaam DriveS');
insert into STATION (name, idstation, adrress)
values ('96 Cameron Road', 55678, '96 Cameron Road');
insert into STATION (name, idstation, adrress)
values ('66 Avalon Stree', 36660, '66 Avalon Stree');
insert into STATION (name, idstation, adrress)
values ('31st Street', 97330, '31st StreetKing');
insert into STATION (name, idstation, adrress)
values ('4 Alessandria R', 70541, '4 Alessandria R');
insert into STATION (name, idstation, adrress)
values ('42 Mickey Road', 90181, '42 Mickey RoadB');
insert into STATION (name, idstation, adrress)
values ('75 von Sydow Bl', 81322, '75 von Sydow Bl');
insert into STATION (name, idstation, adrress)
values ('35 Sanders Ave', 98277, '35 Sanders AveP');
insert into STATION (name, idstation, adrress)
values ('449 Powers Road', 46986, '449 Powers Road');
insert into STATION (name, idstation, adrress)
values ('32 Ty Blvd', 50122, '32 Ty BlvdVanta');
insert into STATION (name, idstation, adrress)
values ('28 Kinnear Ave', 81776, '28 Kinnear AveN');
insert into STATION (name, idstation, adrress)
values ('36 Worrell Stre', 59455, '36 Worrell Stre');
insert into STATION (name, idstation, adrress)
values ('833 Winnipeg Av', 73842, '833 Winnipeg Av');
insert into STATION (name, idstation, adrress)
values ('954 Coldmeece S', 38375, '954 Coldmeece S');
insert into STATION (name, idstation, adrress)
values ('731 Salma Stree', 92028, '731 Salma Stree');
insert into STATION (name, idstation, adrress)
values ('29 Nicole', 39823, '29 NicoleFlower');
insert into STATION (name, idstation, adrress)
values ('40 Wincott Stre', 55698, '40 Wincott Stre');
insert into STATION (name, idstation, adrress)
values ('106 Beck Ave', 51051, '106 Beck AveSor');
insert into STATION (name, idstation, adrress)
values ('54 Dench', 41025, '54 DenchSundsva');
insert into STATION (name, idstation, adrress)
values ('56 Daejeon', 99825, '56 DaejeonNanai');
insert into STATION (name, idstation, adrress)
values ('69 Ford Drive', 73747, '69 Ford DriveAp');
insert into STATION (name, idstation, adrress)
values ('41 Hunt Blvd', 79855, '41 Hunt BlvdObe');
insert into STATION (name, idstation, adrress)
values ('929 Vannelli Av', 35274, '929 Vannelli Av');
insert into STATION (name, idstation, adrress)
values ('95 Sheena Road', 86544, '95 Sheena RoadO');
insert into STATION (name, idstation, adrress)
values ('61 Baldwin Road', 70886, '61 Baldwin Road');
insert into STATION (name, idstation, adrress)
values ('35 Snipes Stree', 67913, '35 Snipes Stree');
insert into STATION (name, idstation, adrress)
values ('66 Rosie Blvd', 17344, '66 Rosie BlvdAm');
insert into STATION (name, idstation, adrress)
values ('71 Vince Street', 70536, '71 Vince Street');
insert into STATION (name, idstation, adrress)
values ('47 Varzea grand', 27789, '47 Varzea grand');
insert into STATION (name, idstation, adrress)
values ('43 Tempest Stre', 28208, '43 Tempest Stre');
insert into STATION (name, idstation, adrress)
values ('73 Wiedlin Driv', 60611, '73 Wiedlin Driv');
insert into STATION (name, idstation, adrress)
values ('28 Santa Cruz D', 79613, '28 Santa Cruz D');
insert into STATION (name, idstation, adrress)
values ('346 Grand Rapid', 11117, '346 Grand Rapid');
insert into STATION (name, idstation, adrress)
values ('51 Judge Ave', 65274, '51 Judge AveWic');
insert into STATION (name, idstation, adrress)
values ('23 Checker', 32941, '23 CheckerLyon');
insert into STATION (name, idstation, adrress)
values ('82 Tim', 89291, '82 TimLathrop');
insert into STATION (name, idstation, adrress)
values ('44 Spike', 60424, '44 SpikeNortham');
insert into STATION (name, idstation, adrress)
values ('93rd Street', 31360, '93rd StreetFram');
insert into STATION (name, idstation, adrress)
values ('51 Barry Street', 56276, '51 Barry Street');
insert into STATION (name, idstation, adrress)
values ('427 Diaz Drive', 11606, '427 Diaz DriveF');
insert into STATION (name, idstation, adrress)
values ('2 Belgrad Ave', 47417, '2 Belgrad AveMa');
insert into STATION (name, idstation, adrress)
values ('61st Street', 31283, '61st StreetDarm');
commit;
prompt 400 records committed...
insert into STATION (name, idstation, adrress)
values ('86 Milpitas Roa', 22361, '86 Milpitas Roa');
insert into STATION (name, idstation, adrress)
values ('99 Overland par', 44185, '99 Overland par');
insert into STATION (name, idstation, adrress)
values ('73 Charles Driv', 13490, '73 Charles Driv');
insert into STATION (name, idstation, adrress)
values ('74 Talvin Drive', 57098, '74 Talvin Drive');
insert into STATION (name, idstation, adrress)
values ('98 Wariner Stre', 51514, '98 Wariner Stre');
insert into STATION (name, idstation, adrress)
values ('77 West Lafayet', 25445, '77 West Lafayet');
insert into STATION (name, idstation, adrress)
values ('54 Seth', 71959, '54 SethCharlest');
insert into STATION (name, idstation, adrress)
values ('587 Whittier Dr', 29709, '587 Whittier Dr');
insert into STATION (name, idstation, adrress)
values ('73rd Street', 88896, '73rd StreetDi S');
insert into STATION (name, idstation, adrress)
values ('58 Bosco Street', 79822, '58 Bosco Street');
insert into STATION (name, idstation, adrress)
values ('28 Columbus Roa', 64846, '28 Columbus Roa');
insert into STATION (name, idstation, adrress)
values ('91st Street', 51738, '91st StreetCarl');
insert into STATION (name, idstation, adrress)
values ('50 Rauhofer Blv', 37903, '50 Rauhofer Blv');
insert into STATION (name, idstation, adrress)
values ('85 Fuchstal-asc', 21188, '85 Fuchstal-asc');
insert into STATION (name, idstation, adrress)
values ('9 Diesel Drive', 29022, '9 Diesel DriveG');
insert into STATION (name, idstation, adrress)
values ('39 Baranski Roa', 84482, '39 Baranski Roa');
insert into STATION (name, idstation, adrress)
values ('76 Holly', 78914, '76 HollyEiksmar');
insert into STATION (name, idstation, adrress)
values ('63 Woody Ave', 82054, '63 Woody AveGue');
insert into STATION (name, idstation, adrress)
values ('33 Saul Drive', 80767, '33 Saul DriveNe');
insert into STATION (name, idstation, adrress)
values ('82nd Street', 79708, '82nd StreetKlot');
insert into STATION (name, idstation, adrress)
values ('86 Kristin Blvd', 13200, '86 Kristin Blvd');
insert into STATION (name, idstation, adrress)
values ('32 High Wycombe', 28292, '32 High Wycombe');
insert into STATION (name, idstation, adrress)
values ('83rd Street', 98361, '83rd StreetWhit');
insert into STATION (name, idstation, adrress)
values ('86 Murray Drive', 87074, '86 Murray Drive');
insert into STATION (name, idstation, adrress)
values ('945 Schwimmer R', 13457, '945 Schwimmer R');
insert into STATION (name, idstation, adrress)
values ('25 Peniston Ave', 20386, '25 Peniston Ave');
insert into STATION (name, idstation, adrress)
values ('5 Adina Road', 34477, '5 Adina RoadMil');
insert into STATION (name, idstation, adrress)
values ('17 Pullman Stre', 88437, '17 Pullman Stre');
insert into STATION (name, idstation, adrress)
values ('33rd Street', 52254, '33rd StreetFuch');
insert into STATION (name, idstation, adrress)
values ('35 Trini Road', 63564, '35 Trini RoadUt');
insert into STATION (name, idstation, adrress)
values ('74 Gertner Driv', 98949, '74 Gertner Driv');
insert into STATION (name, idstation, adrress)
values ('52 Loring Stree', 73867, '52 Loring Stree');
insert into STATION (name, idstation, adrress)
values ('5 Reykjavik Roa', 86342, '5 Reykjavik Roa');
insert into STATION (name, idstation, adrress)
values ('994 Dempsey Str', 19563, '994 Dempsey Str');
insert into STATION (name, idstation, adrress)
values ('27 Galecki Stre', 32532, '27 Galecki Stre');
insert into STATION (name, idstation, adrress)
values ('73 Elkins Park ', 89148, '73 Elkins Park ');
insert into STATION (name, idstation, adrress)
values ('85 Ernest', 67429, '85 ErnestStony ');
insert into STATION (name, idstation, adrress)
values ('61st Street', 68224, '61st StreetOtta');
insert into STATION (name, idstation, adrress)
values ('64 Milan Road', 36161, '64 Milan RoadHi');
insert into STATION (name, idstation, adrress)
values ('46 Dukakis Stre', 21677, '46 Dukakis Stre');
insert into STATION (name, idstation, adrress)
values ('97 Copeland Blv', 63831, '97 Copeland Blv');
insert into STATION (name, idstation, adrress)
values ('53rd Street', 50334, '53rd StreetNort');
insert into STATION (name, idstation, adrress)
values ('72nd Street', 21159, '72nd StreetLahr');
insert into STATION (name, idstation, adrress)
values ('78 Dzundza Stre', 44323, '78 Dzundza Stre');
insert into STATION (name, idstation, adrress)
values ('13rd Street', 16865, '13rd StreetLahr');
insert into STATION (name, idstation, adrress)
values ('19 McCann Stree', 35663, '19 McCann Stree');
insert into STATION (name, idstation, adrress)
values ('40 Napolitano A', 32378, '40 Napolitano A');
insert into STATION (name, idstation, adrress)
values ('92nd Street', 38633, '92nd StreetTrar');
insert into STATION (name, idstation, adrress)
values ('19 Lefkosa Driv', 57750, '19 Lefkosa Driv');
insert into STATION (name, idstation, adrress)
values ('72 Erlangen Str', 77748, '72 Erlangen Str');
insert into STATION (name, idstation, adrress)
values ('23 Brentwood Dr', 79474, '23 Brentwood Dr');
insert into STATION (name, idstation, adrress)
values ('923 Mablethorpe', 38653, '923 Mablethorpe');
insert into STATION (name, idstation, adrress)
values ('89 Watley Road', 41430, '89 Watley RoadG');
insert into STATION (name, idstation, adrress)
values ('33rd Street', 55457, '33rd StreetYomg');
insert into STATION (name, idstation, adrress)
values ('48 James Road', 26636, '48 James RoadNo');
insert into STATION (name, idstation, adrress)
values ('79 Berkshire St', 23180, '79 Berkshire St');
insert into STATION (name, idstation, adrress)
values ('2 Le chesnay Ro', 89281, '2 Le chesnay Ro');
insert into STATION (name, idstation, adrress)
values ('990 Jared Drive', 89765, '990 Jared Drive');
insert into STATION (name, idstation, adrress)
values ('65 Fichtner Str', 88054, '65 Fichtner Str');
insert into STATION (name, idstation, adrress)
values ('24 Ahmad Street', 28958, '24 Ahmad Street');
insert into STATION (name, idstation, adrress)
values ('10 Battle Creek', 79140, '10 Battle Creek');
insert into STATION (name, idstation, adrress)
values ('66 Sinatra Road', 97797, '66 Sinatra Road');
insert into STATION (name, idstation, adrress)
values ('98 Mena Blvd', 73371, '98 Mena BlvdSal');
insert into STATION (name, idstation, adrress)
values ('71 Lloyd Street', 74858, '71 Lloyd Street');
insert into STATION (name, idstation, adrress)
values ('93 Robbins Road', 59763, '93 Robbins Road');
insert into STATION (name, idstation, adrress)
values ('67 Church', 85346, '67 ChurchCerrit');
insert into STATION (name, idstation, adrress)
values ('93rd Street', 43896, '93rd StreetProt');
insert into STATION (name, idstation, adrress)
values ('31st Street', 46377, '31st StreetAike');
insert into STATION (name, idstation, adrress)
values ('19 Gena Drive', 55686, '19 Gena DriveKa');
insert into STATION (name, idstation, adrress)
values ('62 St Leonards ', 29699, '62 St Leonards ');
insert into STATION (name, idstation, adrress)
values ('69 Cuenca Road', 45832, '69 Cuenca RoadS');
insert into STATION (name, idstation, adrress)
values ('21 Gavin Road', 57498, '21 Gavin RoadN.');
insert into STATION (name, idstation, adrress)
values ('12nd Street', 77423, '12nd StreetNana');
insert into STATION (name, idstation, adrress)
values ('38 Perry Street', 77739, '38 Perry Street');
insert into STATION (name, idstation, adrress)
values ('35 Archbold Str', 76386, '35 Archbold Str');
insert into STATION (name, idstation, adrress)
values ('93 El Paso Ave', 44503, '93 El Paso AveB');
insert into STATION (name, idstation, adrress)
values ('8 Armatrading S', 83043, '8 Armatrading S');
insert into STATION (name, idstation, adrress)
values ('40 Copeland Roa', 42618, '40 Copeland Roa');
insert into STATION (name, idstation, adrress)
values ('55 Ledger Ave', 98617, '55 Ledger AvePa');
insert into STATION (name, idstation, adrress)
values ('98 Jake Drive', 89288, '98 Jake DriveWa');
insert into STATION (name, idstation, adrress)
values ('21 Dave Road', 10933, '21 Dave RoadMen');
insert into STATION (name, idstation, adrress)
values ('42nd Street', 74889, '42nd StreetManc');
insert into STATION (name, idstation, adrress)
values ('20 Baltimore', 74198, '20 BaltimoreFra');
insert into STATION (name, idstation, adrress)
values ('54 Horace Road', 26758, '54 Horace RoadT');
insert into STATION (name, idstation, adrress)
values ('563 Gallant Blv', 57643, '563 Gallant Blv');
insert into STATION (name, idstation, adrress)
values ('44 Lauren Drive', 29184, '44 Lauren Drive');
insert into STATION (name, idstation, adrress)
values ('714 Wang Street', 44490, '714 Wang Street');
insert into STATION (name, idstation, adrress)
values ('10 Rhona Blvd', 39361, '10 Rhona BlvdLi');
insert into STATION (name, idstation, adrress)
values ('58 Nelson Blvd', 18656, '58 Nelson BlvdM');
insert into STATION (name, idstation, adrress)
values ('625 Studi Stree', 50010, '625 Studi Stree');
insert into STATION (name, idstation, adrress)
values ('73rd Street', 94915, '73rd StreetLeng');
insert into STATION (name, idstation, adrress)
values ('27 Page', 33350, '27 PageGrand Ra');
insert into STATION (name, idstation, adrress)
values ('79 Collie Road', 10610, '79 Collie RoadF');
insert into STATION (name, idstation, adrress)
values ('15 Esposito Roa', 81000, '15 Esposito Roa');
insert into STATION (name, idstation, adrress)
values ('56 Chesnutt Dri', 87661, '56 Chesnutt Dri');
insert into STATION (name, idstation, adrress)
values ('12 Luzern Stree', 19432, '12 Luzern Stree');
insert into STATION (name, idstation, adrress)
values ('97 Roy Parnell ', 23411, '97 Roy Parnell ');
insert into STATION (name, idstation, adrress)
values ('172 Keanu Road', 21911, '172 Keanu RoadM');
insert into STATION (name, idstation, adrress)
values ('985 Klein', 73935, '985 KleinMaebas');
insert into STATION (name, idstation, adrress)
values ('921 Gates Drive', 54405, '921 Gates Drive');
commit;
prompt 500 records committed...
insert into STATION (name, idstation, adrress)
values ('9 Belushi Drive', 63585, '9 Belushi Drive');
insert into STATION (name, idstation, adrress)
values ('57 Glenn Road', 85799, '57 Glenn RoadNe');
insert into STATION (name, idstation, adrress)
values ('43rd Street', 57250, '43rd StreetLeip');
insert into STATION (name, idstation, adrress)
values ('161 Logue', 12225, '161 LogueLondri');
insert into STATION (name, idstation, adrress)
values ('82 Bonn Street', 33035, '82 Bonn StreetG');
insert into STATION (name, idstation, adrress)
values ('42 Bernard Blvd', 31262, '42 Bernard Blvd');
insert into STATION (name, idstation, adrress)
values ('35 Tyler', 18932, '35 TylerSoest');
insert into STATION (name, idstation, adrress)
values ('9 La Plata Stre', 38752, '9 La Plata Stre');
insert into STATION (name, idstation, adrress)
values ('314 Blue bell R', 55938, '314 Blue bell R');
insert into STATION (name, idstation, adrress)
values ('57 Colton Blvd', 13434, '57 Colton BlvdV');
insert into STATION (name, idstation, adrress)
values ('76 Adelaide Roa', 30248, '76 Adelaide Roa');
insert into STATION (name, idstation, adrress)
values ('59 Gordon Road', 94491, '59 Gordon RoadH');
insert into STATION (name, idstation, adrress)
values ('64 Wang Street', 36633, '64 Wang StreetS');
insert into STATION (name, idstation, adrress)
values ('84 Szazhalombat', 59420, '84 Szazhalombat');
insert into STATION (name, idstation, adrress)
values ('61 Makowicz Roa', 22115, '61 Makowicz Roa');
insert into STATION (name, idstation, adrress)
values ('90 Mae Road', 79222, '90 Mae RoadMenl');
insert into STATION (name, idstation, adrress)
values ('51 Law', 54122, '51 LawEhningen');
insert into STATION (name, idstation, adrress)
values ('24 Eden prairie', 35555, '24 Eden prairie');
insert into STATION (name, idstation, adrress)
values ('812 Jody Ave', 85186, '812 Jody AveTha');
insert into STATION (name, idstation, adrress)
values ('9 Norm Street', 36508, '9 Norm StreetFo');
insert into STATION (name, idstation, adrress)
values ('569 Tracy Stree', 67745, '569 Tracy Stree');
insert into STATION (name, idstation, adrress)
values ('30 Emily', 29942, '30 EmilyBiella');
insert into STATION (name, idstation, adrress)
values ('49 Turner Ave', 10511, '49 Turner AveMa');
insert into STATION (name, idstation, adrress)
values ('12 Chan Drive', 24078, '12 Chan DriveSt');
insert into STATION (name, idstation, adrress)
values ('33rd Street', 36095, '33rd StreetMadi');
insert into STATION (name, idstation, adrress)
values ('81 Tartu Road', 19862, '81 Tartu RoadYo');
insert into STATION (name, idstation, adrress)
values ('797 Roberta Str', 57409, '797 Roberta Str');
insert into STATION (name, idstation, adrress)
values ('83 Quinones Dri', 90106, '83 Quinones Dri');
insert into STATION (name, idstation, adrress)
values ('61 Dar Street', 74427, '61 Dar StreetNe');
insert into STATION (name, idstation, adrress)
values ('32nd Street', 93674, '32nd StreetWoki');
insert into STATION (name, idstation, adrress)
values ('22 The Woodland', 86759, '22 The Woodland');
insert into STATION (name, idstation, adrress)
values ('92 Peniston Dri', 69379, '92 Peniston Dri');
insert into STATION (name, idstation, adrress)
values ('92 Pandrup Stre', 31894, '92 Pandrup Stre');
insert into STATION (name, idstation, adrress)
values ('50 Gordon Road', 10924, '50 Gordon RoadF');
insert into STATION (name, idstation, adrress)
values ('37 Charlottesvi', 89932, '37 Charlottesvi');
insert into STATION (name, idstation, adrress)
values ('367 Kinski Driv', 11298, '367 Kinski Driv');
insert into STATION (name, idstation, adrress)
values ('22 Diddley Stre', 49769, '22 Diddley Stre');
insert into STATION (name, idstation, adrress)
values ('96 Bloomington ', 22538, '96 Bloomington ');
insert into STATION (name, idstation, adrress)
values ('40 Cage Street', 82731, '40 Cage StreetS');
insert into STATION (name, idstation, adrress)
values ('36 Bugnon Road', 36226, '36 Bugnon RoadE');
insert into STATION (name, idstation, adrress)
values ('16 Alexandria', 38382, '16 AlexandriaCa');
insert into STATION (name, idstation, adrress)
values ('93 Eliza', 46777, '93 ElizaMilwauk');
insert into STATION (name, idstation, adrress)
values ('58 Faithfull St', 33758, '58 Faithfull St');
insert into STATION (name, idstation, adrress)
values ('5 Marlboro Stre', 21813, '5 Marlboro Stre');
insert into STATION (name, idstation, adrress)
values ('79 Hampton Ave', 63424, '79 Hampton AveF');
insert into STATION (name, idstation, adrress)
values ('40 Perry Road', 34507, '40 Perry RoadSh');
insert into STATION (name, idstation, adrress)
values ('69 Walter Drive', 91297, '69 Walter Drive');
insert into STATION (name, idstation, adrress)
values ('32 Hatfield Dri', 86869, '32 Hatfield Dri');
insert into STATION (name, idstation, adrress)
values ('61st Street', 64028, '61st StreetSale');
insert into STATION (name, idstation, adrress)
values ('43 Cartlidge Av', 32524, '43 Cartlidge Av');
insert into STATION (name, idstation, adrress)
values ('41 McCracken St', 70782, '41 McCracken St');
insert into STATION (name, idstation, adrress)
values ('99 Fairborn Roa', 25573, '99 Fairborn Roa');
insert into STATION (name, idstation, adrress)
values ('251 Hong Ave', 45960, '251 Hong AveLon');
insert into STATION (name, idstation, adrress)
values ('17 Streep Stree', 13773, '17 Streep Stree');
insert into STATION (name, idstation, adrress)
values ('14 Campinas Blv', 78049, '14 Campinas Blv');
commit;
prompt 555 records loaded
prompt Loading STATIONTOBUS...
insert into STATIONTOBUS (serial, idbusline, idstation)
values (20, 72, 20386);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (29, 56, 79222);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (19, 45, 49248);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (26, 31, 46859);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (19, 34, 73180);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (6, 5, 71060);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (14, 37, 18528);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (7, 57, 74312);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (11, 20, 35274);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (18, 178, 97849);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (12, 190, 41740);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (7, 134, 60141);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (18, 165, 97488);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (13, 101, 42756);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (25, 6, 66103);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (1, 65, 73180);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (1, 54, 73180);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (1, 111, 73180);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (5, 65, 85260);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (26, 65, 79822);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (5, 65, 37296);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (5, 65, 39679);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (5, 65, 50322);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (25, 6, 85260);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (29, 163, 86584);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (21, 54, 98563);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (12, 96, 74312);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (5, 65, 29757);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (4, 111, 78914);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (14, 67, 31905);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (5, 65, 65642);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (5, 65, 47843);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (5, 65, 19299);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (30, 173, 53302);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (29, 56, 50322);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (5, 65, 23866);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (12, 137, 42785);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (21, 54, 35991);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (27, 72, 76644);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (11, 133, 92366);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (26, 182, 50122);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (29, 178, 14390);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (22, 188, 72023);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (14, 197, 29699);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (28, 137, 89932);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (26, 95, 85260);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (29, 56, 77739);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (1, 174, 48030);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (22, 39, 53796);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (18, 45, 54072);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (14, 195, 54405);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (17, 106, 79613);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (14, 11, 78359);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (3, 40, 90181);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (29, 174, 40900);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (6, 143, 84027);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (6, 71, 46377);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (7, 173, 10391);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (29, 106, 89281);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (3, 169, 65964);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (28, 184, 96304);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (22, 143, 44993);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (5, 129, 17153);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (11, 90, 47875);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (23, 173, 30179);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (28, 75, 89820);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (30, 168, 31742);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (16, 186, 50322);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (11, 60, 16865);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (7, 89, 18932);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (1, 173, 56276);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (28, 193, 62169);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (4, 135, 42303);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (8, 6, 83043);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (8, 198, 33758);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (23, 49, 53053);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (10, 5, 15193);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (25, 169, 33543);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (5, 42, 37133);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (2, 169, 36161);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (11, 6, 44993);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (27, 60, 74339);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (30, 90, 33032);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (28, 53, 98847);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (23, 137, 57750);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (12, 96, 82236);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (9, 75, 77748);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (9, 18, 81573);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (9, 72, 60061);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (5, 190, 38633);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (9, 94, 86108);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (4, 195, 70782);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (14, 39, 54405);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (18, 60, 83216);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (29, 116, 79866);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (23, 177, 34477);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (3, 162, 86759);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (7, 116, 39341);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (26, 184, 88054);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (4, 116, 10391);
commit;
prompt 100 records committed...
insert into STATIONTOBUS (serial, idbusline, idstation)
values (11, 59, 42382);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (6, 144, 85260);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (12, 149, 31770);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (5, 23, 41740);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (28, 163, 84052);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (9, 95, 72106);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (23, 120, 29942);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (15, 96, 33758);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (6, 176, 59455);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (10, 178, 81776);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (21, 111, 83968);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (16, 154, 72042);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (10, 172, 84482);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (16, 128, 23411);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (14, 34, 62469);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (13, 54, 73935);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (27, 50, 98563);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (21, 42, 13434);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (7, 50, 89932);
commit;
prompt 119 records loaded
prompt Loading TICKET...
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1000, 0);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1001, 1);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1002, 2);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1003, 3);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1004, 4);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1005, 5);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1006, 6);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1007, 7);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1008, 8);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1009, 9);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1010, 10);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1011, 11);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1012, 12);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1013, 13);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1014, 14);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1015, 15);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1016, 16);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1017, 17);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1018, 18);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1019, 19);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1020, 20);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1021, 21);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1022, 22);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1023, 23);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1024, 24);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1025, 25);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1026, 26);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1027, 27);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1028, 28);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1029, 29);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1030, 30);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1031, 31);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1032, 32);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1033, 33);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1034, 34);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1035, 35);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1036, 36);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1037, 37);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1038, 38);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1039, 39);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1040, 40);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1041, 41);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1042, 42);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1043, 43);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1044, 44);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1045, 45);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1046, 46);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1047, 47);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1048, 48);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1049, 49);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1050, 50);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1051, 51);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1052, 52);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1053, 53);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1054, 54);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1354, 5);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1355, 5);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1356, 5);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1357, 5);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1358, 358);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1359, 5);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1360, 360);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1361, 361);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1362, 362);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1363, 363);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1364, 364);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1365, 365);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1366, 366);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1367, 2);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1368, 368);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1369, 369);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1370, 2);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1371, 2);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1372, 372);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1373, 373);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1374, 374);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1375, 375);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1376, 376);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1377, 377);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1378, 378);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1379, 379);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1380, 380);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1381, 381);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1382, 382);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1383, 383);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1384, 384);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1385, 385);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1386, 386);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1387, 387);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1388, 388);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1389, 389);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1390, 390);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1391, 391);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1392, 392);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1393, 393);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1394, 394);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1395, 395);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1396, 396);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1397, 397);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1398, 398);
commit;
prompt 100 records committed...
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1399, 399);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Youth', 1400, 63);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Invalid', 1401, 60);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Youth', 1402, 4);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Youth', 1403, 64);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Youth', 1404, 56);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Invalid', 1405, 25);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Youth', 1406, 56);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Invalid', 1407, 25);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Youth', 1408, 56);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1101, 101);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1102, 2);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1103, 103);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1104, 3);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1105, 105);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1106, 106);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1107, 107);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1108, 108);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1109, 109);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1110, 110);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1111, 3);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1112, 3);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1113, 113);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1114, 3);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1115, 115);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1116, 116);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1117, 117);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1118, 118);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1119, 119);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1120, 120);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1121, 121);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1122, 3);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1123, 123);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1124, 124);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1125, 125);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1126, 126);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1127, 127);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1128, 128);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1129, 129);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1130, 130);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1131, 131);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1132, 132);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1133, 133);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1134, 134);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1135, 135);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1136, 136);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1137, 137);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1138, 138);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1139, 139);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1140, 140);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1141, 141);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1142, 142);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1143, 143);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1144, 144);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1145, 145);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1146, 146);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1055, 55);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1056, 56);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1057, 57);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1058, 58);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1059, 59);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1060, 60);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1061, 61);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1062, 62);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1063, 63);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1064, 64);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1065, 65);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1066, 66);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1067, 67);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1068, 68);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1069, 69);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1070, 70);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1071, 71);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1072, 72);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1073, 73);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1074, 74);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1075, 75);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1076, 76);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1077, 77);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1078, 78);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1079, 79);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1080, 80);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1081, 81);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1082, 82);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1083, 83);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1084, 84);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1085, 85);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1086, 86);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1087, 87);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1088, 88);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1089, 89);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1090, 90);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1091, 91);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1092, 92);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1093, 93);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1094, 94);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1095, 95);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1096, 96);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1097, 97);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1098, 98);
commit;
prompt 200 records committed...
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1099, 99);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1100, 100);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1147, 147);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1148, 148);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1149, 149);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1150, 150);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1151, 151);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1152, 152);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1153, 153);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1154, 154);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1155, 155);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1156, 156);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1157, 157);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1158, 158);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1159, 159);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1160, 160);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1161, 161);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1162, 162);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1163, 163);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1164, 164);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1165, 165);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1166, 166);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1167, 167);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1168, 168);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1169, 169);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1170, 170);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1171, 171);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1172, 172);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1173, 173);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1174, 174);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1175, 175);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1176, 176);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1177, 177);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1178, 178);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1179, 179);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1180, 180);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1181, 181);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1182, 182);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1183, 183);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1184, 184);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1185, 185);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1186, 186);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1187, 187);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1188, 188);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1189, 189);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1190, 190);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1191, 191);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1192, 192);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1193, 193);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1194, 194);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1195, 195);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1196, 196);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1197, 197);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1198, 198);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1199, 199);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1200, 200);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1201, 201);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1202, 202);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1203, 203);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1204, 204);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1205, 205);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1206, 206);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1207, 207);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1208, 208);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1209, 209);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1210, 210);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1211, 211);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1212, 212);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1213, 213);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1214, 214);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1215, 215);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1216, 216);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1217, 217);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1218, 218);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1219, 219);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1220, 220);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1221, 221);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1222, 222);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1223, 223);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1224, 224);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1225, 225);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1226, 226);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1227, 227);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1228, 228);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1229, 229);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1230, 230);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1231, 231);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1232, 232);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1233, 233);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1234, 234);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1235, 235);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1236, 236);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1237, 237);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1238, 238);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1239, 239);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1240, 240);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1241, 241);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1242, 242);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1243, 243);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1244, 244);
commit;
prompt 300 records committed...
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1245, 245);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1246, 246);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1247, 247);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1248, 248);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1249, 249);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1250, 250);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1251, 251);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1252, 252);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1253, 253);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1254, 254);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1255, 255);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1256, 256);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1257, 257);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1258, 258);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1259, 259);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1260, 260);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1261, 261);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1262, 262);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1263, 263);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1264, 264);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1265, 265);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1266, 266);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1267, 267);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1268, 268);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1269, 269);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1270, 270);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1271, 271);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1272, 272);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1273, 273);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1274, 274);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1275, 275);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1276, 276);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1277, 277);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1278, 278);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1279, 279);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1280, 280);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1281, 281);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1282, 282);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1283, 283);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1284, 284);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1285, 285);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1286, 286);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1287, 287);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1288, 288);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1289, 289);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1290, 290);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1291, 291);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1292, 292);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1293, 293);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1294, 294);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1295, 295);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1296, 296);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1297, 297);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1298, 298);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1299, 299);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1300, 300);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1301, 301);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1302, 302);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1303, 303);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1304, 304);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1305, 305);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1306, 306);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1314, 314);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1315, 315);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1316, 316);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1317, 317);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1318, 318);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1319, 319);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1320, 320);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1321, 321);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1322, 322);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1323, 323);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1324, 324);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1325, 325);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1326, 326);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1327, 327);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1328, 328);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1329, 329);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1330, 330);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1331, 331);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1332, 332);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1333, 333);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1334, 334);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1335, 335);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1336, 336);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1337, 337);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1338, 338);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1339, 339);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1340, 340);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1341, 341);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1342, 342);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1343, 343);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1344, 344);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1345, 345);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1346, 346);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1347, 347);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1348, 348);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1349, 349);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1350, 350);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1351, 351);
commit;
prompt 400 records committed...
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1352, 352);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1353, 353);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1307, 307);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1308, 308);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1309, 309);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1310, 310);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1311, 311);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1312, 312);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1313, 313);
commit;
prompt 409 records loaded
prompt Loading TRAVELPAYMENT...
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('22-06-2024 08:15:00', 'dd-mm-yyyy hh24:mi:ss'), 6, 1134, '56-789-24');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('23-06-2024 11:30:00', 'dd-mm-yyyy hh24:mi:ss'), 8, 1135, '67-890-35');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('24-06-2024 14:35:00', 'dd-mm-yyyy hh24:mi:ss'), 7, 1136, '78-901-46');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('25-06-2024 09:40:00', 'dd-mm-yyyy hh24:mi:ss'), 11, 1137, '89-012-57');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('26-06-2024 10:20:00', 'dd-mm-yyyy hh24:mi:ss'), 5, 1138, '90-123-68');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('27-06-2024 14:10:00', 'dd-mm-yyyy hh24:mi:ss'), 5, 1139, '01-234-79');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('28-06-2024 08:50:00', 'dd-mm-yyyy hh24:mi:ss'), 6, 1140, '12-345-81');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('29-06-2024 12:45:00', 'dd-mm-yyyy hh24:mi:ss'), 8, 1141, '23-456-92');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('30-06-2024 15:25:00', 'dd-mm-yyyy hh24:mi:ss'), 6, 1142, '34-567-03');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('01-07-2024 09:35:00', 'dd-mm-yyyy hh24:mi:ss'), 11, 1143, '45-678-14');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('02-07-2024 11:05:00', 'dd-mm-yyyy hh24:mi:ss'), 7, 1144, '56-789-25');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('03-07-2024 13:55:00', 'dd-mm-yyyy hh24:mi:ss'), 12, 1145, '67-890-36');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('04-07-2024 08:00:00', 'dd-mm-yyyy hh24:mi:ss'), 5, 1146, '78-901-47');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('05-07-2024 10:30:00', 'dd-mm-yyyy hh24:mi:ss'), 7, 1147, '89-012-58');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('06-07-2024 14:20:00', 'dd-mm-yyyy hh24:mi:ss'), 7, 1148, '90-123-69');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('07-07-2024 08:10:00', 'dd-mm-yyyy hh24:mi:ss'), 8, 1149, '01-234-80');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('08-07-2024 11:40:00', 'dd-mm-yyyy hh24:mi:ss'), 6, 1150, '12-345-82');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('09-07-2024 13:15:00', 'dd-mm-yyyy hh24:mi:ss'), 11, 1151, '23-456-93');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('10-07-2024 09:25:00', 'dd-mm-yyyy hh24:mi:ss'), 7, 1152, '34-567-04');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('11-07-2024 10:55:00', 'dd-mm-yyyy hh24:mi:ss'), 8, 1153, '45-678-15');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('12-07-2024 14:45:00', 'dd-mm-yyyy hh24:mi:ss'), 5, 1154, '56-789-26');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('13-07-2024 08:30:00', 'dd-mm-yyyy hh24:mi:ss'), 6, 1155, '67-890-37');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('14-07-2024 11:20:00', 'dd-mm-yyyy hh24:mi:ss'), 9, 1156, '78-901-48');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('15-07-2024 15:10:00', 'dd-mm-yyyy hh24:mi:ss'), 8, 1157, '89-012-59');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('16-07-2024 08:20:00', 'dd-mm-yyyy hh24:mi:ss'), 6, 1158, '90-123-70');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('17-07-2024 10:50:00', 'dd-mm-yyyy hh24:mi:ss'), 9, 1159, '01-234-81');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('18-07-2024 14:40:00', 'dd-mm-yyyy hh24:mi:ss'), 7, 1160, '12-345-83');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('19-07-2024 08:15:00', 'dd-mm-yyyy hh24:mi:ss'), 11, 1161, '23-456-94');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('20-07-2024 11:30:00', 'dd-mm-yyyy hh24:mi:ss'), 5, 1162, '34-567-05');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('21-07-2024 13:45:00', 'dd-mm-yyyy hh24:mi:ss'), 6, 1163, '45-678-16');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('22-07-2024 09:00:00', 'dd-mm-yyyy hh24:mi:ss'), 7, 1164, '56-789-27');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('23-07-2024 10:40:00', 'dd-mm-yyyy hh24:mi:ss'), 7, 1165, '67-890-38');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('24-07-2024 14:20:00', 'dd-mm-yyyy hh24:mi:ss'), 6, 1166, '78-901-49');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('25-07-2024 08:45:00', 'dd-mm-yyyy hh24:mi:ss'), 11, 1167, '89-012-60');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('26-07-2024 11:10:00', 'dd-mm-yyyy hh24:mi:ss'), 5, 1168, '90-123-71');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('27-07-2024 13:55:00', 'dd-mm-yyyy hh24:mi:ss'), 10, 1169, '01-234-82');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('28-07-2024 09:25:00', 'dd-mm-yyyy hh24:mi:ss'), 5, 1170, '12-345-84');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('29-07-2024 10:15:00', 'dd-mm-yyyy hh24:mi:ss'), 7, 1171, '23-456-95');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('30-07-2024 14:00:00', 'dd-mm-yyyy hh24:mi:ss'), 6, 1172, '34-567-06');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('31-07-2024 08:05:00', 'dd-mm-yyyy hh24:mi:ss'), 8, 1173, '45-678-17');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('01-08-2024 11:30:00', 'dd-mm-yyyy hh24:mi:ss'), 6, 1174, '56-789-28');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('26-05-2024 09:00:00', 'dd-mm-yyyy hh24:mi:ss'), 7, 1000, '12-345-67');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('27-05-2024 10:30:00', 'dd-mm-yyyy hh24:mi:ss'), 9, 1001, '23-456-78');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('28-05-2024 14:15:00', 'dd-mm-yyyy hh24:mi:ss'), 7, 1002, '34-567-89');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('29-05-2024 08:45:00', 'dd-mm-yyyy hh24:mi:ss'), 11, 1003, '45-678-90');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('30-05-2024 11:20:00', 'dd-mm-yyyy hh24:mi:ss'), 6, 1004, '56-789-01');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('31-05-2024 13:50:00', 'dd-mm-yyyy hh24:mi:ss'), 6, 1005, '67-890-12');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('01-06-2024 09:25:00', 'dd-mm-yyyy hh24:mi:ss'), 8, 1006, '78-901-23');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('02-06-2024 12:10:00', 'dd-mm-yyyy hh24:mi:ss'), 5, 1007, '89-012-34');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('03-06-2024 15:40:00', 'dd-mm-yyyy hh24:mi:ss'), 7, 1008, '90-123-45');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('04-06-2024 08:55:00', 'dd-mm-yyyy hh24:mi:ss'), 9, 1009, '01-234-56');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('05-06-2024 10:35:00', 'dd-mm-yyyy hh24:mi:ss'), 5, 1010, '12-345-68');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('06-06-2024 14:00:00', 'dd-mm-yyyy hh24:mi:ss'), 8, 1011, '23-456-79');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('07-06-2024 09:15:00', 'dd-mm-yyyy hh24:mi:ss'), 9, 1012, '34-567-80');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('08-06-2024 11:45:00', 'dd-mm-yyyy hh24:mi:ss'), 8, 1013, '45-678-91');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('09-06-2024 13:30:00', 'dd-mm-yyyy hh24:mi:ss'), 6, 1014, '56-789-02');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('10-06-2024 08:20:00', 'dd-mm-yyyy hh24:mi:ss'), 6, 1015, '67-890-13');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('11-06-2024 10:10:00', 'dd-mm-yyyy hh24:mi:ss'), 7, 1016, '78-901-24');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('12-06-2024 14:50:00', 'dd-mm-yyyy hh24:mi:ss'), 12, 1017, '89-012-35');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('13-06-2024 08:30:00', 'dd-mm-yyyy hh24:mi:ss'), 5, 1018, '90-123-46');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('14-06-2024 12:25:00', 'dd-mm-yyyy hh24:mi:ss'), 8, 1019, '01-234-57');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('15-06-2024 15:15:00', 'dd-mm-yyyy hh24:mi:ss'), 6, 1020, '12-345-69');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('16-06-2024 08:40:00', 'dd-mm-yyyy hh24:mi:ss'), 7, 1021, '23-456-70');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('17-06-2024 11:55:00', 'dd-mm-yyyy hh24:mi:ss'), 6, 1022, '34-567-81');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('18-06-2024 14:45:00', 'dd-mm-yyyy hh24:mi:ss'), 10, 1023, '45-678-92');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('19-06-2024 09:05:00', 'dd-mm-yyyy hh24:mi:ss'), 5, 1024, '56-789-03');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('20-06-2024 10:50:00', 'dd-mm-yyyy hh24:mi:ss'), 8, 1025, '67-890-14');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('21-06-2024 13:20:00', 'dd-mm-yyyy hh24:mi:ss'), 5, 1026, '78-901-25');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('22-06-2024 08:15:00', 'dd-mm-yyyy hh24:mi:ss'), 6, 1027, '89-012-36');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('23-06-2024 11:30:00', 'dd-mm-yyyy hh24:mi:ss'), 8, 1028, '90-123-47');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('24-06-2024 14:35:00', 'dd-mm-yyyy hh24:mi:ss'), 8, 1029, '01-234-58');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('25-06-2024 09:40:00', 'dd-mm-yyyy hh24:mi:ss'), 6, 1030, '12-345-70');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('26-06-2024 10:20:00', 'dd-mm-yyyy hh24:mi:ss'), 7, 1031, '23-456-81');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('27-06-2024 14:10:00', 'dd-mm-yyyy hh24:mi:ss'), 7, 1032, '34-567-92');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('28-06-2024 08:50:00', 'dd-mm-yyyy hh24:mi:ss'), 5, 1033, '45-678-03');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('29-06-2024 12:45:00', 'dd-mm-yyyy hh24:mi:ss'), 5, 1034, '56-789-14');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('30-06-2024 15:25:00', 'dd-mm-yyyy hh24:mi:ss'), 10, 1035, '67-890-25');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('01-07-2024 09:35:00', 'dd-mm-yyyy hh24:mi:ss'), 5, 1036, '78-901-36');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('02-07-2024 11:05:00', 'dd-mm-yyyy hh24:mi:ss'), 6, 1037, '89-012-47');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('03-07-2024 13:55:00', 'dd-mm-yyyy hh24:mi:ss'), 6, 1038, '90-123-58');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('04-07-2024 08:00:00', 'dd-mm-yyyy hh24:mi:ss'), 7, 1039, '01-234-69');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('05-07-2024 10:30:00', 'dd-mm-yyyy hh24:mi:ss'), 7, 1040, '12-345-71');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('06-07-2024 14:20:00', 'dd-mm-yyyy hh24:mi:ss'), 5, 1041, '23-456-82');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('07-07-2024 08:10:00', 'dd-mm-yyyy hh24:mi:ss'), 5, 1042, '34-567-93');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('08-07-2024 11:40:00', 'dd-mm-yyyy hh24:mi:ss'), 9, 1043, '45-678-04');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('09-07-2024 13:15:00', 'dd-mm-yyyy hh24:mi:ss'), 9, 1044, '56-789-15');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('10-07-2024 09:25:00', 'dd-mm-yyyy hh24:mi:ss'), 7, 1045, '67-890-26');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('11-07-2024 10:55:00', 'dd-mm-yyyy hh24:mi:ss'), 6, 1046, '78-901-37');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('12-07-2024 14:45:00', 'dd-mm-yyyy hh24:mi:ss'), 10, 1047, '89-012-48');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('13-07-2024 08:30:00', 'dd-mm-yyyy hh24:mi:ss'), 7, 1048, '90-123-59');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('14-07-2024 11:20:00', 'dd-mm-yyyy hh24:mi:ss'), 9, 1049, '01-234-60');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('15-07-2024 15:10:00', 'dd-mm-yyyy hh24:mi:ss'), 5, 1050, '12-345-72');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('16-07-2024 08:20:00', 'dd-mm-yyyy hh24:mi:ss'), 7, 1051, '23-456-83');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('17-07-2024 10:50:00', 'dd-mm-yyyy hh24:mi:ss'), 9, 1052, '34-567-94');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('18-07-2024 14:40:00', 'dd-mm-yyyy hh24:mi:ss'), 8, 1053, '45-678-05');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('19-07-2024 08:15:00', 'dd-mm-yyyy hh24:mi:ss'), 6, 1054, '56-789-16');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('20-07-2024 11:30:00', 'dd-mm-yyyy hh24:mi:ss'), 7, 1055, '67-890-27');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('21-07-2024 13:45:00', 'dd-mm-yyyy hh24:mi:ss'), 7, 1056, '78-901-38');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('22-07-2024 09:00:00', 'dd-mm-yyyy hh24:mi:ss'), 5, 1057, '89-012-49');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('23-07-2024 10:40:00', 'dd-mm-yyyy hh24:mi:ss'), 5, 1058, '90-123-60');
commit;
prompt 100 records committed...
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('24-07-2024 14:20:00', 'dd-mm-yyyy hh24:mi:ss'), 8, 1059, '01-234-71');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('25-07-2024 08:45:00', 'dd-mm-yyyy hh24:mi:ss'), 7, 1060, '12-345-73');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('26-07-2024 11:10:00', 'dd-mm-yyyy hh24:mi:ss'), 8, 1061, '23-456-84');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('27-07-2024 13:55:00', 'dd-mm-yyyy hh24:mi:ss'), 6, 1062, '34-567-95');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('28-07-2024 09:25:00', 'dd-mm-yyyy hh24:mi:ss'), 7, 1063, '45-678-06');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('29-07-2024 10:15:00', 'dd-mm-yyyy hh24:mi:ss'), 7, 1064, '56-789-17');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('30-07-2024 14:00:00', 'dd-mm-yyyy hh24:mi:ss'), 11, 1065, '67-890-28');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('31-07-2024 08:05:00', 'dd-mm-yyyy hh24:mi:ss'), 5, 1066, '78-901-39');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('01-08-2024 11:30:00', 'dd-mm-yyyy hh24:mi:ss'), 10, 1067, '89-012-50');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('02-08-2024 13:40:00', 'dd-mm-yyyy hh24:mi:ss'), 9, 1068, '90-123-61');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('03-08-2024 09:15:00', 'dd-mm-yyyy hh24:mi:ss'), 7, 1069, '01-234-72');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('04-08-2024 10:45:00', 'dd-mm-yyyy hh24:mi:ss'), 6, 1070, '12-345-74');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('05-08-2024 14:25:00', 'dd-mm-yyyy hh24:mi:ss'), 11, 1071, '23-456-85');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('06-08-2024 08:50:00', 'dd-mm-yyyy hh24:mi:ss'), 7, 1072, '34-567-96');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('07-08-2024 11:20:00', 'dd-mm-yyyy hh24:mi:ss'), 12, 1073, '45-678-07');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('08-08-2024 13:10:00', 'dd-mm-yyyy hh24:mi:ss'), 5, 1074, '56-789-18');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('09-08-2024 08:20:00', 'dd-mm-yyyy hh24:mi:ss'), 5, 1075, '67-890-29');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('10-08-2024 10:55:00', 'dd-mm-yyyy hh24:mi:ss'), 7, 1076, '78-901-40');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('11-08-2024 14:35:00', 'dd-mm-yyyy hh24:mi:ss'), 5, 1077, '89-012-51');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('12-08-2024 09:00:00', 'dd-mm-yyyy hh24:mi:ss'), 6, 1078, '90-123-62');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('13-08-2024 11:25:00', 'dd-mm-yyyy hh24:mi:ss'), 8, 1079, '01-234-73');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('14-08-2024 13:50:00', 'dd-mm-yyyy hh24:mi:ss'), 7, 1080, '12-345-75');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('15-08-2024 08:10:00', 'dd-mm-yyyy hh24:mi:ss'), 8, 1081, '23-456-86');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('16-08-2024 10:40:00', 'dd-mm-yyyy hh24:mi:ss'), 5, 1082, '34-567-97');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('17-08-2024 14:20:00', 'dd-mm-yyyy hh24:mi:ss'), 10, 1083, '45-678-08');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('18-08-2024 08:45:00', 'dd-mm-yyyy hh24:mi:ss'), 9, 1084, '56-789-19');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('19-08-2024 11:15:00', 'dd-mm-yyyy hh24:mi:ss'), 7, 1085, '67-890-30');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('20-08-2024 13:05:00', 'dd-mm-yyyy hh24:mi:ss'), 6, 1086, '78-901-41');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('21-08-2024 09:20:00', 'dd-mm-yyyy hh24:mi:ss'), 8, 1087, '89-012-52');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('22-08-2024 10:50:00', 'dd-mm-yyyy hh24:mi:ss'), 7, 1088, '90-123-63');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('23-08-2024 14:30:00', 'dd-mm-yyyy hh24:mi:ss'), 9, 1089, '01-234-74');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('24-08-2024 08:35:00', 'dd-mm-yyyy hh24:mi:ss'), 5, 1090, '12-345-76');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('25-08-2024 11:00:00', 'dd-mm-yyyy hh24:mi:ss'), 9, 1091, '23-456-87');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('26-08-2024 13:45:00', 'dd-mm-yyyy hh24:mi:ss'), 9, 1092, '34-567-98');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('27-08-2024 09:05:00', 'dd-mm-yyyy hh24:mi:ss'), 8, 1093, '45-678-09');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('28-08-2024 10:55:00', 'dd-mm-yyyy hh24:mi:ss'), 6, 1094, '56-789-20');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('29-08-2024 14:40:00', 'dd-mm-yyyy hh24:mi:ss'), 6, 1095, '67-890-31');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('30-08-2024 08:20:00', 'dd-mm-yyyy hh24:mi:ss'), 6, 1096, '78-901-42');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('31-08-2024 11:30:00', 'dd-mm-yyyy hh24:mi:ss'), 10, 1097, '89-012-53');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('01-09-2024 13:15:00', 'dd-mm-yyyy hh24:mi:ss'), 5, 1098, '90-123-64');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('02-09-2024 09:25:00', 'dd-mm-yyyy hh24:mi:ss'), 5, 1099, '01-234-75');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('03-09-2024 11:55:00', 'dd-mm-yyyy hh24:mi:ss'), 9, 1100, '12-345-77');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('04-09-2024 14:10:00', 'dd-mm-yyyy hh24:mi:ss'), 8, 1101, '23-456-88');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('05-09-2024 08:00:00', 'dd-mm-yyyy hh24:mi:ss'), 6, 1102, '34-567-99');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('06-09-2024 10:35:00', 'dd-mm-yyyy hh24:mi:ss'), 9, 1103, '45-678-10');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('07-09-2024 14:25:00', 'dd-mm-yyyy hh24:mi:ss'), 7, 1104, '56-789-21');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('08-09-2024 08:50:00', 'dd-mm-yyyy hh24:mi:ss'), 6, 1105, '67-890-32');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('09-09-2024 11:20:00', 'dd-mm-yyyy hh24:mi:ss'), 5, 1106, '78-901-43');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('26-05-2024 09:00:00', 'dd-mm-yyyy hh24:mi:ss'), 7, 1107, '89-012-54');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('27-05-2024 10:30:00', 'dd-mm-yyyy hh24:mi:ss'), 9, 1108, '90-123-65');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('28-05-2024 14:15:00', 'dd-mm-yyyy hh24:mi:ss'), 8, 1109, '01-234-76');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('29-05-2024 08:45:00', 'dd-mm-yyyy hh24:mi:ss'), 6, 1110, '12-345-78');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('30-05-2024 11:20:00', 'dd-mm-yyyy hh24:mi:ss'), 10, 1111, '23-456-89');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('31-05-2024 13:50:00', 'dd-mm-yyyy hh24:mi:ss'), 6, 1112, '34-567-00');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('01-06-2024 09:25:00', 'dd-mm-yyyy hh24:mi:ss'), 6, 1113, '45-678-11');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('02-06-2024 12:10:00', 'dd-mm-yyyy hh24:mi:ss'), 5, 1114, '56-789-22');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('03-06-2024 15:40:00', 'dd-mm-yyyy hh24:mi:ss'), 9, 1115, '67-890-33');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('04-06-2024 08:55:00', 'dd-mm-yyyy hh24:mi:ss'), 8, 1116, '78-901-44');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('05-06-2024 10:35:00', 'dd-mm-yyyy hh24:mi:ss'), 8, 1117, '89-012-55');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('06-06-2024 14:00:00', 'dd-mm-yyyy hh24:mi:ss'), 6, 1118, '90-123-66');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('07-06-2024 09:15:00', 'dd-mm-yyyy hh24:mi:ss'), 10, 1119, '01-234-77');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('08-06-2024 11:45:00', 'dd-mm-yyyy hh24:mi:ss'), 7, 1120, '12-345-79');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('09-06-2024 13:30:00', 'dd-mm-yyyy hh24:mi:ss'), 12, 1121, '23-456-90');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('10-06-2024 08:20:00', 'dd-mm-yyyy hh24:mi:ss'), 5, 1122, '34-567-01');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('11-06-2024 10:10:00', 'dd-mm-yyyy hh24:mi:ss'), 5, 1123, '45-678-12');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('12-06-2024 14:50:00', 'dd-mm-yyyy hh24:mi:ss'), 7, 1124, '56-789-23');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('13-06-2024 08:30:00', 'dd-mm-yyyy hh24:mi:ss'), 8, 1125, '67-890-34');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('14-06-2024 12:25:00', 'dd-mm-yyyy hh24:mi:ss'), 6, 1126, '78-901-45');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('15-06-2024 15:15:00', 'dd-mm-yyyy hh24:mi:ss'), 8, 1127, '89-012-56');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('16-06-2024 08:40:00', 'dd-mm-yyyy hh24:mi:ss'), 6, 1128, '90-123-67');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('17-06-2024 11:55:00', 'dd-mm-yyyy hh24:mi:ss'), 5, 1129, '01-234-78');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('18-06-2024 14:45:00', 'dd-mm-yyyy hh24:mi:ss'), 5, 1130, '12-345-80');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('19-06-2024 09:05:00', 'dd-mm-yyyy hh24:mi:ss'), 10, 1131, '23-456-91');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('20-06-2024 10:50:00', 'dd-mm-yyyy hh24:mi:ss'), 5, 1132, '34-567-02');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('21-06-2024 13:20:00', 'dd-mm-yyyy hh24:mi:ss'), 8, 1133, '45-678-13');
commit;
prompt 175 records loaded
prompt Enabling foreign key constraints for BUSDRIVER...
alter table BUSDRIVER enable constraint SYS_C007921;
alter table BUSDRIVER enable constraint SYS_C007922;
prompt Enabling foreign key constraints for BUSRIDE...
alter table BUSRIDE enable constraint SYS_C007916;
alter table BUSRIDE enable constraint SYS_C007917;
prompt Enabling foreign key constraints for EMPLOYEESHOP...
alter table EMPLOYEESHOP enable constraint SYS_C008164;
prompt Enabling foreign key constraints for ORDERS...
alter table ORDERS enable constraint FK_EMPLOYEE_SHOP;
alter table ORDERS enable constraint SYS_C008147;
alter table ORDERS enable constraint SYS_C008148;
prompt Enabling foreign key constraints for LAUNDRY...
alter table LAUNDRY enable constraint SYS_C008154;
prompt Enabling foreign key constraints for PAYMENT...
alter table PAYMENT enable constraint SYS_C008161;
prompt Enabling foreign key constraints for STATIONTOBUS...
alter table STATIONTOBUS enable constraint SYS_C007910;
alter table STATIONTOBUS enable constraint SYS_C007911;
prompt Enabling foreign key constraints for TRAVELPAYMENT...
alter table TRAVELPAYMENT enable constraint SYS_C007904;
alter table TRAVELPAYMENT enable constraint SYS_C007905;
prompt Enabling triggers for BUS...
alter table BUS enable all triggers;
prompt Enabling triggers for DRIVER...
alter table DRIVER enable all triggers;
prompt Enabling triggers for BUSDRIVER...
alter table BUSDRIVER enable all triggers;
prompt Enabling triggers for BUSLINE...
alter table BUSLINE enable all triggers;
prompt Enabling triggers for BUSRIDE...
alter table BUSRIDE enable all triggers;
prompt Enabling triggers for CUSTOMER...
alter table CUSTOMER enable all triggers;
prompt Enabling triggers for DRESS...
alter table DRESS enable all triggers;
prompt Enabling triggers for EMPLOYEE...
alter table EMPLOYEE enable all triggers;
prompt Enabling triggers for EMPLOYEESHOP...
alter table EMPLOYEESHOP enable all triggers;
prompt Enabling triggers for ORDERS...
alter table ORDERS enable all triggers;
prompt Enabling triggers for LAUNDRY...
alter table LAUNDRY enable all triggers;
prompt Enabling triggers for PASSENGER...
alter table PASSENGER enable all triggers;
prompt Enabling triggers for PAYMENT...
alter table PAYMENT enable all triggers;
prompt Enabling triggers for STATION...
alter table STATION enable all triggers;
prompt Enabling triggers for STATIONTOBUS...
alter table STATIONTOBUS enable all triggers;
prompt Enabling triggers for TICKET...
alter table TICKET enable all triggers;
prompt Enabling triggers for TRAVELPAYMENT...
alter table TRAVELPAYMENT enable all triggers;
set feedback on
set define on
prompt Done.
