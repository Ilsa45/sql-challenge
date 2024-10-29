--CREATE TABLE FOR TITLES
CREATE TABLE titles (
	title_id VARCHAR NOT NULL, 
	title VARCHAR NOT NULL,
	PRIMARY KEY (title_id)
);

--CREATE TABLE FOR EMPLOYEES
CREATE TABLE employees (
    emp_no INT NOT NULL,
    emp_title_id VARCHAR(10) NOT NULL,
    birth_date DATE NOT NULL, 
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    sex CHAR(1) NOT NULL CHECK (sex IN ('M', 'F')), 
    hire_date DATE NOT NULL,
    FOREIGN KEY (emp_title_id) REFERENCES titles (title_id),
    PRIMARY KEY (emp_no)
);

--CREATE TABLE FOR DEPARTMENTS
CREATE TABLE departments (
    dept_no VARCHAR(8) NOT NULL,        
    dept_name VARCHAR(50) NOT NULL,
    PRIMARY KEY (dept_no)
);

--CREATE TABLE FOR DEPT EMPLOYEES
CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
    dept_no VARCHAR(8) NOT NULL,
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

-- CREATE TABLE FOR SALARIES
CREATE TABLE salaries(
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	PRIMARY KEY (emp_no),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

-- CREATE TABLE FOR DEPT MANAGER
CREATE TABLE dept_manager (
	dept_no VARCHAR(8) NOT NULL,
	emp_no INT NOT NULL,
	PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);


