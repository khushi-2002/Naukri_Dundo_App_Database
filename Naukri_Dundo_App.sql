create database Naukri_App;

use Naukri_App;

create table User_Details(
User_id bigint,
User_name varchar(255),
User_email varchar(255),
User_contactNo varchar(255),
User_age int,
User_gender varchar(20),
primary key (User_id));

create table Student_Details(
Student_id bigint,
Student_careerchoice varchar(25),
User_id bigint,
primary key (Student_id),
foreign key (User_id) references User_Details(User_id) on delete cascade
);

create table Education_Details(
Education_id bigint,
College_or_School varchar(255),
Level_Of_education varchar(20),
Degree varchar(20),
University_or_Board varchar(255),
primary key(Education_id)
);

create table Student_Education(
Student_id bigint,
Education_id bigint,
Start_date date,
End_date date,
Grade varchar(20),
primary key(Student_id,Education_id),
foreign key (Student_id) references Student_Details(Student_id) on delete cascade,
foreign key (Education_id) references Education_Details(Education_id) on delete cascade
);

create table Skills(
Skill_id bigint,
Skill_name varchar(60),
primary key (Skill_id)
);

create table Student_Skills(
Student_id bigint,
Skill_id bigint,
Experience_years int,
foreign key (Student_id) references Student_Details(Student_id) on delete cascade,
foreign key (Skill_id) references Skills(Skill_id) on delete cascade,
primary key (Student_id,Skill_id)
);

create table Companies(
Company_id bigint,
Company_namne varchar(200),
Founded_year date,
Work_location varchar(100),
No_of_employees bigint,
Company_type varchar(200),
Current_Ceo varchar(255),
primary key (Company_id)
);

create table Job_Postings(
Job_id bigint,
Job_location varchar(255),
Job_type    varchar(255),
Job_position varchar(255),
Company_id   bigint,
Job_posted   date,
Job_last_date  date,
primary key (job_id),
foreign key (Company_id) references Companies(Company_id) on delete cascade
);

create table Student_Job_Application(
Application_id bigint,
Student_id bigint,
Job_id bigint,
Applied_on Date,
Application_status varchar(200),
foreign key (Student_id) references Student_Details(Student_id) on delete cascade,
foreign key (Job_id) references Job_Postings(Job_id) on delete cascade,
primary key(Application_id)
);

create table Consultants(
Consultant_id bigint,
User_id bigint,
Expertise varchar(200),
Year_of_Experience int,
primary key (Consultant_id),
foreign key (User_id) references User_Details(User_id) on delete cascade
);

create table Websites(
Website_id bigint,
Website_name varchar(200),
Website_URL varchar(200),
primary key (Website_id)
);

create table Job_Websites(
Website_id bigint,
Job_id bigint,
foreign key (Website_id) references Websites(Website_id) on delete cascade,
foreign key (Job_id) references Job_Postings(Job_id) on delete cascade,
primary key (Website_id,Job_id)
);

create table Student_Consultant_Appointment(
Appointment_id bigint,
Student_id bigint,
Consultant_id bigint,
Appointment_request_date date,
Appointment_status varchar(200),
primary key (Appointment_id),
foreign key (Student_id) references Student_Details(Student_id) on delete cascade,
foreign key (Consultant_id) references Consultants(Consultant_id) on delete cascade
);

create table Student_Reporters(
Reporter_id bigint,
User_id bigint,
primary key(Reporter_id),
foreign key (User_id) references User_Details(User_id) on delete cascade
);

create table Administrators(
Admin_id bigint,
User_id bigint,
primary key(Admin_id),
foreign key (User_id) references User_Details(User_id) on delete cascade
);

create table Permission_Status(
Permission_id bigint,
Admin_id bigint,
Reporter_id bigint,
Permission varchar(200),
primary key (Permission_id),
foreign key (Admin_id) references Administrators(Admin_id) on delete cascade,
foreign key (Reporter_id) references Student_Reporters(Reporter_id) on delete cascade
);

insert into User_Details VALUES(1,'Khushi', 'khushiagarwal915@gmail.com','8006151511',20,'Female');
insert into User_Details VALUES(2,'Pallavi', 'abcd@gmail.com','8006568729',21,'Female');
insert into User_Details VALUES(3,'Muskan', 'wajkdjl@gmail.com','8002356267',21,'Female');
insert into User_Details VALUES(4,'Pankaj', 'pankaj@gmail.com','8273823922',50,'Male');
insert into User_Details VALUES(5,'preeto', 'preeto@gmail.com','6344232212',24,'Female');
insert into User_Details VALUES(6,'Rakesh', 'rakesh@gmail.com','8443423212',23,'Male');
insert into User_Details VALUES(7,'Rajul', 'rajulgarg007@gmail.com','7839283392',21,'Female');
insert into User_Details VALUES(8,'Kumari', 'kumari001@gmail.com','7938090921',20,'Female');
insert into User_Details VALUES(9,'Piyush', 'piyush123@gmail.com','9876545221',34,'Male');
insert into User_Details VALUES(10,'Yogesh', 'yogesh12390@gmail.com','9092303902',41,'Female');
insert into User_Details VALUES(11,'Poonam', 'pponam12@gmail.com','8006131221',20,'Female');
insert into User_Details VALUES(12,'Yumo','yumi02@gmail.com','7292829821',34,'Female');

insert into Student_Details VALUES (1, 'Software Developer', 1);
insert into Student_Details VALUES (2, 'Android Developer', 6);
insert into Student_Details VALUES (3, 'Java Developer', 5);
insert into Student_Details VALUES (4, 'Sales Manager', 3);
insert into Student_Details VALUES (5, 'C++ Developer', 7);

