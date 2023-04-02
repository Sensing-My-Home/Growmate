INSERT INTO public.utilizador (address, dob, email, name, password, rating, user_type)
VALUES
    ('123 Main St', '1990-01-01', 'john.doe@example.com', 'John Doe', 'password123', 4, 2),

INSERT INTO public.species_family (name, opt_soil_mix)
VALUES
    ('Flowering House Plants', 1),
    ('Foliage Plants', 2),
    ('Bromeliads', 3),
    ('Orchids', 4),
    ('Succulents and Cacti', 5),
    ('Ferns', 6),
    ('African Violets and other Gesneriads', 7);

INSERT INTO public.plant_species (common_name, cycle, difficulty, flowering, leaf_color, optimal_humidity, optimal_luminosity, optimal_temperature, scientific_name, season, usual_size, watering_frequency, family_id)
VALUES ('African Violet', 'Perennial', 2, true, 'Lavender', 2, 2, 2, 'Saintpaulia ionantha', 4, 6, 1, 7),
       ('Common Ivy', 'Perennial', 1, false, 'Green', 2, 3, 1, 'Sansevieria trifasciata', 2, 36, 2, 1),
       ('Peace Lily', 'Perennial', 3, true, 'Green', 2, 3, 2, 'Hedera helix', 3, 24, 1, 2),
       ('Pineapple', 'Perennial', 2, true, 'Green', 2, 1, 2, 'Ananas comosus', 1, 120, 1, 3),
       ('Little Tree Cactus', 'Perennial', 1, false, 'Green', 3, 1, 2, 'Opuntia vilis', 4, 120, 3, 5),
       ('Button Fern', 'Perennial', 1, true, 'Green', 2, 2, 2, 'Pellaea rotundifolia', 2, 24, 1, 6),
       ('Spice Orchid', 'Perennial', 3, true, 'Green', 1, 2, 2, 'Epidendrum atropurpureum', 1, 120, 4);

INSERT INTO public.division (luminosity, name, user_id)
VALUES (2, 'Living Room', 1),
       (3, 'Bedroom', 1);

INSERT INTO public.division_sensor (name, sensor_code, division_id, user_id)
VALUES ('Living Room Temperature Sensor', 'TMP123', 1, 1),
       ('Living Room Humidity Sensor', 'HMD456', 1, 1),
       ('Bedroom Temperature Sensor', 'TMP789', 2, 1),
       ('Bedroom Humidity Sensor', 'HMD789', 2, 1);

INSERT INTO public.plant (name, plant_condition, plantation_date, division_id, user_id, species_id)
VALUES ('Anthony', 4, '2022-01-01', 1, 1, 1),
       ('Wendy', 3, '2022-03-15', 1, 1, 7),
       ('Beth', 2, '2022-04-20', 2, 1, 4),
       ('Juliana', 5, '2022-02-10', 2, 1, 5);


INSERT INTO public.plant_sensor (name, sensor_code, user_id, plant_id)
VALUES ('Anthony Sensor', 'ANT123', 1, 1),
       ('Wendy Sensor', 'WEN123', 1, 2),
       ('Beth Sensor', 'BTH123', 1, 3),
       ('Juliana Sensor', 'JUL123', 1, 4);