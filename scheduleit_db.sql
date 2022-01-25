--
-- PostgreSQL database dump
--

-- Dumped from database version 13.4
-- Dumped by pg_dump version 13.4

-- Started on 2022-01-25 11:35:55

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

DROP DATABASE scheduleit;
--
-- TOC entry 3033 (class 1262 OID 16394)
-- Name: scheduleit; Type: DATABASE; Schema: -; Owner: scheduleit
--

CREATE DATABASE scheduleit WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_India.1252';

-- Role: scheduleit
-- DROP ROLE scheduleit;

CREATE ROLE scheduleit WITH
  LOGIN
  SUPERUSER
  INHERIT
  CREATEDB
  CREATEROLE
  NOREPLICATION
  ENCRYPTED PASSWORD 'SCRAM-SHA-256$4096:RUJPwypL9jFwqTmCBNlavw==$HLvD1iUUcNotqmX6y7VQcBwEZkihX2E7A9hIwwp84O4=:IyNjqjWGr94nFqHQLAxm5KCIQ5kUpWgw5pEFwTW/EAs=';
  

ALTER DATABASE scheduleit OWNER TO scheduleit;

\connect scheduleit

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
-- TOC entry 201 (class 1259 OID 16414)
-- Name: airline_safety; Type: TABLE; Schema: public; Owner: scheduleit
--

CREATE TABLE public.airline_safety (
    sr_no integer NOT NULL,
    airline character varying(100),
    avail_seat_km_per_week bigint,
    incidents_85_99 integer,
    fatal_accidents_85_99 integer,
    fatalities_85_99 integer,
    incidents_00_14 integer,
    fatal_accidents_00_14 integer,
    fatalities_00_14 integer
);


ALTER TABLE public.airline_safety OWNER TO scheduleit;

--
-- TOC entry 207 (class 1259 OID 16473)
-- Name: airline_safety_temp; Type: TABLE; Schema: public; Owner: scheduleit
--

CREATE TABLE public.airline_safety_temp (
    sr_no integer NOT NULL,
    airline character varying(100),
    avail_seat_km_per_week bigint,
    incidents_85_99 integer,
    fatal_accidents_85_99 integer,
    fatalities_85_99 integer,
    incidents_00_14 integer,
    fatal_accidents_00_14 integer,
    fatalities_00_14 integer
);


ALTER TABLE public.airline_safety_temp OWNER TO scheduleit;

--
-- TOC entry 202 (class 1259 OID 16419)
-- Name: connections; Type: TABLE; Schema: public; Owner: scheduleit
--

CREATE TABLE public.connections (
    connection_id integer NOT NULL,
    job_id integer,
    connection_type integer,
    connection_name character varying(100),
    connection_url character varying(200),
    connection_username character varying(100),
    connection_password character varying(100),
    disabled "char",
    connection_driver integer,
    connection_driver_target integer,
    connection_url_target character varying(100),
    connection_username_target character varying(100),
    connection_password_target character varying(100),
    connection_name_target character varying(100)
);


ALTER TABLE public.connections OWNER TO scheduleit;

--
-- TOC entry 200 (class 1259 OID 16409)
-- Name: job; Type: TABLE; Schema: public; Owner: scheduleit
--

CREATE TABLE public.job (
    job_id integer NOT NULL,
    job_name character varying(100),
    user_id integer,
    cron_expression character varying(100),
    export_path character varying(200),
    disabled "char",
    job_type integer,
    job_frequency integer,
    hours integer,
    minutes integer,
    month_day integer,
    week_day integer
);


ALTER TABLE public.job OWNER TO scheduleit;

--
-- TOC entry 205 (class 1259 OID 16464)
-- Name: job_mailer_sr_no_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.job_mailer_sr_no_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.job_mailer_sr_no_seq OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16466)
-- Name: job_mailer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.job_mailer (
    sr_no bigint DEFAULT nextval('public.job_mailer_sr_no_seq'::regclass) NOT NULL,
    job_id integer,
    mail_id character varying(200),
    name character varying(200),
    disabled "char"
);


ALTER TABLE public.job_mailer OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16438)
-- Name: job_query; Type: TABLE; Schema: public; Owner: scheduleit
--

