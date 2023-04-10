INSERT INTO public.utilizador (id, address, dob, email, name, password, rating, user_type)
VALUES
    (1, '123 Main St', '1990-01-01', 'john.doe@example.com', 'John Doe', 'password123', 4, 2);

INSERT INTO public.species_family (id, name, opt_soil_mix)
VALUES
    (1, 'Flowering House Plants', 1),
    (2, 'Foliage Plants', 2),
    (3, 'Bromeliads', 3),
    (4, 'Orchids', 4),
    (5, 'Succulents and Cacti', 5),
    (6, 'Ferns', 6),
    (7, 'African Violets and other Gesneriads', 7);

INSERT INTO public.plant_species (id, common_name, cycle, difficulty, flowering, leaf_color, optimal_humidity, optimal_luminosity, optimal_temperature, scientific_name, season, photo, usual_size, watering_frequency, family_id)
VALUES (1, 'African Violet', 'Perennial', 2, true, 'Lavender', 2, 2, 2, 'Saintpaulia ionantha', 4, 'https://cdn.pixabay.com/photo/2020/01/09/18/05/african-violets-4753512_960_720.jpg', 6, 1, 7),
       (2, 'Common Ivy', 'Perennial', 1, false, 'Green', 2, 3, 1, 'Sansevieria trifasciata', 2, 'https://cdn.pixabay.com/photo/2020/04/04/16/29/common-ivy-5002946_960_720.jpg', 36, 2, 1),
       (3, 'Peace Lily', 'Perennial', 3, true, 'Green', 2, 3, 2, 'Hedera helix', 3, 'https://cdn.pixabay.com/photo/2019/06/12/14/14/peace-lilies-4269365_960_720.jpg', 24, 1, 2),
       (4, 'Pineapple', 'Perennial', 2, true, 'Green', 2, 1, 2, 'Ananas comosus', 1, 'https://cdn.pixabay.com/photo/2015/02/14/18/10/pineapple-636562_960_720.jpg', 120, 1, 3),
       (5, 'Little Tree Cactus', 'Perennial', 1, false, 'Green', 3, 1, 2, 'Opuntia vilis', 4, 'https://cdn.pixabay.com/photo/2016/06/13/07/32/cacti-1453793_960_720.jpg', 120, 3, 5),
       (6, 'Button Fern', 'Perennial', 1, true, 'Green', 2, 2, 2, 'Pellaea rotundifolia', 2, 'https://cdn.pixabay.com/photo/2015/04/10/00/40/green-715535_960_720.jpg', 24, 1, 6),
       (7, 'Spice Orchid', 'Perennial', 3, true, 'Green', 1, 2, 2, 'Epidendrum atropurpureum', 1, 'https://cdn.pixabay.com/photo/2021/10/08/16/22/plant-6691763_960_720.jpg', 120, 2, 4);

INSERT INTO public.division (id, luminosity, name, user_id)
VALUES (1, 2, 'Living Room', 1),
       (2, 3, 'Bedroom', 1);

INSERT INTO public.division_sensor (id, name, sensor_code, division_id, user_id)
VALUES (1, 'Living Room Temperature Sensor', 'TMP123', 1, 1),
       (2, 'Living Room Humidity Sensor', 'HMD456', 1, 1),
       (3, 'Bedroom Temperature Sensor', 'TMP789', 2, 1),
       (4, 'Bedroom Humidity Sensor', 'HMD789', 2, 1);

INSERT INTO public.plant (id, name, plant_condition, photo, plantation_date, division_id, user_id, species_id)
VALUES (1, 'Anthony', 2, 'https://cdn.pixabay.com/photo/2018/03/06/19/33/vase-3204337_960_720.jpg', '2022-01-01', 1, 1, 1),
       (2, 'Wendy', 2, 'https://images.pexels.com/photos/7814295/pexels-photo-7814295.jpeg', '2022-03-15', 1, 1, 7),
       (3, 'Beth', 2, 'https://cdn.pixabay.com/photo/2021/05/16/01/04/orchids-6256963_960_720.jpg', '2022-04-20', 2, 1, 4),
       (4, 'Juliana', 2, 'https://cdn.pixabay.com/photo/2016/11/21/16/05/cacti-1846147_960_720.jpg', '2022-02-10', 2, 1, 5);


INSERT INTO public.plant_sensor (id, name, sensor_code, user_id, plant_id)
VALUES (1, 'Anthony Sensor', 'ANT123', 1, 1),
       (2, 'Wendy Sensor', 'WEN123', 1, 2),
       (3, 'Beth Sensor', 'BTH123', 1, 3),
       (4, 'Juliana Sensor', 'JUL123', 1, 4);
       
INSERT INTO public.task VALUES (1,'Check if Anthony is ready for watering by verifying the first 2cm of the soil mixture for dryness', 'Water Anthony',
                         '2023-04-13', 0, 1, FALSE),
                        (2, 'Change Wendy soil mix. Remember she is a Orchid, so use their soil mix.', 'Change Wendy soil mix',
                         '2023-04-13', 1, 2, TRUE),
                     (3, 'Beth is a little too warm. Consider changing her location.', 'Move Beth',
                         '2023-04-8', 2, 3, FALSE),
                     (4, 'Check the leafs of Juliana. Annotate her condition on her journal', 'Check Juliana''s condition ',
                         '2023-04-15', 3, 4, FALSE),
                     (5, 'Time to give Anthony some new fertilizer!', 'Fertilize Anthony',
                         '2023-04-8', 4, 1, TRUE);
                 
