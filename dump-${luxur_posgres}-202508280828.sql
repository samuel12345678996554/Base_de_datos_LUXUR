--
-- PostgreSQL database dump
--

-- Dumped from database version 14.19 (Debian 14.19-1.pgdg13+1)
-- Dumped by pg_dump version 17.0

-- Started on 2025-08-28 08:28:16

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3507 (class 1262 OID 16384)
-- Name: luxur_posgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE luxur_posgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE luxur_posgres OWNER TO postgres;

\connect luxur_posgres

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 226 (class 1259 OID 16477)
-- Name: amenities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.amenities (
    id integer NOT NULL,
    description character varying(150) NOT NULL
);


ALTER TABLE public.amenities OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16476)
-- Name: amenities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.amenities ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.amenities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 212 (class 1259 OID 16394)
-- Name: client_evaluations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_evaluations (
    id integer NOT NULL,
    client_id integer NOT NULL,
    comments text,
    rating numeric(3,1)
);


ALTER TABLE public.client_evaluations OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16393)
-- Name: client_evaluations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.client_evaluations ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.client_evaluations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 210 (class 1259 OID 16386)
-- Name: clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clients (
    id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    email character varying(150) NOT NULL
);


ALTER TABLE public.clients OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16385)
-- Name: clients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.clients ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.clients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 222 (class 1259 OID 16453)
-- Name: contract_documents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contract_documents (
    id integer NOT NULL,
    contract_id integer NOT NULL,
    document text NOT NULL
);


ALTER TABLE public.contract_documents OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16452)
-- Name: contract_documents_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.contract_documents ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.contract_documents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 220 (class 1259 OID 16437)
-- Name: contracts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contracts (
    id integer NOT NULL,
    property_id integer NOT NULL,
    client_id integer NOT NULL,
    start_date date NOT NULL,
    end_date date
);


ALTER TABLE public.contracts OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16436)
-- Name: contracts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.contracts ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.contracts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 216 (class 1259 OID 16413)
-- Name: owners; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.owners (
    id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    email character varying(150) NOT NULL
);


ALTER TABLE public.owners OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16412)
-- Name: owners_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.owners ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.owners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 224 (class 1259 OID 16466)
-- Name: payments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payments (
    id integer NOT NULL,
    contract_id integer NOT NULL,
    payment_date date NOT NULL,
    amount numeric(12,2) NOT NULL
);


ALTER TABLE public.payments OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16465)
-- Name: payments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.payments ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.payments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 218 (class 1259 OID 16421)
-- Name: properties; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.properties (
    id integer NOT NULL,
    address character varying(255) NOT NULL,
    price numeric(12,2) NOT NULL,
    property_type_id integer NOT NULL,
    owner_id integer NOT NULL
);


ALTER TABLE public.properties OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16420)
-- Name: properties_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.properties ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.properties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 228 (class 1259 OID 16483)
-- Name: property_amenities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.property_amenities (
    id integer NOT NULL,
    property_id integer NOT NULL,
    amenity_id integer NOT NULL
);


ALTER TABLE public.property_amenities OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16482)
-- Name: property_amenities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.property_amenities ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.property_amenities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 214 (class 1259 OID 16407)
-- Name: property_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.property_types (
    id integer NOT NULL,
    description character varying(100) NOT NULL
);


ALTER TABLE public.property_types OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16406)
-- Name: property_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.property_types ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.property_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 230 (class 1259 OID 16499)
-- Name: visits; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.visits (
    id integer NOT NULL,
    property_id integer NOT NULL,
    client_id integer NOT NULL,
    visit_date date NOT NULL
);


ALTER TABLE public.visits OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16498)
-- Name: visits_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.visits ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.visits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3497 (class 0 OID 16477)
-- Dependencies: 226
-- Data for Name: amenities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.amenities (id, description) FROM stdin;
\.


--
-- TOC entry 3483 (class 0 OID 16394)
-- Dependencies: 212
-- Data for Name: client_evaluations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_evaluations (id, client_id, comments, rating) FROM stdin;
\.


