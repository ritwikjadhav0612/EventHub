-- EventHub Database Schema

CREATE DATABASE IF NOT EXISTS eventhub;
USE eventhub;

-- 1. Events Table
CREATE TABLE IF NOT EXISTS events (
    event_id INT AUTO_INCREMENT PRIMARY KEY,
    event_name VARCHAR(255) NOT NULL,
    event_date DATE NOT NULL,
    venue VARCHAR(255) NOT NULL,
    description TEXT,
    category VARCHAR(100) NOT NULL
);

-- 2. Students Table
CREATE TABLE IF NOT EXISTS students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(50) NOT NULL,
    department VARCHAR(100) NOT NULL,
    year INT NOT NULL
);

-- 3. Registrations Table
CREATE TABLE IF NOT EXISTS registrations (
    registration_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    event_id INT NOT NULL,
    registration_date DATE NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (event_id) REFERENCES events(event_id) ON DELETE CASCADE
);

-- Starter Sample Data
INSERT INTO events (event_name, event_date, venue, description, category) VALUES
('Hackathon 2026', '2026-11-15', 'Main Auditorium', 'Annual 24-hour coding competition.', 'Technical'),
('RoboWars', '2026-11-16', 'Campus Arena', 'Battle of autonomous combat robots.', 'Technical'),
('Dance Fest', '2026-11-18', 'Open Air Theatre', 'Inter-college dance competition.', 'Cultural'),
('Annual Cricket Tournament', '2026-11-20', 'College Ground', 'Inter-department cricket tournament.', 'Sports'),
('Debate Championship', '2026-11-22', 'Seminar Hall B', 'Debate on technology and future ethics.', 'Literary');
