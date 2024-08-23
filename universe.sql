--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    galaxy_id integer,
    name character varying(255) NOT NULL,
    size numeric,
    description text,
    speed_ms integer,
    weight_kg integer
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    is_visibile boolean NOT NULL,
    count_stars bigint,
    description text,
    galaxy_types_id integer,
    density numeric
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: galaxy_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_types (
    galaxy_types_id integer NOT NULL,
    descriptions text,
    name character varying(66) NOT NULL
);


ALTER TABLE public.galaxy_types OWNER TO freecodecamp;

--
-- Name: galaxy_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_types_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_types_id_seq OWNED BY public.galaxy_types.galaxy_types_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer,
    description text,
    name character varying(100) NOT NULL,
    radius integer,
    temperature integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    star_id integer,
    planet_types_id integer,
    description text,
    name character varying(100) NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: planet_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_types (
    planet_types_id integer NOT NULL,
    descriptions text,
    name character varying(66) NOT NULL
);


ALTER TABLE public.planet_types OWNER TO freecodecamp;

--
-- Name: planet_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_id_seq OWNED BY public.planet_types.planet_types_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer,
    name character varying(100) NOT NULL,
    description text,
    is_visible boolean,
    luminosity integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_types galaxy_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types ALTER COLUMN galaxy_types_id SET DEFAULT nextval('public.galaxy_types_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_types planet_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types ALTER COLUMN planet_types_id SET DEFAULT nextval('public.planet_types_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 1, 'Iron FSSDD234', 500, 'Hiden on galaxy', 27000, 4200000);
INSERT INTO public.asteroid VALUES (2, 2, 'Flaten 55645-ZZ', 6500, 'Hiden on galaxy', 7000, 300000);
INSERT INTO public.asteroid VALUES (3, 3, 'Round CC', 6511, 'Hiden on galaxy', 7110, 301000);
INSERT INTO public.asteroid VALUES (4, 3, 'Safe-c-5-22', 21, 'No danger', 10, 200);
INSERT INTO public.asteroid VALUES (5, 4, 'Safe-c-445-252', 21, 'No danger', 10, 10);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', true, 10000, 'The near spiral galaxy to the Milky Way, visible from Earth', 1, 1.5);
INSERT INTO public.galaxy VALUES (2, 'Sombrero', false, 410000, 'An elliptical galaxy.. more info on goole', 2, 21.5);
INSERT INTO public.galaxy VALUES (3, 'Galaxy Nova', false, 1410000, 'No real galaxy..', 3, 22.5);
INSERT INTO public.galaxy VALUES (4, 'Linux galaxy', true, 100, 'No real galaxy.. demo text only', 4, 222.5);
INSERT INTO public.galaxy VALUES (5, 'Cats galaxy', false, 333, 'Cats galaxy.. no dogs', 5, 12.5);
INSERT INTO public.galaxy VALUES (7, 'Lost Lagoon', true, 11333, 'Fake galaxy for test', 2, 12.5);
INSERT INTO public.galaxy VALUES (8, 'Shadow Ring', true, 11333, 'Fake Shadow galaxy for test', 2, 12.5);


