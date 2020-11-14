CREATE TABLE student (
student_id Decimal(12)PRIMARY KEY, 
student_name VARCHAR(32),
student_surname VARCHAR(32),
stud_gender VARCHAR(6),
stud_phone_number Decimal(12),
stud_birthday DATE,
city VARCHAR(32) 
);

CREATE TABLE teacher (
teacher_id Decimal(12) PRIMARY KEY,
teacher_name VARCHAR(32),
teacher_surname VARCHAR(32),
gender VARCHAR(6),
birthday DATE
);

CREATE TABLE group_ (
group_name VARCHAR(32) PRIMARY KEY,
head VARCHAR(32), 
student_id Decimal(12),
FOREIGN KEY(student_id) REFERENCES student(student_id)
);


CREATE TABLE course (
course_name VARCHAR(32) PRIMARY KEY,
course_day VARCHAR(32),
course_time VARCHAR(5),
teacher_id Decimal(12),
group_name VARCHAR(32),
FOREIGN KEY(teacher_id) REFERENCES teacher(teacher_id),
FOREIGN KEY (group_name)REFERENCES group_(group_name)
);

CREATE TABLE faculty (
faculty_id Decimal(12),
faculty_name VARCHAR(32) PRIMARY KEY,
group_name VARCHAR(32),
FOREIGN KEY (group_name)REFERENCES group_(group_name)
);


ALTER TABLE faculty DROP CONSTRAINT faculty_pkey;
ALTER TABLE faculty ADD CONSTRAINT faculty_pkey PRIMARY KEY (faculty_id);


CREATE TABLE auditory (
campus_name VARCHAR(32),
auditory_number Decimal(12),
floor Decimal (2),
course_name VARCHAR(32),
FOREIGN KEY (course_name)REFERENCES course(course_name)
);

CREATE TABLE club (
club_name VARCHAR(32) PRIMARY KEY,
descripton TEXT,
leader VARCHAR(32),
student_id Decimal(12),
FOREIGN KEY (student_id) REFERENCES student(student_id)
);

CREATE TABLE campus (
campus_name VARCHAR(32),
location TEXT
);

ALTER TABLE campus ALTER COLUMN location SET DATA TYPE VARCHAR(32); 

CREATE TABLE meeting (
meeting_date DATE,
meeting_time VARCHAR(5),
meeting_place VARCHAR(32),
group_name VARCHAR(32),
PRIMARY KEY(meeting_date, meeting_time, meeting_place),
FOREIGN KEY(group_name) REFERENCES group_(group_name)
);

CREATE TABLE platonus(
login VARCHAR(32) PRIMARY KEY,
password varchar(64),
student_id Decimal(12),
FOREIGN KEY (student_id) REFERENCES student(student_id)
);

ALTER TABLE platonus DROP COLUMN password;
ALTER TABLE platonus ADD COLUMN grades Decimal(5);