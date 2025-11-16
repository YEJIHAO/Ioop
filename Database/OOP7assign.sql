
CREATE DATABASE OOP7;


USE OOP7;


DROP TABLE IF EXISTS Application;
DROP TABLE IF EXISTS Internship;
DROP TABLE IF EXISTS Admin;
DROP TABLE IF EXISTS Supervisor;
DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS Company;
DROP TABLE IF EXISTS [User];


CREATE TABLE [User] (
    UserID VARCHAR(10) PRIMARY KEY, 
    Email VARCHAR(255) NOT NULL UNIQUE,
    Password VARCHAR(255) NOT NULL,
    Role VARCHAR(50) NOT NULL
);



CREATE TABLE Admin (
    AdminID VARCHAR(10) PRIMARY KEY, 
    Name VARCHAR(255) NOT NULL,
    UserID VARCHAR(10) NOT NULL UNIQUE, 
    FOREIGN KEY (UserID) REFERENCES [User](UserID)
);


CREATE TABLE Supervisor (
    SupervisorID VARCHAR(10) PRIMARY KEY, 
    Name VARCHAR(255) NOT NULL,
    Department VARCHAR(100),
    UserID VARCHAR(10) NOT NULL UNIQUE,
    FOREIGN KEY (UserID) REFERENCES [User](UserID)
);


CREATE TABLE Student (
    StudentID VARCHAR(10) PRIMARY KEY, 
    Name VARCHAR(255) NOT NULL,
    ContactNumber VARCHAR(50),
    Major VARCHAR(100),
    UserID VARCHAR(10) NOT NULL UNIQUE,
    FOREIGN KEY (UserID) REFERENCES [User](UserID)
);

CREATE TABLE Company (
    CompanyID VARCHAR(10) PRIMARY KEY, 
    CompanyName VARCHAR(255) NOT NULL,
    Address TEXT,
    ContactNumber VARCHAR(50),
    Industry VARCHAR(100),
    UserID VARCHAR(10) NOT NULL UNIQUE,
    FOREIGN KEY (UserID) REFERENCES [User](UserID)
);


CREATE TABLE Internship (
    InternshipID VARCHAR(10) PRIMARY KEY, 
    Title VARCHAR(255) NOT NULL,
    Description TEXT,
    StartDate DATE,
    EndDate DATE,
    CompanyID VARCHAR(10) NOT NULL,
    FOREIGN KEY (CompanyID) REFERENCES Company(CompanyID)
);

CREATE TABLE Application (
    ApplicationID VARCHAR(10) PRIMARY KEY, 
    ApplicationDate DATETIME NOT NULL DEFAULT GETDATE(),
    Status VARCHAR(50) NOT NULL DEFAULT 'Pending',
    InternshipID VARCHAR(10) NOT NULL, 
    StudentID VARCHAR(10) NOT NULL,
    FOREIGN KEY (InternshipID) REFERENCES Internship(InternshipID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
);



INSERT INTO [User] (UserID, Email, Password, Role)
VALUES
('U001', 'zhenhao@admin.com', 'hashed_pass_1', 'Admin'),
('U002', 'dr.smith@school.edu', 'hashed_pass_2', 'Supervisor'),
('U003', 'hr@techcorp.com', 'hashed_pass_3', 'Company'),
('U004', 'hr@datasoft.com', 'hashed_pass_4', 'Company'),
('U005', 'jiahao@student.com', 'hashed_pass_5', 'Student'),
('U006', 'chai@student.com', 'hashed_pass_6', 'Student'),
('U007', 'meng@student.com', 'hashed_pass_7', 'Student');


INSERT INTO Admin (AdminID, Name, UserID) 
VALUES ('AD001', 'Zhen Hao Liew', 'U001');

INSERT INTO Supervisor (SupervisorID, Name, Department, UserID) 
VALUES ('SV001', 'Dr. Eleanor Smith', 'Computer Science', 'U002');

INSERT INTO Student (StudentID, Name, ContactNumber, Major, UserID)
VALUES
('ST001', 'JIAHAO', '011-111111', 'Software Engineering', 'U005'),
('ST002', 'CHAI',   '012-222222', 'Data Science', 'U006'),
('ST003', 'MENG',   '013-333333', 'Cyber Security', 'U007');

INSERT INTO Company (CompanyID, CompanyName, Address, ContactNumber, Industry, UserID)
VALUES 
('C001', 'TechCorp Innovations', 'Level 20, Tech Tower 1, Cyberjaya', '03-91234567', 'Technology', 'U003'),
('C002', 'DataSoft Solutions', 'Suite 15-A, Menara Data, Kuala Lumpur', '03-22889900', 'Data Analytics', 'U004');


INSERT INTO Internship (InternshipID, Title, Description, StartDate, EndDate, CompanyID)
VALUES
('I001', 'Software Engineer Intern', 'Work on our new mobile app.', '2026-03-01', '2026-06-01', 'C001'),
('I002', 'Data Analyst Intern', 'Analyze marketing data.', '2026-03-15', '2026-06-15', 'C002'),
('I003', 'Backend Developer', 'Work on company internal systems.', '2026-04-01', '2026-07-01', 'C001');

INSERT INTO Application (ApplicationID, InternshipID, StudentID, Status)
VALUES
('AP001', 'I001', 'ST001', 'Pending'),
('AP002', 'I002', 'ST002', 'Approved'),
('AP003', 'I001', 'ST002', 'Pending'),
('AP004', 'I003', 'ST003', 'Rejected');


SELECT * FROM [User];
SELECT * FROM Admin;
SELECT * FROM Supervisor;
SELECT * FROM Student;
SELECT * FROM Company;
SELECT * FROM Internship;
SELECT * FROM Application;