insert into Education_Details VALUES (1, 'Dayalbagh Educational Institute', 'Bachelors', 'B.Tech', 'Dayalbagh Board');
insert into Education_Details VALUES (2, 'Gauri Public School', 'Intermediate', 'PCB', 'CBSE');
insert into Education_Details VALUES (3, 'Maharani public School', 'Intermediate', 'PCB', 'CBSE');
insert into Education_Details VALUES (4, 'PK Institution', 'Bachelors', 'B.Sc', 'CBSE');
insert into Education_Details VALUES (5, 'Thapa University', 'Bachelors', 'B.Tech', 'AKTU');
insert into Education_Details VALUES (6, 'Banastali Vidyapith', 'Bachelors', 'B.Tech', 'Banastali');

insert into Student_Education VALUES (1, 1, '2019-12-19', '2022-05-20', 90);
insert into Student_Education VALUES (1, 3, '2018-12-19', '2019-03-12', 91);
insert into Student_Education VALUES (2, 5, '2018-02-26', '2019-05-12', 67);
insert into Student_Education VALUES (3, 6, '2019-12-12', '2022-03-12', 76);

insert into Skills VALUES (1, 'Java');
insert into Skills VALUES (2, 'C++');
insert into Skills VALUES (3, 'SQL');
insert into Skills VALUES (4, '.Net');
insert into Skills VALUES (5, 'Python');

insert into Student_Skills VALUES(1,1,2);
insert into Student_Skills VALUES(1,2,1);
insert into Student_Skills VALUES(2,1,3);
insert into Student_Skills VALUES(2,4,2);
insert into Student_Skills VALUES(3,5,1);
insert into Student_Skills VALUES(4,1,3);
insert into Student_Skills VALUES(4,5,1);
insert into Student_Skills VALUES(5,2,1);


insert into Companies  VALUES (1, 'Microsoft Corporation', '1940-02-20', 'New Delhi', 200000, 'Product Based', 'Satya Nadella');
insert into Companies  VALUES (2, 'ABC limited', '1870-08-23', 'Ahemdabad', 200, 'Startup', 'Pankaj Narola');
insert into Companies  VALUES (3, 'Mit Limited', '1900-08-30', 'Bangalore', 126, 'Service Based', 'Pallavi Kurashi');
insert into Companies  VALUES (4, 'Poi Cooperation', '2000-01-31', 'Pune', 200, 'ML Based', 'Kriti Saxena');
insert into Companies  VALUES (5, 'Umang Kurashi', '1900-01-21', 'Pune', 60, 'IT based', 'Pooja Goyal');

insert into Job_Postings VALUES(1,'Bengalore','Full time','Data Scientist',1,'2022-02-23','2022-02-21');
insert into Job_Postings VALUES(2,'Chennai','Full time','Android Developer',1,'2022-02-23','2022-03-04');
insert into Job_Postings VALUES(3,'Pune','Part time','C++ Developer',2,'2022-02-21','2022-03-02');
insert into Job_Postings VALUES(4,'Agra','Full time','Software Testing',3,'2022-02-21','2022-03-02');


insert into Student_Job_Application VALUES (1, 1, 1, '2022-03-02', 'Under Review');
insert into Student_Job_Application VALUES (2, 1, 2, '2022-03-02', 'Under Review');
insert into Student_Job_Application VALUES (3, 2, 2, '2022-03-02', 'Under Review');
insert into Student_Job_Application VALUES (4, 2, 4, '2022-02-01', 'Selected');
insert into Student_Job_Application VALUES (5, 3, 1, '2022-03-02', 'Under Review');
insert into Student_Job_Application VALUES (6, 4, 3, '2022-03-06', 'Rejected');
insert into Student_Job_Application VALUES (7, 4, 2, '2022-03-02', 'Under Review');

insert into Consultants VALUES (1,2,'Software Developer',20);
insert into Consultants VALUES (2,4,'Android Developer',15);
insert into Consultants VALUES (3,9,'Java Developer',23);

insert into Websites VALUES (1,'Apki talash','www.apkitalassh.com');
insert into Websites VALUES (2,'Naukri Apni','www.naukariapni.com');
insert into Websites VALUES (3,'Job Dundo','www.jobdundo.com');
insert into Websites VALUES (4,'Job Careers','www.jobcareers.com');


insert into Job_Websites VALUES (1,1);
insert into Job_Websites VALUES (2,1);
insert into Job_Websites VALUES (3,1);
insert into Job_Websites VALUES (1,2);
insert into Job_Websites VALUES (3,2);
insert into Job_Websites VALUES (2,3);

insert into Student_Consultant_Appointment VALUES (1,1,1,'2022-02-21','Under Progress');
insert into Student_Consultant_Appointment VALUES (2,2,1,'2022-02-21','Fixed');
insert into Student_Consultant_Appointment VALUES (3,3,2,'2022-02-21','Under Progress');
insert into Student_Consultant_Appointment VALUES (4,4,2,'2022-02-21','Under Progress');

insert into Student_Reporters VALUES (1,3);
insert into Student_Reporters VALUES (2,7);

insert into Administrators VALUES (1,10);
insert into Administrators VALUES (2,11);
insert into Administrators VALUES (3,12);

insert into Permission_Status VALUES (1,1,1,'Under Review');
insert into Permission_Status VALUES (2,1,2,'Confirmed');
insert into Permission_Status VALUES (3,2,2,'Under Review');
insert into Permission_Status VALUES (4,3,1,'Rejected');










