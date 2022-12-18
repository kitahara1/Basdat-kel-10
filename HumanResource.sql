-- Buat Database
CREATE DATABASE IF NOT EXISTS humanresource;
USE humanresource;

-- Tabel Employee
CREATE TABLE IF NOT EXISTS employees(
    employee_id int(10) NOT NULL AUTO_INCREMENT,
    employee_nik varchar(16) NOT NULL,
    employee_name varchar(255) NOT NULL,
    employee_gender char(1) NOT NULL,
    employee_birthplace varchar(255) NOT NULL,
    employee_birthdate date NOT NULL,
    employee_address varchar(255) NOT NULL,
    employee_phonenumber varchar(255) NOT NULL,
    employee_joindate date NOT NULL,
    PRIMARY KEY(employee_id)
);

-- Tabel Position
CREATE TABLE IF NOT EXISTS positions(
    position_id int(10) NOT NULL AUTO_INCREMENT,
    position_name varchar(255) NOT NULL,
    position_level int(1) NOT NULL,
    position_parent int(10),
    PRIMARY KEY(position_id),
    FOREIGN KEY(position_parent) REFERENCES positions(position_id)
);

-- Tabel Department
CREATE TABLE IF NOT EXISTS departments(
    department_id int(10) NOT NULL AUTO_INCREMENT,
    department_name varchar(255) NOT NULL,
    PRIMARY KEY(department_id)
);

-- Tabel Employee Position
CREATE TABLE IF NOT EXISTS employee_position(
    employee_position_id int(10) NOT NULL AUTO_INCREMENT,
    employee_id int(10) NOT NULL,
    department_id int(10) NOT NULL,
    position_id int(10) NOT NULL,
    supervisor_id int(10) NOT NULL,
    PRIMARY KEY(employee_position_id),
    FOREIGN KEY(employee_id) REFERENCES employees(employee_id),
    FOREIGN KEY(department_id) REFERENCES departments(department_id),
    FOREIGN KEY(position_id) REFERENCES positions(position_id),
    FOREIGN KEY(supervisor_id) REFERENCES employees(employee_id)
);

-- Tabel Salary Component
CREATE TABLE IF NOT EXISTS salary_components(
    salary_component_id int(10) NOT NULL AUTO_INCREMENT,
    salary_component_name varchar(255) NOT NULL,
    salary_component_type varchar(255) NOT NULL,
    PRIMARY KEY(salary_component_id)
);

-- Tabel Additional Salary
CREATE TABLE IF NOT EXISTS additional_salaries(
    additional_salary_id int(10) NOT NULL AUTO_INCREMENT,
    employee_id int(10) NOT NULL,
    salary_component_id int(10) NOT NULL,
    additional_salary_period int(2) NOT NULL,
    additional_salary_amount bigint(255) NOT NULL,
    PRIMARY KEY(additional_salary_id),
    FOREIGN KEY(employee_id) REFERENCES employees(employee_id),
    FOREIGN KEY(salary_component_id) REFERENCES salary_components(salary_component_id)
);

-- Tabel Salary Employee
CREATE TABLE IF NOT EXISTS salary_employees(
    salary_employee_id int(10) NOT NULL AUTO_INCREMENT,
    employee_id int(10) NOT NULL,
    salary_component_id int(10) NOT NULL,
    salary_employee_amount bigint(255) NOT NULL,
    PRIMARY KEY(salary_employee_id),
    FOREIGN KEY(employee_id) REFERENCES employees(employee_id),
    FOREIGN KEY(salary_component_id) REFERENCES salary_components(salary_component_id)
); 

-- Tabel Payroll
CREATE TABLE IF NOT EXISTS payrolls(
    payroll_id int(10) NOT NULL AUTO_INCREMENT,
    payroll_period int(2) NOT NULL,
    PRIMARY KEY(payroll_id)
);

-- Tabel Payroll Detail
CREATE TABLE IF NOT EXISTS payroll_details(
    payroll_detail_id int(10) NOT NULL AUTO_INCREMENT,
    payroll_id int(10) NOT NULL,
    employee_id int(10) NOT NULL,
    salary_component_id int(10) NOT NULL,
    amount bigint(255) NOT NULL,
    PRIMARY KEY(payroll_detail_id),
    FOREIGN KEY(payroll_id) REFERENCES payrolls(payroll_id),
    FOREIGN KEY(employee_id) REFERENCES employees(employee_id),
    FOREIGN KEY(salary_component_id) REFERENCES salary_components(salary_component_id)
);