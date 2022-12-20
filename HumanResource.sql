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
    PRIMARY KEY(position_id)
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
    department_id int(10),
    position_id int(10),
    supervisor_id int(10),
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

INSERT INTO Employees (employee_nik, employee_name, employee_gender, employee_birthplace, employee_birthdate, employee_address, employee_phonenumber, employee_joindate)
    VALUES
    ('2102972', 'Nuriansyah', 'L', 'Jakarta', '2002-03-21', 'Jl. Semanggi No. 05', '08184451', '2021-03-20'),
    ('2102973', 'Zaidan', 'L', 'Bandung', '1999-04-03', 'Jl. Rambutan No. 25C', '08723456', '2021-04-13'),
    ('2102974', 'Daffa', 'L', 'Palembang', '2000-05-12', 'Jl.Bali No. 12A', '08213675', '2021-04-09'),
    ('2102975', 'Dylee', 'L', 'Sydney', '2001-06-16', 'Jl.Belitung No. 08', '08125643', '2021-06-27'),
    ('2102976', 'Genta', 'L', 'Osaka', '1998-07-13', 'Jl.Aceh No. 41', '08123864', '2021-03-15'),
    ('2102977', 'Mackenzie', 'W', 'Tokyo', '2002-08-24', 'Jl.Tamansari No. 12', '08123556', '2021-01-19'),
    ('2102978', 'Michelle', 'W', 'Jakarta', '2000-08-09', 'Jl. Prindapan No. 24', '08927575', '2021-08-11'),
    ('2102979', 'Irene', 'W', 'Medan', '2003-01-01', 'Jl. Medan No.11', '08216535', '2021-09-23'),
    ('2102980', 'Agatha', 'W', 'Guangzhou', '2001-09-13', 'Jl. Soekarno', '08676356', '2021-10-26'),
    ('2102981', 'Azka', 'L', 'Bandung', '1999-10-06', 'Jl. Pasturi No. 33', '08978565', '2021-03-08'),
    ('2102982', 'Rafi', 'L', 'Jogja', '2002-11-27', 'Jl. Merdeka No. 21', '08123434', '2021-10-20')
;

INSERT INTO Positions (position_name, position_level, position_parent) 
    VALUES
    ('Komisaris', '1', '1'),
    ('CEO', '2', '1'),
    ('Direktur Utama', '2', '1'),
    ('Manager', '3', '3'),
    ('Karyawan', '4', '4')
;

INSERT INTO Departments (department_name) 
    VALUES 
    ('-'),
    ('Keuangan'),
    ('Marketing'),
    ('Advertising'),
    ('Produksi'),
    ('Kepegawaian'),
    ('Bagian Umum')
;

INSERT INTO employee_position (employee_id, department_id, position_id)
    VALUES
    ('1', '1', '1'),
    ('10', '1', '2'),
    ('7', '1', '3'),
    ('11', '4', '4'),
    ('2', '5', '4'),
    ('3', '6', '4'),
    ('4', '3', '4'),
    ('5', '1', '4'),
    ('6', '2', '4'),
    ('8', '5', '5'),
    ('9', '3', '5')
;

INSERT INTO salary_components (salary_component_name, salary_component_type) 
    VALUES
    ('Gaji', 'allowance'),
    ('Tunjangan Makan', 'allowance'),
    ('Tunjangan Kesehatan', 'allowance'),
    ('Tunjangan Transpotasi', 'allowance'),
    ('Paket berlangganan ListenMe', 'allowance'),
    ('Pajak Penghasilan', 'Deduction'),
    ('THR', 'allowance'),
    ('Bonus', 'allowance')
;

INSERT INTO additional_salaries (employee_id, salary_component_id, additional_salary_period, additional_salary_amount)
    VALUES
    ('3', '8', '6', '5000000'),
    ('3', '7', '5', '7500000'),
    ('4', '8', '6', '5000000'),
    ('4', '7', '5', '7500000'),
    ('5', '8', '6', '5000000'),
    ('5', '7', '5', '7500000'),
    ('6', '8', '6', '5000000'),
    ('6', '7', '5', '7500000')
;

INSERT INTO salary_employees (employee_id, salary_component_id, salary_employee_amount)
    VALUES
    ('2', '1', '15000000'),
    ('2', '2', '2000000'),
    ('2', '3', '5000000'),
    ('2', '4', '1000000'),
    ('2', '5', '500000'),
    ('2', '6', '250000'),
    ('3', '1', '15000000'),
    ('3', '2', '2000000'),
    ('3', '3', '5000000'),
    ('3', '4', '1000000'),
    ('3', '5', '500000'),
    ('3', '6', '250000'),
    ('4', '1', '15000000'),
    ('4', '2', '2000000'),
    ('4', '3', '5000000'),
    ('4', '4', '1000000'),
    ('4', '5', '500000'),
    ('4', '6', '250000'),
    ('5', '1', '15000000'),
    ('5', '2', '2000000'),
    ('5', '3', '5000000'),
    ('5', '4', '1000000'),
    ('5', '5', '500000'),
    ('5', '6', '250000'),
    ('6', '1', '15000000'),
    ('6', '2', '2000000'),
    ('6', '3', '5000000'),
    ('6', '4', '1000000'),
    ('6', '5', '500000'),
    ('6', '6', '250000'),
    ('8', '1', '15000000'),
    ('8', '2', '2000000'),
    ('8', '3', '5000000'),
    ('8', '4', '1000000'),
    ('8', '5', '500000'),
    ('8', '6', '250000'),
    ('9', '1', '15000000'),
    ('9', '2', '2000000'),
    ('9', '3', '5000000'),
    ('9', '4', '1000000'),
    ('9', '5', '500000'),
    ('9', '6', '250000'),
    ('11', '1', '15000000'),
    ('11', '2', '2000000'),
    ('11', '3', '5000000'),
    ('11', '4', '1000000'),
    ('11', '5', '500000'),
    ('11', '6', '250000')
;

INSERT INTO Payrolls (payroll_period)
    VALUES
    ('6')
;

INSERT INTO payroll_details (payroll_id, employee_id, salary_component_id, amount)
    VALUES
    ('1','3','1','15000000'),
    ('1','3','2','2000000'),
    ('1','3','3','5000000'),
    ('1','3','4','1000000'),
    ('1','3','5','500000'),
    ('1','3','6','250000'),
    ('1','3','8','500000')
;