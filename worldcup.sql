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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying(50) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (13, 2018, 'Final', 141, 142, 4, 2);
INSERT INTO public.games VALUES (14, 2018, 'Third Place', 143, 144, 2, 0);
INSERT INTO public.games VALUES (15, 2018, 'Semi-Final', 142, 144, 2, 1);
INSERT INTO public.games VALUES (16, 2018, 'Semi-Final', 141, 143, 1, 0);
INSERT INTO public.games VALUES (17, 2018, 'Quarter-Final', 142, 145, 3, 2);
INSERT INTO public.games VALUES (18, 2018, 'Quarter-Final', 144, 146, 2, 0);
INSERT INTO public.games VALUES (19, 2018, 'Quarter-Final', 143, 147, 2, 1);
INSERT INTO public.games VALUES (20, 2018, 'Quarter-Final', 141, 148, 2, 0);
INSERT INTO public.games VALUES (21, 2018, 'Eighth-Final', 144, 149, 2, 1);
INSERT INTO public.games VALUES (22, 2018, 'Eighth-Final', 146, 150, 1, 0);
INSERT INTO public.games VALUES (23, 2018, 'Eighth-Final', 143, 151, 3, 2);
INSERT INTO public.games VALUES (24, 2018, 'Eighth-Final', 147, 152, 2, 0);
INSERT INTO public.games VALUES (25, 2018, 'Eighth-Final', 142, 153, 2, 1);
INSERT INTO public.games VALUES (26, 2018, 'Eighth-Final', 145, 154, 2, 1);
INSERT INTO public.games VALUES (27, 2018, 'Eighth-Final', 148, 155, 2, 1);
INSERT INTO public.games VALUES (28, 2018, 'Eighth-Final', 141, 156, 4, 3);
INSERT INTO public.games VALUES (29, 2014, 'Final', 157, 156, 1, 0);
INSERT INTO public.games VALUES (30, 2014, 'Third Place', 158, 147, 3, 0);
INSERT INTO public.games VALUES (31, 2014, 'Semi-Final', 156, 158, 1, 0);
INSERT INTO public.games VALUES (32, 2014, 'Semi-Final', 157, 147, 7, 1);
INSERT INTO public.games VALUES (33, 2014, 'Quarter-Final', 158, 159, 1, 0);
INSERT INTO public.games VALUES (34, 2014, 'Quarter-Final', 156, 143, 1, 0);
INSERT INTO public.games VALUES (35, 2014, 'Quarter-Final', 147, 149, 2, 1);
INSERT INTO public.games VALUES (36, 2014, 'Quarter-Final', 157, 141, 1, 0);
INSERT INTO public.games VALUES (37, 2014, 'Eighth-Final', 147, 160, 2, 1);
INSERT INTO public.games VALUES (38, 2014, 'Eighth-Final', 149, 148, 2, 0);
INSERT INTO public.games VALUES (39, 2014, 'Eighth-Final', 141, 161, 2, 0);
INSERT INTO public.games VALUES (40, 2014, 'Eighth-Final', 157, 162, 2, 1);
INSERT INTO public.games VALUES (41, 2014, 'Eighth-Final', 158, 152, 2, 1);
INSERT INTO public.games VALUES (42, 2014, 'Eighth-Final', 159, 163, 2, 1);
INSERT INTO public.games VALUES (43, 2014, 'Eighth-Final', 156, 150, 1, 0);
INSERT INTO public.games VALUES (44, 2014, 'Eighth-Final', 143, 164, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (141, 'France');
INSERT INTO public.teams VALUES (142, 'Croatia');
INSERT INTO public.teams VALUES (143, 'Belgium');
INSERT INTO public.teams VALUES (144, 'England');
INSERT INTO public.teams VALUES (145, 'Russia');
INSERT INTO public.teams VALUES (146, 'Sweden');
INSERT INTO public.teams VALUES (147, 'Brazil');
INSERT INTO public.teams VALUES (148, 'Uruguay');
INSERT INTO public.teams VALUES (149, 'Colombia');
INSERT INTO public.teams VALUES (150, 'Switzerland');
INSERT INTO public.teams VALUES (151, 'Japan');
INSERT INTO public.teams VALUES (152, 'Mexico');
INSERT INTO public.teams VALUES (153, 'Denmark');
INSERT INTO public.teams VALUES (154, 'Spain');
INSERT INTO public.teams VALUES (155, 'Portugal');
INSERT INTO public.teams VALUES (156, 'Argentina');
INSERT INTO public.teams VALUES (157, 'Germany');
INSERT INTO public.teams VALUES (158, 'Netherlands');
INSERT INTO public.teams VALUES (159, 'Costa Rica');
INSERT INTO public.teams VALUES (160, 'Chile');
INSERT INTO public.teams VALUES (161, 'Nigeria');
INSERT INTO public.teams VALUES (162, 'Algeria');
INSERT INTO public.teams VALUES (163, 'Greece');
INSERT INTO public.teams VALUES (164, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 44, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 164, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

