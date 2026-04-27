-- CREATE AND SELECT DATABASE
DROP DATABASE IF EXISTS helpdesk;
CREATE DATABASE helpdesk;
USE helpdesk;

-- USERS TABLE 
-- Designed to perfectly match your original SQLite structure
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(20) DEFAULT 'user',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- TICKETS TABLE 
-- Using 'problem' and 'assigned_to' exactly as your React app expects
CREATE TABLE tickets (
    id INT AUTO_INCREMENT PRIMARY KEY,
    problem VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    status VARCHAR(50) DEFAULT 'Open',
    user_id INT NOT NULL,
    assigned_to INT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (assigned_to) REFERENCES users(id)
);

-- ---------------------------------------------------------
-- DEMO ACCOUNTS
-- Login password for BOTH accounts is: password
-- ---------------------------------------------------------

-- 1. Standard User Account
INSERT INTO users (email, password, role)
VALUES ('user@company.com', '$2a$10$SlYQmyNdGzTn7ZLBXBChFOC9f6kFjAqPhqf9k.mN7HUpzO.mOnuGG', 'user');

-- 2. IT Technician Account
INSERT INTO users (email, password, role)
VALUES ('it@company.com', '$2a$10$SlYQmyNdGzTn7ZLBXBChFOC9f6kFjAqPhqf9k.mN7HUpzO.mOnuGG', 'IT');

-- ---------------------------------------------------------
-- DEMO TICKETS
-- ---------------------------------------------------------

INSERT INTO tickets (problem, description, status, user_id)
VALUES ('Printer Jammed', 'The printer on the 3rd floor says paper jam but there is no paper.', 'Open', 1);

INSERT INTO tickets (problem, description, status, user_id)
VALUES ('Cannot access email', 'I keep getting a 401 Unauthorized error when logging into Outlook.', 'Open', 1);

INSERT INTO tickets (problem, description, status, user_id, assigned_to)
VALUES ('Wifi is down', 'The guest wifi network is not broadcasting.', 'Assigned', 1, 2);