CREATE TABLE public.job_query (
    connection_id integer NOT NULL,
    job_id integer,
    job_query_id integer NOT NULL,
    connection_type integer,
    job_query_text character varying,
    disabled "char",
    job_query_text_target character varying
);


ALTER TABLE public.job_query OWNER TO scheduleit;

--
-- TOC entry 204 (class 1259 OID 16451)
-- Name: users; Type: TABLE; Schema: public; Owner: scheduleit
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(150),
    employee_code integer,
    email character varying(200),
    password character varying(200),
    disabled "char",
    last_login timestamp without time zone
);


ALTER TABLE public.users OWNER TO scheduleit;

--
-- TOC entry 3021 (class 0 OID 16414)
-- Dependencies: 201
-- Data for Name: airline_safety; Type: TABLE DATA; Schema: public; Owner: scheduleit
--

INSERT INTO public.airline_safety (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (1, 'Aer Lingus', 320906734, 2, 0, 0, 0, 0, 0);
INSERT INTO public.airline_safety (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (2, 'Aeroflot', 1197672318, 76, 14, 128, 6, 1, 88);
INSERT INTO public.airline_safety (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (3, 'Aerolineas Argentinas', 385803648, 6, 0, 0, 1, 0, 0);
INSERT INTO public.airline_safety (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (4, 'Aeromexico', 596871813, 3, 1, 64, 5, 0, 0);
INSERT INTO public.airline_safety (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (5, 'Air Canada', 1865253802, 2, 0, 0, 2, 0, 0);
INSERT INTO public.airline_safety (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (6, 'Air France', 3004002661, 14, 4, 79, 6, 2, 337);
INSERT INTO public.airline_safety (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (7, 'Air India', 869253552, 2, 1, 329, 4, 1, 158);
INSERT INTO public.airline_safety (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (8, 'Air New Zealand', 710174817, 3, 0, 0, 5, 1, 7);
INSERT INTO public.airline_safety (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (9, 'Alaska Airlines', 965346773, 5, 0, 0, 5, 1, 88);
INSERT INTO public.airline_safety (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (10, 'Alitalia', 698012498, 7, 2, 50, 4, 0, 0);
INSERT INTO public.airline_safety (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (11, 'All Nippon Airways', 1841234177, 3, 1, 1, 7, 0, 0);
INSERT INTO public.airline_safety (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (12, 'American', 5228357340, 21, 5, 101, 17, 3, 416);
INSERT INTO public.airline_safety (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (13, 'Austrian Airlines', 358239823, 1, 0, 0, 1, 0, 0);
INSERT INTO public.airline_safety (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (14, 'Avianca', 396922563, 5, 3, 323, 0, 0, 0);
INSERT INTO public.airline_safety (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (15, 'British Airways', 3179760952, 4, 0, 0, 6, 0, 0);
INSERT INTO public.airline_safety (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (16, 'Cathay Pacific', 2582459303, 0, 0, 0, 2, 0, 0);
INSERT INTO public.airline_safety (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (17, 'China Airlines', 813216487, 12, 6, 535, 2, 1, 225);
INSERT INTO public.airline_safety (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (18, 'Condor', 417982610, 2, 1, 16, 0, 0, 0);
INSERT INTO public.airline_safety (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (19, 'COPA', 550491507, 3, 1, 47, 0, 0, 0);
INSERT INTO public.airline_safety (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (20, 'Delta / Northwest', 6525658894, 24, 12, 407, 24, 2, 51);
INSERT INTO public.airline_safety (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (21, 'Egyptair', 557699891, 8, 3, 282, 4, 1, 14);
INSERT INTO public.airline_safety (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (22, 'El Al', 335448023, 1, 1, 4, 1, 0, 0);
INSERT INTO public.airline_safety (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (23, 'Ethiopian Airlines', 488560643, 25, 5, 167, 5, 2, 92);
INSERT INTO public.airline_safety (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (24, 'Finnair', 506464950, 1, 0, 0, 0, 0, 0);
INSERT INTO public.airline_safety (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (25, 'Garuda Indonesia', 613356665, 10, 3, 260, 4, 2, 22);
INSERT INTO public.airline_safety (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (26, 'Gulf Air', 301379762, 1, 0, 0, 3, 1, 143);
INSERT INTO public.airline_safety (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (27, 'Hawaiian Airlines', 493877795, 0, 0, 0, 1, 0, 0);
INSERT INTO public.airline_safety (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (28, 'Iberia', 1173203126, 4, 1, 148, 5, 0, 0);
INSERT INTO public.airline_safety (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (29, 'Japan Airlines', 1574217531, 3, 1, 520, 0, 0, 0);
INSERT INTO public.airline_safety (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (30, 'Kenya Airways', 277414794, 2, 0, 0, 2, 2, 283);
INSERT INTO public.airline_safety (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (31, 'KLM', 1874561773, 7, 1, 3, 1, 0, 0);
INSERT INTO public.airline_safety (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (32, 'Korean Air', 1734522605, 12, 5, 425, 1, 0, 0);
INSERT INTO public.airline_safety (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (33, 'LAN Airlines', 1001965891, 3, 2, 21, 0, 0, 0);
INSERT INTO public.airline_safety (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (34, 'Lufthansa', 3426529504, 6, 1, 2, 3, 0, 0);
INSERT INTO public.airline_safety (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (35, 'Malaysia Airlines', 1039171244, 3, 1, 34, 3, 2, 537);
INSERT INTO public.airline_safety (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (36, 'Pakistan International', 348563137, 8, 3, 234, 10, 2, 46);
INSERT INTO public.airline_safety (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (37, 'Philippine Airlines', 413007158, 7, 4, 74, 2, 1, 1);
INSERT INTO public.airline_safety (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (38, 'Qantas', 1917428984, 1, 0, 0, 5, 0, 0);
INSERT INTO public.airline_safety (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (39, 'Royal Air Maroc', 295705339, 5, 3, 51, 3, 0, 0);
INSERT INTO public.airline_safety (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (40, 'SAS', 682971852, 5, 0, 0, 6, 1, 110);
INSERT INTO public.airline_safety (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (41, 'Saudi Arabian', 859673901, 7, 2, 313, 11, 0, 0);
INSERT INTO public.airline_safety (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (42, 'Singapore Airlines', 2376857805, 2, 2, 6, 2, 1, 83);
INSERT INTO public.airline_safety (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (43, 'South African', 651502442, 2, 1, 159, 1, 0, 0);
INSERT INTO public.airline_safety (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (44, 'Southwest Airlines', 3276525770, 1, 0, 0, 8, 0, 0);
INSERT INTO public.airline_safety (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (45, 'Sri Lankan / AirLanka', 325582976, 2, 1, 14, 4, 0, 0);
INSERT INTO public.airline_safety (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (46, 'SWISS', 792601299, 2, 1, 229, 3, 0, 0);
INSERT INTO public.airline_safety (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (47, 'TACA', 259373346, 3, 1, 3, 1, 1, 3);
INSERT INTO public.airline_safety (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (48, 'TAM', 1509195646, 8, 3, 98, 7, 2, 188);
INSERT INTO public.airline_safety (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (49, 'TAP - Air Portugal', 619130754, 0, 0, 0, 0, 0, 0);
INSERT INTO public.airline_safety (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (50, 'Thai Airways', 1702802250, 8, 4, 308, 2, 1, 1);
INSERT INTO public.airline_safety (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (51, 'Turkish Airlines', 1946098294, 8, 3, 64, 8, 2, 84);
INSERT INTO public.airline_safety (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (52, 'United / Continental', 7139291291, 19, 8, 319, 14, 2, 109);
INSERT INTO public.airline_safety (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (53, 'US Airways / America West', 2455687887, 16, 7, 224, 11, 2, 23);
INSERT INTO public.airline_safety (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (54, 'Vietnam Airlines', 625084918, 7, 3, 171, 1, 0, 0);
INSERT INTO public.airline_safety (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (55, 'Virgin Atlantic', 1005248585, 1, 0, 0, 0, 0, 0);
INSERT INTO public.airline_safety (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (56, 'Xiamen Airlines', 430462962, 9, 1, 82, 2, 0, 0);


--
-- TOC entry 3027 (class 0 OID 16473)
-- Dependencies: 207
-- Data for Name: airline_safety_temp; Type: TABLE DATA; Schema: public; Owner: scheduleit
--

INSERT INTO public.airline_safety_temp (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (1, 'Aer Lingus', 320906734, 2, 0, 0, 0, 0, 0);
INSERT INTO public.airline_safety_temp (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (2, 'Aeroflot', 1197672318, 76, 14, 128, 6, 1, 88);
INSERT INTO public.airline_safety_temp (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (3, 'Aerolineas Argentinas', 385803648, 6, 0, 0, 1, 0, 0);
INSERT INTO public.airline_safety_temp (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (4, 'Aeromexico', 596871813, 3, 1, 64, 5, 0, 0);
INSERT INTO public.airline_safety_temp (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (5, 'Air Canada', 1865253802, 2, 0, 0, 2, 0, 0);
INSERT INTO public.airline_safety_temp (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (6, 'Air France', 3004002661, 14, 4, 79, 6, 2, 337);
INSERT INTO public.airline_safety_temp (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (7, 'Air India', 869253552, 2, 1, 329, 4, 1, 158);
INSERT INTO public.airline_safety_temp (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (8, 'Air New Zealand', 710174817, 3, 0, 0, 5, 1, 7);
INSERT INTO public.airline_safety_temp (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (9, 'Alaska Airlines', 965346773, 5, 0, 0, 5, 1, 88);
INSERT INTO public.airline_safety_temp (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (10, 'Alitalia', 698012498, 7, 2, 50, 4, 0, 0);
INSERT INTO public.airline_safety_temp (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (11, 'All Nippon Airways', 1841234177, 3, 1, 1, 7, 0, 0);
INSERT INTO public.airline_safety_temp (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (12, 'American', 5228357340, 21, 5, 101, 17, 3, 416);
INSERT INTO public.airline_safety_temp (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (13, 'Austrian Airlines', 358239823, 1, 0, 0, 1, 0, 0);
INSERT INTO public.airline_safety_temp (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (14, 'Avianca', 396922563, 5, 3, 323, 0, 0, 0);
INSERT INTO public.airline_safety_temp (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (15, 'British Airways', 3179760952, 4, 0, 0, 6, 0, 0);
INSERT INTO public.airline_safety_temp (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (16, 'Cathay Pacific', 2582459303, 0, 0, 0, 2, 0, 0);
INSERT INTO public.airline_safety_temp (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (17, 'China Airlines', 813216487, 12, 6, 535, 2, 1, 225);
INSERT INTO public.airline_safety_temp (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (18, 'Condor', 417982610, 2, 1, 16, 0, 0, 0);
INSERT INTO public.airline_safety_temp (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (19, 'COPA', 550491507, 3, 1, 47, 0, 0, 0);
INSERT INTO public.airline_safety_temp (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (20, 'Delta / Northwest', 6525658894, 24, 12, 407, 24, 2, 51);
INSERT INTO public.airline_safety_temp (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (21, 'Egyptair', 557699891, 8, 3, 282, 4, 1, 14);
INSERT INTO public.airline_safety_temp (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (22, 'El Al', 335448023, 1, 1, 4, 1, 0, 0);
INSERT INTO public.airline_safety_temp (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (23, 'Ethiopian Airlines', 488560643, 25, 5, 167, 5, 2, 92);
INSERT INTO public.airline_safety_temp (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (24, 'Finnair', 506464950, 1, 0, 0, 0, 0, 0);
INSERT INTO public.airline_safety_temp (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (25, 'Garuda Indonesia', 613356665, 10, 3, 260, 4, 2, 22);
INSERT INTO public.airline_safety_temp (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (26, 'Gulf Air', 301379762, 1, 0, 0, 3, 1, 143);
INSERT INTO public.airline_safety_temp (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (27, 'Hawaiian Airlines', 493877795, 0, 0, 0, 1, 0, 0);
INSERT INTO public.airline_safety_temp (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (28, 'Iberia', 1173203126, 4, 1, 148, 5, 0, 0);
INSERT INTO public.airline_safety_temp (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (29, 'Japan Airlines', 1574217531, 3, 1, 520, 0, 0, 0);
INSERT INTO public.airline_safety_temp (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (30, 'Kenya Airways', 277414794, 2, 0, 0, 2, 2, 283);
INSERT INTO public.airline_safety_temp (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (31, 'KLM', 1874561773, 7, 1, 3, 1, 0, 0);
INSERT INTO public.airline_safety_temp (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (32, 'Korean Air', 1734522605, 12, 5, 425, 1, 0, 0);
INSERT INTO public.airline_safety_temp (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (33, 'LAN Airlines', 1001965891, 3, 2, 21, 0, 0, 0);
INSERT INTO public.airline_safety_temp (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (34, 'Lufthansa', 3426529504, 6, 1, 2, 3, 0, 0);
INSERT INTO public.airline_safety_temp (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (35, 'Malaysia Airlines', 1039171244, 3, 1, 34, 3, 2, 537);
INSERT INTO public.airline_safety_temp (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (36, 'Pakistan International', 348563137, 8, 3, 234, 10, 2, 46);
INSERT INTO public.airline_safety_temp (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (37, 'Philippine Airlines', 413007158, 7, 4, 74, 2, 1, 1);
INSERT INTO public.airline_safety_temp (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (38, 'Qantas', 1917428984, 1, 0, 0, 5, 0, 0);
INSERT INTO public.airline_safety_temp (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (39, 'Royal Air Maroc', 295705339, 5, 3, 51, 3, 0, 0);
INSERT INTO public.airline_safety_temp (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (40, 'SAS', 682971852, 5, 0, 0, 6, 1, 110);
INSERT INTO public.airline_safety_temp (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (41, 'Saudi Arabian', 859673901, 7, 2, 313, 11, 0, 0);
INSERT INTO public.airline_safety_temp (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (42, 'Singapore Airlines', 2376857805, 2, 2, 6, 2, 1, 83);
INSERT INTO public.airline_safety_temp (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (43, 'South African', 651502442, 2, 1, 159, 1, 0, 0);
INSERT INTO public.airline_safety_temp (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (44, 'Southwest Airlines', 3276525770, 1, 0, 0, 8, 0, 0);
INSERT INTO public.airline_safety_temp (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (45, 'Sri Lankan / AirLanka', 325582976, 2, 1, 14, 4, 0, 0);
INSERT INTO public.airline_safety_temp (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (46, 'SWISS', 792601299, 2, 1, 229, 3, 0, 0);
INSERT INTO public.airline_safety_temp (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (47, 'TACA', 259373346, 3, 1, 3, 1, 1, 3);
INSERT INTO public.airline_safety_temp (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (48, 'TAM', 1509195646, 8, 3, 98, 7, 2, 188);
INSERT INTO public.airline_safety_temp (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (49, 'TAP - Air Portugal', 619130754, 0, 0, 0, 0, 0, 0);
INSERT INTO public.airline_safety_temp (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (50, 'Thai Airways', 1702802250, 8, 4, 308, 2, 1, 1);
INSERT INTO public.airline_safety_temp (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (51, 'Turkish Airlines', 1946098294, 8, 3, 64, 8, 2, 84);
INSERT INTO public.airline_safety_temp (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (52, 'United / Continental', 7139291291, 19, 8, 319, 14, 2, 109);
INSERT INTO public.airline_safety_temp (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (53, 'US Airways / America West', 2455687887, 16, 7, 224, 11, 2, 23);
INSERT INTO public.airline_safety_temp (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (54, 'Vietnam Airlines', 625084918, 7, 3, 171, 1, 0, 0);
INSERT INTO public.airline_safety_temp (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (55, 'Virgin Atlantic', 1005248585, 1, 0, 0, 0, 0, 0);
INSERT INTO public.airline_safety_temp (sr_no, airline, avail_seat_km_per_week, incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14, fatal_accidents_00_14, fatalities_00_14) VALUES (56, 'Xiamen Airlines', 430462962, 9, 1, 82, 2, 0, 0);


--
-- TOC entry 3022 (class 0 OID 16419)
-- Dependencies: 202
-- Data for Name: connections; Type: TABLE DATA; Schema: public; Owner: scheduleit
--

INSERT INTO public.connections (connection_id, job_id, connection_type, connection_name, connection_url, connection_username, connection_password, disabled, connection_driver, connection_driver_target, connection_url_target, connection_username_target, connection_password_target, connection_name_target) VALUES (1, 1, 1, 'Fetch Job_Source', 'jdbc:postgresql://localhost:5121/scheduleit', 'scheduleit', 'admin', 'N', 1, 1, 'jdbc:postgresql://localhost:5121/scheduleit', 'scheduleit', 'admin', 'Fetch Job_Target');


--
-- TOC entry 3020 (class 0 OID 16409)
-- Dependencies: 200
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: scheduleit
--

INSERT INTO public.job (job_id, job_name, user_id, cron_expression, export_path, disabled, job_type, job_frequency, hours, minutes, month_day, week_day) VALUES (1, 'Fetch Job', 0, '0 48 15 * * *', 'd:\', 'N', 3, 1, 15, 48, 9, 0);
INSERT INTO public.job (job_id, job_name, user_id, cron_expression, export_path, disabled, job_type, job_frequency, hours, minutes, month_day, week_day) VALUES (2, 'chetan job', 0, '0 10 12 * * *', '', 'N', 3, 1, 12, 10, -1, 0);


--
-- TOC entry 3026 (class 0 OID 16466)
-- Dependencies: 206
-- Data for Name: job_mailer; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3023 (class 0 OID 16438)
-- Dependencies: 203
-- Data for Name: job_query; Type: TABLE DATA; Schema: public; Owner: scheduleit
--

INSERT INTO public.job_query (connection_id, job_id, job_query_id, connection_type, job_query_text, disabled, job_query_text_target) VALUES (1, 1, 1, 0, 'select * from airline_safety', 'N', 'insert into airline_safety_temp(sr_no ,airline ,avail_seat_km_per_week ,incidents_85_99 ,fatal_accidents_85_99 ,fatalities_85_99 ,incidents_00_14 ,fatal_accidents_00_14 ,fatalities_00_14 ) values (? ,? ,? ,? ,? ,? ,? ,? ,? )');


--
-- TOC entry 3024 (class 0 OID 16451)
-- Dependencies: 204
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: scheduleit
--



--
-- TOC entry 3036 (class 0 OID 0)
-- Dependencies: 205
-- Name: job_mailer_sr_no_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.job_mailer_sr_no_seq', 1, false);


--
-- TOC entry 2881 (class 2606 OID 16418)
-- Name: airline_safety PK_airline_safety; Type: CONSTRAINT; Schema: public; Owner: scheduleit
--

ALTER TABLE ONLY public.airline_safety
    ADD CONSTRAINT "PK_airline_safety" PRIMARY KEY (sr_no);


--
-- TOC entry 2883 (class 2606 OID 16426)
-- Name: connections connections_pkey; Type: CONSTRAINT; Schema: public; Owner: scheduleit
--

ALTER TABLE ONLY public.connections
    ADD CONSTRAINT connections_pkey PRIMARY KEY (connection_id);


--
-- TOC entry 2879 (class 2606 OID 16413)
-- Name: job job_pkey; Type: CONSTRAINT; Schema: public; Owner: scheduleit
--

ALTER TABLE ONLY public.job
    ADD CONSTRAINT job_pkey PRIMARY KEY (job_id);


--
-- TOC entry 2885 (class 2606 OID 16445)
-- Name: job_query query_pk; Type: CONSTRAINT; Schema: public; Owner: scheduleit
--

ALTER TABLE ONLY public.job_query
    ADD CONSTRAINT query_pk PRIMARY KEY (job_query_id);


--
-- TOC entry 2887 (class 2606 OID 16458)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: scheduleit
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- TOC entry 2888 (class 2606 OID 16427)
-- Name: connections connections_fk_job; Type: FK CONSTRAINT; Schema: public; Owner: scheduleit
--

ALTER TABLE ONLY public.connections
    ADD CONSTRAINT connections_fk_job FOREIGN KEY (job_id) REFERENCES public.job(job_id);


--
-- TOC entry 2889 (class 2606 OID 16446)
-- Name: job_query query_fk_connections; Type: FK CONSTRAINT; Schema: public; Owner: scheduleit
--

ALTER TABLE ONLY public.job_query
    ADD CONSTRAINT query_fk_connections FOREIGN KEY (connection_id) REFERENCES public.connections(connection_id);


--
-- TOC entry 3034 (class 0 OID 0)
-- Dependencies: 205
-- Name: SEQUENCE job_mailer_sr_no_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.job_mailer_sr_no_seq TO scheduleit;


--
-- TOC entry 3035 (class 0 OID 0)
-- Dependencies: 206
-- Name: TABLE job_mailer; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.job_mailer TO scheduleit;


-- Completed on 2022-01-25 11:35:56

--
-- PostgreSQL database dump complete
--