--
-- TOC entry 3481 (class 0 OID 16386)
-- Dependencies: 210
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clients (id, first_name, last_name, email) FROM stdin;
\.


--
-- TOC entry 3493 (class 0 OID 16453)
-- Dependencies: 222
-- Data for Name: contract_documents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contract_documents (id, contract_id, document) FROM stdin;
\.


--
-- TOC entry 3491 (class 0 OID 16437)
-- Dependencies: 220
-- Data for Name: contracts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contracts (id, property_id, client_id, start_date, end_date) FROM stdin;
\.


--
-- TOC entry 3487 (class 0 OID 16413)
-- Dependencies: 216
-- Data for Name: owners; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.owners (id, first_name, last_name, email) FROM stdin;
\.


--
-- TOC entry 3495 (class 0 OID 16466)
-- Dependencies: 224
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payments (id, contract_id, payment_date, amount) FROM stdin;
\.


--
-- TOC entry 3489 (class 0 OID 16421)
-- Dependencies: 218
-- Data for Name: properties; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.properties (id, address, price, property_type_id, owner_id) FROM stdin;
\.


--
-- TOC entry 3499 (class 0 OID 16483)
-- Dependencies: 228
-- Data for Name: property_amenities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.property_amenities (id, property_id, amenity_id) FROM stdin;
\.


--
-- TOC entry 3485 (class 0 OID 16407)
-- Dependencies: 214
-- Data for Name: property_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.property_types (id, description) FROM stdin;
\.


--
-- TOC entry 3501 (class 0 OID 16499)
-- Dependencies: 230
-- Data for Name: visits; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.visits (id, property_id, client_id, visit_date) FROM stdin;
\.


--
-- TOC entry 3509 (class 0 OID 0)
-- Dependencies: 225
-- Name: amenities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.amenities_id_seq', 1, false);


--
-- TOC entry 3510 (class 0 OID 0)
-- Dependencies: 211
-- Name: client_evaluations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.client_evaluations_id_seq', 1, false);


--
-- TOC entry 3511 (class 0 OID 0)
-- Dependencies: 209
-- Name: clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clients_id_seq', 1, false);


--
-- TOC entry 3512 (class 0 OID 0)
-- Dependencies: 221
-- Name: contract_documents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contract_documents_id_seq', 1, false);


--
-- TOC entry 3513 (class 0 OID 0)
-- Dependencies: 219
-- Name: contracts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contracts_id_seq', 1, false);


--
-- TOC entry 3514 (class 0 OID 0)
-- Dependencies: 215
-- Name: owners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.owners_id_seq', 1, false);


--
-- TOC entry 3515 (class 0 OID 0)
-- Dependencies: 223
-- Name: payments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payments_id_seq', 1, false);


--
-- TOC entry 3516 (class 0 OID 0)
-- Dependencies: 217
-- Name: properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.properties_id_seq', 1, false);


--
-- TOC entry 3517 (class 0 OID 0)
-- Dependencies: 227
-- Name: property_amenities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.property_amenities_id_seq', 1, false);


--
-- TOC entry 3518 (class 0 OID 0)
-- Dependencies: 213
-- Name: property_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.property_types_id_seq', 1, false);


--
-- TOC entry 3519 (class 0 OID 0)
-- Dependencies: 229
-- Name: visits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.visits_id_seq', 1, false);


--
-- TOC entry 3325 (class 2606 OID 16481)
-- Name: amenities amenities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.amenities
    ADD CONSTRAINT amenities_pkey PRIMARY KEY (id);


--
-- TOC entry 3309 (class 2606 OID 16400)
-- Name: client_evaluations client_evaluations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_evaluations
    ADD CONSTRAINT client_evaluations_pkey PRIMARY KEY (id);


--
-- TOC entry 3305 (class 2606 OID 16392)
-- Name: clients clients_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_email_key UNIQUE (email);


--
-- TOC entry 3307 (class 2606 OID 16390)
-- Name: clients clients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);


