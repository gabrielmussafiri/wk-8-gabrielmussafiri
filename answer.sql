-- Create Database
CREATE DATABASE ClinicDB;
USE ClinicDB;

-- Create Departments table
CREATE TABLE Departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);

-- Create Doctors table
CREATE TABLE Doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id) ON DELETE SET NULL
);

-- Create Patients table
CREATE TABLE Patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone_number VARCHAR(15) NOT NULL
);

-- Create Appointment Status table
CREATE TABLE Appointment_Status (
    status_id INT AUTO_INCREMENT PRIMARY KEY,
    status_name VARCHAR(50) NOT NULL UNIQUE
);

-- Create Appointments table
CREATE TABLE Appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATETIME NOT NULL,
    status_id INT,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id) ON DELETE CASCADE,
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id) ON DELETE CASCADE,
    FOREIGN KEY (status_id) REFERENCES Appointment_Status(status_id) ON DELETE SET NULL
);

-- Sample Data Insertion
INSERT INTO Departments (department_name) VALUES 
('Cardiology'),
('Pediatrics'),
('Orthopedics');

INSERT INTO Doctors (first_name, last_name, department_id) VALUES 
('John', 'Doe', 1),
('Jane', 'Smith', 2),
('Mary', 'Johnson', 3);

INSERT INTO Patients (first_name, last_name, date_of_birth, email, phone_number) VALUES 
('Michael', 'Jordan', '1990-02-17', 'mjordan@example.com', '123-456-7890'),
('Serena', 'Williams', '1981-09-26', 'swilliams@example.com', '987-654-3210');

INSERT INTO Appointment_Status (status_name) VALUES 
('Scheduled'),
('Completed'),
('Cancelled');

-- Sample Appointments
INSERT INTO Appointments (patient_id, doctor_id, appointment_date, status_id) VALUES 
(1, 1, '2025-05-15 10:00:00', 1),
(2, 2, '2025-05-16 11:00:00', 1);
