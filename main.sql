/*Creating the necessary tables for the agency*/
/* We have added constarints on Foriegn Keys to accomodate changes in the future */

create table users_data(aadharid number primary key,name varchar(20),isManager varchar(5),isAdmin varchar(5),door number,street varchar(20),city varchar(20),state varchar(20),pincode number,DOB date,username varchar(20),password varchar(20),tenant_flag varchar(5),owner_flag varchar(5));

create table phone(AadharID number,Phone_No number,primary key(AadharID,PHone_No));
alter table phone add constraint fk foreign key (aadharID) references users_data(aadharID);

create table property(propertyID number primary key,Available_from date,Available_till date, total_area number,Plinth_area number,floors number,construction_year number,locality varchar(20),plot_no varchar(10),street varchar(20),city varchar(20),state varchar(20),pincode number,other_facilities varchar(20),owner_aadhar number, isCommercial varchar(5));
alter table property add constraint fkowner foreign key(owner_aadhar) references users_data(aadharID);

create table residential_property(propertyID number primary key,BHK number);
alter table residential_property add constraint propCons foreign key(propertyID) references property(propertyID);

create table rents(propertyID number,startdate date,tenant_aadhar number,rent number,hike number,agency_commission number, end_date date,primary key(propertyID,startdate,tenant_aadhar));
alter table rents add constraint fkey foreign key(propertyID) references property(propertyID);
alter table rents add constraint fkeytenant foreign key(tenant_aadhar) references users_data(aadharID);

/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

/* Inserting data into the the tables */

INSERT INTO users_data VALUES(123456789012,'John Doe','No','Yes',10,'Main Street','New York','NY',10001,'17-DEC-80','johndoe','password123','No','Yes');
INSERT INTO users_data VALUES(234567890123, 'Jane Smith', 'Yes', 'No', 20, 'Second Avenue', 'San Francisco', 'CA', 94105, '20-FEB-81', 'janesmith', 'password456','Yes', 'No');
INSERT INTO users_data VALUES(345678901234, 'Bob Johnson', 'No', 'No', 30, 'Third Street', 'Los Angeles', 'CA', 90001, '22-FEB-81', 'bobjohnson', 'password789', 'No', 'No');
INSERT INTO users_data VALUES(456789012345, 'Mary Brown', 'Yes', 'Yes', 40, 'Fourth Road', 'Chicago', 'IL', 60601, '02-APR-81', 'marybrown', 'passwordabc', 'Yes', 'Yes');
INSERT INTO users_data VALUES(567890123456, 'Tom Wilson', 'No', 'Yes', 50, 'Fifth Avenue', 'Boston', 'MA', 02108, '28-SEP-81', 'tomwilson', 'passworddef', 'No', 'Yes');
INSERT INTO users_data VALUES(678901234567, 'Sarah Lee', 'Yes', 'No', 60, 'Sixth Street', 'Seattle', 'WA', 98101, '01-MAY-81', 'sarahlee', 'passwordghi', 'Yes', 'No');
INSERT INTO users_data VALUES(789012345678, 'Mike Davis', 'No', 'No', 70, 'Seventh Boulevard', 'Houston', 'TX', 77002, '09-JUN-81', 'mikedavis', 'passwordjkl', 'No', 'No');
INSERT INTO users_data VALUES(890123456789, 'Kelly Green', 'Yes', 'Yes', 80, 'Eighth Avenue', 'Miami', 'FL', 33130, '19-APR-87', 'kellygreen', 'passwordmno', 'Yes', 'Yes');
INSERT INTO users_data VALUES(901234567890, 'Chris Brown', 'No', 'Yes', 90, 'Ninth Street', 'Philadelphia', 'PA', 19102, '08-SEP-81', 'chrisbrown', 'passwordpqr', 'No', 'Yes');
INSERT INTO users_data VALUES(123123123123, 'Jennifer Kim', 'Yes', 'No', 100, 'Tenth Road', 'Atlanta', 'GA', 30303, '23-MAY-87', 'jenniferkim', 'passwordstu', 'Yes', 'No');
INSERT INTO users_data VALUES(234234234234, 'David Chen', 'No', 'No', 110, 'Eleventh Street', 'Denver', 'CO', 80202, '03-DEC-81', 'davidchen', 'passwordvwx', 'No', 'No');
INSERT INTO users_data VALUES(345345345345, 'Jessica Lee', 'Yes', 'Yes', 120, 'Twelfth Boulevard', 'Dallas', 'TX', 75201, '03-DEC-81', 'jessicalee', 'passwordyz1','No', 'No');

