CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    designation VARCHAR(100),
    department VARCHAR(100),
    salary DECIMAL(10,2)
);

INSERT INTO employees (name, designation, department, salary) VALUES
('Yash Joshi', 'DevOps Engineer', 'Engineering', 60000.00),
('Priya Sharma', 'Backend Developer', 'Engineering', 55000.00),
('Rahul Verma', 'QA Analyst', 'Quality Assurance', 45000.00);
