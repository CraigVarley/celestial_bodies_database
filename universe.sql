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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(20),
    galaxy_coolness character varying(20) NOT NULL,
    galaxy_code character varying(15),
    star_count integer,
    quadrant_id integer,
    galaxy_id integer NOT NULL
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
    name character varying(20),
    moon_size_in_k integer,
    moon_id integer NOT NULL,
    moon_h20 boolean NOT NULL,
    moon_life boolean NOT NULL,
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
    name character varying(20),
    planet_size_in_k numeric NOT NULL,
    planet_h20 boolean NOT NULL,
    planet_life boolean,
    star_id integer,
    planet_best_bar text,
    planet_id integer NOT NULL
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
-- Name: quadrant; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.quadrant (
    quadrant_id integer NOT NULL,
    name character varying(20) NOT NULL,
    quadrant_coolness character varying(20) NOT NULL,
    quadrant_size_in_lys integer,
    best_bar_in_quadrant character varying(50)
);


ALTER TABLE public.quadrant OWNER TO freecodecamp;

--
-- Name: quadrant_quadrant_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.quadrant_quadrant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.quadrant_quadrant_id_seq OWNER TO freecodecamp;

--
-- Name: quadrant_quadrant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.quadrant_quadrant_id_seq OWNED BY public.quadrant.quadrant_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(20),
    star_size_in_k integer,
    star_color character varying(10),
    star_shape character varying(15) NOT NULL,
    galaxy_id integer,
    star_id integer NOT NULL
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

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: quadrant quadrant_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.quadrant ALTER COLUMN quadrant_id SET DEFAULT nextval('public.quadrant_quadrant_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Big blob', 'dorky', 'D06RK', 2700000, 4, 1);
INSERT INTO public.galaxy VALUES ('Fat Edna', 'luxurious', 'G77J1E', 400000000, 3, 2);
INSERT INTO public.galaxy VALUES ('Hobnob', 'so dull', 'D7262G', 103763736, 1, 3);
INSERT INTO public.galaxy VALUES ('Wetness', 'Vanilla Ice', '77GHG26', 4, 2, 4);
INSERT INTO public.galaxy VALUES ('Eyeball', 'tea warm', 'TTTTTTT663', 363463711, 3, 5);
INSERT INTO public.galaxy VALUES ('Squareness', 'frigid', '1373GH27', -25, 2, 6);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Moon', 3475, 1, false, false, 1);
INSERT INTO public.moon VALUES ('Ganymede', 5270, 2, true, false, 9);
INSERT INTO public.moon VALUES ('Clank', 1200, 3, false, false, 7);
INSERT INTO public.moon VALUES ('Oompa', 7400, 4, true, true, 3);
INSERT INTO public.moon VALUES ('Chimp Town', 2500, 5, true, true, 6);
INSERT INTO public.moon VALUES ('Gabble', 2859, 6, true, true, 8);
INSERT INTO public.moon VALUES ('Oooooooh', 754, 7, true, false, 10);
INSERT INTO public.moon VALUES ('Plastic Patch', 2460, 8, false, false, 11);
INSERT INTO public.moon VALUES ('Cammy''s Moon', 9873, 9, false, false, 12);
INSERT INTO public.moon VALUES ('Martini', 12, 10, true, false, 4);
INSERT INTO public.moon VALUES ('Phobos', 11, 11, false, false, 2);
INSERT INTO public.moon VALUES ('Deimos', 8, 12, false, false, 2);
INSERT INTO public.moon VALUES ('Thebe', 99, 13, false, false, 9);
INSERT INTO public.moon VALUES ('Callisto', 4800, 14, false, false, 9);
INSERT INTO public.moon VALUES ('Milkcartons', 8, 15, false, false, 11);
INSERT INTO public.moon VALUES ('Eeeeeeeep!', 456, 16, true, false, 10);
INSERT INTO public.moon VALUES ('Himalia', 140, 17, false, false, 9);
INSERT INTO public.moon VALUES ('Musk''s Space Box', 12, 18, true, true, 1);
INSERT INTO public.moon VALUES ('Io', 3643, 19, false, false, 9);
INSERT INTO public.moon VALUES ('Frozen Bezos Head', 1, 20, false, false, 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Earth', 12000, true, true, 1, 'Ole Dinky''s Phat Bomba', 1);
INSERT INTO public.planet VALUES ('Mars', 8000, true, false, 1, 'Red Rum', 2);
INSERT INTO public.planet VALUES ('Wonka', 24000, true, true, 4, 'Choco Barrel', 3);
INSERT INTO public.planet VALUES ('Gimlet', 123000, false, true, 6, 'Tentacular Experiments', 4);
INSERT INTO public.planet VALUES ('Tattooine', 18000, true, true, 2, 'Mos Eisley Cantina', 5);
INSERT INTO public.planet VALUES ('Ape World', 35000, true, true, 3, 'Orangohangout', 6);
INSERT INTO public.planet VALUES ('RoboTown', 24500, false, false, 5, 'Asimov''s Oil Juice', 7);
INSERT INTO public.planet VALUES ('Honka Wonka', 750000, false, false, 6, NULL, 8);
INSERT INTO public.planet VALUES ('Jupiter', 70000, false, false, 1, NULL, 9);
INSERT INTO public.planet VALUES ('Wheeee', 4800, true, true, 4, 'Buster''s Bust-A-Gut Palace', 10);
INSERT INTO public.planet VALUES ('Garbage World', 32000, false, false, 4, 'Stinky''s', 11);
INSERT INTO public.planet VALUES ('Cammy''s Orb', 18000, true, true, 4, 'The Typing Pool', 12);


--
-- Data for Name: quadrant; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.quadrant VALUES (1, 'Alpha', 'Ice Cold', 4500000, 'Cheers');
INSERT INTO public.quadrant VALUES (2, 'Beta', 'Lamiest', 39600000, 'Olde Sporke');
INSERT INTO public.quadrant VALUES (3, 'Gamma', 'Warm', 42000000, 'Can Can Pop Town');
INSERT INTO public.quadrant VALUES (4, 'Delta', 'Icy Cold', 47364978, 'The Janeway Salamander House');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Blinky', 2300000, 'blue', 'round', 2, 2);
INSERT INTO public.star VALUES ('Polo', 7500000, 'red', 'rhombus', 5, 3);
INSERT INTO public.star VALUES ('Gertrude', 4500000, 'green', 'donut', 1, 4);
INSERT INTO public.star VALUES ('Chairon Beta-9', 1250000, 'pink', 'cube', 6, 5);
INSERT INTO public.star VALUES ('Sol', 1392700, 'yellow', 'round', 4, 1);
INSERT INTO public.star VALUES ('Lil Dinky', 3654932, 'mauve', 'sort of blobby', 4, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: quadrant_quadrant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.quadrant_quadrant_id_seq', 6, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_galaxy_code_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_code_key UNIQUE (galaxy_code);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: quadrant quadrant_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.quadrant
    ADD CONSTRAINT quadrant_name_key UNIQUE (name);


--
-- Name: quadrant quadrant_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.quadrant
    ADD CONSTRAINT quadrant_pkey PRIMARY KEY (quadrant_id);


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
-- Name: moon fk_moon; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: galaxy galaxy_quadrant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_quadrant_id_fkey FOREIGN KEY (quadrant_id) REFERENCES public.quadrant(quadrant_id);


--
-- PostgreSQL database dump complete
--

