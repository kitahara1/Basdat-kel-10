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

INSERT INTO Employee (employee_id) VALUES('0001','0002','0003','0004','0005','0006','0007','0008','0009','0010','0011');
INSERT INTO Employee (employee_nik) VALUES('2102972','2102973','2102974','2102974','2102975','2102976','2102977','2102978','2102979','2102980','2102981','2102982');
INSERT INTO Employee (employee_name) VALUES('Nuriansyah','Zaidan','Daffa','Dylee','Genta','Mackenzie','Michelle','Irene','Agatha','Azka','Rafi');
INSERT INTO Employee (employee_gender) VALUES('L','L','L','L','L','W','W','W','W','L','L');
INSERT INTO Employee (employee_birthplace) VALUES('Jakarta','Bandung','Palembang','Sydney','Osaka','Tokyo','Jakarta','Medan','Guangzhou','Bandung','Jogja');
INSERT INTO Employee (employee_birthdate) VALUES('21-03-2002','03-04-1999','12-05-2000','16-06-2001','13-07-1998','24-08-2002','09-08-2000','01-01-2003','13-09-2001','06-10-1999','27-11-2002');
INSERT INTO Employee (employee_address) VALUES('Jl.Semanggi no 05','Jl.Rambutan no 25C','Jl.Bali no 12A','Jl.Belitung no 08','Jl.Aceh no 41','Jl.Tamansari no 12','Jl.Prindapan no 24','Jl.Medan no 11','Jl.Soekarno','Jl.Pasturi no 33','Jl.Merdeka no 21');
INSERT INTO Employee (employee_phonenumber) VALUES('08184451','08723456','08213675','08125643','08123864','08123556','08927575','08216535','08676356','08978565','08123434');
INSERT INTO Employee (employee_joindate) VALUES('20-03-2021','13-04-2021','09-04-2021','27-06-2021','15-03-2021','19-01-2021','11-08-2021','23-09-2021','26-10-2021','08-03-2021','20-10-2021');

-- Tabel Position
CREATE TABLE IF NOT EXISTS positions(
    position_id int(10) NOT NULL AUTO_INCREMENT,
    position_name varchar(255) NOT NULL,
    position_level int(1) NOT NULL,
    position_parent int(10),
    PRIMARY KEY(position_id),
    FOREIGN KEY(position_parent) REFERENCES positions(position_id)
);

INSERT INTO Position (position_id) VALUES('1','2','3','4','5');
INSERT INTO Position (position_name) VALUES('Komisaris','CEO','Direktur Utama','Manager','Karyawan');
INSERT INTO Position (position_level) VALUES('1','2','2','3','4');
INSERT INTO Position (position_parent) VALUES('-','1','1','3','4');

-- Tabel Department
CREATE TABLE IF NOT EXISTS departments(
    department_id int(10) NOT NULL AUTO_INCREMENT,
    department_name varchar(255) NOT NULL,
    PRIMARY KEY(department_id)
);

INSERT INTO Department (department_id) VALUES('1','2','3','4','5','6');
INSERT INTO Department (department_name) VALUES('Keuangan','Marketing','Advertising',"Produksi",'Kepegawaian','Bagian Umum');

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

INSERT INTO employee_position (employee_position_id) VALUES('1','2','3','4','5','06','7','8','9','10','11');
INSERT INTO employee_position (employee_id) VALUES('0001','0010','0007','0011','0002','0003','0004','0005','0006','0008','0008','0009');
INSERT INTO employee_position (department_id) VALUES('-','-','-','4','5','6','3','1','2','5','3');
INSERT INTO employee_position (position_id) VALUES('1','2','3','4','4','4','4','4','4','5','5');

-- Tabel Salary Component
CREATE TABLE IF NOT EXISTS salary_components(
    salary_component_id int(10) NOT NULL AUTO_INCREMENT,
    salary_component_name varchar(255) NOT NULL,
    salary_component_type varchar(255) NOT NULL,
    PRIMARY KEY(salary_component_id)
);