INSERT INTO phone VALUES(123456789012, 9876543210);
INSERT INTO phone VALUES(123456789012, 9988776655);
INSERT INTO phone VALUES(234567890123, 8765432109);
INSERT INTO phone VALUES(234567890123, 8877665544);
INSERT INTO phone VALUES(345678901234, 7654321098);
INSERT INTO phone VALUES(345678901234, 7766554433);
INSERT INTO phone VALUES(456789012345, 6543210987);
INSERT INTO phone VALUES(456789012345, 6655443322);
INSERT INTO phone VALUES(567890123456, 5432109876);
INSERT INTO phone VALUES(567890123456, 5544332211);
INSERT INTO phone VALUES(678901234567, 4321098765);
INSERT INTO phone VALUES(678901234567, 4433221100);
INSERT INTO phone VALUES(789012345678, 3210987654);
INSERT INTO phone VALUES(789012345678, 3322110099);
INSERT INTO phone VALUES(890123456789, 2109876543);
INSERT INTO phone VALUES(890123456789, 2211009988);
INSERT INTO phone VALUES(901234567890, 1098765432);
INSERT INTO phone VALUES(901234567890, 1100998877);
INSERT INTO phone VALUES(123123123123, 9876543211);
INSERT INTO phone VALUES(234234234234, 8765432110);
INSERT INTO phone VALUES(345345345345, 7654321109);

INSERT INTO property VALUES (1234,'15-JAN-2013','15-APR-2027', 1000, 900, 5, 2010, 'New York', 'A1', 'Lexington', 'New York', 'NY', 10001, 'Gym', 123456789012, 'true');
INSERT INTO property VALUES (3357,'01-DEC-2013','30-JUN-2024', 800, 700, 3, 2005, 'San Francisco', 'B2', 'Lombard', 'San Francisco', 'CA', 94133, 'Pool', 456789012345, 'true');
INSERT INTO property VALUES (5623,'05-FEB-2014','05-MAY-2024', 1200, 1000, 6, 2012, 'Los Angeles', 'C3', 'Wilshire', 'Los Angeles', 'CA', 90010, 'Tennis court', 456789012345, 'false');
INSERT INTO property VALUES (5412,'12-MAR-2012','12-JUN-2025', 1500, 1400, 7, 2010, 'Chicago', 'D4', 'Michigan', 'Chicago', 'IL', 60601, 'Clubhouse', 567890123456, 'true');
INSERT INTO property VALUES (9952,'30-MAY-2008','30-AUG-2023', 900, 800, 4, 2005, 'New York', 'E5', 'Madison', 'New York', 'NY', 10016, 'Playground', 567890123456, 'false');
INSERT INTO property VALUES (7751,'01-JAN-2013','31-DEC-2023', 1100, 1000, 5, 2012, 'San Francisco', 'F6', 'Chestnut', 'San Francisco', 'CA', 94123, 'Jogging track', 890123456789, 'true');
INSERT INTO property VALUES (8912,'01-JUL-2010','30-NOV-2023', 800, 700, 3, 2005, 'Los Angeles', 'G7', 'Sunset', 'Los Angeles', 'CA', 90026, 'Party hall', 890123456789, 'false');
INSERT INTO property VALUES (4234,'15-JAN-2013','15-APR-2017', 1000, 900, 5, 2010, 'New York', 'A1', 'Lexington', 'New York', 'NY', 10001, 'Gym', 123456789012, 'true');
INSERT INTO property VALUES (4265,'01-DEC-2018','30-JUN-2019', 800, 700, 3, 2005, 'San Francisco', 'B2', 'Lombard', 'San Francisco', 'CA', 94133, 'Pool', 901234567890, 'true');
INSERT INTO property VALUES (5976,'05-FEB-2016','05-MAY-2021', 1200, 1000, 6, 2012, 'Los Angeles', 'C3', 'Wilshire', 'Los Angeles', 'CA', 90010, 'Tennis court', 901234567890, 'false');
INSERT INTO property VALUES (3312,'12-MAR-2018','12-JUN-2024', 1500, 1400, 7, 2010, 'Chicago', 'D4', 'Michigan', 'Chicago', 'IL', 60601, 'Clubhouse', 567890123456, 'true');
INSERT INTO property VALUES (9783,'30-MAY-2016','30-AUG-2019', 900, 800, 4, 2005, 'New York', 'E5', 'Madison', 'New York', 'NY', 10016, 'Playground', 456789012345, 'false');
INSERT INTO property VALUES (2013,'01-JAN-2015','01-DEC-2025', 1100, 1000, 5, 2012, 'San Francisco', 'F6', 'Chestnut', 'San Francisco', 'CA', 94123, 'Jogging track', 890123456789, 'true');
INSERT INTO property VALUES (2016,'01-JUL-2015','31-DEC-2025', 800, 700, 3, 2005, 'Los Angeles', 'G7', 'Sunset', 'Los Angeles', 'CA', 90026, 'Party hall', 123456789012, 'false')

