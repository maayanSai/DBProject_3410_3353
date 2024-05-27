prompt PL/SQL Developer import file
prompt Created on Monday, 27 May 2024 by Maayan
set feedback off
set define off

prompt Creating BUS...
create table BUS
(
  model         VARCHAR2(15) not null,
  licensenumber VARCHAR2(15) not null,
  capacity      INTEGER not null
);
alter table BUS
  add primary key (LICENSENUMBER);

prompt Creating DRIVER...
create table DRIVER
(
  name         VARCHAR2(15) not null,
  idriver      INTEGER not null,
  seniority    INTEGER not null,
  icensenumber VARCHAR2(15) not null,
  idbusline    INTEGER not null
);

alter table DRIVER
  add primary key (IDRIVER);

prompt Creating BUSDRIVER...
create table BUSDRIVER
(
  idriver       INTEGER not null,
  licensenumber VARCHAR2(15) not null
);
alter table BUSDRIVER
  add primary key (IDRIVER, LICENSENUMBER);
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
);
alter table BUSLINE
  add primary key (IDBUSLINE);

prompt Creating BUSRIDE...
create table BUSRIDE
(
  starttime     DATE not null,
  idbusline     INTEGER not null,
  licensenumber VARCHAR2(15) not null
);
alter table BUSRIDE
  add primary key (IDBUSLINE, LICENSENUMBER);
alter table BUSRIDE
  add foreign key (IDBUSLINE)
  references BUSLINE (IDBUSLINE);
alter table BUSRIDE
  add foreign key (LICENSENUMBER)
  references BUS (LICENSENUMBER);

prompt Creating PASSENGER...
create table PASSENGER
(
  name        VARCHAR2(15) not null,
  idpassenger INTEGER not null,
  phone       VARCHAR2(15) not null,
  idticket    INTEGER not null
);
alter table PASSENGER
  add primary key (IDPASSENGER);

prompt Creating STATION...
create table STATION
(
  name      VARCHAR2(15) not null,
  idstation INTEGER not null,
  adrress   VARCHAR2(15) not null
);
alter table STATION
  add primary key (IDSTATION);

prompt Creating STATIONTOBUS...
create table STATIONTOBUS
(
  serial    INTEGER not null,
  idbusline INTEGER not null,
  idstation INTEGER not null
);
alter table STATIONTOBUS
  add primary key (IDBUSLINE, IDSTATION);
alter table STATIONTOBUS
  add foreign key (IDBUSLINE)
  references BUSLINE (IDBUSLINE);

prompt Creating TICKET...
create table TICKET
(
  cardprofile      VARCHAR2(15) not null,
  idticket         INTEGER not null,
  accumulatedvalue INTEGER not null
);
alter table TICKET
  add primary key (IDTICKET);

