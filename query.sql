-- Create users Table
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    role VARCHAR(20) NOT NULL CHECK (
        role IN ('Ticket Manager', 'Football Fan')
    ),
    phone_number VARCHAR(20) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- insert data into users table
INSERT INTO users(full_name, email, role, phone_number) VALUES
  ('Tanvir Rahman', 'info@tabvir.com', 'Football Fan', +8801914924473),
  ('Asif Haque', 'info@asif.com', 'Football Fan', +8801910000473),
  ('Sajjad Rahman', 'info@sajjad.com', 'Football Fan', +8801714924473),
  ('Jannat Ara', 'info@jannat.com', 'Football Fan', +8801614924473);