--
-- Data for Name: galaxy_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_types VALUES (1, 'Defined spiral aems.', 'Spiral');
INSERT INTO public.galaxy_types VALUES (2, 'Elongated and little dust.', 'Elliptical');
INSERT INTO public.galaxy_types VALUES (3, 'No regular shape.', 'Irregulae');
INSERT INTO public.galaxy_types VALUES (4, 'Central bar-shaped structure.', 'Barred');
INSERT INTO public.galaxy_types VALUES (5, 'Circular appearance with a cental gap.', 'Ring');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'Small, Unknow', 'Moon Z1', 111, -75);
INSERT INTO public.moon VALUES (2, 2, 'Small, Unknow', 'Moon Z2', 1121, -25);
INSERT INTO public.moon VALUES (3, 3, 'Big, Unknow', 'Moon X4', 112221, -125);
INSERT INTO public.moon VALUES (4, 4, 'No atmosphere', 'Moon F5', 2221, 0);
INSERT INTO public.moon VALUES (6, 5, 'No atmosphere', 'Moon FZ', 2221, 0);
INSERT INTO public.moon VALUES (7, 6, 'No information', 'Moon F6', 2221, 0);
INSERT INTO public.moon VALUES (8, 7, 'No information', 'Moon F7', 26621, -20);
INSERT INTO public.moon VALUES (9, 7, 'No information', 'Moon F8', 26621, -210);
INSERT INTO public.moon VALUES (10, 9, 'No information', 'Moon F9', 2431, -10);
INSERT INTO public.moon VALUES (11, 10, 'No information', 'Moon D1', 24321, -410);
INSERT INTO public.moon VALUES (13, 11, 'No information', 'Moon D2', 241, -33);
INSERT INTO public.moon VALUES (14, 12, 'No information', 'Moon DD', 2421, -33);
INSERT INTO public.moon VALUES (16, 16, 'No information', 'Moon D56D', 666, -3);
INSERT INTO public.moon VALUES (17, 13, 'No information', 'Moon EE', 6666, -13);
INSERT INTO public.moon VALUES (18, 14, 'No information', 'Moon GG', 777, -11);
INSERT INTO public.moon VALUES (19, 15, 'No information', 'Moon LL', 788, -121);
INSERT INTO public.moon VALUES (20, 5, 'No information', 'Moon 11LL', 100, -1);
INSERT INTO public.moon VALUES (21, 5, 'No information', 'Moon 789LL', 101, -1);
INSERT INTO public.moon VALUES (22, 4, 'No information', 'Moon X', 1101, -11);
INSERT INTO public.moon VALUES (23, 1, 'No information', 'Moon X11', 87656781, -111);
INSERT INTO public.moon VALUES (24, 2, 'No information', 'Moon 66', 87681, -51);
INSERT INTO public.moon VALUES (25, 8, 'No information', 'Moon 88', 888, -88);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 1, 5, 'An oceanic world..', 'Aquaterrra');
INSERT INTO public.planet VALUES (2, 1, 1, 4, 'Home to intense volcanic activity', 'Volcanis');
INSERT INTO public.planet VALUES (3, 2, 3, 3, 'No comment..', 'Obsidiant');
INSERT INTO public.planet VALUES (4, 3, 2, 4, 'Empty planet', 'Echo');
INSERT INTO public.planet VALUES (5, 4, 4, 2, 'Gold planet', 'Haven');
INSERT INTO public.planet VALUES (6, 5, 5, 5, 'Morrowind planet', 'Nimbus');
INSERT INTO public.planet VALUES (7, 7, 6, 5, 'Morrowind planet', 'Vampire');
INSERT INTO public.planet VALUES (8, 8, 7, 6, 'Animal planet', 'Zoo');
INSERT INTO public.planet VALUES (9, 1, 1, 1, 'Tree planets', 'Polaris');
INSERT INTO public.planet VALUES (10, 2, 2, 2, 'Vodka planets', 'Arcadia');
INSERT INTO public.planet VALUES (11, 1, 3, 4, 'Unknow planets.. ', 'Spectral');
INSERT INTO public.planet VALUES (12, 2, 3, 4, 'FireFox planets.. ', 'Fox');
INSERT INTO public.planet VALUES (13, 5, 3, 2, 'Cat planets.. ', 'Miau');
INSERT INTO public.planet VALUES (14, 2, 3, 2, 'Girls planets.. ', 'Alisa');
INSERT INTO public.planet VALUES (15, 2, 3, 2, 'Food planets', 'Cook');
INSERT INTO public.planet VALUES (16, 4, 4, 4, 'Developer planets', 'Loop');


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_types VALUES (1, 'Large planet composed mostly of gases.', 'Gas Giant');
INSERT INTO public.planet_types VALUES (2, 'Cold planet ehith a thick atmosphere of hydrogen, helium, and water.', 'Ice Giant');
INSERT INTO public.planet_types VALUES (3, 'Rocky planet with a solid surface', 'Terrestrial');
INSERT INTO public.planet_types VALUES (4, 'Small, rocky body orbiting the sun.', 'Dwarf Planet');
INSERT INTO public.planet_types VALUES (5, 'Planet covered entirely by oceans.', 'Ocean Planet');
INSERT INTO public.planet_types VALUES (6, 'Planet with a surface mostly coverd in lava.', 'Lava Planet');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sirius', 'The bridghtest star in the Earth night sky.', true, 125);
INSERT INTO public.star VALUES (2, 2, 'Tomas', 'The star for all animals.', false, 1115);
INSERT INTO public.star VALUES (3, 3, 'Maximus', 'Star of dead.', false, 111115);
INSERT INTO public.star VALUES (4, 3, 'Hot', 'Hot Star', false, 12);
INSERT INTO public.star VALUES (5, 4, 'Dog', 'Dog Star.. no Cats', true, 122222);
INSERT INTO public.star VALUES (6, 4, 'Cats', 'Cats Star.. no Dogs', true, 54);
INSERT INTO public.star VALUES (7, 5, 'Hiccup', 'Star wars.. ', true, 154);
INSERT INTO public.star VALUES (8, 7, 'Virtual Star', 'Yotube star.. ', true, 11154);
INSERT INTO public.star VALUES (9, 8, 'Zoo Star', 'Star for animals. ', true, 11154);
INSERT INTO public.star VALUES (10, 8, 'Cine Star', 'For people.... not for Cats ', false, 11154);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: galaxy_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_id_seq', 5, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 25, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 16, true);


--
-- Name: planet_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_id_seq', 6, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_types galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_types_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


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
-- Name: planet_types planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_types_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy_types unique_galaxy_types_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT unique_galaxy_types_name UNIQUE (name);


--
-- Name: planet unique_panet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_panet_name UNIQUE (name);


--
-- Name: planet_types unique_planet_types_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT unique_planet_types_name UNIQUE (name);


--
-- Name: asteroid asteroid_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet fk_planet_type; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_type FOREIGN KEY (planet_types_id) REFERENCES public.planet_types(planet_types_id);


--
-- Name: galaxy galaxy_galaxy_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_type_fkey FOREIGN KEY (galaxy_types_id) REFERENCES public.galaxy_types(galaxy_types_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