--
-- TOC entry 3321 (class 2606 OID 16459)
-- Name: contract_documents contract_documents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contract_documents
    ADD CONSTRAINT contract_documents_pkey PRIMARY KEY (id);


--
-- TOC entry 3319 (class 2606 OID 16441)
-- Name: contracts contracts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contracts
    ADD CONSTRAINT contracts_pkey PRIMARY KEY (id);


--
-- TOC entry 3313 (class 2606 OID 16419)
-- Name: owners owners_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.owners
    ADD CONSTRAINT owners_email_key UNIQUE (email);


--
-- TOC entry 3315 (class 2606 OID 16417)
-- Name: owners owners_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.owners
    ADD CONSTRAINT owners_pkey PRIMARY KEY (id);


--
-- TOC entry 3323 (class 2606 OID 16470)
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id);


--
-- TOC entry 3317 (class 2606 OID 16425)
-- Name: properties properties_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.properties
    ADD CONSTRAINT properties_pkey PRIMARY KEY (id);


--
-- TOC entry 3327 (class 2606 OID 16487)
-- Name: property_amenities property_amenities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.property_amenities
    ADD CONSTRAINT property_amenities_pkey PRIMARY KEY (id);


--
-- TOC entry 3311 (class 2606 OID 16411)
-- Name: property_types property_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.property_types
    ADD CONSTRAINT property_types_pkey PRIMARY KEY (id);


--
-- TOC entry 3329 (class 2606 OID 16503)
-- Name: visits visits_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visits
    ADD CONSTRAINT visits_pkey PRIMARY KEY (id);


--
-- TOC entry 3330 (class 2606 OID 16401)
-- Name: client_evaluations client_evaluations_client_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_evaluations
    ADD CONSTRAINT client_evaluations_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.clients(id);


--
-- TOC entry 3335 (class 2606 OID 16460)
-- Name: contract_documents contract_documents_contract_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contract_documents
    ADD CONSTRAINT contract_documents_contract_id_fkey FOREIGN KEY (contract_id) REFERENCES public.contracts(id);


--
-- TOC entry 3333 (class 2606 OID 16447)
-- Name: contracts contracts_client_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contracts
    ADD CONSTRAINT contracts_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.clients(id);


--
-- TOC entry 3334 (class 2606 OID 16442)
-- Name: contracts contracts_property_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contracts
    ADD CONSTRAINT contracts_property_id_fkey FOREIGN KEY (property_id) REFERENCES public.properties(id);


--
-- TOC entry 3336 (class 2606 OID 16471)
-- Name: payments payments_contract_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_contract_id_fkey FOREIGN KEY (contract_id) REFERENCES public.contracts(id);


--
-- TOC entry 3331 (class 2606 OID 16431)
-- Name: properties properties_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.properties
    ADD CONSTRAINT properties_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES public.owners(id);


--
-- TOC entry 3332 (class 2606 OID 16426)
-- Name: properties properties_property_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.properties
    ADD CONSTRAINT properties_property_type_id_fkey FOREIGN KEY (property_type_id) REFERENCES public.property_types(id);


--
-- TOC entry 3337 (class 2606 OID 16493)
-- Name: property_amenities property_amenities_amenity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.property_amenities
    ADD CONSTRAINT property_amenities_amenity_id_fkey FOREIGN KEY (amenity_id) REFERENCES public.amenities(id);


--
-- TOC entry 3338 (class 2606 OID 16488)
-- Name: property_amenities property_amenities_property_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.property_amenities
    ADD CONSTRAINT property_amenities_property_id_fkey FOREIGN KEY (property_id) REFERENCES public.properties(id);


--
-- TOC entry 3339 (class 2606 OID 16509)
-- Name: visits visits_client_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visits
    ADD CONSTRAINT visits_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.clients(id);


--
-- TOC entry 3340 (class 2606 OID 16504)
-- Name: visits visits_property_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visits
    ADD CONSTRAINT visits_property_id_fkey FOREIGN KEY (property_id) REFERENCES public.properties(id);


--
-- TOC entry 3508 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2025-08-28 08:28:16

--
-- PostgreSQL database dump complete
--

