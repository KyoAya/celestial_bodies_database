--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(30) NOT NULL,
    mass_in_kg numeric(20,6) NOT NULL,
    belongs_asteroid_belt boolean
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroids_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroids_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroids_id_seq OWNER TO freecodecamp;

--
-- Name: asteroids_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroids_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_million_years integer NOT NULL,
    size_in_lightyears integer NOT NULL,
    number_of_stars_in_millions integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    mass character varying(30),
    distance_to_planet_km integer NOT NULL,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    mass character varying(30) NOT NULL,
    age_in_million_years integer,
    star_id integer NOT NULL,
    has_life boolean,
    quick_description text
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    mass character varying(30) NOT NULL,
    age_in_million_years integer,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroids_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Bennu', 700000000000.000000, false);
INSERT INTO public.asteroid VALUES (2, 'Gaspra', 57000000000.000000, true);
INSERT INTO public.asteroid VALUES (3, 'Mathilde', 31000000000.000000, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Via lactea', 13610, 55850, 250000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10001, 110000, 1000000);
INSERT INTO public.galaxy VALUES (3, 'Gran nube de magallanes', 1101, 35000, 30000);
INSERT INTO public.galaxy VALUES (4, 'Galaxia del triangulo', 40000, 60000, 40);
INSERT INTO public.galaxy VALUES (5, 'Galaxia del sombrero', 8200, 50000, 100000);
INSERT INTO public.galaxy VALUES (6, 'Galaxia del totem', 3000, 70000, 25);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', '7.34e+22kg', 384400, 3);
INSERT INTO public.moon VALUES (2, 'Fobos', '1.08e+16kg', 9377, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', '2.4e+15kg', 23460, 4);
INSERT INTO public.moon VALUES (4, 'Io', '8.93e+22kg', 421700, 5);
INSERT INTO public.moon VALUES (5, 'Europa', '4.8e+22kg', 670900, 5);
INSERT INTO public.moon VALUES (6, 'Ganimedes', '1.48e+23kg', 1070400, 5);
INSERT INTO public.moon VALUES (7, 'Calisto', '1.08e+23kg', 1882700, 5);
INSERT INTO public.moon VALUES (8, 'Amaltea', '2.08e+18kg', 181366, 5);
INSERT INTO public.moon VALUES (9, 'Titan', '1.35e+23kg', 1221870, 6);
INSERT INTO public.moon VALUES (10, 'Rea', '2.31e+21kg', 527040, 6);
INSERT INTO public.moon VALUES (11, 'Dione', '1.1e+21kg', 377420, 6);
INSERT INTO public.moon VALUES (12, 'Encelado', '1.08e+20kg', 238020, 6);
INSERT INTO public.moon VALUES (13, 'Titania', '3.4e+21kg', 436300, 7);
INSERT INTO public.moon VALUES (14, 'Oberon', '3e+21kg', 583500, 7);
INSERT INTO public.moon VALUES (15, 'Umbriel', '1.2e+21kg', 266000, 7);
INSERT INTO public.moon VALUES (16, 'Ariel', '1.3e21kg', 191000, 7);
INSERT INTO public.moon VALUES (18, 'Triton', '2.14e+22kg', 354800, 8);
INSERT INTO public.moon VALUES (19, 'Proteo', '4.4e+19kg', 117647, 8);
INSERT INTO public.moon VALUES (20, 'Nereida', '3.1e+19kg', 5513400, 8);
INSERT INTO public.moon VALUES (21, 'Nayade', '1.9e+17kg', 48227, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercurio', '3.285e+23kg', 4600, 1, NULL, NULL);
INSERT INTO public.planet VALUES (2, 'Venus', '4.867e24kg', 4500, 1, NULL, NULL);
INSERT INTO public.planet VALUES (3, 'Tierra', '5.972e24kg', 4500, 1, true, 'La tierra es el unico planeta conocido que alberga vida. Tiene una atmosfera rica en oxigeno y agua en estado liquido, lo que lo hace unico entre los planetas conocidos');
INSERT INTO public.planet VALUES (4, 'Marte', '6.42e23kg', 4603, 1, NULL, NULL);
INSERT INTO public.planet VALUES (5, 'Jupiter', '1898e24kg', 4503, 1, NULL, NULL);
INSERT INTO public.planet VALUES (6, 'Saturno', '568e24kg', 4503, 1, NULL, NULL);
INSERT INTO public.planet VALUES (7, 'Urano', '86e24kg', 4503, 1, NULL, NULL);
INSERT INTO public.planet VALUES (8, 'Neptuno', '102e24kg', 4503, 1, NULL, NULL);
INSERT INTO public.planet VALUES (9, 'Trappist-1b', '0.85 masas terrestres', 7600, 9, NULL, NULL);
INSERT INTO public.planet VALUES (10, 'Trappist-1c', '1.38 masas terrestres', 7600, 9, NULL, NULL);
INSERT INTO public.planet VALUES (11, 'Trappist-1d', '0.41 masas terrestres', 7600, 9, NULL, NULL);
INSERT INTO public.planet VALUES (12, 'Kepler-90i', '2.6 masas terrestres', NULL, 10, NULL, 'Exoplaneta interesante debido a sus aparentes similitudes con el planeta tierra');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', '1989e+30 kg', 4600, 1);
INSERT INTO public.star VALUES (2, 'Sirius A', '2.02 S', 250, 1);
INSERT INTO public.star VALUES (3, 'Arcturus', '1.1 S', 7500, 1);
INSERT INTO public.star VALUES (4, 'Alpheratz', '2.5 S', 97, 2);
INSERT INTO public.star VALUES (5, 'Mirach', '3.1 S', 284, 2);
INSERT INTO public.star VALUES (6, 'R DORADUS', '0.6 S', 1000, 3);
INSERT INTO public.star VALUES (7, 'Alamak', '2.9 S', 73, 2);
INSERT INTO public.star VALUES (8, 'S Doradus', '45 S', 2, 3);
INSERT INTO public.star VALUES (9, 'Trappist-1', '0.89 S', 7605, 1);
INSERT INTO public.star VALUES (10, 'Keppler-90', '1.2 S', 2000, 1);


--
-- Name: asteroids_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroids_id_seq', 3, true);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 21, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 12, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 10, true);


--
-- Name: asteroid asteroids_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroids_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: asteroid unique_asteroid_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT unique_asteroid_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: galaxy unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: moon fk_moon_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

