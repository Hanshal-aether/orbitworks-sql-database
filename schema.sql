SHOW DATABASES;

CREATE DATABASE orbitworks;
USE orbitworks;

-- DROP DATABASE orbitworks;

CREATE TABLE departments (
    department_id     INT PRIMARY KEY AUTO_INCREMENT,
    department_name   VARCHAR(100) NOT NULL,
    location           VARCHAR(100),
    budget             DECIMAL(12,2),
    head_employee_id   INT, 
    established_date   DATE,
    is_active           TINYINT(1) DEFAULT 1
);

CREATE TABLE employees (
    employee_id    INT PRIMARY KEY AUTO_INCREMENT,
    full_name      VARCHAR(100) NOT NULL,
    email          VARCHAR(100) UNIQUE NOT NULL,
    department_id  INT,
    designation    VARCHAR(50),
    hire_date      DATE,
    salary         DECIMAL(10,2),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
        ON DELETE SET NULL
);

CREATE TABLE projects (
    project_id     INT PRIMARY KEY AUTO_INCREMENT,
    project_name   VARCHAR(150) NOT NULL,
    department_id  INT,
    start_date     DATE,
    end_date       DATE,
    budget         DECIMAL(12,2),
    status         VARCHAR(30),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
        ON DELETE SET NULL
);

/** CREATE TABLE employee_projects (
    assignment_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT NOT NULL,
    project_id INT NOT NULL,
    role VARCHAR(50),
    hours_allocated INT,
    assigned_date DATE,
    released_date DATE,
    status VARCHAR(30) DEFAULT 'Active',

    UNIQUE(employee_id, project_id),

    FOREIGN KEY (employee_id)
        REFERENCES employees(employee_id)
        ON DELETE RESTRICT,

    FOREIGN KEY (project_id)
        REFERENCES projects(project_id)
        ON DELETE RESTRICT
);

**/

DROP TABLE IF EXISTS employee_projects;

CREATE TABLE employee_projects (
    assignment_id    INT PRIMARY KEY AUTO_INCREMENT,
    employee_id      INT NOT NULL,
    project_id       INT NOT NULL,
    role             VARCHAR(50),
    hours_allocated  INT,
    assigned_date    DATE,
    released_date    DATE,
    status           VARCHAR(30) DEFAULT 'Active',
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
        ON DELETE RESTRICT,
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
        ON DELETE RESTRICT
);