insert into residential_property values(5976,3);
insert into residential_property values(9783,3);
insert into residential_property values(5623,2);
insert into residential_property values(2016,2);
insert into residential_property values(9952,3);
insert into residential_property values(8912,2);

INSERT INTO rents VALUES (1234, '22-JAN-2017', 234567890123, 8000, 500, 1000, '16-FEB-2019');
INSERT INTO rents VALUES (5412, '21-JAN-2019', 456789012345, 10000, 600, 9000, '16-MAR-2021');
INSERT INTO rents VALUES (1234, '12-MAR-2019', 678901234567, 10000, 500, 1200, '13-MAR-2023');
INSERT INTO rents VALUES (3357, '02-AUG-2016', 890123456789, 5500, 200, 600, '05-AUG-2019');
INSERT INTO rents VALUES (8912, '15-MAY-2015', 678901234567, 7500, 300, 900, '25-NOV-2018');
INSERT INTO rents VALUES (9952, '08-NOV-2017', 123123123123, 10000, 500, 1100, '25-DEC-2019');
INSERT INTO rents VALUES (7751, '05-MAY-2013', 234567890123, 8000, 300, 800, '08-NOV-2015');
INSERT INTO rents VALUES (3357, '17-SEP-2020', 123123123123, 7000, 300, 900, '21-DEC-2021');
INSERT INTO rents VALUES (5623, '10-JUL-2014', 456789012345, 8000, 500, 1000, '13-AUG-2018');
INSERT INTO rents VALUES (5623, '18-NOV-2019', 234567890123, 9000, 400, 1000, '30-NOV-2022');


update property set isCommercial = 'Yes' where isCommercial = 'true';
update property set isCommercial = 'No' where isCommercial = 'false';

/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

/* Creating Stored procedures for implementing functionalities */

/* 1.To get rent history of a particular property Record*/
create or replace procedure getRentHistory(pid in number) as
start_date date;
enddate date;
tenantID number;
cursor c1 is select startdate, end_date, tenant_aadhar from rents where propertyID = pid;
begin
open c1;
loop
fetch c1 into start_date, enddate, tenantID;
exit when c1%notfound;
dbms_output.put_line('----------------');
dbms_output.put_line('Start Date: '||start_date );
dbms_output.put_line('End Date: '||enddate );
dbms_output.put_line('Tenant Aadhar: '||tenantID);
end loop;
close c1;
end;
/

/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

/* 2.To Insert a Property record */
create or replace procedure InsertPropertyRecord(PropId in number,start_ in date,end_ in date,totalArea in number,plinthArea in number,floors in number,yoc in number,locality in varchar2,plot in varchar2,street in varchar2,city in varchar2,state in varchar2, pinCode in number,otherFacilities in varchar2,ownerAadhar in number, isCommercial in varchar2) as
isOwner varchar2(10);
mgr_flag varchar2(5);
begin
select owner_flag, isManager into isOwner, mgr_flag from users_data where aadharid = ownerAadhar;
if isOwner = 'Yes'  OR mgr_flag = 'Yes' then
insert into Property 	values(PropId,start_,end_,totalArea,plinthArea,floors,yoc,locality,plot,	street,city,state,pinCode,otherFacilities,ownerAadhar,isCommercial);
dbms_output.put_line('Tuple Inserted into Property table');
else
dbms_output.put_line('Sorry, you cannot insert record into Users table');
end if;
end;
/

/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

