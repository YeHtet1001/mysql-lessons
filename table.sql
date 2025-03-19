--create department table 
create table department(
 id int not null primary key auto_increment,
 department varchar(255) not null,
 floor int not null ,
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 modifid_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP on UPDATE CURRENT_TIMESTAMP
 );
--for example
INSERT INTO department (department, floor) VALUES ('HR', 1);
INSERT INTO department (department, floor) VALUES ('IT', 3);
INSERT INTO department (department, floor) VALUES ('Sale', 2);
 
 
--create employee table
create table employee(
id int not null PRIMARY KEY AUTO_INCREMENT,
name varchar(100) not null,
phone varchar(13) not null,
salary DECIMAL(10,2) not null,
email varchar(100),
department_id int,
start_date DATE DEFAULT (CURRENT_DATE),
CONSTRAINT fk_department FOREIGN KEY(department_id) REFERENCES department(id) on DELETE set null
);
--for example
INSERT INTO employee (name, phone, salary, email, department_id, start_date) VALUES ('John Doe', '123-456-7890', 50000.00, 'john.doe@example.com', 1, '2023-01-15');
INSERT INTO employee (name, phone, salary, email, department_id, start_date) VALUES ('Jane Smith', '234-567-8901', 60000.00, 'jane.smith@example.com', 2, '2023-02-20');
INSERT INTO employee (name, phone, salary, email, department_id, start_date) VALUES ('Alice Johnson', '345-678-9012', 55000.00, 'alice.johnson@example.com', 3, '2023-03-10');
INSERT INTO employee (name, phone, salary, email, department_id, start_date) VALUES ('Bob Brown', '456-789-0123', 70000.00, 'bob.brown@example.com', 1, '2023-04-05');
INSERT INTO employee (name, phone, salary, email, department_id, start_date) VALUES ('Charlie Davis', '567-890-1234', 65000.00, 'charlie.davis@example.com', 2, '2023-05-12');
INSERT INTO employee (name, phone, salary, email, department_id, start_date) VALUES ('Eva Wilson', '678-901-2345', 75000.00, 'eva.wilson@example.com', 3, '2023-06-18');
INSERT INTO employee (name, phone, salary, email, department_id, start_date) VALUES ('Frank Miller', '789-012-3456', 80000.00, 'frank.miller@example.com', 1, '2023-07-22');
INSERT INTO employee (name, phone, salary, email, department_id, start_date) VALUES ('Grace Lee', '890-123-4567', 58000.00, 'grace.lee@example.com', 2, '2023-08-30');
INSERT INTO employee (name, phone, salary, email, department_id, start_date) VALUES 'Henry Garcia', '901-234-5678', 72000.00, 'henry.garcia@example.com', 3, '2023-09-14');
INSERT INTO employee (name, phone, salary, email, department_id, start_date) VALUES ('Ivy Martinez', '012-345-6789', 68000.00, 'ivy.martinez@example.com', 1, '2023-10-25');



create table attendance(
	id int not null auto_increment PRIMARY Key,
	emp_id int not null,
	dep_id int not null,
	attendance_date DATE DEFAULT (CURRENT_DATE),
	status enum('Present','Absent','Leave') not null,
	FOREIGN KEY(emp_id) REFERENCES employee(id) on DELETE CASCADE,
	FOREIGN KEY(dep_id) REFERENCES department(id) on DELETE CASCADE
)
--for example
insert into attendance ( emp_id , dep_id ,status) VALUES ( 1 , 1 , 1);
insert into attendance ( emp_id , dep_id , attendance_date ,status) VALUES ( 1 , 1, '2025-03-20',2);
insert into attendance ( emp_id , dep_id , attendance_date ,status) VALUES ( 1 , 1, '2025-03-21',3);
insert into attendance ( emp_id , dep_id , attendance_date ,status) VALUES ( 1 , 1, '2025-03-22',1);