INSERT INTO salary_components (salary_component_id) VALUES('1','2','3','4','5','6','7','8');
INSERT INTO salary_components (salary_component_name) VALUES('Gaji','Tunjangan Makan','Tunjangan Kesehatan','Tunjangan Transpotasi','Paket berlangganan ListenMe','Pajak Penghasilan','THR','Bonus');
INSERT INTO salary_components (salary_component_type) VALUES('allowance','allowance','allowance','allowance','allowance','Deducation','allowance','allowance');

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

INSERT INTO additional_salaries (additional_salary_id) VALUES('1','2','3','4','5','6','7','8');
INSERT INTO additional_salaries (employee_id) VALUES('0003','0003','0004','0004','0005','0005','0006','0006');
INSERT INTO additional_salaries (salary_component_id) VALUES('8','7','8','7','8','7','8','7');
INSERT INTO additional_salaries (additional_salary_period) VALUES('June 2022','May 2022','June 2022','May 2022','June 2022','May 2022','June 2022','May 2022');
INSERT INTO additional_salaries (additional_salary_amount) VALUES('Rp.5.000.000','Rp.7.500.000','Rp.5.000.000','Rp.7.500.000','Rp.5.000.000','Rp.7.500.000','Rp.5.000.000','Rp.7.500.000');

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

INSERT INTO salary_employees (salary_employee_id) VALUES('1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','31','32','33','34','35','36','37','38','37','38','39','40','41','42','43','44','45','46','47','48');
INSERT INTO salary_employees (employee_id) VALUES('0002','0002','0002','0002','0002','0002','0003','0003','0003','0003','0003','0003','0004','0004','0004','0004','0004','0004','0005','0005','0005','0005','0005','0005','0006','0006','0006','0006','0006','0006','0008','0008','0008','0008','0008','0008','0009','0009','0009','0009','0009','0009','0011','0011','0011','0011','0011','0011');
INSERT INTO salary_employees (salary_component_id) VALUES('1','2','3','4','5','6','1','2','3','4','5','6''1','2','3','4','5','6''1','2','3','4','5','6''1','2','3','4','5','6''1','2','3','4','5','6''1','2','3','4','5','6''1','2','3','4','5','6');
INSERT INTO salary_employees (additional_salary_amount) VALUES('Rp.15.000.000','Rp.2.000.000','Rp.5.000.000','Rp.1.000.000','Rp.500.000','Rp.250.000','Rp.15.000.000','Rp.2.000.000','Rp.5.000.000','Rp.1.000.000','Rp.500.000','Rp.250.000','Rp.15.000.000','Rp.2.000.000','Rp.5.000.000','Rp.1.000.000','Rp.500.000','Rp.250.000','Rp.15.000.000','Rp.2.000.000','Rp.5.000.000','Rp.1.000.000','Rp.500.000','Rp.250.000','Rp.15.000.000','Rp.2.000.000','Rp.5.000.000','Rp.1.000.000','Rp.500.000','Rp.250.000','Rp.15.000.000','Rp.2.000.000','Rp.5.000.000','Rp.1.000.000','Rp.500.000','Rp.250.000','Rp.15.000.000','Rp.2.000.000','Rp.5.000.000','Rp.1.000.000','Rp.500.000','Rp.250.000','Rp.15.000.000','Rp.2.000.000','Rp.5.000.000','Rp.1.000.000','Rp.500.000','Rp.250.000');

-- Tabel Payroll
CREATE TABLE IF NOT EXISTS payrolls(
    payroll_id int(10) NOT NULL AUTO_INCREMENT,
    payroll_period int(2) NOT NULL,
    PRIMARY KEY(payroll_id)
);

INSERT INTO Payroll (payroll_id) VALUES('1');
INSERT INTO Payroll (payroll_period) VALUES('June 2022');

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

INSERT INTO payroll_details (payroll_detail_id) VALUES('1','2','3','4','5','6','7');
INSERT INTO payroll_details (payroll_id) VALUES('1','1','1','1','1','1','1');
INSERT INTO payroll_details (employee_id) VALUES('0003','0003','0003','0003','0003','0003','0003');
INSERT INTO payroll_details (salary_component_id) VALUES('1','2','3','4','5','6','8');
INSERT INTO payroll_details (amount) VALUES('Rp.15.000.000','Rp.2.000.000','Rp.5.000.000','Rp.1.000.000','Rp.500.000','Rp.250.000','Rp.5.000.000');