prompt Creating TRAVELPAYMENT...
create table TRAVELPAYMENT
(
  traveltime    DATE not null,
  travelcost    INTEGER not null,
  idticket      INTEGER not null,
  licensenumber VARCHAR2(15) not null
);
alter table TRAVELPAYMENT
  add primary key (IDTICKET, LICENSENUMBER);
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
prompt Disabling triggers for PASSENGER...
alter table PASSENGER disable all triggers;
prompt Disabling triggers for STATION...
alter table STATION disable all triggers;
prompt Disabling triggers for STATIONTOBUS...
alter table STATIONTOBUS disable all triggers;
prompt Disabling triggers for TICKET...
alter table TICKET disable all triggers;
prompt Disabling triggers for TRAVELPAYMENT...
alter table TRAVELPAYMENT disable all triggers;
prompt Disabling foreign key constraints for BUSDRIVER...
alter table BUSDRIVER disable constraint SYS_C007812;
alter table BUSDRIVER disable constraint SYS_C007813;
prompt Disabling foreign key constraints for BUSRIDE...
alter table BUSRIDE disable constraint SYS_C007825;
alter table BUSRIDE disable constraint SYS_C007826;
prompt Disabling foreign key constraints for STATIONTOBUS...
alter table STATIONTOBUS disable constraint SYS_C007742;
prompt Disabling foreign key constraints for TRAVELPAYMENT...
alter table TRAVELPAYMENT disable constraint SYS_C007819;
alter table TRAVELPAYMENT disable constraint SYS_C007820;
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
prompt Deleting PASSENGER...
delete from PASSENGER;
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
commit;
prompt 100 records committed...
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
commit;
prompt 175 records loaded
prompt Loading DRIVER...
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Aaron', 500, 2, '12-345-67', 1);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Abby', 501, 3, '23-456-78', 2);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Adam', 502, 4, '34-567-89', 3);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Alan', 503, 5, '45-678-90', 4);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Alex', 504, 6, '56-789-01', 5);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Alice', 505, 7, '67-890-12', 6);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Allie', 506, 8, '78-901-23', 7);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Alvin', 507, 9, '89-012-34', 8);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Amber', 508, 10, '90-123-45', 9);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Amy', 509, 11, '01-234-56', 10);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Andy', 510, 12, '12-345-68', 11);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Anna', 511, 13, '23-456-79', 12);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Annie', 512, 14, '34-567-80', 13);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('April', 513, 15, '45-678-91', 14);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Ariel', 514, 16, '56-789-02', 15);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Avery', 515, 17, '67-890-13', 16);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Bella', 516, 18, '78-901-24', 17);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Ben', 517, 19, '89-012-35', 18);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Benny', 518, 20, '90-123-46', 19);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Bill', 519, 21, '01-234-57', 20);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Blake', 520, 22, '12-345-69', 21);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Brett', 521, 23, '23-456-70', 22);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Brian', 522, 24, '34-567-81', 23);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Bruce', 523, 25, '45-678-92', 24);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Caleb', 524, 26, '56-789-03', 25);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Carla', 525, 27, '67-890-14', 26);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Carol', 526, 28, '78-901-25', 27);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Casey', 527, 29, '89-012-36', 28);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Cathy', 528, 30, '90-123-47', 29);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Chad', 529, 31, '01-234-58', 30);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Chris', 530, 32, '12-345-70', 31);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Cindy', 531, 33, '23-456-81', 32);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Clara', 532, 34, '34-567-92', 33);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Clark', 533, 35, '45-678-03', 34);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Craig', 534, 2, '56-789-14', 35);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Daisy', 535, 3, '67-890-25', 36);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Dana', 536, 4, '78-901-36', 37);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('David', 537, 5, '89-012-47', 38);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Debby', 538, 6, '90-123-58', 39);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Derek', 539, 7, '01-234-69', 40);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Diana', 540, 8, '12-345-71', 41);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Diane', 541, 9, '23-456-82', 42);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Dolly', 542, 10, '34-567-93', 43);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Donna', 543, 11, '45-678-04', 44);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Doris', 544, 12, '56-789-15', 45);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Drew', 545, 13, '67-890-26', 46);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Dylan', 546, 14, '78-901-37', 47);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Eddie', 547, 15, '89-012-48', 48);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Edith', 548, 16, '90-123-59', 49);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Edwin', 549, 17, '01-234-60', 50);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Elena', 550, 18, '12-345-72', 51);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Eli', 551, 19, '23-456-83', 52);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Ellie', 552, 20, '34-567-94', 53);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Elton', 553, 21, '45-678-05', 54);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Emily', 554, 22, '56-789-16', 55);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Emma', 555, 23, '67-890-27', 56);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Erica', 556, 24, '78-901-38', 57);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Erin', 557, 25, '89-012-49', 58);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Ethan', 558, 26, '90-123-60', 59);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Fiona', 559, 27, '01-234-71', 60);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Flora', 560, 28, '12-345-73', 61);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Frank', 561, 29, '23-456-84', 62);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Fred', 562, 30, '34-567-95', 63);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Gabe', 563, 31, '45-678-06', 64);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Gavin', 564, 32, '56-789-17', 65);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Grace', 565, 33, '67-890-28', 66);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Grant', 566, 34, '78-901-39', 67);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Greg', 567, 35, '89-012-50', 68);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Gwen', 568, 2, '90-123-61', 69);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Haley', 569, 3, '01-234-72', 70);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Hank', 570, 4, '12-345-74', 71);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Helen', 571, 5, '23-456-85', 72);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Henry', 572, 6, '34-567-96', 73);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Holly', 573, 7, '45-678-07', 74);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Isaac', 574, 8, '56-789-18', 75);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Ivy', 575, 9, '67-890-29', 76);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Jack', 576, 10, '78-901-40', 77);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('James', 577, 11, '89-012-51', 78);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Jamie', 578, 12, '90-123-62', 79);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Jane', 579, 13, '01-234-73', 80);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Jared', 580, 14, '12-345-75', 81);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Jason', 581, 15, '23-456-86', 82);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Jean', 582, 16, '34-567-97', 83);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Jenna', 583, 17, '45-678-08', 84);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Jenny', 584, 18, '56-789-19', 85);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Jesse', 585, 19, '67-890-30', 86);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Jill', 586, 20, '78-901-41', 87);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Jimmy', 587, 21, '89-012-52', 88);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Joan', 588, 22, '90-123-63', 89);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Jodie', 589, 23, '01-234-74', 90);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Joe', 590, 24, '12-345-76', 91);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Joel', 591, 25, '23-456-87', 92);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('John', 592, 26, '34-567-98', 93);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Jonah', 593, 27, '45-678-09', 94);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Joni', 594, 28, '56-789-20', 95);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Judy', 595, 29, '67-890-31', 96);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Julia', 596, 30, '78-901-42', 97);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Julie', 597, 31, '89-012-53', 98);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Justin', 598, 32, '90-123-64', 99);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Karen', 599, 33, '01-234-75', 100);
commit;
prompt 100 records committed...
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Kate', 600, 34, '12-345-77', 101);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Kathy', 601, 35, '23-456-88', 102);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Kayla', 602, 2, '34-567-99', 103);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Keith', 603, 3, '45-678-10', 104);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Kelly', 604, 4, '56-789-21', 105);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Kevin', 605, 5, '67-890-32', 106);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Kim', 606, 6, '78-901-43', 107);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Kyle', 607, 7, '89-012-54', 108);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Laura', 608, 8, '90-123-65', 109);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Leila', 609, 9, '01-234-76', 110);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Liam', 610, 10, '12-345-78', 111);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Linda', 611, 11, '23-456-89', 112);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Lisa', 612, 12, '34-567-00', 113);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Liz', 613, 13, '45-678-11', 114);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Logan', 614, 14, '56-789-22', 115);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Louis', 615, 15, '67-890-33', 116);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Lucy', 616, 16, '78-901-44', 117);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Lydia', 617, 17, '89-012-55', 118);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Mabel', 618, 18, '90-123-66', 119);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Maddie', 619, 19, '01-234-77', 120);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Maggie', 620, 20, '12-345-79', 121);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Mandy', 621, 21, '23-456-90', 122);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Maria', 622, 22, '34-567-01', 123);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Marie', 623, 23, '45-678-12', 124);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Mark', 624, 24, '56-789-23', 125);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Mason', 625, 25, '67-890-34', 126);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Matt', 626, 26, '78-901-45', 127);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Megan', 627, 27, '89-012-56', 128);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Mel', 628, 28, '90-123-67', 129);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Mia', 629, 29, '01-234-78', 130);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Mike', 630, 30, '12-345-80', 131);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Molly', 631, 31, '23-456-91', 132);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Nancy', 632, 32, '34-567-02', 133);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Naomi', 633, 33, '45-678-13', 134);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Nell', 634, 34, '56-789-24', 135);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Nelly', 635, 35, '67-890-35', 136);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Nick', 636, 2, '78-901-46', 137);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Nikki', 637, 3, '89-012-57', 138);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Nina', 638, 4, '90-123-68', 139);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Noah', 639, 5, '01-234-79', 140);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Nora', 640, 6, '12-345-81', 141);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Olive', 641, 7, '23-456-92', 142);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Oscar', 642, 8, '34-567-03', 143);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Owen', 643, 9, '45-678-14', 144);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Pam', 644, 10, '56-789-25', 145);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Paula', 645, 11, '67-890-36', 146);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Pearl', 646, 12, '78-901-47', 147);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Penny', 647, 13, '89-012-58', 148);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Peter', 648, 14, '90-123-69', 149);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Phil', 649, 15, '01-234-80', 150);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Polly', 650, 16, '12-345-82', 151);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Quinn', 651, 17, '23-456-93', 152);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Randy', 652, 18, '34-567-04', 153);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Ray', 653, 19, '45-678-15', 154);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Reese', 654, 20, '56-789-26', 155);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Renee', 655, 21, '67-890-37', 156);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Rhys', 656, 22, '78-901-48', 157);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Ricky', 657, 23, '89-012-59', 158);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Riley', 658, 24, '90-123-70', 159);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Robin', 659, 25, '01-234-81', 160);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Roger', 660, 26, '12-345-83', 161);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Rosa', 661, 27, '23-456-94', 162);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Rose', 662, 28, '34-567-05', 163);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Ruby', 663, 29, '45-678-16', 164);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Ryan', 664, 30, '56-789-27', 165);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Sally', 665, 31, '67-890-38', 166);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Sam', 666, 32, '78-901-49', 167);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Sarah', 667, 33, '89-012-60', 168);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Scott', 668, 34, '90-123-71', 169);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Sean', 669, 35, '01-234-82', 170);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Seth', 670, 2, '12-345-84', 171);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Shane', 671, 3, '23-456-95', 172);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Shawn', 672, 4, '34-567-06', 173);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Simon', 673, 5, '45-678-17', 174);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Sonia', 674, 6, '56-789-28', 175);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Stacy', 675, 7, '67-890-39', 176);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Steve', 676, 8, '78-901-50', 177);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Susan', 677, 9, '89-012-61', 178);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Sybil', 678, 10, '90-123-72', 179);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Terry', 679, 11, '01-234-83', 180);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Tim', 680, 12, '12-345-85', 181);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Tina', 681, 13, '23-456-96', 182);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Toby', 682, 14, '34-567-07', 183);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Todd', 683, 15, '45-678-18', 184);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Tom', 684, 16, '56-789-29', 185);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Tony', 685, 17, '67-890-40', 186);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Tracy', 686, 18, '78-901-51', 187);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Tyler', 687, 19, '89-012-62', 188);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Vera', 688, 20, '90-123-73', 189);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Vicky', 689, 21, '01-234-84', 190);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Vince', 690, 22, '12-345-86', 191);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Wendy', 691, 23, '23-456-97', 192);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Will', 692, 24, '34-567-08', 193);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Willa', 693, 25, '45-678-19', 194);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Wyatt', 694, 26, '56-789-30', 195);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Yara', 695, 27, '67-890-41', 196);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Yvette', 696, 28, '78-901-52', 197);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Yvonne', 697, 29, '89-012-63', 198);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Zack', 698, 30, '90-123-74', 199);
insert into DRIVER (name, idriver, seniority, icensenumber, idbusline)
values ('Zoe', 699, 31, '01-234-85', 200);
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
insert into BUSDRIVER (idriver, licensenumber)
values (599, '01-234-75');
commit;
prompt 100 records committed...
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
prompt 175 records loaded
prompt Loading BUSLINE...
insert into BUSLINE (idbusline, frequency, maxprice)
values (1, '1 min', 5);
insert into BUSLINE (idbusline, frequency, maxprice)
values (2, '2 min', 6);
insert into BUSLINE (idbusline, frequency, maxprice)
values (3, '3 min', 7);
insert into BUSLINE (idbusline, frequency, maxprice)
values (4, '4 min', 8);
insert into BUSLINE (idbusline, frequency, maxprice)
values (5, '5 min', 9);
insert into BUSLINE (idbusline, frequency, maxprice)
values (6, '6 min', 10);
insert into BUSLINE (idbusline, frequency, maxprice)
values (7, '7 min', 11);
insert into BUSLINE (idbusline, frequency, maxprice)
values (8, '8 min', 12);
insert into BUSLINE (idbusline, frequency, maxprice)
values (9, '9 min', 5);
insert into BUSLINE (idbusline, frequency, maxprice)
values (10, '10 min', 6);
insert into BUSLINE (idbusline, frequency, maxprice)
values (11, '11 min', 7);
insert into BUSLINE (idbusline, frequency, maxprice)
values (12, '12 min', 8);
insert into BUSLINE (idbusline, frequency, maxprice)
values (13, '13 min', 9);
insert into BUSLINE (idbusline, frequency, maxprice)
values (14, '14 min', 10);
insert into BUSLINE (idbusline, frequency, maxprice)
values (15, '15 min', 11);
insert into BUSLINE (idbusline, frequency, maxprice)
values (16, '16 min', 12);
insert into BUSLINE (idbusline, frequency, maxprice)
values (17, '17 min', 5);
insert into BUSLINE (idbusline, frequency, maxprice)
values (18, '18 min', 6);
insert into BUSLINE (idbusline, frequency, maxprice)
values (19, '19 min', 7);
insert into BUSLINE (idbusline, frequency, maxprice)
values (20, '20 min', 8);
insert into BUSLINE (idbusline, frequency, maxprice)
values (21, '21 min', 9);
insert into BUSLINE (idbusline, frequency, maxprice)
values (22, '22 min', 10);
insert into BUSLINE (idbusline, frequency, maxprice)
values (23, '23 min', 11);
insert into BUSLINE (idbusline, frequency, maxprice)
values (24, '24 min', 12);
insert into BUSLINE (idbusline, frequency, maxprice)
values (25, '25 min', 5);
insert into BUSLINE (idbusline, frequency, maxprice)
values (26, '26 min', 6);
insert into BUSLINE (idbusline, frequency, maxprice)
values (27, '27 min', 7);
insert into BUSLINE (idbusline, frequency, maxprice)
values (28, '28 min', 8);
insert into BUSLINE (idbusline, frequency, maxprice)
values (29, '29 min', 9);
insert into BUSLINE (idbusline, frequency, maxprice)
values (30, '30 min', 10);
insert into BUSLINE (idbusline, frequency, maxprice)
values (31, '31 min', 11);
insert into BUSLINE (idbusline, frequency, maxprice)
values (32, '32 min', 12);
insert into BUSLINE (idbusline, frequency, maxprice)
values (33, '33 min', 5);
insert into BUSLINE (idbusline, frequency, maxprice)
values (34, '34 min', 6);
insert into BUSLINE (idbusline, frequency, maxprice)
values (35, '35 min', 7);
insert into BUSLINE (idbusline, frequency, maxprice)
values (36, '36 min', 8);
insert into BUSLINE (idbusline, frequency, maxprice)
values (37, '37 min', 9);
insert into BUSLINE (idbusline, frequency, maxprice)
values (38, '38 min', 10);
insert into BUSLINE (idbusline, frequency, maxprice)
values (39, '39 min', 11);
insert into BUSLINE (idbusline, frequency, maxprice)
values (40, '40 min', 12);
insert into BUSLINE (idbusline, frequency, maxprice)
values (41, '41 min', 5);
insert into BUSLINE (idbusline, frequency, maxprice)
values (42, '42 min', 6);
insert into BUSLINE (idbusline, frequency, maxprice)
values (43, '43 min', 7);
insert into BUSLINE (idbusline, frequency, maxprice)
values (44, '44 min', 8);
insert into BUSLINE (idbusline, frequency, maxprice)
values (45, '45 min', 9);
insert into BUSLINE (idbusline, frequency, maxprice)
values (46, '46 min', 10);
insert into BUSLINE (idbusline, frequency, maxprice)
values (47, '47 min', 11);
insert into BUSLINE (idbusline, frequency, maxprice)
values (48, '48 min', 12);
insert into BUSLINE (idbusline, frequency, maxprice)
values (49, '49 min', 5);
insert into BUSLINE (idbusline, frequency, maxprice)
values (50, '50 min', 6);
insert into BUSLINE (idbusline, frequency, maxprice)
values (51, '51 min', 7);
insert into BUSLINE (idbusline, frequency, maxprice)
values (52, '52 min', 8);
insert into BUSLINE (idbusline, frequency, maxprice)
values (53, '53 min', 9);
insert into BUSLINE (idbusline, frequency, maxprice)
values (54, '54 min', 10);
insert into BUSLINE (idbusline, frequency, maxprice)
values (55, '55 min', 11);
insert into BUSLINE (idbusline, frequency, maxprice)
values (56, '56 min', 12);
insert into BUSLINE (idbusline, frequency, maxprice)
values (57, '57 min', 5);
insert into BUSLINE (idbusline, frequency, maxprice)
values (58, '58 min', 6);
insert into BUSLINE (idbusline, frequency, maxprice)
values (59, '59 min', 7);
insert into BUSLINE (idbusline, frequency, maxprice)
values (60, '60 min', 8);
insert into BUSLINE (idbusline, frequency, maxprice)
values (61, '1 min', 9);
insert into BUSLINE (idbusline, frequency, maxprice)
values (62, '2 min', 10);
insert into BUSLINE (idbusline, frequency, maxprice)
values (63, '3 min', 11);
insert into BUSLINE (idbusline, frequency, maxprice)
values (64, '4 min', 12);
insert into BUSLINE (idbusline, frequency, maxprice)
values (65, '5 min', 5);
insert into BUSLINE (idbusline, frequency, maxprice)
values (66, '6 min', 6);
insert into BUSLINE (idbusline, frequency, maxprice)
values (67, '7 min', 7);
insert into BUSLINE (idbusline, frequency, maxprice)
values (68, '8 min', 8);
insert into BUSLINE (idbusline, frequency, maxprice)
values (69, '9 min', 9);
insert into BUSLINE (idbusline, frequency, maxprice)
values (70, '10 min', 10);
insert into BUSLINE (idbusline, frequency, maxprice)
values (71, '11 min', 11);
insert into BUSLINE (idbusline, frequency, maxprice)
values (72, '12 min', 12);
insert into BUSLINE (idbusline, frequency, maxprice)
values (73, '13 min', 5);
insert into BUSLINE (idbusline, frequency, maxprice)
values (74, '14 min', 6);
insert into BUSLINE (idbusline, frequency, maxprice)
values (75, '15 min', 7);
insert into BUSLINE (idbusline, frequency, maxprice)
values (76, '16 min', 8);
insert into BUSLINE (idbusline, frequency, maxprice)
values (77, '17 min', 9);
insert into BUSLINE (idbusline, frequency, maxprice)
values (78, '18 min', 10);
insert into BUSLINE (idbusline, frequency, maxprice)
values (79, '19 min', 11);
insert into BUSLINE (idbusline, frequency, maxprice)
values (80, '20 min', 12);
insert into BUSLINE (idbusline, frequency, maxprice)
values (81, '21 min', 5);
insert into BUSLINE (idbusline, frequency, maxprice)
values (82, '22 min', 6);
insert into BUSLINE (idbusline, frequency, maxprice)
values (83, '23 min', 7);
insert into BUSLINE (idbusline, frequency, maxprice)
values (84, '24 min', 8);
insert into BUSLINE (idbusline, frequency, maxprice)
values (85, '25 min', 9);
insert into BUSLINE (idbusline, frequency, maxprice)
values (86, '26 min', 10);
insert into BUSLINE (idbusline, frequency, maxprice)
values (87, '27 min', 11);
insert into BUSLINE (idbusline, frequency, maxprice)
values (88, '28 min', 12);
insert into BUSLINE (idbusline, frequency, maxprice)
values (89, '29 min', 5);
insert into BUSLINE (idbusline, frequency, maxprice)
values (90, '30 min', 6);
insert into BUSLINE (idbusline, frequency, maxprice)
values (91, '31 min', 7);
insert into BUSLINE (idbusline, frequency, maxprice)
values (92, '32 min', 8);
insert into BUSLINE (idbusline, frequency, maxprice)
values (93, '33 min', 9);
insert into BUSLINE (idbusline, frequency, maxprice)
values (94, '34 min', 10);
insert into BUSLINE (idbusline, frequency, maxprice)
values (95, '35 min', 11);
insert into BUSLINE (idbusline, frequency, maxprice)
values (96, '36 min', 12);
insert into BUSLINE (idbusline, frequency, maxprice)
values (97, '37 min', 5);
insert into BUSLINE (idbusline, frequency, maxprice)
values (98, '38 min', 6);
insert into BUSLINE (idbusline, frequency, maxprice)
values (99, '39 min', 7);
insert into BUSLINE (idbusline, frequency, maxprice)
values (100, '40 min', 8);
commit;
prompt 100 records committed...
insert into BUSLINE (idbusline, frequency, maxprice)
values (101, '41 min', 9);
insert into BUSLINE (idbusline, frequency, maxprice)
values (102, '42 min', 10);
insert into BUSLINE (idbusline, frequency, maxprice)
values (103, '43 min', 11);
insert into BUSLINE (idbusline, frequency, maxprice)
values (104, '44 min', 12);
insert into BUSLINE (idbusline, frequency, maxprice)
values (105, '45 min', 5);
insert into BUSLINE (idbusline, frequency, maxprice)
values (106, '46 min', 6);
insert into BUSLINE (idbusline, frequency, maxprice)
values (107, '47 min', 7);
insert into BUSLINE (idbusline, frequency, maxprice)
values (108, '48 min', 8);
insert into BUSLINE (idbusline, frequency, maxprice)
values (109, '49 min', 9);
insert into BUSLINE (idbusline, frequency, maxprice)
values (110, '50 min', 10);
insert into BUSLINE (idbusline, frequency, maxprice)
values (111, '51 min', 11);
insert into BUSLINE (idbusline, frequency, maxprice)
values (112, '52 min', 12);
insert into BUSLINE (idbusline, frequency, maxprice)
values (113, '53 min', 5);
insert into BUSLINE (idbusline, frequency, maxprice)
values (114, '54 min', 6);
insert into BUSLINE (idbusline, frequency, maxprice)
values (115, '55 min', 7);
insert into BUSLINE (idbusline, frequency, maxprice)
values (116, '56 min', 8);
insert into BUSLINE (idbusline, frequency, maxprice)
values (117, '57 min', 9);
insert into BUSLINE (idbusline, frequency, maxprice)
values (118, '58 min', 10);
insert into BUSLINE (idbusline, frequency, maxprice)
values (119, '59 min', 11);
insert into BUSLINE (idbusline, frequency, maxprice)
values (120, '60 min', 12);
insert into BUSLINE (idbusline, frequency, maxprice)
values (121, '1 min', 5);
insert into BUSLINE (idbusline, frequency, maxprice)
values (122, '2 min', 6);
insert into BUSLINE (idbusline, frequency, maxprice)
values (123, '3 min', 7);
insert into BUSLINE (idbusline, frequency, maxprice)
values (124, '4 min', 8);
insert into BUSLINE (idbusline, frequency, maxprice)
values (125, '5 min', 9);
insert into BUSLINE (idbusline, frequency, maxprice)
values (126, '6 min', 10);
insert into BUSLINE (idbusline, frequency, maxprice)
values (127, '7 min', 11);
insert into BUSLINE (idbusline, frequency, maxprice)
values (128, '8 min', 12);
insert into BUSLINE (idbusline, frequency, maxprice)
values (129, '9 min', 5);
insert into BUSLINE (idbusline, frequency, maxprice)
values (130, '10 min', 6);
insert into BUSLINE (idbusline, frequency, maxprice)
values (131, '11 min', 7);
insert into BUSLINE (idbusline, frequency, maxprice)
values (132, '12 min', 8);
insert into BUSLINE (idbusline, frequency, maxprice)
values (133, '13 min', 9);
insert into BUSLINE (idbusline, frequency, maxprice)
values (134, '14 min', 10);
insert into BUSLINE (idbusline, frequency, maxprice)
values (135, '15 min', 11);
insert into BUSLINE (idbusline, frequency, maxprice)
values (136, '16 min', 12);
insert into BUSLINE (idbusline, frequency, maxprice)
values (137, '17 min', 5);
insert into BUSLINE (idbusline, frequency, maxprice)
values (138, '18 min', 6);
insert into BUSLINE (idbusline, frequency, maxprice)
values (139, '19 min', 7);
insert into BUSLINE (idbusline, frequency, maxprice)
values (140, '20 min', 8);
insert into BUSLINE (idbusline, frequency, maxprice)
values (141, '21 min', 9);
insert into BUSLINE (idbusline, frequency, maxprice)
values (142, '22 min', 10);
insert into BUSLINE (idbusline, frequency, maxprice)
values (143, '23 min', 11);
insert into BUSLINE (idbusline, frequency, maxprice)
values (144, '24 min', 12);
insert into BUSLINE (idbusline, frequency, maxprice)
values (145, '25 min', 5);
insert into BUSLINE (idbusline, frequency, maxprice)
values (146, '26 min', 6);
insert into BUSLINE (idbusline, frequency, maxprice)
values (147, '27 min', 7);
insert into BUSLINE (idbusline, frequency, maxprice)
values (148, '28 min', 8);
insert into BUSLINE (idbusline, frequency, maxprice)
values (149, '29 min', 9);
insert into BUSLINE (idbusline, frequency, maxprice)
values (150, '30 min', 10);
insert into BUSLINE (idbusline, frequency, maxprice)
values (151, '31 min', 11);
insert into BUSLINE (idbusline, frequency, maxprice)
values (152, '32 min', 12);
insert into BUSLINE (idbusline, frequency, maxprice)
values (153, '33 min', 5);
insert into BUSLINE (idbusline, frequency, maxprice)
values (154, '34 min', 6);
insert into BUSLINE (idbusline, frequency, maxprice)
values (155, '35 min', 7);
insert into BUSLINE (idbusline, frequency, maxprice)
values (156, '36 min', 8);
insert into BUSLINE (idbusline, frequency, maxprice)
values (157, '37 min', 9);
insert into BUSLINE (idbusline, frequency, maxprice)
values (158, '38 min', 10);
insert into BUSLINE (idbusline, frequency, maxprice)
values (159, '39 min', 11);
insert into BUSLINE (idbusline, frequency, maxprice)
values (160, '40 min', 12);
insert into BUSLINE (idbusline, frequency, maxprice)
values (161, '41 min', 5);
insert into BUSLINE (idbusline, frequency, maxprice)
values (162, '42 min', 6);
insert into BUSLINE (idbusline, frequency, maxprice)
values (163, '43 min', 7);
insert into BUSLINE (idbusline, frequency, maxprice)
values (164, '44 min', 8);
insert into BUSLINE (idbusline, frequency, maxprice)
values (165, '45 min', 9);
insert into BUSLINE (idbusline, frequency, maxprice)
values (166, '46 min', 10);
insert into BUSLINE (idbusline, frequency, maxprice)
values (167, '47 min', 11);
insert into BUSLINE (idbusline, frequency, maxprice)
values (168, '48 min', 12);
insert into BUSLINE (idbusline, frequency, maxprice)
values (169, '49 min', 5);
insert into BUSLINE (idbusline, frequency, maxprice)
values (170, '50 min', 6);
insert into BUSLINE (idbusline, frequency, maxprice)
values (171, '51 min', 7);
insert into BUSLINE (idbusline, frequency, maxprice)
values (172, '52 min', 8);
insert into BUSLINE (idbusline, frequency, maxprice)
values (173, '53 min', 9);
insert into BUSLINE (idbusline, frequency, maxprice)
values (174, '54 min', 10);
insert into BUSLINE (idbusline, frequency, maxprice)
values (175, '55 min', 11);
insert into BUSLINE (idbusline, frequency, maxprice)
values (176, '56 min', 12);
insert into BUSLINE (idbusline, frequency, maxprice)
values (177, '57 min', 5);
insert into BUSLINE (idbusline, frequency, maxprice)
values (178, '58 min', 6);
insert into BUSLINE (idbusline, frequency, maxprice)
values (179, '59 min', 7);
insert into BUSLINE (idbusline, frequency, maxprice)
values (180, '60 min', 8);
insert into BUSLINE (idbusline, frequency, maxprice)
values (181, '1 min', 9);
insert into BUSLINE (idbusline, frequency, maxprice)
values (182, '2 min', 10);
insert into BUSLINE (idbusline, frequency, maxprice)
values (183, '3 min', 11);
insert into BUSLINE (idbusline, frequency, maxprice)
values (184, '4 min', 12);
insert into BUSLINE (idbusline, frequency, maxprice)
values (185, '5 min', 5);
insert into BUSLINE (idbusline, frequency, maxprice)
values (186, '6 min', 6);
insert into BUSLINE (idbusline, frequency, maxprice)
values (187, '7 min', 7);
insert into BUSLINE (idbusline, frequency, maxprice)
values (188, '8 min', 8);
insert into BUSLINE (idbusline, frequency, maxprice)
values (189, '9 min', 9);
insert into BUSLINE (idbusline, frequency, maxprice)
values (190, '10 min', 10);
commit;
prompt 190 records loaded
prompt Loading BUSRIDE...
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('14-07-2024 09:35:00', 'dd-mm-yyyy hh24:mi:ss'), 1, '12-345-67');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('25-08-2024 15:20:00', 'dd-mm-yyyy hh24:mi:ss'), 2, '23-456-78');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('03-05-2024 11:45:00', 'dd-mm-yyyy hh24:mi:ss'), 3, '34-567-89');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('06-11-2024 14:10:00', 'dd-mm-yyyy hh24:mi:ss'), 4, '45-678-90');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('19-01-2024 10:55:00', 'dd-mm-yyyy hh24:mi:ss'), 5, '56-789-01');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('30-09-2024 08:25:00', 'dd-mm-yyyy hh24:mi:ss'), 6, '67-890-12');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('21-12-2024 13:30:00', 'dd-mm-yyyy hh24:mi:ss'), 7, '78-901-23');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('09-06-2024 12:15:00', 'dd-mm-yyyy hh24:mi:ss'), 8, '89-012-34');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('17-03-2024 09:40:00', 'dd-mm-yyyy hh24:mi:ss'), 9, '90-123-45');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('28-08-2024 16:05:00', 'dd-mm-yyyy hh24:mi:ss'), 10, '01-234-56');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('08-04-2024 10:50:00', 'dd-mm-yyyy hh24:mi:ss'), 11, '12-345-68');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('11-10-2024 14:25:00', 'dd-mm-yyyy hh24:mi:ss'), 12, '23-456-79');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('02-01-2024 11:00:00', 'dd-mm-yyyy hh24:mi:ss'), 13, '34-567-80');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('13-05-2024 15:15:00', 'dd-mm-yyyy hh24:mi:ss'), 14, '45-678-91');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('24-07-2024 08:40:00', 'dd-mm-yyyy hh24:mi:ss'), 15, '56-789-02');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('05-02-2024 12:55:00', 'dd-mm-yyyy hh24:mi:ss'), 16, '67-890-13');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('18-06-2024 14:20:00', 'dd-mm-yyyy hh24:mi:ss'), 17, '78-901-24');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('29-10-2024 09:45:00', 'dd-mm-yyyy hh24:mi:ss'), 18, '89-012-35');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('09-09-2024 11:10:00', 'dd-mm-yyyy hh24:mi:ss'), 19, '90-123-46');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('20-03-2024 13:35:00', 'dd-mm-yyyy hh24:mi:ss'), 20, '01-234-57');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('01-11-2024 10:00:00', 'dd-mm-yyyy hh24:mi:ss'), 21, '12-345-69');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('12-05-2024 14:25:00', 'dd-mm-yyyy hh24:mi:ss'), 22, '23-456-70');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('23-07-2024 09:50:00', 'dd-mm-yyyy hh24:mi:ss'), 23, '34-567-81');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('04-12-2024 16:15:00', 'dd-mm-yyyy hh24:mi:ss'), 24, '45-678-92');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('15-08-2024 08:30:00', 'dd-mm-yyyy hh24:mi:ss'), 25, '56-789-03');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('26-04-2024 12:45:00', 'dd-mm-yyyy hh24:mi:ss'), 26, '67-890-14');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('07-10-2024 15:00:00', 'dd-mm-yyyy hh24:mi:ss'), 27, '78-901-25');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('18-02-2024 11:25:00', 'dd-mm-yyyy hh24:mi:ss'), 28, '89-012-36');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('30-06-2024 09:50:00', 'dd-mm-yyyy hh24:mi:ss'), 29, '90-123-47');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('11-01-2024 14:05:00', 'dd-mm-yyyy hh24:mi:ss'), 30, '01-234-58');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('22-09-2024 10:30:00', 'dd-mm-yyyy hh24:mi:ss'), 31, '12-345-70');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('03-05-2024 08:55:00', 'dd-mm-yyyy hh24:mi:ss'), 32, '23-456-81');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('14-11-2024 12:20:00', 'dd-mm-yyyy hh24:mi:ss'), 33, '34-567-92');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('25-07-2024 16:35:00', 'dd-mm-yyyy hh24:mi:ss'), 34, '45-678-03');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('06-04-2024 13:00:00', 'dd-mm-yyyy hh24:mi:ss'), 35, '56-789-14');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('17-12-2024 09:25:00', 'dd-mm-yyyy hh24:mi:ss'), 36, '67-890-25');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('27-02-2024 14:50:00', 'dd-mm-yyyy hh24:mi:ss'), 37, '78-901-36');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('09-10-2024 08:15:00', 'dd-mm-yyyy hh24:mi:ss'), 38, '89-012-47');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('20-06-2024 12:40:00', 'dd-mm-yyyy hh24:mi:ss'), 39, '90-123-58');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('01-02-2024 17:05:00', 'dd-mm-yyyy hh24:mi:ss'), 40, '01-234-69');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('12-08-2024 11:30:00', 'dd-mm-yyyy hh24:mi:ss'), 41, '12-345-71');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('24-03-2024 09:55:00', 'dd-mm-yyyy hh24:mi:ss'), 42, '23-456-82');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('04-11-2024 14:20:00', 'dd-mm-yyyy hh24:mi:ss'), 43, '34-567-93');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('15-07-2024 08:45:00', 'dd-mm-yyyy hh24:mi:ss'), 44, '45-678-04');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('25-01-2024 13:10:00', 'dd-mm-yyyy hh24:mi:ss'), 45, '56-789-15');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('07-09-2024 11:35:00', 'dd-mm-yyyy hh24:mi:ss'), 46, '67-890-26');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('18-05-2024 15:00:00', 'dd-mm-yyyy hh24:mi:ss'), 47, '78-901-37');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('29-11-2024 09:25:00', 'dd-mm-yyyy hh24:mi:ss'), 48, '89-012-48');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('09-07-2024 13:50:00', 'dd-mm-yyyy hh24:mi:ss'), 49, '90-123-59');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('20-03-2024 18:15:00', 'dd-mm-yyyy hh24:mi:ss'), 50, '01-234-60');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('01-11-2024 12:40:00', 'dd-mm-yyyy hh24:mi:ss'), 51, '12-345-72');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('12-07-2024 16:05:00', 'dd-mm-yyyy hh24:mi:ss'), 52, '23-456-83');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('23-01-2024 10:30:00', 'dd-mm-yyyy hh24:mi:ss'), 53, '34-567-94');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('05-09-2024 14:55:00', 'dd-mm-yyyy hh24:mi:ss'), 54, '45-678-05');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('16-05-2024 09:20:00', 'dd-mm-yyyy hh24:mi:ss'), 55, '56-789-16');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('27-11-2024 13:45:00', 'dd-mm-yyyy hh24:mi:ss'), 56, '67-890-27');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('07-08-2024 08:10:00', 'dd-mm-yyyy hh24:mi:ss'), 57, '78-901-38');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('18-04-2024 12:35:00', 'dd-mm-yyyy hh24:mi:ss'), 58, '89-012-49');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('29-12-2024 10:00:00', 'dd-mm-yyyy hh24:mi:ss'), 59, '90-123-60');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('09-10-2024 14:25:00', 'dd-mm-yyyy hh24:mi:ss'), 60, '01-234-71');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('20-06-2024 08:50:00', 'dd-mm-yyyy hh24:mi:ss'), 61, '12-345-73');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('01-02-2024 13:15:00', 'dd-mm-yyyy hh24:mi:ss'), 62, '23-456-84');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('12-08-2024 11:40:00', 'dd-mm-yyyy hh24:mi:ss'), 63, '34-567-95');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('24-04-2024 16:05:00', 'dd-mm-yyyy hh24:mi:ss'), 64, '45-678-06');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('05-12-2024 10:30:00', 'dd-mm-yyyy hh24:mi:ss'), 65, '56-789-17');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('16-08-2024 14:55:00', 'dd-mm-yyyy hh24:mi:ss'), 66, '67-890-28');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('27-04-2024 09:20:00', 'dd-mm-yyyy hh24:mi:ss'), 67, '78-901-39');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('07-12-2024 13:45:00', 'dd-mm-yyyy hh24:mi:ss'), 68, '89-012-50');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('18-08-2024 08:10:00', 'dd-mm-yyyy hh24:mi:ss'), 69, '90-123-61');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('29-05-2024 12:35:00', 'dd-mm-yyyy hh24:mi:ss'), 70, '01-234-72');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('09-01-2024 10:00:00', 'dd-mm-yyyy hh24:mi:ss'), 71, '12-345-74');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('20-09-2024 14:25:00', 'dd-mm-yyyy hh24:mi:ss'), 72, '23-456-85');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('01-05-2024 08:50:00', 'dd-mm-yyyy hh24:mi:ss'), 73, '34-567-96');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('12-11-2024 13:15:00', 'dd-mm-yyyy hh24:mi:ss'), 74, '45-678-07');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('24-07-2024 17:40:00', 'dd-mm-yyyy hh24:mi:ss'), 75, '56-789-18');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('05-03-2024 12:05:00', 'dd-mm-yyyy hh24:mi:ss'), 76, '67-890-29');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('16-11-2024 16:30:00', 'dd-mm-yyyy hh24:mi:ss'), 77, '78-901-40');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('27-07-2024 10:55:00', 'dd-mm-yyyy hh24:mi:ss'), 78, '89-012-51');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('07-01-2024 15:20:00', 'dd-mm-yyyy hh24:mi:ss'), 79, '90-123-62');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('18-09-2024 09:45:00', 'dd-mm-yyyy hh24:mi:ss'), 80, '01-234-73');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('29-05-2024 14:10:00', 'dd-mm-yyyy hh24:mi:ss'), 81, '12-345-75');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('09-01-2024 08:35:00', 'dd-mm-yyyy hh24:mi:ss'), 82, '23-456-86');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('20-09-2024 12:00:00', 'dd-mm-yyyy hh24:mi:ss'), 83, '34-567-97');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('01-05-2024 16:25:00', 'dd-mm-yyyy hh24:mi:ss'), 84, '45-678-08');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('12-11-2024 10:50:00', 'dd-mm-yyyy hh24:mi:ss'), 85, '56-789-19');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('24-07-2024 15:15:00', 'dd-mm-yyyy hh24:mi:ss'), 86, '67-890-30');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('05-03-2024 09:40:00', 'dd-mm-yyyy hh24:mi:ss'), 87, '78-901-41');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('16-11-2024 14:05:00', 'dd-mm-yyyy hh24:mi:ss'), 88, '89-012-52');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('27-07-2024 18:30:00', 'dd-mm-yyyy hh24:mi:ss'), 89, '90-123-63');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('07-02-2024 12:55:00', 'dd-mm-yyyy hh24:mi:ss'), 90, '01-234-74');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('18-08-2024 17:20:00', 'dd-mm-yyyy hh24:mi:ss'), 91, '12-345-76');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('29-04-2024 11:45:00', 'dd-mm-yyyy hh24:mi:ss'), 92, '23-456-87');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('09-12-2024 16:10:00', 'dd-mm-yyyy hh24:mi:ss'), 93, '34-567-98');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('20-08-2024 10:35:00', 'dd-mm-yyyy hh24:mi:ss'), 94, '45-678-09');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('01-04-2024 14:00:00', 'dd-mm-yyyy hh24:mi:ss'), 95, '56-789-20');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('12-10-2024 08:25:00', 'dd-mm-yyyy hh24:mi:ss'), 96, '67-890-31');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('23-06-2024 12:50:00', 'dd-mm-yyyy hh24:mi:ss'), 97, '78-901-42');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('04-02-2024 17:15:00', 'dd-mm-yyyy hh24:mi:ss'), 98, '89-012-53');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('15-10-2024 11:40:00', 'dd-mm-yyyy hh24:mi:ss'), 99, '90-123-64');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('26-08-2024 16:05:00', 'dd-mm-yyyy hh24:mi:ss'), 100, '01-234-75');
commit;
prompt 100 records committed...
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('06-04-2024 10:30:00', 'dd-mm-yyyy hh24:mi:ss'), 101, '12-345-77');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('17-12-2024 14:55:00', 'dd-mm-yyyy hh24:mi:ss'), 102, '23-456-88');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('27-07-2024 09:20:00', 'dd-mm-yyyy hh24:mi:ss'), 103, '34-567-99');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('07-03-2024 13:45:00', 'dd-mm-yyyy hh24:mi:ss'), 104, '45-678-10');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('18-11-2024 08:10:00', 'dd-mm-yyyy hh24:mi:ss'), 105, '56-789-21');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('29-07-2024 12:35:00', 'dd-mm-yyyy hh24:mi:ss'), 106, '67-890-32');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('09-02-2024 16:00:00', 'dd-mm-yyyy hh24:mi:ss'), 107, '78-901-43');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('14-07-2024 09:35:00', 'dd-mm-yyyy hh24:mi:ss'), 108, '89-012-54');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('25-08-2024 15:20:00', 'dd-mm-yyyy hh24:mi:ss'), 109, '90-123-65');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('03-05-2024 11:45:00', 'dd-mm-yyyy hh24:mi:ss'), 110, '01-234-76');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('06-11-2024 14:10:00', 'dd-mm-yyyy hh24:mi:ss'), 111, '12-345-78');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('19-01-2024 10:55:00', 'dd-mm-yyyy hh24:mi:ss'), 112, '23-456-89');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('30-09-2024 08:25:00', 'dd-mm-yyyy hh24:mi:ss'), 113, '34-567-00');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('21-12-2024 13:30:00', 'dd-mm-yyyy hh24:mi:ss'), 114, '45-678-11');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('09-06-2024 12:15:00', 'dd-mm-yyyy hh24:mi:ss'), 115, '56-789-22');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('17-03-2024 09:40:00', 'dd-mm-yyyy hh24:mi:ss'), 116, '67-890-33');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('28-08-2024 16:05:00', 'dd-mm-yyyy hh24:mi:ss'), 117, '78-901-44');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('08-04-2024 10:50:00', 'dd-mm-yyyy hh24:mi:ss'), 118, '89-012-55');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('11-10-2024 14:25:00', 'dd-mm-yyyy hh24:mi:ss'), 119, '90-123-66');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('02-01-2024 11:00:00', 'dd-mm-yyyy hh24:mi:ss'), 120, '01-234-77');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('13-05-2024 15:15:00', 'dd-mm-yyyy hh24:mi:ss'), 121, '12-345-79');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('24-07-2024 08:40:00', 'dd-mm-yyyy hh24:mi:ss'), 122, '23-456-90');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('05-02-2024 12:55:00', 'dd-mm-yyyy hh24:mi:ss'), 123, '34-567-01');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('18-06-2024 14:20:00', 'dd-mm-yyyy hh24:mi:ss'), 124, '45-678-12');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('29-10-2024 09:45:00', 'dd-mm-yyyy hh24:mi:ss'), 125, '56-789-23');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('09-09-2024 11:10:00', 'dd-mm-yyyy hh24:mi:ss'), 126, '67-890-34');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('20-03-2024 13:35:00', 'dd-mm-yyyy hh24:mi:ss'), 127, '78-901-45');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('01-11-2024 10:00:00', 'dd-mm-yyyy hh24:mi:ss'), 128, '89-012-56');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('12-05-2024 14:25:00', 'dd-mm-yyyy hh24:mi:ss'), 129, '90-123-67');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('23-07-2024 09:50:00', 'dd-mm-yyyy hh24:mi:ss'), 130, '01-234-78');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('04-12-2024 16:15:00', 'dd-mm-yyyy hh24:mi:ss'), 131, '12-345-80');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('15-08-2024 08:30:00', 'dd-mm-yyyy hh24:mi:ss'), 132, '23-456-91');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('26-04-2024 12:45:00', 'dd-mm-yyyy hh24:mi:ss'), 133, '34-567-02');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('07-10-2024 15:00:00', 'dd-mm-yyyy hh24:mi:ss'), 134, '45-678-13');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('18-02-2024 11:25:00', 'dd-mm-yyyy hh24:mi:ss'), 135, '56-789-24');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('30-06-2024 09:50:00', 'dd-mm-yyyy hh24:mi:ss'), 136, '67-890-35');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('11-01-2024 14:05:00', 'dd-mm-yyyy hh24:mi:ss'), 137, '78-901-46');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('22-09-2024 10:30:00', 'dd-mm-yyyy hh24:mi:ss'), 138, '89-012-57');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('03-05-2024 08:55:00', 'dd-mm-yyyy hh24:mi:ss'), 139, '90-123-68');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('14-11-2024 12:20:00', 'dd-mm-yyyy hh24:mi:ss'), 140, '01-234-79');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('25-07-2024 16:35:00', 'dd-mm-yyyy hh24:mi:ss'), 141, '12-345-81');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('06-04-2024 13:00:00', 'dd-mm-yyyy hh24:mi:ss'), 142, '23-456-92');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('17-12-2024 09:25:00', 'dd-mm-yyyy hh24:mi:ss'), 143, '34-567-03');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('27-02-2024 14:50:00', 'dd-mm-yyyy hh24:mi:ss'), 144, '45-678-14');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('09-10-2024 08:15:00', 'dd-mm-yyyy hh24:mi:ss'), 145, '56-789-25');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('20-06-2024 12:40:00', 'dd-mm-yyyy hh24:mi:ss'), 146, '67-890-36');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('01-02-2024 17:05:00', 'dd-mm-yyyy hh24:mi:ss'), 147, '78-901-47');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('12-08-2024 11:30:00', 'dd-mm-yyyy hh24:mi:ss'), 148, '89-012-58');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('24-03-2024 09:55:00', 'dd-mm-yyyy hh24:mi:ss'), 149, '90-123-69');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('04-11-2024 14:20:00', 'dd-mm-yyyy hh24:mi:ss'), 150, '01-234-80');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('15-07-2024 08:45:00', 'dd-mm-yyyy hh24:mi:ss'), 151, '12-345-82');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('25-01-2024 13:10:00', 'dd-mm-yyyy hh24:mi:ss'), 152, '23-456-93');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('07-09-2024 11:35:00', 'dd-mm-yyyy hh24:mi:ss'), 153, '34-567-04');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('18-05-2024 15:00:00', 'dd-mm-yyyy hh24:mi:ss'), 154, '45-678-15');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('29-11-2024 09:25:00', 'dd-mm-yyyy hh24:mi:ss'), 155, '56-789-26');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('09-07-2024 13:50:00', 'dd-mm-yyyy hh24:mi:ss'), 156, '67-890-37');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('20-03-2024 18:15:00', 'dd-mm-yyyy hh24:mi:ss'), 157, '78-901-48');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('01-11-2024 12:40:00', 'dd-mm-yyyy hh24:mi:ss'), 158, '89-012-59');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('12-07-2024 16:05:00', 'dd-mm-yyyy hh24:mi:ss'), 159, '90-123-70');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('23-01-2024 10:30:00', 'dd-mm-yyyy hh24:mi:ss'), 160, '01-234-81');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('05-09-2024 14:55:00', 'dd-mm-yyyy hh24:mi:ss'), 161, '12-345-83');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('16-05-2024 09:20:00', 'dd-mm-yyyy hh24:mi:ss'), 162, '23-456-94');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('27-11-2024 13:45:00', 'dd-mm-yyyy hh24:mi:ss'), 163, '34-567-05');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('07-08-2024 08:10:00', 'dd-mm-yyyy hh24:mi:ss'), 164, '45-678-16');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('18-04-2024 12:35:00', 'dd-mm-yyyy hh24:mi:ss'), 165, '56-789-27');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('29-12-2024 10:00:00', 'dd-mm-yyyy hh24:mi:ss'), 166, '67-890-38');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('09-10-2024 14:25:00', 'dd-mm-yyyy hh24:mi:ss'), 167, '78-901-49');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('20-06-2024 08:50:00', 'dd-mm-yyyy hh24:mi:ss'), 168, '89-012-60');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('01-02-2024 13:15:00', 'dd-mm-yyyy hh24:mi:ss'), 169, '90-123-71');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('12-08-2024 11:40:00', 'dd-mm-yyyy hh24:mi:ss'), 170, '01-234-82');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('24-04-2024 16:05:00', 'dd-mm-yyyy hh24:mi:ss'), 171, '12-345-84');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('05-12-2024 10:30:00', 'dd-mm-yyyy hh24:mi:ss'), 172, '23-456-95');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('16-08-2024 14:55:00', 'dd-mm-yyyy hh24:mi:ss'), 173, '34-567-06');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('27-04-2024 09:20:00', 'dd-mm-yyyy hh24:mi:ss'), 174, '45-678-17');
insert into BUSRIDE (starttime, idbusline, licensenumber)
values (to_date('07-12-2024 13:45:00', 'dd-mm-yyyy hh24:mi:ss'), 175, '56-789-28');
commit;
prompt 175 records loaded
prompt Loading PASSENGER...
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Abby', 100, '050-1234567', 1000);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Adam', 101, '050-2345678', 1001);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Alan', 102, '050-3456789', 1002);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Alex', 103, '050-4567890', 1003);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Ally', 104, '050-5678901', 1004);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Amir', 105, '050-6789012', 1005);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Andy', 106, '050-7890123', 1006);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Anne', 107, '050-8901234', 1007);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Aria', 108, '050-9012345', 1008);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Aron', 109, '050-0123456', 1009);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Axel', 110, '052-1234567', 1010);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Barb', 111, '052-2345678', 1011);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Bart', 112, '052-3456789', 1012);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Beau', 113, '052-4567890', 1013);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Beth', 114, '052-5678901', 1014);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Bill', 115, '052-6789012', 1015);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Brad', 116, '052-7890123', 1016);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Burt', 117, '052-8901234', 1017);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Carl', 118, '052-9012345', 1018);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Chad', 119, '052-0123456', 1019);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Clay', 120, '053-1234567', 1020);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Cody', 121, '053-2345678', 1021);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Cory', 122, '053-3456789', 1022);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Cruz', 123, '053-4567890', 1023);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Dale', 124, '053-5678901', 1024);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Dana', 125, '053-6789012', 1025);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Dani', 126, '053-7890123', 1026);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Dave', 127, '053-8901234', 1027);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Dean', 128, '053-9012345', 1028);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Drew', 129, '053-0123456', 1029);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Duan', 130, '054-1234567', 1030);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Duke', 131, '054-2345678', 1031);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Earl', 132, '054-3456789', 1032);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Edie', 133, '054-4567890', 1033);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Ella', 134, '054-5678901', 1034);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Elle', 135, '054-6789012', 1035);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Eric', 136, '054-7890123', 1036);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Evan', 137, '054-8901234', 1037);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Finn', 138, '054-9012345', 1038);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Fran', 139, '054-0123456', 1039);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Gail', 140, '055-1234567', 1040);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Gary', 141, '055-2345678', 1041);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Gina', 142, '055-3456789', 1042);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Glen', 143, '055-4567890', 1043);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Greg', 144, '055-5678901', 1044);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Hank', 145, '055-6789012', 1045);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Hans', 146, '055-7890123', 1046);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Herb', 147, '055-8901234', 1047);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Hugh', 148, '055-9012345', 1048);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Ian', 149, '055-0123456', 1049);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Jack', 150, '056-1234567', 1050);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Jade', 151, '056-2345678', 1051);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Jake', 152, '056-3456789', 1052);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Jane', 153, '056-4567890', 1053);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Jase', 154, '056-5678901', 1054);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Javi', 155, '056-6789012', 1055);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Jean', 156, '056-7890123', 1056);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Jeff', 157, '056-8901234', 1057);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Jenn', 158, '056-9012345', 1058);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Jess', 159, '056-0123456', 1059);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Jill', 160, '057-1234567', 1060);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Jodi', 161, '057-2345678', 1061);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Joel', 162, '057-3456789', 1062);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Joey', 163, '057-4567890', 1063);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('John', 164, '057-5678901', 1064);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Josh', 165, '057-6789012', 1065);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Juan', 166, '057-7890123', 1066);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Jude', 167, '057-8901234', 1067);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Kara', 168, '057-9012345', 1068);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Kate', 169, '057-0123456', 1069);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Katy', 170, '058-1234567', 1070);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Kaye', 171, '058-2345678', 1071);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Kyle', 172, '058-3456789', 1072);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Lana', 173, '058-4567890', 1073);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Leah', 174, '058-5678901', 1074);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Liam', 175, '058-6789012', 1075);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Lila', 176, '058-7890123', 1076);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Lily', 177, '058-8901234', 1077);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Lisa', 178, '058-9012345', 1078);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Lois', 179, '058-0123456', 1079);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Lori', 180, '059-1234567', 1080);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Luca', 181, '059-2345678', 1081);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Lucy', 182, '059-3456789', 1082);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Luis', 183, '059-4567890', 1083);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Luke', 184, '059-5678901', 1084);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Mace', 185, '059-6789012', 1085);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Mara', 186, '059-7890123', 1086);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Mark', 187, '059-8901234', 1087);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Mary', 188, '059-9012345', 1088);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Matt', 189, '059-0123456', 1089);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Max', 190, '072-1234567', 1090);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Maya', 191, '072-2345678', 1091);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Meg', 192, '072-3456789', 1092);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Mike', 193, '072-4567890', 1093);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Nate', 194, '072-5678901', 1094);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Neal', 195, '072-6789012', 1095);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Nick', 196, '072-7890123', 1096);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Noah', 197, '072-8901234', 1097);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Noel', 198, '072-9012345', 1098);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Owen', 199, '072-0123456', 1099);
commit;
prompt 100 records committed...
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Paul', 200, '073-1234567', 1100);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Pete', 201, '073-2345678', 1101);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Phil', 202, '073-3456789', 1102);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Quinn', 203, '073-4567890', 1103);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Raul', 204, '073-5678901', 1104);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Reed', 205, '073-6789012', 1105);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Rhys', 206, '073-7890123', 1106);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Rick', 207, '073-8901234', 1107);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Rob', 208, '073-9012345', 1108);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Rolf', 209, '073-0123456', 1109);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Rosa', 210, '074-1234567', 1110);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Ross', 211, '074-2345678', 1111);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Ryan', 212, '074-3456789', 1112);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Sage', 213, '074-4567890', 1113);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Sam', 214, '074-5678901', 1114);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Sean', 215, '074-6789012', 1115);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Seth', 216, '074-7890123', 1116);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Shaw', 217, '074-8901234', 1117);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Stan', 218, '074-9012345', 1118);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Tate', 219, '074-0123456', 1119);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Teri', 220, '076-1234567', 1120);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Tess', 221, '076-2345678', 1121);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Toby', 222, '076-3456789', 1122);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Todd', 223, '076-4567890', 1123);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Tom', 224, '076-5678901', 1124);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Tony', 225, '076-6789012', 1125);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Trey', 226, '076-7890123', 1126);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Troy', 227, '076-8901234', 1127);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Ty', 228, '076-9012345', 1128);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Vera', 229, '076-0123456', 1129);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Vince', 230, '077-1234567', 1130);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Wade', 231, '077-2345678', 1131);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Walt', 232, '077-3456789', 1132);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Will', 233, '077-4567890', 1133);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Wynn', 234, '077-5678901', 1134);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Zane', 235, '077-6789012', 1135);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Zara', 236, '077-7890123', 1136);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Zoey', 237, '077-8901234', 1137);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Aida', 238, '077-9012345', 1138);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Amos', 239, '077-0123456', 1139);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Beau', 240, '078-1234567', 1140);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Bing', 241, '078-2345678', 1141);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Boyd', 242, '078-3456789', 1142);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Bryn', 243, '078-4567890', 1143);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Cade', 244, '078-5678901', 1144);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Cain', 245, '078-6789012', 1145);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Cate', 246, '078-7890123', 1146);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Chad', 247, '078-8901234', 1147);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Cher', 248, '078-9012345', 1148);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Chip', 249, '078-0123456', 1149);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Clem', 250, '079-1234567', 1150);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Cole', 251, '079-2345678', 1151);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Cory', 252, '079-3456789', 1152);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Cruz', 253, '079-4567890', 1153);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Cyan', 254, '079-5678901', 1154);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Dale', 255, '079-6789012', 1155);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Darl', 256, '079-7890123', 1156);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Davy', 257, '079-8901234', 1157);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Dean', 258, '079-9012345', 1158);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Drew', 259, '079-0123456', 1159);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Earl', 260, '080-1234567', 1160);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Eden', 261, '080-2345678', 1161);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Edie', 262, '080-3456789', 1162);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Elio', 263, '080-4567890', 1163);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Elly', 264, '080-5678901', 1164);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Eryn', 265, '080-6789012', 1165);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Evan', 266, '080-7890123', 1166);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Ezra', 267, '080-8901234', 1167);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Faye', 268, '080-9012345', 1168);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Finn', 269, '080-0123456', 1169);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Ford', 270, '081-1234567', 1170);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Fred', 271, '081-2345678', 1171);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Gale', 272, '081-3456789', 1172);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Gary', 273, '081-4567890', 1173);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Gena', 274, '081-5678901', 1174);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Glen', 275, '081-6789012', 1175);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Hank', 276, '081-7890123', 1176);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Hans', 277, '081-8901234', 1177);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Hank', 278, '081-9012345', 1178);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Hugh', 279, '081-0123456', 1179);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Imre', 280, '082-1234567', 1180);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Jace', 281, '082-2345678', 1181);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Jada', 282, '082-3456789', 1182);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Jade', 283, '082-4567890', 1183);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Jake', 284, '082-5678901', 1184);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Jame', 285, '082-6789012', 1185);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Javi', 286, '082-7890123', 1186);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Jean', 287, '082-8901234', 1187);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Jess', 288, '082-9012345', 1188);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Joel', 289, '082-0123456', 1189);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Joey', 290, '083-1234567', 1190);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('John', 291, '083-2345678', 1191);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('June', 292, '083-3456789', 1192);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Kara', 293, '083-4567890', 1193);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Karl', 294, '083-5678901', 1194);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Kate', 295, '083-6789012', 1195);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Katy', 296, '083-7890123', 1196);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Kyle', 297, '083-8901234', 1197);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Lane', 298, '083-9012345', 1198);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Lara', 299, '083-0123456', 1199);
commit;
prompt 200 records committed...
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Lars', 300, '084-1234567', 1200);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Leah', 301, '084-2345678', 1201);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Leon', 302, '084-3456789', 1202);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Liam', 303, '084-4567890', 1203);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Lisa', 304, '084-5678901', 1204);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Liza', 305, '084-6789012', 1205);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Lou', 306, '084-7890123', 1206);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Luca', 307, '084-8901234', 1207);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Lyle', 308, '084-9012345', 1208);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Mack', 309, '084-0123456', 1209);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Mae', 310, '085-1234567', 1210);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Mark', 311, '085-2345678', 1211);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Mary', 312, '085-3456789', 1212);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Matt', 313, '085-4567890', 1213);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Max', 314, '085-5678901', 1214);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Mike', 315, '085-6789012', 1215);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Nala', 316, '085-7890123', 1216);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Nate', 317, '085-8901234', 1217);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Neal', 318, '085-9012345', 1218);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Neil', 319, '085-0123456', 1219);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Nick', 320, '086-1234567', 1220);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Nils', 321, '086-2345678', 1221);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Noah', 322, '086-3456789', 1222);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Noel', 323, '086-4567890', 1223);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Owen', 324, '086-5678901', 1224);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Paco', 325, '086-6789012', 1225);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Paul', 326, '086-7890123', 1226);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Pete', 327, '086-8901234', 1227);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Quinn', 328, '086-9012345', 1228);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Ralf', 329, '086-0123456', 1229);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Reid', 330, '087-1234567', 1230);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Rene', 331, '087-2345678', 1231);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Rhys', 332, '087-3456789', 1232);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Rick', 333, '087-4567890', 1233);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Rolf', 334, '087-5678901', 1234);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Ross', 335, '087-6789012', 1235);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Ryan', 336, '087-7890123', 1236);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Sage', 337, '087-8901234', 1237);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Saul', 338, '087-9012345', 1238);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Sean', 339, '087-0123456', 1239);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Seth', 340, '088-1234567', 1240);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Shea', 341, '088-2345678', 1241);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Stan', 342, '088-3456789', 1242);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Tate', 343, '088-4567890', 1243);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Todd', 344, '088-5678901', 1244);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Tom', 345, '088-6789012', 1245);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Toni', 346, '088-7890123', 1246);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Tory', 347, '088-8901234', 1247);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Trey', 348, '088-9012345', 1248);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Troy', 349, '088-0123456', 1249);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Tyra', 350, '089-1234567', 1250);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Vick', 351, '089-2345678', 1251);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Walt', 352, '089-3456789', 1252);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Will', 353, '089-4567890', 1253);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Yves', 354, '089-5678901', 1254);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Zane', 355, '089-6789012', 1255);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Zeke', 356, '089-7890123', 1256);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Zola', 357, '089-8901234', 1257);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Axel', 358, '089-9012345', 1258);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Brad', 359, '089-0123456', 1259);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Brie', 360, '090-1234567', 1260);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Cary', 361, '090-2345678', 1261);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Chad', 362, '090-3456789', 1262);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Clay', 363, '090-4567890', 1263);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Dale', 364, '090-5678901', 1264);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Dean', 365, '090-6789012', 1265);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Edie', 366, '090-7890123', 1266);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Ella', 367, '090-8901234', 1267);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Erik', 368, '090-9012345', 1268);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Faye', 369, '090-0123456', 1269);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Finn', 370, '091-1234567', 1270);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Fred', 371, '091-2345678', 1271);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Greg', 372, '091-3456789', 1272);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Hank', 373, '091-4567890', 1273);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Hugh', 374, '091-5678901', 1274);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Ivan', 375, '091-6789012', 1275);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Jack', 376, '091-7890123', 1276);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Jake', 377, '091-8901234', 1277);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Jeff', 378, '091-9012345', 1278);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Joel', 379, '091-0123456', 1279);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('John', 380, '092-1234567', 1280);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Juan', 381, '092-2345678', 1281);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Kent', 382, '092-3456789', 1282);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Lara', 383, '092-4567890', 1283);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Liam', 384, '092-5678901', 1284);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Lois', 385, '092-6789012', 1285);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Luca', 386, '092-7890123', 1286);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Mack', 387, '092-8901234', 1287);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Mark', 388, '092-9012345', 1288);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Neil', 389, '092-0123456', 1289);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Nick', 390, '093-1234567', 1290);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Owen', 391, '093-2345678', 1291);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Paul', 392, '093-3456789', 1292);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Raul', 393, '093-4567890', 1293);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Rhys', 394, '093-5678901', 1294);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Rick', 395, '093-6789012', 1295);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Ross', 396, '093-7890123', 1296);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Ryan', 397, '093-8901234', 1297);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Saul', 398, '093-9012345', 1298);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Seth', 399, '093-0123456', 1299);
commit;
prompt 300 records committed...
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Stan', 400, '094-1234567', 1300);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Todd', 401, '094-2345678', 1301);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Troy', 402, '094-3456789', 1302);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Vera', 403, '094-4567890', 1303);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Walt', 404, '094-5678901', 1304);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Zane', 405, '094-6789012', 1305);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Abby', 406, '094-7890123', 1306);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Adam', 407, '094-8901234', 1307);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Alan', 408, '094-9012345', 1308);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Alex', 409, '094-0123456', 1309);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Amir', 410, '095-1234567', 1310);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Andy', 411, '095-2345678', 1311);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Anne', 412, '095-3456789', 1312);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Aron', 413, '095-4567890', 1313);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Axel', 414, '095-5678901', 1314);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Barb', 415, '095-6789012', 1315);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Bart', 416, '095-7890123', 1316);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Beau', 417, '095-8901234', 1317);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Bill', 418, '095-9012345', 1318);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Brad', 419, '095-0123456', 1319);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Carl', 420, '096-1234567', 1320);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Chad', 421, '096-2345678', 1321);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Cody', 422, '096-3456789', 1322);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Cory', 423, '096-4567890', 1323);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Cruz', 424, '096-5678901', 1324);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Dana', 425, '096-6789012', 1325);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Dani', 426, '096-7890123', 1326);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Dave', 427, '096-8901234', 1327);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Drew', 428, '096-9012345', 1328);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Duke', 429, '096-0123456', 1329);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Earl', 430, '097-1234567', 1330);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Evan', 431, '097-2345678', 1331);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Finn', 432, '097-3456789', 1332);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Gail', 433, '097-4567890', 1333);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Gary', 434, '097-5678901', 1334);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Glen', 435, '097-6789012', 1335);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Greg', 436, '097-7890123', 1336);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Hugh', 437, '097-8901234', 1337);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Jack', 438, '097-9012345', 1338);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Jade', 439, '097-0123456', 1339);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Jake', 440, '098-1234567', 1340);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Jane', 441, '098-2345678', 1341);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Joel', 442, '098-3456789', 1342);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Joey', 443, '098-4567890', 1343);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('John', 444, '098-5678901', 1344);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Josh', 445, '098-6789012', 1345);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Jude', 446, '098-7890123', 1346);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Kyle', 447, '098-8901234', 1347);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Lana', 448, '098-9012345', 1348);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Leah', 449, '098-0123456', 1349);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Liam', 450, '099-1234567', 1350);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Lily', 451, '099-2345678', 1351);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Luca', 452, '099-3456789', 1352);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Lucy', 453, '099-4567890', 1353);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Luis', 454, '099-5678901', 1354);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Luke', 455, '099-6789012', 1355);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Mark', 456, '099-7890123', 1356);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Mary', 457, '099-8901234', 1357);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Matt', 458, '099-9012345', 1358);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Maya', 459, '099-0123456', 1359);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Mike', 460, '070-1234567', 1360);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Nate', 461, '070-2345678', 1361);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Nick', 462, '070-3456789', 1362);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Noah', 463, '070-4567890', 1363);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Owen', 464, '070-5678901', 1364);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Paul', 465, '070-6789012', 1365);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Pete', 467, '070-7890123', 1366);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Quinn', 468, '070-8901234', 1367);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Reed', 469, '070-9012345', 1368);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Rick', 470, '070-0123456', 1369);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Rob', 471, '071-1234567', 1370);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Ryan', 472, '071-2345678', 1371);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Seth', 473, '071-3456789', 1372);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Stan', 474, '071-4567890', 1373);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Tate', 475, '071-5678901', 1374);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Toby', 476, '071-6789012', 1375);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Todd', 477, '071-7890123', 1376);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Tom', 478, '071-8901234', 1377);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Troy', 479, '071-9012345', 1378);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Wade', 480, '071-0123456', 1379);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Will', 481, '073-1234567', 1380);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Zane', 482, '073-2345678', 1381);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Zoey', 483, '073-3456789', 1382);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Amir', 484, '073-4567890', 1383);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Aida', 485, '073-5678901', 1384);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Bing', 486, '073-6789012', 1385);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Cate', 487, '073-7890123', 1386);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Clem', 488, '073-8901234', 1387);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Cory', 489, '073-9012345', 1388);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Cyan', 490, '073-0123456', 1389);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Davy', 491, '074-1234567', 1390);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Elio', 492, '074-2345678', 1391);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Faye', 493, '074-3456789', 1392);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Gena', 494, '074-4567890', 1393);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Hans', 495, '074-5678901', 1394);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Imre', 496, '074-6789012', 1395);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Jace', 497, '074-7890123', 1396);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Jame', 498, '074-8901234', 1397);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Lane', 499, '074-9012345', 1398);
insert into PASSENGER (name, idpassenger, phone, idticket)
values ('Lara', 500, '074-5874123', 1399);
commit;
prompt 400 records loaded
prompt Loading STATION...
insert into STATION (name, idstation, adrress)
values ('31 Mason', 26184, '31 MasonMilano');
insert into STATION (name, idstation, adrress)
values ('53rd Street', 20753, '53rd StreetWien');
insert into STATION (name, idstation, adrress)
values ('20 Duisburg', 92375, '20 DuisburgCott');
insert into STATION (name, idstation, adrress)
values ('388 Shandling R', 41665, '388 Shandling R');
insert into STATION (name, idstation, adrress)
values ('80 Cervine', 57156, '80 CervineKungk');
insert into STATION (name, idstation, adrress)
values ('91 Gin Drive', 79584, '91 Gin DriveLis');
insert into STATION (name, idstation, adrress)
values ('49 Paymer Road', 16980, '49 Paymer RoadB');
insert into STATION (name, idstation, adrress)
values ('34 Sutton Stree', 13932, '34 Sutton Stree');
insert into STATION (name, idstation, adrress)
values ('51 Whitehouse S', 82001, '51 Whitehouse S');
insert into STATION (name, idstation, adrress)
values ('41st Street', 46381, '41st StreetBurw');
insert into STATION (name, idstation, adrress)
values ('30 Pressly Stre', 69918, '30 Pressly Stre');
insert into STATION (name, idstation, adrress)
values ('95 Nicholas Str', 52871, '95 Nicholas Str');
insert into STATION (name, idstation, adrress)
values ('26 Thames Ditto', 44272, '26 Thames Ditto');
insert into STATION (name, idstation, adrress)
values ('60 Hope Street', 14770, '60 Hope StreetL');
insert into STATION (name, idstation, adrress)
values ('71 Arturo Road', 42162, '71 Arturo RoadS');
insert into STATION (name, idstation, adrress)
values ('48 Luedenscheid', 51092, '48 Luedenscheid');
insert into STATION (name, idstation, adrress)
values ('10 Head Road', 28057, '10 Head RoadBek');
insert into STATION (name, idstation, adrress)
values ('90 Judd Drive', 14323, '90 Judd DriveNe');
insert into STATION (name, idstation, adrress)
values ('6 Caldwell Blvd', 81348, '6 Caldwell Blvd');
insert into STATION (name, idstation, adrress)
values ('4 Pullman', 99847, '4 PullmanGummer');
insert into STATION (name, idstation, adrress)
values ('48 Chandler Blv', 77053, '48 Chandler Blv');
insert into STATION (name, idstation, adrress)
values ('586 Prowse Road', 80309, '586 Prowse Road');
insert into STATION (name, idstation, adrress)
values ('21st Street', 90529, '21st StreetStat');
insert into STATION (name, idstation, adrress)
values ('30 Karen Street', 35839, '30 Karen Street');
insert into STATION (name, idstation, adrress)
values ('515 Forest Park', 74730, '515 Forest Park');
insert into STATION (name, idstation, adrress)
values ('12nd Street', 12783, '12nd StreetBoul');
insert into STATION (name, idstation, adrress)
values ('15 Toulouse Str', 61500, '15 Toulouse Str');
insert into STATION (name, idstation, adrress)
values ('46 West Point D', 74783, '46 West Point D');
insert into STATION (name, idstation, adrress)
values ('797 Bacon Road', 82541, '797 Bacon RoadL');
insert into STATION (name, idstation, adrress)
values ('49 Osment Stree', 80877, '49 Osment Stree');
insert into STATION (name, idstation, adrress)
values ('91 Perez', 43129, '91 PerezCambrid');
insert into STATION (name, idstation, adrress)
values ('32 Goldblum Dri', 37264, '32 Goldblum Dri');
insert into STATION (name, idstation, adrress)
values ('401 Shepherd Ro', 87395, '401 Shepherd Ro');
insert into STATION (name, idstation, adrress)
values ('6 Ball Drive', 30959, '6 Ball DriveLon');
insert into STATION (name, idstation, adrress)
values ('42nd Street', 32025, '42nd StreetPret');
insert into STATION (name, idstation, adrress)
values ('69 Crudup Road', 99716, '69 Crudup RoadD');
insert into STATION (name, idstation, adrress)
values ('97 Evanswood Bl', 94390, '97 Evanswood Bl');
insert into STATION (name, idstation, adrress)
values ('30 McPherson Av', 79425, '30 McPherson Av');
insert into STATION (name, idstation, adrress)
values ('47 Sepulveda St', 74061, '47 Sepulveda St');
insert into STATION (name, idstation, adrress)
values ('84 Flatts Stree', 65620, '84 Flatts Stree');
insert into STATION (name, idstation, adrress)
values ('88 Cronin Stree', 98598, '88 Cronin Stree');
insert into STATION (name, idstation, adrress)
values ('15 Fairuza Blvd', 44492, '15 Fairuza Blvd');
insert into STATION (name, idstation, adrress)
values ('33 Regina Stree', 16008, '33 Regina Stree');
insert into STATION (name, idstation, adrress)
values ('16 Madeleine St', 36675, '16 Madeleine St');
insert into STATION (name, idstation, adrress)
values ('52 Brosnan Road', 94635, '52 Brosnan Road');
insert into STATION (name, idstation, adrress)
values ('25 LaPaglia Roa', 43116, '25 LaPaglia Roa');
insert into STATION (name, idstation, adrress)
values ('18 Middleburg H', 42030, '18 Middleburg H');
insert into STATION (name, idstation, adrress)
values ('54 Rita Ave', 57099, '54 Rita AveParm');
insert into STATION (name, idstation, adrress)
values ('87 Hurley Stree', 25051, '87 Hurley Stree');
insert into STATION (name, idstation, adrress)
values ('2 Niven Street', 19795, '2 Niven StreetS');
insert into STATION (name, idstation, adrress)
values ('41 Pesci Street', 75314, '41 Pesci Street');
insert into STATION (name, idstation, adrress)
values ('890 Quinones Ro', 42440, '890 Quinones Ro');
insert into STATION (name, idstation, adrress)
values ('26 Keitel Drive', 30666, '26 Keitel Drive');
insert into STATION (name, idstation, adrress)
values ('94 Lippetal Str', 53859, '94 Lippetal Str');
insert into STATION (name, idstation, adrress)
values ('32nd Street', 81680, '32nd StreetSlme');
insert into STATION (name, idstation, adrress)
values ('16 Oak Park Roa', 43755, '16 Oak Park Roa');
insert into STATION (name, idstation, adrress)
values ('66 Logue Road', 13774, '66 Logue RoadVa');
insert into STATION (name, idstation, adrress)
values ('804 Chappelle A', 43912, '804 Chappelle A');
insert into STATION (name, idstation, adrress)
values ('29 Mae Drive', 90222, '29 Mae DriveDou');
insert into STATION (name, idstation, adrress)
values ('70 Leguizamo Ro', 17851, '70 Leguizamo Ro');
insert into STATION (name, idstation, adrress)
values ('33 Playboys Ave', 84599, '33 Playboys Ave');
insert into STATION (name, idstation, adrress)
values ('891 Avril Road', 98247, '891 Avril RoadH');
insert into STATION (name, idstation, adrress)
values ('30 Page Road', 86167, '30 Page RoadHel');
insert into STATION (name, idstation, adrress)
values ('63rd Street', 93958, '63rd StreetWaco');
insert into STATION (name, idstation, adrress)
values ('32 Riverdale', 42844, '32 RiverdaleTai');
insert into STATION (name, idstation, adrress)
values ('11 Akita Blvd', 44596, '11 Akita BlvdOf');
insert into STATION (name, idstation, adrress)
values ('97 Monmouth Str', 61346, '97 Monmouth Str');
insert into STATION (name, idstation, adrress)
values ('88 Loreena Driv', 30516, '88 Loreena Driv');
insert into STATION (name, idstation, adrress)
values ('49 Byrd Street', 37213, '49 Byrd StreetC');
insert into STATION (name, idstation, adrress)
values ('38 Ronnie Road', 20156, '38 Ronnie RoadD');
insert into STATION (name, idstation, adrress)
values ('816 Lake Bluff ', 46092, '816 Lake Bluff ');
insert into STATION (name, idstation, adrress)
values ('158 Bruce Blvd', 48589, '158 Bruce BlvdH');
insert into STATION (name, idstation, adrress)
values ('61st Street', 63203, '61st StreetCape');
insert into STATION (name, idstation, adrress)
values ('16 Venora Stree', 52822, '16 Venora Stree');
insert into STATION (name, idstation, adrress)
values ('67 Marshall Str', 20218, '67 Marshall Str');
insert into STATION (name, idstation, adrress)
values ('41 LaBelle Stre', 70647, '41 LaBelle Stre');
insert into STATION (name, idstation, adrress)
values ('71st Street', 94463, '71st StreetStan');
insert into STATION (name, idstation, adrress)
values ('19 Dionne Drive', 62616, '19 Dionne Drive');
insert into STATION (name, idstation, adrress)
values ('15 Caguas Stree', 56469, '15 Caguas Stree');
insert into STATION (name, idstation, adrress)
values ('73 Maura Road', 52311, '73 Maura RoadAr');
insert into STATION (name, idstation, adrress)
values ('80 Tilburg Driv', 89335, '80 Tilburg Driv');
insert into STATION (name, idstation, adrress)
values ('26 Sihung-si Dr', 64917, '26 Sihung-si Dr');
insert into STATION (name, idstation, adrress)
values ('12 Paquin Blvd', 84437, '12 Paquin BlvdL');
insert into STATION (name, idstation, adrress)
values ('53 Scheider', 96732, '53 ScheiderHara');
insert into STATION (name, idstation, adrress)
values ('70 Elwes Road', 67294, '70 Elwes RoadHu');
insert into STATION (name, idstation, adrress)
values ('78 Faithfull Dr', 50161, '78 Faithfull Dr');
insert into STATION (name, idstation, adrress)
values ('39 Edie Road', 33880, '39 Edie RoadFam');
insert into STATION (name, idstation, adrress)
values ('85 Salma Street', 55980, '85 Salma Street');
insert into STATION (name, idstation, adrress)
values ('43 Heche Drive', 69063, '43 Heche DriveR');
insert into STATION (name, idstation, adrress)
values ('50 Blue bell', 65449, '50 Blue bellMon');
insert into STATION (name, idstation, adrress)
values ('41st Street', 86544, '41st StreetMonm');
insert into STATION (name, idstation, adrress)
values ('5 Waldorf Stree', 57632, '5 Waldorf Stree');
insert into STATION (name, idstation, adrress)
values ('610 Ron', 25104, '610 RonAnn Arbo');
insert into STATION (name, idstation, adrress)
values ('36 Sona Street', 20321, '36 Sona StreetT');
insert into STATION (name, idstation, adrress)
values ('63rd Street', 63182, '63rd StreetAlex');
insert into STATION (name, idstation, adrress)
values ('37 Gryner Stree', 94747, '37 Gryner Stree');
insert into STATION (name, idstation, adrress)
values ('91 Kier Drive', 95380, '91 Kier DriveSa');
insert into STATION (name, idstation, adrress)
values ('34 North Yorksh', 65103, '34 North Yorksh');
insert into STATION (name, idstation, adrress)
values ('873 Hutch Drive', 41733, '873 Hutch Drive');
insert into STATION (name, idstation, adrress)
values ('54 Cumming', 38811, '54 CummingCle E');
commit;
prompt 100 records committed...
insert into STATION (name, idstation, adrress)
values ('58 Udo Blvd', 30755, '58 Udo BlvdBurw');
insert into STATION (name, idstation, adrress)
values ('32 Gaines Road', 79670, '32 Gaines RoadB');
insert into STATION (name, idstation, adrress)
values ('55 Blossoms Str', 52711, '55 Blossoms Str');
insert into STATION (name, idstation, adrress)
values ('43 Lauren Blvd', 52283, '43 Lauren BlvdP');
insert into STATION (name, idstation, adrress)
values ('89 Weston Stree', 63457, '89 Weston Stree');
insert into STATION (name, idstation, adrress)
values ('85 Fiona Drive', 64103, '85 Fiona DriveH');
insert into STATION (name, idstation, adrress)
values ('825 Galecki Roa', 60409, '825 Galecki Roa');
insert into STATION (name, idstation, adrress)
values ('71 Boyle Drive', 95591, '71 Boyle DriveB');
insert into STATION (name, idstation, adrress)
values ('65 Budapest Blv', 11814, '65 Budapest Blv');
insert into STATION (name, idstation, adrress)
values ('545 Englewood R', 44580, '545 Englewood R');
insert into STATION (name, idstation, adrress)
values ('3 Gaines Street', 10413, '3 Gaines Street');
insert into STATION (name, idstation, adrress)
values ('89 Holiday Road', 14215, '89 Holiday Road');
insert into STATION (name, idstation, adrress)
values ('99 Snider Road', 57990, '99 Snider RoadO');
insert into STATION (name, idstation, adrress)
values ('43 Irati Ave', 85319, '43 Irati AveKai');
insert into STATION (name, idstation, adrress)
values ('46 Rachel Stree', 12969, '46 Rachel Stree');
insert into STATION (name, idstation, adrress)
values ('68 Ranger Stree', 21326, '68 Ranger Stree');
insert into STATION (name, idstation, adrress)
values ('6 Stewart Stree', 74930, '6 Stewart Stree');
insert into STATION (name, idstation, adrress)
values ('14 Portland Roa', 81120, '14 Portland Roa');
insert into STATION (name, idstation, adrress)
values ('58 Gordon', 61095, '58 GordonKoppl');
insert into STATION (name, idstation, adrress)
values ('892 Madonna Str', 95647, '892 Madonna Str');
insert into STATION (name, idstation, adrress)
values ('88 Neil Blvd', 75475, '88 Neil BlvdToo');
insert into STATION (name, idstation, adrress)
values ('3 Charles Stree', 11122, '3 Charles Stree');
insert into STATION (name, idstation, adrress)
values ('48 Raye Drive', 82368, '48 Raye DriveDu');
insert into STATION (name, idstation, adrress)
values ('68 Hines Drive', 38828, '68 Hines DriveG');
insert into STATION (name, idstation, adrress)
values ('57 Postlethwait', 54684, '57 Postlethwait');
insert into STATION (name, idstation, adrress)
values ('78 Sinise Drive', 26240, '78 Sinise Drive');
insert into STATION (name, idstation, adrress)
values ('47 Rapaport Roa', 99021, '47 Rapaport Roa');
insert into STATION (name, idstation, adrress)
values ('48 Vilafranca P', 31859, '48 Vilafranca P');
insert into STATION (name, idstation, adrress)
values ('65 Glen Cove St', 61742, '65 Glen Cove St');
insert into STATION (name, idstation, adrress)
values ('81 Colleen Stre', 27782, '81 Colleen Stre');
insert into STATION (name, idstation, adrress)
values ('78 Marlon Road', 12948, '78 Marlon RoadS');
insert into STATION (name, idstation, adrress)
values ('13rd Street', 26418, '13rd StreetKwun');
insert into STATION (name, idstation, adrress)
values ('97 Murray Stree', 20076, '97 Murray Stree');
insert into STATION (name, idstation, adrress)
values ('56 Macy Blvd', 89853, '56 Macy BlvdPor');
insert into STATION (name, idstation, adrress)
values ('12 Noah Ave', 55785, '12 Noah AveBelg');
insert into STATION (name, idstation, adrress)
values ('82 Polley Stree', 41105, '82 Polley Stree');
insert into STATION (name, idstation, adrress)
values ('5 Machine Road', 93587, '5 Machine RoadK');
insert into STATION (name, idstation, adrress)
values ('26 Lauper Blvd', 34340, '26 Lauper BlvdV');
insert into STATION (name, idstation, adrress)
values ('20 Whitford Dri', 62377, '20 Whitford Dri');
insert into STATION (name, idstation, adrress)
values ('92nd Street', 68750, '92nd StreetGett');
insert into STATION (name, idstation, adrress)
values ('14 Bullock Driv', 15218, '14 Bullock Driv');
insert into STATION (name, idstation, adrress)
values ('935 Allan Ave', 60364, '935 Allan AveCa');
insert into STATION (name, idstation, adrress)
values ('44 Oliver Drive', 33734, '44 Oliver Drive');
insert into STATION (name, idstation, adrress)
values ('60 Vassar Stree', 31403, '60 Vassar Stree');
insert into STATION (name, idstation, adrress)
values ('75 Stans', 43093, '75 StansHouston');
insert into STATION (name, idstation, adrress)
values ('75 Kilmer Stree', 99594, '75 Kilmer Stree');
insert into STATION (name, idstation, adrress)
values ('33 Horsens Stre', 29294, '33 Horsens Stre');
insert into STATION (name, idstation, adrress)
values ('674 Marin Drive', 72786, '674 Marin Drive');
insert into STATION (name, idstation, adrress)
values ('70 Curitiba Blv', 38769, '70 Curitiba Blv');
insert into STATION (name, idstation, adrress)
values ('161 Glenn Road', 16558, '161 Glenn RoadP');
insert into STATION (name, idstation, adrress)
values ('31 Lari Road', 47950, '31 Lari RoadHer');
insert into STATION (name, idstation, adrress)
values ('23rd Street', 86645, '23rd StreetWage');
insert into STATION (name, idstation, adrress)
values ('97 Scottsdale B', 57647, '97 Scottsdale B');
insert into STATION (name, idstation, adrress)
values ('82 Osaka Road', 41796, '82 Osaka RoadVi');
insert into STATION (name, idstation, adrress)
values ('34 Madeleine St', 82500, '34 Madeleine St');
insert into STATION (name, idstation, adrress)
values ('99 Kaohsiung Ro', 58422, '99 Kaohsiung Ro');
insert into STATION (name, idstation, adrress)
values ('91st Street', 65123, '91st StreetGerm');
insert into STATION (name, idstation, adrress)
values ('80 Reykjavik St', 51498, '80 Reykjavik St');
insert into STATION (name, idstation, adrress)
values ('20 Willard Road', 44754, '20 Willard Road');
insert into STATION (name, idstation, adrress)
values ('14 Le chesnay S', 89905, '14 Le chesnay S');
insert into STATION (name, idstation, adrress)
values ('159 Dukakis Roa', 48764, '159 Dukakis Roa');
insert into STATION (name, idstation, adrress)
values ('59 Stone Road', 19769, '59 Stone RoadVi');
insert into STATION (name, idstation, adrress)
values ('47 Akron Road', 20630, '47 Akron RoadMa');
insert into STATION (name, idstation, adrress)
values ('46 Satriani Dri', 16586, '46 Satriani Dri');
insert into STATION (name, idstation, adrress)
values ('61 Lyon Road', 72411, '61 Lyon RoadBou');
insert into STATION (name, idstation, adrress)
values ('712 Terri Stree', 39626, '712 Terri Stree');
insert into STATION (name, idstation, adrress)
values ('296 Calcutta St', 72835, '296 Calcutta St');
insert into STATION (name, idstation, adrress)
values ('62 Tokyo Drive', 75692, '62 Tokyo DriveV');
insert into STATION (name, idstation, adrress)
values ('84 Alessandria ', 38250, '84 Alessandria ');
insert into STATION (name, idstation, adrress)
values ('44 Stevie Stree', 10259, '44 Stevie Stree');
insert into STATION (name, idstation, adrress)
values ('274 Brown Stree', 78171, '274 Brown Stree');
insert into STATION (name, idstation, adrress)
values ('10 Cage Drive', 57981, '10 Cage DriveNo');
insert into STATION (name, idstation, adrress)
values ('45 Rydell Blvd', 10288, '45 Rydell BlvdL');
insert into STATION (name, idstation, adrress)
values ('16 Swarthmore D', 46985, '16 Swarthmore D');
insert into STATION (name, idstation, adrress)
values ('96 Tripplehorn ', 38147, '96 Tripplehorn ');
insert into STATION (name, idstation, adrress)
values ('78 Hopkins Driv', 43233, '78 Hopkins Driv');
insert into STATION (name, idstation, adrress)
values ('96 Mindy Street', 35108, '96 Mindy Street');
insert into STATION (name, idstation, adrress)
values ('37 Mantegna Roa', 93672, '37 Mantegna Roa');
insert into STATION (name, idstation, adrress)
values ('255 Dan', 96905, '255 DanNantes');
insert into STATION (name, idstation, adrress)
values ('37 Zwolle', 30037, '37 ZwolleBanbur');
insert into STATION (name, idstation, adrress)
values ('15 Bryan Road', 96898, '15 Bryan RoadMo');
insert into STATION (name, idstation, adrress)
values ('47 Steven', 98755, '47 StevenEl Mas');
insert into STATION (name, idstation, adrress)
values ('100 Sanchez Dri', 61028, '100 Sanchez Dri');
insert into STATION (name, idstation, adrress)
values ('51st Street', 82687, '51st StreetMt. ');
insert into STATION (name, idstation, adrress)
values ('164 Harris Road', 13532, '164 Harris Road');
insert into STATION (name, idstation, adrress)
values ('86 Terrasa Stre', 47879, '86 Terrasa Stre');
insert into STATION (name, idstation, adrress)
values ('43 Pride Drive', 89801, '43 Pride DriveJ');
insert into STATION (name, idstation, adrress)
values ('939 Cattrall Bl', 68778, '939 Cattrall Bl');
insert into STATION (name, idstation, adrress)
values ('98 Towson Road', 99442, '98 Towson RoadH');
insert into STATION (name, idstation, adrress)
values ('73 Womack Stree', 25207, '73 Womack Stree');
insert into STATION (name, idstation, adrress)
values ('21 Lea Ave', 27752, '21 Lea AveWuerz');
insert into STATION (name, idstation, adrress)
values ('42 Cronin Road', 83034, '42 Cronin RoadM');
insert into STATION (name, idstation, adrress)
values ('62nd Street', 59948, '62nd StreetPete');
insert into STATION (name, idstation, adrress)
values ('73 Eckhart Road', 85179, '73 Eckhart Road');
insert into STATION (name, idstation, adrress)
values ('71 Merchant Str', 82486, '71 Merchant Str');
insert into STATION (name, idstation, adrress)
values ('61 Shaw Ave', 36267, '61 Shaw AveOppe');
insert into STATION (name, idstation, adrress)
values ('98 Hex Street', 84565, '98 Hex StreetBi');
insert into STATION (name, idstation, adrress)
values ('58 Dorn Ave', 42421, '58 Dorn AveNago');
insert into STATION (name, idstation, adrress)
values ('51 Bandy Street', 51088, '51 Bandy Street');
insert into STATION (name, idstation, adrress)
values ('65 Treat Road', 51016, '65 Treat RoadBe');
commit;
prompt 200 records committed...
insert into STATION (name, idstation, adrress)
values ('92nd Street', 75039, '92nd StreetPasa');
insert into STATION (name, idstation, adrress)
values ('1 Johansson', 65334, '1 JohanssonArch');
insert into STATION (name, idstation, adrress)
values ('3 Hunt Drive', 64274, '3 Hunt DriveGol');
insert into STATION (name, idstation, adrress)
values ('9 Nunn Drive', 61360, '9 Nunn DriveFre');
insert into STATION (name, idstation, adrress)
values ('693 Laura Drive', 73138, '693 Laura Drive');
insert into STATION (name, idstation, adrress)
values ('11 Brenda Stree', 16311, '11 Brenda Stree');
insert into STATION (name, idstation, adrress)
values ('597 de Lancie B', 46068, '597 de Lancie B');
insert into STATION (name, idstation, adrress)
values ('75 Gothenburg S', 88049, '75 Gothenburg S');
insert into STATION (name, idstation, adrress)
values ('1 Nick Drive', 10016, '1 Nick DriveAnn');
insert into STATION (name, idstation, adrress)
values ('36 Harrelson Ro', 64876, '36 Harrelson Ro');
insert into STATION (name, idstation, adrress)
values ('11 Sepulveda St', 38264, '11 Sepulveda St');
insert into STATION (name, idstation, adrress)
values ('49 Moody Drive', 52202, '49 Moody DriveL');
insert into STATION (name, idstation, adrress)
values ('90 Gertner Blvd', 39227, '90 Gertner Blvd');
insert into STATION (name, idstation, adrress)
values ('37 Steve Road', 54317, '37 Steve RoadFr');
insert into STATION (name, idstation, adrress)
values ('61 Weiss Drive', 27012, '61 Weiss DriveO');
insert into STATION (name, idstation, adrress)
values ('7 Rains Street', 28379, '7 Rains StreetR');
insert into STATION (name, idstation, adrress)
values ('71st Street', 68490, '71st StreetTows');
insert into STATION (name, idstation, adrress)
values ('71st Street', 68667, '71st StreetChar');
insert into STATION (name, idstation, adrress)
values ('98 McKennitt Dr', 56091, '98 McKennitt Dr');
insert into STATION (name, idstation, adrress)
values ('42 Shelton Road', 59606, '42 Shelton Road');
insert into STATION (name, idstation, adrress)
values ('256 Grapevine R', 61495, '256 Grapevine R');
insert into STATION (name, idstation, adrress)
values ('39 Kochi Road', 16032, '39 Kochi RoadMa');
insert into STATION (name, idstation, adrress)
values ('5 Dorff Street', 77543, '5 Dorff StreetM');
insert into STATION (name, idstation, adrress)
values ('39 Young Street', 80214, '39 Young Street');
insert into STATION (name, idstation, adrress)
values ('89 Loreena Ave', 13794, '89 Loreena AveR');
insert into STATION (name, idstation, adrress)
values ('9 Darren Street', 44620, '9 Darren Street');
insert into STATION (name, idstation, adrress)
values ('52 Streep Stree', 93293, '52 Streep Stree');
insert into STATION (name, idstation, adrress)
values ('6 Deborah Road', 51436, '6 Deborah RoadS');
insert into STATION (name, idstation, adrress)
values ('16 Brittany Roa', 75126, '16 Brittany Roa');
insert into STATION (name, idstation, adrress)
values ('67 Brandt Drive', 88196, '67 Brandt Drive');
insert into STATION (name, idstation, adrress)
values ('23rd Street', 21618, '23rd StreetSant');
insert into STATION (name, idstation, adrress)
values ('52nd Street', 56876, '52nd StreetInge');
insert into STATION (name, idstation, adrress)
values ('17 Marlboro Blv', 15361, '17 Marlboro Blv');
insert into STATION (name, idstation, adrress)
values ('90 Kungki Drive', 79365, '90 Kungki Drive');
insert into STATION (name, idstation, adrress)
values ('92 Berkoff Stre', 42724, '92 Berkoff Stre');
insert into STATION (name, idstation, adrress)
values ('60 Ferrell Driv', 57460, '60 Ferrell Driv');
insert into STATION (name, idstation, adrress)
values ('42 Reese Road', 64027, '42 Reese RoadOu');
insert into STATION (name, idstation, adrress)
values ('73 Rory Street', 24166, '73 Rory StreetI');
insert into STATION (name, idstation, adrress)
values ('81 Arden', 21215, '81 ArdenWetzlar');
insert into STATION (name, idstation, adrress)
values ('49 Buddy Drive', 77970, '49 Buddy DriveS');
insert into STATION (name, idstation, adrress)
values ('9 Fukui', 15467, '9 FukuiIrving');
insert into STATION (name, idstation, adrress)
values ('670 Vanessa Str', 85627, '670 Vanessa Str');
insert into STATION (name, idstation, adrress)
values ('7 Rachael Drive', 25422, '7 Rachael Drive');
insert into STATION (name, idstation, adrress)
values ('674 Dick Road', 64046, '674 Dick RoadBi');
insert into STATION (name, idstation, adrress)
values ('99 El Segundo S', 28617, '99 El Segundo S');
insert into STATION (name, idstation, adrress)
values ('63 Kris Street', 79323, '63 Kris StreetM');
insert into STATION (name, idstation, adrress)
values ('82 Swinton Blvd', 12495, '82 Swinton Blvd');
insert into STATION (name, idstation, adrress)
values ('86 Stockard Dri', 25637, '86 Stockard Dri');
insert into STATION (name, idstation, adrress)
values ('7 Harrelson Str', 98038, '7 Harrelson Str');
insert into STATION (name, idstation, adrress)
values ('29 Neill Drive', 88920, '29 Neill DriveS');
insert into STATION (name, idstation, adrress)
values ('21 Garcia Ave', 86424, '21 Garcia AveFu');
insert into STATION (name, idstation, adrress)
values ('646 Pryce', 46624, '646 PryceHacken');
insert into STATION (name, idstation, adrress)
values ('66 Kattan Ave', 88791, '66 Kattan AveSt');
insert into STATION (name, idstation, adrress)
values ('87 Clinton', 72588, '87 ClintonSant ');
insert into STATION (name, idstation, adrress)
values ('444 Kevin Road', 46204, '444 Kevin RoadP');
insert into STATION (name, idstation, adrress)
values ('13 Levine Road', 56001, '13 Levine RoadY');
insert into STATION (name, idstation, adrress)
values ('18 Battle Creek', 58371, '18 Battle Creek');
insert into STATION (name, idstation, adrress)
values ('47 Steenburgen ', 62104, '47 Steenburgen ');
insert into STATION (name, idstation, adrress)
values ('188 Davy Street', 48699, '188 Davy Street');
insert into STATION (name, idstation, adrress)
values ('70 Crowe Street', 55527, '70 Crowe Street');
insert into STATION (name, idstation, adrress)
values ('41 Merrilee Str', 24650, '41 Merrilee Str');
insert into STATION (name, idstation, adrress)
values ('40 Senior Stree', 70117, '40 Senior Stree');
insert into STATION (name, idstation, adrress)
values ('299 Emmylou Dri', 22220, '299 Emmylou Dri');
insert into STATION (name, idstation, adrress)
values ('867 Turner Stre', 16848, '867 Turner Stre');
insert into STATION (name, idstation, adrress)
values ('15 Omaha Street', 68447, '15 Omaha Street');
insert into STATION (name, idstation, adrress)
values ('56 Jackson Ave', 63120, '56 Jackson AveC');
insert into STATION (name, idstation, adrress)
values ('83 Glenn Street', 51158, '83 Glenn Street');
insert into STATION (name, idstation, adrress)
values ('145 Skerritt Av', 74001, '145 Skerritt Av');
insert into STATION (name, idstation, adrress)
values ('23 Beth Road', 62019, '23 Beth RoadAik');
insert into STATION (name, idstation, adrress)
values ('79 Cazale Stree', 55532, '79 Cazale Stree');
insert into STATION (name, idstation, adrress)
values ('261 Murdock', 89415, '261 MurdockBrus');
insert into STATION (name, idstation, adrress)
values ('79 San Ramon Dr', 30822, '79 San Ramon Dr');
insert into STATION (name, idstation, adrress)
values ('4 Connie', 53686, '4 ConnieAlphare');
insert into STATION (name, idstation, adrress)
values ('97 Zwolle Drive', 30391, '97 Zwolle Drive');
insert into STATION (name, idstation, adrress)
values ('35 Peabo Blvd', 65013, '35 Peabo BlvdLo');
insert into STATION (name, idstation, adrress)
values ('822 Cusack Ave', 70893, '822 Cusack AveJ');
insert into STATION (name, idstation, adrress)
values ('17 Takapuna Ave', 72729, '17 Takapuna Ave');
insert into STATION (name, idstation, adrress)
values ('38 Lexington Ro', 41688, '38 Lexington Ro');
insert into STATION (name, idstation, adrress)
values ('13 Meniketti Ro', 10952, '13 Meniketti Ro');
insert into STATION (name, idstation, adrress)
values ('30 Parsons Road', 95618, '30 Parsons Road');
insert into STATION (name, idstation, adrress)
values ('35 Milpitas', 66117, '35 MilpitasMoor');
insert into STATION (name, idstation, adrress)
values ('13 Lennix Blvd', 73703, '13 Lennix BlvdB');
insert into STATION (name, idstation, adrress)
values ('410 Cheech Stre', 34662, '410 Cheech Stre');
insert into STATION (name, idstation, adrress)
values ('32 Fornacette R', 61432, '32 Fornacette R');
insert into STATION (name, idstation, adrress)
values ('75 Ranger Ave', 72777, '75 Ranger AveMa');
insert into STATION (name, idstation, adrress)
values ('49 Bangalore St', 84582, '49 Bangalore St');
insert into STATION (name, idstation, adrress)
values ('49 Broderick St', 29342, '49 Broderick St');
insert into STATION (name, idstation, adrress)
values ('86 Stowe Blvd', 84077, '86 Stowe BlvdRo');
insert into STATION (name, idstation, adrress)
values ('602 Cagle Stree', 45317, '602 Cagle Stree');
insert into STATION (name, idstation, adrress)
values ('20 Derek Ave', 52733, '20 Derek AveKau');
insert into STATION (name, idstation, adrress)
values ('32 Lionel Blvd', 88157, '32 Lionel BlvdN');
insert into STATION (name, idstation, adrress)
values ('934 Wainwright ', 20166, '934 Wainwright ');
insert into STATION (name, idstation, adrress)
values ('41 Elias Street', 41138, '41 Elias Street');
insert into STATION (name, idstation, adrress)
values ('11st Street', 16168, '11st StreetWood');
insert into STATION (name, idstation, adrress)
values ('96 Fairview Hei', 84566, '96 Fairview Hei');
insert into STATION (name, idstation, adrress)
values ('24 Roundtree Ro', 40828, '24 Roundtree Ro');
insert into STATION (name, idstation, adrress)
values ('72nd Street', 62042, '72nd StreetMumb');
insert into STATION (name, idstation, adrress)
values ('26 Brody Road', 89703, '26 Brody RoadWi');
insert into STATION (name, idstation, adrress)
values ('32 Guinness Dri', 97510, '32 Guinness Dri');
insert into STATION (name, idstation, adrress)
values ('462 Franks Blvd', 20583, '462 Franks Blvd');
commit;
prompt 300 records committed...
insert into STATION (name, idstation, adrress)
values ('25 Wang Ave', 34920, '25 Wang AveNico');
insert into STATION (name, idstation, adrress)
values ('94 Peterson Roa', 85428, '94 Peterson Roa');
insert into STATION (name, idstation, adrress)
values ('2 Reno Drive', 49803, '2 Reno DriveVil');
insert into STATION (name, idstation, adrress)
values ('43rd Street', 82125, '43rd StreetAshd');
insert into STATION (name, idstation, adrress)
values ('86 Cox Street', 81164, '86 Cox StreetBa');
insert into STATION (name, idstation, adrress)
values ('85 Kevelaer Roa', 78444, '85 Kevelaer Roa');
insert into STATION (name, idstation, adrress)
values ('4 Eric', 54622, '4 EricLummen');
insert into STATION (name, idstation, adrress)
values ('41 Liv Drive', 38962, '41 Liv DriveGra');
insert into STATION (name, idstation, adrress)
values ('59 Bean Road', 77714, '59 Bean RoadMai');
insert into STATION (name, idstation, adrress)
values ('60 Belinda Stre', 78373, '60 Belinda Stre');
insert into STATION (name, idstation, adrress)
values ('61 Breslin Ave', 68111, '61 Breslin AveB');
insert into STATION (name, idstation, adrress)
values ('16 Vincent Road', 34752, '16 Vincent Road');
insert into STATION (name, idstation, adrress)
values ('75 Culkin Stree', 88169, '75 Culkin Stree');
insert into STATION (name, idstation, adrress)
values ('51st Street', 96605, '51st StreetEber');
insert into STATION (name, idstation, adrress)
values ('41st Street', 38704, '41st StreetHoch');
insert into STATION (name, idstation, adrress)
values ('13 Toronto Stre', 23718, '13 Toronto Stre');
insert into STATION (name, idstation, adrress)
values ('89 Varzea grand', 93962, '89 Varzea grand');
insert into STATION (name, idstation, adrress)
values ('54 Coldmeece St', 50693, '54 Coldmeece St');
insert into STATION (name, idstation, adrress)
values ('16 Shaw Drive', 87426, '16 Shaw DriveDo');
insert into STATION (name, idstation, adrress)
values ('9 Harrelson Ave', 46639, '9 Harrelson Ave');
insert into STATION (name, idstation, adrress)
values ('13rd Street', 76226, '13rd StreetNaes');
insert into STATION (name, idstation, adrress)
values ('60 O''Sullivan S', 59697, '60 O''Sullivan S');
insert into STATION (name, idstation, adrress)
values ('14 Research Tri', 27355, '14 Research Tri');
insert into STATION (name, idstation, adrress)
values ('34 Vonda Road', 21156, '34 Vonda RoadGa');
insert into STATION (name, idstation, adrress)
values ('65 Armin Drive', 73480, '65 Armin DriveN');
insert into STATION (name, idstation, adrress)
values ('24 Mablethorpe ', 99205, '24 Mablethorpe ');
insert into STATION (name, idstation, adrress)
values ('86 Pullman Stre', 76788, '86 Pullman Stre');
insert into STATION (name, idstation, adrress)
values ('42 Everett Driv', 11880, '42 Everett Driv');
insert into STATION (name, idstation, adrress)
values ('50 St Leonards ', 42653, '50 St Leonards ');
insert into STATION (name, idstation, adrress)
values ('51st Street', 99581, '51st StreetIsma');
insert into STATION (name, idstation, adrress)
values ('81 Lupe', 69535, '81 LupeZuerich');
insert into STATION (name, idstation, adrress)
values ('544 Broadbent R', 20299, '544 Broadbent R');
insert into STATION (name, idstation, adrress)
values ('265 Tramaine St', 24086, '265 Tramaine St');
insert into STATION (name, idstation, adrress)
values ('470 Rooker Road', 34414, '470 Rooker Road');
insert into STATION (name, idstation, adrress)
values ('73 Sao jose rio', 92968, '73 Sao jose rio');
insert into STATION (name, idstation, adrress)
values ('429 Redford Roa', 47979, '429 Redford Roa');
insert into STATION (name, idstation, adrress)
values ('401 Suzi Ave', 62106, '401 Suzi AveHei');
insert into STATION (name, idstation, adrress)
values ('425 Valentin Av', 89095, '425 Valentin Av');
insert into STATION (name, idstation, adrress)
values ('52nd Street', 13955, '52nd StreetWint');
insert into STATION (name, idstation, adrress)
values ('90 Shelton Road', 46281, '90 Shelton Road');
insert into STATION (name, idstation, adrress)
values ('62 O''Donnell St', 17265, '62 O''Donnell St');
insert into STATION (name, idstation, adrress)
values ('784 Newnan Ave', 72596, '784 Newnan AveM');
insert into STATION (name, idstation, adrress)
values ('45 Sarah Drive', 75656, '45 Sarah DriveB');
insert into STATION (name, idstation, adrress)
values ('13rd Street', 33002, '13rd StreetWell');
insert into STATION (name, idstation, adrress)
values ('35 Emilio Road', 99093, '35 Emilio RoadB');
insert into STATION (name, idstation, adrress)
values ('67 Utrecht Driv', 92537, '67 Utrecht Driv');
insert into STATION (name, idstation, adrress)
values ('30 Shearer Stre', 45927, '30 Shearer Stre');
insert into STATION (name, idstation, adrress)
values ('51 Marie Drive', 42681, '51 Marie DriveT');
insert into STATION (name, idstation, adrress)
values ('11st Street', 35100, '11st StreetBram');
insert into STATION (name, idstation, adrress)
values ('27 Shawn Street', 95961, '27 Shawn Street');
insert into STATION (name, idstation, adrress)
values ('57 Sant Cugat D', 90484, '57 Sant Cugat D');
insert into STATION (name, idstation, adrress)
values ('464 Colm Drive', 58964, '464 Colm DriveM');
insert into STATION (name, idstation, adrress)
values ('897 Santa rita ', 15687, '897 Santa rita ');
insert into STATION (name, idstation, adrress)
values ('13rd Street', 86282, '13rd StreetSara');
insert into STATION (name, idstation, adrress)
values ('12 Nik Street', 93114, '12 Nik StreetAl');
insert into STATION (name, idstation, adrress)
values ('57 Knutsford Bl', 97241, '57 Knutsford Bl');
insert into STATION (name, idstation, adrress)
values ('61st Street', 84008, '61st StreetMcle');
insert into STATION (name, idstation, adrress)
values ('48 Patrick Road', 63319, '48 Patrick Road');
insert into STATION (name, idstation, adrress)
values ('62nd Street', 71940, '62nd StreetMana');
insert into STATION (name, idstation, adrress)
values ('423 Alpharetta ', 89476, '423 Alpharetta ');
insert into STATION (name, idstation, adrress)
values ('31 Secada Stree', 14067, '31 Secada Stree');
insert into STATION (name, idstation, adrress)
values ('55 Reynolds Str', 58192, '55 Reynolds Str');
insert into STATION (name, idstation, adrress)
values ('54 Patrick Road', 81102, '54 Patrick Road');
insert into STATION (name, idstation, adrress)
values ('40 Nancy Street', 80063, '40 Nancy Street');
insert into STATION (name, idstation, adrress)
values ('55 Vega Road', 49273, '55 Vega RoadHig');
insert into STATION (name, idstation, adrress)
values ('10 Tottori Stre', 30498, '10 Tottori Stre');
insert into STATION (name, idstation, adrress)
values ('503 Sisto Road', 62353, '503 Sisto RoadR');
insert into STATION (name, idstation, adrress)
values ('22nd Street', 12707, '22nd StreetPeta');
insert into STATION (name, idstation, adrress)
values ('35 Arnold Stree', 77904, '35 Arnold Stree');
insert into STATION (name, idstation, adrress)
values ('631 Gleeson Ave', 14819, '631 Gleeson Ave');
insert into STATION (name, idstation, adrress)
values ('50 Walsh Drive', 18573, '50 Walsh DriveB');
insert into STATION (name, idstation, adrress)
values ('59 Pompton Plai', 15328, '59 Pompton Plai');
insert into STATION (name, idstation, adrress)
values ('52 DeGraw Drive', 41638, '52 DeGraw Drive');
insert into STATION (name, idstation, adrress)
values ('31st Street', 77883, '31st StreetMoun');
insert into STATION (name, idstation, adrress)
values ('70 Zevon Ave', 94022, '70 Zevon AveMil');
insert into STATION (name, idstation, adrress)
values ('78 Dysart Stree', 45437, '78 Dysart Stree');
insert into STATION (name, idstation, adrress)
values ('56 Page Road', 73503, '56 Page RoadFlu');
insert into STATION (name, idstation, adrress)
values ('919 Vejle Ave', 47195, '919 Vejle AveOv');
insert into STATION (name, idstation, adrress)
values ('46 Kweller', 67857, '46 KwellerIrvin');
insert into STATION (name, idstation, adrress)
values ('12nd Street', 94539, '12nd StreetSevi');
insert into STATION (name, idstation, adrress)
values ('63 Gilbert Stre', 44276, '63 Gilbert Stre');
insert into STATION (name, idstation, adrress)
values ('52nd Street', 20418, '52nd StreetLoui');
insert into STATION (name, idstation, adrress)
values ('10 Griffith Ave', 42713, '10 Griffith Ave');
insert into STATION (name, idstation, adrress)
values ('12nd Street', 60838, '12nd StreetLake');
insert into STATION (name, idstation, adrress)
values ('95 Herbie Road', 83019, '95 Herbie RoadT');
insert into STATION (name, idstation, adrress)
values ('75 Bloemfontein', 38442, '75 Bloemfontein');
insert into STATION (name, idstation, adrress)
values ('33 Ismaning Dri', 33409, '33 Ismaning Dri');
insert into STATION (name, idstation, adrress)
values ('29 Jakarta', 40113, '29 JakartaReno');
insert into STATION (name, idstation, adrress)
values ('38 Omaha Road', 93770, '38 Omaha RoadAn');
insert into STATION (name, idstation, adrress)
values ('49 Trejo Road', 84430, '49 Trejo RoadNe');
insert into STATION (name, idstation, adrress)
values ('52 Todd Blvd', 70261, '52 Todd BlvdMac');
insert into STATION (name, idstation, adrress)
values ('82nd Street', 62642, '82nd StreetBedf');
insert into STATION (name, idstation, adrress)
values ('22nd Street', 94885, '22nd StreetYomg');
insert into STATION (name, idstation, adrress)
values ('80 Delbert Road', 43494, '80 Delbert Road');
insert into STATION (name, idstation, adrress)
values ('184 Jeff Road', 35708, '184 Jeff RoadAl');
insert into STATION (name, idstation, adrress)
values ('965 Bean Road', 64811, '965 Bean RoadLu');
insert into STATION (name, idstation, adrress)
values ('65 Teena Ave', 45157, '65 Teena AveVan');
commit;
prompt 397 records loaded
prompt Loading STATIONTOBUS...
insert into STATIONTOBUS (serial, idbusline, idstation)
values (12, 1, 65423);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (35, 2, 28765);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (48, 3, 53017);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (7, 4, 91836);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (29, 5, 40128);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (41, 6, 76952);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (3, 7, 14209);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (19, 8, 68357);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (46, 9, 27314);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (25, 10, 49582);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (9, 11, 63571);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (38, 12, 75893);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (16, 13, 80624);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (43, 14, 90341);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (5, 15, 37651);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (28, 16, 12589);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (50, 17, 47263);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (2, 18, 81903);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (11, 19, 54026);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (36, 20, 36784);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (22, 21, 69458);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (47, 22, 28743);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (6, 23, 62981);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (30, 24, 74815);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (18, 25, 56432);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (33, 26, 19538);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (4, 27, 83917);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (26, 28, 47032);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (15, 29, 18245);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (49, 30, 71682);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (44, 31, 94528);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (13, 32, 53176);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (34, 33, 36294);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (21, 34, 28516);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (8, 35, 41975);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (23, 36, 82756);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (40, 37, 60934);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (27, 38, 54372);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (1, 39, 19743);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (45, 40, 39812);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (31, 41, 68125);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (20, 42, 37456);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (39, 43, 85674);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (24, 44, 53197);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (14, 45, 64029);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (42, 46, 29813);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (32, 47, 50163);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (17, 48, 81735);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (37, 49, 62351);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (10, 50, 25987);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (48, 51, 73015);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (6, 52, 83419);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (27, 53, 53672);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (2, 54, 94158);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (34, 55, 71836);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (14, 56, 46179);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (49, 57, 30584);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (26, 58, 89274);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (38, 59, 54732);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (31, 60, 32954);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (11, 61, 67825);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (35, 62, 21587);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (18, 63, 90417);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (8, 64, 51273);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (41, 65, 83519);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (10, 66, 74825);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (47, 67, 68924);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (20, 68, 41072);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (1, 69, 57234);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (29, 70, 31248);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (43, 71, 63054);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (3, 72, 81947);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (46, 73, 24567);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (21, 74, 50839);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (33, 75, 73642);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (9, 76, 95421);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (39, 77, 36752);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (22, 78, 18972);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (15, 79, 42986);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (42, 80, 69317);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (7, 81, 72651);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (45, 82, 89436);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (25, 83, 25874);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (50, 84, 61028);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (36, 85, 38159);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (5, 86, 64728);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (40, 87, 58023);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (30, 88, 37291);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (16, 89, 59621);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (37, 90, 43187);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (24, 91, 82951);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (4, 92, 19468);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (32, 93, 72543);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (12, 94, 53069);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (28, 95, 86524);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (17, 96, 21795);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (19, 97, 75421);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (44, 98, 40539);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (23, 99, 94137);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (13, 100, 67824);
commit;
prompt 100 records committed...
insert into STATIONTOBUS (serial, idbusline, idstation)
values (26, 101, 19843);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (15, 102, 51297);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (47, 103, 43928);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (20, 104, 62918);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (30, 105, 85426);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (8, 106, 29478);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (41, 107, 18635);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (2, 108, 52097);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (31, 109, 74385);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (35, 110, 58026);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (3, 111, 31745);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (46, 112, 94263);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (12, 113, 68534);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (49, 114, 57963);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (22, 115, 30824);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (40, 116, 61385);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (29, 117, 81967);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (13, 118, 58403);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (7, 119, 27593);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (32, 120, 71049);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (5, 121, 86529);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (39, 122, 52896);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (50, 123, 67923);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (33, 124, 31487);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (10, 125, 47826);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (27, 126, 62935);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (21, 127, 85472);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (48, 128, 69732);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (16, 129, 52047);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (37, 130, 14358);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (11, 131, 65947);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (44, 132, 92053);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (1, 133, 38719);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (26, 134, 57932);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (42, 135, 30476);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (38, 136, 84527);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (17, 137, 49673);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (45, 138, 63815);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (4, 139, 72053);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (25, 140, 98524);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (34, 141, 41369);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (19, 142, 85736);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (6, 143, 57293);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (28, 144, 39471);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (14, 145, 72698);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (9, 146, 83015);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (36, 147, 51873);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (24, 148, 43689);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (43, 149, 68291);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (18, 150, 32579);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (50, 151, 47936);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (32, 152, 63185);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (9, 153, 91572);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (39, 154, 67834);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (48, 155, 24135);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (26, 156, 57032);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (14, 157, 69748);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (31, 158, 38476);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (8, 159, 51943);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (40, 160, 69217);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (19, 161, 83157);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (7, 162, 40682);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (38, 163, 78453);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (45, 164, 53096);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (22, 165, 96532);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (15, 166, 12895);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (34, 167, 74369);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (5, 168, 53697);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (36, 169, 86725);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (21, 170, 45087);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (11, 171, 61439);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (47, 172, 73926);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (33, 173, 50234);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (20, 174, 65879);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (49, 175, 37462);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (12, 176, 92617);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (29, 177, 58139);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (4, 178, 31469);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (30, 179, 75029);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (41, 180, 49078);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (18, 181, 63284);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (46, 182, 72963);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (10, 183, 48329);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (37, 184, 67145);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (3, 185, 29568);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (42, 186, 83756);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (23, 187, 57946);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (35, 188, 12698);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (1, 189, 81964);
insert into STATIONTOBUS (serial, idbusline, idstation)
values (50, 190, 43875);
commit;
prompt 190 records loaded
prompt Loading TICKET...
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1000, 0);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1001, 1);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1002, 2);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1003, 3);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1004, 4);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1005, 5);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1006, 6);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1007, 7);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1008, 8);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1009, 9);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1010, 10);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1011, 11);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1012, 12);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1013, 13);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1014, 14);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1015, 15);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1016, 16);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1017, 17);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1018, 18);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1019, 19);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1020, 20);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1021, 21);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1022, 22);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1023, 23);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1024, 24);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1025, 25);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1026, 26);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1027, 27);
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
values ('asoldier', 1033, 33);
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
values ('youth', 1042, 42);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1043, 43);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1044, 44);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1045, 45);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1046, 46);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1047, 47);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1048, 48);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1049, 49);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1050, 50);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1051, 51);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1052, 52);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1053, 53);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1054, 54);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1055, 55);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1056, 56);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1057, 57);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1058, 58);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1059, 59);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1060, 60);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1061, 61);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1062, 62);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1063, 63);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1064, 64);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1065, 65);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1066, 66);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1067, 67);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1068, 68);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1069, 69);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1070, 70);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1071, 71);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1072, 72);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1073, 73);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1074, 74);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1075, 75);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1076, 76);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1077, 77);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1078, 78);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1079, 79);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1080, 80);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1081, 81);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1082, 82);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1083, 83);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1084, 84);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1085, 85);
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
values ('youth', 1092, 92);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1093, 93);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1094, 94);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1095, 95);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1096, 96);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1097, 97);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1098, 98);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1099, 99);
commit;
prompt 100 records committed...
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1100, 100);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1101, 101);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1102, 102);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1103, 103);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1104, 104);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1105, 105);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1106, 106);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1107, 107);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1108, 108);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1109, 109);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1110, 110);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1111, 111);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1112, 112);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1113, 113);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1114, 114);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1115, 115);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1116, 116);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1117, 117);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1118, 118);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1119, 119);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1120, 120);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1121, 121);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1122, 122);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1123, 123);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1124, 124);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1125, 125);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1126, 126);
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
values ('Veteran', 1134, 134);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1135, 135);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1136, 136);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1137, 137);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1138, 138);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1139, 139);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1140, 140);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1141, 141);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1142, 142);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1143, 143);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1144, 144);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1145, 145);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1146, 146);
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
values ('asoldier', 1154, 154);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1155, 155);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1156, 156);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1157, 157);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1158, 158);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1159, 159);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1160, 160);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1161, 161);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1162, 162);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1163, 163);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1164, 164);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1165, 165);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1166, 166);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1167, 167);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1168, 168);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1169, 169);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1170, 170);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1171, 171);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1172, 172);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1173, 173);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1174, 174);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1175, 175);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1176, 176);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1177, 177);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1178, 178);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1179, 179);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1180, 180);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1181, 181);
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
values ('asoldier', 1198, 198);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1199, 199);
commit;
prompt 200 records committed...
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1200, 200);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1201, 201);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1202, 202);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1203, 203);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1204, 204);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1205, 205);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1206, 206);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1207, 207);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1208, 208);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1209, 209);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1210, 210);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1211, 211);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1212, 212);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1213, 213);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1214, 214);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1215, 215);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1216, 216);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1217, 217);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1218, 218);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1219, 219);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1220, 220);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1221, 221);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1222, 222);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1223, 223);
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
values ('Veteran', 1231, 231);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1232, 232);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1233, 233);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1234, 234);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1235, 235);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1236, 236);
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
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1248, 248);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1249, 249);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1250, 250);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1251, 251);
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
values ('Veteran', 1265, 265);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1266, 266);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1267, 267);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1268, 268);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1269, 269);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1270, 270);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1271, 271);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1272, 272);
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
values ('youth', 1280, 280);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1281, 281);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1282, 282);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1283, 283);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1284, 284);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1285, 285);
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
values ('asoldier', 1292, 292);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1293, 293);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1294, 294);
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
commit;
prompt 300 records committed...
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1300, 300);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1301, 301);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1302, 302);
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
values ('asoldier', 1313, 313);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1314, 314);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1315, 315);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1316, 316);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1317, 317);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1318, 318);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1319, 319);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1320, 320);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1321, 321);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1322, 322);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1323, 323);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1324, 324);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1325, 325);
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
values ('student', 1331, 331);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1332, 332);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1333, 333);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1334, 334);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1335, 335);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1336, 336);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1337, 337);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1338, 338);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1339, 339);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1340, 340);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1341, 341);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1342, 342);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1343, 343);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1344, 344);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1345, 345);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1346, 346);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1347, 347);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1348, 348);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1349, 349);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1350, 350);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1351, 351);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1352, 352);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1353, 353);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1354, 354);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1355, 355);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1356, 356);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1357, 357);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1358, 358);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1359, 359);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1360, 360);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1361, 361);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1362, 362);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1363, 363);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1364, 364);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1365, 365);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1366, 366);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1367, 367);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1368, 368);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1369, 369);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1370, 370);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1371, 371);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1372, 372);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1373, 373);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1374, 374);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1375, 375);
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
values ('Regular', 1383, 383);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1384, 384);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1385, 385);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1386, 386);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1387, 387);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1388, 388);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1389, 389);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1390, 390);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1391, 391);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1392, 392);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1393, 393);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1394, 394);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('youth', 1395, 395);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('asoldier', 1396, 396);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Veteran', 1397, 397);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('Regular', 1398, 398);
insert into TICKET (cardprofile, idticket, accumulatedvalue)
values ('student', 1399, 399);
commit;
prompt 400 records loaded
prompt Loading TRAVELPAYMENT...
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
values (to_date('02-06-2024 12:10:00', 'dd-mm-yyyy hh24:mi:ss'), 7, 1007, '89-012-34');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('03-06-2024 15:40:00', 'dd-mm-yyyy hh24:mi:ss'), 8, 1008, '90-123-45');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('04-06-2024 08:55:00', 'dd-mm-yyyy hh24:mi:ss'), 9, 1009, '01-234-56');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('05-06-2024 10:35:00', 'dd-mm-yyyy hh24:mi:ss'), 11, 1010, '12-345-68');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('06-06-2024 14:00:00', 'dd-mm-yyyy hh24:mi:ss'), 8, 1011, '23-456-79');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('07-06-2024 09:15:00', 'dd-mm-yyyy hh24:mi:ss'), 11, 1012, '34-567-80');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('08-06-2024 11:45:00', 'dd-mm-yyyy hh24:mi:ss'), 9, 1013, '45-678-91');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('09-06-2024 13:30:00', 'dd-mm-yyyy hh24:mi:ss'), 10, 1014, '56-789-02');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('10-06-2024 08:20:00', 'dd-mm-yyyy hh24:mi:ss'), 6, 1015, '67-890-13');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('11-06-2024 10:10:00', 'dd-mm-yyyy hh24:mi:ss'), 8, 1016, '78-901-24');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('12-06-2024 14:50:00', 'dd-mm-yyyy hh24:mi:ss'), 12, 1017, '89-012-35');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('13-06-2024 08:30:00', 'dd-mm-yyyy hh24:mi:ss'), 7, 1018, '90-123-46');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('14-06-2024 12:25:00', 'dd-mm-yyyy hh24:mi:ss'), 8, 1019, '01-234-57');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('15-06-2024 15:15:00', 'dd-mm-yyyy hh24:mi:ss'), 6, 1020, '12-345-69');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('16-06-2024 08:40:00', 'dd-mm-yyyy hh24:mi:ss'), 7, 1021, '23-456-70');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('17-06-2024 11:55:00', 'dd-mm-yyyy hh24:mi:ss'), 9, 1022, '34-567-81');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('18-06-2024 14:45:00', 'dd-mm-yyyy hh24:mi:ss'), 10, 1023, '45-678-92');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('19-06-2024 09:05:00', 'dd-mm-yyyy hh24:mi:ss'), 5, 1024, '56-789-03');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('20-06-2024 10:50:00', 'dd-mm-yyyy hh24:mi:ss'), 8, 1025, '67-890-14');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('21-06-2024 13:20:00', 'dd-mm-yyyy hh24:mi:ss'), 11, 1026, '78-901-25');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('22-06-2024 08:15:00', 'dd-mm-yyyy hh24:mi:ss'), 6, 1027, '89-012-36');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('23-06-2024 11:30:00', 'dd-mm-yyyy hh24:mi:ss'), 8, 1028, '90-123-47');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('24-06-2024 14:35:00', 'dd-mm-yyyy hh24:mi:ss'), 12, 1029, '01-234-58');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('25-06-2024 09:40:00', 'dd-mm-yyyy hh24:mi:ss'), 7, 1030, '12-345-70');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('26-06-2024 10:20:00', 'dd-mm-yyyy hh24:mi:ss'), 7, 1031, '23-456-81');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('27-06-2024 14:10:00', 'dd-mm-yyyy hh24:mi:ss'), 8, 1032, '34-567-92');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('28-06-2024 08:50:00', 'dd-mm-yyyy hh24:mi:ss'), 5, 1033, '45-678-03');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('29-06-2024 12:45:00', 'dd-mm-yyyy hh24:mi:ss'), 12, 1034, '56-789-14');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('30-06-2024 15:25:00', 'dd-mm-yyyy hh24:mi:ss'), 11, 1035, '67-890-25');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('01-07-2024 09:35:00', 'dd-mm-yyyy hh24:mi:ss'), 5, 1036, '78-901-36');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('02-07-2024 11:05:00', 'dd-mm-yyyy hh24:mi:ss'), 6, 1037, '89-012-47');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('03-07-2024 13:55:00', 'dd-mm-yyyy hh24:mi:ss'), 8, 1038, '90-123-58');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('04-07-2024 08:00:00', 'dd-mm-yyyy hh24:mi:ss'), 7, 1039, '01-234-69');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('05-07-2024 10:30:00', 'dd-mm-yyyy hh24:mi:ss'), 9, 1040, '12-345-71');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('06-07-2024 14:20:00', 'dd-mm-yyyy hh24:mi:ss'), 5, 1041, '23-456-82');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('07-07-2024 08:10:00', 'dd-mm-yyyy hh24:mi:ss'), 10, 1042, '34-567-93');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('08-07-2024 11:40:00', 'dd-mm-yyyy hh24:mi:ss'), 9, 1043, '45-678-04');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('09-07-2024 13:15:00', 'dd-mm-yyyy hh24:mi:ss'), 11, 1044, '56-789-15');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('10-07-2024 09:25:00', 'dd-mm-yyyy hh24:mi:ss'), 7, 1045, '67-890-26');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('11-07-2024 10:55:00', 'dd-mm-yyyy hh24:mi:ss'), 8, 1046, '78-901-37');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('12-07-2024 14:45:00', 'dd-mm-yyyy hh24:mi:ss'), 10, 1047, '89-012-48');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('13-07-2024 08:30:00', 'dd-mm-yyyy hh24:mi:ss'), 12, 1048, '90-123-59');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('14-07-2024 11:20:00', 'dd-mm-yyyy hh24:mi:ss'), 9, 1049, '01-234-60');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('15-07-2024 15:10:00', 'dd-mm-yyyy hh24:mi:ss'), 9, 1050, '12-345-72');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('16-07-2024 08:20:00', 'dd-mm-yyyy hh24:mi:ss'), 7, 1051, '23-456-83');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('17-07-2024 10:50:00', 'dd-mm-yyyy hh24:mi:ss'), 9, 1052, '34-567-94');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('18-07-2024 14:40:00', 'dd-mm-yyyy hh24:mi:ss'), 11, 1053, '45-678-05');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('19-07-2024 08:15:00', 'dd-mm-yyyy hh24:mi:ss'), 12, 1054, '56-789-16');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('20-07-2024 11:30:00', 'dd-mm-yyyy hh24:mi:ss'), 7, 1055, '67-890-27');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('21-07-2024 13:45:00', 'dd-mm-yyyy hh24:mi:ss'), 11, 1056, '78-901-38');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('22-07-2024 09:00:00', 'dd-mm-yyyy hh24:mi:ss'), 5, 1057, '89-012-49');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('23-07-2024 10:40:00', 'dd-mm-yyyy hh24:mi:ss'), 8, 1058, '90-123-60');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('24-07-2024 14:20:00', 'dd-mm-yyyy hh24:mi:ss'), 8, 1059, '01-234-71');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('25-07-2024 08:45:00', 'dd-mm-yyyy hh24:mi:ss'), 7, 1060, '12-345-73');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('26-07-2024 11:10:00', 'dd-mm-yyyy hh24:mi:ss'), 12, 1061, '23-456-84');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('27-07-2024 13:55:00', 'dd-mm-yyyy hh24:mi:ss'), 11, 1062, '34-567-95');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('28-07-2024 09:25:00', 'dd-mm-yyyy hh24:mi:ss'), 7, 1063, '45-678-06');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('29-07-2024 10:15:00', 'dd-mm-yyyy hh24:mi:ss'), 12, 1064, '56-789-17');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('30-07-2024 14:00:00', 'dd-mm-yyyy hh24:mi:ss'), 11, 1065, '67-890-28');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('31-07-2024 08:05:00', 'dd-mm-yyyy hh24:mi:ss'), 12, 1066, '78-901-39');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('01-08-2024 11:30:00', 'dd-mm-yyyy hh24:mi:ss'), 10, 1067, '89-012-50');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('02-08-2024 13:40:00', 'dd-mm-yyyy hh24:mi:ss'), 11, 1068, '90-123-61');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('03-08-2024 09:15:00', 'dd-mm-yyyy hh24:mi:ss'), 7, 1069, '01-234-72');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('04-08-2024 10:45:00', 'dd-mm-yyyy hh24:mi:ss'), 11, 1070, '12-345-74');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('05-08-2024 14:25:00', 'dd-mm-yyyy hh24:mi:ss'), 11, 1071, '23-456-85');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('06-08-2024 08:50:00', 'dd-mm-yyyy hh24:mi:ss'), 12, 1072, '34-567-96');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('07-08-2024 11:20:00', 'dd-mm-yyyy hh24:mi:ss'), 12, 1073, '45-678-07');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('08-08-2024 13:10:00', 'dd-mm-yyyy hh24:mi:ss'), 7, 1074, '56-789-18');
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
values (to_date('16-08-2024 10:40:00', 'dd-mm-yyyy hh24:mi:ss'), 6, 1082, '34-567-97');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('17-08-2024 14:20:00', 'dd-mm-yyyy hh24:mi:ss'), 10, 1083, '45-678-08');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('18-08-2024 08:45:00', 'dd-mm-yyyy hh24:mi:ss'), 12, 1084, '56-789-19');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('19-08-2024 11:15:00', 'dd-mm-yyyy hh24:mi:ss'), 7, 1085, '67-890-30');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('20-08-2024 13:05:00', 'dd-mm-yyyy hh24:mi:ss'), 6, 1086, '78-901-41');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('21-08-2024 09:20:00', 'dd-mm-yyyy hh24:mi:ss'), 8, 1087, '89-012-52');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('22-08-2024 10:50:00', 'dd-mm-yyyy hh24:mi:ss'), 12, 1088, '90-123-63');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('23-08-2024 14:30:00', 'dd-mm-yyyy hh24:mi:ss'), 9, 1089, '01-234-74');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('24-08-2024 08:35:00', 'dd-mm-yyyy hh24:mi:ss'), 12, 1090, '12-345-76');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('25-08-2024 11:00:00', 'dd-mm-yyyy hh24:mi:ss'), 9, 1091, '23-456-87');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('26-08-2024 13:45:00', 'dd-mm-yyyy hh24:mi:ss'), 9, 1092, '34-567-98');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('27-08-2024 09:05:00', 'dd-mm-yyyy hh24:mi:ss'), 11, 1093, '45-678-09');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('28-08-2024 10:55:00', 'dd-mm-yyyy hh24:mi:ss'), 6, 1094, '56-789-20');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('29-08-2024 14:40:00', 'dd-mm-yyyy hh24:mi:ss'), 6, 1095, '67-890-31');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('30-08-2024 08:20:00', 'dd-mm-yyyy hh24:mi:ss'), 6, 1096, '78-901-42');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('31-08-2024 11:30:00', 'dd-mm-yyyy hh24:mi:ss'), 10, 1097, '89-012-53');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('01-09-2024 13:15:00', 'dd-mm-yyyy hh24:mi:ss'), 12, 1098, '90-123-64');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('02-09-2024 09:25:00', 'dd-mm-yyyy hh24:mi:ss'), 5, 1099, '01-234-75');
commit;
prompt 100 records committed...
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('03-09-2024 11:55:00', 'dd-mm-yyyy hh24:mi:ss'), 9, 1100, '12-345-77');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('04-09-2024 14:10:00', 'dd-mm-yyyy hh24:mi:ss'), 12, 1101, '23-456-88');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('05-09-2024 08:00:00', 'dd-mm-yyyy hh24:mi:ss'), 12, 1102, '34-567-99');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('06-09-2024 10:35:00', 'dd-mm-yyyy hh24:mi:ss'), 9, 1103, '45-678-10');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('07-09-2024 14:25:00', 'dd-mm-yyyy hh24:mi:ss'), 11, 1104, '56-789-21');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('08-09-2024 08:50:00', 'dd-mm-yyyy hh24:mi:ss'), 6, 1105, '67-890-32');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('09-09-2024 11:20:00', 'dd-mm-yyyy hh24:mi:ss'), 9, 1106, '78-901-43');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('26-05-2024 09:00:00', 'dd-mm-yyyy hh24:mi:ss'), 7, 1107, '89-012-54');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('27-05-2024 10:30:00', 'dd-mm-yyyy hh24:mi:ss'), 9, 1108, '90-123-65');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('28-05-2024 14:15:00', 'dd-mm-yyyy hh24:mi:ss'), 11, 1109, '01-234-76');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('29-05-2024 08:45:00', 'dd-mm-yyyy hh24:mi:ss'), 6, 1110, '12-345-78');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('30-05-2024 11:20:00', 'dd-mm-yyyy hh24:mi:ss'), 10, 1111, '23-456-89');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('31-05-2024 13:50:00', 'dd-mm-yyyy hh24:mi:ss'), 6, 1112, '34-567-00');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('01-06-2024 09:25:00', 'dd-mm-yyyy hh24:mi:ss'), 6, 1113, '45-678-11');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('02-06-2024 12:10:00', 'dd-mm-yyyy hh24:mi:ss'), 9, 1114, '56-789-22');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('03-06-2024 15:40:00', 'dd-mm-yyyy hh24:mi:ss'), 9, 1115, '67-890-33');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('04-06-2024 08:55:00', 'dd-mm-yyyy hh24:mi:ss'), 8, 1116, '78-901-44');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('05-06-2024 10:35:00', 'dd-mm-yyyy hh24:mi:ss'), 9, 1117, '89-012-55');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('06-06-2024 14:00:00', 'dd-mm-yyyy hh24:mi:ss'), 12, 1118, '90-123-66');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('07-06-2024 09:15:00', 'dd-mm-yyyy hh24:mi:ss'), 10, 1119, '01-234-77');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('08-06-2024 11:45:00', 'dd-mm-yyyy hh24:mi:ss'), 10, 1120, '12-345-79');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('09-06-2024 13:30:00', 'dd-mm-yyyy hh24:mi:ss'), 12, 1121, '23-456-90');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('10-06-2024 08:20:00', 'dd-mm-yyyy hh24:mi:ss'), 9, 1122, '34-567-01');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('11-06-2024 10:10:00', 'dd-mm-yyyy hh24:mi:ss'), 5, 1123, '45-678-12');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('12-06-2024 14:50:00', 'dd-mm-yyyy hh24:mi:ss'), 7, 1124, '56-789-23');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('13-06-2024 08:30:00', 'dd-mm-yyyy hh24:mi:ss'), 11, 1125, '67-890-34');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('14-06-2024 12:25:00', 'dd-mm-yyyy hh24:mi:ss'), 10, 1126, '78-901-45');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('15-06-2024 15:15:00', 'dd-mm-yyyy hh24:mi:ss'), 8, 1127, '89-012-56');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('16-06-2024 08:40:00', 'dd-mm-yyyy hh24:mi:ss'), 6, 1128, '90-123-67');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('17-06-2024 11:55:00', 'dd-mm-yyyy hh24:mi:ss'), 5, 1129, '01-234-78');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('18-06-2024 14:45:00', 'dd-mm-yyyy hh24:mi:ss'), 12, 1130, '12-345-80');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('19-06-2024 09:05:00', 'dd-mm-yyyy hh24:mi:ss'), 12, 1131, '23-456-91');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('20-06-2024 10:50:00', 'dd-mm-yyyy hh24:mi:ss'), 5, 1132, '34-567-02');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('21-06-2024 13:20:00', 'dd-mm-yyyy hh24:mi:ss'), 11, 1133, '45-678-13');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('22-06-2024 08:15:00', 'dd-mm-yyyy hh24:mi:ss'), 12, 1134, '56-789-24');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('23-06-2024 11:30:00', 'dd-mm-yyyy hh24:mi:ss'), 8, 1135, '67-890-35');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('24-06-2024 14:35:00', 'dd-mm-yyyy hh24:mi:ss'), 7, 1136, '78-901-46');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('25-06-2024 09:40:00', 'dd-mm-yyyy hh24:mi:ss'), 11, 1137, '89-012-57');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('26-06-2024 10:20:00', 'dd-mm-yyyy hh24:mi:ss'), 11, 1138, '90-123-68');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('27-06-2024 14:10:00', 'dd-mm-yyyy hh24:mi:ss'), 5, 1139, '01-234-79');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('28-06-2024 08:50:00', 'dd-mm-yyyy hh24:mi:ss'), 6, 1140, '12-345-81');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('29-06-2024 12:45:00', 'dd-mm-yyyy hh24:mi:ss'), 9, 1141, '23-456-92');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('30-06-2024 15:25:00', 'dd-mm-yyyy hh24:mi:ss'), 12, 1142, '34-567-03');
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
values (to_date('07-07-2024 08:10:00', 'dd-mm-yyyy hh24:mi:ss'), 11, 1149, '01-234-80');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('08-07-2024 11:40:00', 'dd-mm-yyyy hh24:mi:ss'), 11, 1150, '12-345-82');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('09-07-2024 13:15:00', 'dd-mm-yyyy hh24:mi:ss'), 11, 1151, '23-456-93');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('10-07-2024 09:25:00', 'dd-mm-yyyy hh24:mi:ss'), 8, 1152, '34-567-04');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('11-07-2024 10:55:00', 'dd-mm-yyyy hh24:mi:ss'), 8, 1153, '45-678-15');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('12-07-2024 14:45:00', 'dd-mm-yyyy hh24:mi:ss'), 11, 1154, '56-789-26');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('13-07-2024 08:30:00', 'dd-mm-yyyy hh24:mi:ss'), 6, 1155, '67-890-37');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('14-07-2024 11:20:00', 'dd-mm-yyyy hh24:mi:ss'), 11, 1156, '78-901-48');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('15-07-2024 15:10:00', 'dd-mm-yyyy hh24:mi:ss'), 11, 1157, '89-012-59');
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
values (to_date('28-07-2024 09:25:00', 'dd-mm-yyyy hh24:mi:ss'), 7, 1170, '12-345-84');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('29-07-2024 10:15:00', 'dd-mm-yyyy hh24:mi:ss'), 7, 1171, '23-456-95');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('30-07-2024 14:00:00', 'dd-mm-yyyy hh24:mi:ss'), 6, 1172, '34-567-06');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('31-07-2024 08:05:00', 'dd-mm-yyyy hh24:mi:ss'), 8, 1173, '45-678-17');
insert into TRAVELPAYMENT (traveltime, travelcost, idticket, licensenumber)
values (to_date('01-08-2024 11:30:00', 'dd-mm-yyyy hh24:mi:ss'), 7, 1174, '56-789-28');
commit;
prompt 175 records loaded
prompt Enabling foreign key constraints for BUSDRIVER...
alter table BUSDRIVER enable constraint SYS_C007812;
alter table BUSDRIVER enable constraint SYS_C007813;
prompt Enabling foreign key constraints for BUSRIDE...
alter table BUSRIDE enable constraint SYS_C007825;
alter table BUSRIDE enable constraint SYS_C007826;
prompt Enabling foreign key constraints for STATIONTOBUS...
alter table STATIONTOBUS enable constraint SYS_C007742;
prompt Enabling foreign key constraints for TRAVELPAYMENT...
alter table TRAVELPAYMENT enable constraint SYS_C007819;
alter table TRAVELPAYMENT enable constraint SYS_C007820;
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
prompt Enabling triggers for PASSENGER...
alter table PASSENGER enable all triggers;
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
