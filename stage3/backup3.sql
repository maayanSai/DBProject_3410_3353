prompt PL/SQL Developer import file
prompt Created on éåí øàùåï 21 éåìé 2024 by Maayan
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
  name           VARCHAR2(15) not null,
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
  add foreign key (IDTICKET)
  references TICKET (IDTICKET);
alter table PASSENGER
  add constraint CHEAK_PASSENGER_PHONE
  check (phone LIKE '0%');

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
prompt Disabling triggers for TICKET...
alter table TICKET disable all triggers;
prompt Disabling triggers for PASSENGER...
alter table PASSENGER disable all triggers;
prompt Disabling triggers for STATION...
alter table STATION disable all triggers;
prompt Disabling triggers for STATIONTOBUS...
alter table STATIONTOBUS disable all triggers;
prompt Disabling triggers for TRAVELPAYMENT...
alter table TRAVELPAYMENT disable all triggers;
prompt Disabling foreign key constraints for BUSDRIVER...
alter table BUSDRIVER disable constraint SYS_C007921;
alter table BUSDRIVER disable constraint SYS_C007922;
prompt Disabling foreign key constraints for BUSRIDE...
alter table BUSRIDE disable constraint SYS_C007916;
alter table BUSRIDE disable constraint SYS_C007917;
prompt Disabling foreign key constraints for PASSENGER...
alter table PASSENGER disable constraint SYS_C007928;
prompt Disabling foreign key constraints for STATIONTOBUS...
alter table STATIONTOBUS disable constraint SYS_C007910;
alter table STATIONTOBUS disable constraint SYS_C007911;
prompt Disabling foreign key constraints for TRAVELPAYMENT...
alter table TRAVELPAYMENT disable constraint SYS_C007904;
alter table TRAVELPAYMENT disable constraint SYS_C007905;
prompt Deleting TRAVELPAYMENT...
delete from TRAVELPAYMENT;
commit;
prompt Deleting STATIONTOBUS...
delete from STATIONTOBUS;
commit;
prompt Deleting STATION...
delete from STATION;
commit;
prompt Deleting PASSENGER...
delete from PASSENGER;
commit;
prompt Deleting TICKET...
delete from TICKET;
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
insert into BUS (model, licensenumber, capacity)
values ('Volvo B8R', '56-789-02', 26);
insert into BUS (model, licensenumber, capacity)
values ('Volvo B8R', '67-890-13', 47);
insert into BUS (model, licensenumber, capacity)
values ('Volvo B8R', '78-901-24', 52);
commit;
prompt 100 records committed...
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
commit;
prompt 176 records loaded
prompt Loading DRIVER...
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Craig', 534, 2, '56-789-14', 35, 84, 182, 5826);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Craig', 535, 3, '67-890-25', 36, 106, 182, 4454);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Craig', 536, 4, '78-901-36', 37, 140, 182, 5750);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Craig', 537, 5, '89-012-47', 38, 63, 182, 4540);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Craig', 538, 6, '90-123-58', 39, 150, 182, 9659);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Derek', 539, 7, '01-234-69', 40, 59, 182, 5743);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Diana', 540, 8, '12-345-71', 41, 79, 182, 4825);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Diane', 541, 9, '23-456-82', 42, 179, 182, 10964);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Dolly', 542, 10, '34-567-93', 43, 55, 182, 5648);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Donna', 543, 11, '45-678-04', 44, 112, 182, 4180);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Doris', 544, 12, '56-789-15', 45, 76, 182, 4231);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Drew', 545, 13, '67-890-26', 46, 58, 182, 5455);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Dolly', 546, 14, '78-901-37', 47, 177, 182, 9854);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Dolly', 547, 15, '89-012-48', 48, 77, 182, 4438);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Edith', 548, 16, '90-123-59', 49, 157, 182, 9854);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Edwin', 549, 17, '01-234-60', 50, 82, 182, 4508);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Elena', 550, 18, '12-345-72', 51, 84, 182, 5109);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Eli', 551, 19, '23-456-83', 52, 55, 182, 5958);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Ellie', 552, 20, '34-567-94', 53, 154, 182, 11073);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Elton', 553, 21, '45-678-05', 54, 161, 182, 8303);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Emily', 554, 22, '56-789-16', 55, 177, 182, 9914);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Emma', 555, 23, '67-890-27', 56, 157, 182, 9924);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Erica', 556, 24, '78-901-38', 57, 105, 182, 5638);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Erin', 557, 25, '89-012-49', 58, 164, 182, 10825);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Edwin', 558, 26, '90-123-60', 59, 69, 182, 5850);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Fiona', 559, 27, '01-234-71', 60, 120, 182, 5660);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Flora', 560, 28, '12-345-73', 61, 40, 182, 5025);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Frank', 561, 29, '23-456-84', 62, 180, 182, 9320);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Fred', 562, 30, '34-567-95', 63, 199, 182, 5727);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Gabe', 563, 31, '45-678-06', 64, 198, 182, 5290);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Gavin', 564, 32, '56-789-17', 65, 193, 182, 5372);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Grace', 565, 33, '67-890-28', 66, 175, 182, 10671);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Grant', 566, 34, '78-901-39', 67, 145, 182, 4085);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Greg', 567, 35, '89-012-50', 68, 78, 182, 5034);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Gwen', 568, 2, '90-123-61', 69, 177, 182, 10050);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Haley', 569, 3, '01-234-72', 70, 53, 182, 4695);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Hank', 570, 4, '12-345-74', 71, 114, 182, 5181);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Helen', 571, 5, '23-456-85', 72, 176, 182, 9621);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Henry', 572, 6, '34-567-96', 73, 156, 182, 9683);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Holly', 573, 7, '45-678-07', 74, 149, 182, 5479);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Isaac', 574, 8, '56-789-18', 75, 114, 182, 5532);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Ivy', 575, 9, '67-890-29', 76, 125, 182, 5079);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Jamie', 576, 10, '78-901-40', 77, 88, 182, 5135);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('James', 577, 11, '89-012-51', 78, 37, 182, 5427);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Jamie', 578, 12, '90-123-62', 79, 127, 182, 4969);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Jane', 579, 13, '01-234-73', 80, 186, 182, 4364);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Jared', 580, 14, '12-345-75', 81, 184, 182, 4890);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Jason', 581, 15, '23-456-86', 82, 54, 182, 4785);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Jenna', 583, 17, '45-678-08', 84, 97, 182, 4427);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Jenny', 584, 18, '56-789-19', 85, 178, 182, 11649);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Jesse', 585, 19, '67-890-30', 86, 70, 182, 5634);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Jill', 586, 20, '78-901-41', 87, 139, 182, 5908);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Jimmy', 587, 21, '89-012-52', 88, 79, 182, 5202);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Joan', 588, 22, '90-123-63', 89, 125, 182, 5796);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Jodie', 589, 23, '01-234-74', 90, 124, 182, 5030);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Joe', 590, 24, '12-345-76', 91, 196, 182, 5676);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Joel', 591, 25, '23-456-87', 92, 150, 182, 8018);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('John', 592, 26, '34-567-98', 93, 42, 182, 4775);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Jonah', 593, 27, '45-678-09', 94, 149, 182, 5323);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Joni', 594, 28, '56-789-20', 95, 57, 182, 4684);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Judy', 595, 29, '67-890-31', 96, 71, 182, 5033);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Julia', 596, 30, '78-901-42', 97, 153, 182, 8181);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Julie', 597, 31, '89-012-53', 98, 170, 182, 9939);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Justin', 598, 32, '90-123-64', 99, 161, 182, 11172);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Karen', 599, 33, '01-234-75', 100, 52, 182, 5214);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Kate', 600, 34, '12-345-77', 101, 81, 182, 5389);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Kathy', 601, 35, '23-456-88', 102, 91, 182, 4150);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Kayla', 602, 2, '34-567-99', 103, 52, 182, 4238);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Kelly', 604, 4, '56-789-21', 105, 31, 182, 5375);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Kevin', 605, 5, '67-890-32', 106, 168, 182, 7847);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Kim', 606, 6, '78-901-43', 107, 151, 182, 11669);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Kyle', 607, 7, '89-012-54', 108, 42, 182, 4642);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Laura', 608, 8, '90-123-65', 109, 168, 182, 9818);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Leila', 609, 9, '01-234-76', 110, 104, 182, 4817);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Liam', 610, 10, '12-345-78', 111, 142, 182, 5687);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Liz', 613, 13, '45-678-11', 114, 196, 182, 4056);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Logan', 614, 14, '56-789-22', 115, 187, 182, 5457);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Louis', 615, 15, '67-890-33', 116, 188, 182, 4528);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Lucy', 616, 16, '78-901-44', 117, 49, 182, 4340);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Lydia', 617, 17, '89-012-55', 118, 138, 182, 4278);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Jamie', 618, 18, '90-123-66', 119, 76, 182, 5637);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Jamie', 620, 20, '12-345-79', 121, 98, 182, 4659);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Mandy', 621, 21, '23-456-90', 122, 140, 182, 4691);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Maria', 622, 22, '34-567-01', 123, 199, 182, 4929);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Marie', 623, 23, '45-678-12', 124, 189, 182, 5086);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Mark', 624, 24, '56-789-23', 125, 172, 182, 8580);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Mason', 625, 25, '67-890-34', 126, 142, 182, 5151);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Matt', 626, 26, '78-901-45', 127, 46, 182, 4199);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Mel', 628, 28, '90-123-67', 129, 119, 182, 5809);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Mia', 629, 29, '01-234-78', 130, 74, 182, 4481);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Mike', 630, 30, '12-345-80', 131, 148, 182, 5378);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Molly', 631, 31, '23-456-91', 132, 140, 182, 4215);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Nancy', 632, 32, '34-567-02', 133, 98, 182, 5134);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Naomi', 633, 33, '45-678-13', 134, 149, 182, 4069);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Nell', 634, 34, '56-789-24', 135, 98, 182, 5213);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Nelly', 635, 35, '67-890-35', 136, 185, 182, 4746);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Nikki', 637, 3, '89-012-57', 138, 107, 182, 4467);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Nina', 638, 4, '90-123-68', 139, 110, 182, 5285);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Noah', 639, 5, '01-234-79', 140, 146, 182, 5665);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Nora', 640, 6, '12-345-81', 141, 144, 182, 4344);
commit;
prompt 100 records committed...
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Louis', 641, 7, '23-456-92', 142, 81, 182, 4390);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Oscar', 642, 8, '34-567-03', 143, 137, 182, 4877);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Louis', 643, 9, '45-678-14', 144, 112, 182, 5427);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Paula', 645, 11, '67-890-36', 146, 183, 182, 5464);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Pearl', 646, 12, '78-901-47', 147, 137, 182, 4794);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Penny', 647, 13, '89-012-58', 148, 61, 182, 5320);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Peter', 648, 14, '90-123-69', 149, 86, 182, 5964);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Phil', 649, 15, '01-234-80', 150, 104, 182, 4660);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Polly', 650, 16, '12-345-82', 151, 158, 182, 8426);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Quinn', 651, 17, '23-456-93', 152, 51, 182, 5370);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Ray', 653, 19, '45-678-15', 154, 159, 182, 11601);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Reese', 654, 20, '56-789-26', 155, 41, 182, 5751);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Renee', 655, 21, '67-890-37', 156, 53, 182, 5435);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Rhys', 656, 22, '78-901-48', 157, 32, 182, 4014);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Riley', 658, 24, '90-123-70', 159, 192, 182, 5613);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Robin', 659, 25, '01-234-81', 160, 120, 182, 4120);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Rosa', 661, 27, '23-456-94', 162, 98, 182, 4600);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Rose', 662, 28, '34-567-05', 163, 153, 182, 8287);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Ruby', 663, 29, '45-678-16', 164, 66, 182, 5933);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Ryan', 664, 30, '56-789-27', 165, 53, 182, 5023);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Sally', 665, 31, '67-890-38', 166, 40, 182, 5869);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Sarah', 667, 33, '89-012-60', 168, 180, 182, 10772);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Sean', 669, 35, '01-234-82', 170, 97, 182, 4452);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Seth', 670, 2, '12-345-84', 171, 134, 182, 4509);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Shane', 671, 3, '23-456-95', 172, 163, 182, 7983);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Shawn', 672, 4, '34-567-06', 173, 190, 182, 5200);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Simon', 673, 5, '45-678-17', 174, 184, 182, 5388);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Sonia', 674, 6, '56-789-28', 175, 199, 182, 5504);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Stacy', 675, 7, '67-890-39', 176, 189, 182, 4102);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Louis', 677, 9, '89-012-61', 178, 136, 182, 5351);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Sybil', 678, 10, '90-123-72', 179, 50, 182, 4400);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Terry', 679, 11, '01-234-83', 180, 58, 182, 5848);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Tim', 680, 12, '12-345-85', 181, 45, 182, 5405);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Louis', 681, 13, '23-456-96', 182, 174, 182, 11239);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Toby', 682, 14, '34-567-07', 183, 130, 182, 5742);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Todd', 683, 15, '45-678-18', 184, 199, 182, 4430);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Tony', 685, 17, '67-890-40', 186, 159, 182, 11655);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Tracy', 686, 18, '78-901-51', 187, 163, 182, 9067);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Tyler', 687, 19, '89-012-62', 188, 101, 182, 5589);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Vera', 688, 20, '90-123-73', 189, 188, 182, 5410);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Vicky', 689, 21, '01-234-84', 190, 89, 182, 5773);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Vince', 690, 22, '12-345-86', 191, 105, 182, 5105);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Wendy', 691, 23, '23-456-97', 192, 34, 182, 5950);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Willa', 693, 25, '45-678-19', 194, 62, 182, 5244);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Louis', 694, 26, '56-789-30', 195, 183, 182, 4494);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Yara', 695, 27, '67-890-41', 196, 167, 182, 9727);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Louis', 696, 28, '78-901-52', 197, 91, 182, 4334);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Yvonne', 697, 29, '89-012-63', 198, 181, 182, 11175);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Zack', 698, 30, '90-123-74', 199, 92, 182, 4321);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Zoe', 699, 31, '01-234-85', 200, 193, 182, 5146);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Abby', 501, 3, '23-456-78', 2, 70, 182, 5769);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Adam', 502, 4, '34-567-89', 3, 195, 182, 4337);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Alan', 503, 5, '45-678-90', 4, 76, 182, 4813);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Alex', 504, 6, '56-789-01', 5, 87, 182, 4117);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Alice', 505, 7, '67-890-12', 6, 157, 182, 9458);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Allie', 506, 8, '78-901-23', 7, 40, 182, 4486);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Andy', 508, 10, '90-123-45', 9, 94, 182, 4077);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Amy', 509, 11, '01-234-56', 10, 62, 182, 4815);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Andy', 510, 12, '12-345-68', 11, 81, 182, 4968);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Anna', 511, 13, '23-456-79', 12, 48, 182, 4895);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Annie', 512, 14, '34-567-80', 13, 41, 182, 4672);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('April', 513, 15, '45-678-91', 14, 122, 182, 4364);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Ariel', 514, 16, '56-789-02', 15, 119, 182, 4507);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Bella', 516, 18, '78-901-24', 17, 57, 182, 5729);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Ben', 517, 19, '89-012-35', 18, 115, 182, 5138);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Benny', 518, 20, '90-123-46', 19, 138, 182, 5695);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Bill', 519, 21, '01-234-57', 20, 40, 182, 4181);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Blake', 520, 22, '12-345-69', 21, 99, 182, 5414);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Brian', 522, 24, '34-567-81', 23, 185, 182, 4668);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Andy', 524, 26, '56-789-03', 25, 129, 182, 5202);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Carla', 525, 27, '67-890-14', 26, 116, 182, 5530);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Carol', 526, 28, '78-901-25', 27, 130, 182, 4373);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Casey', 527, 29, '89-012-36', 28, 81, 182, 5356);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Cathy', 528, 30, '90-123-47', 29, 164, 182, 11463);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Chad', 529, 31, '01-234-58', 30, 91, 182, 4266);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Andy', 530, 32, '12-345-70', 31, 182, 182, 8504);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Clara', 532, 34, '34-567-92', 33, 176, 182, 8809);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Andy', 533, 35, '45-678-03', 34, 45, 182, 4786);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Keith', 603, 3, '45-678-10', 104, 113, 182, 4243);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Linda', 611, 11, '23-456-89', 112, 88, 182, 4416);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Maddie', 619, 19, '01-234-77', 120, 117, 182, 4345);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Megan', 627, 27, '89-012-56', 128, 109, 182, 5156);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Nick', 636, 2, '78-901-46', 137, 193, 182, 5841);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Pam', 644, 10, '56-789-25', 145, 120, 182, 4914);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Randy', 652, 18, '34-567-04', 153, 110, 182, 5468);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Louis', 660, 26, '12-345-83', 161, 42, 182, 5253);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Scott', 668, 34, '90-123-71', 169, 103, 182, 4333);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Steve', 676, 8, '78-901-50', 177, 123, 182, 5482);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Tom', 684, 16, '56-789-29', 185, 33, 182, 4582);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Will', 692, 24, '34-567-08', 193, 176, 182, 9180);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Louis', 500, 2, '12-345-67', 1, 79, 182, 5325);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Alvin', 507, 9, '89-012-34', 8, 32, 182, 4651);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Avery', 515, 17, '67-890-13', 16, 45, 182, 5018);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Bruce', 523, 25, '45-678-92', 24, 78, 182, 4097);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Cindy', 531, 33, '23-456-81', 32, 172, 182, 10014);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Lisa', 612, 12, '34-567-00', 113, 188, 182, 4911);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Edwin', 582, 16, '34-567-97', 83, 156, 182, 9354);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Louis', 657, 23, '89-012-59', 158, 68, 182, 4131);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Brett', 521, 23, '23-456-70', 22, 148, 182, 4658);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline, work_hours, max_work_hours, salary)
values ('Sam', 666, 32, '78-901-49', 167, 73, 182, 5163);
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
prompt Loading TICKET...
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
values ('youth', 1000, 0);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1001, 1);
commit;
prompt 100 records committed...
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
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1099, 99);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1100, 100);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1147, 147);
commit;
prompt 200 records committed...
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
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1245, 245);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1246, 246);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1247, 247);
commit;
prompt 300 records committed...
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
commit;
prompt 400 records committed...
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1348, 348);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1349, 349);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1350, 350);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1351, 351);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1352, 352);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1353, 353);
commit;
prompt 406 records loaded
prompt Loading PASSENGER...
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
commit;
prompt 100 records committed...
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
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Luke', 455, '099-6789012', 1355, to_date('09-05-1962', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Mark', 456, '099-7890123', 1356, to_date('22-03-2016', 'dd-mm-yyyy'));
insert into PASSENGER (name, idpassenger, phone, idticket, bdate)
values ('Mary', 457, '099-8901234', 1357, to_date('14-01-2006', 'dd-mm-yyyy'));
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
commit;
prompt 200 records committed...
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
commit;
prompt 300 records committed...
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
values ('Lois', 179, '058-0123456', 1079, to_date('02-12-1993', 'dd-mm-yyyy'));
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
commit;
prompt 400 records committed...
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
commit;
prompt 406 records loaded
prompt Loading STATION...
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
commit;
prompt 100 records committed...
insert into STATION (name, idstation, adrress)
values ('84 Roberts Road', 62469, '84 Roberts Road');
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
commit;
prompt 200 records committed...
insert into STATION (name, idstation, adrress)
values ('427 Diaz Drive', 11606, '427 Diaz DriveF');
insert into STATION (name, idstation, adrress)
values ('2 Belgrad Ave', 47417, '2 Belgrad AveMa');
insert into STATION (name, idstation, adrress)
values ('61st Street', 31283, '61st StreetDarm');
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
commit;
prompt 300 records committed...
insert into STATION (name, idstation, adrress)
values ('172 Keanu Road', 21911, '172 Keanu RoadM');
insert into STATION (name, idstation, adrress)
values ('985 Klein', 73935, '985 KleinMaebas');
insert into STATION (name, idstation, adrress)
values ('921 Gates Drive', 54405, '921 Gates Drive');
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
insert into STATION (name, idstation, adrress)
values ('99 Giessen Road', 75529, '99 Giessen Road');
insert into STATION (name, idstation, adrress)
values ('40 Kiefer', 81150, '40 KieferFort L');
insert into STATION (name, idstation, adrress)
values ('44 Wright Stree', 32995, '44 Wright Stree');
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
commit;
prompt 400 records committed...
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
commit;
prompt 500 records committed...
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
values ('63 Jeff Ave', 14610, '63 Jeff AveBedf');
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
commit;
prompt 555 records loaded
prompt Loading STATIONTOBUS...
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
commit;
prompt 100 records committed...
insert into STATIONTOBUS (serial, idbusline, idstation)
values (7, 50, 89932);
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
commit;
prompt 119 records loaded
prompt Loading TRAVELPAYMENT...
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
commit;
prompt 100 records committed...
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
commit;
prompt 175 records loaded
prompt Enabling foreign key constraints for BUSDRIVER...
alter table BUSDRIVER enable constraint SYS_C007921;
alter table BUSDRIVER enable constraint SYS_C007922;
prompt Enabling foreign key constraints for BUSRIDE...
alter table BUSRIDE enable constraint SYS_C007916;
alter table BUSRIDE enable constraint SYS_C007917;
prompt Enabling foreign key constraints for PASSENGER...
alter table PASSENGER enable constraint SYS_C007928;
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
prompt Enabling triggers for TICKET...
alter table TICKET enable all triggers;
prompt Enabling triggers for PASSENGER...
alter table PASSENGER enable all triggers;
prompt Enabling triggers for STATION...
alter table STATION enable all triggers;
prompt Enabling triggers for STATIONTOBUS...
alter table STATIONTOBUS enable all triggers;
prompt Enabling triggers for TRAVELPAYMENT...
alter table TRAVELPAYMENT enable all triggers;
set feedback on
set define on
prompt Done.