/* 3. To get Tenant details of a Property with given Property ID */
create or replace procedure GetTenantDetails(PropId in number) as
begin
dbms_output.put_line('Displaying details for property : '|| PropId );
FOR item IN(select * from Rents where PropertyID = PropId)
LOOP
dbms_output.put_line('Start_Date:  '|| item.startdate);
dbms_output.put_line('Tenant_Aadhar:  ' || item.tenant_aadhar);
dbms_output.put_line('Rent_per_month:  '|| item.rent);
dbms_output.put_line('Hike:  '|| item.hike);
dbms_output.put_line('Agency_Commission:  '|| item.agency_commission);
dbms_output.put_line('End_Date:  '|| item.end_date);
dbms_output.put_line('----------------');
END LOOP;
end;
/

/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

/* 4. To search for a property in a given locality */
create or replace procedure SearchPropertyForRent(local_ in varchar2) as
begin
dbms_output.put_line('Displaying details for locality/city : '|| local_);
FOR item IN(select * from Property where (city = local_ OR locality = local_) AND current_date BETWEEN Available_from And Available_till)
LOOP
dbms_output.put_line(' PropertyID: '|| item.propertyID);
dbms_output.put_line(' Available from: '|| item.Available_from ||', Available till: '|| item.Available_till);
dbms_output.put_line(' Total Area: '||item.total_area ||', Plinth Area: '|| item.Plinth_area ||', Floors: '|| item.floors );
dbms_output.put_line(' Year of Construction: '|| item.construction_year );
dbms_output.put_line(' Locality: '|| item.locality ||', Plot No: '|| item.plot_no ||', Street: '|| item.street ||', City: '|| item.city ||', State: '|| item.state ||', Pincode: '|| item.pincode );
dbms_output.put_line(' isCommercial: '|| item.isCommercial ||', Other Facilities:'||  item.other_facilities);
dbms_output.put_line('Owner_Aadhar:  ' || item.owner_aadhar);
dbms_output.put_line('---------------- ');
END LOOP;
end;
/

/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

/* 5. Get Property Records for an Owner */

create or replace procedure GetPropertyRecords(OwnerID in number) as
begin
dbms_output.put_line('Displaying the property records of the Owner : '|| OwnerID );
FOR item IN(select * from Property where owner_aadhar = OwnerID)
LOOP 
dbms_output.put_line(' PropertyID: '|| item.propertyID);
dbms_output.put_line(' Available from: '|| item.Available_from ||', Available till: '|| item.Available_till);
dbms_output.put_line(' Total Area: '||item.total_area ||', Plinth Area: '|| item.Plinth_area ||', Floors: '|| item.floors );
dbms_output.put_line(' Year of Construction: '|| item.construction_year );
dbms_output.put_line(' Locality'|| item.locality ||', Plot No: '|| item.plot_no ||', Street: '|| item.street ||', City: '|| item.city ||', State: '|| item.state ||', Pincode: '|| item.pincode );
dbms_output.put_line(' isCommercial: '|| item.isCommercial ||', Other Facilities:'||  item.other_facilities);
dbms_output.put_line('---------------- ');
END LOOP;
end;
/

dbms_output.put_line(' PropertyID: '|| item.propertyID ||'  Available from: '|| item.Available_from ||' Available till: '|| item.Available_till ||' Total Area: '||item.total_area ||' Plinth Area: '|| item.Plinth_area ||' Floors: '|| item.floors ||' Year of Construction: '|| item.construction_year ||' Locality'|| item.locality ||' Plot No: '|| item.plot_no ||' Street: '|| item.street ||' City: '|| item.city ||' State: '|| item.state ||' Pincode: '|| item.pincode ||' isCommercial: '|| item.isCommercial ||' Other Facilities'|| item.other_facilities);


/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

/* 6. Add new user to the databse */

create or replace procedure CreateNewUser(aadharid in number,name in varchar2,isManager in varchar2,isAdmin in varchar2,door in number,street in varchar2,city in varchar2,state in varchar2,pincode in number,DOB in date,username in varchar2,password in varchar2,tenant_flag in varchar2,owner_flag in varchar2) as
begin
insert into users_data values(aadharid,name,isManager,isAdmin,door,street,city,state,pincode,DOB,username,password,tenant_flag,owner_flag);
dbms_output.put_line('Tuple Inserted into User table');
end;
/

/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/



