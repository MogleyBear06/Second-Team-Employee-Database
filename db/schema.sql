DROP DATABASE IF EXISTS hcm_db;
CREATE DATABASE hcm_db;

USE hcm_db;

CREATE TABLE department (
    id INT PRIMARY KEY AUTO_INCREMENT, 
    name VARCHAR(30) 
);

CREATE TABLE role (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(30), 
    salary DECIMAL, 
    department_id INT,   
    INDEX dep_ind (department_id),
    CONSTRAINT fk_department FOREIGN KEY (department_id) REFERENCES department(id) ON DELETE SET NULL
);

CREATE TABLE employee(
    id INT PRIMARY KEY AUTO_INCREMENT, 
    first_name VARCHAR(30), 
    last_name VARCHAR(30), 
    role_id INT,  
    INDEX role_ind (role_id),
    CONSTRAINT fk_role FOREIGN KEY (role_id) REFERENCES role(id) ON DELETE SET NULL,
    manager_id INTEGER,
    INDEX manager_ind (manager_id),
    CONSTRAINT fk_manager FOREIGN KEY (manager_id) REFERENCES employee(id) ON DELETE SET NULL
);