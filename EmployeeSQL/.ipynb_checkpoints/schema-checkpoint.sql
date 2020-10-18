-- For the titles table, the title_id is the primary key: 
CREATE TABLE titles(
    title_id VARCHAR(5) NOT NULL PRIMARY KEY,
    title VARCHAR(20) NOT NULL
);

-- For the employees table, the emp_no is the primary key: 
CREATE TABLE employees(
    emp_no INT NOT NULL PRIMARY KEY,
    emp_title_id VARCHAR(5) NOT NULL,
    birth_date VARCHAR(10) NOT NULL,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    sex VARCHAR(1) NOT NULL,
    hire_date VARCHAR(10) NOT NULL,
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

-- For the salaries table, the emp_no is the primary key: 
CREATE TABLE salaries(
    emp_no INT NOT NULL PRIMARY KEY,
    salary INT NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- For the departments table, the dept_no is the primary key: 
CREATE TABLE departments(
    dept_no VARCHAR(4) NOT NULL PRIMARY KEY,
    dept_name VARCHAR(20) NOT NULL
);

-- A composite key (composed of 2 primary keys, dept_no and emp_no) is used for the dept_manager table:
CREATE TABLE dept_manager(
    dept_no VARCHAR(4) NOT NULL,
    emp_no INT NOT NULL,
    PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- A composite key (composed of 2 primary keys, emp_no and dept_no) is used for the dept_emp table:
CREATE TABLE dept_emp(
    emp_no INT NOT NULL,
    dept_no VARCHAR(4) NOT NULL,
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);