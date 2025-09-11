--
-- PostgreSQL database dump
--

\restrict g5FA7U72cIXNnyDXH9xpVOsIdgdgNlDi4RZPJq9sPAQeRY669g8CyjmDI4BqyEP

-- Dumped from database version 14.19 (Debian 14.19-1.pgdg13+1)
-- Dumped by pg_dump version 14.19 (Debian 14.19-1.pgdg13+1)

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
-- Name: degrees_sp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.degrees_sp (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    number integer NOT NULL
);


ALTER TABLE public.degrees_sp OWNER TO postgres;

--
-- Name: degrees_sp_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.degrees_sp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.degrees_sp_id_seq OWNER TO postgres;

--
-- Name: degrees_sp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.degrees_sp_id_seq OWNED BY public.degrees_sp.id;


--
-- Name: students_sp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students_sp (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    state character varying(50),
    birthday date,
    degree_id integer
);


ALTER TABLE public.students_sp OWNER TO postgres;

--
-- Name: students_sp_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.students_sp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.students_sp_id_seq OWNER TO postgres;

--
-- Name: students_sp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.students_sp_id_seq OWNED BY public.students_sp.id;


--
-- Name: subjects_sp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subjects_sp (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    state character varying(50),
    degree_id integer
);


ALTER TABLE public.subjects_sp OWNER TO postgres;

--
-- Name: subjects_sp_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subjects_sp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subjects_sp_id_seq OWNER TO postgres;

--
-- Name: subjects_sp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subjects_sp_id_seq OWNED BY public.subjects_sp.id;


--
-- Name: degrees_sp id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.degrees_sp ALTER COLUMN id SET DEFAULT nextval('public.degrees_sp_id_seq'::regclass);


--
-- Name: students_sp id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students_sp ALTER COLUMN id SET DEFAULT nextval('public.students_sp_id_seq'::regclass);


--
-- Name: subjects_sp id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subjects_sp ALTER COLUMN id SET DEFAULT nextval('public.subjects_sp_id_seq'::regclass);


--
-- Data for Name: degrees_sp; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.degrees_sp (id, name, number) FROM stdin;
\.


--
-- Data for Name: students_sp; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.students_sp (id, name, state, birthday, degree_id) FROM stdin;
\.


--
-- Data for Name: subjects_sp; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subjects_sp (id, name, state, degree_id) FROM stdin;
\.


--
-- Name: degrees_sp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.degrees_sp_id_seq', 1, false);


--
-- Name: students_sp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.students_sp_id_seq', 1, false);


--
-- Name: subjects_sp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subjects_sp_id_seq', 1, false);


--
-- Name: degrees_sp degrees_sp_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.degrees_sp
    ADD CONSTRAINT degrees_sp_pkey PRIMARY KEY (id);


--
-- Name: students_sp students_sp_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students_sp
    ADD CONSTRAINT students_sp_pkey PRIMARY KEY (id);


--
-- Name: subjects_sp subjects_sp_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subjects_sp
    ADD CONSTRAINT subjects_sp_pkey PRIMARY KEY (id);


--
-- Name: students_sp fk_students_degrees; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students_sp
    ADD CONSTRAINT fk_students_degrees FOREIGN KEY (degree_id) REFERENCES public.degrees_sp(id) ON DELETE SET NULL;


--
-- Name: subjects_sp fk_subjects_degrees; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subjects_sp
    ADD CONSTRAINT fk_subjects_degrees FOREIGN KEY (degree_id) REFERENCES public.degrees_sp(id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

\unrestrict g5FA7U72cIXNnyDXH9xpVOsIdgdgNlDi4RZPJq9sPAQeRY669g8CyjmDI4BqyEP

