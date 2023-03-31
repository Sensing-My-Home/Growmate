SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: comment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comment (
    id bigint NOT NULL,
    post_date timestamp without time zone,
    text character varying(255) NOT NULL,
    title character varying(255) NOT NULL,
    plant_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.comment OWNER TO postgres;

--
-- Name: comment_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comment_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comment_seq OWNER TO postgres;

--
-- Name: disease; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.disease (
    id bigint NOT NULL,
    common_name character varying(255),
    description character varying(255),
    scientific_name character varying(255),
    solution character varying(255)
);


ALTER TABLE public.disease OWNER TO postgres;

--
-- Name: disease_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.disease_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.disease_seq OWNER TO postgres;

--
-- Name: disease_species; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.disease_species (
    species_id bigint NOT NULL,
    disease_id bigint NOT NULL
);


ALTER TABLE public.disease_species OWNER TO postgres;

--
-- Name: division; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.division (
    id bigint NOT NULL,
    luminosity integer,
    name character varying(255) NOT NULL,
    user_id bigint
);


ALTER TABLE public.division OWNER TO postgres;

--
-- Name: division_sensor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.division_sensor (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    sensor_code character varying(255) NOT NULL,
    division_id bigint,
    user_id bigint NOT NULL
);


ALTER TABLE public.division_sensor OWNER TO postgres;

--
-- Name: division_sensor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.division_sensor_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.division_sensor_seq OWNER TO postgres;

--
-- Name: division_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.division_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.division_seq OWNER TO postgres;

--
-- Name: journal_entry; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.journal_entry (
    id bigint NOT NULL,
    photo character varying(255),
    task_date timestamp without time zone,
    text character varying(255) NOT NULL,
    title character varying(255) NOT NULL,
    plant_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.journal_entry OWNER TO postgres;

--
-- Name: journal_entry_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.journal_entry_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.journal_entry_seq OWNER TO postgres;

--
-- Name: plant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plant (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    plant_condition integer,
    photo character varying(255),
    plantation_date date,
    division_id bigint NOT NULL,
    user_id bigint NOT NULL,
    species_id bigint NOT NULL
);


ALTER TABLE public.plant OWNER TO postgres;

--
-- Name: plant_sensor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plant_sensor (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    sensor_code character varying(255) NOT NULL,
    user_id bigint NOT NULL,
    plant_id bigint
);


ALTER TABLE public.plant_sensor OWNER TO postgres;

--
-- Name: plant_sensor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.plant_sensor_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.plant_sensor_seq OWNER TO postgres;

--
-- Name: plant_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.plant_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.plant_seq OWNER TO postgres;

--
-- Name: plant_species; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plant_species (
    id bigint NOT NULL,
    common_name character varying(255),
    cycle character varying(255),
    difficulty integer,
    flowering boolean,
    leaf_color character varying(255),
    optimal_humidity integer,
    optimal_luminosity smallint,
    optimal_temperature integer,
    scientific_name character varying(255),
    season integer,
    photo character varying(255),
    usual_size double precision,
    watering_frequency integer,
    family_id bigint NOT NULL,
    CONSTRAINT plant_species_difficulty_check CHECK (((difficulty <= 5) AND (difficulty >= 1)))
);


ALTER TABLE public.plant_species OWNER TO postgres;

--
-- Name: plant_species_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.plant_species_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.plant_species_seq OWNER TO postgres;

--
-- Name: reaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reaction (
    reaction_date timestamp without time zone,
    type boolean,
    comment_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.reaction OWNER TO postgres;

--
-- Name: species_family; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.species_family (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    opt_soil_mix integer
);


ALTER TABLE public.species_family OWNER TO postgres;

--
-- Name: species_family_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.species_family_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.species_family_seq OWNER TO postgres;

--
-- Name: task; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.task (
    id bigint NOT NULL,
    description character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    task_date timestamp without time zone,
    plant_id bigint
);


ALTER TABLE public.task OWNER TO postgres;

--
-- Name: task_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.task_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.task_seq OWNER TO postgres;

--
-- Name: utilizador; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.utilizador (
    id bigint NOT NULL,
    address character varying(255),
    dob date,
    email character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    profile_photo character varying(255),
    rating integer DEFAULT 3.0,
    user_type integer
);


ALTER TABLE public.utilizador OWNER TO postgres;

--
-- Name: utilizador_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.utilizador_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.utilizador_seq OWNER TO postgres;

--
-- Data for Name: comment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comment (id, post_date, text, title, plant_id, user_id) FROM stdin;
\.
COPY public.comment (id, post_date, text, title, plant_id, user_id) FROM '$$PATH$$/3116.dat';

--
-- Data for Name: disease; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.disease (id, common_name, description, scientific_name, solution) FROM stdin;
\.
COPY public.disease (id, common_name, description, scientific_name, solution) FROM '$$PATH$$/3117.dat';

--
-- Data for Name: disease_species; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.disease_species (species_id, disease_id) FROM stdin;
\.
COPY public.disease_species (species_id, disease_id) FROM '$$PATH$$/3118.dat';

--
-- Data for Name: division; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.division (id, luminosity, name, user_id) FROM stdin;
\.
COPY public.division (id, luminosity, name, user_id) FROM '$$PATH$$/3119.dat';

--
-- Data for Name: division_sensor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.division_sensor (id, name, sensor_code, division_id, user_id) FROM stdin;
\.
COPY public.division_sensor (id, name, sensor_code, division_id, user_id) FROM '$$PATH$$/3120.dat';

--
-- Data for Name: journal_entry; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.journal_entry (id, photo, task_date, text, title, plant_id, user_id) FROM stdin;
\.
COPY public.journal_entry (id, photo, task_date, text, title, plant_id, user_id) FROM '$$PATH$$/3121.dat';

--
-- Data for Name: plant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plant (id, name, plant_condition, photo, plantation_date, division_id, user_id, species_id) FROM stdin;
\.
COPY public.plant (id, name, plant_condition, photo, plantation_date, division_id, user_id, species_id) FROM '$$PATH$$/3122.dat';

--
-- Data for Name: plant_sensor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plant_sensor (id, name, sensor_code, user_id, plant_id) FROM stdin;
\.
COPY public.plant_sensor (id, name, sensor_code, user_id, plant_id) FROM '$$PATH$$/3123.dat';

--
-- Data for Name: plant_species; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plant_species (id, common_name, cycle, difficulty, flowering, leaf_color, optimal_humidity, optimal_luminosity, optimal_temperature, scientific_name, season, photo, usual_size, watering_frequency, family_id) FROM stdin;
\.
COPY public.plant_species (id, common_name, cycle, difficulty, flowering, leaf_color, optimal_humidity, optimal_luminosity, optimal_temperature, scientific_name, season, photo, usual_size, watering_frequency, family_id) FROM '$$PATH$$/3124.dat';

--
-- Data for Name: reaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reaction (reaction_date, type, comment_id, user_id) FROM stdin;
\.
COPY public.reaction (reaction_date, type, comment_id, user_id) FROM '$$PATH$$/3125.dat';

--
-- Data for Name: species_family; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.species_family (id, name, opt_soil_mix) FROM stdin;
\.
COPY public.species_family (id, name, opt_soil_mix) FROM '$$PATH$$/3126.dat';

--
-- Data for Name: task; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.task (id, description, name, task_date, plant_id) FROM stdin;
\.
COPY public.task (id, description, name, task_date, plant_id) FROM '$$PATH$$/3127.dat';

--
-- Data for Name: utilizador; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.utilizador (id, address, dob, email, name, password, profile_photo, rating, user_type) FROM stdin;
\.
COPY public.utilizador (id, address, dob, email, name, password, profile_photo, rating, user_type) FROM '$$PATH$$/3128.dat';

--
-- Name: comment_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comment_seq', 1, false);


--
-- Name: disease_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.disease_seq', 1, false);


--
-- Name: division_sensor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.division_sensor_seq', 1, false);


--
-- Name: division_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.division_seq', 1, false);


--
-- Name: journal_entry_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.journal_entry_seq', 1, false);


--
-- Name: plant_sensor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.plant_sensor_seq', 1, false);


--
-- Name: plant_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.plant_seq', 1, false);


--
-- Name: plant_species_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.plant_species_seq', 1, false);


--
-- Name: species_family_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.species_family_seq', 1, false);


--
-- Name: task_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.task_seq', 1, false);


--
-- Name: utilizador_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.utilizador_seq', 1, false);


--
-- Name: comment comment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (id);


--
-- Name: disease disease_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disease
    ADD CONSTRAINT disease_pkey PRIMARY KEY (id);


--
-- Name: disease_species disease_species_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disease_species
    ADD CONSTRAINT disease_species_pkey PRIMARY KEY (species_id, disease_id);


--
-- Name: division division_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.division
    ADD CONSTRAINT division_pkey PRIMARY KEY (id);


--
-- Name: division_sensor division_sensor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.division_sensor
    ADD CONSTRAINT division_sensor_pkey PRIMARY KEY (id);


--
-- Name: journal_entry journal_entry_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journal_entry
    ADD CONSTRAINT journal_entry_pkey PRIMARY KEY (id);


--
-- Name: plant plant_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plant
    ADD CONSTRAINT plant_pkey PRIMARY KEY (id);


--
-- Name: plant_sensor plant_sensor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plant_sensor
    ADD CONSTRAINT plant_sensor_pkey PRIMARY KEY (id);


--
-- Name: plant_species plant_species_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plant_species
    ADD CONSTRAINT plant_species_pkey PRIMARY KEY (id);


--
-- Name: reaction reaction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reaction
    ADD CONSTRAINT reaction_pkey PRIMARY KEY (comment_id, user_id);


--
-- Name: species_family species_family_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.species_family
    ADD CONSTRAINT species_family_pkey PRIMARY KEY (id);


--
-- Name: task task_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task
    ADD CONSTRAINT task_pkey PRIMARY KEY (id);


--
-- Name: utilizador uk_eougu510uft70icifeafv6cll; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilizador
    ADD CONSTRAINT uk_eougu510uft70icifeafv6cll UNIQUE (email);


--
-- Name: utilizador utilizador_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilizador
    ADD CONSTRAINT utilizador_pkey PRIMARY KEY (id);


--
-- Name: plant fk5jd6laslwrgxjwa3l5otl9jkr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plant
    ADD CONSTRAINT fk5jd6laslwrgxjwa3l5otl9jkr FOREIGN KEY (species_id) REFERENCES public.plant_species(id);


--
-- Name: task fk6383pmmnxggdbb55w0w9755uu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task
    ADD CONSTRAINT fk6383pmmnxggdbb55w0w9755uu FOREIGN KEY (plant_id) REFERENCES public.plant(id);


--
-- Name: plant_species fk6n04l7vwbivxhn9q8ga1pa0ci; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plant_species
    ADD CONSTRAINT fk6n04l7vwbivxhn9q8ga1pa0ci FOREIGN KEY (family_id) REFERENCES public.species_family(id);


--
-- Name: division fk6ppwaynkyagxqq91smwnsqidd; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.division
    ADD CONSTRAINT fk6ppwaynkyagxqq91smwnsqidd FOREIGN KEY (user_id) REFERENCES public.utilizador(id);


--
-- Name: disease_species fk87leowsufcg3mls3srwt5yjau; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disease_species
    ADD CONSTRAINT fk87leowsufcg3mls3srwt5yjau FOREIGN KEY (disease_id) REFERENCES public.disease(id);


--
-- Name: plant_sensor fk884kjcpa2h95xiseysvbxtdtv; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plant_sensor
    ADD CONSTRAINT fk884kjcpa2h95xiseysvbxtdtv FOREIGN KEY (user_id) REFERENCES public.utilizador(id);


--
-- Name: disease_species fk8ajf2to31ynh49q8at0vuahr2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disease_species
    ADD CONSTRAINT fk8ajf2to31ynh49q8at0vuahr2 FOREIGN KEY (species_id) REFERENCES public.plant_species(id);


--
-- Name: plant_sensor fkbrhn62f4x2gttruutny9w1kl8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plant_sensor
    ADD CONSTRAINT fkbrhn62f4x2gttruutny9w1kl8 FOREIGN KEY (plant_id) REFERENCES public.plant(id);


--
-- Name: division_sensor fkdaja3tfjeo4bqfais627qxe3u; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.division_sensor
    ADD CONSTRAINT fkdaja3tfjeo4bqfais627qxe3u FOREIGN KEY (division_id) REFERENCES public.division(id);


--
-- Name: comment fkf1m5ypf6babiqbvd679v7oy2c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT fkf1m5ypf6babiqbvd679v7oy2c FOREIGN KEY (plant_id) REFERENCES public.plant(id);


--
-- Name: comment fkf4vjea1lveykjhcv7v2ty51mn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT fkf4vjea1lveykjhcv7v2ty51mn FOREIGN KEY (user_id) REFERENCES public.utilizador(id);


--
-- Name: journal_entry fkgyalj060wprr46vnjhe3gi9v8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journal_entry
    ADD CONSTRAINT fkgyalj060wprr46vnjhe3gi9v8 FOREIGN KEY (plant_id) REFERENCES public.plant(id);


--
-- Name: journal_entry fkhjg29d4tlypqcirns3gd2w7jf; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journal_entry
    ADD CONSTRAINT fkhjg29d4tlypqcirns3gd2w7jf FOREIGN KEY (user_id) REFERENCES public.utilizador(id);


--
-- Name: reaction fkhsdvlyfl5xhtnkgv65ahshp2d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reaction
    ADD CONSTRAINT fkhsdvlyfl5xhtnkgv65ahshp2d FOREIGN KEY (user_id) REFERENCES public.utilizador(id);


--
-- Name: plant fki3cr4h4gd0vuk7n6qxyycrda2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plant
    ADD CONSTRAINT fki3cr4h4gd0vuk7n6qxyycrda2 FOREIGN KEY (user_id) REFERENCES public.utilizador(id);


--
-- Name: plant fkkfg428pcea4j36umlvtq913iv; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plant
    ADD CONSTRAINT fkkfg428pcea4j36umlvtq913iv FOREIGN KEY (division_id) REFERENCES public.division(id);


--
-- Name: division_sensor fks07ef89lxgact4718geb85cr9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.division_sensor
    ADD CONSTRAINT fks07ef89lxgact4718geb85cr9 FOREIGN KEY (user_id) REFERENCES public.utilizador(id);


--
-- Name: reaction fkskbqddo2ffvogxr3f22awp2wa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reaction
    ADD CONSTRAINT fkskbqddo2ffvogxr3f22awp2wa FOREIGN KEY (comment_id) REFERENCES public.comment(id);


--
-- PostgreSQL database dump complete
--

\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00
