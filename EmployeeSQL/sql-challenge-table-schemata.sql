-- creating titles table
CREATE TABLE titles (
    title_id VARCHAR(5) PRIMARY KEY NOT NULL,
    title VARCHAR(30) NOT NULL
);

-- creating employees table
CREATE TABLE employees (
    emp_no INT PRIMARY KEY NOT NULL,
    emp_title_id VARCHAR(5),
    birth_date DATE NOT NULL,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    sex CHAR(1) NOT NULL,
    hire_date DATE NOT NULL,
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

-- creating departments table
CREATE TABLE departments (
    dept_no VARCHAR(5) PRIMARY KEY NOT NULL,
    dept_name VARCHAR(30) NOT NULL
);

-- creating department managers table
CREATE TABLE dept_manager (
    dept_no VARCHAR(5),
    emp_no INT,
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- creating department employees table
CREATE TABLE dept_emp (
    emp_no INT,
    dept_no VARCHAR(5),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- creating salaries table
CREATE TABLE salaries (
    emp_no INT,
    salary INT NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);