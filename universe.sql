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
    name character varying(30) NOT NULL,
    size integer NOT NULL,
    speed integer,
    mass numeric(20,10),
    description text,
    has_tail boolean,
    stationary boolean,
    galaxy_id integer
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroids_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroids_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroids_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroids_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroids_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    num_of_stars integer NOT NULL,
    num_of_planets integer,
    mass_solar numeric(20,10),
    description text,
    viewed boolean,
    has_blackhole boolean
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    circumference integer NOT NULL,
    age integer,
    mass numeric(20,10),
    description text,
    does_orbits boolean,
    has_ice boolean,
    planet_id integer
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
    name character varying(30) NOT NULL,
    circumference integer NOT NULL,
    age integer,
    mass numeric(20,10),
    description text,
    sustains_life boolean,
    has_a_moon boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planets_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planets_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planets_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planets_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planets_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    number_of_planets integer NOT NULL,
    age integer,
    mass numeric(20,10),
    description text,
    has_collapsed boolean,
    is_a_dwarf boolean,
    is_dead boolean,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: stars_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.stars_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stars_star_id_seq OWNER TO freecodecamp;

--
-- Name: stars_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.stars_star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroids_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planets_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.stars_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 940, 17, 0.0005000000, 'The largest object in the asteroid belt', false, false, 1);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 525, 24, 0.0002880000, 'Second-largest asteroid in the asteroid belt', false, false, 1);
INSERT INTO public.asteroid VALUES (3, 'Pallas', 512, 25, 0.0002390000, 'Third-largest asteroid, located in the asteroid belt', false, false, 1);
INSERT INTO public.asteroid VALUES (4, 'Hygiea', 430, 20, 0.0000680000, 'Fourth-largest asteroid, also in the asteroid belt', false, false, 1);
INSERT INTO public.asteroid VALUES (5, 'Eros', 17, 29, 0.0000000100, 'An asteroid near Earth, known for its elongated shape', true, false, 2);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way Galaxy', 25543, 59825982, 2985.2989285000, 'Galaxy that houses the earth', true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 1000000000, 43000000, 12500.9988220000, 'Nearest large galaxy to the Milky Way', false, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy', 40000000, 3000000, 5000.5002320000, 'Third largest galaxy in the Local Group', true, false);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool Galaxy', 300000000, 12000000, 8000.3321100000, 'Famous spiral galaxy with distinct shape', true, true);
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic Cloud', 30000000, 900000, 1589.0011200000, 'Satellite galaxy of the Milky Way', false, false);
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', 800000000, 45000000, 7500.8889910000, 'Galaxy with a bright halo and thick dust lane', true, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3475, 4500, 0.0730000000, 'Earth''s only natural satellite', true, true, 13);
INSERT INTO public.moon VALUES (2, 'Phobos', 22, 4500, 0.0000010800, 'One of Mars'' moons, heavily cratered', true, false, 14);
INSERT INTO public.moon VALUES (3, 'Deimos', 12, 4500, 0.0000006100, 'The smaller of Mars'' two moons', true, false, 14);
INSERT INTO public.moon VALUES (4, 'Europa', 3122, 4500, 0.0004800000, 'One of Jupiter''s largest moons, possible subsurface ocean', true, true, 15);
INSERT INTO public.moon VALUES (5, 'Ganymede', 5270, 4500, 0.0001480000, 'The largest moon in the Solar System', true, true, 15);
INSERT INTO public.moon VALUES (6, 'Io', 3642, 4500, 0.0003800000, 'Most geologically active body in the Solar System', true, false, 15);
INSERT INTO public.moon VALUES (7, 'Titan', 5150, 4500, 0.0135000000, 'Saturn''s largest moon, thick atmosphere', true, true, 16);
INSERT INTO public.moon VALUES (8, 'Rhea', 5270, 4500, 0.0007700000, 'Second-largest moon of Saturn', true, false, 16);
INSERT INTO public.moon VALUES (9, 'Triton', 2706, 4500, 0.0000120000, 'Neptune''s largest moon, retrograde orbit', true, true, 17);
INSERT INTO public.moon VALUES (10, 'Charon', 1212, 4500, 0.0000170000, 'Largest moon of Pluto', true, false, 18);
INSERT INTO public.moon VALUES (11, 'Enceladus', 504, 4500, 0.0000250000, 'Moon of Saturn, geologically active with geysers', true, true, 16);
INSERT INTO public.moon VALUES (12, 'Miranda', 472, 4500, 0.0000130000, 'Moon of Uranus with extreme geological features', true, false, 19);
INSERT INTO public.moon VALUES (13, 'Iapetus', 1468, 4500, 0.0000230000, 'Moon of Saturn known for its two-tone coloration', true, false, 16);
INSERT INTO public.moon VALUES (14, 'Mimas', 396, 4500, 0.0000130000, 'Moon of Saturn known for its large crater', true, false, 16);
INSERT INTO public.moon VALUES (15, 'Oberon', 1523, 4500, 0.0000210000, 'Moon of Uranus with a dark surface', true, false, 19);
INSERT INTO public.moon VALUES (16, 'Titania', 1577, 4500, 0.0000160000, 'Largest moon of Uranus', true, false, 19);
INSERT INTO public.moon VALUES (17, 'Callisto', 4820, 4500, 0.0002000000, 'Jupiter''s second-largest moon', true, true, 15);
INSERT INTO public.moon VALUES (18, 'Ceres', 940, 4500, 0.0005000000, 'Dwarf planet in the asteroid belt', true, false, 20);
INSERT INTO public.moon VALUES (19, 'Eris', 2326, 4500, 0.0007000000, 'Dwarf planet in the scattered disk', true, false, 21);
INSERT INTO public.moon VALUES (20, 'Haumea', 1960, 4500, 0.0005200000, 'Dwarf planet known for its elongated shape', true, false, 21);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (13, 'Earth', 40075, 4500, 5.9720000000, 'The only planet known to sustain life', true, true, 4);
INSERT INTO public.planet VALUES (14, 'Mars', 21344, 4500, 0.6417100000, 'Known as the Red Planet, potential for future human exploration', false, true, 4);
INSERT INTO public.planet VALUES (15, 'Venus', 38025, 4500, 4.8675000000, 'Second planet from the Sun, similar in size to Earth', false, false, 4);
INSERT INTO public.planet VALUES (16, 'Proxima b', 15000, 4800, 0.0005000000, 'Exoplanet orbiting Proxima Centauri, potential candidate for sustaining life', false, false, 5);
INSERT INTO public.planet VALUES (17, 'Jupiter', 439264, 4500, 1898.0000000000, 'The largest planet in the Solar System, gas giant', false, true, 4);
INSERT INTO public.planet VALUES (18, 'Saturn', 378675, 4500, 568.0000000000, 'Known for its prominent ring system', false, true, 4);
INSERT INTO public.planet VALUES (19, 'Alpha Centauri Bb', 38000, 4500, 1.0200000000, 'An exoplanet orbiting Alpha Centauri B', false, false, 5);
INSERT INTO public.planet VALUES (20, 'Barnard''s Star b', 16000, 7000, 0.0032000000, 'Exoplanet orbiting Barnard''s Star, potential for life', false, false, 6);
INSERT INTO public.planet VALUES (21, 'Gliese 581g', 25000, 7700, 0.0210000000, 'Exoplanet within the habitable zone of Gliese 581', false, false, 7);
INSERT INTO public.planet VALUES (22, 'Kepler-22b', 25000, 5000, 0.0440000000, 'Exoplanet discovered by the Kepler mission', false, false, 8);
INSERT INTO public.planet VALUES (23, 'Vega b', 50000, 455, 1.5000000000, 'Hypothetical planet orbiting Vega', false, true, 9);
INSERT INTO public.planet VALUES (24, 'Sirius B Planet', 30000, 242, 0.0800000000, 'Hypothetical planet orbiting Sirius B', false, true, 9);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (4, 'Alpha Centauri A', 2, 4500, 1.1000000000, 'Closest star system to the Solar System, part of a binary system', false, false, false, 1);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 0, 8, 20.0000000000, 'Red supergiant nearing the end of its life', false, false, false, 2);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 1, 4800, 0.1230000000, 'The closest known star to the Sun', false, true, false, 1);
INSERT INTO public.star VALUES (7, 'Sirius A', 0, 242, 2.0630000000, 'Brightest star visible from Earth', false, false, false, 3);
INSERT INTO public.star VALUES (8, 'Vega', 0, 455, 2.1350000000, 'Bright star in the constellation Lyra', false, false, false, 3);
INSERT INTO public.star VALUES (9, 'Barnard''s Star', 1, 7000, 0.1440000000, 'A red dwarf star with planets in orbit', false, true, false, 4);


--
-- Name: asteroids_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroids_asteroid_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planets_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planets_planet_id_seq', 24, true);


--
-- Name: stars_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.stars_star_id_seq', 9, true);


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
-- Name: planet planets_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planets_pkey PRIMARY KEY (planet_id);


--
-- Name: star stars_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT stars_pkey PRIMARY KEY (star_id);


--
-- Name: asteroid uq_asteroid_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT uq_asteroid_name UNIQUE (name);


--
-- Name: galaxy uq_galaxy; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT uq_galaxy UNIQUE (name);


--
-- Name: moon uq_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT uq_moon_name UNIQUE (name);


--
-- Name: planet uq_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT uq_planet_name UNIQUE (name);


--
-- Name: star uq_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT uq_star_name UNIQUE (name);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: asteroid fk_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT fk_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

