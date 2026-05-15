/* 
QUESTIONS:
1. Retrieve all successful bookings:
2. Find the average ride distance for each vehicle type:
3. Get the total number of cancelled rides by customers:
4. List the top 5 customers who booked the highest number of rides:
5. Get the number of rides cancelled by drivers due to personal and car-related issues:
6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
7. Retrieve all rides where payment was made using UPI:
8. Find the average customer rating per vehicle type:
9. Calculate the total booking value of rides completed successfully:
10. List all incomplete rides along with the reason:
*/


DROP TABLE IF EXISTS ola

CREATE TABLE ola (
    date DATE,
    time TIME,
    booking_id VARCHAR(100),
    booking_status VARCHAR(150),
    customer_id VARCHAR(200),
    vehicle_type VARCHAR(50),
    pickup_location VARCHAR(150),
    drop_location VARCHAR(150),
    v_tat INT,
    c_tat INT,
    canceled_rides_by_customer VARCHAR(150),
    canceled_rides_by_driver VARCHAR(150),
    incomplete_rides VARCHAR(150),
    incomplete_rides_reason VARCHAR(150),
    booking_value INT,
    payment_method VARCHAR(150),
    ride_distance INT,
    driver_ratings DECIMAL(4,2),
    customer_rating DECIMAL(4,2)
);


-- 1. Retrieve all successful bookings:
SELECT *
FROM ola
WHERE booking_status = 'Success'

-- 2. Find the average ride distance for each vehicle type:
SELECT vehicle_type, AVG (ride_distance) AS Avg_distance
FROM ola
GROUP BY vehicle_type;

3. Get the total number of cancelled rides by customers:
SELECT COUNT (*)
FROM ola
WHERE booking_status = 'Canceled by Customer'

4. List the top 5 customers who booked the highest number of rides:
SELECT customer_id, COUNT (booking_id) AS Highest_booking_rides
FROM ola
GROUP BY customer_id
ORDER BY total_rides DESC
LIMIT 5;

5. Get the number of rides cancelled by drivers due to personal and car-related issues:
SELECT COUNT (*) 
FROM ola
WHERE canceled_rides_by_driver = 'Personal & Car related issue'


6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
SELECT MAX (driver_ratings) AS Max_Ratings, MIN (driver_ratings) AS Min_Ratings
FROM ola
WHERE vehicle_type = 'Prime Sedan'

7. Retrieve all rides where payment was made using UPI:
SELECT * 
FROM ola
WHERE payment_method = 'UPI'

8. Find the average customer rating per vehicle type:
SELECT vehicle_type, AVG (customer_rating) AS Avg_Customer_Rating 
FROM ola
GROUP BY vehicle_type

9. Calculate the total booking value of rides completed successfully:
SELECT SUM (booking_value) AS Total_value_of_Successful_Rides
FROM ola
WHERE booking_status = 'Success'

10. List all incomplete rides along with the reason:
SELECT booking_id, incomplete_rides_reason
FROM ola
WHERE incomplete_rides = 'Yes'

