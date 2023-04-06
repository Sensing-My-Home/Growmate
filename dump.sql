toc.dat                                                                                             0000600 0004000 0002000 00000077363 14413571427 0014467 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP                           {            db    13.1    13.1 f    \           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         ]           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         ^           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         _           1262    16384    db    DATABASE     V   CREATE DATABASE db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';
    DROP DATABASE db;
                postgres    false         �            1259    16413    air_quality_measurement    TABLE     �   CREATE TABLE public.air_quality_measurement (
    id bigint NOT NULL,
    measurement double precision,
    post_date timestamp without time zone,
    sensor_id bigint NOT NULL
);
 +   DROP TABLE public.air_quality_measurement;
       public         heap    postgres    false         �            1259    16385    air_quality_measurement_seq    SEQUENCE     �   CREATE SEQUENCE public.air_quality_measurement_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.air_quality_measurement_seq;
       public          postgres    false         �            1259    16418    air_temperature_measurement    TABLE     �   CREATE TABLE public.air_temperature_measurement (
    id bigint NOT NULL,
    measurement double precision,
    post_date timestamp without time zone,
    sensor_id bigint NOT NULL
);
 /   DROP TABLE public.air_temperature_measurement;
       public         heap    postgres    false         �            1259    16387    air_temperature_measurement_seq    SEQUENCE     �   CREATE SEQUENCE public.air_temperature_measurement_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.air_temperature_measurement_seq;
       public          postgres    false         �            1259    16423    comment    TABLE     �   CREATE TABLE public.comment (
    id bigint NOT NULL,
    post_date timestamp without time zone,
    text character varying(255) NOT NULL,
    title character varying(255) NOT NULL,
    plant_id bigint NOT NULL,
    user_id bigint NOT NULL
);
    DROP TABLE public.comment;
       public         heap    postgres    false         �            1259    16389    comment_seq    SEQUENCE     u   CREATE SEQUENCE public.comment_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.comment_seq;
       public          postgres    false         �            1259    16431    disease    TABLE     �   CREATE TABLE public.disease (
    id bigint NOT NULL,
    common_name character varying(255),
    description character varying(255),
    scientific_name character varying(255),
    solution character varying(255)
);
    DROP TABLE public.disease;
       public         heap    postgres    false         �            1259    16391    disease_seq    SEQUENCE     u   CREATE SEQUENCE public.disease_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.disease_seq;
       public          postgres    false         �            1259    16439    disease_species    TABLE     h   CREATE TABLE public.disease_species (
    species_id bigint NOT NULL,
    disease_id bigint NOT NULL
);
 #   DROP TABLE public.disease_species;
       public         heap    postgres    false         �            1259    16444    division    TABLE     �   CREATE TABLE public.division (
    id bigint NOT NULL,
    luminosity integer,
    name character varying(255) NOT NULL,
    user_id bigint
);
    DROP TABLE public.division;
       public         heap    postgres    false         �            1259    16449    division_sensor    TABLE     �   CREATE TABLE public.division_sensor (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    sensor_code character varying(255) NOT NULL,
    division_id bigint,
    user_id bigint NOT NULL
);
 #   DROP TABLE public.division_sensor;
       public         heap    postgres    false         �            1259    16393    division_sensor_seq    SEQUENCE     }   CREATE SEQUENCE public.division_sensor_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.division_sensor_seq;
       public          postgres    false         �            1259    16395    division_seq    SEQUENCE     v   CREATE SEQUENCE public.division_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.division_seq;
       public          postgres    false         �            1259    16457    journal_entry    TABLE       CREATE TABLE public.journal_entry (
    id bigint NOT NULL,
    photo character varying(255),
    post_date timestamp without time zone,
    text character varying(255) NOT NULL,
    title character varying(255) NOT NULL,
    plant_id bigint NOT NULL,
    user_id bigint NOT NULL
);
 !   DROP TABLE public.journal_entry;
       public         heap    postgres    false         �            1259    16397    journal_entry_seq    SEQUENCE     {   CREATE SEQUENCE public.journal_entry_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.journal_entry_seq;
       public          postgres    false         �            1259    16465    plant    TABLE       CREATE TABLE public.plant (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    plant_condition integer,
    photo character varying(255),
    plantation_date date,
    division_id bigint NOT NULL,
    user_id bigint NOT NULL,
    species_id bigint NOT NULL
);
    DROP TABLE public.plant;
       public         heap    postgres    false         �            1259    16473    plant_sensor    TABLE     �   CREATE TABLE public.plant_sensor (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    sensor_code character varying(255) NOT NULL,
    user_id bigint NOT NULL,
    plant_id bigint
);
     DROP TABLE public.plant_sensor;
       public         heap    postgres    false         �            1259    16399    plant_sensor_seq    SEQUENCE     z   CREATE SEQUENCE public.plant_sensor_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.plant_sensor_seq;
       public          postgres    false         �            1259    16401 	   plant_seq    SEQUENCE     s   CREATE SEQUENCE public.plant_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
     DROP SEQUENCE public.plant_seq;
       public          postgres    false         �            1259    16481    plant_species    TABLE     a  CREATE TABLE public.plant_species (
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
 !   DROP TABLE public.plant_species;
       public         heap    postgres    false         �            1259    16403    plant_species_seq    SEQUENCE     {   CREATE SEQUENCE public.plant_species_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.plant_species_seq;
       public          postgres    false         �            1259    16490    reaction    TABLE     �   CREATE TABLE public.reaction (
    reaction_date timestamp without time zone,
    type boolean,
    comment_id bigint NOT NULL,
    user_id bigint NOT NULL
);
    DROP TABLE public.reaction;
       public         heap    postgres    false         �            1259    16495    soil_quality_measurement    TABLE     �   CREATE TABLE public.soil_quality_measurement (
    id bigint NOT NULL,
    measurement double precision,
    post_date timestamp without time zone,
    sensor_id bigint NOT NULL
);
 ,   DROP TABLE public.soil_quality_measurement;
       public         heap    postgres    false         �            1259    16405    soil_quality_measurement_seq    SEQUENCE     �   CREATE SEQUENCE public.soil_quality_measurement_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.soil_quality_measurement_seq;
       public          postgres    false         �            1259    16500    species_family    TABLE     �   CREATE TABLE public.species_family (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    opt_soil_mix integer
);
 "   DROP TABLE public.species_family;
       public         heap    postgres    false         �            1259    16407    species_family_seq    SEQUENCE     |   CREATE SEQUENCE public.species_family_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.species_family_seq;
       public          postgres    false         �            1259    16505    task    TABLE     �   CREATE TABLE public.task (
    id bigint NOT NULL,
    description character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    task_date date,
    task_type integer,
    plant_id bigint
);
    DROP TABLE public.task;
       public         heap    postgres    false         �            1259    16409    task_seq    SEQUENCE     r   CREATE SEQUENCE public.task_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    DROP SEQUENCE public.task_seq;
       public          postgres    false         �            1259    16513 
   utilizador    TABLE     Q  CREATE TABLE public.utilizador (
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
    DROP TABLE public.utilizador;
       public         heap    postgres    false         �            1259    16411    utilizador_seq    SEQUENCE     x   CREATE SEQUENCE public.utilizador_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.utilizador_seq;
       public          postgres    false         J          0    16413    air_quality_measurement 
   TABLE DATA           X   COPY public.air_quality_measurement (id, measurement, post_date, sensor_id) FROM stdin;
    public          postgres    false    214       3146.dat K          0    16418    air_temperature_measurement 
   TABLE DATA           \   COPY public.air_temperature_measurement (id, measurement, post_date, sensor_id) FROM stdin;
    public          postgres    false    215       3147.dat L          0    16423    comment 
   TABLE DATA           P   COPY public.comment (id, post_date, text, title, plant_id, user_id) FROM stdin;
    public          postgres    false    216       3148.dat M          0    16431    disease 
   TABLE DATA           Z   COPY public.disease (id, common_name, description, scientific_name, solution) FROM stdin;
    public          postgres    false    217       3149.dat N          0    16439    disease_species 
   TABLE DATA           A   COPY public.disease_species (species_id, disease_id) FROM stdin;
    public          postgres    false    218       3150.dat O          0    16444    division 
   TABLE DATA           A   COPY public.division (id, luminosity, name, user_id) FROM stdin;
    public          postgres    false    219       3151.dat P          0    16449    division_sensor 
   TABLE DATA           V   COPY public.division_sensor (id, name, sensor_code, division_id, user_id) FROM stdin;
    public          postgres    false    220       3152.dat Q          0    16457    journal_entry 
   TABLE DATA           ]   COPY public.journal_entry (id, photo, post_date, text, title, plant_id, user_id) FROM stdin;
    public          postgres    false    221       3153.dat R          0    16465    plant 
   TABLE DATA           t   COPY public.plant (id, name, plant_condition, photo, plantation_date, division_id, user_id, species_id) FROM stdin;
    public          postgres    false    222       3154.dat S          0    16473    plant_sensor 
   TABLE DATA           P   COPY public.plant_sensor (id, name, sensor_code, user_id, plant_id) FROM stdin;
    public          postgres    false    223       3155.dat T          0    16481    plant_species 
   TABLE DATA           �   COPY public.plant_species (id, common_name, cycle, difficulty, flowering, leaf_color, optimal_humidity, optimal_luminosity, optimal_temperature, scientific_name, season, photo, usual_size, watering_frequency, family_id) FROM stdin;
    public          postgres    false    224       3156.dat U          0    16490    reaction 
   TABLE DATA           L   COPY public.reaction (reaction_date, type, comment_id, user_id) FROM stdin;
    public          postgres    false    225       3157.dat V          0    16495    soil_quality_measurement 
   TABLE DATA           Y   COPY public.soil_quality_measurement (id, measurement, post_date, sensor_id) FROM stdin;
    public          postgres    false    226       3158.dat W          0    16500    species_family 
   TABLE DATA           @   COPY public.species_family (id, name, opt_soil_mix) FROM stdin;
    public          postgres    false    227       3159.dat X          0    16505    task 
   TABLE DATA           U   COPY public.task (id, description, name, task_date, task_type, plant_id) FROM stdin;
    public          postgres    false    228       3160.dat Y          0    16513 
   utilizador 
   TABLE DATA           o   COPY public.utilizador (id, address, dob, email, name, password, profile_photo, rating, user_type) FROM stdin;
    public          postgres    false    229       3161.dat `           0    0    air_quality_measurement_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.air_quality_measurement_seq', 1, false);
          public          postgres    false    200         a           0    0    air_temperature_measurement_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.air_temperature_measurement_seq', 1, false);
          public          postgres    false    201         b           0    0    comment_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.comment_seq', 1, false);
          public          postgres    false    202         c           0    0    disease_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.disease_seq', 1, false);
          public          postgres    false    203         d           0    0    division_sensor_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.division_sensor_seq', 1, false);
          public          postgres    false    204         e           0    0    division_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.division_seq', 1, false);
          public          postgres    false    205         f           0    0    journal_entry_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.journal_entry_seq', 1, false);
          public          postgres    false    206         g           0    0    plant_sensor_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.plant_sensor_seq', 1, false);
          public          postgres    false    207         h           0    0 	   plant_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('public.plant_seq', 1, false);
          public          postgres    false    208         i           0    0    plant_species_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.plant_species_seq', 1, false);
          public          postgres    false    209         j           0    0    soil_quality_measurement_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.soil_quality_measurement_seq', 1, false);
          public          postgres    false    210         k           0    0    species_family_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.species_family_seq', 1, false);
          public          postgres    false    211         l           0    0    task_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('public.task_seq', 1, false);
          public          postgres    false    212         m           0    0    utilizador_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.utilizador_seq', 1, false);
          public          postgres    false    213         �           2606    16417 4   air_quality_measurement air_quality_measurement_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.air_quality_measurement
    ADD CONSTRAINT air_quality_measurement_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.air_quality_measurement DROP CONSTRAINT air_quality_measurement_pkey;
       public            postgres    false    214         �           2606    16422 <   air_temperature_measurement air_temperature_measurement_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.air_temperature_measurement
    ADD CONSTRAINT air_temperature_measurement_pkey PRIMARY KEY (id);
 f   ALTER TABLE ONLY public.air_temperature_measurement DROP CONSTRAINT air_temperature_measurement_pkey;
       public            postgres    false    215         �           2606    16430    comment comment_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.comment DROP CONSTRAINT comment_pkey;
       public            postgres    false    216         �           2606    16438    disease disease_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.disease
    ADD CONSTRAINT disease_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.disease DROP CONSTRAINT disease_pkey;
       public            postgres    false    217         �           2606    16443 $   disease_species disease_species_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.disease_species
    ADD CONSTRAINT disease_species_pkey PRIMARY KEY (species_id, disease_id);
 N   ALTER TABLE ONLY public.disease_species DROP CONSTRAINT disease_species_pkey;
       public            postgres    false    218    218         �           2606    16448    division division_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.division
    ADD CONSTRAINT division_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.division DROP CONSTRAINT division_pkey;
       public            postgres    false    219         �           2606    16456 $   division_sensor division_sensor_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.division_sensor
    ADD CONSTRAINT division_sensor_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.division_sensor DROP CONSTRAINT division_sensor_pkey;
       public            postgres    false    220         �           2606    16464     journal_entry journal_entry_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.journal_entry
    ADD CONSTRAINT journal_entry_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.journal_entry DROP CONSTRAINT journal_entry_pkey;
       public            postgres    false    221         �           2606    16472    plant plant_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.plant
    ADD CONSTRAINT plant_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.plant DROP CONSTRAINT plant_pkey;
       public            postgres    false    222         �           2606    16480    plant_sensor plant_sensor_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.plant_sensor
    ADD CONSTRAINT plant_sensor_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.plant_sensor DROP CONSTRAINT plant_sensor_pkey;
       public            postgres    false    223         �           2606    16489     plant_species plant_species_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.plant_species
    ADD CONSTRAINT plant_species_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.plant_species DROP CONSTRAINT plant_species_pkey;
       public            postgres    false    224         �           2606    16494    reaction reaction_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.reaction
    ADD CONSTRAINT reaction_pkey PRIMARY KEY (comment_id, user_id);
 @   ALTER TABLE ONLY public.reaction DROP CONSTRAINT reaction_pkey;
       public            postgres    false    225    225         �           2606    16499 6   soil_quality_measurement soil_quality_measurement_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.soil_quality_measurement
    ADD CONSTRAINT soil_quality_measurement_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.soil_quality_measurement DROP CONSTRAINT soil_quality_measurement_pkey;
       public            postgres    false    226         �           2606    16504 "   species_family species_family_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.species_family
    ADD CONSTRAINT species_family_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.species_family DROP CONSTRAINT species_family_pkey;
       public            postgres    false    227         �           2606    16512    task task_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.task
    ADD CONSTRAINT task_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.task DROP CONSTRAINT task_pkey;
       public            postgres    false    228         �           2606    16523 '   utilizador uk_eougu510uft70icifeafv6cll 
   CONSTRAINT     c   ALTER TABLE ONLY public.utilizador
    ADD CONSTRAINT uk_eougu510uft70icifeafv6cll UNIQUE (email);
 Q   ALTER TABLE ONLY public.utilizador DROP CONSTRAINT uk_eougu510uft70icifeafv6cll;
       public            postgres    false    229         �           2606    16521    utilizador utilizador_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.utilizador
    ADD CONSTRAINT utilizador_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.utilizador DROP CONSTRAINT utilizador_pkey;
       public            postgres    false    229         �           2606    16529 7   air_temperature_measurement fk41u4nsy89voy1e9vs72l0ctii    FK CONSTRAINT     �   ALTER TABLE ONLY public.air_temperature_measurement
    ADD CONSTRAINT fk41u4nsy89voy1e9vs72l0ctii FOREIGN KEY (sensor_id) REFERENCES public.division_sensor(id);
 a   ALTER TABLE ONLY public.air_temperature_measurement DROP CONSTRAINT fk41u4nsy89voy1e9vs72l0ctii;
       public          postgres    false    220    215    2960         �           2606    16524 3   air_quality_measurement fk57swwrmull8tmmgwhw2w0s7ny    FK CONSTRAINT     �   ALTER TABLE ONLY public.air_quality_measurement
    ADD CONSTRAINT fk57swwrmull8tmmgwhw2w0s7ny FOREIGN KEY (sensor_id) REFERENCES public.division_sensor(id);
 ]   ALTER TABLE ONLY public.air_quality_measurement DROP CONSTRAINT fk57swwrmull8tmmgwhw2w0s7ny;
       public          postgres    false    220    214    2960         �           2606    16589 !   plant fk5jd6laslwrgxjwa3l5otl9jkr    FK CONSTRAINT     �   ALTER TABLE ONLY public.plant
    ADD CONSTRAINT fk5jd6laslwrgxjwa3l5otl9jkr FOREIGN KEY (species_id) REFERENCES public.plant_species(id);
 K   ALTER TABLE ONLY public.plant DROP CONSTRAINT fk5jd6laslwrgxjwa3l5otl9jkr;
       public          postgres    false    2968    222    224         �           2606    16624     task fk6383pmmnxggdbb55w0w9755uu    FK CONSTRAINT     �   ALTER TABLE ONLY public.task
    ADD CONSTRAINT fk6383pmmnxggdbb55w0w9755uu FOREIGN KEY (plant_id) REFERENCES public.plant(id);
 J   ALTER TABLE ONLY public.task DROP CONSTRAINT fk6383pmmnxggdbb55w0w9755uu;
       public          postgres    false    228    222    2964         �           2606    16604 )   plant_species fk6n04l7vwbivxhn9q8ga1pa0ci    FK CONSTRAINT     �   ALTER TABLE ONLY public.plant_species
    ADD CONSTRAINT fk6n04l7vwbivxhn9q8ga1pa0ci FOREIGN KEY (family_id) REFERENCES public.species_family(id);
 S   ALTER TABLE ONLY public.plant_species DROP CONSTRAINT fk6n04l7vwbivxhn9q8ga1pa0ci;
       public          postgres    false    227    224    2974         �           2606    16554 $   division fk6ppwaynkyagxqq91smwnsqidd    FK CONSTRAINT     �   ALTER TABLE ONLY public.division
    ADD CONSTRAINT fk6ppwaynkyagxqq91smwnsqidd FOREIGN KEY (user_id) REFERENCES public.utilizador(id);
 N   ALTER TABLE ONLY public.division DROP CONSTRAINT fk6ppwaynkyagxqq91smwnsqidd;
       public          postgres    false    219    229    2980         �           2606    16619 4   soil_quality_measurement fk7bdgp1b6gbn8yn7guiw8iq3cb    FK CONSTRAINT     �   ALTER TABLE ONLY public.soil_quality_measurement
    ADD CONSTRAINT fk7bdgp1b6gbn8yn7guiw8iq3cb FOREIGN KEY (sensor_id) REFERENCES public.plant_sensor(id);
 ^   ALTER TABLE ONLY public.soil_quality_measurement DROP CONSTRAINT fk7bdgp1b6gbn8yn7guiw8iq3cb;
       public          postgres    false    2966    223    226         �           2606    16544 +   disease_species fk87leowsufcg3mls3srwt5yjau    FK CONSTRAINT     �   ALTER TABLE ONLY public.disease_species
    ADD CONSTRAINT fk87leowsufcg3mls3srwt5yjau FOREIGN KEY (disease_id) REFERENCES public.disease(id);
 U   ALTER TABLE ONLY public.disease_species DROP CONSTRAINT fk87leowsufcg3mls3srwt5yjau;
       public          postgres    false    217    2954    218         �           2606    16594 (   plant_sensor fk884kjcpa2h95xiseysvbxtdtv    FK CONSTRAINT     �   ALTER TABLE ONLY public.plant_sensor
    ADD CONSTRAINT fk884kjcpa2h95xiseysvbxtdtv FOREIGN KEY (user_id) REFERENCES public.utilizador(id);
 R   ALTER TABLE ONLY public.plant_sensor DROP CONSTRAINT fk884kjcpa2h95xiseysvbxtdtv;
       public          postgres    false    2980    223    229         �           2606    16549 +   disease_species fk8ajf2to31ynh49q8at0vuahr2    FK CONSTRAINT     �   ALTER TABLE ONLY public.disease_species
    ADD CONSTRAINT fk8ajf2to31ynh49q8at0vuahr2 FOREIGN KEY (species_id) REFERENCES public.plant_species(id);
 U   ALTER TABLE ONLY public.disease_species DROP CONSTRAINT fk8ajf2to31ynh49q8at0vuahr2;
       public          postgres    false    2968    218    224         �           2606    16599 (   plant_sensor fkbrhn62f4x2gttruutny9w1kl8    FK CONSTRAINT     �   ALTER TABLE ONLY public.plant_sensor
    ADD CONSTRAINT fkbrhn62f4x2gttruutny9w1kl8 FOREIGN KEY (plant_id) REFERENCES public.plant(id);
 R   ALTER TABLE ONLY public.plant_sensor DROP CONSTRAINT fkbrhn62f4x2gttruutny9w1kl8;
       public          postgres    false    223    222    2964         �           2606    16559 +   division_sensor fkdaja3tfjeo4bqfais627qxe3u    FK CONSTRAINT     �   ALTER TABLE ONLY public.division_sensor
    ADD CONSTRAINT fkdaja3tfjeo4bqfais627qxe3u FOREIGN KEY (division_id) REFERENCES public.division(id);
 U   ALTER TABLE ONLY public.division_sensor DROP CONSTRAINT fkdaja3tfjeo4bqfais627qxe3u;
       public          postgres    false    2958    220    219         �           2606    16534 #   comment fkf1m5ypf6babiqbvd679v7oy2c    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment
    ADD CONSTRAINT fkf1m5ypf6babiqbvd679v7oy2c FOREIGN KEY (plant_id) REFERENCES public.plant(id);
 M   ALTER TABLE ONLY public.comment DROP CONSTRAINT fkf1m5ypf6babiqbvd679v7oy2c;
       public          postgres    false    2964    222    216         �           2606    16539 #   comment fkf4vjea1lveykjhcv7v2ty51mn    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment
    ADD CONSTRAINT fkf4vjea1lveykjhcv7v2ty51mn FOREIGN KEY (user_id) REFERENCES public.utilizador(id);
 M   ALTER TABLE ONLY public.comment DROP CONSTRAINT fkf4vjea1lveykjhcv7v2ty51mn;
       public          postgres    false    2980    216    229         �           2606    16569 )   journal_entry fkgyalj060wprr46vnjhe3gi9v8    FK CONSTRAINT     �   ALTER TABLE ONLY public.journal_entry
    ADD CONSTRAINT fkgyalj060wprr46vnjhe3gi9v8 FOREIGN KEY (plant_id) REFERENCES public.plant(id);
 S   ALTER TABLE ONLY public.journal_entry DROP CONSTRAINT fkgyalj060wprr46vnjhe3gi9v8;
       public          postgres    false    2964    221    222         �           2606    16574 )   journal_entry fkhjg29d4tlypqcirns3gd2w7jf    FK CONSTRAINT     �   ALTER TABLE ONLY public.journal_entry
    ADD CONSTRAINT fkhjg29d4tlypqcirns3gd2w7jf FOREIGN KEY (user_id) REFERENCES public.utilizador(id);
 S   ALTER TABLE ONLY public.journal_entry DROP CONSTRAINT fkhjg29d4tlypqcirns3gd2w7jf;
       public          postgres    false    229    221    2980         �           2606    16614 $   reaction fkhsdvlyfl5xhtnkgv65ahshp2d    FK CONSTRAINT     �   ALTER TABLE ONLY public.reaction
    ADD CONSTRAINT fkhsdvlyfl5xhtnkgv65ahshp2d FOREIGN KEY (user_id) REFERENCES public.utilizador(id);
 N   ALTER TABLE ONLY public.reaction DROP CONSTRAINT fkhsdvlyfl5xhtnkgv65ahshp2d;
       public          postgres    false    2980    229    225         �           2606    16584 !   plant fki3cr4h4gd0vuk7n6qxyycrda2    FK CONSTRAINT     �   ALTER TABLE ONLY public.plant
    ADD CONSTRAINT fki3cr4h4gd0vuk7n6qxyycrda2 FOREIGN KEY (user_id) REFERENCES public.utilizador(id);
 K   ALTER TABLE ONLY public.plant DROP CONSTRAINT fki3cr4h4gd0vuk7n6qxyycrda2;
       public          postgres    false    222    2980    229         �           2606    16579 !   plant fkkfg428pcea4j36umlvtq913iv    FK CONSTRAINT     �   ALTER TABLE ONLY public.plant
    ADD CONSTRAINT fkkfg428pcea4j36umlvtq913iv FOREIGN KEY (division_id) REFERENCES public.division(id);
 K   ALTER TABLE ONLY public.plant DROP CONSTRAINT fkkfg428pcea4j36umlvtq913iv;
       public          postgres    false    222    219    2958         �           2606    16564 +   division_sensor fks07ef89lxgact4718geb85cr9    FK CONSTRAINT     �   ALTER TABLE ONLY public.division_sensor
    ADD CONSTRAINT fks07ef89lxgact4718geb85cr9 FOREIGN KEY (user_id) REFERENCES public.utilizador(id);
 U   ALTER TABLE ONLY public.division_sensor DROP CONSTRAINT fks07ef89lxgact4718geb85cr9;
       public          postgres    false    2980    229    220         �           2606    16609 $   reaction fkskbqddo2ffvogxr3f22awp2wa    FK CONSTRAINT     �   ALTER TABLE ONLY public.reaction
    ADD CONSTRAINT fkskbqddo2ffvogxr3f22awp2wa FOREIGN KEY (comment_id) REFERENCES public.comment(id);
 N   ALTER TABLE ONLY public.reaction DROP CONSTRAINT fkskbqddo2ffvogxr3f22awp2wa;
       public          postgres    false    216    225    2952                                                                                                                                                                                                                                                                                     3146.dat                                                                                            0000600 0004000 0002000 00000000005 14413571427 0014252 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3147.dat                                                                                            0000600 0004000 0002000 00000000005 14413571427 0014253 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3148.dat                                                                                            0000600 0004000 0002000 00000000005 14413571427 0014254 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3149.dat                                                                                            0000600 0004000 0002000 00000000005 14413571427 0014255 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3150.dat                                                                                            0000600 0004000 0002000 00000000005 14413571427 0014245 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3151.dat                                                                                            0000600 0004000 0002000 00000000005 14413571427 0014246 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3152.dat                                                                                            0000600 0004000 0002000 00000000005 14413571427 0014247 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3153.dat                                                                                            0000600 0004000 0002000 00000000005 14413571427 0014250 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3154.dat                                                                                            0000600 0004000 0002000 00000000005 14413571427 0014251 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3155.dat                                                                                            0000600 0004000 0002000 00000000005 14413571427 0014252 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3156.dat                                                                                            0000600 0004000 0002000 00000000005 14413571427 0014253 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3157.dat                                                                                            0000600 0004000 0002000 00000000005 14413571427 0014254 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3158.dat                                                                                            0000600 0004000 0002000 00000000005 14413571427 0014255 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3159.dat                                                                                            0000600 0004000 0002000 00000000005 14413571427 0014256 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3160.dat                                                                                            0000600 0004000 0002000 00000000005 14413571427 0014246 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3161.dat                                                                                            0000600 0004000 0002000 00000000005 14413571427 0014247 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           restore.sql                                                                                         0000600 0004000 0002000 00000063353 14413571427 0015406 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1
-- Dumped by pg_dump version 13.1

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

DROP DATABASE db;
--
-- Name: db; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE db OWNER TO postgres;

\connect db

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
-- Name: air_quality_measurement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.air_quality_measurement (
    id bigint NOT NULL,
    measurement double precision,
    post_date timestamp without time zone,
    sensor_id bigint NOT NULL
);


ALTER TABLE public.air_quality_measurement OWNER TO postgres;

--
-- Name: air_quality_measurement_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.air_quality_measurement_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.air_quality_measurement_seq OWNER TO postgres;

--
-- Name: air_temperature_measurement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.air_temperature_measurement (
    id bigint NOT NULL,
    measurement double precision,
    post_date timestamp without time zone,
    sensor_id bigint NOT NULL
);


ALTER TABLE public.air_temperature_measurement OWNER TO postgres;

--
-- Name: air_temperature_measurement_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.air_temperature_measurement_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.air_temperature_measurement_seq OWNER TO postgres;

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
    post_date timestamp without time zone,
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
-- Name: soil_quality_measurement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.soil_quality_measurement (
    id bigint NOT NULL,
    measurement double precision,
    post_date timestamp without time zone,
    sensor_id bigint NOT NULL
);


ALTER TABLE public.soil_quality_measurement OWNER TO postgres;

--
-- Name: soil_quality_measurement_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.soil_quality_measurement_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.soil_quality_measurement_seq OWNER TO postgres;

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
    task_date date,
    task_type integer,
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
-- Data for Name: air_quality_measurement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.air_quality_measurement (id, measurement, post_date, sensor_id) FROM stdin;
\.
COPY public.air_quality_measurement (id, measurement, post_date, sensor_id) FROM '$$PATH$$/3146.dat';

--
-- Data for Name: air_temperature_measurement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.air_temperature_measurement (id, measurement, post_date, sensor_id) FROM stdin;
\.
COPY public.air_temperature_measurement (id, measurement, post_date, sensor_id) FROM '$$PATH$$/3147.dat';

--
-- Data for Name: comment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comment (id, post_date, text, title, plant_id, user_id) FROM stdin;
\.
COPY public.comment (id, post_date, text, title, plant_id, user_id) FROM '$$PATH$$/3148.dat';

--
-- Data for Name: disease; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.disease (id, common_name, description, scientific_name, solution) FROM stdin;
\.
COPY public.disease (id, common_name, description, scientific_name, solution) FROM '$$PATH$$/3149.dat';

--
-- Data for Name: disease_species; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.disease_species (species_id, disease_id) FROM stdin;
\.
COPY public.disease_species (species_id, disease_id) FROM '$$PATH$$/3150.dat';

--
-- Data for Name: division; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.division (id, luminosity, name, user_id) FROM stdin;
\.
COPY public.division (id, luminosity, name, user_id) FROM '$$PATH$$/3151.dat';

--
-- Data for Name: division_sensor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.division_sensor (id, name, sensor_code, division_id, user_id) FROM stdin;
\.
COPY public.division_sensor (id, name, sensor_code, division_id, user_id) FROM '$$PATH$$/3152.dat';

--
-- Data for Name: journal_entry; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.journal_entry (id, photo, post_date, text, title, plant_id, user_id) FROM stdin;
\.
COPY public.journal_entry (id, photo, post_date, text, title, plant_id, user_id) FROM '$$PATH$$/3153.dat';

--
-- Data for Name: plant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plant (id, name, plant_condition, photo, plantation_date, division_id, user_id, species_id) FROM stdin;
\.
COPY public.plant (id, name, plant_condition, photo, plantation_date, division_id, user_id, species_id) FROM '$$PATH$$/3154.dat';

--
-- Data for Name: plant_sensor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plant_sensor (id, name, sensor_code, user_id, plant_id) FROM stdin;
\.
COPY public.plant_sensor (id, name, sensor_code, user_id, plant_id) FROM '$$PATH$$/3155.dat';

--
-- Data for Name: plant_species; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plant_species (id, common_name, cycle, difficulty, flowering, leaf_color, optimal_humidity, optimal_luminosity, optimal_temperature, scientific_name, season, photo, usual_size, watering_frequency, family_id) FROM stdin;
\.
COPY public.plant_species (id, common_name, cycle, difficulty, flowering, leaf_color, optimal_humidity, optimal_luminosity, optimal_temperature, scientific_name, season, photo, usual_size, watering_frequency, family_id) FROM '$$PATH$$/3156.dat';

--
-- Data for Name: reaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reaction (reaction_date, type, comment_id, user_id) FROM stdin;
\.
COPY public.reaction (reaction_date, type, comment_id, user_id) FROM '$$PATH$$/3157.dat';

--
-- Data for Name: soil_quality_measurement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.soil_quality_measurement (id, measurement, post_date, sensor_id) FROM stdin;
\.
COPY public.soil_quality_measurement (id, measurement, post_date, sensor_id) FROM '$$PATH$$/3158.dat';

--
-- Data for Name: species_family; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.species_family (id, name, opt_soil_mix) FROM stdin;
\.
COPY public.species_family (id, name, opt_soil_mix) FROM '$$PATH$$/3159.dat';

--
-- Data for Name: task; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.task (id, description, name, task_date, task_type, plant_id) FROM stdin;
\.
COPY public.task (id, description, name, task_date, task_type, plant_id) FROM '$$PATH$$/3160.dat';

--
-- Data for Name: utilizador; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.utilizador (id, address, dob, email, name, password, profile_photo, rating, user_type) FROM stdin;
\.
COPY public.utilizador (id, address, dob, email, name, password, profile_photo, rating, user_type) FROM '$$PATH$$/3161.dat';

--
-- Name: air_quality_measurement_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.air_quality_measurement_seq', 1, false);


--
-- Name: air_temperature_measurement_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.air_temperature_measurement_seq', 1, false);


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
-- Name: soil_quality_measurement_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.soil_quality_measurement_seq', 1, false);


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
-- Name: air_quality_measurement air_quality_measurement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.air_quality_measurement
    ADD CONSTRAINT air_quality_measurement_pkey PRIMARY KEY (id);


--
-- Name: air_temperature_measurement air_temperature_measurement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.air_temperature_measurement
    ADD CONSTRAINT air_temperature_measurement_pkey PRIMARY KEY (id);


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
-- Name: soil_quality_measurement soil_quality_measurement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.soil_quality_measurement
    ADD CONSTRAINT soil_quality_measurement_pkey PRIMARY KEY (id);


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
-- Name: air_temperature_measurement fk41u4nsy89voy1e9vs72l0ctii; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.air_temperature_measurement
    ADD CONSTRAINT fk41u4nsy89voy1e9vs72l0ctii FOREIGN KEY (sensor_id) REFERENCES public.division_sensor(id);


--
-- Name: air_quality_measurement fk57swwrmull8tmmgwhw2w0s7ny; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.air_quality_measurement
    ADD CONSTRAINT fk57swwrmull8tmmgwhw2w0s7ny FOREIGN KEY (sensor_id) REFERENCES public.division_sensor(id);


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
-- Name: soil_quality_measurement fk7bdgp1b6gbn8yn7guiw8iq3cb; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.soil_quality_measurement
    ADD CONSTRAINT fk7bdgp1b6gbn8yn7guiw8iq3cb FOREIGN KEY (sensor_id) REFERENCES public.plant_sensor(id);


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

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     