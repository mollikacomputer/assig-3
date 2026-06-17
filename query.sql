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

-- create matches table
CREATE TABLE matches (
    match_id INT PRIMARY KEY,
    fixture VARCHAR(100) NOT NULL,
    tournament_category VARCHAR(50) NOT NULL,
    base_ticket_price DECIMAL(10,2) NOT NULL,
    match_status VARCHAR(20) NOT NULL CHECK (
        match_status IN ('Available', 'Selling Fast', 'Sold Out')
    )
);

-- insert data into matches information
INSERT INTO matches (match_id, fixture, tournament_category, base_ticket_price, match_status) VALUES
(101, 'Real Madrid vs Barcelona', 'Champions League', 150.00, 'Available'),
(102, 'Man City vs Liverpool', 'Premier League', 120.00, 'Selling Fast'),
(103, 'Bayern Munich vs PSG', 'Champions League', 130.00, 'Available'),
(104, 'AC Milan vs Inter Milan', 'Serie A', 90.00, 'Sold Out'),
(105, 'Juventus vs Roma', 'Serie A', 80.00, 'Available');

-- create booking table
CREATE TABLE bookings (
    booking_id INT PRIMARY KEY,

    user_id INT NOT NULL
        CONSTRAINT fk_booking_user
        REFERENCES users(user_id),

    match_id INT NOT NULL
        CONSTRAINT fk_booking_match
        REFERENCES matches(match_id),

    seat_number VARCHAR(10),

    payment_status VARCHAR(20)
        CHECK (payment_status IN ('Confirmed', 'Pending', 'Cancelled')),

    total_cost DECIMAL(10,2) NOT NULL
);
-- insert into bookings data
INSERT INTO bookings (booking_id, user_id, match_id, seat_number, payment_status, total_cost) VALUES
(501, 1, 101, 'A-12', 'Confirmed', 150.00),
(502, 1, 102, 'B-04', 'Confirmed', 120.00),
(503, 2, 101, 'A-13', 'Confirmed', 150.00),
(504, 2, 101, NULL, NULL, 150.00),
(505, 3, 102, 'C-20', 'Pending', 120.00);

-- Query 1: Retrieve all upcoming football matches belonging to the 'Champions League' where the match status is 'Available'.
SELECT match_id, fixture, base_ticket_price
    FROM matches
        WHERE tournament_category = 'Champions League'
            AND match_status = 'Available';

-- Query 2: Search for all users whose full names start with 'Tanvir' or contain the phrase 'Haque' (case-insensitive).

SELECT user_id, full_name, email FROM users
WHERE full_name ILIKE 'Tanvir%'
   OR full_name ILIKE '%Haque%';
   
