INSERT INTO public.utilizador (id, address, dob, email, name, password, rating, user_type)
VALUES
    (1, '123 Main St', '1990-01-01', 'john.doe@example.com', 'John Doe', 'password123', 4, 2);

INSERT INTO public.species_family (id, name, opt_soil_mix, photo)
VALUES
    (1, 'Flowering House Plants', 1, 'https://assets.hgtv.ca/wp-content/uploads/2021/12/Kalanchoe-Plants-That-Flower-In-Winter-FT.jpg'),
    (2, 'Foliage Plants', 2, 'https://www.gardendesign.com/pictures/images/675x529Max/site_3/colorful-foliage-plants-proven-winners_16616.jpg'),
    (3, 'Bromeliads', 3, 'https://www.gardeningknowhow.com/wp-content/uploads/2012/03/bromeliads-1.jpg'),
    (4, 'Orchids', 4, 'https://www.allaboutgardening.com/wp-content/uploads/2021/11/Types-of-Orchids-1200x667.jpg'),
    (5, 'Succulents and Cacti', 5, 'https://buchanansplants.com/wp-content/uploads/2022/03/iStock-1302750927-scaled.jpg'),
    (6, 'Ferns', 6, 'https://cdn.britannica.com/30/73130-138-917E422E/Ferns-systems-tracheophytes-leaves-water.jpg?w=800&h=450&c=crop'),
    (7, 'African Violets and other Gesneriads', 7, 'https://bloximages.chicago2.vip.townnews.com/auburnpub.com/content/tncms/assets/v3/editorial/0/80/08049aee-ea8b-5f5d-9a01-ae3d6f27cc7a/601c64139816c.image.jpg');

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
VALUES (1, 'Anthony', 0, 'https://cdn.pixabay.com/photo/2018/03/06/19/33/vase-3204337_960_720.jpg', '2022-01-01', 1, 1, 1),
       (2, 'Orchid', 2, 'https://images.pexels.com/photos/7814295/pexels-photo-7814295.jpeg', '2022-03-15', 1, 1, 7),
       (3, 'Beth', 1, 'https://cdn.pixabay.com/photo/2021/05/16/01/04/orchids-6256963_960_720.jpg', '2022-04-20', 2, 1, 4),
       (4, 'Juliana the Cactus', 2, 'https://cdn.pixabay.com/photo/2016/11/21/16/05/cacti-1846147_960_720.jpg', '2022-02-10', 2, 1, 5);

INSERT INTO public.plant_sensor (id, name, sensor_code, user_id, plant_id)
VALUES (1, 'Anthony Sensor', 'ANT123', 1, 1),
       (2, 'Orchid Sensor', 'WEN123', 1, 2),
       (3, 'Beth Sensor', 'BTH123', 1, 3),
       (4, 'Juliana Sensor', 'JUL123', 1, 4);
       
INSERT INTO public.tasks_current VALUES (1, 'Water Anthony',
                         CURRENT_DATE, 0, 1),
                        (2, 'Change Orchid soil mix',
                         '2023-05-13', 1, 2),
                     (4, 'Check Juliana''s condition ',
                         '2023-05-15', 3, 4),
                     (5, 'Fertilize Anthony',
                         CURRENT_DATE, 4, 1),
                         (6, 'Change Anthony soil mix',
                         CURRENT_DATE, 1, 2),
                         (7, 'Check Anthony''s condition ',
                         CURRENT_DATE, 3, 4),
                         (8, 'Water Orchid',
                         '2023-05-22', 0, 1),
                         (9, 'Water Beth',
                         '2023-05-13', 0, 1),
                         (10, 'Water Juliana',
                         '2023-05-15', 0, 1);
                         
INSERT INTO public.task_settings VALUES (1, TRUE, 7, 0, 1),
                        (2, TRUE,450, 1, 1),
                        (3, TRUE,7, 3, 1),
                        (4, TRUE,30, 4, 1),
                        (5, TRUE,4, 0, 2),
                        (6, TRUE,450, 1, 2),
                        (7, TRUE,5, 3, 2),
                        (8, TRUE,30, 4, 2),
                        (9, TRUE,7, 0, 3),
                        (10, TRUE,450, 1, 3),
                        (11, TRUE,7, 3, 3),
                        (12, TRUE,30, 4, 3),
                        (13, TRUE,10, 0, 4),
                        (14, TRUE,450, 1, 4),
                        (15, TRUE,10, 3, 4),
                        (16, TRUE,60, 4, 4);
     
INSERT INTO public.tasks_history VALUES (1, '2023-04-10', 'Water Anthony', 0, 1),
                        (2,'2023-04-13', 'Change Orchid soil mix', 1, 2),
                     (4,'2023-04-15','Check Juliana''s condition ', 3, 4),
                     (5,'2023-04-18', 'Fertilize Anthony', 4, 1),
                         (6, '2023-04-18', 'Change Anthony soil mix', 1, 2),
                         (7, '2023-04-18','Check Anthony''s condition ', 3, 4),
                         (8,'2023-04-22', 'Water Orchid', 0, 1),
                         (9, '2023-04-13', 'Water Beth', 0, 1),
                         (10,'2023-04-15', 'Water Juliana', 0, 1);                    
                         
                                    
  
-- SETTING ID's               
                 

SELECT pg_catalog.setval('public.air_quality_measurement_seq', (SELECT MAX(id) FROM public.air_quality_measurement WHERE id > 0));


--
-- Name: air_temperature_measurement_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.air_temperature_measurement_seq', (SELECT MAX(id) FROM public.air_temperature_measurement WHERE id > 0));


--
-- Name: comment_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comments_seq', (SELECT MAX(id) FROM public.comments WHERE id > 0));


--
-- Name: disease_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.disease_seq', (SELECT MAX(id) FROM public.disease WHERE id > 0));


--
-- Name: division_sensor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.division_sensor_seq', (SELECT MAX(id) FROM public.division_sensor WHERE id > 0));


--
-- Name: division_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.division_seq', (SELECT MAX(id) FROM public.division WHERE id > 0));


--
-- Name: journal_entry_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.journal_entry_seq', (SELECT MAX(id) FROM public.journal_entry WHERE id > 0));


--
-- Name: plant_sensor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.plant_sensor_seq', (SELECT MAX(id) FROM public.plant_sensor WHERE id > 0));


--
-- Name: plant_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.plant_seq', (SELECT MAX(id) FROM public.plant WHERE id > 0));


--
-- Name: plant_species_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.plant_species_seq', (SELECT MAX(id) FROM public.plant_species WHERE id > 0));


--
-- Name: soil_quality_measurement_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.soil_quality_measurement_seq', (SELECT MAX(id) FROM public.soil_quality_measurement WHERE id > 0));


--
-- Name: species_family_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.species_family_seq', (SELECT MAX(id) FROM public.species_family WHERE id > 0));


--
-- Name: task_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tasks_current_seq', (SELECT MAX(id) FROM public.tasks_current WHERE id > 0));

SELECT pg_catalog.setval('public.task_settings_seq', (SELECT MAX(id) FROM public.task_settings WHERE id > 0));

SELECT pg_catalog.setval('public.tasks_history_seq', (SELECT MAX(id) FROM public.tasks_history WHERE id > 0));

--
-- Name: utilizador_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.utilizador_seq', (SELECT MAX(id) FROM public.utilizador WHERE id > 0));


--
-- Name: air_quality_measurement air_quality_measurement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

