SELECT flight_id, flight_no, status 
FROM flights 
WHERE status = "On Time";

SELECT * 
FROM bookings 
WHERE total_amount > 1000000;

SELECT * 
FROM aircrafts_data;

SELECT flight_id 
FROM flights 
WHERE aircraft_code = '733';

SELECT * 
FROM tickets 
WHERE passenger_name ILIKE 'IRINA%';

SELECT city ->> 'en' AS ciudad, COUNT(*) AS total_aeropuertos
FROM airports_data 
GROUP BY city ->> 'en' 
HAVING COUNT(*) > 1;

SELECT a.model ->> 'en' AS modelo_avion, COUNT(f.flight_id) AS total_vuelos 
FROM aircrafts_data a 
JOIN flights f ON a.aircraft_code = f.aircraft_code 
GROUP BY a.model ->> 'en'
ORDER BY total_vuelos DESC;

SELECT book_ref, COUNT(ticket_no) AS total_pasajeros
FROM tickets
GROUP BY book_ref
HAVING COUNT(ticket_no) > 1;

SELECT flight_id, flight_no, scheduled_departure, actual_departure,
       (actual_departure - scheduled_departure) AS retraso
FROM flights
WHERE actual_departure IS NOT NULL
  AND actual_departure - scheduled_departure > INTERVAL '1 hour';

