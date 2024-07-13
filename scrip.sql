--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

-- Started on 2024-05-14 20:10:42

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
-- TOC entry 215 (class 1259 OID 24741)
-- Name: event_categories; Type: TABLE; Schema: public2; Owner: postgres
--

CREATE TABLE public2.event_categories (
    id integer NOT NULL,
    name character varying,
    display_order integer
);


ALTER TABLE public2.event_categories OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 24746)
-- Name: event_categories_id_seq; Type: SEQUENCE; Schema: public2; Owner: postgres
--

CREATE SEQUENCE public2.event_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public2.event_categories_id_seq OWNER TO postgres;

--
-- TOC entry 4867 (class 0 OID 0)
-- Dependencies: 216
-- Name: event_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public2; Owner: postgres
--

ALTER SEQUENCE public2.event_categories_id_seq OWNED BY public2.event_categories.id;


--
-- TOC entry 217 (class 1259 OID 24747)
-- Name: event_enrollments; Type: TABLE; Schema: public2; Owner: postgres
--

CREATE TABLE public2.event_enrollments (
    id integer NOT NULL,
    id_event integer NOT NULL,
    id_user integer NOT NULL,
    description character varying,
    registration_date_time timestamp without time zone,
    attended bit(1),
    observations character varying,
    rating integer
);


ALTER TABLE public2.event_enrollments OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 24752)
-- Name: event_enrollments_id_seq; Type: SEQUENCE; Schema: public2; Owner: postgres
--

CREATE SEQUENCE public2.event_enrollments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public2.event_enrollments_id_seq OWNER TO postgres;

--
-- TOC entry 4868 (class 0 OID 0)
-- Dependencies: 218
-- Name: event_enrollments_id_seq; Type: SEQUENCE OWNED BY; Schema: public2; Owner: postgres
--

ALTER SEQUENCE public2.event_enrollments_id_seq OWNED BY public2.event_enrollments.id;


--
-- TOC entry 219 (class 1259 OID 24753)
-- Name: event_locations; Type: TABLE; Schema: public2; Owner: postgres
--

CREATE TABLE public2.event_locations (
    id integer NOT NULL,
    id_location integer NOT NULL,
    name character varying,
    full_address character varying,
    max_capacity character varying NOT NULL,
    latitude numeric,
    longitude numeric,
    id_creator_user integer NOT NULL
);


ALTER TABLE public2.event_locations OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 24758)
-- Name: event_locations_id_seq; Type: SEQUENCE; Schema: public2; Owner: postgres
--

CREATE SEQUENCE public2.event_locations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public2.event_locations_id_seq OWNER TO postgres;

--
-- TOC entry 4869 (class 0 OID 0)
-- Dependencies: 220
-- Name: event_locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public2; Owner: postgres
--

ALTER SEQUENCE public2.event_locations_id_seq OWNED BY public2.event_locations.id;


--
-- TOC entry 221 (class 1259 OID 24759)
-- Name: event_tags; Type: TABLE; Schema: public2; Owner: postgres
--

CREATE TABLE public2.event_tags (
    id integer NOT NULL,
    id_event integer NOT NULL,
    id_tag integer NOT NULL
);


ALTER TABLE public2.event_tags OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 24762)
-- Name: event_tags_id_seq; Type: SEQUENCE; Schema: public2; Owner: postgres
--

CREATE SEQUENCE public2.event_tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public2.event_tags_id_seq OWNER TO postgres;

--
-- TOC entry 4870 (class 0 OID 0)
-- Dependencies: 222
-- Name: event_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public2; Owner: postgres
--

ALTER SEQUENCE public2.event_tags_id_seq OWNED BY public2.event_tags.id;


--
-- TOC entry 223 (class 1259 OID 24763)
-- Name: events; Type: TABLE; Schema: public2; Owner: postgres
--

CREATE TABLE public2.events (
    id integer NOT NULL,
    name character varying,
    description character varying,
    id_event_category integer,
    id_event_location integer,
    start_date timestamp without time zone,
    duration_in_minutes integer NOT NULL,
    price numeric NOT NULL,
    enabled_for_enrollment bit(1),
    max_assistance integer NOT NULL,
    id_creator_user integer NOT NULL
);


ALTER TABLE public2.events OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 24768)
-- Name: events_id_seq; Type: SEQUENCE; Schema: public2; Owner: postgres
--

CREATE SEQUENCE public2.events_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public2.events_id_seq OWNER TO postgres;

--
-- TOC entry 4871 (class 0 OID 0)
-- Dependencies: 224
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public2; Owner: postgres
--

ALTER SEQUENCE public2.events_id_seq OWNED BY public2.events.id;


--
-- TOC entry 225 (class 1259 OID 24769)
-- Name: locations; Type: TABLE; Schema: public2; Owner: postgres
--

CREATE TABLE public2.locations (
    id integer NOT NULL,
    name character varying,
    id_province integer NOT NULL,
    latitude numeric,
    longitude numeric
);


ALTER TABLE public2.locations OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 24774)
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public2; Owner: postgres
--

CREATE SEQUENCE public2.locations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public2.locations_id_seq OWNER TO postgres;

--
-- TOC entry 4872 (class 0 OID 0)
-- Dependencies: 226
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public2; Owner: postgres
--

ALTER SEQUENCE public2.locations_id_seq OWNED BY public2.locations.id;


--
-- TOC entry 227 (class 1259 OID 24775)
-- Name: provinces; Type: TABLE; Schema: public2; Owner: postgres
--

CREATE TABLE public2.provinces (
    id integer NOT NULL,
    name character varying,
    full_name character varying,
    latitude numeric,
    longitude numeric,
    display_order integer
);


ALTER TABLE public2.provinces OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 24780)
-- Name: provinces_id_seq; Type: SEQUENCE; Schema: public2; Owner: postgres
--

CREATE SEQUENCE public2.provinces_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public2.provinces_id_seq OWNER TO postgres;

--
-- TOC entry 4873 (class 0 OID 0)
-- Dependencies: 228
-- Name: provinces_id_seq; Type: SEQUENCE OWNED BY; Schema: public2; Owner: postgres
--

ALTER SEQUENCE public2.provinces_id_seq OWNED BY public2.provinces.id;


--
-- TOC entry 229 (class 1259 OID 24781)
-- Name: tags; Type: TABLE; Schema: public2; Owner: postgres
--

CREATE TABLE public2.tags (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public2.tags OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 24786)
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public2; Owner: postgres
--

CREATE SEQUENCE public2.tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public2.tags_id_seq OWNER TO postgres;

--
-- TOC entry 4874 (class 0 OID 0)
-- Dependencies: 230
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public2; Owner: postgres
--

ALTER SEQUENCE public2.tags_id_seq OWNED BY public2.tags.id;


--
-- TOC entry 231 (class 1259 OID 24787)
-- Name: users; Type: TABLE; Schema: public2; Owner: postgres
--

CREATE TABLE public2.users (
    id integer NOT NULL,
    first_name character varying NOT NULL,
    last_name character varying NOT NULL,
    username character varying NOT NULL,
    password character varying NOT NULL
);


ALTER TABLE public2.users OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 24792)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public2; Owner: postgres
--

CREATE SEQUENCE public2.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public2.users_id_seq OWNER TO postgres;

--
-- TOC entry 4875 (class 0 OID 0)
-- Dependencies: 232
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public2; Owner: postgres
--

ALTER SEQUENCE public2.users_id_seq OWNED BY public2.users.id;


--
-- TOC entry 4665 (class 2604 OID 24793)
-- Name: event_categories id; Type: DEFAULT; Schema: public2; Owner: postgres
--

ALTER TABLE ONLY public2.event_categories ALTER COLUMN id SET DEFAULT nextval('public2.event_categories_id_seq'::regclass);


--
-- TOC entry 4666 (class 2604 OID 24794)
-- Name: event_enrollments id; Type: DEFAULT; Schema: public2; Owner: postgres
--

ALTER TABLE ONLY public2.event_enrollments ALTER COLUMN id SET DEFAULT nextval('public2.event_enrollments_id_seq'::regclass);


--
-- TOC entry 4667 (class 2604 OID 24795)
-- Name: event_locations id; Type: DEFAULT; Schema: public2; Owner: postgres
--

ALTER TABLE ONLY public2.event_locations ALTER COLUMN id SET DEFAULT nextval('public2.event_locations_id_seq'::regclass);


--
-- TOC entry 4668 (class 2604 OID 24796)
-- Name: event_tags id; Type: DEFAULT; Schema: public2; Owner: postgres
--

ALTER TABLE ONLY public2.event_tags ALTER COLUMN id SET DEFAULT nextval('public2.event_tags_id_seq'::regclass);


--
-- TOC entry 4669 (class 2604 OID 24797)
-- Name: events id; Type: DEFAULT; Schema: public2; Owner: postgres
--

ALTER TABLE ONLY public2.events ALTER COLUMN id SET DEFAULT nextval('public2.events_id_seq'::regclass);


--
-- TOC entry 4670 (class 2604 OID 24798)
-- Name: locations id; Type: DEFAULT; Schema: public2; Owner: postgres
--

ALTER TABLE ONLY public2.locations ALTER COLUMN id SET DEFAULT nextval('public2.locations_id_seq'::regclass);


--
-- TOC entry 4671 (class 2604 OID 24799)
-- Name: provinces id; Type: DEFAULT; Schema: public2; Owner: postgres
--

ALTER TABLE ONLY public2.provinces ALTER COLUMN id SET DEFAULT nextval('public2.provinces_id_seq'::regclass);


--
-- TOC entry 4672 (class 2604 OID 24800)
-- Name: tags id; Type: DEFAULT; Schema: public2; Owner: postgres
--

ALTER TABLE ONLY public2.tags ALTER COLUMN id SET DEFAULT nextval('public2.tags_id_seq'::regclass);


--
-- TOC entry 4673 (class 2604 OID 24801)
-- Name: users id; Type: DEFAULT; Schema: public2; Owner: postgres
--

ALTER TABLE ONLY public2.users ALTER COLUMN id SET DEFAULT nextval('public2.users_id_seq'::regclass);


--
-- TOC entry 4844 (class 0 OID 24741)
-- Dependencies: 215
-- Data for Name: event_categories; Type: TABLE DATA; Schema: public2; Owner: postgres
--

INSERT INTO public2.event_categories VALUES (5, 'Automovilisticos', 10);
INSERT INTO public2.event_categories VALUES (2, 'Culturales', 20);
INSERT INTO public2.event_categories VALUES (1, 'Deportivos', 30);
INSERT INTO public2.event_categories VALUES (8, 'Educativos', 40);
INSERT INTO public2.event_categories VALUES (6, 'Empresariales', 50);
INSERT INTO public2.event_categories VALUES (4, 'Gastronomicos', 60);
INSERT INTO public2.event_categories VALUES (3, 'Recitales', 70);
INSERT INTO public2.event_categories VALUES (7, 'Sociales', 80);
INSERT INTO public2.event_categories VALUES (10, 'Museos', 90);
INSERT INTO public2.event_categories VALUES (11, 'Obras Teatrales', 100);


--
-- TOC entry 4846 (class 0 OID 24747)
-- Dependencies: 217
-- Data for Name: event_enrollments; Type: TABLE DATA; Schema: public2; Owner: postgres
--



--
-- TOC entry 4848 (class 0 OID 24753)
-- Dependencies: 219
-- Data for Name: event_locations; Type: TABLE DATA; Schema: public2; Owner: postgres
--

INSERT INTO public2.event_locations VALUES (2, 3397, 'Movistar Arena', 'Humboldt 450, C1414 Cdad. AutÃ³noma de Buenos Aires', '15000', -34.593488697344405, -58.44735886932156, 1);
INSERT INTO public2.event_locations VALUES (3, 3361, 'Estadio de Boca juniors', 'Brandsen 805, C1161 Cdad. AutÃ³noma de Buenos Aires', '54000', -34.6348870412886, -58.364713384660796, 1);
INSERT INTO public2.event_locations VALUES (4, 3391, 'Estadio de River Plate', 'Av. Pres. Figueroa Alcorta 7597, C1428 Cdad. AutÃ³noma de Buenos Aires', '84567', -34.54453950530218, -58.44976340223022, 1);
INSERT INTO public2.event_locations VALUES (5, 3355, 'Teatro ColÃ³n', 'Cerrito 628, Ciudad AutÃ³noma de Buenos Aires, RepÃºblica Argentina', '2478', -34.600833067616335, -58.38356173216588, 1);
INSERT INTO public2.event_locations VALUES (6, 3354, 'Museo Nacional Ferroviario', 'Av. del Libertador 405', '1000', -34.58970739298685, -58.37839226506462, 1);
INSERT INTO public2.event_locations VALUES (7, 3742, 'TecnÃ³polis', 'Av. San Juan Bautista de la Salle 4500, Cdad. AutÃ³noma de Buenos Aires', '13000', -34.55910875385725, -58.50589314720406, 1);
INSERT INTO public2.event_locations VALUES (8, 3355, 'Luna Park', 'Av. Eduardo Madero 470, C1106 Cdad. AutÃ³noma de Buenos Aires', '8400', -34.601761864468756, -58.36891780311716, 1);
INSERT INTO public2.event_locations VALUES (9, 3355, 'Teatro Apolo', 'Av. Corrientes 1372, C1043 ABN, Cdad. AutÃ³noma de Buenos Aires', '498', -34.60390880869589, -58.386146060786594, 1);


--
-- TOC entry 4850 (class 0 OID 24759)
-- Dependencies: 221
-- Data for Name: event_tags; Type: TABLE DATA; Schema: public2; Owner: postgres
--

INSERT INTO public2.event_tags VALUES (2, 6, 1);
INSERT INTO public2.event_tags VALUES (3, 6, 2);
INSERT INTO public2.event_tags VALUES (4, 8, 1);
INSERT INTO public2.event_tags VALUES (5, 8, 2);


--
-- TOC entry 4852 (class 0 OID 24763)
-- Dependencies: 223
-- Data for Name: events; Type: TABLE DATA; Schema: public2; Owner: postgres
--

INSERT INTO public2.events VALUES (8, 'Toto', 'La legendaria banda estadounidense se presentarÃ¡ en Buenos Aires.', 3, 2, '2024-11-22 00:00:00', 120, 150000, B'1', 12000, 1);
INSERT INTO public2.events VALUES (7, 'Tan Bionica', 'Tan Bionica agrega una noche mÃ¡gica mÃ¡s: el show llega el 1 de agosto al Movistar Arena, con producciÃ³n de DF Entertainment.', 3, 2, '2024-08-01 00:00:00', 120, 60000, B'0', 10000, 1);
INSERT INTO public2.events VALUES (6, 'Taylor Swift', 'Taylor Swift viene a Argentina el 9, 10 y 12 de noviembre de 2023.', 3, 4, '2023-11-09 00:00:00', 120, 50000, B'1', 120000, 1);
INSERT INTO public2.events VALUES (13, 'La Konga', 'La agrupaciÃ³n argentina de cuarteto mÃ¡s convocante de Argentina harÃ¡ bailar el Movistar Arena al ritmo de todos los clÃ¡sicos de sus mÃ¡s de dos dÃ©cadas de Ã©xito.', 3, 2, '2024-05-13 00:00:00', 140, 25000, B'1', 12000, 1);
INSERT INTO public2.events VALUES (14, 'La Konga', 'La agrupaciÃ³n argentina de cuarteto mÃ¡s convocante de Argentina harÃ¡ bailar el Movistar Arena al ritmo de todos los clÃ¡sicos de sus mÃ¡s de dos dÃ©cadas de Ã©xito.', 3, 2, '2024-05-14 00:00:00', 140, 25000, B'1', 12000, 1);
INSERT INTO public2.events VALUES (9, 'Emilia', 'Emilia presenta su nueva gira ".MP3" en Buenos Aires despuÃ©s de su exitoso Tour 2023 que abarcÃ³ 22 fechas en diversos paÃ­ses. Con producciÃ³n de Fenix Entertainment, la gira promete una puesta en escena impactante, destacando la escenografÃ­a, vestuario y coreografÃ­as que caracterizan los shows de Emilia.', 3, 2, '2024-05-03 00:00:00', 120, 150000, B'1', 12000, 1);
INSERT INTO public2.events VALUES (10, 'Emilia', 'Emilia presenta su nueva gira ".MP3" en Buenos Aires despuÃ©s de su exitoso Tour 2023 que abarcÃ³ 22 fechas en diversos paÃ­ses. Con producciÃ³n de Fenix Entertainment, la gira promete una puesta en escena impactante, destacando la escenografÃ­a, vestuario y coreografÃ­as que caracterizan los shows de Emilia.', 3, 2, '2024-05-29 00:00:00', 120, 150000, B'1', 12000, 1);
INSERT INTO public2.events VALUES (11, 'Emilia', 'Emilia presenta su nueva gira ".MP3" en Buenos Aires despuÃ©s de su exitoso Tour 2023 que abarcÃ³ 22 fechas en diversos paÃ­ses. Con producciÃ³n de Fenix Entertainment, la gira promete una puesta en escena impactante, destacando la escenografÃ­a, vestuario y coreografÃ­as que caracterizan los shows de Emilia.', 3, 2, '2024-05-30 00:00:00', 120, 150000, B'1', 12000, 1);
INSERT INTO public2.events VALUES (12, 'Emilia', 'Emilia presenta su nueva gira ".MP3" en Buenos Aires despuÃ©s de su exitoso Tour 2023 que abarcÃ³ 22 fechas en diversos paÃ­ses. Con producciÃ³n de Fenix Entertainment, la gira promete una puesta en escena impactante, destacando la escenografÃ­a, vestuario y coreografÃ­as que caracterizan los shows de Emilia.', 3, 2, '2024-05-31 00:00:00', 120, 150000, B'1', 12000, 1);
INSERT INTO public2.events VALUES (18, 'Luciano Pereyra', 'Luciano Pereyra en Tour Hasta el Alma', 3, 2, '2024-05-10 00:00:00', 100, 22000, B'1', 12000, 1);
INSERT INTO public2.events VALUES (19, 'Luciano Pereyra', 'Luciano Pereyra en Tour Hasta el Alma', 3, 2, '2024-05-11 00:00:00', 100, 22000, B'1', 12000, 1);
INSERT INTO public2.events VALUES (20, 'Luck Ra', 'El Baile del AÃ±o', 3, 2, '2024-05-16 00:00:00', 100, 22000, B'1', 12000, 1);
INSERT INTO public2.events VALUES (21, 'Luck Ra', 'El Baile del AÃ±o', 3, 2, '2024-05-17 00:00:00', 100, 22000, B'1', 12000, 1);
INSERT INTO public2.events VALUES (22, 'Miranda', 'Miranda! llega por primera vez al Movistar Arena de Buenos Aires el prÃ³ximo 20, 21 y 22 de junio.', 3, 2, '2024-06-20 00:00:00', 100, 30000, B'1', 12000, 1);
INSERT INTO public2.events VALUES (23, 'Miranda', 'Miranda! llega por primera vez al Movistar Arena de Buenos Aires el prÃ³ximo 20, 21 y 22 de junio.', 3, 2, '2024-06-21 00:00:00', 100, 30000, B'1', 12000, 1);
INSERT INTO public2.events VALUES (24, 'Miranda', 'Miranda! llega por primera vez al Movistar Arena de Buenos Aires el prÃ³ximo 20, 21 y 22 de junio.', 3, 2, '2024-06-22 00:00:00', 100, 30000, B'1', 12000, 1);
INSERT INTO public2.events VALUES (25, 'Tan Bionica', 'Tan Bionica agrega una noche mÃ¡gica mÃ¡s: el show llega el 1 de agosto al Movistar Arena, con producciÃ³n de DF Entertainment.', 3, 2, '2024-08-01 00:00:00', 100, 30000, B'1', 12000, 1);
INSERT INTO public2.events VALUES (26, 'Ciro y Los Persas', 'Luego de cerrar 2023 con tres funciones agotadas, Ciro y los Persas regresan al Movistar Arena el 8 y 9 de agosto. SerÃ¡ la tercera ocasiÃ³n en que se presenten en este estadio de la Ciudad de Buenos Aires.', 3, 2, '2024-08-08 00:00:00', 100, 30000, B'1', 12000, 1);
INSERT INTO public2.events VALUES (27, 'Ciro y Los Persas', 'Luego de cerrar 2023 con tres funciones agotadas, Ciro y los Persas regresan al Movistar Arena el 8 y 9 de agosto. SerÃ¡ la tercera ocasiÃ³n en que se presenten en este estadio de la Ciudad de Buenos Aires.', 3, 2, '2024-08-09 00:00:00', 100, 30000, B'1', 12000, 1);
INSERT INTO public2.events VALUES (30, 'Flor Bertotti', 'La gira, que ha sido un rotundo Ã©xito con mÃºltiples sold outs en diversas ciudades, ahora se prepara para su presentaciÃ³n inolvidable en el Movistar Arena. Flor Bertotti en Concierto, promete llevarte en un viaje musical lleno de emociÃ³n y alegrÃ­a, recordando sus grandes Ã©xitos y presentando material fresco que cautivarÃ¡ a todos los fanÃ¡ticos de la talentosa actriz y cantante.', 3, 2, '2024-09-08 00:00:00', 100, 40000, B'1', 12000, 1);
INSERT INTO public2.events VALUES (31, 'Flor Bertotti', 'La gira, que ha sido un rotundo Ã©xito con mÃºltiples sold outs en diversas ciudades, ahora se prepara para su presentaciÃ³n inolvidable en el Movistar Arena. Flor Bertotti en Concierto, promete llevarte en un viaje musical lleno de emociÃ³n y alegrÃ­a, recordando sus grandes Ã©xitos y presentando material fresco que cautivarÃ¡ a todos los fanÃ¡ticos de la talentosa actriz y cantante.', 3, 2, '2024-09-09 00:00:00', 100, 40000, B'1', 12000, 1);
INSERT INTO public2.events VALUES (32, 'Flor Bertotti', 'La gira, que ha sido un rotundo Ã©xito con mÃºltiples sold outs en diversas ciudades, ahora se prepara para su presentaciÃ³n inolvidable en el Movistar Arena. Flor Bertotti en Concierto, promete llevarte en un viaje musical lleno de emociÃ³n y alegrÃ­a, recordando sus grandes Ã©xitos y presentando material fresco que cautivarÃ¡ a todos los fanÃ¡ticos de la talentosa actriz y cantante.', 3, 2, '2024-09-15 00:00:00', 100, 40000, B'1', 12000, 1);
INSERT INTO public2.events VALUES (28, 'Cuarteto de Nos', 'El pÃºblico de Argentina se hizo escuchar y cuando comenzaron los anuncios de fechas, reclamaron el suyo. AsÃ­ que luego de agotar anticipadamente 2 Movistar Arena en menos de un aÃ±o, Cuarteto cumple y anuncia su fecha para Buenos Aires el dÃ­a sÃ¡bado 31 de Agosto a las 21:00hs en el Movistar Arena', 3, 2, '2024-08-31 00:00:00', 100, 40000, B'1', 12000, 1);
INSERT INTO public2.events VALUES (29, 'Cuarteto de Nos', 'El pÃºblico de Argentina se hizo escuchar y cuando comenzaron los anuncios de fechas, reclamaron el suyo. AsÃ­ que luego de agotar anticipadamente 2 Movistar Arena en menos de un aÃ±o, Cuarteto cumple y anuncia su fecha para Buenos Aires el dÃ­a sÃ¡bado 31 de Agosto a las 21:00hs en el Movistar Arena', 3, 2, '2024-09-01 00:00:00', 100, 40000, B'1', 12000, 1);
INSERT INTO public2.events VALUES (33, 'Flor Bertotti', 'La gira, que ha sido un rotundo Ã©xito con mÃºltiples sold outs en diversas ciudades, ahora se prepara para su presentaciÃ³n inolvidable en el Movistar Arena. Flor Bertotti en Concierto, promete llevarte en un viaje musical lleno de emociÃ³n y alegrÃ­a, recordando sus grandes Ã©xitos y presentando material fresco que cautivarÃ¡ a todos los fanÃ¡ticos de la talentosa actriz y cantante.', 3, 2, '2024-09-16 00:00:00', 100, 40000, B'1', 12000, 1);
INSERT INTO public2.events VALUES (34, 'Flor Bertotti', 'La gira, que ha sido un rotundo Ã©xito con mÃºltiples sold outs en diversas ciudades, ahora se prepara para su presentaciÃ³n inolvidable en el Movistar Arena. Flor Bertotti en Concierto, promete llevarte en un viaje musical lleno de emociÃ³n y alegrÃ­a, recordando sus grandes Ã©xitos y presentando material fresco que cautivarÃ¡ a todos los fanÃ¡ticos de la talentosa actriz y cantante.', 3, 2, '2024-09-21 00:00:00', 100, 40000, B'1', 12000, 1);
INSERT INTO public2.events VALUES (35, 'Flor Bertotti', 'La gira, que ha sido un rotundo Ã©xito con mÃºltiples sold outs en diversas ciudades, ahora se prepara para su presentaciÃ³n inolvidable en el Movistar Arena. Flor Bertotti en Concierto, promete llevarte en un viaje musical lleno de emociÃ³n y alegrÃ­a, recordando sus grandes Ã©xitos y presentando material fresco que cautivarÃ¡ a todos los fanÃ¡ticos de la talentosa actriz y cantante.', 3, 2, '2024-09-22 00:00:00', 100, 40000, B'1', 12000, 1);
INSERT INTO public2.events VALUES (36, 'Flor Bertotti', 'La gira, que ha sido un rotundo Ã©xito con mÃºltiples sold outs en diversas ciudades, ahora se prepara para su presentaciÃ³n inolvidable en el Movistar Arena. Flor Bertotti en Concierto, promete llevarte en un viaje musical lleno de emociÃ³n y alegrÃ­a, recordando sus grandes Ã©xitos y presentando material fresco que cautivarÃ¡ a todos los fanÃ¡ticos de la talentosa actriz y cantante.', 3, 2, '2024-09-23 00:00:00', 100, 40000, B'1', 12000, 1);
INSERT INTO public2.events VALUES (37, 'Flor Bertotti', 'La gira, que ha sido un rotundo Ã©xito con mÃºltiples sold outs en diversas ciudades, ahora se prepara para su presentaciÃ³n inolvidable en el Movistar Arena. Flor Bertotti en Concierto, promete llevarte en un viaje musical lleno de emociÃ³n y alegrÃ­a, recordando sus grandes Ã©xitos y presentando material fresco que cautivarÃ¡ a todos los fanÃ¡ticos de la talentosa actriz y cantante.', 3, 2, '2024-09-24 00:00:00', 100, 40000, B'1', 12000, 1);
INSERT INTO public2.events VALUES (38, 'Flor Bertotti', 'La gira, que ha sido un rotundo Ã©xito con mÃºltiples sold outs en diversas ciudades, ahora se prepara para su presentaciÃ³n inolvidable en el Movistar Arena. Flor Bertotti en Concierto, promete llevarte en un viaje musical lleno de emociÃ³n y alegrÃ­a, recordando sus grandes Ã©xitos y presentando material fresco que cautivarÃ¡ a todos los fanÃ¡ticos de la talentosa actriz y cantante.', 3, 2, '2024-09-25 00:00:00', 100, 40000, B'1', 12000, 1);
INSERT INTO public2.events VALUES (39, 'Flor Bertotti', 'La gira, que ha sido un rotundo Ã©xito con mÃºltiples sold outs en diversas ciudades, ahora se prepara para su presentaciÃ³n inolvidable en el Movistar Arena. Flor Bertotti en Concierto, promete llevarte en un viaje musical lleno de emociÃ³n y alegrÃ­a, recordando sus grandes Ã©xitos y presentando material fresco que cautivarÃ¡ a todos los fanÃ¡ticos de la talentosa actriz y cantante.', 3, 2, '2024-09-26 00:00:00', 100, 40000, B'1', 12000, 1);
INSERT INTO public2.events VALUES (40, 'KEANE', 'Una de las bandas mÃ¡s importantes de Gran BretaÃ±a vuelve para interpretar uno de los Ã¡lbumes mÃ¡s importantes de su carrera Hopes and Fears.', 3, 2, '2024-11-14 00:00:00', 100, 60000, B'1', 12000, 1);
INSERT INTO public2.events VALUES (41, 'David Bisbal', 'David Bisbal agotÃ³ todas sus localidades para su esperado regreso y agregÃ³ una nueva fecha en Movistar Arena para 2024.', 3, 2, '2024-11-21 00:00:00', 100, 70000, B'1', 12000, 1);
INSERT INTO public2.events VALUES (15, 'La Konga', 'La agrupaciÃ³n argentina de cuarteto mÃ¡s convocante de Argentina harÃ¡ bailar el Movistar Arena al ritmo de todos los clÃ¡sicos de sus mÃ¡s de dos dÃ©cadas de Ã©xito.', 3, 2, '2024-05-15 00:00:00', 140, 25000, B'1', 12000, 1);
INSERT INTO public2.events VALUES (16, 'La Konga', 'La agrupaciÃ³n argentina de cuarteto mÃ¡s convocante de Argentina harÃ¡ bailar el Movistar Arena al ritmo de todos los clÃ¡sicos de sus mÃ¡s de dos dÃ©cadas de Ã©xito.', 3, 2, '2024-05-20 00:00:00', 140, 25000, B'1', 12000, 1);
INSERT INTO public2.events VALUES (17, 'La Konga', 'La agrupaciÃ³n argentina de cuarteto mÃ¡s convocante de Argentina harÃ¡ bailar el Movistar Arena al ritmo de todos los clÃ¡sicos de sus mÃ¡s de dos dÃ©cadas de Ã©xito.', 3, 2, '2024-05-21 00:00:00', 140, 25000, B'1', 12000, 1);
INSERT INTO public2.events VALUES (42, 'Taylor Swift', 'Taylor Swift viene a Argentina el 9, 10 y 12 de noviembre de 2023.', 3, 4, '2023-11-10 03:00:00', 120, 50000, B'1', 120000, 1);
INSERT INTO public2.events VALUES (43, 'Taylor Swift', 'Taylor Swift viene a Argentina el 9, 10 y 12 de noviembre de 2023.', 3, 4, '2023-11-12 03:00:00', 120, 50000, B'1', 120000, 1);
INSERT INTO public2.events VALUES (44, 'Expo Autos Multimarca en el Museo Ferroviario', 'Organizado por el Club Taunus Argentina, la propuesta es disfrutar de una muestra especial que combina nuestro rico acervo ferroviario con la elegancia y el encanto de los autos clÃ¡sicos. AdemÃ¡s, habrÃ¡ food trucks para saborear riquÃ­simos sabores regionales.
Participan el Club Amigos del Torino, Reunidos por el 600 y el Club del 1500 Oficial.', 10, 6, '2024-05-25 00:00:00', 90, 2000, B'1', 40, 1);
INSERT INTO public2.events VALUES (45, 'ExposiciÃ³n del automÃ³vil en TecnÃ³polis', 'ExposiciÃ³n del automÃ³vil incluirÃ¡ autos de alta gama, clÃ¡sicos americanos y japoneses, deportivos, exÃ³ticos, hot rod, street rod, rat rod, baquets, customizados y tunning.
La muestra tendrÃ¡ motos clÃ¡sicas, choperas, deportivas y de calle, ademÃ¡s de camionetas 4Ã—4, camiones, buses, colectivos, autos de pelÃ­culas y 1/4 de milla.', 5, 7, '2024-05-17 00:00:00', 300, 10000, B'1', 8000, 1);
INSERT INTO public2.events VALUES (46, 'ExposiciÃ³n del automÃ³vil en TecnÃ³polis', 'ExposiciÃ³n del automÃ³vil incluirÃ¡ autos de alta gama, clÃ¡sicos americanos y japoneses, deportivos, exÃ³ticos, hot rod, street rod, rat rod, baquets, customizados y tunning.
La muestra tendrÃ¡ motos clÃ¡sicas, choperas, deportivas y de calle, ademÃ¡s de camionetas 4Ã—4, camiones, buses, colectivos, autos de pelÃ­culas y 1/4 de milla.', 5, 7, '2024-05-18 00:00:00', 300, 10000, B'1', 8000, 1);
INSERT INTO public2.events VALUES (47, 'ExposiciÃ³n del automÃ³vil en TecnÃ³polis', 'ExposiciÃ³n del automÃ³vil incluirÃ¡ autos de alta gama, clÃ¡sicos americanos y japoneses, deportivos, exÃ³ticos, hot rod, street rod, rat rod, baquets, customizados y tunning.
La muestra tendrÃ¡ motos clÃ¡sicas, choperas, deportivas y de calle, ademÃ¡s de camionetas 4Ã—4, camiones, buses, colectivos, autos de pelÃ­culas y 1/4 de milla.', 5, 7, '2024-05-19 00:00:00', 300, 10000, B'1', 8000, 1);
INSERT INTO public2.events VALUES (48, 'ExposiciÃ³n del automÃ³vil en TecnÃ³polis', 'ExposiciÃ³n del automÃ³vil incluirÃ¡ autos de alta gama, clÃ¡sicos americanos y japoneses, deportivos, exÃ³ticos, hot rod, street rod, rat rod, baquets, customizados y tunning.
La muestra tendrÃ¡ motos clÃ¡sicas, choperas, deportivas y de calle, ademÃ¡s de camionetas 4Ã—4, camiones, buses, colectivos, autos de pelÃ­culas y 1/4 de milla.', 5, 7, '2024-05-20 00:00:00', 300, 10000, B'1', 8000, 1);
INSERT INTO public2.events VALUES (49, 'ExposiciÃ³n del automÃ³vil en TecnÃ³polis', 'ExposiciÃ³n del automÃ³vil incluirÃ¡ autos de alta gama, clÃ¡sicos americanos y japoneses, deportivos, exÃ³ticos, hot rod, street rod, rat rod, baquets, customizados y tunning.
La muestra tendrÃ¡ motos clÃ¡sicas, choperas, deportivas y de calle, ademÃ¡s de camionetas 4Ã—4, camiones, buses, colectivos, autos de pelÃ­culas y 1/4 de milla.', 5, 7, '2024-05-21 00:00:00', 300, 10000, B'1', 8000, 1);
INSERT INTO public2.events VALUES (50, 'ExposiciÃ³n del automÃ³vil en TecnÃ³polis', 'ExposiciÃ³n del automÃ³vil incluirÃ¡ autos de alta gama, clÃ¡sicos americanos y japoneses, deportivos, exÃ³ticos, hot rod, street rod, rat rod, baquets, customizados y tunning.
La muestra tendrÃ¡ motos clÃ¡sicas, choperas, deportivas y de calle, ademÃ¡s de camionetas 4Ã—4, camiones, buses, colectivos, autos de pelÃ­culas y 1/4 de milla.', 5, 7, '2024-05-22 00:00:00', 300, 10000, B'1', 8000, 1);
INSERT INTO public2.events VALUES (51, 'ExposiciÃ³n del automÃ³vil en TecnÃ³polis', 'ExposiciÃ³n del automÃ³vil incluirÃ¡ autos de alta gama, clÃ¡sicos americanos y japoneses, deportivos, exÃ³ticos, hot rod, street rod, rat rod, baquets, customizados y tunning.
La muestra tendrÃ¡ motos clÃ¡sicas, choperas, deportivas y de calle, ademÃ¡s de camionetas 4Ã—4, camiones, buses, colectivos, autos de pelÃ­culas y 1/4 de milla.', 5, 7, '2024-05-23 00:00:00', 300, 10000, B'1', 8000, 1);
INSERT INTO public2.events VALUES (52, 'ExposiciÃ³n del automÃ³vil en TecnÃ³polis', 'ExposiciÃ³n del automÃ³vil incluirÃ¡ autos de alta gama, clÃ¡sicos americanos y japoneses, deportivos, exÃ³ticos, hot rod, street rod, rat rod, baquets, customizados y tunning.
La muestra tendrÃ¡ motos clÃ¡sicas, choperas, deportivas y de calle, ademÃ¡s de camionetas 4Ã—4, camiones, buses, colectivos, autos de pelÃ­culas y 1/4 de milla.', 5, 7, '2024-05-24 00:00:00', 300, 10000, B'1', 8000, 1);
INSERT INTO public2.events VALUES (53, 'ExposiciÃ³n del automÃ³vil en TecnÃ³polis', 'ExposiciÃ³n del automÃ³vil incluirÃ¡ autos de alta gama, clÃ¡sicos americanos y japoneses, deportivos, exÃ³ticos, hot rod, street rod, rat rod, baquets, customizados y tunning.
La muestra tendrÃ¡ motos clÃ¡sicas, choperas, deportivas y de calle, ademÃ¡s de camionetas 4Ã—4, camiones, buses, colectivos, autos de pelÃ­culas y 1/4 de milla.', 5, 7, '2024-05-25 00:00:00', 300, 10000, B'1', 8000, 1);
INSERT INTO public2.events VALUES (54, 'ExposiciÃ³n del automÃ³vil en TecnÃ³polis', 'ExposiciÃ³n del automÃ³vil incluirÃ¡ autos de alta gama, clÃ¡sicos americanos y japoneses, deportivos, exÃ³ticos, hot rod, street rod, rat rod, baquets, customizados y tunning.
La muestra tendrÃ¡ motos clÃ¡sicas, choperas, deportivas y de calle, ademÃ¡s de camionetas 4Ã—4, camiones, buses, colectivos, autos de pelÃ­culas y 1/4 de milla.', 5, 7, '2024-05-26 00:00:00', 300, 10000, B'1', 8000, 1);
INSERT INTO public2.events VALUES (55, 'FÃ¡tima Flores', 'En Concierto - Una Noche Especial. FÃ¡tima Florez, ademÃ¡s de su destacado papel como directora y coreÃ³grafa del espectÃ¡culo, tambiÃ©n brilla en el escenario con su versatilidad artÃ­stica, encarnando diversos personajes con maestrÃ­a y llevando al pÃºblico a un mundo de fantasÃ­a y realidad. Con una puesta en escena deslumbrante que combina mÃºsica en vivo, un gran cuerpo de baile, coreografÃ­as vibrantes y actuaciones magistrales.', 11, 8, '2024-06-15 00:00:00', 110, 8000, B'1', 8000, 1);
INSERT INTO public2.events VALUES (56, 'Fabiana Cantilo', 'Apocalipsis No - La voz femenina mÃ¡s emblemÃ¡tica del rock nacional no solo llenÃ³ tres Gran Rex y dio un espectacular show en el festival de la confluencia en NeuquÃ©n. Ahora Fabiana sorprende con un anuncio apocalÃ­ptico, donde el pÃºblico podrÃ¡ disfrutar de una nueva experiencia renovada e impactante, donde nos deleitarÃ¡ nuevamente con todos sus Ã©xitos cosechados durante mÃ¡s de 40 aÃ±os de carrera, en el mÃ­tico Estadio Luna Park el 21 de junio.', 11, 8, '2024-06-21 00:00:00', 110, 15000, B'1', 8000, 1);
INSERT INTO public2.events VALUES (57, 'Lisandro AristimuÃ±o', 'EL ROSTRO DE LOS ACANTILADOS - A 20 aÃ±os de su Ã¡lbum debut, recorrerÃ¡ el paÃ­s para presentar sus nuevo Ã¡lbum (considerando entre los 10 mejores discos del 2023 por la Revista Rolling Stone Argentina) y otras canciones clasicas y desta- cadas de su amplio repertorio.', 11, 8, '2024-06-01 00:00:00', 110, 18000, B'1', 8000, 1);
INSERT INTO public2.events VALUES (58, 'Moldavsky ', 'El top top top del humor vuelve -all in- al Teatro Apolo para seguir apostando a una temporada a pura risa. Las vacaciones en familia, la sala de espera del doctor, lo difÃ­cil que es adaptarse al mundo millenial y la mejor mÃºsica a cargo de la inigualable ValentÃ­n GÃ³mez. Moldavsky estrena su nuevo show en el Teatro Apolo, para reÃ­rse con -Lo Mejor de mÃ­-.', 11, 9, '2024-06-08 00:00:00', 110, 10000, B'1', 450, 1);
INSERT INTO public2.events VALUES (59, 'Moldavsky ', 'El top top top del humor vuelve -all in- al Teatro Apolo para seguir apostando a una temporada a pura risa. Las vacaciones en familia, la sala de espera del doctor, lo difÃ­cil que es adaptarse al mundo millenial y la mejor mÃºsica a cargo de la inigualable ValentÃ­n GÃ³mez. Moldavsky estrena su nuevo show en el Teatro Apolo, para reÃ­rse con -Lo Mejor de mÃ­-.', 11, 9, '2024-06-09 00:00:00', 110, 10000, B'1', 450, 1);
INSERT INTO public2.events VALUES (60, 'Moldavsky ', 'El top top top del humor vuelve -all in- al Teatro Apolo para seguir apostando a una temporada a pura risa. Las vacaciones en familia, la sala de espera del doctor, lo difÃ­cil que es adaptarse al mundo millenial y la mejor mÃºsica a cargo de la inigualable ValentÃ­n GÃ³mez. Moldavsky estrena su nuevo show en el Teatro Apolo, para reÃ­rse con -Lo Mejor de mÃ­-.', 11, 9, '2024-06-13 00:00:00', 110, 10000, B'1', 450, 1);
INSERT INTO public2.events VALUES (61, 'Moldavsky ', 'El top top top del humor vuelve -all in- al Teatro Apolo para seguir apostando a una temporada a pura risa. Las vacaciones en familia, la sala de espera del doctor, lo difÃ­cil que es adaptarse al mundo millenial y la mejor mÃºsica a cargo de la inigualable ValentÃ­n GÃ³mez. Moldavsky estrena su nuevo show en el Teatro Apolo, para reÃ­rse con -Lo Mejor de mÃ­-.', 11, 9, '2024-06-14 00:00:00', 110, 10000, B'1', 450, 1);
INSERT INTO public2.events VALUES (62, 'Moldavsky ', 'El top top top del humor vuelve -all in- al Teatro Apolo para seguir apostando a una temporada a pura risa. Las vacaciones en familia, la sala de espera del doctor, lo difÃ­cil que es adaptarse al mundo millenial y la mejor mÃºsica a cargo de la inigualable ValentÃ­n GÃ³mez. Moldavsky estrena su nuevo show en el Teatro Apolo, para reÃ­rse con -Lo Mejor de mÃ­-.', 11, 9, '2024-06-15 00:00:00', 110, 10000, B'1', 450, 1);
INSERT INTO public2.events VALUES (63, 'Moldavsky ', 'El top top top del humor vuelve -all in- al Teatro Apolo para seguir apostando a una temporada a pura risa. Las vacaciones en familia, la sala de espera del doctor, lo difÃ­cil que es adaptarse al mundo millenial y la mejor mÃºsica a cargo de la inigualable ValentÃ­n GÃ³mez. Moldavsky estrena su nuevo show en el Teatro Apolo, para reÃ­rse con -Lo Mejor de mÃ­-.', 11, 9, '2024-06-16 00:00:00', 110, 10000, B'1', 450, 1);


--
-- TOC entry 4854 (class 0 OID 24769)
-- Dependencies: 225
-- Data for Name: locations; Type: TABLE DATA; Schema: public2; Owner: postgres
--

INSERT INTO public2.locations VALUES (1, 'Ciudad de Buenos Aires', 2, -34.608417510986328, -58.372135162353516);
INSERT INTO public2.locations VALUES (2, 'CarhuÃ©', 6, -37.179481506347656, -62.759990692138672);
INSERT INTO public2.locations VALUES (3, 'Colonia San Miguel ArcÃ¡ngel', 6, -37.449016571044922, -63.117156982421875);
INSERT INTO public2.locations VALUES (4, 'DelfÃ­n Huer', 6, -37.32110595703125, -63.2343864440918);
INSERT INTO public2.locations VALUES (5, 'Espartillar', 6, -37.3574104309082, -62.438381195068359);
INSERT INTO public2.locations VALUES (6, 'Esteban AgustÃ­n GascÃ³n', 6, -37.455837249755859, -63.254310607910156);
INSERT INTO public2.locations VALUES (7, 'La Pala', 6, -36.663921356201172, -63.3664665222168);
INSERT INTO public2.locations VALUES (8, 'Maza', 6, -36.800315856933594, -63.339282989501953);
INSERT INTO public2.locations VALUES (9, 'Rivera', 6, -37.160594940185547, -63.241790771484375);
INSERT INTO public2.locations VALUES (10, 'Villa Margarita', 6, -37.461353302001953, -63.242172241210938);
INSERT INTO public2.locations VALUES (11, 'Adolfo nzales Chaves', 6, -38.032371520996094, -60.099391937255859);
INSERT INTO public2.locations VALUES (12, 'De La Garma', 6, -37.9665412902832, -60.416786193847656);
INSERT INTO public2.locations VALUES (13, 'Juan E. Barra', 6, -37.820037841796875, -60.4820556640625);
INSERT INTO public2.locations VALUES (14, 'VÃ¡squez', 6, -38.175800323486328, -60.169792175292969);
INSERT INTO public2.locations VALUES (15, 'Alberti', 6, -35.031574249267578, -60.2802848815918);
INSERT INTO public2.locations VALUES (16, 'Coronel SeguÃ­', 6, -34.867439270019531, -60.392971038818359);
INSERT INTO public2.locations VALUES (17, 'Mechita', 6, -35.067386627197266, -60.403427124023438);
INSERT INTO public2.locations VALUES (18, 'Pla', 6, -35.122894287109375, -60.221916198730469);
INSERT INTO public2.locations VALUES (19, 'Villa GrisolÃ­a', 6, -35.110000610351562, -60.070217132568359);
INSERT INTO public2.locations VALUES (20, 'Villa MarÃ­a', 6, -34.888225555419922, -60.347480773925781);
INSERT INTO public2.locations VALUES (21, 'Villa Ortiz', 6, -34.844535827636719, -60.306301116943359);
INSERT INTO public2.locations VALUES (22, 'Almirante Brown', 6, -34.798015594482422, -58.384330749511719);
INSERT INTO public2.locations VALUES (23, 'Avellaneda', 6, -34.662693023681641, -58.365165710449219);
INSERT INTO public2.locations VALUES (24, 'Ayacucho', 6, -37.152759552001953, -58.488380432128906);
INSERT INTO public2.locations VALUES (25, 'La Constancia', 6, -37.226345062255859, -58.760105133056641);
INSERT INTO public2.locations VALUES (26, 'Solanet', 6, -36.842876434326172, -58.5081672668457);
INSERT INTO public2.locations VALUES (27, 'Udaquiola', 6, -36.5623664855957, -58.534694671630859);
INSERT INTO public2.locations VALUES (28, 'Ariel', 6, -36.531421661376953, -59.9217529296875);
INSERT INTO public2.locations VALUES (29, 'Azul', 6, -36.777446746826172, -59.863441467285156);
INSERT INTO public2.locations VALUES (30, 'CacharÃ­', 6, -36.376674652099609, -59.504604339599609);
INSERT INTO public2.locations VALUES (31, 'Chillar', 6, -37.31280517578125, -59.985164642333984);
INSERT INTO public2.locations VALUES (32, '16 de Julio', 6, -37.200515747070312, -60.164653778076172);
INSERT INTO public2.locations VALUES (33, 'BahÃ­a Blanca', 6, -38.717605590820312, -62.265445709228516);
INSERT INTO public2.locations VALUES (34, 'Cabildo', 6, -38.485153198242188, -61.893753051757812);
INSERT INTO public2.locations VALUES (35, 'General Daniel Cerri', 6, -38.719364166259766, -62.395309448242188);
INSERT INTO public2.locations VALUES (36, 'Balcarce', 6, -37.846382141113281, -58.255489349365234);
INSERT INTO public2.locations VALUES (37, 'Los Pinos', 6, -37.942710876464844, -58.324275970458984);
INSERT INTO public2.locations VALUES (38, 'NapaleofÃº', 6, -37.623069763183594, -58.746368408203125);
INSERT INTO public2.locations VALUES (39, 'Ramos Otero', 6, -37.5408935546875, -58.340606689453125);
INSERT INTO public2.locations VALUES (40, 'San AgustÃ­n', 6, -38.014110565185547, -58.355934143066406);
INSERT INTO public2.locations VALUES (41, 'Villa Laguna La Brava', 6, -37.861221313476562, -57.981010437011719);
INSERT INTO public2.locations VALUES (42, 'Baradero', 6, -33.807071685791016, -59.502227783203125);
INSERT INTO public2.locations VALUES (43, 'Irineo Portela', 6, -33.979831695556641, -59.670120239257812);
INSERT INTO public2.locations VALUES (44, 'Santa Coloma', 6, -34.060871124267578, -59.560214996337891);
INSERT INTO public2.locations VALUES (45, 'Villa Alsina', 6, -33.907661437988281, -59.390647888183594);
INSERT INTO public2.locations VALUES (46, 'Arrecifes', 6, -34.0675163269043, -60.108692169189453);
INSERT INTO public2.locations VALUES (47, 'Todd', 6, -34.033554077148438, -60.155269622802734);
INSERT INTO public2.locations VALUES (48, 'ViÃ±a', 6, -33.992378234863281, -60.226417541503906);
INSERT INTO public2.locations VALUES (49, 'Barker', 6, -37.6396598815918, -59.391128540039062);
INSERT INTO public2.locations VALUES (50, 'Benito JuÃ¡rez', 6, -37.674285888671875, -59.804805755615234);
INSERT INTO public2.locations VALUES (51, 'LÃ³pez', 6, -37.552280426025391, -59.627765655517578);
INSERT INTO public2.locations VALUES (52, 'TedÃ­n Uriburu', 6, -37.364273071289062, -59.760204315185547);
INSERT INTO public2.locations VALUES (53, 'Villa Cacique', 6, -37.676223754882812, -59.396186828613281);
INSERT INTO public2.locations VALUES (54, 'Berazategui', 6, -34.769790649414062, -58.226142883300781);
INSERT INTO public2.locations VALUES (55, 'Berisso', 6, -34.867462158203125, -57.888648986816406);
INSERT INTO public2.locations VALUES (56, 'Hale', 6, -36.0020637512207, -60.855491638183594);
INSERT INTO public2.locations VALUES (57, 'Juan F. Ibarra', 6, -36.347148895263672, -61.254035949707031);
INSERT INTO public2.locations VALUES (58, 'Paula', 6, -36.503570556640625, -61.024829864501953);
INSERT INTO public2.locations VALUES (59, 'Pirovano', 6, -36.510158538818359, -61.555519104003906);
INSERT INTO public2.locations VALUES (60, 'San Carlos de BolÃ­var', 6, -36.229877471923828, -61.113918304443359);
INSERT INTO public2.locations VALUES (61, 'Urdampilleta', 6, -36.431617736816406, -61.420101165771484);
INSERT INTO public2.locations VALUES (62, 'Villa Lynch PueyrredÃ³n', 6, -36.601531982421875, -61.363666534423828);
INSERT INTO public2.locations VALUES (63, 'Bragado', 6, -35.115566253662109, -60.489650726318359);
INSERT INTO public2.locations VALUES (64, 'Comodoro Py', 6, -35.322555541992188, -60.521381378173828);
INSERT INTO public2.locations VALUES (65, 'General O''Brien', 6, -34.905609130859375, -60.760501861572266);
INSERT INTO public2.locations VALUES (66, 'Irala', 6, -34.77020263671875, -60.691020965576172);
INSERT INTO public2.locations VALUES (67, 'La Limpia', 6, -35.080097198486328, -60.591190338134766);
INSERT INTO public2.locations VALUES (68, 'Juan F. Salaberry', 6, -35.061614990234375, -60.704753875732422);
INSERT INTO public2.locations VALUES (69, 'Mechita', 6, -35.073379516601562, -60.411815643310547);
INSERT INTO public2.locations VALUES (70, 'Olascoaga', 6, -35.237396240234375, -60.6110725402832);
INSERT INTO public2.locations VALUES (71, 'Warnes', 6, -34.910133361816406, -60.5389518737793);
INSERT INTO public2.locations VALUES (72, 'Altamirano', 6, -35.361000061035156, -58.151157379150391);
INSERT INTO public2.locations VALUES (73, 'Barrio Las londrinas', 6, -35.0011100769043, -58.130546569824219);
INSERT INTO public2.locations VALUES (74, 'Barrio Los Bosquecitos', 6, -35.103775024414062, -58.184867858886719);
INSERT INTO public2.locations VALUES (75, 'Barrio Parque Las Acacias', 6, -35.098579406738281, -58.277256011962891);
INSERT INTO public2.locations VALUES (76, 'Coronel Brandsen', 6, -35.167961120605469, -58.237331390380859);
INSERT INTO public2.locations VALUES (77, 'GÃ³mez', 6, -35.067543029785156, -58.166038513183594);
INSERT INTO public2.locations VALUES (78, 'Jeppener', 6, -35.277702331542969, -58.198143005371094);
INSERT INTO public2.locations VALUES (79, 'Oliden', 6, -35.184482574462891, -57.949073791503906);
INSERT INTO public2.locations VALUES (80, 'SamborombÃ³n', 6, -35.219402313232422, -58.280990600585938);
INSERT INTO public2.locations VALUES (81, 'Los Cardales', 6, -34.313777923583984, -58.984790802001953);
INSERT INTO public2.locations VALUES (82, 'Barrio Los Pioneros (Barrio Tavella)', 6, -34.252525329589844, -58.959743499755859);
INSERT INTO public2.locations VALUES (83, 'Alejandro PetiÃ³n', 6, -34.977611541748047, -58.6745491027832);
INSERT INTO public2.locations VALUES (84, 'Barrio El Taladro', 6, -35.071453094482422, -58.865310668945312);
INSERT INTO public2.locations VALUES (85, 'CaÃ±uelas', 6, -35.053840637207031, -58.761989593505859);
INSERT INTO public2.locations VALUES (86, 'bernador Udaondo', 6, -35.30267333984375, -58.595977783203125);
INSERT INTO public2.locations VALUES (87, 'Santa Rosa', 6, -34.960845947265625, -58.728763580322266);
INSERT INTO public2.locations VALUES (88, 'Uribelarrea', 6, -35.123828887939453, -58.892036437988281);
INSERT INTO public2.locations VALUES (89, 'Vicente Casares', 6, -34.965538024902344, -58.651840209960938);
INSERT INTO public2.locations VALUES (90, 'CapitÃ¡n Sarmiento', 6, -34.171279907226562, -59.793598175048828);
INSERT INTO public2.locations VALUES (91, 'La Luisa', 6, -34.129566192626953, -59.926418304443359);
INSERT INTO public2.locations VALUES (92, 'Bellocq', 6, -35.916618347167969, -61.534114837646484);
INSERT INTO public2.locations VALUES (93, 'Cadret', 6, -35.771549224853516, -61.335777282714844);
INSERT INTO public2.locations VALUES (94, 'Carlos Casares', 6, -35.622474670410156, -61.365493774414062);
INSERT INTO public2.locations VALUES (95, 'Colonia Mauricio', 6, -35.524440765380859, -61.437091827392578);
INSERT INTO public2.locations VALUES (96, 'Hortensia', 6, -35.924232482910156, -61.262851715087891);
INSERT INTO public2.locations VALUES (97, 'La SofÃ­a', 6, -35.699359893798828, -61.169437408447266);
INSERT INTO public2.locations VALUES (98, 'Mauricio Hirsch', 6, -35.581573486328125, -61.526836395263672);
INSERT INTO public2.locations VALUES (99, 'Moctezuma', 6, -35.477947235107422, -61.495765686035156);
INSERT INTO public2.locations VALUES (100, 'Ordoqui', 6, -35.880569458007812, -61.160163879394531);
INSERT INTO public2.locations VALUES (101, 'Smith', 6, -35.495368957519531, -61.592521667480469);
INSERT INTO public2.locations VALUES (102, 'Carlos Tejedor', 6, -35.391487121582031, -62.419952392578125);
INSERT INTO public2.locations VALUES (103, 'Colonia SerÃ©', 6, -35.436470031738281, -62.727928161621094);
INSERT INTO public2.locations VALUES (104, 'CurarÃº', 6, -35.640914916992188, -62.1947021484375);
INSERT INTO public2.locations VALUES (105, 'Timote', 6, -35.3475456237793, -62.222942352294922);
INSERT INTO public2.locations VALUES (106, 'Tres Algarrobos', 6, -35.195594787597656, -62.774410247802734);
INSERT INTO public2.locations VALUES (107, 'Carmen de Areco', 6, -34.376663208007812, -59.822696685791016);
INSERT INTO public2.locations VALUES (108, 'Pueblo uin', 6, -34.493556976318359, -59.801353454589844);
INSERT INTO public2.locations VALUES (109, 'Tres Sargentos', 6, -34.4665641784668, -59.99945068359375);
INSERT INTO public2.locations VALUES (110, 'Castelli', 6, -36.090919494628906, -57.807479858398438);
INSERT INTO public2.locations VALUES (111, 'Centro Guerrero', 6, -36.055469512939453, -57.821094512939453);
INSERT INTO public2.locations VALUES (112, 'Cerro de la Gloria', 6, -35.974861145019531, -57.449535369873047);
INSERT INTO public2.locations VALUES (113, 'ColÃ³n', 6, -33.897125244140625, -61.099414825439453);
INSERT INTO public2.locations VALUES (114, 'Villa Manuel Pomar', 6, -33.913364410400391, -60.942329406738281);
INSERT INTO public2.locations VALUES (115, 'Pearson', 6, -33.653289794921875, -60.893058776855469);
INSERT INTO public2.locations VALUES (116, 'Sarasa', 6, -34.048095703125, -61.201725006103516);
INSERT INTO public2.locations VALUES (117, 'Bajo Hondo', 6, -38.762798309326172, -61.920513153076172);
INSERT INTO public2.locations VALUES (118, 'Balneario Pehuen Co', 6, -38.999893188476562, -61.553665161132812);
INSERT INTO public2.locations VALUES (119, 'Punta Alta', 6, -38.880458831787109, -62.074996948242188);
INSERT INTO public2.locations VALUES (120, 'Villa General Arias', 6, -38.809520721435547, -62.101001739501953);
INSERT INTO public2.locations VALUES (121, 'Aparicio', 6, -38.621070861816406, -60.882816314697266);
INSERT INTO public2.locations VALUES (122, 'Marisol', 6, -38.920513153076172, -60.534992218017578);
INSERT INTO public2.locations VALUES (123, 'Coronel Dorre', 6, -38.718799591064453, -61.288360595703125);
INSERT INTO public2.locations VALUES (124, 'El Perdido', 6, -38.677261352539062, -61.086177825927734);
INSERT INTO public2.locations VALUES (125, 'Faro', 6, -38.796524047851562, -61.070388793945312);
INSERT INTO public2.locations VALUES (126, 'Irene', 6, -38.5545768737793, -60.696296691894531);
INSERT INTO public2.locations VALUES (127, 'Oriente', 6, -38.744400024414062, -60.6093635559082);
INSERT INTO public2.locations VALUES (128, 'San RomÃ¡n', 6, -38.7418098449707, -61.538280487060547);
INSERT INTO public2.locations VALUES (129, 'Coronel Pringles', 6, -37.985668182373047, -61.350399017333984);
INSERT INTO public2.locations VALUES (130, 'El Divisorio', 6, -38.323280334472656, -61.44427490234375);
INSERT INTO public2.locations VALUES (131, 'El Pensamiento', 6, -38.216476440429688, -61.314888000488281);
INSERT INTO public2.locations VALUES (132, 'Indio Rico', 6, -38.3304443359375, -60.8852424621582);
INSERT INTO public2.locations VALUES (133, 'Lartigau', 6, -38.447208404541016, -61.566886901855469);
INSERT INTO public2.locations VALUES (134, 'Cascada', 6, -37.292499542236328, -62.297195434570312);
INSERT INTO public2.locations VALUES (135, 'Coronel SuÃ¡rez', 6, -37.458530426025391, -61.932895660400391);
INSERT INTO public2.locations VALUES (136, 'Curamalal', 6, -37.484245300292969, -62.104557037353516);
INSERT INTO public2.locations VALUES (137, 'D''Orbigny', 6, -37.676544189453125, -61.707744598388672);
INSERT INTO public2.locations VALUES (138, 'HuanguelÃ©n', 6, -37.058876037597656, -61.932540893554688);
INSERT INTO public2.locations VALUES (139, 'Pasman', 6, -37.223640441894531, -62.164752960205078);
INSERT INTO public2.locations VALUES (140, 'San JosÃ©', 6, -37.508331298828125, -61.917549133300781);
INSERT INTO public2.locations VALUES (141, 'Santa MarÃ­a', 6, -37.558406829833984, -61.87445068359375);
INSERT INTO public2.locations VALUES (142, 'Santa Trinidad', 6, -37.487693786621094, -61.925857543945312);
INSERT INTO public2.locations VALUES (143, 'Villa La Arcadia', 6, -38.137031555175781, -61.787361145019531);
INSERT INTO public2.locations VALUES (144, 'Castilla', 6, -34.613315582275391, -59.9061279296875);
INSERT INTO public2.locations VALUES (145, 'Chacabuco', 6, -34.642024993896484, -60.471237182617188);
INSERT INTO public2.locations VALUES (146, 'Los Angeles', 6, -34.457145690917969, -60.180290222167969);
INSERT INTO public2.locations VALUES (147, 'O''Higgins', 6, -34.585548400878906, -60.699886322021484);
INSERT INTO public2.locations VALUES (148, 'Rawson', 6, -34.605083465576172, -60.066825866699219);
INSERT INTO public2.locations VALUES (149, 'ChascomÃºs', 6, -35.579143524169922, -58.013671875);
INSERT INTO public2.locations VALUES (150, 'Villa Parque Girado', 6, -35.626850128173828, -58.014629364013672);
INSERT INTO public2.locations VALUES (151, 'Chivilcoy', 6, -34.896896362304688, -60.019092559814453);
INSERT INTO public2.locations VALUES (152, 'Emilio Ayarza', 6, -34.743728637695312, -60.039100646972656);
INSERT INTO public2.locations VALUES (153, 'rostiaga', 6, -34.838798522949219, -59.866012573242188);
INSERT INTO public2.locations VALUES (154, 'La Rica', 6, -34.973091125488281, -59.861412048339844);
INSERT INTO public2.locations VALUES (155, 'MoquehuÃ¡', 6, -35.092208862304688, -59.775711059570312);
INSERT INTO public2.locations VALUES (156, 'RamÃ³n Biaus', 6, -35.087203979492188, -59.924373626708984);
INSERT INTO public2.locations VALUES (157, 'San SebastiÃ¡n', 6, -34.942977905273438, -59.7021598815918);
INSERT INTO public2.locations VALUES (158, 'Andant', 6, -36.560066223144531, -62.139019012451172);
INSERT INTO public2.locations VALUES (159, 'Arboledas', 6, -36.883152008056641, -61.487720489501953);
INSERT INTO public2.locations VALUES (160, 'Daireaux', 6, -36.599632263183594, -61.747543334960938);
INSERT INTO public2.locations VALUES (161, 'La Larga', 6, -36.675498962402344, -61.928337097167969);
INSERT INTO public2.locations VALUES (162, 'Salazar', 6, -36.307182312011719, -62.202999114990234);
INSERT INTO public2.locations VALUES (163, 'Dolores', 6, -36.315387725830078, -57.675460815429688);
INSERT INTO public2.locations VALUES (164, 'Sevigne', 6, -36.206924438476562, -57.742698669433594);
INSERT INTO public2.locations VALUES (165, 'Ensenada', 6, -34.857505798339844, -57.907680511474609);
INSERT INTO public2.locations VALUES (166, 'Escobar', 6, -34.346046447753906, -58.794414520263672);
INSERT INTO public2.locations VALUES (167, 'Esteban EcheverrÃ­a', 6, -34.819389343261719, -58.465911865234375);
INSERT INTO public2.locations VALUES (168, 'Arroyo de la Cruz', 6, -34.330215454101562, -59.113971710205078);
INSERT INTO public2.locations VALUES (169, 'Parada Orlando', 6, -34.326511383056641, -59.076747894287109);
INSERT INTO public2.locations VALUES (170, 'Parada Robles - PavÃ³n', 6, -34.375087738037109, -59.123203277587891);
INSERT INTO public2.locations VALUES (171, 'Ezeiza', 6, -34.854393005371094, -58.524757385253906);
INSERT INTO public2.locations VALUES (172, 'Florencio Varela', 6, -34.804435729980469, -58.279251098632812);
INSERT INTO public2.locations VALUES (173, 'Blaquier', 6, -34.636161804199219, -62.4777717590332);
INSERT INTO public2.locations VALUES (174, 'Florentino Ameghino', 6, -34.845371246337891, -62.467155456542969);
INSERT INTO public2.locations VALUES (175, 'Porvenir', 6, -34.950412750244141, -62.223735809326172);
INSERT INTO public2.locations VALUES (176, 'Comandante Nicanor Otamendi', 6, -38.110549926757812, -57.841243743896484);
INSERT INTO public2.locations VALUES (177, 'Mar del Sur', 6, -38.343654632568359, -57.992210388183594);
INSERT INTO public2.locations VALUES (178, 'MechonguÃ©', 6, -38.146221160888672, -58.229244232177734);
INSERT INTO public2.locations VALUES (179, 'Miramar', 6, -38.270462036132812, -57.8398551940918);
INSERT INTO public2.locations VALUES (180, 'General Alvear', 6, -36.021743774414062, -60.014503479003906);
INSERT INTO public2.locations VALUES (181, 'ArribeÃ±os', 6, -34.208393096923828, -61.355243682861328);
INSERT INTO public2.locations VALUES (182, 'AscensiÃ³n', 6, -34.230953216552734, -61.103221893310547);
INSERT INTO public2.locations VALUES (183, 'EstaciÃ³n Arenales', 6, -34.2708854675293, -61.293621063232422);
INSERT INTO public2.locations VALUES (184, 'FerrÃ©', 6, -34.122577667236328, -61.133384704589844);
INSERT INTO public2.locations VALUES (185, 'General Arenales', 6, -34.303325653076172, -61.307033538818359);
INSERT INTO public2.locations VALUES (186, 'La Angelita', 6, -34.261795043945312, -60.966106414794922);
INSERT INTO public2.locations VALUES (187, 'La Trinidad', 6, -34.107002258300781, -61.13275146484375);
INSERT INTO public2.locations VALUES (188, 'General Belgrano', 6, -35.765674591064453, -58.497161865234375);
INSERT INTO public2.locations VALUES (189, 'rchs', 6, -35.672069549560547, -58.958412170410156);
INSERT INTO public2.locations VALUES (190, 'General Guido', 6, -36.643165588378906, -57.790500640869141);
INSERT INTO public2.locations VALUES (191, 'LabardÃ©n', 6, -36.948966979980469, -58.103569030761719);
INSERT INTO public2.locations VALUES (192, 'General Juan Madariaga', 6, -36.995292663574219, -57.136859893798828);
INSERT INTO public2.locations VALUES (193, 'General La Madrid', 6, -37.249668121337891, -61.262199401855469);
INSERT INTO public2.locations VALUES (194, 'La Colina', 6, -37.3593864440918, -61.535743713378906);
INSERT INTO public2.locations VALUES (195, 'Las Martinetas', 6, -37.199199676513672, -61.122550964355469);
INSERT INTO public2.locations VALUES (196, 'LÃ­bano', 6, -37.532154083251953, -61.2852668762207);
INSERT INTO public2.locations VALUES (197, 'Pontaut', 6, -37.73175048828125, -61.3236083984375);
INSERT INTO public2.locations VALUES (198, 'General Hornos', 6, -34.892314910888672, -58.918464660644531);
INSERT INTO public2.locations VALUES (199, 'General Las Heras', 6, -34.926910400390625, -58.946708679199219);
INSERT INTO public2.locations VALUES (200, 'La Choza', 6, -34.7828483581543, -59.109653472900391);
INSERT INTO public2.locations VALUES (201, 'Plomer', 6, -34.794570922851562, -59.031162261962891);
INSERT INTO public2.locations VALUES (202, 'General Lavalle', 6, -36.408084869384766, -56.943359375);
INSERT INTO public2.locations VALUES (203, 'Barrio RÃ­o Salado', 6, -35.694038391113281, -58.448642730712891);
INSERT INTO public2.locations VALUES (204, 'Loma Verde', 6, -35.274009704589844, -58.403827667236328);
INSERT INTO public2.locations VALUES (205, 'Ranchos', 6, -35.516407012939453, -58.318817138671875);
INSERT INTO public2.locations VALUES (206, 'Villanueva', 6, -35.6753044128418, -58.433879852294922);
INSERT INTO public2.locations VALUES (207, 'Colonia San Ricardo', 6, -34.416282653808594, -61.929233551025391);
INSERT INTO public2.locations VALUES (208, 'General Pinto', 6, -34.764331817626953, -61.891628265380859);
INSERT INTO public2.locations VALUES (209, 'Germania', 6, -34.577041625976562, -62.047836303710938);
INSERT INTO public2.locations VALUES (210, 'Villa Francia', 6, -34.790122985839844, -62.201023101806641);
INSERT INTO public2.locations VALUES (211, 'Villa Roth', 6, -34.579586029052734, -62.171337127685547);
INSERT INTO public2.locations VALUES (212, 'Barrio Santa Paula', 6, -37.9305419921875, -57.683639526367188);
INSERT INTO public2.locations VALUES (213, 'BatÃ¡n', 6, -38.007762908935547, -57.710502624511719);
INSERT INTO public2.locations VALUES (214, 'Chapadmalal', 6, -38.170948028564453, -57.6397705078125);
INSERT INTO public2.locations VALUES (215, 'El Marquesado', 6, -38.228610992431641, -57.7544059753418);
INSERT INTO public2.locations VALUES (216, 'EstaciÃ³n Chapadmalal', 6, -38.036655426025391, -57.713504791259766);
INSERT INTO public2.locations VALUES (217, 'Mar del Plata', 6, -37.997611999511719, -57.548160552978516);
INSERT INTO public2.locations VALUES (218, 'Sierra de los Padres', 6, -37.941287994384766, -57.775363922119141);
INSERT INTO public2.locations VALUES (219, 'General RodrÃ­guez', 6, -34.606430053710938, -58.9521598815918);
INSERT INTO public2.locations VALUES (220, 'General San MartÃ­n', 6, -34.577911376953125, -58.538658142089844);
INSERT INTO public2.locations VALUES (221, 'Bairrita', 6, -34.747802734375, -60.988384246826172);
INSERT INTO public2.locations VALUES (222, 'La Delfina', 6, -34.943256378173828, -61.158660888671875);
INSERT INTO public2.locations VALUES (223, 'Los Toldos', 6, -34.999969482421875, -61.038738250732422);
INSERT INTO public2.locations VALUES (224, 'San Emilio', 6, -35.0304069519043, -60.866073608398438);
INSERT INTO public2.locations VALUES (225, 'ZavalÃ­a', 6, -34.895084381103516, -61.005615234375);
INSERT INTO public2.locations VALUES (226, 'BanderalÃ³', 6, -35.014869689941406, -63.375961303710938);
INSERT INTO public2.locations VALUES (227, 'CaÃ±ada Seca', 6, -34.416816711425781, -62.960834503173828);
INSERT INTO public2.locations VALUES (228, 'Coronel Charlone', 6, -34.674015045166016, -63.369403839111328);
INSERT INTO public2.locations VALUES (229, 'Emilio V. Bunge', 6, -34.783512115478516, -63.195652008056641);
INSERT INTO public2.locations VALUES (230, 'General Villegas', 6, -35.032634735107422, -63.0150260925293);
INSERT INTO public2.locations VALUES (231, 'Massey', 6, -35.048965454101562, -63.122211456298828);
INSERT INTO public2.locations VALUES (232, 'Pichincha', 6, -34.579196929931641, -62.351631164550781);
INSERT INTO public2.locations VALUES (233, 'Piedritas', 6, -34.767215728759766, -62.985919952392578);
INSERT INTO public2.locations VALUES (234, 'Santa Eleodora', 6, -34.694507598876953, -62.695579528808594);
INSERT INTO public2.locations VALUES (235, 'Santa Regina', 6, -34.549560546875, -63.17333984375);
INSERT INTO public2.locations VALUES (236, 'Villa Saboya', 6, -34.4599723815918, -62.649272918701172);
INSERT INTO public2.locations VALUES (237, 'Villa Sauze', 6, -35.285858154296875, -63.36865234375);
INSERT INTO public2.locations VALUES (238, 'Arroyo Venado', 6, -37.082157135009766, -62.540309906005859);
INSERT INTO public2.locations VALUES (239, 'Casbas', 6, -36.7577018737793, -62.5043830871582);
INSERT INTO public2.locations VALUES (240, 'GarrÃ©', 6, -36.561897277832031, -62.604408264160156);
INSERT INTO public2.locations VALUES (241, 'GuaminÃ­', 6, -37.010921478271484, -62.422248840332031);
INSERT INTO public2.locations VALUES (242, 'Laguna Alsina', 6, -36.807563781738281, -62.247966766357422);
INSERT INTO public2.locations VALUES (243, 'Henderson', 6, -36.298175811767578, -61.718563079833984);
INSERT INTO public2.locations VALUES (244, 'Herrera Vegas', 6, -36.087558746337891, -61.4109001159668);
INSERT INTO public2.locations VALUES (245, 'Hurlingham', 6, -34.589870452880859, -58.6374397277832);
INSERT INTO public2.locations VALUES (246, 'ItuzaingÃ³', 6, -34.6603889465332, -58.666168212890625);
INSERT INTO public2.locations VALUES (247, 'JosÃ© C. Paz', 6, -34.523193359375, -58.7519416809082);
INSERT INTO public2.locations VALUES (248, 'AgustÃ­n Roca', 6, -34.507255554199219, -60.864898681640625);
INSERT INTO public2.locations VALUES (249, 'Agustina', 6, -34.457839965820312, -61.066497802734375);
INSERT INTO public2.locations VALUES (250, 'Balneario Laguna de GÃ³mez', 6, -34.660896301269531, -61.018684387207031);
INSERT INTO public2.locations VALUES (251, 'FortÃ­n Tiburcio', 6, -34.344535827636719, -61.128501892089844);
INSERT INTO public2.locations VALUES (252, 'JunÃ­n', 6, -34.593940734863281, -60.946430206298828);
INSERT INTO public2.locations VALUES (253, 'Laplacette', 6, -34.723129272460938, -61.158267974853516);
INSERT INTO public2.locations VALUES (254, 'Saforcada', 6, -34.572826385498047, -61.0742073059082);
INSERT INTO public2.locations VALUES (255, 'Las Toninas', 6, -36.48834228515625, -56.704971313476562);
INSERT INTO public2.locations VALUES (256, 'Mar de AjÃ³ - San Bernardo', 6, -36.6971321105957, -56.681118011474609);
INSERT INTO public2.locations VALUES (257, 'San Clemente del TuyÃº', 6, -36.354194641113281, -56.725677490234375);
INSERT INTO public2.locations VALUES (258, 'Santa Teresita - Mar del TuyÃº', 6, -36.5814208984375, -56.689899444580078);
INSERT INTO public2.locations VALUES (259, 'La Matanza', 6, -34.677608489990234, -58.561008453369141);
INSERT INTO public2.locations VALUES (260, 'LanÃºs', 6, -34.707553863525391, -58.391128540039062);
INSERT INTO public2.locations VALUES (261, 'La Plata', 6, -34.921352386474609, -57.954502105712891);
INSERT INTO public2.locations VALUES (262, 'Laprida', 6, -37.544227600097656, -60.801029205322266);
INSERT INTO public2.locations VALUES (263, 'Pueblo Nuevo', 6, -37.523700714111328, -60.774082183837891);
INSERT INTO public2.locations VALUES (264, 'Pueblo San Jorge', 6, -37.228862762451172, -60.961040496826172);
INSERT INTO public2.locations VALUES (265, 'Coronel Boerr', 6, -35.940460205078125, -59.068088531494141);
INSERT INTO public2.locations VALUES (266, 'El Tri', 6, -35.880275726318359, -59.406070709228516);
INSERT INTO public2.locations VALUES (267, 'Las Flores', 6, -36.014266967773438, -59.0998649597168);
INSERT INTO public2.locations VALUES (268, 'Pardo', 6, -36.245040893554688, -59.365036010742188);
INSERT INTO public2.locations VALUES (269, 'Alberdi Viejo', 6, -34.439712524414062, -61.846572875976562);
INSERT INTO public2.locations VALUES (270, 'El Dorado', 6, -34.652862548828125, -61.582908630371094);
INSERT INTO public2.locations VALUES (271, 'FortÃ­n Acha', 6, -34.342350006103516, -61.515178680419922);
INSERT INTO public2.locations VALUES (272, 'Juan Bautista Alberdi', 6, -34.438514709472656, -61.812091827392578);
INSERT INTO public2.locations VALUES (273, 'Leandro N. Alem', 6, -34.519573211669922, -61.3912239074707);
INSERT INTO public2.locations VALUES (274, 'Vedia', 6, -34.497905731201172, -61.542308807373047);
INSERT INTO public2.locations VALUES (275, 'Manuel J. Cobo', 6, -35.87286376953125, -57.8969841003418);
INSERT INTO public2.locations VALUES (276, 'Arenaza', 6, -34.985019683837891, -61.774322509765625);
INSERT INTO public2.locations VALUES (277, 'Bayauca', 6, -34.867469787597656, -61.287288665771484);
INSERT INTO public2.locations VALUES (278, 'BermÃºdez', 6, -34.694622039794922, -61.328685760498047);
INSERT INTO public2.locations VALUES (279, 'Carlos Salas', 6, -35.392337799072266, -61.992630004882812);
INSERT INTO public2.locations VALUES (280, 'Coronel MartÃ­nez de Hoz', 6, -35.330757141113281, -61.614303588867188);
INSERT INTO public2.locations VALUES (281, 'El Triunfo', 6, -35.089828491210938, -61.518825531005859);
INSERT INTO public2.locations VALUES (282, 'Las Toscas', 6, -35.364582061767578, -61.805549621582031);
INSERT INTO public2.locations VALUES (283, 'Lincoln', 6, -34.8681755065918, -61.529411315917969);
INSERT INTO public2.locations VALUES (284, 'Pasteur', 6, -35.141357421875, -62.244159698486328);
INSERT INTO public2.locations VALUES (285, 'Roberts', 6, -35.142913818359375, -61.970439910888672);
INSERT INTO public2.locations VALUES (286, 'Triunvirato', 6, -34.675773620605469, -61.464992523193359);
INSERT INTO public2.locations VALUES (287, 'Arenas Verdes', 6, -38.545070648193359, -58.557353973388672);
INSERT INTO public2.locations VALUES (288, 'Licenciado Matienzo', 6, -37.908512115478516, -58.912555694580078);
INSERT INTO public2.locations VALUES (289, 'LoberÃ­a', 6, -38.163383483886719, -58.781845092773438);
INSERT INTO public2.locations VALUES (290, 'Pieres', 6, -38.394115447998047, -58.6723747253418);
INSERT INTO public2.locations VALUES (291, 'San Manuel', 6, -37.7864875793457, -58.848487854003906);
INSERT INTO public2.locations VALUES (292, 'TamangueyÃº', 6, -38.201992034912109, -58.7391471862793);
INSERT INTO public2.locations VALUES (293, 'Antonio Carboni', 6, -35.201045989990234, -59.34539794921875);
INSERT INTO public2.locations VALUES (294, 'Elvira', 6, -35.242752075195312, -59.485652923583984);
INSERT INTO public2.locations VALUES (295, 'Laguna de Lobos', 6, -35.273780822753906, -59.135063171386719);
INSERT INTO public2.locations VALUES (296, 'Lobos', 6, -35.1854248046875, -59.097835540771484);
INSERT INTO public2.locations VALUES (297, 'Salvador MarÃ­a', 6, -35.3006706237793, -59.170135498046875);
INSERT INTO public2.locations VALUES (298, 'Lomas de Zamora', 6, -34.757282257080078, -58.402717590332031);
INSERT INTO public2.locations VALUES (299, 'Carlos Keen', 6, -34.486751556396484, -59.219547271728516);
INSERT INTO public2.locations VALUES (300, 'LujÃ¡n', 6, -34.563358306884766, -59.121116638183594);
INSERT INTO public2.locations VALUES (301, 'Olivera', 6, -34.627895355224609, -59.255199432373047);
INSERT INTO public2.locations VALUES (302, 'Torres', 6, -34.430992126464844, -59.127864837646484);
INSERT INTO public2.locations VALUES (303, 'Atalaya', 6, -35.024295806884766, -57.535488128662109);
INSERT INTO public2.locations VALUES (304, 'General Mansilla', 6, -35.0797233581543, -57.74688720703125);
INSERT INTO public2.locations VALUES (305, 'Los Naranjos', 6, -34.995098114013672, -57.702846527099609);
INSERT INTO public2.locations VALUES (306, 'Magdalena', 6, -35.080738067626953, -57.517601013183594);
INSERT INTO public2.locations VALUES (307, 'Roberto J. PayrÃ³', 6, -35.181056976318359, -57.653545379638672);
INSERT INTO public2.locations VALUES (308, 'Vieytes', 6, -35.267463684082031, -57.574920654296875);
INSERT INTO public2.locations VALUES (309, 'Las Armas', 6, -37.086334228515625, -57.829418182373047);
INSERT INTO public2.locations VALUES (310, 'MaipÃº', 6, -36.862957000732422, -57.883121490478516);
INSERT INTO public2.locations VALUES (311, 'Santo Domin', 6, -36.7115592956543, -57.586166381835938);
INSERT INTO public2.locations VALUES (312, 'Malvinas Argentinas', 6, -34.498794555664062, -58.701087951660156);
INSERT INTO public2.locations VALUES (313, 'Coronel Vidal', 6, -37.446517944335938, -57.729393005371094);
INSERT INTO public2.locations VALUES (314, 'General PirÃ¡n', 6, -37.275974273681641, -57.774196624755859);
INSERT INTO public2.locations VALUES (315, 'La ArmonÃ­a', 6, -37.77398681640625, -57.634189605712891);
INSERT INTO public2.locations VALUES (316, 'Mar Chiquita', 6, -37.745540618896484, -57.425411224365234);
INSERT INTO public2.locations VALUES (317, 'Mar de Cobo', 6, -37.773700714111328, -57.454391479492188);
INSERT INTO public2.locations VALUES (318, 'Santa Clara del Mar', 6, -37.834381103515625, -57.507492065429688);
INSERT INTO public2.locations VALUES (319, 'VivoratÃ¡', 6, -37.663154602050781, -57.668121337890625);
INSERT INTO public2.locations VALUES (320, 'Marcos Paz', 6, -34.782497406005859, -58.837890625);
INSERT INTO public2.locations VALUES (321, 'wland', 6, -34.654140472412109, -59.354759216308594);
INSERT INTO public2.locations VALUES (322, 'Mercedes', 6, -34.650733947753906, -59.431388854980469);
INSERT INTO public2.locations VALUES (323, 'Jorge Born', 6, -34.697677612304688, -59.318527221679688);
INSERT INTO public2.locations VALUES (324, 'Merlo', 6, -34.664981842041016, -58.727947235107422);
INSERT INTO public2.locations VALUES (325, 'Abbott', 6, -35.281322479248047, -58.802783966064453);
INSERT INTO public2.locations VALUES (326, 'San Miguel del Monte', 6, -35.441043853759766, -58.803451538085938);
INSERT INTO public2.locations VALUES (327, 'ZenÃ³n Videla Dorna', 6, -35.542083740234375, -58.886451721191406);
INSERT INTO public2.locations VALUES (328, 'Balneario Sauce Grande', 6, -38.9937629699707, -61.208011627197266);
INSERT INTO public2.locations VALUES (329, 'Monte Hermoso', 6, -38.986663818359375, -61.290927886962891);
INSERT INTO public2.locations VALUES (330, 'Moreno', 6, -34.651290893554688, -58.790000915527344);
INSERT INTO public2.locations VALUES (331, 'MorÃ³n', 6, -34.651058197021484, -58.621852874755859);
INSERT INTO public2.locations VALUES (332, 'JosÃ© Juan Almeyra', 6, -34.921585083007812, -59.542228698730469);
INSERT INTO public2.locations VALUES (333, 'Las Marianas', 6, -35.052940368652344, -59.512702941894531);
INSERT INTO public2.locations VALUES (334, 'Navarro', 6, -35.005905151367188, -59.278282165527344);
INSERT INTO public2.locations VALUES (335, 'Villa Moll', 6, -35.077949523925781, -59.651870727539062);
INSERT INTO public2.locations VALUES (336, 'Claraz', 6, -37.893428802490234, -59.291069030761719);
INSERT INTO public2.locations VALUES (337, 'Juan N. FernÃ¡ndez', 6, -38.005523681640625, -59.263923645019531);
INSERT INTO public2.locations VALUES (338, 'Necochea - QuequÃ©n', 6, -38.554458618164062, -58.739234924316406);
INSERT INTO public2.locations VALUES (339, 'Nicanor Olivera', 6, -38.283050537109375, -59.202743530273438);
INSERT INTO public2.locations VALUES (340, 'RamÃ³n Santamarina', 6, -38.449127197265625, -59.330509185791016);
INSERT INTO public2.locations VALUES (341, 'Alfredo Demarchi', 6, -35.292354583740234, -61.405803680419922);
INSERT INTO public2.locations VALUES (342, 'Carlos MarÃ­a NaÃ³n', 6, -35.237152099609375, -60.823280334472656);
INSERT INTO public2.locations VALUES (343, '12 de Octubre', 6, -35.605167388916016, -60.919147491455078);
INSERT INTO public2.locations VALUES (344, 'Dudignac', 6, -35.6502685546875, -60.709499359130859);
INSERT INTO public2.locations VALUES (345, 'La Aurora', 6, -35.408706665039062, -61.207805633544922);
INSERT INTO public2.locations VALUES (346, 'Manuel B. nnet', 6, -35.517997741699219, -61.001293182373047);
INSERT INTO public2.locations VALUES (347, 'Marcelino Ugarte', 6, -35.351619720458984, -60.745071411132812);
INSERT INTO public2.locations VALUES (348, 'Morea', 6, -35.554542541503906, -60.562026977539062);
INSERT INTO public2.locations VALUES (349, 'Norumbega', 6, -35.535118103027344, -60.794391632080078);
INSERT INTO public2.locations VALUES (350, '9 de Julio', 6, -35.443935394287109, -60.884628295898438);
INSERT INTO public2.locations VALUES (351, 'Patricios', 6, -35.441219329833984, -60.716548919677734);
INSERT INTO public2.locations VALUES (352, 'Villa Fournier', 6, -35.498920440673828, -60.874961853027344);
INSERT INTO public2.locations VALUES (353, 'Colonia San Miguel', 6, -36.948753356933594, -60.111442565917969);
INSERT INTO public2.locations VALUES (354, 'Espigas', 6, -36.412960052490234, -60.673149108886719);
INSERT INTO public2.locations VALUES (355, 'Hinojo', 6, -36.8658447265625, -60.160282135009766);
INSERT INTO public2.locations VALUES (356, 'OlavarrÃ­a', 6, -36.893840789794922, -60.323192596435547);
INSERT INTO public2.locations VALUES (357, 'Recalde', 6, -36.651786804199219, -61.085906982421875);
INSERT INTO public2.locations VALUES (358, 'Santa Luisa', 6, -37.125659942626953, -60.416450500488281);
INSERT INTO public2.locations VALUES (359, 'Sierra Chica', 6, -36.844882965087891, -60.226753234863281);
INSERT INTO public2.locations VALUES (360, 'Sierras Bayas', 6, -36.936611175537109, -60.156059265136719);
INSERT INTO public2.locations VALUES (361, 'Villa Alfredo Fortabat', 6, -36.981006622314453, -60.278602600097656);
INSERT INTO public2.locations VALUES (362, 'Villa La SerranÃ­a', 6, -36.989280700683594, -60.3112907409668);
INSERT INTO public2.locations VALUES (363, 'BahÃ­a San Blas', 6, -40.554649353027344, -62.236763000488281);
INSERT INTO public2.locations VALUES (364, 'Cardenal Cagliero', 6, -40.650154113769531, -62.7556266784668);
INSERT INTO public2.locations VALUES (365, 'Carmen de Patanes', 6, -40.802516937255859, -62.983600616455078);
INSERT INTO public2.locations VALUES (366, 'JosÃ© B. Casas', 6, -40.435321807861328, -62.544124603271484);
INSERT INTO public2.locations VALUES (367, 'Juan A. Pradere', 6, -39.602451324462891, -62.652793884277344);
INSERT INTO public2.locations VALUES (368, 'Stroeder', 6, -40.185829162597656, -62.620246887207031);
INSERT INTO public2.locations VALUES (369, 'Villalonga', 6, -39.917575836181641, -62.618770599365234);
INSERT INTO public2.locations VALUES (370, 'CapitÃ¡n Castro', 6, -35.912406921386719, -62.224227905273438);
INSERT INTO public2.locations VALUES (371, 'San Esteban', 6, -35.731513977050781, -61.742240905761719);
INSERT INTO public2.locations VALUES (372, 'Francisco Madero', 6, -35.849399566650391, -62.066646575927734);
INSERT INTO public2.locations VALUES (373, 'Juan JosÃ© Paso', 6, -35.849369049072266, -62.294715881347656);
INSERT INTO public2.locations VALUES (374, 'Magdala', 6, -36.084476470947266, -61.722328186035156);
INSERT INTO public2.locations VALUES (375, 'Mones CazÃ³n', 6, -36.227748870849609, -62.006736755371094);
INSERT INTO public2.locations VALUES (376, 'Nueva Plata', 6, -35.918647766113281, -61.813549041748047);
INSERT INTO public2.locations VALUES (377, 'PehuajÃ³', 6, -35.810806274414062, -61.898967742919922);
INSERT INTO public2.locations VALUES (378, 'San Bernardo', 6, -35.714920043945312, -61.649967193603516);
INSERT INTO public2.locations VALUES (379, 'Bocayuva', 6, -36.206100463867188, -63.077533721923828);
INSERT INTO public2.locations VALUES (380, 'De Bary', 6, -36.340503692626953, -63.259674072265625);
INSERT INTO public2.locations VALUES (381, 'Pellegrini', 6, -36.267913818359375, -63.164722442626953);
INSERT INTO public2.locations VALUES (382, 'Acevedo', 6, -33.755039215087891, -60.439960479736328);
INSERT INTO public2.locations VALUES (383, 'Fontezuela', 6, -33.912063598632812, -60.460033416748047);
INSERT INTO public2.locations VALUES (384, 'Guerrico', 6, -33.676128387451172, -60.400165557861328);
INSERT INTO public2.locations VALUES (385, 'Juan A. de la PeÃ±a', 6, -33.831382751464844, -60.487968444824219);
INSERT INTO public2.locations VALUES (386, 'Juan Anchorena', 6, -33.924308776855469, -60.382839202880859);
INSERT INTO public2.locations VALUES (387, 'La Violeta', 6, -33.733062744140625, -60.168510437011719);
INSERT INTO public2.locations VALUES (388, 'Manuel Ocampo', 6, -33.764995574951172, -60.651035308837891);
INSERT INTO public2.locations VALUES (389, 'Mariano BenÃ­tez', 6, -33.707847595214844, -60.583423614501953);
INSERT INTO public2.locations VALUES (390, 'Mariano H. Alfonzo', 6, -33.913509368896484, -60.837123870849609);
INSERT INTO public2.locations VALUES (391, 'Pergamino', 6, -33.891109466552734, -60.5745849609375);
INSERT INTO public2.locations VALUES (392, 'PinzÃ³n', 6, -33.9932861328125, -60.730663299560547);
INSERT INTO public2.locations VALUES (393, 'Rancagua', 6, -34.029792785644531, -60.502815246582031);
INSERT INTO public2.locations VALUES (394, 'Villa AngÃ©lica', 6, -33.663700103759766, -60.708580017089844);
INSERT INTO public2.locations VALUES (395, 'Villa San JosÃ©', 6, -34.091667175292969, -60.413505554199219);
INSERT INTO public2.locations VALUES (396, 'Casalins', 6, -36.316360473632812, -58.551429748535156);
INSERT INTO public2.locations VALUES (397, 'Pila', 6, -36.004184722900391, -58.141067504882812);
INSERT INTO public2.locations VALUES (398, 'Pilar', 6, -34.458698272705078, -58.913967132568359);
INSERT INTO public2.locations VALUES (399, 'Pinamar', 6, -37.111080169677734, -56.865234375);
INSERT INTO public2.locations VALUES (400, 'Presidente PerÃ³n', 6, -34.917770385742188, -58.379299163818359);
INSERT INTO public2.locations VALUES (401, 'Azopardo', 6, -37.704216003417969, -62.901287078857422);
INSERT INTO public2.locations VALUES (402, 'Bordenave', 6, -37.805515289306641, -63.043373107910156);
INSERT INTO public2.locations VALUES (403, 'Darregueira', 6, -37.689453125, -63.161026000976562);
INSERT INTO public2.locations VALUES (404, '17 de Asto', 6, -37.909751892089844, -62.935638427734375);
INSERT INTO public2.locations VALUES (405, 'Estela', 6, -38.109916687011719, -62.9147834777832);
INSERT INTO public2.locations VALUES (406, 'Felipe SolÃ¡', 6, -38.009239196777344, -62.822422027587891);
INSERT INTO public2.locations VALUES (407, 'LÃ³pez Lecube', 6, -38.1194953918457, -62.7262077331543);
INSERT INTO public2.locations VALUES (408, 'PuÃ¡n', 6, -37.548095703125, -62.768337249755859);
INSERT INTO public2.locations VALUES (409, 'San GermÃ¡n', 6, -38.3017578125, -62.981285095214844);
INSERT INTO public2.locations VALUES (410, 'Villa Castelar', 6, -37.394920349121094, -62.803443908691406);
INSERT INTO public2.locations VALUES (411, 'Villa Iris', 6, -38.1717529296875, -63.235343933105469);
INSERT INTO public2.locations VALUES (412, 'Alvarez Jonte', 6, -35.321735382080078, -57.453964233398438);
INSERT INTO public2.locations VALUES (413, 'Pipinas', 6, -35.530197143554688, -57.328323364257812);
INSERT INTO public2.locations VALUES (414, 'Punta Indio', 6, -35.268562316894531, -57.247470855712891);
INSERT INTO public2.locations VALUES (415, 'VerÃ³nica', 6, -35.387409210205078, -57.338172912597656);
INSERT INTO public2.locations VALUES (416, 'Quilmes', 6, -34.718856811523438, -58.2603645324707);
INSERT INTO public2.locations VALUES (417, 'El ParaÃ­so', 6, -33.5704231262207, -59.97802734375);
INSERT INTO public2.locations VALUES (418, 'Las Bahamas', 6, -33.637676239013672, -59.988853454589844);
INSERT INTO public2.locations VALUES (419, 'PÃ©rez MillÃ¡n', 6, -33.770195007324219, -60.093742370605469);
INSERT INTO public2.locations VALUES (420, 'Ramallo', 6, -33.485202789306641, -60.004440307617188);
INSERT INTO public2.locations VALUES (421, 'Villa General Savio', 6, -33.435977935791016, -60.146450042724609);
INSERT INTO public2.locations VALUES (422, 'Villa Ramallo', 6, -33.498031616210938, -60.0655517578125);
INSERT INTO public2.locations VALUES (423, 'Rauch', 6, -36.7744140625, -59.088287353515625);
INSERT INTO public2.locations VALUES (424, 'AmÃ©rica', 6, -35.489162445068359, -62.97589111328125);
INSERT INTO public2.locations VALUES (425, 'FortÃ­n OlavarrÃ­a', 6, -35.7026252746582, -63.0240592956543);
INSERT INTO public2.locations VALUES (426, 'nzÃ¡lez Moreno', 6, -35.5552864074707, -63.380290985107422);
INSERT INTO public2.locations VALUES (427, 'Mira Pampa', 6, -35.870193481445312, -63.373672485351562);
INSERT INTO public2.locations VALUES (428, 'Roosevelt', 6, -35.846900939941406, -63.29095458984375);
INSERT INTO public2.locations VALUES (429, 'San Mauricio', 6, -35.510772705078125, -63.188285827636719);
INSERT INTO public2.locations VALUES (430, 'Sansinena', 6, -35.274391174316406, -63.214324951171875);
INSERT INTO public2.locations VALUES (431, 'Sundblad', 6, -35.764549255371094, -63.140209197998047);
INSERT INTO public2.locations VALUES (432, 'La Beba', 6, -34.154140472412109, -61.011283874511719);
INSERT INTO public2.locations VALUES (433, 'Las Carabelas', 6, -34.036872863769531, -60.867622375488281);
INSERT INTO public2.locations VALUES (434, 'Los Indios', 6, -34.3718147277832, -60.654075622558594);
INSERT INTO public2.locations VALUES (435, 'Rafael Obligado', 6, -34.359645843505859, -60.783790588378906);
INSERT INTO public2.locations VALUES (436, 'Roberto Cano', 6, -34.087718963623047, -60.667678833007812);
INSERT INTO public2.locations VALUES (437, 'Rojas', 6, -34.1977424621582, -60.733699798583984);
INSERT INTO public2.locations VALUES (438, 'Sol de Mayo', 6, -34.268970489501953, -60.872257232666016);
INSERT INTO public2.locations VALUES (439, 'Villa Manuel Pomar', 6, -33.915451049804688, -60.9383430480957);
INSERT INTO public2.locations VALUES (440, 'Carlos Beguerie', 6, -35.485637664794922, -59.099769592285156);
INSERT INTO public2.locations VALUES (441, 'Roque PÃ©rez', 6, -35.400577545166016, -59.334831237792969);
INSERT INTO public2.locations VALUES (442, 'Arroyo Corto', 6, -37.5148811340332, -62.312248229980469);
INSERT INTO public2.locations VALUES (443, 'Colonia San MartÃ­n', 6, -37.976863861083984, -62.332485198974609);
INSERT INTO public2.locations VALUES (444, 'Dufaur', 6, -37.94281005859375, -62.283088684082031);
INSERT INTO public2.locations VALUES (445, 'Espartillar', 6, -37.361125946044922, -62.4338493347168);
INSERT INTO public2.locations VALUES (446, 'yena', 6, -37.721019744873047, -62.606452941894531);
INSERT INTO public2.locations VALUES (447, 'PigÃ¼Ã©', 6, -37.6025505065918, -62.408363342285156);
INSERT INTO public2.locations VALUES (448, 'Saavedra', 6, -37.761375427246094, -62.348640441894531);
INSERT INTO public2.locations VALUES (449, 'Ãlvarez de Toledo', 6, -35.639373779296875, -59.631141662597656);
INSERT INTO public2.locations VALUES (450, 'CazÃ³n', 6, -35.577098846435547, -59.661949157714844);
INSERT INTO public2.locations VALUES (451, 'Del Carril', 6, -35.508018493652344, -59.513717651367188);
INSERT INTO public2.locations VALUES (452, 'Polvaredas', 6, -35.594554901123047, -59.506965637207031);
INSERT INTO public2.locations VALUES (453, 'Arroyo Dulce', 6, -34.101387023925781, -60.408779144287109);
INSERT INTO public2.locations VALUES (454, 'Berdier', 6, -34.397933959960938, -60.259571075439453);
INSERT INTO public2.locations VALUES (455, 'Gahan', 6, -34.338233947753906, -60.101215362548828);
INSERT INTO public2.locations VALUES (456, 'InÃ©s Indart', 6, -34.396293640136719, -60.536849975585938);
INSERT INTO public2.locations VALUES (457, 'La Invencible', 6, -34.267017364501953, -60.38580322265625);
INSERT INTO public2.locations VALUES (458, 'Salto', 6, -34.291748046875, -60.254501342773438);
INSERT INTO public2.locations VALUES (459, 'QuenumÃ¡', 6, -36.569343566894531, -63.088111877441406);
INSERT INTO public2.locations VALUES (460, 'SalliquelÃ³', 6, -36.751514434814453, -62.959129333496094);
INSERT INTO public2.locations VALUES (461, 'AzcuÃ©naga', 6, -34.366546630859375, -59.375480651855469);
INSERT INTO public2.locations VALUES (462, 'CucullÃº', 6, -34.443359375, -59.360221862792969);
INSERT INTO public2.locations VALUES (463, 'Franklin', 6, -34.609115600585938, -59.629936218261719);
INSERT INTO public2.locations VALUES (464, 'San AndrÃ©s de Giles', 6, -34.442378997802734, -59.447517395019531);
INSERT INTO public2.locations VALUES (465, 'SolÃ­s', 6, -34.298042297363281, -59.323680877685547);
INSERT INTO public2.locations VALUES (466, 'Villa Espil', 6, -34.505355834960938, -59.338340759277344);
INSERT INTO public2.locations VALUES (467, 'Villa Ruiz', 6, -34.431678771972656, -59.261550903320312);
INSERT INTO public2.locations VALUES (468, 'Duggan', 6, -34.207382202148438, -59.63702392578125);
INSERT INTO public2.locations VALUES (469, 'San Antonio de Areco', 6, -34.243637084960938, -59.473651885986328);
INSERT INTO public2.locations VALUES (470, 'Villa LÃ­a', 6, -34.123199462890625, -59.43048095703125);
INSERT INTO public2.locations VALUES (471, 'Balneario San Cayetano', 6, -38.74810791015625, -59.430469512939453);
INSERT INTO public2.locations VALUES (472, 'OchandÃ­o', 6, -38.359210968017578, -59.79327392578125);
INSERT INTO public2.locations VALUES (473, 'San Cayetano', 6, -38.345790863037109, -59.606758117675781);
INSERT INTO public2.locations VALUES (474, 'San Fernando', 6, -34.440605163574219, -58.558147430419922);
INSERT INTO public2.locations VALUES (475, 'San Isidro', 6, -34.466426849365234, -58.509689331054688);
INSERT INTO public2.locations VALUES (476, 'San Miguel', 6, -34.543041229248047, -58.711967468261719);
INSERT INTO public2.locations VALUES (477, 'Conesa', 6, -33.595802307128906, -60.355739593505859);
INSERT INTO public2.locations VALUES (478, 'Erezcano', 6, -33.523464202880859, -60.316627502441406);
INSERT INTO public2.locations VALUES (479, 'General Rojo', 6, -33.474727630615234, -60.287322998046875);
INSERT INTO public2.locations VALUES (480, 'La Emilia', 6, -33.35113525390625, -60.313804626464844);
INSERT INTO public2.locations VALUES (481, 'San NicolÃ¡s de los Arroyos', 6, -33.327579498291016, -60.217056274414062);
INSERT INTO public2.locations VALUES (482, 'Villa Esperanza', 6, -33.421382904052734, -60.2603645324707);
INSERT INTO public2.locations VALUES (483, 'bernador Castro', 6, -33.659011840820312, -59.868476867675781);
INSERT INTO public2.locations VALUES (484, 'Obligado', 6, -33.5968132019043, -59.817691802978516);
INSERT INTO public2.locations VALUES (485, 'Pueblo Doyle', 6, -33.901813507080078, -59.819004058837891);
INSERT INTO public2.locations VALUES (486, 'RÃ­o Tala', 6, -33.769290924072266, -59.639484405517578);
INSERT INTO public2.locations VALUES (487, 'San Pedro', 6, -33.675949096679688, -59.663017272949219);
INSERT INTO public2.locations VALUES (488, 'Santa LucÃ­a', 6, -33.880943298339844, -59.874202728271484);
INSERT INTO public2.locations VALUES (489, 'San Vicente', 6, -35.024909973144531, -58.424057006835938);
INSERT INTO public2.locations VALUES (490, 'General Rivas', 6, -34.608436584472656, -59.750167846679688);
INSERT INTO public2.locations VALUES (491, 'Suipacha', 6, -34.768814086914062, -59.68682861328125);
INSERT INTO public2.locations VALUES (492, 'De la Canal', 6, -37.127285003662109, -59.105381011962891);
INSERT INTO public2.locations VALUES (493, 'Gardey', 6, -37.27972412109375, -59.362869262695312);
INSERT INTO public2.locations VALUES (494, 'MarÃ­a Ignacia', 6, -37.401382446289062, -59.505928039550781);
INSERT INTO public2.locations VALUES (495, 'Tandil', 6, -37.328697204589844, -59.136898040771484);
INSERT INTO public2.locations VALUES (496, 'Crotto', 6, -36.576362609863281, -60.172199249267578);
INSERT INTO public2.locations VALUES (497, 'TapalquÃ©', 6, -36.356235504150391, -60.025112152099609);
INSERT INTO public2.locations VALUES (498, 'Velloso', 6, -36.120571136474609, -59.651870727539062);
INSERT INTO public2.locations VALUES (499, 'Tigre', 6, -34.422649383544922, -58.580875396728516);
INSERT INTO public2.locations VALUES (500, 'General Conesa', 6, -36.520858764648438, -57.3249397277832);
INSERT INTO public2.locations VALUES (501, 'ChasicÃ³', 6, -38.337333679199219, -62.644584655761719);
INSERT INTO public2.locations VALUES (502, 'Tornquist', 6, -38.101280212402344, -62.222953796386719);
INSERT INTO public2.locations VALUES (503, 'Tres Picos', 6, -38.289604187011719, -62.208057403564453);
INSERT INTO public2.locations VALUES (504, 'La Gruta', 6, -38.059726715087891, -62.0776252746582);
INSERT INTO public2.locations VALUES (505, 'Villa Ventana', 6, -38.081943511962891, -61.929805755615234);
INSERT INTO public2.locations VALUES (506, 'Berutti', 6, -35.852630615234375, -62.512378692626953);
INSERT INTO public2.locations VALUES (507, 'Girodias', 6, -36.365749359130859, -62.358081817626953);
INSERT INTO public2.locations VALUES (508, 'La Carreta', 6, -36.203731536865234, -62.2354621887207);
INSERT INTO public2.locations VALUES (509, '30 de Asto', 6, -36.278648376464844, -62.545223236083984);
INSERT INTO public2.locations VALUES (510, 'Trenque Lauquen', 6, -35.973335266113281, -62.732746124267578);
INSERT INTO public2.locations VALUES (511, 'TrongÃ©', 6, -36.463172912597656, -62.484725952148438);
INSERT INTO public2.locations VALUES (512, 'Balneario Orense', 6, -38.807441711425781, -59.737483978271484);
INSERT INTO public2.locations VALUES (513, 'ClaromecÃ³', 6, -38.857475280761719, -60.072799682617188);
INSERT INTO public2.locations VALUES (514, 'Copetonas', 6, -38.721439361572266, -60.451744079589844);
INSERT INTO public2.locations VALUES (515, 'Lin Calel', 6, -38.705619812011719, -60.245021820068359);
INSERT INTO public2.locations VALUES (516, 'Micaela Cascallares', 6, -38.494113922119141, -60.468349456787109);
INSERT INTO public2.locations VALUES (517, 'Orense', 6, -38.688274383544922, -59.780693054199219);
INSERT INTO public2.locations VALUES (518, 'Reta', 6, -38.894893646240234, -60.344856262207031);
INSERT INTO public2.locations VALUES (519, 'San Francisco de Bellocq', 6, -38.689537048339844, -60.013935089111328);
INSERT INTO public2.locations VALUES (520, 'San Mayol', 6, -38.318012237548828, -60.027622222900391);
INSERT INTO public2.locations VALUES (521, 'Tres Arroyos', 6, -38.377197265625, -60.275215148925781);
INSERT INTO public2.locations VALUES (522, 'Villa RodrÃ­guez', 6, -38.312397003173828, -60.231647491455078);
INSERT INTO public2.locations VALUES (523, 'Tres de Febrero', 6, -34.603530883789062, -58.563190460205078);
INSERT INTO public2.locations VALUES (524, 'Ingeniero Thompson', 6, -36.610923767089844, -62.912933349609375);
INSERT INTO public2.locations VALUES (525, 'Tres Lomas', 6, -36.459190368652344, -62.862575531005859);
INSERT INTO public2.locations VALUES (526, 'AgustÃ­n Mosconi', 6, -35.740318298339844, -60.557071685791016);
INSERT INTO public2.locations VALUES (527, 'Del Valle', 6, -35.8998908996582, -60.730274200439453);
INSERT INTO public2.locations VALUES (528, 'Ernestina', 6, -35.2689208984375, -59.557132720947266);
INSERT INTO public2.locations VALUES (529, 'bernador Ugarte', 6, -35.163890838623047, -60.07891845703125);
INSERT INTO public2.locations VALUES (530, 'Lucas Monteverde', 6, -35.482364654541016, -59.985836029052734);
INSERT INTO public2.locations VALUES (531, 'Norberto de la Riestra', 6, -35.273330688476562, -59.775554656982422);
INSERT INTO public2.locations VALUES (532, 'Pedernales', 6, -35.262363433837891, -59.63067626953125);
INSERT INTO public2.locations VALUES (533, 'San Enrique', 6, -35.769844055175781, -60.350448608398438);
INSERT INTO public2.locations VALUES (534, 'ValdÃ©s', 6, -35.648040771484375, -60.465675354003906);
INSERT INTO public2.locations VALUES (535, '25 de Mayo', 6, -35.432472229003906, -60.171558380126953);
INSERT INTO public2.locations VALUES (536, 'Vicente LÃ³pez', 6, -34.508945465087891, -58.486156463623047);
INSERT INTO public2.locations VALUES (537, 'Mar Azul', 6, -37.338520050048828, -57.033317565917969);
INSERT INTO public2.locations VALUES (538, 'Villa Gesell', 6, -37.263229370117188, -56.974559783935547);
INSERT INTO public2.locations VALUES (539, 'Argerich', 6, -38.770236968994141, -62.602954864501953);
INSERT INTO public2.locations VALUES (540, 'Hilario Ascasubi', 6, -39.375652313232422, -62.647369384765625);
INSERT INTO public2.locations VALUES (541, 'Juan CoustÃ©', 6, -38.894443511962891, -63.1407356262207);
INSERT INTO public2.locations VALUES (542, 'Mayor Buratovich', 6, -39.260868072509766, -62.6152458190918);
INSERT INTO public2.locations VALUES (543, 'MÃ©danos', 6, -38.829265594482422, -62.693309783935547);
INSERT INTO public2.locations VALUES (544, 'Pedro Luro', 6, -39.501495361328125, -62.679828643798828);
INSERT INTO public2.locations VALUES (545, 'Teniente Orine', 6, -39.057807922363281, -62.570415496826172);
INSERT INTO public2.locations VALUES (546, 'Escalada', 6, -34.158145904541016, -59.113670349121094);
INSERT INTO public2.locations VALUES (547, 'Lima', 6, -34.044795989990234, -59.196147918701172);
INSERT INTO public2.locations VALUES (548, 'ZÃ¡rate', 6, -34.095806121826172, -59.024322509765625);
INSERT INTO public2.locations VALUES (549, 'Chuchucaruana', 10, -27.921751022338867, -65.838607788085938);
INSERT INTO public2.locations VALUES (550, 'Colpes', 10, -28.065492630004883, -65.812637329101562);
INSERT INTO public2.locations VALUES (551, 'El BolsÃ³n', 10, -27.903903961181641, -65.881050109863281);
INSERT INTO public2.locations VALUES (552, 'El Rodeo', 10, -28.212696075439453, -65.8764877319336);
INSERT INTO public2.locations VALUES (553, 'Huaycama', 10, -28.119350433349609, -65.7984619140625);
INSERT INTO public2.locations VALUES (554, 'La Puerta', 10, -28.156345367431641, -65.793869018554688);
INSERT INTO public2.locations VALUES (555, 'Las Chacritas', 10, -27.68817138671875, -65.923751831054688);
INSERT INTO public2.locations VALUES (556, 'Las Juntas', 10, -28.098310470581055, -65.899238586425781);
INSERT INTO public2.locations VALUES (557, 'Los Castillos', 10, -27.959829330444336, -65.81280517578125);
INSERT INTO public2.locations VALUES (558, 'Los Talas', 10, -27.941530227661133, -65.868049621582031);
INSERT INTO public2.locations VALUES (559, 'Los Varela', 10, -27.931468963623047, -65.872016906738281);
INSERT INTO public2.locations VALUES (560, 'Singuil', 10, -27.80430793762207, -65.871200561523438);
INSERT INTO public2.locations VALUES (561, 'Ancasti', 10, -28.812644958496094, -65.500686645507812);
INSERT INTO public2.locations VALUES (562, 'Anquincila', 10, -28.746688842773438, -65.54632568359375);
INSERT INTO public2.locations VALUES (563, 'La Candelaria', 10, -28.694307327270508, -65.431449890136719);
INSERT INTO public2.locations VALUES (564, 'La Majada', 10, -29.029165267944336, -65.546722412109375);
INSERT INTO public2.locations VALUES (565, 'Amanao', 10, -27.53497314453125, -66.505340576171875);
INSERT INTO public2.locations VALUES (566, 'AndalgalÃ¡', 10, -27.583019256591797, -66.3154296875);
INSERT INTO public2.locations VALUES (567, 'Chaquia', 10, -27.547866821289062, -66.326873779296875);
INSERT INTO public2.locations VALUES (568, 'Choya', 10, -27.521049499511719, -66.383842468261719);
INSERT INTO public2.locations VALUES (569, 'El Alamito', 10, -27.489889144897461, -66.020866394042969);
INSERT INTO public2.locations VALUES (570, 'El Lindero', 10, -27.466634750366211, -66.010749816894531);
INSERT INTO public2.locations VALUES (571, 'El Potrero', 10, -27.510158538818359, -66.328628540039062);
INSERT INTO public2.locations VALUES (572, 'Antofagasta de la Sierra', 10, -26.059267044067383, -67.40655517578125);
INSERT INTO public2.locations VALUES (573, 'El PeÃ±Ã³n', 10, -26.475446701049805, -67.265205383300781);
INSERT INTO public2.locations VALUES (574, 'Los Nacimientos', 10, -25.824638366699219, -67.371795654296875);
INSERT INTO public2.locations VALUES (575, 'Barranca Larga', 10, -26.982864379882812, -66.739067077636719);
INSERT INTO public2.locations VALUES (576, 'BelÃ©n', 10, -27.649528503417969, -67.026313781738281);
INSERT INTO public2.locations VALUES (577, 'CÃ³ndor Huasi', 10, -27.493249893188477, -67.102088928222656);
INSERT INTO public2.locations VALUES (578, 'Corral Quemado', 10, -27.144800186157227, -66.944755554199219);
INSERT INTO public2.locations VALUES (579, 'El Durazno', 10, -27.247232437133789, -67.032218933105469);
INSERT INTO public2.locations VALUES (580, 'FarallÃ³n Negro', 10, -27.304162979125977, -66.682243347167969);
INSERT INTO public2.locations VALUES (581, 'HualfÃ­n', 10, -27.224767684936523, -66.833999633789062);
INSERT INTO public2.locations VALUES (582, 'Jacipunco', 10, -27.242435455322266, -67.008354187011719);
INSERT INTO public2.locations VALUES (583, 'La Puntilla', 10, -27.685016632080078, -66.993659973144531);
INSERT INTO public2.locations VALUES (584, 'Las Juntas', 10, -27.535959243774414, -67.1173095703125);
INSERT INTO public2.locations VALUES (585, 'Londres', 10, -27.712566375732422, -67.135513305664062);
INSERT INTO public2.locations VALUES (586, 'Los Nacimientos', 10, -27.164346694946289, -66.735511779785156);
INSERT INTO public2.locations VALUES (587, 'Puerta de Corral Quemado', 10, -27.227609634399414, -66.932823181152344);
INSERT INTO public2.locations VALUES (588, 'Puerta de San JosÃ©', 10, -27.548030853271484, -67.005241394042969);
INSERT INTO public2.locations VALUES (589, 'Villa Vil', 10, -27.093517303466797, -66.822059631347656);
INSERT INTO public2.locations VALUES (590, 'CapayÃ¡n', 10, -28.774595260620117, -66.0464859008789);
INSERT INTO public2.locations VALUES (591, 'Chumbicha', 10, -28.853193283081055, -66.237564086914062);
INSERT INTO public2.locations VALUES (592, 'Colonia del Valle', 10, -28.653606414794922, -65.86785888671875);
INSERT INTO public2.locations VALUES (593, 'Colonia Nueva Coneta', 10, -28.578714370727539, -65.836463928222656);
INSERT INTO public2.locations VALUES (594, 'ConcepciÃ³n', 10, -28.687097549438477, -66.065887451171875);
INSERT INTO public2.locations VALUES (595, 'Coneta', 10, -28.579299926757812, -65.887802124023438);
INSERT INTO public2.locations VALUES (596, 'El BaÃ±ado', 10, -28.621488571166992, -65.856475830078125);
INSERT INTO public2.locations VALUES (597, 'Huillapima', 10, -28.726072311401367, -65.978744506835938);
INSERT INTO public2.locations VALUES (598, 'Los Angeles', 10, -28.452144622802734, -65.950439453125);
INSERT INTO public2.locations VALUES (599, 'Miraflores', 10, -28.598735809326172, -65.902168273925781);
INSERT INTO public2.locations VALUES (600, 'San MartÃ­n', 10, -29.220623016357422, -65.774505615234375);
INSERT INTO public2.locations VALUES (601, 'San Pablo', 10, -28.700193405151367, -66.037071228027344);
INSERT INTO public2.locations VALUES (602, 'San Pedro', 10, -28.746002197265625, -66.1246566772461);
INSERT INTO public2.locations VALUES (603, 'San Fernando del Valle de Catamarca', 10, -28.469013214111328, -65.778915405273438);
INSERT INTO public2.locations VALUES (604, 'El Alto', 10, -28.310611724853516, -65.36444091796875);
INSERT INTO public2.locations VALUES (605, 'Guayamba', 10, -28.343244552612305, -65.399658203125);
INSERT INTO public2.locations VALUES (606, 'InfanzÃ³n', 10, -28.579032897949219, -65.404998779296875);
INSERT INTO public2.locations VALUES (607, 'Los Corrales', 10, -28.493404388427734, -65.325180053710938);
INSERT INTO public2.locations VALUES (608, 'Tapso', 10, -28.404857635498047, -65.102729797363281);
INSERT INTO public2.locations VALUES (609, 'VilismÃ¡n', 10, -28.497724533081055, -65.433097839355469);
INSERT INTO public2.locations VALUES (610, 'Pomancillo Este', 10, -28.302562713623047, -65.719573974609375);
INSERT INTO public2.locations VALUES (611, 'Pomancillo Oeste', 10, -28.304454803466797, -65.731796264648438);
INSERT INTO public2.locations VALUES (612, 'San JosÃ©', 10, -28.387565612792969, -65.700927734375);
INSERT INTO public2.locations VALUES (613, 'Villa Las Pirquitas', 10, -28.279903411865234, -65.732109069824219);
INSERT INTO public2.locations VALUES (614, 'Casa de Piedra', 10, -29.604547500610352, -65.519737243652344);
INSERT INTO public2.locations VALUES (615, 'El Aybal', 10, -29.109329223632812, -65.361221313476562);
INSERT INTO public2.locations VALUES (616, 'El BaÃ±ado', 10, -29.194969177246094, -65.4372787475586);
INSERT INTO public2.locations VALUES (617, 'El Divisadero', 10, -29.201526641845703, -65.452484130859375);
INSERT INTO public2.locations VALUES (618, 'El Quimilo', 10, -29.89935302734375, -65.397903442382812);
INSERT INTO public2.locations VALUES (619, 'EsquiÃº', 10, -29.378860473632812, -65.2902603149414);
INSERT INTO public2.locations VALUES (620, 'IcaÃ±o', 10, -28.919540405273438, -65.330162048339844);
INSERT INTO public2.locations VALUES (621, 'La Dorada', 10, -29.244821548461914, -65.482551574707031);
INSERT INTO public2.locations VALUES (622, 'La Guardia', 10, -29.556526184082031, -65.452926635742188);
INSERT INTO public2.locations VALUES (623, 'Las Esquinas', 10, -28.737028121948242, -65.108932495117188);
INSERT INTO public2.locations VALUES (624, 'Las Palmitas', 10, -28.637189865112305, -64.986114501953125);
INSERT INTO public2.locations VALUES (625, 'QuirÃ³s', 10, -28.785888671875, -65.110954284667969);
INSERT INTO public2.locations VALUES (626, 'Ramblones', 10, -29.153957366943359, -65.398361206054688);
INSERT INTO public2.locations VALUES (627, 'Recreo', 10, -29.278860092163086, -65.058609008789062);
INSERT INTO public2.locations VALUES (628, 'San Antonio', 10, -28.93248176574707, -65.096916198730469);
INSERT INTO public2.locations VALUES (629, 'Amadores', 10, -28.262571334838867, -65.637344360351562);
INSERT INTO public2.locations VALUES (630, 'La Higuera', 10, -27.939661026000977, -65.697662353515625);
INSERT INTO public2.locations VALUES (631, 'La Merced', 10, -28.154407501220703, -65.659439086914062);
INSERT INTO public2.locations VALUES (632, 'La ViÃ±a', 10, -28.039283752441406, -65.596832275390625);
INSERT INTO public2.locations VALUES (633, 'Las Lajas', 10, -27.838159561157227, -65.729461669921875);
INSERT INTO public2.locations VALUES (634, 'Monte Potrero', 10, -28.179021835327148, -65.662757873535156);
INSERT INTO public2.locations VALUES (635, 'Palo Labrado', 10, -28.3210391998291, -65.619346618652344);
INSERT INTO public2.locations VALUES (636, 'San Antonio', 10, -28.008460998535156, -65.710456848144531);
INSERT INTO public2.locations VALUES (637, 'Villa de Balcozna', 10, -27.882612228393555, -65.727821350097656);
INSERT INTO public2.locations VALUES (638, 'Colana', 10, -28.362396240234375, -66.159759521484375);
INSERT INTO public2.locations VALUES (639, 'Colpes', 10, -28.058637619018555, -66.197662353515625);
INSERT INTO public2.locations VALUES (640, 'El Pajonal', 10, -28.372140884399414, -66.295089721679688);
INSERT INTO public2.locations VALUES (641, 'Mutquin', 10, -28.314846038818359, -66.149017333984375);
INSERT INTO public2.locations VALUES (642, 'PomÃ¡n', 10, -28.395280838012695, -66.2182846069336);
INSERT INTO public2.locations VALUES (643, 'RincÃ³n', 10, -28.221343994140625, -66.143341064453125);
INSERT INTO public2.locations VALUES (644, 'San Miguel', 10, -28.140094757080078, -66.202552795410156);
INSERT INTO public2.locations VALUES (645, 'Saujil', 10, -28.174705505371094, -66.2160415649414);
INSERT INTO public2.locations VALUES (646, 'SijÃ¡n', 10, -28.261493682861328, -66.224281311035156);
INSERT INTO public2.locations VALUES (647, 'AndalhualÃ¡', 10, -26.877359390258789, -66.047409057617188);
INSERT INTO public2.locations VALUES (648, 'ChaÃ±ar Punco', 10, -26.721940994262695, -66.066940307617188);
INSERT INTO public2.locations VALUES (649, 'El CajÃ³n', 10, -26.407569885253906, -66.253829956054688);
INSERT INTO public2.locations VALUES (650, 'El Desmonte', 10, -26.883232116699219, -66.1016616821289);
INSERT INTO public2.locations VALUES (651, 'El Puesto', 10, -26.677248001098633, -66.04058837890625);
INSERT INTO public2.locations VALUES (652, 'Famatanca', 10, -26.768363952636719, -66.082603454589844);
INSERT INTO public2.locations VALUES (653, 'Fuerte Quemado', 10, -26.626838684082031, -66.0484848022461);
INSERT INTO public2.locations VALUES (654, 'La Hoyada', 10, -26.543619155883789, -66.362167358398438);
INSERT INTO public2.locations VALUES (655, 'Las Mojarras', 10, -26.695690155029297, -66.066650390625);
INSERT INTO public2.locations VALUES (656, 'Punta de Balasto', 10, -26.953386306762695, -66.13623046875);
INSERT INTO public2.locations VALUES (657, 'San JosÃ©', 10, -26.801244735717773, -66.069732666015625);
INSERT INTO public2.locations VALUES (658, 'Santa MarÃ­a', 10, -26.694524765014648, -66.047966003417969);
INSERT INTO public2.locations VALUES (659, 'Yapes', 10, -26.834037780761719, -66.033599853515625);
INSERT INTO public2.locations VALUES (660, 'AlijilÃ¡n', 10, -28.179391860961914, -65.4953842163086);
INSERT INTO public2.locations VALUES (661, 'BaÃ±ado de Ovanta', 10, -28.106287002563477, -65.319259643554688);
INSERT INTO public2.locations VALUES (662, 'Las CaÃ±as', 10, -28.204721450805664, -65.214385986328125);
INSERT INTO public2.locations VALUES (663, 'Lavalle', 10, -28.195030212402344, -65.114334106445312);
INSERT INTO public2.locations VALUES (664, 'Los Altos', 10, -28.045007705688477, -65.497634887695312);
INSERT INTO public2.locations VALUES (665, 'Manantiales', 10, -28.143205642700195, -65.496788024902344);
INSERT INTO public2.locations VALUES (666, 'San Pedro', 10, -27.956623077392578, -65.171173095703125);
INSERT INTO public2.locations VALUES (667, 'Anillaco', 10, -27.9088134765625, -67.6219253540039);
INSERT INTO public2.locations VALUES (668, 'Copacabana', 10, -28.176530838012695, -67.488021850585938);
INSERT INTO public2.locations VALUES (669, 'El Puesto', 10, -27.955034255981445, -67.633682250976562);
INSERT INTO public2.locations VALUES (670, 'El Salado', 10, -28.304519653320312, -67.24737548828125);
INSERT INTO public2.locations VALUES (671, 'FiambalÃ¡', 10, -27.692193984985352, -67.618904113769531);
INSERT INTO public2.locations VALUES (672, 'Medanitos', 10, -27.524240493774414, -67.5912857055664);
INSERT INTO public2.locations VALUES (673, 'Palo Blanco', 10, -27.334928512573242, -67.7549819946289);
INSERT INTO public2.locations VALUES (674, 'Saujil', 10, -27.570873260498047, -67.621994018554688);
INSERT INTO public2.locations VALUES (675, 'Tinogasta', 10, -28.065561294555664, -67.564369201660156);
INSERT INTO public2.locations VALUES (676, 'El Portezuelo', 10, -28.470104217529297, -65.635604858398438);
INSERT INTO public2.locations VALUES (677, 'Huaycama', 10, -28.517293930053711, -65.676506042480469);
INSERT INTO public2.locations VALUES (678, 'Las Tejas', 10, -28.658681869506836, -65.783798217773438);
INSERT INTO public2.locations VALUES (679, 'San Isidro', 10, -28.457754135131836, -65.7249755859375);
INSERT INTO public2.locations VALUES (680, 'Santa Cruz', 10, -28.500923156738281, -65.664115905761719);
INSERT INTO public2.locations VALUES (681, 'Amboy', 14, -32.174579620361328, -64.5732421875);
INSERT INTO public2.locations VALUES (682, 'Arroyo San Antonio', 14, -32.2562255859375, -64.607795715332031);
INSERT INTO public2.locations VALUES (683, 'CaÃ±ada del Sauce', 14, -32.367961883544922, -64.645423889160156);
INSERT INTO public2.locations VALUES (684, 'El Corcovado - El TorreÃ³n', 14, -32.140434265136719, -64.50347900390625);
INSERT INTO public2.locations VALUES (685, 'El Durazno', 14, -32.1697998046875, -64.773887634277344);
INSERT INTO public2.locations VALUES (686, 'Embalse', 14, -32.206745147705078, -64.400642395019531);
INSERT INTO public2.locations VALUES (687, 'La Cruz', 14, -32.3031120300293, -64.483039855957031);
INSERT INTO public2.locations VALUES (688, 'La Cumbrecita', 14, -31.899787902832031, -64.7731704711914);
INSERT INTO public2.locations VALUES (689, 'Las Bajadas', 14, -32.096160888671875, -64.330070495605469);
INSERT INTO public2.locations VALUES (690, 'Las Caleras', 14, -32.388801574707031, -64.521438598632812);
INSERT INTO public2.locations VALUES (691, 'Los CÃ³ndores', 14, -32.321125030517578, -64.2807388305664);
INSERT INTO public2.locations VALUES (692, 'Los Molinos', 14, -31.854862213134766, -64.3789291381836);
INSERT INTO public2.locations VALUES (693, 'Los Reartes', 14, -31.918308258056641, -64.575820922851562);
INSERT INTO public2.locations VALUES (694, 'Lutti', 14, -32.318496704101562, -64.746986389160156);
INSERT INTO public2.locations VALUES (695, 'Parque Calmayo', 14, -32.025470733642578, -64.464675903320312);
INSERT INTO public2.locations VALUES (696, 'RÃ­o de los Sauces', 14, -32.528640747070312, -64.58868408203125);
INSERT INTO public2.locations VALUES (697, 'San AgustÃ­n', 14, -31.977622985839844, -64.3755874633789);
INSERT INTO public2.locations VALUES (698, 'San Ignacio (Loteo San Javier)', 14, -32.1659049987793, -64.517906188964844);
INSERT INTO public2.locations VALUES (699, 'Santa Rosa de Calamuchita', 14, -32.064376831054688, -64.539558410644531);
INSERT INTO public2.locations VALUES (700, 'Segunda Usina', 14, -32.165000915527344, -64.379180908203125);
INSERT INTO public2.locations VALUES (701, 'Solar de los Molinos', 14, -31.828275680541992, -64.52130126953125);
INSERT INTO public2.locations VALUES (702, 'Villa Alpina', 14, -31.95635986328125, -64.8134536743164);
INSERT INTO public2.locations VALUES (703, 'Villa Amancay', 14, -32.186183929443359, -64.567390441894531);
INSERT INTO public2.locations VALUES (704, 'Villa Berna', 14, -31.910999298095703, -64.7263412475586);
INSERT INTO public2.locations VALUES (705, 'Villa Ciudad Parque Los Reartes', 14, -31.912065505981445, -64.5306167602539);
INSERT INTO public2.locations VALUES (706, 'Villa del Dique', 14, -32.176349639892578, -64.456939697265625);
INSERT INTO public2.locations VALUES (707, 'Villa El Tala', 14, -32.252716064453125, -64.584114074707031);
INSERT INTO public2.locations VALUES (708, 'Villa General Belgrano', 14, -31.976491928100586, -64.559051513671875);
INSERT INTO public2.locations VALUES (709, 'Villa La Rivera', 14, -32.266632080078125, -64.524711608886719);
INSERT INTO public2.locations VALUES (710, 'Villa Quillinzo', 14, -32.236545562744141, -64.513603210449219);
INSERT INTO public2.locations VALUES (711, 'Villa Rumipal', 14, -32.189384460449219, -64.479202270507812);
INSERT INTO public2.locations VALUES (712, 'Villa Yacanto', 14, -32.103595733642578, -64.754524230957031);
INSERT INTO public2.locations VALUES (713, 'CÃ³rdoba', 14, -31.416805267333984, -64.183609008789062);
INSERT INTO public2.locations VALUES (714, 'Agua de Oro', 14, -31.062229156494141, -64.300643920898438);
INSERT INTO public2.locations VALUES (715, 'Ascochinga', 14, -30.959035873413086, -64.273345947265625);
INSERT INTO public2.locations VALUES (716, 'Colonia Caroya', 14, -31.022054672241211, -64.061714172363281);
INSERT INTO public2.locations VALUES (717, 'Colonia Tirolesa', 14, -31.237276077270508, -64.066299438476562);
INSERT INTO public2.locations VALUES (718, 'Colonia Vicente AgÃ¼ero', 14, -31.028522491455078, -64.018684387207031);
INSERT INTO public2.locations VALUES (719, 'Villa CorazÃ³n de MarÃ­a', 14, -31.443990707397461, -63.995765686035156);
INSERT INTO public2.locations VALUES (720, 'El Manzano', 14, -31.084230422973633, -64.298698425292969);
INSERT INTO public2.locations VALUES (721, 'General Paz', 14, -31.134481430053711, -64.140151977539062);
INSERT INTO public2.locations VALUES (722, 'JesÃºs MarÃ­a', 14, -30.976131439208984, -64.095794677734375);
INSERT INTO public2.locations VALUES (723, 'La Calera', 14, -31.345792770385742, -64.338485717773438);
INSERT INTO public2.locations VALUES (724, 'La Granja', 14, -31.008625030517578, -64.267890930175781);
INSERT INTO public2.locations VALUES (725, 'La Puerta', 14, -31.143163681030273, -64.041267395019531);
INSERT INTO public2.locations VALUES (726, 'Malvinas Argentinas', 14, -31.37425422668457, -64.0536880493164);
INSERT INTO public2.locations VALUES (727, 'Mendiolaza', 14, -31.2640438079834, -64.309127807617188);
INSERT INTO public2.locations VALUES (728, 'Mi Granja', 14, -31.355350494384766, -64.003189086914062);
INSERT INTO public2.locations VALUES (729, 'RÃ­o Ceballos', 14, -31.169750213623047, -64.3175048828125);
INSERT INTO public2.locations VALUES (730, 'SaldÃ¡n', 14, -31.315305709838867, -64.30352783203125);
INSERT INTO public2.locations VALUES (731, 'Salsipuedes', 14, -31.142353057861328, -64.297416687011719);
INSERT INTO public2.locations VALUES (732, 'Tinoco', 14, -31.124507904052734, -63.891796112060547);
INSERT INTO public2.locations VALUES (733, 'Unquillo', 14, -31.237152099609375, -64.311759948730469);
INSERT INTO public2.locations VALUES (734, 'Villa Allende', 14, -31.293649673461914, -64.297698974609375);
INSERT INTO public2.locations VALUES (735, 'Villa Cerro Azul', 14, -31.07066535949707, -64.316238403320312);
INSERT INTO public2.locations VALUES (736, 'Parque Norte - Ciudad de los NiÃ±os - GuiÃ±azÃº Norte', 14, -31.312414169311523, -64.176193237304688);
INSERT INTO public2.locations VALUES (737, 'Villa Los Llanos - JuÃ¡rez Celman', 14, -31.275730133056641, -64.164619445800781);
INSERT INTO public2.locations VALUES (738, 'Alto de los Quebrachos', 14, -30.543285369873047, -65.036727905273438);
INSERT INTO public2.locations VALUES (739, 'BaÃ±ado de Soto', 14, -30.795129776000977, -65.052642822265625);
INSERT INTO public2.locations VALUES (740, 'Cruz de CaÃ±a', 14, -31.067836761474609, -64.934783935546875);
INSERT INTO public2.locations VALUES (741, 'Cruz del Eje', 14, -30.743928909301758, -64.790779113769531);
INSERT INTO public2.locations VALUES (742, 'El Brete', 14, -30.672634124755859, -64.871894836425781);
INSERT INTO public2.locations VALUES (743, 'Guanaco Muerto', 14, -30.4786434173584, -65.061599731445312);
INSERT INTO public2.locations VALUES (744, 'La Batea', 14, -30.372274398803711, -65.308151245117188);
INSERT INTO public2.locations VALUES (745, 'La Higuera', 14, -31.013290405273438, -65.102897644042969);
INSERT INTO public2.locations VALUES (746, 'Las CaÃ±adas', 14, -30.914993286132812, -64.734725952148438);
INSERT INTO public2.locations VALUES (747, 'Las Playas', 14, -30.706741333007812, -64.847297668457031);
INSERT INTO public2.locations VALUES (748, 'Los ChaÃ±aritos', 14, -30.557676315307617, -64.953742980957031);
INSERT INTO public2.locations VALUES (749, 'Media Naranja', 14, -30.644077301025391, -64.928253173828125);
INSERT INTO public2.locations VALUES (750, 'Paso Viejo', 14, -30.767438888549805, -65.1904296875);
INSERT INTO public2.locations VALUES (751, 'San Marcos Sierra', 14, -30.783012390136719, -64.636192321777344);
INSERT INTO public2.locations VALUES (752, 'Serrezuela', 14, -30.638772964477539, -65.388740539550781);
INSERT INTO public2.locations VALUES (753, 'Tuclame', 14, -30.746591567993164, -65.2356185913086);
INSERT INTO public2.locations VALUES (754, 'Villa de Soto', 14, -30.8552303314209, -64.984893798828125);
INSERT INTO public2.locations VALUES (755, 'Del Campillo', 14, -34.378856658935547, -64.49713134765625);
INSERT INTO public2.locations VALUES (756, 'EstaciÃ³n Lecueder', 14, -34.496089935302734, -64.810684204101562);
INSERT INTO public2.locations VALUES (757, 'HipÃ³lito Bouchard', 14, -34.723873138427734, -63.50726318359375);
INSERT INTO public2.locations VALUES (758, 'Huinca RenancÃ³', 14, -34.8413200378418, -64.374671936035156);
INSERT INTO public2.locations VALUES (759, 'ItalÃ³', 14, -34.790805816650391, -63.780357360839844);
INSERT INTO public2.locations VALUES (760, 'Mattaldi', 14, -34.481258392333984, -64.170700073242188);
INSERT INTO public2.locations VALUES (761, 'NicolÃ¡s Bruzzone', 14, -34.440422058105469, -64.341644287109375);
INSERT INTO public2.locations VALUES (762, 'Onaity', 14, -34.772628784179688, -63.672153472900391);
INSERT INTO public2.locations VALUES (763, 'PincÃ©n', 14, -34.838184356689453, -63.91656494140625);
INSERT INTO public2.locations VALUES (764, 'Ranqueles', 14, -34.842658996582031, -64.1003189086914);
INSERT INTO public2.locations VALUES (765, 'Santa Magdalena', 14, -34.518814086914062, -63.944038391113281);
INSERT INTO public2.locations VALUES (766, 'Villa Huidobro', 14, -34.840518951416016, -64.58709716796875);
INSERT INTO public2.locations VALUES (767, 'Villa Sarmiento', 14, -34.122852325439453, -64.725181579589844);
INSERT INTO public2.locations VALUES (768, 'Villa Valeria', 14, -34.341445922851562, -64.920814514160156);
INSERT INTO public2.locations VALUES (769, 'Arroyo AldÃ³n', 14, -32.201187133789062, -63.165122985839844);
INSERT INTO public2.locations VALUES (770, 'Arroyo Cabral', 14, -32.489494323730469, -63.402374267578125);
INSERT INTO public2.locations VALUES (771, 'Ausonia', 14, -32.661796569824219, -63.243114471435547);
INSERT INTO public2.locations VALUES (772, 'ChazÃ³n', 14, -33.0778694152832, -63.275070190429688);
INSERT INTO public2.locations VALUES (773, 'Etruria', 14, -32.939231872558594, -63.2450065612793);
INSERT INTO public2.locations VALUES (774, 'La Laguna', 14, -32.802524566650391, -63.247093200683594);
INSERT INTO public2.locations VALUES (775, 'La Palestina', 14, -32.616436004638672, -63.409400939941406);
INSERT INTO public2.locations VALUES (776, 'La Playosa', 14, -32.097000122070312, -63.034351348876953);
INSERT INTO public2.locations VALUES (777, 'Las Mojarras', 14, -32.3043327331543, -63.233436584472656);
INSERT INTO public2.locations VALUES (778, 'Luca', 14, -32.540504455566406, -63.476894378662109);
INSERT INTO public2.locations VALUES (779, 'Pasco', 14, -32.746219635009766, -63.34173583984375);
INSERT INTO public2.locations VALUES (780, 'Sanabria', 14, -32.528293609619141, -63.248016357421875);
INSERT INTO public2.locations VALUES (781, 'Silvio Pellico', 14, -32.249626159667969, -62.930881500244141);
INSERT INTO public2.locations VALUES (782, 'Ticino', 14, -32.6931266784668, -63.437107086181641);
INSERT INTO public2.locations VALUES (783, 'TÃ­o Pujio', 14, -32.287075042724609, -63.353679656982422);
INSERT INTO public2.locations VALUES (784, 'Villa MarÃ­a', 14, -32.413505554199219, -63.248329162597656);
INSERT INTO public2.locations VALUES (785, 'Villa Nueva', 14, -32.435478210449219, -63.247856140136719);
INSERT INTO public2.locations VALUES (786, 'Villa Oeste', 14, -32.416942596435547, -63.2834587097168);
INSERT INTO public2.locations VALUES (787, 'Avellaneda', 14, -30.594289779663086, -64.2056884765625);
INSERT INTO public2.locations VALUES (788, 'CaÃ±ada de RÃ­o Pinto', 14, -30.775791168212891, -64.2186508178711);
INSERT INTO public2.locations VALUES (789, 'ChuÃ±a', 14, -30.467073440551758, -64.670234680175781);
INSERT INTO public2.locations VALUES (790, 'Copacabana', 14, -30.642902374267578, -64.499504089355469);
INSERT INTO public2.locations VALUES (791, 'DeÃ¡n Funes', 14, -30.424976348876953, -64.352737426757812);
INSERT INTO public2.locations VALUES (792, 'Los Pozos', 14, -30.519180297851562, -64.252288818359375);
INSERT INTO public2.locations VALUES (793, 'Olivares de San NicolÃ¡s', 14, -30.601226806640625, -64.855606079101562);
INSERT INTO public2.locations VALUES (794, 'Quilino', 14, -30.214174270629883, -64.4993667602539);
INSERT INTO public2.locations VALUES (795, 'San Pedro de Toyos', 14, -30.454212188720703, -64.444892883300781);
INSERT INTO public2.locations VALUES (796, 'Villa GutiÃ©rrez', 14, -30.6792049407959, -64.16015625);
INSERT INTO public2.locations VALUES (797, 'Alejandro Roca', 14, -33.353561401367188, -63.717735290527344);
INSERT INTO public2.locations VALUES (798, 'Assunta', 14, -33.6341667175293, -63.225620269775391);
INSERT INTO public2.locations VALUES (799, 'Benlea', 14, -33.024772644042969, -63.669895172119141);
INSERT INTO public2.locations VALUES (800, 'Carnerillo', 14, -32.91314697265625, -64.0225830078125);
INSERT INTO public2.locations VALUES (801, 'Charras', 14, -33.0253791809082, -64.046875);
INSERT INTO public2.locations VALUES (802, 'El Rastreador', 14, -33.666183471679688, -63.539333343505859);
INSERT INTO public2.locations VALUES (803, 'General Cabrera', 14, -32.814571380615234, -63.874958038330078);
INSERT INTO public2.locations VALUES (804, 'General Deheza', 14, -32.756328582763672, -63.789131164550781);
INSERT INTO public2.locations VALUES (805, 'Huanchillas', 14, -33.668491363525391, -63.636260986328125);
INSERT INTO public2.locations VALUES (806, 'La Carlota', 14, -33.417976379394531, -63.293628692626953);
INSERT INTO public2.locations VALUES (807, 'Los Cisnes', 14, -33.400360107421875, -63.472389221191406);
INSERT INTO public2.locations VALUES (808, 'Olaeta', 14, -33.044761657714844, -63.90606689453125);
INSERT INTO public2.locations VALUES (809, 'Pacheco de Melo', 14, -33.758445739746094, -63.490303039550781);
INSERT INTO public2.locations VALUES (810, 'Paso del Durazno', 14, -33.170738220214844, -64.047760009765625);
INSERT INTO public2.locations VALUES (811, 'Santa Eufemia', 14, -33.176479339599609, -63.286605834960938);
INSERT INTO public2.locations VALUES (812, 'Ucacha', 14, -33.031440734863281, -63.506118774414062);
INSERT INTO public2.locations VALUES (813, 'Villa ReducciÃ³n', 14, -33.2031135559082, -63.862644195556641);
INSERT INTO public2.locations VALUES (814, 'Alejo Ledesma', 14, -33.605392456054688, -62.625881195068359);
INSERT INTO public2.locations VALUES (815, 'Arias', 14, -33.642074584960938, -62.404117584228516);
INSERT INTO public2.locations VALUES (816, 'Camilo Aldao', 14, -33.127586364746094, -62.094841003417969);
INSERT INTO public2.locations VALUES (817, 'CapitÃ¡n General Bernardo O''Higgins', 14, -33.248256683349609, -62.268833160400391);
INSERT INTO public2.locations VALUES (818, 'Cavanagh', 14, -33.4737663269043, -62.338905334472656);
INSERT INTO public2.locations VALUES (819, 'Colonia Barge', 14, -33.25823974609375, -62.607524871826172);
INSERT INTO public2.locations VALUES (820, 'Colonia Italiana', 14, -33.311702728271484, -62.176464080810547);
INSERT INTO public2.locations VALUES (821, 'Colonia Veinticinco', 14, -32.887680053710938, -61.951744079589844);
INSERT INTO public2.locations VALUES (822, 'Corral de Bustos', 14, -33.2830924987793, -62.186542510986328);
INSERT INTO public2.locations VALUES (823, 'Cruz Alta', 14, -33.008399963378906, -61.805778503417969);
INSERT INTO public2.locations VALUES (824, 'General Baldissera', 14, -33.1220817565918, -62.302883148193359);
INSERT INTO public2.locations VALUES (825, 'General Roca', 14, -32.730876922607422, -61.915824890136719);
INSERT INTO public2.locations VALUES (826, 'GuatimozÃ­n', 14, -33.464286804199219, -62.438255310058594);
INSERT INTO public2.locations VALUES (827, 'Inriville', 14, -32.945648193359375, -62.230789184570312);
INSERT INTO public2.locations VALUES (828, 'Isla Verde', 14, -33.239696502685547, -62.401596069335938);
INSERT INTO public2.locations VALUES (829, 'Leones', 14, -32.659355163574219, -62.297267913818359);
INSERT INTO public2.locations VALUES (830, 'Los Surgentes', 14, -32.985267639160156, -62.021873474121094);
INSERT INTO public2.locations VALUES (831, 'Marcos JuÃ¡rez', 14, -32.690635681152344, -62.101127624511719);
INSERT INTO public2.locations VALUES (832, 'Monte Buey', 14, -32.9156379699707, -62.454902648925781);
INSERT INTO public2.locations VALUES (833, 'Saira', 14, -32.409713745117188, -62.102348327636719);
INSERT INTO public2.locations VALUES (834, 'Saladillo', 14, -32.933872222900391, -62.343711853027344);
INSERT INTO public2.locations VALUES (835, 'Villa Elisa', 14, -32.834758758544922, -62.295257568359375);
INSERT INTO public2.locations VALUES (836, 'CiÃ©naga del Coro', 14, -31.042421340942383, -65.283523559570312);
INSERT INTO public2.locations VALUES (837, 'El Chacho', 14, -30.800382614135742, -65.656402587890625);
INSERT INTO public2.locations VALUES (838, 'Estancia de Guadalupe', 14, -31.130075454711914, -65.215972900390625);
INSERT INTO public2.locations VALUES (839, 'Guasapampa', 14, -31.101593017578125, -65.329208374023438);
INSERT INTO public2.locations VALUES (840, 'La Playa', 14, -31.009668350219727, -65.36126708984375);
INSERT INTO public2.locations VALUES (841, 'San Carlos Minas', 14, -31.176557540893555, -65.101821899414062);
INSERT INTO public2.locations VALUES (842, 'Talaini', 14, -31.249849319458008, -65.1692886352539);
INSERT INTO public2.locations VALUES (843, 'Tosno', 14, -30.959873199462891, -65.310394287109375);
INSERT INTO public2.locations VALUES (844, 'Chancani', 14, -31.415964126586914, -65.451255798339844);
INSERT INTO public2.locations VALUES (845, 'Las Palmas', 14, -31.377775192260742, -65.289833068847656);
INSERT INTO public2.locations VALUES (846, 'Los Talares', 14, -31.407146453857422, -65.0470199584961);
INSERT INTO public2.locations VALUES (847, 'Salsacate', 14, -31.31785774230957, -65.089523315429688);
INSERT INTO public2.locations VALUES (848, 'San GerÃ³nimo', 14, -31.344184875488281, -64.9190444946289);
INSERT INTO public2.locations VALUES (849, 'Tala CaÃ±ada', 14, -31.354488372802734, -64.975906372070312);
INSERT INTO public2.locations VALUES (850, 'Villa de Pocho', 14, -31.490158081054688, -65.280952453613281);
INSERT INTO public2.locations VALUES (851, 'General Levalle', 14, -34.007076263427734, -63.923477172851562);
INSERT INTO public2.locations VALUES (852, 'La Cesira', 14, -33.953647613525391, -62.977302551269531);
INSERT INTO public2.locations VALUES (853, 'Laboulaye', 14, -34.128631591796875, -63.390701293945312);
INSERT INTO public2.locations VALUES (854, 'LeguizamÃ³n', 14, -34.204181671142578, -62.975845336914062);
INSERT INTO public2.locations VALUES (855, 'Melo', 14, -34.348674774169922, -63.445152282714844);
INSERT INTO public2.locations VALUES (856, 'RÃ­o Bamba', 14, -34.051372528076172, -63.733066558837891);
INSERT INTO public2.locations VALUES (857, 'Rosales', 14, -34.171775817871094, -63.154026031494141);
INSERT INTO public2.locations VALUES (858, 'San JoaquÃ­n', 14, -34.5117301940918, -63.708843231201172);
INSERT INTO public2.locations VALUES (859, 'Serrano', 14, -34.470672607421875, -63.540287017822266);
INSERT INTO public2.locations VALUES (860, 'Villa Rossi', 14, -34.297935485839844, -63.268539428710938);
INSERT INTO public2.locations VALUES (861, 'Bialet MassÃ©', 14, -31.313905715942383, -64.464035034179688);
INSERT INTO public2.locations VALUES (862, 'Cabalan', 14, -31.390556335449219, -64.560302734375);
INSERT INTO public2.locations VALUES (863, 'Capilla del Monte', 14, -30.856868743896484, -64.526351928710938);
INSERT INTO public2.locations VALUES (864, 'Casa Grande', 14, -31.152841567993164, -64.473457336425781);
INSERT INTO public2.locations VALUES (865, 'Charbonier', 14, -30.774978637695312, -64.5441665649414);
INSERT INTO public2.locations VALUES (866, 'CosquÃ­n', 14, -31.243667602539062, -64.465347290039062);
INSERT INTO public2.locations VALUES (867, 'Cuesta Blanca', 14, -31.480335235595703, -64.578689575195312);
INSERT INTO public2.locations VALUES (868, 'Estancia Vieja', 14, -31.382026672363281, -64.531425476074219);
INSERT INTO public2.locations VALUES (869, 'Huerta Grande', 14, -31.075288772583008, -64.490829467773438);
INSERT INTO public2.locations VALUES (870, 'La Cumbre', 14, -30.982133865356445, -64.494194030761719);
INSERT INTO public2.locations VALUES (871, 'La Falda', 14, -31.094427108764648, -64.482948303222656);
INSERT INTO public2.locations VALUES (872, 'Las Jarillas', 14, -31.517419815063477, -64.534187316894531);
INSERT INTO public2.locations VALUES (873, 'Los Cocos', 14, -30.926464080810547, -64.5003890991211);
INSERT INTO public2.locations VALUES (874, 'MallÃ­n', 14, -31.297021865844727, -64.573257446289062);
INSERT INTO public2.locations VALUES (875, 'Mayu Sumaj', 14, -31.472270965576172, -64.541473388671875);
INSERT INTO public2.locations VALUES (876, 'San Antonio de Arredondo', 14, -31.482791900634766, -64.5278091430664);
INSERT INTO public2.locations VALUES (877, 'San Esteban', 14, -30.921140670776367, -64.536369323730469);
INSERT INTO public2.locations VALUES (878, 'San Roque', 14, -31.345298767089844, -64.451103210449219);
INSERT INTO public2.locations VALUES (879, 'Santa MarÃ­a de Punilla', 14, -31.275638580322266, -64.463630676269531);
INSERT INTO public2.locations VALUES (880, 'Tala Huasi', 14, -31.47331428527832, -64.566940307617188);
INSERT INTO public2.locations VALUES (881, 'Tanti', 14, -31.354795455932617, -64.59234619140625);
INSERT INTO public2.locations VALUES (882, 'Valle Hermoso', 14, -31.113960266113281, -64.485160827636719);
INSERT INTO public2.locations VALUES (883, 'Villa Carlos Paz', 14, -31.417917251586914, -64.494026184082031);
INSERT INTO public2.locations VALUES (884, 'Villa Flor Serrana', 14, -31.390544891357422, -64.595687866210938);
INSERT INTO public2.locations VALUES (885, 'Villa Giardino', 14, -31.050271987915039, -64.496788024902344);
INSERT INTO public2.locations VALUES (886, 'Villa La Azul', 14, -31.373409271240234, -64.483200073242188);
INSERT INTO public2.locations VALUES (887, 'Villa Parque SiquimÃ¡n', 14, -31.346454620361328, -64.482452392578125);
INSERT INTO public2.locations VALUES (888, 'Villa RÃ­o Icho Cruz', 14, -31.482675552368164, -64.564727783203125);
INSERT INTO public2.locations VALUES (889, 'Villa Santa Cruz del La', 14, -31.36638069152832, -64.5219955444336);
INSERT INTO public2.locations VALUES (890, 'Achiras', 14, -33.174446105957031, -64.9920654296875);
INSERT INTO public2.locations VALUES (891, 'Adelia MarÃ­a', 14, -33.632030487060547, -64.021675109863281);
INSERT INTO public2.locations VALUES (892, 'Alcira Gigena', 14, -32.758831024169922, -64.334030151367188);
INSERT INTO public2.locations VALUES (893, 'Alpa Corral', 14, -32.692111968994141, -64.723594665527344);
INSERT INTO public2.locations VALUES (894, 'BerrotarÃ¡n', 14, -32.452842712402344, -64.387939453125);
INSERT INTO public2.locations VALUES (895, 'Bulnes', 14, -33.505928039550781, -64.678215026855469);
INSERT INTO public2.locations VALUES (896, 'ChajÃ¡n', 14, -33.555629730224609, -65.002655029296875);
INSERT INTO public2.locations VALUES (897, 'Chucul', 14, -33.00933837890625, -64.169975280761719);
INSERT INTO public2.locations VALUES (898, 'Coronel Bairria', 14, -32.847404479980469, -64.361076354980469);
INSERT INTO public2.locations VALUES (899, 'Coronel Moldes', 14, -33.622730255126953, -64.5970458984375);
INSERT INTO public2.locations VALUES (900, 'Elena', 14, -32.570392608642578, -64.393905639648438);
INSERT INTO public2.locations VALUES (901, 'La Carolina', 14, -33.186843872070312, -64.725112915039062);
INSERT INTO public2.locations VALUES (902, 'La Cautiva', 14, -33.979644775390625, -64.083457946777344);
INSERT INTO public2.locations VALUES (903, 'La Gilda', 14, -33.208160400390625, -64.2584457397461);
INSERT INTO public2.locations VALUES (904, 'Las Acequias', 14, -33.280281066894531, -63.975376129150391);
INSERT INTO public2.locations VALUES (905, 'Las Albahacas', 14, -32.888408660888672, -64.844841003417969);
INSERT INTO public2.locations VALUES (906, 'Las Higueras', 14, -33.089805603027344, -64.285362243652344);
INSERT INTO public2.locations VALUES (907, 'Las PeÃ±as', 14, -32.534706115722656, -64.104576110839844);
INSERT INTO public2.locations VALUES (908, 'Las Vertientes', 14, -33.283443450927734, -64.577713012695312);
INSERT INTO public2.locations VALUES (909, 'Malena', 14, -33.490406036376953, -64.430877685546875);
INSERT INTO public2.locations VALUES (910, 'Monte de los Gauchos', 14, -33.639087677001953, -63.889671325683594);
INSERT INTO public2.locations VALUES (911, 'RÃ­o Cuarto', 14, -33.123836517333984, -64.349006652832031);
INSERT INTO public2.locations VALUES (912, 'Sampacho', 14, -33.3840217590332, -64.7228775024414);
INSERT INTO public2.locations VALUES (913, 'San Basilio', 14, -33.4985466003418, -64.314735412597656);
INSERT INTO public2.locations VALUES (914, 'Santa Catalina Holmberg', 14, -33.2051887512207, -64.437828063964844);
INSERT INTO public2.locations VALUES (915, 'Suco', 14, -33.439990997314453, -64.830879211425781);
INSERT INTO public2.locations VALUES (916, 'Tosquitas', 14, -33.819683074951172, -64.457672119140625);
INSERT INTO public2.locations VALUES (917, 'VicuÃ±a Mackenna', 14, -33.915641784667969, -64.389854431152344);
INSERT INTO public2.locations VALUES (918, 'Villa El Chacay', 14, -32.892555236816406, -64.867958068847656);
INSERT INTO public2.locations VALUES (919, 'Washington', 14, -33.873737335205078, -64.689590454101562);
INSERT INTO public2.locations VALUES (920, 'Atahona', 14, -30.90296745300293, -63.706329345703125);
INSERT INTO public2.locations VALUES (921, 'CaÃ±ada de Machado', 14, -31.429719924926758, -63.587726593017578);
INSERT INTO public2.locations VALUES (922, 'Capilla de los Remedios', 14, -31.43055534362793, -63.832424163818359);
INSERT INTO public2.locations VALUES (923, 'Chalacea', 14, -30.760396957397461, -63.561241149902344);
INSERT INTO public2.locations VALUES (924, 'Colonia Las Cuatro Esquinas', 14, -31.208547592163086, -63.222969055175781);
INSERT INTO public2.locations VALUES (925, 'Die de Rojas', 14, -31.028539657592773, -63.338382720947266);
INSERT INTO public2.locations VALUES (926, 'El Alcalde', 14, -31.11640739440918, -63.601615905761719);
INSERT INTO public2.locations VALUES (927, 'El CrispÃ­n', 14, -31.017606735229492, -63.605350494384766);
INSERT INTO public2.locations VALUES (928, 'Esquina', 14, -31.077911376953125, -63.79364013671875);
INSERT INTO public2.locations VALUES (929, 'KilÃ³metro 658', 14, -31.36884880065918, -63.5306282043457);
INSERT INTO public2.locations VALUES (930, 'La Para', 14, -30.894130706787109, -63.001396179199219);
INSERT INTO public2.locations VALUES (931, 'La Posta', 14, -30.565574645996094, -63.516963958740234);
INSERT INTO public2.locations VALUES (932, 'La Puerta', 14, -30.893342971801758, -63.254825592041016);
INSERT INTO public2.locations VALUES (933, 'La Quinta', 14, -31.061901092529297, -63.151325225830078);
INSERT INTO public2.locations VALUES (934, 'Las Gramillas', 14, -31.131793975830078, -63.227886199951172);
INSERT INTO public2.locations VALUES (935, 'Las Saladas', 14, -30.759601593017578, -63.204277038574219);
INSERT INTO public2.locations VALUES (936, 'Maquinista Gallini', 14, -30.908601760864258, -63.531608581542969);
INSERT INTO public2.locations VALUES (937, 'Monte del Rosario', 14, -30.982267379760742, -63.601829528808594);
INSERT INTO public2.locations VALUES (938, 'Montecristo', 14, -31.341985702514648, -63.947223663330078);
INSERT INTO public2.locations VALUES (939, 'Obispo Trejo', 14, -30.781291961669922, -63.410366058349609);
INSERT INTO public2.locations VALUES (940, 'PiquillÃ­n', 14, -31.300600051879883, -63.757671356201172);
INSERT INTO public2.locations VALUES (941, 'Plaza de Mercedes', 14, -30.978355407714844, -63.260688781738281);
INSERT INTO public2.locations VALUES (942, 'Pueblo Comechinnes', 14, -31.171487808227539, -63.605327606201172);
INSERT INTO public2.locations VALUES (943, 'RÃ­o Primero', 14, -31.333871841430664, -63.618572235107422);
INSERT INTO public2.locations VALUES (944, 'Sagrada Familia', 14, -31.289327621459961, -63.4454345703125);
INSERT INTO public2.locations VALUES (945, 'Santa Rosa de RÃ­o Primero', 14, -31.153528213500977, -63.3994140625);
INSERT INTO public2.locations VALUES (946, 'Villa Fontana', 14, -30.893707275390625, -63.117153167724609);
INSERT INTO public2.locations VALUES (947, 'Cerro Colorado', 14, -30.095582962036133, -63.932163238525391);
INSERT INTO public2.locations VALUES (948, 'ChaÃ±ar Viejo', 14, -29.998405456542969, -63.852733612060547);
INSERT INTO public2.locations VALUES (949, 'Eufrasio Loza', 14, -29.924737930297852, -63.590816497802734);
INSERT INTO public2.locations VALUES (950, 'Gutemberg', 14, -29.72089958190918, -63.515151977539062);
INSERT INTO public2.locations VALUES (951, 'La Rinconada', 14, -30.184003829956055, -62.9456672668457);
INSERT INTO public2.locations VALUES (952, 'Los Hoyos', 14, -29.802463531494141, -63.628246307373047);
INSERT INTO public2.locations VALUES (953, 'Puesto de Castro', 14, -30.270528793334961, -63.426361083984375);
INSERT INTO public2.locations VALUES (954, 'Rayo Cortado', 14, -30.0729923248291, -63.823600769042969);
INSERT INTO public2.locations VALUES (955, 'San Pedro de GÃ¼temberg', 14, -29.6983642578125, -63.560688018798828);
INSERT INTO public2.locations VALUES (956, 'Santa Elena', 14, -30.115707397460938, -63.842903137207031);
INSERT INTO public2.locations VALUES (957, 'SebastiÃ¡n Elcano', 14, -30.1604061126709, -63.592491149902344);
INSERT INTO public2.locations VALUES (958, 'Villa Candelaria', 14, -29.812910079956055, -63.355125427246094);
INSERT INTO public2.locations VALUES (959, 'Villa de MarÃ­a', 14, -29.906522750854492, -63.722560882568359);
INSERT INTO public2.locations VALUES (960, 'CalchÃ­n', 14, -31.668857574462891, -63.199043273925781);
INSERT INTO public2.locations VALUES (961, 'CalchÃ­n Oeste', 14, -31.862548828125, -63.277786254882812);
INSERT INTO public2.locations VALUES (962, 'Capilla del Carmen', 14, -31.507678985595703, -63.343143463134766);
INSERT INTO public2.locations VALUES (963, 'Carrilobo', 14, -31.873714447021484, -63.117397308349609);
INSERT INTO public2.locations VALUES (964, 'Colazo', 14, -31.964561462402344, -63.3826789855957);
INSERT INTO public2.locations VALUES (965, 'Colonia Videla', 14, -31.917276382446289, -63.503509521484375);
INSERT INTO public2.locations VALUES (966, 'Costasacate', 14, -31.645318984985352, -63.758869171142578);
INSERT INTO public2.locations VALUES (967, 'Impira', 14, -31.798473358154297, -63.650081634521484);
INSERT INTO public2.locations VALUES (968, 'Laguna Larga', 14, -31.775699615478516, -63.800327301025391);
INSERT INTO public2.locations VALUES (969, 'Las Junturas', 14, -31.831396102905273, -63.450637817382812);
INSERT INTO public2.locations VALUES (970, 'Los ChaÃ±aritos', 14, -31.402530670166016, -63.330501556396484);
INSERT INTO public2.locations VALUES (971, 'Luque', 14, -31.647726058959961, -63.3450813293457);
INSERT INTO public2.locations VALUES (972, 'Manfredi', 14, -31.845756530761719, -63.74755859375);
INSERT INTO public2.locations VALUES (973, 'Matorrales', 14, -31.714710235595703, -63.510719299316406);
INSERT INTO public2.locations VALUES (974, 'Oncativo', 14, -31.913431167602539, -63.682022094726562);
INSERT INTO public2.locations VALUES (975, 'Pilar', 14, -31.681264877319336, -63.882396697998047);
INSERT INTO public2.locations VALUES (976, 'Pozo del Molle', 14, -32.021335601806641, -62.919307708740234);
INSERT INTO public2.locations VALUES (977, 'RincÃ³n', 14, -31.595859527587891, -63.617019653320312);
INSERT INTO public2.locations VALUES (978, 'RÃ­o Segundo', 14, -31.6501522064209, -63.911861419677734);
INSERT INTO public2.locations VALUES (979, 'Santia Temple', 14, -31.385986328125, -63.419635772705078);
INSERT INTO public2.locations VALUES (980, 'Villa del Rosario', 14, -31.554100036621094, -63.535697937011719);
INSERT INTO public2.locations VALUES (981, 'Ambul', 14, -31.490541458129883, -65.053955078125);
INSERT INTO public2.locations VALUES (982, 'Arroyo Los Patos', 14, -31.762599945068359, -65.004348754882812);
INSERT INTO public2.locations VALUES (983, 'Las Calles', 14, -31.824043273925781, -64.971427917480469);
INSERT INTO public2.locations VALUES (984, 'Las Rabonas', 14, -31.853561401367188, -64.9798812866211);
INSERT INTO public2.locations VALUES (985, 'Mina Clavero', 14, -31.729427337646484, -65.004997253417969);
INSERT INTO public2.locations VALUES (986, 'Mussi', 14, -31.436262130737305, -65.066009521484375);
INSERT INTO public2.locations VALUES (987, 'Nono', 14, -31.797204971313477, -65.00250244140625);
INSERT INTO public2.locations VALUES (988, 'Panaholma', 14, -31.632953643798828, -65.0549545288086);
INSERT INTO public2.locations VALUES (989, 'San Lorenzo', 14, -31.670919418334961, -65.0177230834961);
INSERT INTO public2.locations VALUES (990, 'San MartÃ­n', 14, -31.885536193847656, -65.477470397949219);
INSERT INTO public2.locations VALUES (991, 'San Pedro', 14, -31.936473846435547, -65.218864440917969);
INSERT INTO public2.locations VALUES (992, 'San Vicente', 14, -31.850557327270508, -65.429473876953125);
INSERT INTO public2.locations VALUES (993, 'Sauce Arriba', 14, -31.912673950195312, -65.16693115234375);
INSERT INTO public2.locations VALUES (994, 'Villa Cura Brochero', 14, -31.706460952758789, -65.018608093261719);
INSERT INTO public2.locations VALUES (995, 'Villa Sarmiento', 14, -31.936241149902344, -65.193099975585938);
INSERT INTO public2.locations VALUES (996, 'Conlara', 14, -32.077354431152344, -65.229461669921875);
INSERT INTO public2.locations VALUES (997, 'La Paz', 14, -32.217525482177734, -65.048263549804688);
INSERT INTO public2.locations VALUES (998, 'La PoblaciÃ³n', 14, -32.066253662109375, -65.029617309570312);
INSERT INTO public2.locations VALUES (999, 'La TravesÃ­a', 14, -32.114555358886719, -65.043685913085938);
INSERT INTO public2.locations VALUES (1000, 'Las Tapias', 14, -31.953054428100586, -65.097969055175781);
INSERT INTO public2.locations VALUES (1001, 'Los Cerrillos', 14, -31.972700119018555, -65.44464111328125);
INSERT INTO public2.locations VALUES (1002, 'Los Hornillos', 14, -31.903343200683594, -64.989753723144531);
INSERT INTO public2.locations VALUES (1003, 'Luyaba', 14, -32.149723052978516, -65.058479309082031);
INSERT INTO public2.locations VALUES (1004, 'San Javier y Yacanto', 14, -32.026470184326172, -65.030265808105469);
INSERT INTO public2.locations VALUES (1005, 'San JosÃ©', 14, -31.956501007080078, -65.311805725097656);
INSERT INTO public2.locations VALUES (1006, 'Villa de las Rosas', 14, -31.947086334228516, -65.052116394042969);
INSERT INTO public2.locations VALUES (1007, 'Villa Dolores', 14, -31.944976806640625, -65.190238952636719);
INSERT INTO public2.locations VALUES (1008, 'Villa La ViÃ±a', 14, -31.872041702270508, -65.035469055175781);
INSERT INTO public2.locations VALUES (1009, 'Alicia', 14, -31.938846588134766, -62.4642448425293);
INSERT INTO public2.locations VALUES (1010, 'Altos de ChipiÃ³n', 14, -30.957180023193359, -62.3383674621582);
INSERT INTO public2.locations VALUES (1011, 'Arroyito', 14, -31.419229507446289, -63.050701141357422);
INSERT INTO public2.locations VALUES (1012, 'Balnearia', 14, -31.012851715087891, -62.665374755859375);
INSERT INTO public2.locations VALUES (1013, 'Brinkmann', 14, -30.866479873657227, -62.043106079101562);
INSERT INTO public2.locations VALUES (1014, 'Colonia Anita', 14, -31.119928359985352, -62.234321594238281);
INSERT INTO public2.locations VALUES (1015, 'Colonia 10 de Julio', 14, -30.525238037109375, -62.112434387207031);
INSERT INTO public2.locations VALUES (1016, 'Colonia Las Pichanas', 14, -31.245622634887695, -62.925319671630859);
INSERT INTO public2.locations VALUES (1017, 'Colonia Marina', 14, -31.248760223388672, -62.363906860351562);
INSERT INTO public2.locations VALUES (1018, 'Colonia Prosperidad', 14, -31.628704071044922, -62.365341186523438);
INSERT INTO public2.locations VALUES (1019, 'Colonia San BartolomÃ©', 14, -31.527908325195312, -62.723705291748047);
INSERT INTO public2.locations VALUES (1020, 'Colonia San Pedro', 14, -30.783090591430664, -61.917930603027344);
INSERT INTO public2.locations VALUES (1021, 'Colonia Santa MarÃ­a', 14, -31.607881546020508, -62.428504943847656);
INSERT INTO public2.locations VALUES (1022, 'Colonia Valtelina', 14, -31.05366325378418, -62.234462738037109);
INSERT INTO public2.locations VALUES (1023, 'Colonia Vignaud', 14, -30.841419219970703, -61.956615447998047);
INSERT INTO public2.locations VALUES (1024, 'Devoto', 14, -31.401782989501953, -62.306221008300781);
INSERT INTO public2.locations VALUES (1025, 'El AraÃ±ado', 14, -31.743034362792969, -62.889625549316406);
INSERT INTO public2.locations VALUES (1026, 'El FortÃ­n', 14, -31.966920852661133, -62.300174713134766);
INSERT INTO public2.locations VALUES (1027, 'El Fuertecito', 14, -31.403705596923828, -62.973701477050781);
INSERT INTO public2.locations VALUES (1028, 'El TÃ­o', 14, -31.385419845581055, -62.828197479248047);
INSERT INTO public2.locations VALUES (1029, 'EstaciÃ³n Luxardo', 14, -31.305185317993164, -62.133754730224609);
INSERT INTO public2.locations VALUES (1030, 'Colonia Iturraspe', 14, -31.207836151123047, -62.110309600830078);
INSERT INTO public2.locations VALUES (1031, 'Freyre', 14, -31.164571762084961, -62.096317291259766);
INSERT INTO public2.locations VALUES (1032, 'La Francia', 14, -31.406295776367188, -62.633216857910156);
INSERT INTO public2.locations VALUES (1033, 'La Paquita', 14, -30.909290313720703, -62.216114044189453);
INSERT INTO public2.locations VALUES (1034, 'La Tordilla', 14, -31.236537933349609, -63.061080932617188);
INSERT INTO public2.locations VALUES (1035, 'Las Varas', 14, -31.802436828613281, -62.616596221923828);
INSERT INTO public2.locations VALUES (1036, 'Las Varillas', 14, -31.870384216308594, -62.71966552734375);
INSERT INTO public2.locations VALUES (1037, 'Marull', 14, -30.993864059448242, -62.825340270996094);
INSERT INTO public2.locations VALUES (1038, 'Miramar', 14, -30.915153503417969, -62.675010681152344);
INSERT INTO public2.locations VALUES (1039, 'Morteros', 14, -30.710668563842773, -62.007236480712891);
INSERT INTO public2.locations VALUES (1040, 'Plaza Luxardo', 14, -31.301748275756836, -62.229167938232422);
INSERT INTO public2.locations VALUES (1041, 'Plaza San Francisco', 14, -31.371135711669922, -62.098190307617188);
INSERT INTO public2.locations VALUES (1042, 'PorteÃ±a', 14, -31.014049530029297, -62.062046051025391);
INSERT INTO public2.locations VALUES (1043, 'Quebracho Herrado', 14, -31.549013137817383, -62.224956512451172);
INSERT INTO public2.locations VALUES (1044, 'Sacanta', 14, -31.663398742675781, -63.0479621887207);
INSERT INTO public2.locations VALUES (1045, 'San Francisco', 14, -31.424938201904297, -62.083877563476562);
INSERT INTO public2.locations VALUES (1046, 'Saturnino MarÃ­a Laspiur', 14, -31.703481674194336, -62.483463287353516);
INSERT INTO public2.locations VALUES (1047, 'Seeber', 14, -30.925725936889648, -61.974159240722656);
INSERT INTO public2.locations VALUES (1048, 'Toro Pujio', 14, -31.108905792236328, -62.987026214599609);
INSERT INTO public2.locations VALUES (1049, 'TrÃ¡nsito', 14, -31.424343109130859, -63.193561553955078);
INSERT INTO public2.locations VALUES (1050, 'Villa ConcepciÃ³n del TÃ­o', 14, -31.322099685668945, -62.813999176025391);
INSERT INTO public2.locations VALUES (1051, 'Villa del TrÃ¡nsito', 14, -31.448179244995117, -63.194305419921875);
INSERT INTO public2.locations VALUES (1052, 'Villa San Esteban', 14, -31.63377571105957, -62.897068023681641);
INSERT INTO public2.locations VALUES (1053, 'Alta Gracia', 14, -31.649791717529297, -64.42987060546875);
INSERT INTO public2.locations VALUES (1054, 'Anisacate', 14, -31.725502014160156, -64.414070129394531);
INSERT INTO public2.locations VALUES (1055, 'Barrio Gilbert (1Âº de Mayo) - Tejas Tres', 14, -31.43971061706543, -64.3179931640625);
INSERT INTO public2.locations VALUES (1056, 'Bouwer', 14, -31.558132171630859, -64.190689086914062);
INSERT INTO public2.locations VALUES (1057, 'Caseros Centro', 14, -31.531099319458008, -64.1600112915039);
INSERT INTO public2.locations VALUES (1058, 'DespeÃ±aderos', 14, -31.814281463623047, -64.2947769165039);
INSERT INTO public2.locations VALUES (1059, 'Dique Chico', 14, -31.745849609375, -64.365814208984375);
INSERT INTO public2.locations VALUES (1060, 'Falda del CaÃ±ete', 14, -31.525411605834961, -64.450920104980469);
INSERT INTO public2.locations VALUES (1061, 'Falda del Carmen', 14, -31.585357666015625, -64.45465087890625);
INSERT INTO public2.locations VALUES (1062, 'JosÃ© de la Quintana', 14, -31.802671432495117, -64.414581298828125);
INSERT INTO public2.locations VALUES (1063, 'La Boca del RÃ­o', 14, -31.839975357055664, -64.437934875488281);
INSERT INTO public2.locations VALUES (1064, 'La Paisanita', 14, -31.720939636230469, -64.481925964355469);
INSERT INTO public2.locations VALUES (1065, 'La Rancherita y Las Cascadas', 14, -31.754829406738281, -64.459037780761719);
INSERT INTO public2.locations VALUES (1066, 'La Serranita', 14, -31.735666275024414, -64.455612182617188);
INSERT INTO public2.locations VALUES (1067, 'Los Cedros', 14, -31.526144027709961, -64.2845230102539);
INSERT INTO public2.locations VALUES (1068, 'Lozada', 14, -31.649677276611328, -64.089706420898438);
INSERT INTO public2.locations VALUES (1069, 'MalagueÃ±o', 14, -31.467399597167969, -64.359024047851562);
INSERT INTO public2.locations VALUES (1070, 'Monte Ralo', 14, -31.910722732543945, -64.239944458007812);
INSERT INTO public2.locations VALUES (1071, 'Potrero de Garay', 14, -31.780096054077148, -64.545379638671875);
INSERT INTO public2.locations VALUES (1072, 'Rafael GarcÃ­a', 14, -31.645099639892578, -64.2593994140625);
INSERT INTO public2.locations VALUES (1073, 'San Clemente', 14, -31.714515686035156, -64.628280639648438);
INSERT INTO public2.locations VALUES (1074, 'Socavones', 14, -31.533046722412109, -64.143508911132812);
INSERT INTO public2.locations VALUES (1075, 'Toledo', 14, -31.553783416748047, -64.007369995117188);
INSERT INTO public2.locations VALUES (1076, 'Valle de Anisacate', 14, -31.729955673217773, -64.420211791992188);
INSERT INTO public2.locations VALUES (1077, 'Villa Ciudad de AmÃ©rica', 14, -31.791879653930664, -64.508651733398438);
INSERT INTO public2.locations VALUES (1078, 'Villa del Prado', 14, -31.621286392211914, -64.394134521484375);
INSERT INTO public2.locations VALUES (1079, 'Villa La Bolsa', 14, -31.729660034179688, -64.429450988769531);
INSERT INTO public2.locations VALUES (1080, 'Villa Los Aromos', 14, -31.734487533569336, -64.439071655273438);
INSERT INTO public2.locations VALUES (1081, 'Villa Parque Santa Ana', 14, -31.592624664306641, -64.347084045410156);
INSERT INTO public2.locations VALUES (1082, 'Villa San Isidro', 14, -31.825925827026367, -64.383552551269531);
INSERT INTO public2.locations VALUES (1083, 'Caminiaga', 14, -30.067480087280273, -64.050704956054688);
INSERT INTO public2.locations VALUES (1084, 'ChuÃ±a Huasi', 14, -29.933708190917969, -64.112564086914062);
INSERT INTO public2.locations VALUES (1085, 'Pozo Nuevo', 14, -29.578737258911133, -64.101493835449219);
INSERT INTO public2.locations VALUES (1086, 'San Francisco del ChaÃ±ar', 14, -29.786352157592773, -63.941696166992188);
INSERT INTO public2.locations VALUES (1087, 'Almafuerte', 14, -32.192390441894531, -64.255744934082031);
INSERT INTO public2.locations VALUES (1088, 'Colonia Almada', 14, -32.035026550292969, -63.864784240722656);
INSERT INTO public2.locations VALUES (1089, 'Corralito', 14, -32.023723602294922, -64.1919937133789);
INSERT INTO public2.locations VALUES (1090, 'Dalmacio VÃ©lez', 14, -32.608600616455078, -63.583492279052734);
INSERT INTO public2.locations VALUES (1091, 'General Fotheringham', 14, -32.322414398193359, -63.868473052978516);
INSERT INTO public2.locations VALUES (1092, 'Hernando', 14, -32.427883148193359, -63.733470916748047);
INSERT INTO public2.locations VALUES (1093, 'James Craik', 14, -32.161430358886719, -63.467967987060547);
INSERT INTO public2.locations VALUES (1094, 'Las Isletillas', 14, -32.509220123291016, -63.928955078125);
INSERT INTO public2.locations VALUES (1095, 'Las Perdices', 14, -32.698955535888672, -63.704673767089844);
INSERT INTO public2.locations VALUES (1096, 'Los Zorros', 14, -32.044971466064453, -63.202239990234375);
INSERT INTO public2.locations VALUES (1097, 'Oliva', 14, -32.038257598876953, -63.570674896240234);
INSERT INTO public2.locations VALUES (1098, 'Pampayasta Norte', 14, -32.240997314453125, -63.642974853515625);
INSERT INTO public2.locations VALUES (1099, 'Pampayasta Sud', 14, -32.250503540039062, -63.651676177978516);
INSERT INTO public2.locations VALUES (1100, 'Punta del Agua', 14, -32.5758056640625, -63.810211181640625);
INSERT INTO public2.locations VALUES (1101, 'RÃ­o Tercero', 14, -32.176738739013672, -64.112960815429688);
INSERT INTO public2.locations VALUES (1102, 'Tancacha', 14, -32.237583160400391, -63.979866027832031);
INSERT INTO public2.locations VALUES (1103, 'Villa Ascasubi', 14, -32.162738800048828, -63.892421722412109);
INSERT INTO public2.locations VALUES (1104, 'Candelaria Sur', 14, -30.838968276977539, -63.80126953125);
INSERT INTO public2.locations VALUES (1105, 'CaÃ±ada de Luque', 14, -30.735237121582031, -63.723972320556641);
INSERT INTO public2.locations VALUES (1106, 'Capilla de SitÃ³n', 14, -30.573686599731445, -63.653713226318359);
INSERT INTO public2.locations VALUES (1107, 'La Pampa', 14, -30.942230224609375, -64.276931762695312);
INSERT INTO public2.locations VALUES (1108, 'Las PeÃ±as', 14, -30.563962936401367, -64.0002670288086);
INSERT INTO public2.locations VALUES (1109, 'Los Mistoles', 14, -30.626688003540039, -63.886116027832031);
INSERT INTO public2.locations VALUES (1110, 'Santa Catalina', 14, -30.870098114013672, -64.233291625976562);
INSERT INTO public2.locations VALUES (1111, 'Sarmiento', 14, -30.774471282958984, -64.109504699707031);
INSERT INTO public2.locations VALUES (1112, 'Simbolar', 14, -30.47441291809082, -63.984714508056641);
INSERT INTO public2.locations VALUES (1113, 'Sinsacate', 14, -30.942930221557617, -64.094032287597656);
INSERT INTO public2.locations VALUES (1114, 'Villa del Totoral', 14, -30.704622268676758, -64.0681381225586);
INSERT INTO public2.locations VALUES (1115, 'Churqui CaÃ±ada', 14, -30.173740386962891, -63.9268913269043);
INSERT INTO public2.locations VALUES (1116, 'El Rodeo', 14, -30.175237655639648, -63.864131927490234);
INSERT INTO public2.locations VALUES (1117, 'El Tuscal', 14, -29.764265060424805, -64.525428771972656);
INSERT INTO public2.locations VALUES (1118, 'Las Arrias', 14, -30.381746292114258, -63.596900939941406);
INSERT INTO public2.locations VALUES (1119, 'Lucio V. Mansilla', 14, -29.804523468017578, -64.711441040039062);
INSERT INTO public2.locations VALUES (1120, 'Rosario del Saladillo', 14, -30.431428909301758, -63.473941802978516);
INSERT INTO public2.locations VALUES (1121, 'San JosÃ© de la Dormida', 14, -30.356269836425781, -63.950294494628906);
INSERT INTO public2.locations VALUES (1122, 'San JosÃ© de las Salinas', 14, -30.0069522857666, -64.623939514160156);
INSERT INTO public2.locations VALUES (1123, 'San Pedro Norte', 14, -30.091081619262695, -64.1549301147461);
INSERT INTO public2.locations VALUES (1124, 'Villa Tulumba', 14, -30.395353317260742, -64.122306823730469);
INSERT INTO public2.locations VALUES (1125, 'Aldea Santa MarÃ­a', 14, -33.69921875, -62.914657592773438);
INSERT INTO public2.locations VALUES (1126, 'Alto Alegre', 14, -32.344688415527344, -62.884914398193359);
INSERT INTO public2.locations VALUES (1127, 'Ana ZumarÃ¡n', 14, -32.390953063964844, -63.057231903076172);
INSERT INTO public2.locations VALUES (1128, 'Ballesteros', 14, -32.541698455810547, -62.980812072753906);
INSERT INTO public2.locations VALUES (1129, 'Ballesteros Sud', 14, -32.5894775390625, -63.030220031738281);
INSERT INTO public2.locations VALUES (1130, 'Bell Ville', 14, -32.630313873291016, -62.688793182373047);
INSERT INTO public2.locations VALUES (1131, 'BenjamÃ­n uld', 14, -33.58746337890625, -62.728134155273438);
INSERT INTO public2.locations VALUES (1132, 'Canals', 14, -33.562171936035156, -62.885086059570312);
INSERT INTO public2.locations VALUES (1133, 'Chilibroste', 14, -32.332691192626953, -62.510795593261719);
INSERT INTO public2.locations VALUES (1134, 'Cintra', 14, -32.306331634521484, -62.651607513427734);
INSERT INTO public2.locations VALUES (1135, 'Colonia Bismarck', 14, -33.301235198974609, -62.712646484375);
INSERT INTO public2.locations VALUES (1136, 'Colonia Bremen', 14, -33.464256286621094, -62.731178283691406);
INSERT INTO public2.locations VALUES (1137, 'Idiazabal', 14, -32.812534332275391, -63.032398223876953);
INSERT INTO public2.locations VALUES (1138, 'Justiniano Posse', 14, -32.883449554443359, -62.679615020751953);
INSERT INTO public2.locations VALUES (1139, 'Laborde', 14, -33.154838562011719, -62.857475280761719);
INSERT INTO public2.locations VALUES (1140, 'Monte LeÃ±a', 14, -32.611282348632812, -62.589744567871094);
INSERT INTO public2.locations VALUES (1141, 'Monte MaÃ­z', 14, -33.204246520996094, -62.600482940673828);
INSERT INTO public2.locations VALUES (1142, 'Morrison', 14, -32.592864990234375, -62.833339691162109);
INSERT INTO public2.locations VALUES (1143, 'Noetinger', 14, -32.366024017333984, -62.307174682617188);
INSERT INTO public2.locations VALUES (1144, 'OrdoÃ±ez', 14, -32.841007232666016, -62.865985870361328);
INSERT INTO public2.locations VALUES (1145, 'Pascanas', 14, -33.124698638916016, -63.040122985839844);
INSERT INTO public2.locations VALUES (1146, 'Pueblo Italiano', 14, -33.882411956787109, -62.840499877929688);
INSERT INTO public2.locations VALUES (1147, 'RamÃ³n J. CÃ¡rcano', 14, -32.491157531738281, -63.104232788085938);
INSERT INTO public2.locations VALUES (1148, 'San Antonio de LitÃ­n', 14, -32.213581085205078, -62.631328582763672);
INSERT INTO public2.locations VALUES (1149, 'San Marcos', 14, -32.6302375793457, -62.484249114990234);
INSERT INTO public2.locations VALUES (1150, 'San Severo', 14, -33.538654327392578, -63.0474739074707);
INSERT INTO public2.locations VALUES (1151, 'Viamonte', 14, -33.746051788330078, -63.097282409667969);
INSERT INTO public2.locations VALUES (1152, 'Villa Los Patos', 14, -32.766838073730469, -62.727134704589844);
INSERT INTO public2.locations VALUES (1153, 'Wenceslao Escalante', 14, -33.171676635742188, -62.769416809082031);
INSERT INTO public2.locations VALUES (1154, 'Bella Vista', 18, -28.507682800292969, -59.045215606689453);
INSERT INTO public2.locations VALUES (1155, 'BerÃ³n de Astrada', 18, -27.55021858215332, -57.528415679931641);
INSERT INTO public2.locations VALUES (1156, 'YahapÃ©', 18, -27.37144660949707, -57.655036926269531);
INSERT INTO public2.locations VALUES (1157, 'Corrientes', 18, -27.463344573974609, -58.839473724365234);
INSERT INTO public2.locations VALUES (1158, 'Riachuelo', 18, -27.580434799194336, -58.743118286132812);
INSERT INTO public2.locations VALUES (1159, 'San Cayetano', 18, -27.571208953857422, -58.695877075195312);
INSERT INTO public2.locations VALUES (1160, 'ConcepciÃ³n', 18, -28.393199920654297, -57.886917114257812);
INSERT INTO public2.locations VALUES (1161, 'Santa Rosa', 18, -28.267278671264648, -58.122722625732422);
INSERT INTO public2.locations VALUES (1162, 'Tabay', 18, -28.308135986328125, -58.286865234375);
INSERT INTO public2.locations VALUES (1163, 'Tatacua', 18, -28.375919342041016, -58.321136474609375);
INSERT INTO public2.locations VALUES (1164, 'Cazadores Correntinos', 18, -29.982379913330078, -58.304241180419922);
INSERT INTO public2.locations VALUES (1165, 'CuruzÃº CuatiÃ¡', 18, -29.791450500488281, -58.049858093261719);
INSERT INTO public2.locations VALUES (1166, 'PerurrÃ­a', 18, -29.340847015380859, -58.608203887939453);
INSERT INTO public2.locations VALUES (1167, 'El Sombrero', 18, -27.703542709350586, -58.768604278564453);
INSERT INTO public2.locations VALUES (1168, 'Empedrado', 18, -27.950702667236328, -58.803096771240234);
INSERT INTO public2.locations VALUES (1169, 'Esquina', 18, -30.014606475830078, -59.529518127441406);
INSERT INTO public2.locations VALUES (1170, 'Pueblo Libertador', 18, -30.22010612487793, -59.3897590637207);
INSERT INTO public2.locations VALUES (1171, 'Alvear', 18, -29.098838806152344, -56.553436279296875);
INSERT INTO public2.locations VALUES (1172, 'EstaciÃ³n Torrent', 18, -28.824361801147461, -56.469215393066406);
INSERT INTO public2.locations VALUES (1173, 'ItÃ¡ IbatÃ©', 18, -27.425876617431641, -57.338127136230469);
INSERT INTO public2.locations VALUES (1174, 'Lomas de Vallejos', 18, -27.737884521484375, -57.919895172119141);
INSERT INTO public2.locations VALUES (1175, 'Nuestra SeÃ±ora del Rosario de CaÃ¡ CatÃ­', 18, -27.752151489257812, -57.621997833251953);
INSERT INTO public2.locations VALUES (1176, 'Palmar Grande', 18, -27.941267013549805, -57.900959014892578);
INSERT INTO public2.locations VALUES (1177, 'Carolina', 18, -29.150276184082031, -59.181793212890625);
INSERT INTO public2.locations VALUES (1178, 'ya', 18, -29.14007568359375, -59.259891510009766);
INSERT INTO public2.locations VALUES (1179, 'ItatÃ­', 18, -27.269216537475586, -58.2424201965332);
INSERT INTO public2.locations VALUES (1180, 'Ramada Paso', 18, -27.366184234619141, -58.299625396728516);
INSERT INTO public2.locations VALUES (1181, 'Colonia Liebig''s', 18, -27.913358688354492, -55.824237823486328);
INSERT INTO public2.locations VALUES (1182, 'ItuzaingÃ³', 18, -27.585100173950195, -56.687046051025391);
INSERT INTO public2.locations VALUES (1183, 'San Antonio', 18, -27.508228302001953, -56.745235443115234);
INSERT INTO public2.locations VALUES (1184, 'San Carlos', 18, -27.743621826171875, -55.898429870605469);
INSERT INTO public2.locations VALUES (1185, 'Villa Olivari', 18, -27.633100509643555, -56.906307220458984);
INSERT INTO public2.locations VALUES (1186, 'Cruz de los Milagros', 18, -28.836124420166016, -59.006004333496094);
INSERT INTO public2.locations VALUES (1187, 'bernador Juan E. MartÃ­nez', 18, -28.912338256835938, -58.936103820800781);
INSERT INTO public2.locations VALUES (1188, 'Lavalle', 18, -29.023330688476562, -59.179153442382812);
INSERT INTO public2.locations VALUES (1189, 'Santa LucÃ­a', 18, -28.989852905273438, -59.100761413574219);
INSERT INTO public2.locations VALUES (1190, 'Villa CÃ³rdoba', 18, -28.991657257080078, -59.075187683105469);
INSERT INTO public2.locations VALUES (1191, 'Yatayti Calle', 18, -29.028312683105469, -58.9122314453125);
INSERT INTO public2.locations VALUES (1192, 'MburucuyÃ¡', 18, -28.046857833862305, -58.230304718017578);
INSERT INTO public2.locations VALUES (1193, 'Felipe YofrÃ©', 18, -29.106830596923828, -58.339630126953125);
INSERT INTO public2.locations VALUES (1194, 'Mariano I. Loza', 18, -29.376873016357422, -58.192234039306641);
INSERT INTO public2.locations VALUES (1195, 'Mercedes', 18, -29.1846923828125, -58.073532104492188);
INSERT INTO public2.locations VALUES (1196, 'Colonia Libertad', 18, -30.043302536010742, -57.821708679199219);
INSERT INTO public2.locations VALUES (1197, 'EstaciÃ³n Libertad', 18, -30.013296127319336, -57.859333038330078);
INSERT INTO public2.locations VALUES (1198, 'Juan Pujol', 18, -30.419321060180664, -57.855892181396484);
INSERT INTO public2.locations VALUES (1199, 'MocoretÃ¡', 18, -30.616676330566406, -57.975360870361328);
INSERT INTO public2.locations VALUES (1200, 'Monte Caseros', 18, -30.249422073364258, -57.629482269287109);
INSERT INTO public2.locations VALUES (1201, 'Parada AcuÃ±a', 18, -29.908842086791992, -57.958866119384766);
INSERT INTO public2.locations VALUES (1202, 'Parada Labougle', 18, -30.319013595581055, -57.729686737060547);
INSERT INTO public2.locations VALUES (1203, 'Bonpland', 18, -29.817472457885742, -57.427833557128906);
INSERT INTO public2.locations VALUES (1204, 'Parada Pucheta', 18, -29.906040191650391, -57.574169158935547);
INSERT INTO public2.locations VALUES (1205, 'Paso de los Libres', 18, -29.713714599609375, -57.085407257080078);
INSERT INTO public2.locations VALUES (1206, 'TapebicuÃ¡', 18, -29.50682258605957, -56.974849700927734);
INSERT INTO public2.locations VALUES (1207, 'Saladas', 18, -28.255067825317383, -58.623725891113281);
INSERT INTO public2.locations VALUES (1208, 'San Lorenzo', 18, -28.138099670410156, -58.768131256103516);
INSERT INTO public2.locations VALUES (1209, 'Ingenio Primer Correntino', 18, -27.433645248413086, -58.624309539794922);
INSERT INTO public2.locations VALUES (1210, 'Paso de la Patria', 18, -27.317375183105469, -58.572563171386719);
INSERT INTO public2.locations VALUES (1211, 'San Cosme', 18, -27.370372772216797, -58.51251220703125);
INSERT INTO public2.locations VALUES (1212, 'Santa Ana', 18, -27.455354690551758, -58.654758453369141);
INSERT INTO public2.locations VALUES (1213, 'San Luis del Palmar', 18, -27.507698059082031, -58.556148529052734);
INSERT INTO public2.locations VALUES (1214, 'Colonia Carlos Pellegrini', 18, -28.537235260009766, -57.171348571777344);
INSERT INTO public2.locations VALUES (1215, 'GuaviravÃ­', 18, -29.367258071899414, -56.829730987548828);
INSERT INTO public2.locations VALUES (1216, 'La Cruz', 18, -29.178628921508789, -56.6382942199707);
INSERT INTO public2.locations VALUES (1217, 'YapeyÃº', 18, -29.470897674560547, -56.815067291259766);
INSERT INTO public2.locations VALUES (1218, 'Loreto', 18, -27.7684268951416, -57.275253295898438);
INSERT INTO public2.locations VALUES (1219, 'San Miguel', 18, -27.998325347900391, -57.587310791015625);
INSERT INTO public2.locations VALUES (1220, 'ChavarrÃ­a', 18, -28.955255508422852, -58.5717658996582);
INSERT INTO public2.locations VALUES (1221, 'Colonia Pando', 18, -28.5237979888916, -58.487586975097656);
INSERT INTO public2.locations VALUES (1222, '9 de Julio', 18, -28.840776443481445, -58.830085754394531);
INSERT INTO public2.locations VALUES (1223, 'Pedro R. FernÃ¡ndez', 18, -28.746339797973633, -58.654136657714844);
INSERT INTO public2.locations VALUES (1224, 'San Roque', 18, -28.569303512573242, -58.705135345458984);
INSERT INTO public2.locations VALUES (1225, 'JosÃ© Rafael GÃ³mez', 18, -28.230318069458008, -55.784408569335938);
INSERT INTO public2.locations VALUES (1226, 'Garruchos', 18, -28.173740386962891, -55.6506462097168);
INSERT INTO public2.locations VALUES (1227, 'bernador Igr. ValentÃ­n Virasoro', 18, -28.046808242797852, -56.0096321105957);
INSERT INTO public2.locations VALUES (1228, 'Santo TomÃ©', 18, -28.549816131591797, -56.034812927246094);
INSERT INTO public2.locations VALUES (1229, 'Sauce', 18, -30.085535049438477, -58.787281036376953);
INSERT INTO public2.locations VALUES (1230, 'ConcepciÃ³n del Bermejo', 22, -26.600330352783203, -60.9461784362793);
INSERT INTO public2.locations VALUES (1231, 'Los Frentones', 22, -26.407068252563477, -61.412879943847656);
INSERT INTO public2.locations VALUES (1232, 'Pampa del Infierno', 22, -26.503559112548828, -61.176570892333984);
INSERT INTO public2.locations VALUES (1233, 'RÃ­o Muerto', 22, -26.307126998901367, -61.655757904052734);
INSERT INTO public2.locations VALUES (1234, 'Taco Pozo', 22, -25.615036010742188, -63.264858245849609);
INSERT INTO public2.locations VALUES (1235, 'General Vedia', 22, -26.937934875488281, -58.661972045898438);
INSERT INTO public2.locations VALUES (1236, 'Isla del Cerrito', 22, -27.2914981842041, -58.619430541992188);
INSERT INTO public2.locations VALUES (1237, 'La Leonesa', 22, -27.038148880004883, -58.707248687744141);
INSERT INTO public2.locations VALUES (1238, 'Las Palmas', 22, -27.048751831054688, -58.682395935058594);
INSERT INTO public2.locations VALUES (1239, 'Puerto Bermejo Nuevo', 22, -26.907785415649414, -58.541702270507812);
INSERT INTO public2.locations VALUES (1240, 'Puerto Bermejo Viejo', 22, -26.926937103271484, -58.509117126464844);
INSERT INTO public2.locations VALUES (1241, 'Puerto Eva PerÃ³n', 22, -26.663700103759766, -58.632396697998047);
INSERT INTO public2.locations VALUES (1242, 'Presidencia Roque SÃ¡enz PeÃ±a', 22, -26.790971755981445, -60.441249847412109);
INSERT INTO public2.locations VALUES (1243, 'Charata', 22, -27.217922210693359, -61.187347412109375);
INSERT INTO public2.locations VALUES (1244, 'Gancedo', 22, -27.487415313720703, -61.67669677734375);
INSERT INTO public2.locations VALUES (1245, 'General Capdevila', 22, -27.422571182250977, -61.476142883300781);
INSERT INTO public2.locations VALUES (1246, 'General Pinedo', 22, -27.325386047363281, -61.280998229980469);
INSERT INTO public2.locations VALUES (1247, 'MesÃ³n de Fierro', 22, -27.429813385009766, -61.017097473144531);
INSERT INTO public2.locations VALUES (1248, 'Pampa Landriel', 22, -27.394683837890625, -61.102561950683594);
INSERT INTO public2.locations VALUES (1249, 'Hermoso Campo', 22, -27.610015869140625, -61.344234466552734);
INSERT INTO public2.locations VALUES (1250, 'ItÃ­n', 22, -27.4874324798584, -61.324481964111328);
INSERT INTO public2.locations VALUES (1251, 'Chorotis', 22, -27.914644241333008, -61.401397705078125);
INSERT INTO public2.locations VALUES (1252, 'Santa Sylvina', 22, -27.831611633300781, -61.136001586914062);
INSERT INTO public2.locations VALUES (1253, 'Venados Grandes', 22, -27.816347122192383, -61.382884979248047);
INSERT INTO public2.locations VALUES (1254, 'Corzuela', 22, -26.95130729675293, -60.9703369140625);
INSERT INTO public2.locations VALUES (1255, 'La Escondida', 22, -27.105348587036133, -59.446376800537109);
INSERT INTO public2.locations VALUES (1256, 'La Verde', 22, -27.13041877746582, -59.376197814941406);
INSERT INTO public2.locations VALUES (1257, 'Lapachito', 22, -27.159332275390625, -59.385414123535156);
INSERT INTO public2.locations VALUES (1258, 'MakallÃ©', 22, -27.205785751342773, -59.287086486816406);
INSERT INTO public2.locations VALUES (1259, 'El Espinillo', 22, -25.408798217773438, -60.447784423828125);
INSERT INTO public2.locations VALUES (1260, 'El Sauzal', 22, -24.578514099121094, -61.534954071044922);
INSERT INTO public2.locations VALUES (1261, 'El Sauzalito', 22, -24.4279727935791, -61.683231353759766);
INSERT INTO public2.locations VALUES (1262, 'FortÃ­n Lavalle', 22, -25.704490661621094, -60.201484680175781);
INSERT INTO public2.locations VALUES (1263, 'Fuerte Esperanza', 22, -25.160514831542969, -61.841373443603516);
INSERT INTO public2.locations VALUES (1264, 'Juan JosÃ© Castelli', 22, -25.946578979492188, -60.620067596435547);
INSERT INTO public2.locations VALUES (1265, 'Miraflores', 22, -25.649425506591797, -60.9301872253418);
INSERT INTO public2.locations VALUES (1266, 'Nueva Pompeya', 22, -24.933074951171875, -61.483146667480469);
INSERT INTO public2.locations VALUES (1267, 'Villa RÃ­o Bermejito', 22, -25.637554168701172, -60.265438079833984);
INSERT INTO public2.locations VALUES (1268, 'Wichi', 22, -24.690328598022461, -61.426132202148438);
INSERT INTO public2.locations VALUES (1269, 'Zaparinqui', 22, -26.065792083740234, -60.561927795410156);
INSERT INTO public2.locations VALUES (1270, 'Avia Terai', 22, -26.6866512298584, -60.728031158447266);
INSERT INTO public2.locations VALUES (1271, 'Campo Lar', 22, -26.800310134887695, -60.839015960693359);
INSERT INTO public2.locations VALUES (1272, 'FortÃ­n Las ChuÃ±as', 22, -26.884353637695312, -60.909561157226562);
INSERT INTO public2.locations VALUES (1273, 'Napenay', 22, -26.729587554931641, -60.616775512695312);
INSERT INTO public2.locations VALUES (1274, 'Colonia Popular', 22, -27.275192260742188, -59.151473999023438);
INSERT INTO public2.locations VALUES (1275, 'EstaciÃ³n General Obligado', 22, -27.4116268157959, -59.419345855712891);
INSERT INTO public2.locations VALUES (1276, 'Laguna Blanca', 22, -27.255430221557617, -59.233016967773438);
INSERT INTO public2.locations VALUES (1277, 'Puerto Tirol', 22, -27.374040603637695, -59.089275360107422);
INSERT INTO public2.locations VALUES (1278, 'Ciervo Petiso', 22, -26.580142974853516, -59.630035400390625);
INSERT INTO public2.locations VALUES (1279, 'General JosÃ© de San MartÃ­n', 22, -26.53630256652832, -59.3413200378418);
INSERT INTO public2.locations VALUES (1280, 'La Eduvigis', 22, -26.836462020874023, -59.062320709228516);
INSERT INTO public2.locations VALUES (1281, 'Laguna Limpia', 22, -26.495840072631836, -59.680355072021484);
INSERT INTO public2.locations VALUES (1282, 'Pampa AlmirÃ³n', 22, -26.701148986816406, -59.124046325683594);
INSERT INTO public2.locations VALUES (1283, 'Pampa del Indio', 22, -26.04902458190918, -59.942752838134766);
INSERT INTO public2.locations VALUES (1284, 'Presidencia Roca', 22, -26.143714904785156, -59.595027923583984);
INSERT INTO public2.locations VALUES (1285, 'Selvas del RÃ­o de Oro', 22, -26.802352905273438, -58.957027435302734);
INSERT INTO public2.locations VALUES (1286, 'Tres Isletas', 22, -26.340324401855469, -60.4312629699707);
INSERT INTO public2.locations VALUES (1287, 'Coronel Du Graty', 22, -27.682212829589844, -60.904342651367188);
INSERT INTO public2.locations VALUES (1288, 'Enrique Urien', 22, -27.556673049926758, -60.5269660949707);
INSERT INTO public2.locations VALUES (1289, 'Villa Angela', 22, -27.576877593994141, -60.711124420166016);
INSERT INTO public2.locations VALUES (1290, 'Las BreÃ±as', 22, -27.08643913269043, -61.085823059082031);
INSERT INTO public2.locations VALUES (1291, 'La Clotilde', 22, -27.177337646484375, -60.632671356201172);
INSERT INTO public2.locations VALUES (1292, 'La Tigra', 22, -27.114231109619141, -60.5876579284668);
INSERT INTO public2.locations VALUES (1293, 'San Bernardo', 22, -27.286718368530273, -60.712848663330078);
INSERT INTO public2.locations VALUES (1294, 'Presidencia de la Plaza', 22, -26.99864387512207, -59.846378326416016);
INSERT INTO public2.locations VALUES (1295, 'Barrio de los Pescadores', 22, -27.4610595703125, -58.867572784423828);
INSERT INTO public2.locations VALUES (1296, 'Colonia BenÃ­tez', 22, -27.332601547241211, -58.946388244628906);
INSERT INTO public2.locations VALUES (1297, 'Margarita BelÃ©n', 22, -27.259056091308594, -58.970554351806641);
INSERT INTO public2.locations VALUES (1298, 'Quitilipi', 22, -26.870790481567383, -60.2151985168457);
INSERT INTO public2.locations VALUES (1299, 'Villa El Palmar', 22, -26.454504013061523, -60.164405822753906);
INSERT INTO public2.locations VALUES (1300, 'Barranqueras', 22, -27.485105514526367, -58.930736541748047);
INSERT INTO public2.locations VALUES (1301, 'Basail', 22, -27.887603759765625, -59.281471252441406);
INSERT INTO public2.locations VALUES (1302, 'Colonia Baranda', 22, -27.55970573425293, -59.307926177978516);
INSERT INTO public2.locations VALUES (1303, 'Fontana', 22, -27.420236587524414, -59.037391662597656);
INSERT INTO public2.locations VALUES (1304, 'Puerto Vilelas', 22, -27.510839462280273, -58.941715240478516);
INSERT INTO public2.locations VALUES (1305, 'Resistencia', 22, -27.451076507568359, -58.986484527587891);
INSERT INTO public2.locations VALUES (1306, 'SamuhÃº', 22, -27.519107818603516, -60.394027709960938);
INSERT INTO public2.locations VALUES (1307, 'Villa Berthet', 22, -27.285322189331055, -60.415973663330078);
INSERT INTO public2.locations VALUES (1308, 'CapitÃ¡n Solari', 22, -26.802387237548828, -59.557083129882812);
INSERT INTO public2.locations VALUES (1309, 'Colonia Elisa', 22, -26.9316349029541, -59.5188102722168);
INSERT INTO public2.locations VALUES (1310, 'Colonias Unidas', 22, -26.698348999023438, -59.632209777832031);
INSERT INTO public2.locations VALUES (1311, 'Ingeniero Barbet', 22, -27.002424240112305, -59.482624053955078);
INSERT INTO public2.locations VALUES (1312, 'Las Garcitas', 22, -26.618068695068359, -59.799041748046875);
INSERT INTO public2.locations VALUES (1313, 'Charadai', 22, -27.652364730834961, -59.8603515625);
INSERT INTO public2.locations VALUES (1314, 'Cote Lai', 22, -27.531429290771484, -59.575050354003906);
INSERT INTO public2.locations VALUES (1315, 'Haumonia', 22, -27.507638931274414, -60.178199768066406);
INSERT INTO public2.locations VALUES (1316, 'Horquilla', 22, -27.542387008666992, -59.955783843994141);
INSERT INTO public2.locations VALUES (1317, 'La Sabana', 22, -27.871450424194336, -59.936859130859375);
INSERT INTO public2.locations VALUES (1318, 'Colonia Aborigen', 22, -26.955888748168945, -60.202873229980469);
INSERT INTO public2.locations VALUES (1319, 'Machagai', 22, -26.92613410949707, -60.048419952392578);
INSERT INTO public2.locations VALUES (1320, 'NapalpÃ­', 22, -26.902500152587891, -60.129806518554688);
INSERT INTO public2.locations VALUES (1321, 'Arroyo Verde', 26, -41.996303558349609, -65.293174743652344);
INSERT INTO public2.locations VALUES (1322, 'Puerto Madryn', 26, -42.767280578613281, -65.036674499511719);
INSERT INTO public2.locations VALUES (1323, 'Puerto PirÃ¡mides', 26, -42.572090148925781, -64.284164428710938);
INSERT INTO public2.locations VALUES (1324, 'Quintas El Mirador', 26, -42.813968658447266, -65.0395278930664);
INSERT INTO public2.locations VALUES (1325, 'Reserva Area Protegida El Doradillo', 26, -42.644504547119141, -65.0400390625);
INSERT INTO public2.locations VALUES (1326, 'Buenos Aires Chico', 26, -42.066967010498047, -71.214813232421875);
INSERT INTO public2.locations VALUES (1327, 'Cholila', 26, -42.5113525390625, -71.431137084960938);
INSERT INTO public2.locations VALUES (1328, 'Costa del Chubut', 26, -42.603935241699219, -70.45703125);
INSERT INTO public2.locations VALUES (1329, 'Cushamen Centro', 26, -42.173019409179688, -70.6613998413086);
INSERT INTO public2.locations VALUES (1330, 'El Hoyo', 26, -42.064048767089844, -71.5191421508789);
INSERT INTO public2.locations VALUES (1331, 'El MaitÃ©n', 26, -42.050319671630859, -71.16778564453125);
INSERT INTO public2.locations VALUES (1332, 'EpuyÃ©n', 26, -42.229225158691406, -71.371063232421875);
INSERT INTO public2.locations VALUES (1333, 'Fofo Cahuel', 26, -42.408210754394531, -70.530715942382812);
INSERT INTO public2.locations VALUES (1334, 'Gualjaina', 26, -42.723831176757812, -70.5377197265625);
INSERT INTO public2.locations VALUES (1335, 'La EpuyÃ©n', 26, -42.216892242431641, -71.429672241210938);
INSERT INTO public2.locations VALUES (1336, 'La Puelo', 26, -42.060131072998047, -71.597137451171875);
INSERT INTO public2.locations VALUES (1337, 'Leleque', 26, -42.412948608398438, -71.071151733398438);
INSERT INTO public2.locations VALUES (1338, 'Astra', 26, -45.732040405273438, -67.491996765136719);
INSERT INTO public2.locations VALUES (1339, 'BahÃ­a Bustamante', 26, -45.128303527832031, -66.5366439819336);
INSERT INTO public2.locations VALUES (1340, 'Comodoro Rivadavia', 26, -45.86541748046875, -67.482162475585938);
INSERT INTO public2.locations VALUES (1341, 'Diadema Argentina', 26, -45.77496337890625, -67.674774169921875);
INSERT INTO public2.locations VALUES (1342, 'Rada Tilly', 26, -45.924964904785156, -67.553726196289062);
INSERT INTO public2.locations VALUES (1343, 'Camarones', 26, -44.798454284667969, -65.710334777832031);
INSERT INTO public2.locations VALUES (1344, 'Garayalde', 26, -44.686843872070312, -66.620941162109375);
INSERT INTO public2.locations VALUES (1345, 'Aldea Escolar (Los RÃ¡pidos)', 26, -43.133018493652344, -71.550979614257812);
INSERT INTO public2.locations VALUES (1346, 'Corcovado', 26, -43.539302825927734, -71.468856811523438);
INSERT INTO public2.locations VALUES (1347, 'Esquel', 26, -42.917320251464844, -71.321571350097656);
INSERT INTO public2.locations VALUES (1348, 'La Rosario', 26, -43.247161865234375, -71.348945617675781);
INSERT INTO public2.locations VALUES (1349, 'Los Cipreses', 26, -43.183357238769531, -71.6416015625);
INSERT INTO public2.locations VALUES (1350, 'TrevelÃ­n', 26, -43.07916259765625, -71.464035034179688);
INSERT INTO public2.locations VALUES (1351, 'Villa Futalaufquen', 26, -42.893848419189453, -71.61749267578125);
INSERT INTO public2.locations VALUES (1352, 'Dique Florentino Ameghino', 26, -43.699069976806641, -66.471328735351562);
INSERT INTO public2.locations VALUES (1353, 'Dolavon', 26, -43.307979583740234, -65.709869384765625);
INSERT INTO public2.locations VALUES (1354, 'Gaiman', 26, -43.291618347167969, -65.498367309570312);
INSERT INTO public2.locations VALUES (1355, '28 de Julio', 26, -43.38922119140625, -65.840423583984375);
INSERT INTO public2.locations VALUES (1356, 'Blancuntre', 26, -42.620059967041016, -68.904304504394531);
INSERT INTO public2.locations VALUES (1357, 'El Escorial', 26, -43.089763641357422, -68.539871215820312);
INSERT INTO public2.locations VALUES (1358, 'Gastre', 26, -42.263198852539062, -69.2221450805664);
INSERT INTO public2.locations VALUES (1359, 'Lagunita Salada', 26, -42.742233276367188, -69.149002075195312);
INSERT INTO public2.locations VALUES (1360, 'Yala Laubat', 26, -42.7591438293457, -68.8675537109375);
INSERT INTO public2.locations VALUES (1361, 'Aldea Epulef', 26, -43.320823669433594, -69.692291259765625);
INSERT INTO public2.locations VALUES (1362, 'CarrenleufÃº', 26, -43.587898254394531, -71.702133178710938);
INSERT INTO public2.locations VALUES (1363, 'Colan ConhuÃ©', 26, -43.241371154785156, -69.930335998535156);
INSERT INTO public2.locations VALUES (1364, 'Paso del Sapo', 26, -42.735115051269531, -69.608154296875);
INSERT INTO public2.locations VALUES (1365, 'Tecka', 26, -43.492866516113281, -70.810783386230469);
INSERT INTO public2.locations VALUES (1366, 'El Mirasol', 26, -43.283657073974609, -67.761428833007812);
INSERT INTO public2.locations VALUES (1367, 'Las Plumas', 26, -43.721626281738281, -67.28424072265625);
INSERT INTO public2.locations VALUES (1368, 'Cerro CÃ³ndor', 26, -43.419784545898438, -69.164268493652344);
INSERT INTO public2.locations VALUES (1369, 'Los Altares', 26, -43.886116027832031, -68.4116439819336);
INSERT INTO public2.locations VALUES (1370, 'Paso de Indios', 26, -43.864387512207031, -69.046585083007812);
INSERT INTO public2.locations VALUES (1371, 'Playa Magagna', 26, -43.3819465637207, -65.045501708984375);
INSERT INTO public2.locations VALUES (1372, 'Playa UniÃ³n', 26, -43.321659088134766, -65.047882080078125);
INSERT INTO public2.locations VALUES (1373, 'Rawson', 26, -43.305225372314453, -65.10369873046875);
INSERT INTO public2.locations VALUES (1374, 'Trelew', 26, -43.2531852722168, -65.309379577636719);
INSERT INTO public2.locations VALUES (1375, 'Aldea Apeleg', 26, -44.687641143798828, -70.852912902832031);
INSERT INTO public2.locations VALUES (1376, 'Aldea Beleiro', 26, -45.553268432617188, -71.522636413574219);
INSERT INTO public2.locations VALUES (1377, 'Alto RÃ­o Senguer', 26, -45.0418815612793, -70.8233871459961);
INSERT INTO public2.locations VALUES (1378, 'Doctor Ricardo Rojas', 26, -45.575664520263672, -71.035049438476562);
INSERT INTO public2.locations VALUES (1379, 'Facundo', 26, -45.308643341064453, -69.974861145019531);
INSERT INTO public2.locations VALUES (1380, 'La Blanco', 26, -45.936985015869141, -71.268241882324219);
INSERT INTO public2.locations VALUES (1381, 'RÃ­o Mayo', 26, -45.686176300048828, -70.256637573242188);
INSERT INTO public2.locations VALUES (1382, 'Buen Pasto', 26, -45.076133728027344, -69.458900451660156);
INSERT INTO public2.locations VALUES (1383, 'Sarmiento', 26, -45.586868286132812, -69.068939208984375);
INSERT INTO public2.locations VALUES (1384, 'Doctor Oscar Atilio Viglione (Frontera de RÃ­o Pico)', 26, -44.191368103027344, -71.664222717285156);
INSERT INTO public2.locations VALUES (1385, 'bernador Costa', 26, -44.0487060546875, -70.5990219116211);
INSERT INTO public2.locations VALUES (1386, 'JosÃ© de San MartÃ­n', 26, -44.051464080810547, -70.470741271972656);
INSERT INTO public2.locations VALUES (1387, 'RÃ­o Pico', 26, -44.179355621337891, -71.368316650390625);
INSERT INTO public2.locations VALUES (1388, 'Gan Gan', 26, -42.522201538085938, -68.284133911132812);
INSERT INTO public2.locations VALUES (1389, 'Telsen', 26, -42.435531616210938, -66.9432144165039);
INSERT INTO public2.locations VALUES (1390, 'Arroyo BarÃº', 30, -31.867290496826172, -58.448307037353516);
INSERT INTO public2.locations VALUES (1391, 'ColÃ³n', 30, -32.225051879882812, -58.142269134521484);
INSERT INTO public2.locations VALUES (1392, 'Colonia Hugues', 30, -32.295700073242188, -58.233707427978516);
INSERT INTO public2.locations VALUES (1393, 'Hambis', 30, -31.963630676269531, -58.507728576660156);
INSERT INTO public2.locations VALUES (1394, 'Hocker', 30, -32.088314056396484, -58.3394889831543);
INSERT INTO public2.locations VALUES (1395, 'La Clarita', 30, -31.975751876831055, -58.392433166503906);
INSERT INTO public2.locations VALUES (1396, 'Pueblo Cazes', 30, -32.003150939941406, -58.490795135498047);
INSERT INTO public2.locations VALUES (1397, 'Pueblo Liebig''s', 30, -32.154190063476562, -58.19207763671875);
INSERT INTO public2.locations VALUES (1398, 'San JosÃ©', 30, -32.207717895507812, -58.218799591064453);
INSERT INTO public2.locations VALUES (1399, 'Ubajay', 30, -31.795177459716797, -58.3150634765625);
INSERT INTO public2.locations VALUES (1400, 'Villa Elisa', 30, -32.1632194519043, -58.400531768798828);
INSERT INTO public2.locations VALUES (1401, 'Calabacilla', 30, -31.507003784179688, -58.1330451965332);
INSERT INTO public2.locations VALUES (1402, 'Clodomiro Ledesma', 30, -31.576667785644531, -58.180332183837891);
INSERT INTO public2.locations VALUES (1403, 'Colonia AyuÃ­', 30, -31.207719802856445, -58.031242370605469);
INSERT INTO public2.locations VALUES (1404, 'Colonia General Roca', 30, -31.350851058959961, -58.085075378417969);
INSERT INTO public2.locations VALUES (1405, 'Concordia', 30, -31.391963958740234, -58.017005920410156);
INSERT INTO public2.locations VALUES (1406, 'EstaciÃ³n YeruÃ¡', 30, -31.471107482910156, -58.263328552246094);
INSERT INTO public2.locations VALUES (1407, 'EstaciÃ³n YuquerÃ­', 30, -31.398216247558594, -58.162437438964844);
INSERT INTO public2.locations VALUES (1408, 'Estancia Grande', 30, -31.439167022705078, -58.119571685791016);
INSERT INTO public2.locations VALUES (1409, 'La Criolla', 30, -31.269113540649414, -58.108829498291016);
INSERT INTO public2.locations VALUES (1410, 'Los CharrÃºas', 30, -31.169429779052734, -58.185539245605469);
INSERT INTO public2.locations VALUES (1411, 'Nueva Escocia', 30, -31.649616241455078, -58.016334533691406);
INSERT INTO public2.locations VALUES (1412, 'Osvaldo Magnasco', 30, -31.313102722167969, -58.059322357177734);
INSERT INTO public2.locations VALUES (1413, 'Pedernal', 30, -31.671972274780273, -58.230583190917969);
INSERT INTO public2.locations VALUES (1414, 'Puerto YeruÃ¡', 30, -31.53135871887207, -58.015182495117188);
INSERT INTO public2.locations VALUES (1415, 'Aldea Brasilera', 30, -31.889833450317383, -60.590793609619141);
INSERT INTO public2.locations VALUES (1416, 'Aldea Grapschental', 30, -31.960517883300781, -60.498985290527344);
INSERT INTO public2.locations VALUES (1417, 'Aldea Protestante', 30, -32.029304504394531, -60.561809539794922);
INSERT INTO public2.locations VALUES (1418, 'Aldea Salto', 30, -31.924833297729492, -60.5473518371582);
INSERT INTO public2.locations VALUES (1419, 'Aldea San Francisco', 30, -31.961227416992188, -60.635261535644531);
INSERT INTO public2.locations VALUES (1420, 'Aldea Spatzenkutter', 30, -31.946178436279297, -60.580863952636719);
INSERT INTO public2.locations VALUES (1421, 'Aldea Valle MarÃ­a', 30, -31.990093231201172, -60.587726593017578);
INSERT INTO public2.locations VALUES (1422, 'Colonia Ensayo', 30, -31.865188598632812, -60.574691772460938);
INSERT INTO public2.locations VALUES (1423, 'Diamante', 30, -32.070758819580078, -60.638206481933594);
INSERT INTO public2.locations VALUES (1424, 'EstaciÃ³n Camps', 30, -32.112514495849609, -60.227287292480469);
INSERT INTO public2.locations VALUES (1425, 'General Alvear', 30, -31.945514678955078, -60.680122375488281);
INSERT INTO public2.locations VALUES (1426, 'General Racedo (El Carmen)', 30, -31.979148864746094, -60.405666351318359);
INSERT INTO public2.locations VALUES (1427, 'General RamÃ­rez', 30, -32.177268981933594, -60.201644897460938);
INSERT INTO public2.locations VALUES (1428, 'La Juanita', 30, -31.87504768371582, -60.648956298828125);
INSERT INTO public2.locations VALUES (1429, 'Las Jaulas', 30, -31.827043533325195, -60.605319976806641);
INSERT INTO public2.locations VALUES (1430, 'Paraje La Virgen', 30, -31.91663932800293, -60.653610229492188);
INSERT INTO public2.locations VALUES (1431, 'Puerto Las Cuevas', 30, -32.328708648681641, -60.486499786376953);
INSERT INTO public2.locations VALUES (1432, 'Villa Libertador San MartÃ­n', 30, -32.073440551757812, -60.465915679931641);
INSERT INTO public2.locations VALUES (1433, 'ChajarÃ­', 30, -30.754724502563477, -57.981788635253906);
INSERT INTO public2.locations VALUES (1434, 'Colonia Alemana', 30, -30.903594970703125, -57.999893188476562);
INSERT INTO public2.locations VALUES (1435, 'Colonia La Argentina', 30, -31.074077606201172, -58.026020050048828);
INSERT INTO public2.locations VALUES (1436, 'FederaciÃ³n', 30, -30.990262985229492, -57.917762756347656);
INSERT INTO public2.locations VALUES (1437, 'Los Conquistadores', 30, -30.591337203979492, -58.466236114501953);
INSERT INTO public2.locations VALUES (1438, 'San Jaime de la Frontera', 30, -30.340339660644531, -58.306930541992188);
INSERT INTO public2.locations VALUES (1439, 'San Pedro', 30, -30.758195877075195, -58.081588745117188);
INSERT INTO public2.locations VALUES (1440, 'San RamÃ³n', 30, -30.818815231323242, -58.249794006347656);
INSERT INTO public2.locations VALUES (1441, 'Santa Ana', 30, -30.899370193481445, -57.931079864501953);
INSERT INTO public2.locations VALUES (1442, 'Villa del Rosario', 30, -30.795738220214844, -57.914554595947266);
INSERT INTO public2.locations VALUES (1443, 'Conscripto Bernardi', 30, -31.046243667602539, -59.086723327636719);
INSERT INTO public2.locations VALUES (1444, 'Aldea San Isidro (El CimarrÃ³n)', 30, -30.974102020263672, -58.996414184570312);
INSERT INTO public2.locations VALUES (1445, 'Federal', 30, -30.956214904785156, -58.779586791992188);
INSERT INTO public2.locations VALUES (1446, 'Nueva Vizcaya', 30, -30.968513488769531, -58.612751007080078);
INSERT INTO public2.locations VALUES (1447, 'Sauce de Luna', 30, -31.239522933959961, -59.217372894287109);
INSERT INTO public2.locations VALUES (1448, 'San JosÃ© de Feliciano', 30, -30.385444641113281, -58.7502555847168);
INSERT INTO public2.locations VALUES (1449, 'San VÃ­ctor', 30, -30.485189437866211, -59.028343200683594);
INSERT INTO public2.locations VALUES (1450, 'Aldea AsunciÃ³n', 30, -32.824710845947266, -59.239116668701172);
INSERT INTO public2.locations VALUES (1451, 'EstaciÃ³n Lazo', 30, -32.870811462402344, -59.422328948974609);
INSERT INTO public2.locations VALUES (1452, 'General Galarza', 30, -32.720485687255859, -59.395706176757812);
INSERT INTO public2.locations VALUES (1453, 'Gualeguay', 30, -33.150428771972656, -59.310577392578125);
INSERT INTO public2.locations VALUES (1454, 'Puerto Ruiz', 30, -33.221824645996094, -59.365463256835938);
INSERT INTO public2.locations VALUES (1455, 'Aldea San Antonio', 30, -32.625175476074219, -58.704421997070312);
INSERT INTO public2.locations VALUES (1456, 'Aldea San Juan', 30, -32.695957183837891, -58.771751403808594);
INSERT INTO public2.locations VALUES (1457, 'Enrique CarbÃ³', 30, -33.145462036132812, -59.208057403564453);
INSERT INTO public2.locations VALUES (1458, 'EstaciÃ³n EscriÃ±a', 30, -32.592128753662109, -58.905929565429688);
INSERT INTO public2.locations VALUES (1459, 'Faustino M. Parera', 30, -32.8044319152832, -58.882633209228516);
INSERT INTO public2.locations VALUES (1460, 'General Almada', 30, -32.837387084960938, -58.802650451660156);
INSERT INTO public2.locations VALUES (1461, 'Gilbert', 30, -32.535831451416016, -58.934009552001953);
INSERT INTO public2.locations VALUES (1462, 'GualeguaychÃº', 30, -33.007797241210938, -58.510768890380859);
INSERT INTO public2.locations VALUES (1463, 'Irazusta', 30, -32.925865173339844, -58.949649810791016);
INSERT INTO public2.locations VALUES (1464, 'Larroque', 30, -33.036521911621094, -58.99908447265625);
INSERT INTO public2.locations VALUES (1465, 'Pastor Britos', 30, -32.770236968994141, -58.906295776367188);
INSERT INTO public2.locations VALUES (1466, 'Pueblo General Belgrano', 30, -33.017372131347656, -58.475032806396484);
INSERT INTO public2.locations VALUES (1467, 'Urdinarrain', 30, -32.691047668457031, -58.888420104980469);
INSERT INTO public2.locations VALUES (1468, 'Ceibas', 30, -33.499412536621094, -58.80035400390625);
INSERT INTO public2.locations VALUES (1469, 'Ibicuy', 30, -33.742477416992188, -59.157588958740234);
INSERT INTO public2.locations VALUES (1470, 'MÃ©danos', 30, -33.435775756835938, -59.0688591003418);
INSERT INTO public2.locations VALUES (1471, 'Villa Paranacito', 30, -33.715602874755859, -58.665264129638672);
INSERT INTO public2.locations VALUES (1472, 'Alcaraz', 30, -31.457365036010742, -59.59857177734375);
INSERT INTO public2.locations VALUES (1473, 'Bovril', 30, -31.34358024597168, -59.446388244628906);
INSERT INTO public2.locations VALUES (1474, 'Colonia Avigdor', 30, -31.183195114135742, -59.408237457275391);
INSERT INTO public2.locations VALUES (1475, 'El Solar', 30, -31.179544448852539, -59.733135223388672);
INSERT INTO public2.locations VALUES (1476, 'La Paz', 30, -30.740476608276367, -59.644302368164062);
INSERT INTO public2.locations VALUES (1477, 'Piedras Blancas', 30, -31.185007095336914, -59.949958801269531);
INSERT INTO public2.locations VALUES (1478, 'San Gustavo', 30, -30.690288543701172, -59.394985198974609);
INSERT INTO public2.locations VALUES (1479, 'Santa Elena', 30, -30.944459915161133, -59.789119720458984);
INSERT INTO public2.locations VALUES (1480, 'Sir Leonard', 30, -31.3889217376709, -59.501060485839844);
INSERT INTO public2.locations VALUES (1481, 'Aranguren', 30, -32.245777130126953, -60.158351898193359);
INSERT INTO public2.locations VALUES (1482, 'Betbeder', 30, -32.3721809387207, -59.928409576416016);
INSERT INTO public2.locations VALUES (1483, 'Don CristÃ³bal', 30, -32.071353912353516, -59.994731903076172);
INSERT INTO public2.locations VALUES (1484, 'FebrÃ©', 30, -32.475269317626953, -59.918899536132812);
INSERT INTO public2.locations VALUES (1485, 'HernÃ¡ndez', 30, -32.338272094726562, -60.032127380371094);
INSERT INTO public2.locations VALUES (1486, 'Lucas nzÃ¡lez', 30, -32.384395599365234, -59.530845642089844);
INSERT INTO public2.locations VALUES (1487, 'NoyÃ¡', 30, -32.398960113525391, -59.787696838378906);
INSERT INTO public2.locations VALUES (1488, 'XX de Setiembre', 30, -32.385917663574219, -59.6622200012207);
INSERT INTO public2.locations VALUES (1489, 'Aldea MarÃ­a Luisa', 30, -31.883852005004883, -60.410507202148438);
INSERT INTO public2.locations VALUES (1490, 'Aldea San Juan', 30, -31.996719360351562, -60.358161926269531);
INSERT INTO public2.locations VALUES (1491, 'Aldea San Rafael', 30, -31.95741081237793, -60.254631042480469);
INSERT INTO public2.locations VALUES (1492, 'Aldea Santa MarÃ­a', 30, -31.6113338470459, -60.006885528564453);
INSERT INTO public2.locations VALUES (1493, 'Aldea Santa Rosa', 30, -32.013160705566406, -60.239208221435547);
INSERT INTO public2.locations VALUES (1494, 'Cerrito', 30, -31.579938888549805, -60.075546264648438);
INSERT INTO public2.locations VALUES (1495, 'Colonia Avellaneda', 30, -31.762649536132812, -60.411979675292969);
INSERT INTO public2.locations VALUES (1496, 'Colonia Crespo', 30, -31.682880401611328, -60.231082916259766);
INSERT INTO public2.locations VALUES (1497, 'Crespo', 30, -32.030757904052734, -60.30609130859375);
INSERT INTO public2.locations VALUES (1498, 'El Palenque', 30, -31.653757095336914, -60.166618347167969);
INSERT INTO public2.locations VALUES (1499, 'El Pin', 30, -31.582967758178711, -59.890850067138672);
INSERT INTO public2.locations VALUES (1500, 'El RamblÃ³n', 30, -31.84687614440918, -60.101253509521484);
INSERT INTO public2.locations VALUES (1501, 'Hasenkamp', 30, -31.512168884277344, -59.835281372070312);
INSERT INTO public2.locations VALUES (1502, 'Hernandarias', 30, -31.230009078979492, -59.988285064697266);
INSERT INTO public2.locations VALUES (1503, 'La Picada', 30, -31.725004196166992, -60.297550201416016);
INSERT INTO public2.locations VALUES (1504, 'Las Tunas', 30, -31.868597030639648, -59.728862762451172);
INSERT INTO public2.locations VALUES (1505, 'MarÃ­a Grande', 30, -31.662807464599609, -59.904014587402344);
INSERT INTO public2.locations VALUES (1506, 'Oro Verde', 30, -31.82275390625, -60.517532348632812);
INSERT INTO public2.locations VALUES (1507, 'ParanÃ¡', 30, -31.74015998840332, -60.527427673339844);
INSERT INTO public2.locations VALUES (1508, 'Pueblo Bellocq (Las Garzas)', 30, -31.427427291870117, -59.744491577148438);
INSERT INTO public2.locations VALUES (1509, 'Pueblo Bru', 30, -31.3873291015625, -60.091815948486328);
INSERT INTO public2.locations VALUES (1510, 'Pueblo General San MartÃ­n', 30, -31.45836067199707, -60.169052124023438);
INSERT INTO public2.locations VALUES (1511, 'San Benito', 30, -31.783021926879883, -60.441459655761719);
INSERT INTO public2.locations VALUES (1512, 'Sauce Montrull', 30, -31.744808197021484, -60.355758666992188);
INSERT INTO public2.locations VALUES (1513, 'Sauce Pinto', 30, -31.843082427978516, -60.371601104736328);
INSERT INTO public2.locations VALUES (1514, 'SeguÃ­', 30, -31.9543399810791, -60.125652313232422);
INSERT INTO public2.locations VALUES (1515, 'Sosa', 30, -31.736232757568359, -59.911136627197266);
INSERT INTO public2.locations VALUES (1516, 'Tabossi', 30, -31.801660537719727, -59.935951232910156);
INSERT INTO public2.locations VALUES (1517, 'Tezanos Pinto', 30, -31.8716983795166, -60.494415283203125);
INSERT INTO public2.locations VALUES (1518, 'Viale', 30, -31.872108459472656, -60.0129508972168);
INSERT INTO public2.locations VALUES (1519, 'Villa Fontana', 30, -31.905344009399414, -60.47369384765625);
INSERT INTO public2.locations VALUES (1520, 'Villa Gdor. Luis F. Etchevehere', 30, -31.935070037841797, -60.427165985107422);
INSERT INTO public2.locations VALUES (1521, 'Villa Urquiza', 30, -31.649520874023438, -60.376895904541016);
INSERT INTO public2.locations VALUES (1522, 'General Campos', 30, -31.52337646484375, -58.405803680419922);
INSERT INTO public2.locations VALUES (1523, 'San Salvador', 30, -31.624959945678711, -58.505031585693359);
INSERT INTO public2.locations VALUES (1524, 'Altamirano Sur', 30, -32.0877799987793, -59.174732208251953);
INSERT INTO public2.locations VALUES (1525, 'Durazno', 30, -31.985879898071289, -59.279293060302734);
INSERT INTO public2.locations VALUES (1526, 'EstaciÃ³n Arroyo ClÃ©', 30, -32.635032653808594, -59.401504516601562);
INSERT INTO public2.locations VALUES (1527, 'bernador EchagÃ¼e', 30, -32.39337158203125, -59.2758903503418);
INSERT INTO public2.locations VALUES (1528, 'bernador Mansilla', 30, -32.545436859130859, -59.356616973876953);
INSERT INTO public2.locations VALUES (1529, 'bernador SolÃ¡', 30, -32.336521148681641, -59.372783660888672);
INSERT INTO public2.locations VALUES (1530, 'Guardamonte', 30, -32.081146240234375, -59.305953979492188);
INSERT INTO public2.locations VALUES (1531, 'Las Guachas', 30, -32.470218658447266, -59.172924041748047);
INSERT INTO public2.locations VALUES (1532, 'MaciÃ¡', 30, -32.1746826171875, -59.397972106933594);
INSERT INTO public2.locations VALUES (1533, 'Rosario del Tala', 30, -32.300674438476562, -59.139068603515625);
INSERT INTO public2.locations VALUES (1534, 'Basavilbaso', 30, -32.372161865234375, -58.8786735534668);
INSERT INTO public2.locations VALUES (1535, 'Caseros', 30, -32.462120056152344, -58.479320526123047);
INSERT INTO public2.locations VALUES (1536, 'Colonia ElÃ­a', 30, -32.670402526855469, -58.325351715087891);
INSERT INTO public2.locations VALUES (1537, 'ConcepciÃ³n del Uruguay', 30, -32.484661102294922, -58.232120513916016);
INSERT INTO public2.locations VALUES (1538, 'Herrera', 30, -32.433784484863281, -58.6346549987793);
INSERT INTO public2.locations VALUES (1539, 'Las Moscas', 30, -32.09210205078125, -58.957515716552734);
INSERT INTO public2.locations VALUES (1540, 'LÃ­baros', 30, -32.261894226074219, -58.906951904296875);
INSERT INTO public2.locations VALUES (1541, '1Âº de Mayo', 30, -32.255374908447266, -58.422599792480469);
INSERT INTO public2.locations VALUES (1542, 'Pronunciamiento', 30, -32.34600830078125, -58.444179534912109);
INSERT INTO public2.locations VALUES (1543, 'Rocamora', 30, -32.34466552734375, -58.9730110168457);
INSERT INTO public2.locations VALUES (1544, 'Santa Anita', 30, -32.174415588378906, -58.785976409912109);
INSERT INTO public2.locations VALUES (1545, 'Villa Mantero', 30, -32.398361206054688, -58.746017456054688);
INSERT INTO public2.locations VALUES (1546, 'Villa San Justo', 30, -32.445606231689453, -58.435428619384766);
INSERT INTO public2.locations VALUES (1547, 'Villa San Marcial (Est. bernador Urquiza)', 30, -32.180068969726562, -58.928539276123047);
INSERT INTO public2.locations VALUES (1548, 'Antelo', 30, -32.533542633056641, -60.035453796386719);
INSERT INTO public2.locations VALUES (1549, 'Molino Doll', 30, -32.30682373046875, -60.423088073730469);
INSERT INTO public2.locations VALUES (1550, 'Victoria', 30, -32.621604919433594, -60.157955169677734);
INSERT INTO public2.locations VALUES (1551, 'EstaciÃ³n RaÃ­ces', 30, -31.908552169799805, -59.261234283447266);
INSERT INTO public2.locations VALUES (1552, 'Ingeniero Miguel Sajaroff', 30, -31.956886291503906, -58.8494873046875);
INSERT INTO public2.locations VALUES (1553, 'Jubileo', 30, -31.7312068939209, -58.635719299316406);
INSERT INTO public2.locations VALUES (1554, 'Paso de la Laguna', 30, -31.803520202636719, -59.159809112548828);
INSERT INTO public2.locations VALUES (1555, 'Villa Clara', 30, -31.829799652099609, -58.821609497070312);
INSERT INTO public2.locations VALUES (1556, 'Villa DomÃ­nguez', 30, -31.986288070678711, -58.961532592773438);
INSERT INTO public2.locations VALUES (1557, 'Villaguay', 30, -31.867637634277344, -59.026885986328125);
INSERT INTO public2.locations VALUES (1558, 'FortÃ­n Soledad', 34, -24.148754119873047, -60.689960479736328);
INSERT INTO public2.locations VALUES (1559, 'Guadalcazar', 34, -23.672948837280273, -61.163608551025391);
INSERT INTO public2.locations VALUES (1560, 'La Rinconada', 34, -23.494796752929688, -61.576652526855469);
INSERT INTO public2.locations VALUES (1561, 'Laguna Yema', 34, -24.255523681640625, -61.241985321044922);
INSERT INTO public2.locations VALUES (1562, 'Lamadrid', 34, -23.896947860717773, -60.754547119140625);
INSERT INTO public2.locations VALUES (1563, 'Los Chiriguanos', 34, -24.098814010620117, -61.46197509765625);
INSERT INTO public2.locations VALUES (1564, 'Pozo de Maza', 34, -23.570322036743164, -61.708061218261719);
INSERT INTO public2.locations VALUES (1565, 'Pozo del Mortero', 34, -24.407167434692383, -61.026206970214844);
INSERT INTO public2.locations VALUES (1566, 'Vaca Perdida', 34, -23.499588012695312, -61.6484260559082);
INSERT INTO public2.locations VALUES (1567, 'Colonia Pastoril', 34, -25.672693252563477, -58.261493682861328);
INSERT INTO public2.locations VALUES (1568, 'Formosa', 34, -26.185009002685547, -58.174896240234375);
INSERT INTO public2.locations VALUES (1569, 'Gran Guardia', 34, -25.862762451171875, -58.885726928710938);
INSERT INTO public2.locations VALUES (1570, 'Mariano Boedo', 34, -26.109325408935547, -58.487754821777344);
INSERT INTO public2.locations VALUES (1571, 'MojÃ³n de Fierro', 34, -26.03318977355957, -58.049049377441406);
INSERT INTO public2.locations VALUES (1572, 'San Hilario', 34, -26.029993057250977, -58.652256011962891);
INSERT INTO public2.locations VALUES (1573, 'Banco PayaguÃ¡', 34, -26.707422256469727, -58.338340759277344);
INSERT INTO public2.locations VALUES (1574, 'General Lucio V. Mansilla', 34, -26.657690048217773, -58.630458831787109);
INSERT INTO public2.locations VALUES (1575, 'Herradura', 34, -26.489847183227539, -58.311618804931641);
INSERT INTO public2.locations VALUES (1576, 'San Francisco de Laishi', 34, -26.243867874145508, -58.629611968994141);
INSERT INTO public2.locations VALUES (1577, 'TatanÃ©', 34, -26.398153305053711, -58.357337951660156);
INSERT INTO public2.locations VALUES (1578, 'Villa Escolar', 34, -26.621917724609375, -58.669708251953125);
INSERT INTO public2.locations VALUES (1579, 'Ingeniero Guillermo N. JuÃ¡rez', 34, -23.903739929199219, -61.842430114746094);
INSERT INTO public2.locations VALUES (1580, 'BartolomÃ© de las Casas', 34, -25.408048629760742, -59.570758819580078);
INSERT INTO public2.locations VALUES (1581, 'Colonia Sarmiento', 34, -24.6439208984375, -59.434059143066406);
INSERT INTO public2.locations VALUES (1582, 'Comandante Fontana', 34, -25.33064079284668, -59.680988311767578);
INSERT INTO public2.locations VALUES (1583, 'El Recreo', 34, -25.040781021118164, -59.294242858886719);
INSERT INTO public2.locations VALUES (1584, 'Estanislao del Campo', 34, -25.053546905517578, -60.09063720703125);
INSERT INTO public2.locations VALUES (1585, 'FortÃ­n Cabo 1Âº Lunes', 34, -24.286422729492188, -59.827678680419922);
INSERT INTO public2.locations VALUES (1586, 'FortÃ­n Sargento 1Âº Leyes', 34, -24.554111480712891, -59.385116577148438);
INSERT INTO public2.locations VALUES (1587, 'Ibarreta', 34, -25.214500427246094, -59.858890533447266);
INSERT INTO public2.locations VALUES (1588, 'Juan G. BazÃ¡n', 34, -24.542999267578125, -60.832908630371094);
INSERT INTO public2.locations VALUES (1589, 'Las Lomitas', 34, -24.7081356048584, -60.591377258300781);
INSERT INTO public2.locations VALUES (1590, 'Posta Cambio Zalazar', 34, -24.210788726806641, -60.197261810302734);
INSERT INTO public2.locations VALUES (1591, 'Pozo del Tigre', 34, -24.895553588867188, -60.319183349609375);
INSERT INTO public2.locations VALUES (1592, 'San MartÃ­n I', 34, -24.532466888427734, -59.902122497558594);
INSERT INTO public2.locations VALUES (1593, 'San MartÃ­n II', 34, -24.433734893798828, -59.654903411865234);
INSERT INTO public2.locations VALUES (1594, 'Subteniente PerÃ­n', 34, -25.535408020019531, -60.018825531005859);
INSERT INTO public2.locations VALUES (1595, 'Villa General GÃ¼emes', 34, -24.755783081054688, -59.488510131835938);
INSERT INTO public2.locations VALUES (1596, 'Villa General Manuel Belgrano', 34, -24.938533782958984, -59.026390075683594);
INSERT INTO public2.locations VALUES (1597, 'Buena Vista', 34, -25.071500778198242, -58.385528564453125);
INSERT INTO public2.locations VALUES (1598, 'El Espinillo', 34, -24.981483459472656, -58.552562713623047);
INSERT INTO public2.locations VALUES (1599, 'Laguna Gallo', 34, -25.269084930419922, -58.7423210144043);
INSERT INTO public2.locations VALUES (1600, 'MisiÃ³n TacaaglÃ©', 34, -24.981000900268555, -58.8199348449707);
INSERT INTO public2.locations VALUES (1601, 'PortÃ³n Negro', 34, -24.966091156005859, -58.742546081542969);
INSERT INTO public2.locations VALUES (1602, 'Tres Lagunas', 34, -25.216123580932617, -58.513076782226562);
INSERT INTO public2.locations VALUES (1603, 'Clorinda', 34, -25.286081314086914, -57.722408294677734);
INSERT INTO public2.locations VALUES (1604, 'Laguna Blanca', 34, -25.126264572143555, -58.240455627441406);
INSERT INTO public2.locations VALUES (1605, 'Laguna Naick-Neck', 34, -25.222736358642578, -58.121017456054688);
INSERT INTO public2.locations VALUES (1606, 'Palma Sola', 34, -25.24797248840332, -57.976268768310547);
INSERT INTO public2.locations VALUES (1607, 'Puerto Pilcomayo', 34, -25.372224807739258, -57.651607513427734);
INSERT INTO public2.locations VALUES (1608, 'Riacho He-He', 34, -25.36065673828125, -58.2797966003418);
INSERT INTO public2.locations VALUES (1609, 'Riacho Negro', 34, -25.423971176147461, -57.793281555175781);
INSERT INTO public2.locations VALUES (1610, 'Siete Palmas', 34, -25.203691482543945, -58.332004547119141);
INSERT INTO public2.locations VALUES (1611, 'Colonia Campo VillafaÃ±e', 34, -26.204687118530273, -59.080024719238281);
INSERT INTO public2.locations VALUES (1612, 'El Colorado', 34, -26.309061050415039, -59.372306823730469);
INSERT INTO public2.locations VALUES (1613, 'Palo Santo', 34, -25.564594268798828, -59.337718963623047);
INSERT INTO public2.locations VALUES (1614, 'PiranÃ©', 34, -25.732650756835938, -59.109809875488281);
INSERT INTO public2.locations VALUES (1615, 'Villa KilÃ³metro 213', 34, -26.187166213989258, -59.367156982421875);
INSERT INTO public2.locations VALUES (1616, 'El Potrillo', 34, -23.162439346313477, -62.008964538574219);
INSERT INTO public2.locations VALUES (1617, 'General Mosconi', 34, -23.183830261230469, -62.306571960449219);
INSERT INTO public2.locations VALUES (1618, 'El Quebracho', 34, -23.342517852783203, -61.871585845947266);
INSERT INTO public2.locations VALUES (1619, 'Abra Pampa', 38, -22.722692489624023, -65.697036743164062);
INSERT INTO public2.locations VALUES (1620, 'Abralaite', 38, -23.169147491455078, -65.793876647949219);
INSERT INTO public2.locations VALUES (1621, 'Agua de Castilla', 38, -23.217512130737305, -65.8068618774414);
INSERT INTO public2.locations VALUES (1622, 'Casabindo', 38, -22.986827850341797, -66.032928466796875);
INSERT INTO public2.locations VALUES (1623, 'Cochinoca', 38, -22.745353698730469, -65.896080017089844);
INSERT INTO public2.locations VALUES (1624, 'La Redonda', 38, -22.528892517089844, -65.522270202636719);
INSERT INTO public2.locations VALUES (1625, 'Puesto del MarquÃ©z', 38, -22.536960601806641, -65.697463989257812);
INSERT INTO public2.locations VALUES (1626, 'QuebraleÃ±a', 38, -23.286231994628906, -65.769882202148438);
INSERT INTO public2.locations VALUES (1627, 'Quera', 38, -23.100826263427734, -65.7635726928711);
INSERT INTO public2.locations VALUES (1628, 'Rinconadillas', 38, -23.385501861572266, -65.9570541381836);
INSERT INTO public2.locations VALUES (1629, 'San Francisco de Alfarcito', 38, -23.319843292236328, -65.973953247070312);
INSERT INTO public2.locations VALUES (1630, 'Santa Ana de la Puna', 38, -23.126211166381836, -66.053169250488281);
INSERT INTO public2.locations VALUES (1631, 'Santuario de Tres Pozos', 38, -23.53266716003418, -65.962600708007812);
INSERT INTO public2.locations VALUES (1632, 'Tambillos', 38, -22.897096633911133, -65.962882995605469);
INSERT INTO public2.locations VALUES (1633, 'Tusaquillas', 38, -23.189291000366211, -65.987510681152344);
INSERT INTO public2.locations VALUES (1634, 'Aguas Calientes', 38, -24.584432601928711, -64.923248291015625);
INSERT INTO public2.locations VALUES (1635, 'Barrio El Milagro', 38, -24.463443756103516, -65.11920166015625);
INSERT INTO public2.locations VALUES (1636, 'Barrio La UniÃ³n', 38, -24.404731750488281, -65.0704574584961);
INSERT INTO public2.locations VALUES (1637, 'El Carmen', 38, -24.389286041259766, -65.261543273925781);
INSERT INTO public2.locations VALUES (1638, 'Los Lapachos', 38, -24.476997375488281, -65.07672119140625);
INSERT INTO public2.locations VALUES (1639, 'Manantiales', 38, -24.534309387207031, -64.9769058227539);
INSERT INTO public2.locations VALUES (1640, 'Monterrico', 38, -24.442960739135742, -65.166091918945312);
INSERT INTO public2.locations VALUES (1641, 'Pampa Blanca', 38, -24.535175323486328, -65.072555541992188);
INSERT INTO public2.locations VALUES (1642, 'Perico', 38, -24.376047134399414, -65.118087768554688);
INSERT INTO public2.locations VALUES (1643, 'Puesto Viejo', 38, -24.486337661743164, -64.96490478515625);
INSERT INTO public2.locations VALUES (1644, 'San Isidro', 38, -24.556081771850586, -64.942070007324219);
INSERT INTO public2.locations VALUES (1645, 'San Juancito', 38, -24.383312225341797, -64.995193481445312);
INSERT INTO public2.locations VALUES (1646, 'Guerrero', 38, -24.186450958251953, -65.4489517211914);
INSERT INTO public2.locations VALUES (1647, 'La Almona', 38, -24.259342193603516, -65.393959045410156);
INSERT INTO public2.locations VALUES (1648, 'LeÃ³n', 38, -24.035242080688477, -65.431831359863281);
INSERT INTO public2.locations VALUES (1649, 'Lozano', 38, -24.077606201171875, -65.408706665039062);
INSERT INTO public2.locations VALUES (1650, 'Ocloyas', 38, -23.944110870361328, -65.231704711914062);
INSERT INTO public2.locations VALUES (1651, 'San Salvador de Jujuy', 38, -24.185829162597656, -65.299484252929688);
INSERT INTO public2.locations VALUES (1652, 'Tesorero', 38, -23.948005676269531, -65.299560546875);
INSERT INTO public2.locations VALUES (1653, 'Yala', 38, -24.119709014892578, -65.402069091796875);
INSERT INTO public2.locations VALUES (1654, 'Aparzo', 38, -23.099527359008789, -65.1857681274414);
INSERT INTO public2.locations VALUES (1655, 'Cianzo', 38, -23.17320442199707, -65.158439636230469);
INSERT INTO public2.locations VALUES (1656, 'Coctaca', 38, -23.154207229614258, -65.293502807617188);
INSERT INTO public2.locations VALUES (1657, 'El Aguilar', 38, -23.213338851928711, -65.678924560546875);
INSERT INTO public2.locations VALUES (1658, 'HipÃ³lito Yriyen', 38, -22.978733062744141, -65.3526611328125);
INSERT INTO public2.locations VALUES (1659, 'Humahuaca', 38, -23.205928802490234, -65.347450256347656);
INSERT INTO public2.locations VALUES (1660, 'Palca de Aparzo', 38, -23.122406005859375, -65.13470458984375);
INSERT INTO public2.locations VALUES (1661, 'Palca de Varas', 38, -23.100324630737305, -65.110305786132812);
INSERT INTO public2.locations VALUES (1662, 'Rodero', 38, -23.062366485595703, -65.326553344726562);
INSERT INTO public2.locations VALUES (1663, 'Tres Cruces', 38, -22.918210983276367, -65.58758544921875);
INSERT INTO public2.locations VALUES (1664, 'UquÃ­a', 38, -23.303592681884766, -65.3560791015625);
INSERT INTO public2.locations VALUES (1665, 'Bananal', 38, -23.566436767578125, -64.499214172363281);
INSERT INTO public2.locations VALUES (1666, 'Bermejito', 38, -23.788738250732422, -64.729934692382812);
INSERT INTO public2.locations VALUES (1667, 'Caimancito', 38, -23.739936828613281, -64.591598510742188);
INSERT INTO public2.locations VALUES (1668, 'Calilegua', 38, -23.774568557739258, -64.770034790039062);
INSERT INTO public2.locations VALUES (1669, 'ChalicÃ¡n', 38, -24.069356918334961, -64.806404113769531);
INSERT INTO public2.locations VALUES (1670, 'Fraile Pintado', 38, -23.944116592407227, -64.803031921386719);
INSERT INTO public2.locations VALUES (1671, 'Libertad', 38, -23.762395858764648, -64.7272720336914);
INSERT INTO public2.locations VALUES (1672, 'Libertador General San MartÃ­n', 38, -23.815214157104492, -64.792854309082031);
INSERT INTO public2.locations VALUES (1673, 'MaÃ­z Negro', 38, -23.951192855834961, -64.773727416992188);
INSERT INTO public2.locations VALUES (1674, 'Paulina', 38, -23.845066070556641, -64.740547180175781);
INSERT INTO public2.locations VALUES (1675, 'Yuto', 38, -23.642801284790039, -64.471641540527344);
INSERT INTO public2.locations VALUES (1676, 'Carahunco', 38, -24.307748794555664, -65.082138061523438);
INSERT INTO public2.locations VALUES (1677, 'Centro Forestal', 38, -24.229026794433594, -65.178413391113281);
INSERT INTO public2.locations VALUES (1678, 'PalpalÃ¡', 38, -24.257894515991211, -65.213485717773438);
INSERT INTO public2.locations VALUES (1679, 'Casa Colorada', 38, -22.32594108581543, -66.283943176269531);
INSERT INTO public2.locations VALUES (1680, 'Coyaguaima', 38, -22.769416809082031, -66.440910339355469);
INSERT INTO public2.locations VALUES (1681, 'Lagunillas de FarallÃ³n', 38, -22.46214485168457, -66.627967834472656);
INSERT INTO public2.locations VALUES (1682, 'Liviara', 38, -22.521064758300781, -66.337684631347656);
INSERT INTO public2.locations VALUES (1683, 'Loma Blanca', 38, -22.472263336181641, -66.4841079711914);
INSERT INTO public2.locations VALUES (1684, 'Nuevo Pirquitas', 38, -22.687955856323242, -66.456375122070312);
INSERT INTO public2.locations VALUES (1685, 'Orosmayo', 38, -22.556886672973633, -66.3567886352539);
INSERT INTO public2.locations VALUES (1686, 'Rinconada', 38, -22.440700531005859, -66.167152404785156);
INSERT INTO public2.locations VALUES (1687, 'El Ceibal', 38, -24.298919677734375, -65.272247314453125);
INSERT INTO public2.locations VALUES (1688, 'Los Alisos', 38, -24.268573760986328, -65.30029296875);
INSERT INTO public2.locations VALUES (1689, 'Loteo Navea', 38, -24.270280838012695, -65.275604248046875);
INSERT INTO public2.locations VALUES (1690, 'Nuestra SeÃ±ora del Rosario', 38, -24.317373275756836, -65.401741027832031);
INSERT INTO public2.locations VALUES (1691, 'San Antonio', 38, -24.370454788208008, -65.331695556640625);
INSERT INTO public2.locations VALUES (1692, 'Arrayanal', 38, -24.178567886352539, -64.8402328491211);
INSERT INTO public2.locations VALUES (1693, 'Arroyo Colorado', 38, -24.337011337280273, -64.663055419921875);
INSERT INTO public2.locations VALUES (1694, 'Don Emilio', 38, -24.317207336425781, -64.9067611694336);
INSERT INTO public2.locations VALUES (1695, 'El Acheral', 38, -24.403154373168945, -64.8006362915039);
INSERT INTO public2.locations VALUES (1696, 'El Puesto', 38, -24.198110580444336, -64.789627075195312);
INSERT INTO public2.locations VALUES (1697, 'El Quemado', 38, -24.104591369628906, -64.824028015136719);
INSERT INTO public2.locations VALUES (1698, 'La Esperanza', 38, -24.224655151367188, -64.838539123535156);
INSERT INTO public2.locations VALUES (1699, 'La Manga', 38, -24.191179275512695, -64.847625732421875);
INSERT INTO public2.locations VALUES (1700, 'La Mendieta', 38, -24.314445495605469, -64.966781616210938);
INSERT INTO public2.locations VALUES (1701, 'Palos Blancos', 38, -24.326988220214844, -64.945732116699219);
INSERT INTO public2.locations VALUES (1702, 'Piedritas', 38, -24.295755386352539, -64.8821792602539);
INSERT INTO public2.locations VALUES (1703, 'Rodeito', 38, -24.271549224853516, -64.7694091796875);
INSERT INTO public2.locations VALUES (1704, 'Rosario de RÃ­o Grande (ex Barro Negro)', 38, -24.308525085449219, -64.931640625);
INSERT INTO public2.locations VALUES (1705, 'San Antonio', 38, -24.218683242797852, -64.8067855834961);
INSERT INTO public2.locations VALUES (1706, 'San Lucas', 38, -24.268442153930664, -64.864753723144531);
INSERT INTO public2.locations VALUES (1707, 'San Pedro', 38, -24.231727600097656, -64.867813110351562);
INSERT INTO public2.locations VALUES (1708, 'El Fuerte', 38, -24.260515213012695, -64.41412353515625);
INSERT INTO public2.locations VALUES (1709, 'El Piquete', 38, -24.178434371948242, -64.67901611328125);
INSERT INTO public2.locations VALUES (1710, 'El Talar', 38, -23.556358337402344, -64.3598861694336);
INSERT INTO public2.locations VALUES (1711, 'Palma Sola', 38, -23.977737426757812, -64.3045654296875);
INSERT INTO public2.locations VALUES (1712, 'Puente LavayÃ©n', 38, -24.273138046264648, -64.7057876586914);
INSERT INTO public2.locations VALUES (1713, 'Santa Clara', 38, -24.309370040893555, -64.6618423461914);
INSERT INTO public2.locations VALUES (1714, 'Vinalito', 38, -23.667919158935547, -64.413658142089844);
INSERT INTO public2.locations VALUES (1715, 'Casira', 38, -21.977680206298828, -65.89605712890625);
INSERT INTO public2.locations VALUES (1716, 'CiÃ©nega de Paicone', 38, -22.178562164306641, -66.412567138671875);
INSERT INTO public2.locations VALUES (1717, 'Cieneguillas', 38, -22.100629806518555, -65.8668212890625);
INSERT INTO public2.locations VALUES (1718, 'Cusi Cusi', 38, -22.3403377532959, -66.493484497070312);
INSERT INTO public2.locations VALUES (1719, 'El Ansto', 38, -21.876802444458008, -66.188560485839844);
INSERT INTO public2.locations VALUES (1720, 'La CiÃ©nega', 38, -21.962299346923828, -66.262741088867188);
INSERT INTO public2.locations VALUES (1721, 'Misarrumi', 38, -22.259912490844727, -66.367988586425781);
INSERT INTO public2.locations VALUES (1722, 'Oratorio', 38, -22.098918914794922, -66.1324691772461);
INSERT INTO public2.locations VALUES (1723, 'Paicone', 38, -22.219547271728516, -66.424980163574219);
INSERT INTO public2.locations VALUES (1724, 'San Juan de Oros', 38, -22.225687026977539, -66.248748779296875);
INSERT INTO public2.locations VALUES (1725, 'Santa Catalina', 38, -21.947109222412109, -66.051765441894531);
INSERT INTO public2.locations VALUES (1726, 'Yoscaba', 38, -22.166954040527344, -66.024574279785156);
INSERT INTO public2.locations VALUES (1727, 'Catua', 38, -23.870126724243164, -67.0044937133789);
INSERT INTO public2.locations VALUES (1728, 'Coranzuli', 38, -23.013784408569336, -66.366645812988281);
INSERT INTO public2.locations VALUES (1729, 'El Toro', 38, -23.083419799804688, -66.702217102050781);
INSERT INTO public2.locations VALUES (1730, 'HuÃ¡ncar', 38, -23.564098358154297, -66.409950256347656);
INSERT INTO public2.locations VALUES (1731, 'Jama', 38, -23.239864349365234, -67.018096923828125);
INSERT INTO public2.locations VALUES (1732, 'Mina Providencia', 38, -23.262924194335938, -66.798515319824219);
INSERT INTO public2.locations VALUES (1733, 'Olacapato', 38, -24.11414909362793, -66.719367980957031);
INSERT INTO public2.locations VALUES (1734, 'Olaroz Chico', 38, -23.3936710357666, -66.803092956542969);
INSERT INTO public2.locations VALUES (1735, 'Pastos Chicos', 38, -23.7659912109375, -66.4373779296875);
INSERT INTO public2.locations VALUES (1736, 'Puesto Sey', 38, -23.9455623626709, -66.488265991210938);
INSERT INTO public2.locations VALUES (1737, 'San Juan de QuillaquÃ©s', 38, -23.230693817138672, -66.3427734375);
INSERT INTO public2.locations VALUES (1738, 'Susques', 38, -23.397541046142578, -66.367347717285156);
INSERT INTO public2.locations VALUES (1739, 'Colonia San JosÃ©', 38, -23.392688751220703, -65.345611572265625);
INSERT INTO public2.locations VALUES (1740, 'Huacalera', 38, -23.43903923034668, -65.350013732910156);
INSERT INTO public2.locations VALUES (1741, 'Juella', 38, -23.522661209106445, -65.400016784667969);
INSERT INTO public2.locations VALUES (1742, 'MaimarÃ¡', 38, -23.624540328979492, -65.4088134765625);
INSERT INTO public2.locations VALUES (1743, 'Tilcara', 38, -23.576894760131836, -65.39337158203125);
INSERT INTO public2.locations VALUES (1744, 'BÃ¡rcena', 38, -23.982234954833984, -65.452445983886719);
INSERT INTO public2.locations VALUES (1745, 'El Moreno', 38, -23.853706359863281, -65.831794738769531);
INSERT INTO public2.locations VALUES (1746, 'Puerta de Colorados', 38, -23.571002960205078, -65.697128295898438);
INSERT INTO public2.locations VALUES (1747, 'Purmamarca', 38, -23.74659538269043, -65.499198913574219);
INSERT INTO public2.locations VALUES (1748, 'Tumbaya', 38, -23.857698440551758, -65.467559814453125);
INSERT INTO public2.locations VALUES (1749, 'VolcÃ¡n', 38, -23.917152404785156, -65.46405029296875);
INSERT INTO public2.locations VALUES (1750, 'CaspalÃ¡', 38, -23.363370895385742, -65.092437744140625);
INSERT INTO public2.locations VALUES (1751, 'Pampichuela', 38, -23.554592132568359, -65.0081787109375);
INSERT INTO public2.locations VALUES (1752, 'San Francisco', 38, -23.62208366394043, -64.950614929199219);
INSERT INTO public2.locations VALUES (1753, 'Santa Ana', 38, -23.355998992919922, -64.9891586303711);
INSERT INTO public2.locations VALUES (1754, 'Valle Colorado', 38, -23.413734436035156, -64.933418273925781);
INSERT INTO public2.locations VALUES (1755, 'Valle Grande', 38, -23.475818634033203, -64.946769714355469);
INSERT INTO public2.locations VALUES (1756, 'Barrios', 38, -22.247072219848633, -65.529266357421875);
INSERT INTO public2.locations VALUES (1757, 'Cangrejillos', 38, -22.424232482910156, -65.58099365234375);
INSERT INTO public2.locations VALUES (1758, 'El CÃ³ndor', 38, -22.38831901550293, -65.3379898071289);
INSERT INTO public2.locations VALUES (1759, 'La Intermedia', 38, -22.421173095703125, -65.701507568359375);
INSERT INTO public2.locations VALUES (1760, 'La Quiaca', 38, -22.104452133178711, -65.59637451171875);
INSERT INTO public2.locations VALUES (1761, 'Llulluchayoc', 38, -22.548789978027344, -65.38751220703125);
INSERT INTO public2.locations VALUES (1762, 'Pumahuasi', 38, -22.289972305297852, -65.6800765991211);
INSERT INTO public2.locations VALUES (1763, 'Yavi', 38, -22.13072395324707, -65.462532043457031);
INSERT INTO public2.locations VALUES (1764, 'Yavi Chico', 38, -22.098939895629883, -65.459197998046875);
INSERT INTO public2.locations VALUES (1765, 'Doblas', 42, -37.150470733642578, -64.011528015136719);
INSERT INTO public2.locations VALUES (1766, 'MacachÃ­n', 42, -37.136978149414062, -63.666740417480469);
INSERT INTO public2.locations VALUES (1767, 'Miguel Riglos', 42, -36.856395721435547, -63.687824249267578);
INSERT INTO public2.locations VALUES (1768, 'RolÃ³n', 42, -37.166580200195312, -63.415023803710938);
INSERT INTO public2.locations VALUES (1769, 'TomÃ¡s M. Anchorena', 42, -36.840339660644531, -63.524822235107422);
INSERT INTO public2.locations VALUES (1770, 'AnzoÃ¡tegui', 42, -38.963050842285156, -63.860889434814453);
INSERT INTO public2.locations VALUES (1771, 'La Adela', 42, -38.985328674316406, -64.090538024902344);
INSERT INTO public2.locations VALUES (1772, 'Anguil', 42, -36.526836395263672, -64.011703491210938);
INSERT INTO public2.locations VALUES (1773, 'Santa Rosa', 42, -36.620399475097656, -64.2906265258789);
INSERT INTO public2.locations VALUES (1774, 'CatrilÃ³', 42, -36.40667724609375, -63.423336029052734);
INSERT INTO public2.locations VALUES (1775, 'La Gloria', 42, -36.508384704589844, -63.743106842041016);
INSERT INTO public2.locations VALUES (1776, 'Lonquimay', 42, -36.466407775878906, -63.623615264892578);
INSERT INTO public2.locations VALUES (1777, 'Uriburu', 42, -36.506320953369141, -63.860107421875);
INSERT INTO public2.locations VALUES (1778, 'Conhelo', 42, -36.000530242919922, -64.5985107421875);
INSERT INTO public2.locations VALUES (1779, 'Eduardo Castex', 42, -35.916061401367188, -64.295578002929688);
INSERT INTO public2.locations VALUES (1780, 'Mauricio Mayer', 42, -36.2115364074707, -64.033134460449219);
INSERT INTO public2.locations VALUES (1781, 'Monte Nievas', 42, -35.8615837097168, -64.1531753540039);
INSERT INTO public2.locations VALUES (1782, 'Rucanelo', 42, -36.041797637939453, -64.835723876953125);
INSERT INTO public2.locations VALUES (1783, 'Winifreda', 42, -36.227466583251953, -64.233505249023438);
INSERT INTO public2.locations VALUES (1784, 'bernador Duval', 42, -38.742942810058594, -66.4354248046875);
INSERT INTO public2.locations VALUES (1785, 'Puelches', 42, -38.14630126953125, -65.9140396118164);
INSERT INTO public2.locations VALUES (1786, 'Santa Isabel', 42, -36.230194091796875, -66.938972473144531);
INSERT INTO public2.locations VALUES (1787, 'Bernardo Larroude', 42, -35.025947570800781, -63.582756042480469);
INSERT INTO public2.locations VALUES (1788, 'Ceballos', 42, -35.290786743164062, -63.7769889831543);
INSERT INTO public2.locations VALUES (1789, 'Coronel Hilario Las', 42, -35.024120330810547, -63.912071228027344);
INSERT INTO public2.locations VALUES (1790, 'Intendente Alvear', 42, -35.23468017578125, -63.592086791992188);
INSERT INTO public2.locations VALUES (1791, 'Sarah', 42, -35.028079986572266, -63.685932159423828);
INSERT INTO public2.locations VALUES (1792, 'VÃ©rtiz', 42, -35.427444458007812, -63.909984588623047);
INSERT INTO public2.locations VALUES (1793, 'Algarrobo del Ãguila', 42, -36.3980827331543, -67.144493103027344);
INSERT INTO public2.locations VALUES (1794, 'La Humada', 42, -36.349037170410156, -68.013519287109375);
INSERT INTO public2.locations VALUES (1795, 'Alpachiri', 42, -37.376834869384766, -63.773231506347656);
INSERT INTO public2.locations VALUES (1796, 'General Manuel J. Campos', 42, -37.461452484130859, -63.585758209228516);
INSERT INTO public2.locations VALUES (1797, 'GuatrachÃ©', 42, -37.670726776123047, -63.535758972167969);
INSERT INTO public2.locations VALUES (1798, 'PerÃº', 42, -37.661209106445312, -64.139244079589844);
INSERT INTO public2.locations VALUES (1799, 'Santa Teresa', 42, -37.574787139892578, -63.431320190429688);
INSERT INTO public2.locations VALUES (1800, 'Abramo', 42, -37.896564483642578, -63.850433349609375);
INSERT INTO public2.locations VALUES (1801, 'Bernasconi', 42, -37.902252197265625, -63.742954254150391);
INSERT INTO public2.locations VALUES (1802, 'General San MartÃ­n', 42, -37.9788818359375, -63.603492736816406);
INSERT INTO public2.locations VALUES (1803, 'Hucal', 42, -37.791141510009766, -64.025253295898438);
INSERT INTO public2.locations VALUES (1804, 'Jacinto ArÃ¡uz', 42, -38.0828742980957, -63.429439544677734);
INSERT INTO public2.locations VALUES (1805, 'Cuchillo Co', 42, -38.33367919921875, -64.642250061035156);
INSERT INTO public2.locations VALUES (1806, 'La Reforma', 42, -37.551185607910156, -66.22711181640625);
INSERT INTO public2.locations VALUES (1807, 'Limay Mahuida', 42, -37.159832000732422, -66.675125122070312);
INSERT INTO public2.locations VALUES (1808, 'Carro Quemado', 42, -36.474925994873047, -65.344657897949219);
INSERT INTO public2.locations VALUES (1809, 'LoventuÃ©', 42, -36.188896179199219, -65.2893295288086);
INSERT INTO public2.locations VALUES (1810, 'Luan Toro', 42, -36.203952789306641, -65.099647521972656);
INSERT INTO public2.locations VALUES (1811, 'TelÃ©n', 42, -36.264278411865234, -65.511177062988281);
INSERT INTO public2.locations VALUES (1812, 'Victorica', 42, -36.216537475585938, -65.437088012695312);
INSERT INTO public2.locations VALUES (1813, 'Agustoni', 42, -35.782070159912109, -63.3916130065918);
INSERT INTO public2.locations VALUES (1814, 'Dorila', 42, -35.776321411132812, -63.716838836669922);
INSERT INTO public2.locations VALUES (1815, 'General Pico', 42, -35.6593017578125, -63.75787353515625);
INSERT INTO public2.locations VALUES (1816, 'Speluzzi', 42, -35.549709320068359, -63.820510864257812);
INSERT INTO public2.locations VALUES (1817, 'Trebolares', 42, -35.584468841552734, -63.589076995849609);
INSERT INTO public2.locations VALUES (1818, 'Casa de Piedra', 42, -38.1545524597168, -67.152496337890625);
INSERT INTO public2.locations VALUES (1819, 'PuelÃ©n', 42, -37.344173431396484, -67.619560241699219);
INSERT INTO public2.locations VALUES (1820, '25 de Mayo', 42, -37.774909973144531, -67.713539123535156);
INSERT INTO public2.locations VALUES (1821, 'Colonia BarÃ³n', 42, -36.153610229492188, -63.855205535888672);
INSERT INTO public2.locations VALUES (1822, 'Colonia San JosÃ©', 42, -36.117050170898438, -63.904071807861328);
INSERT INTO public2.locations VALUES (1823, 'Miguel CanÃ©', 42, -36.157184600830078, -63.512596130371094);
INSERT INTO public2.locations VALUES (1824, 'QuemÃº QuemÃº', 42, -36.054828643798828, -63.565940856933594);
INSERT INTO public2.locations VALUES (1825, 'Relmo', 42, -36.256504058837891, -63.448089599609375);
INSERT INTO public2.locations VALUES (1826, 'Villa Mirasol', 42, -36.076370239257812, -63.886325836181641);
INSERT INTO public2.locations VALUES (1827, 'CaleufÃº', 42, -35.594490051269531, -64.558677673339844);
INSERT INTO public2.locations VALUES (1828, 'Ingeniero Foster', 42, -35.703460693359375, -65.10296630859375);
INSERT INTO public2.locations VALUES (1829, 'La Maruja', 42, -35.673877716064453, -64.942138671875);
INSERT INTO public2.locations VALUES (1830, 'Parera', 42, -35.146759033203125, -64.502311706542969);
INSERT INTO public2.locations VALUES (1831, 'Pichi Huinca', 42, -35.648605346679688, -64.769783020019531);
INSERT INTO public2.locations VALUES (1832, 'QuetrequÃ©n', 42, -35.057044982910156, -64.523162841796875);
INSERT INTO public2.locations VALUES (1833, 'Rancul', 42, -35.067768096923828, -64.684219360351562);
INSERT INTO public2.locations VALUES (1834, 'Adolfo Van Praet', 42, -35.016674041748047, -64.035316467285156);
INSERT INTO public2.locations VALUES (1835, 'Alta Italia', 42, -35.334423065185547, -64.117141723632812);
INSERT INTO public2.locations VALUES (1836, 'DamiÃ¡n Maisonave', 42, -35.041427612304688, -64.385910034179688);
INSERT INTO public2.locations VALUES (1837, 'Embajador Martini', 42, -35.387348175048828, -64.282768249511719);
INSERT INTO public2.locations VALUES (1838, 'Falucho', 42, -35.190727233886719, -64.107063293457031);
INSERT INTO public2.locations VALUES (1839, 'Ingeniero Luiggi', 42, -35.388469696044922, -64.467369079589844);
INSERT INTO public2.locations VALUES (1840, 'Ojeda', 42, -35.306941986083984, -64.0060806274414);
INSERT INTO public2.locations VALUES (1841, 'RealicÃ³', 42, -35.038215637207031, -64.246307373046875);
INSERT INTO public2.locations VALUES (1842, 'Cachirulo', 42, -36.747394561767578, -64.367393493652344);
INSERT INTO public2.locations VALUES (1843, 'NaicÃ³', 42, -36.925724029541016, -64.405075073242188);
INSERT INTO public2.locations VALUES (1844, 'Toay', 42, -36.673896789550781, -64.379791259765625);
INSERT INTO public2.locations VALUES (1845, 'Arata', 42, -35.639083862304688, -64.356361389160156);
INSERT INTO public2.locations VALUES (1846, 'Metileo', 42, -35.7741584777832, -63.940631866455078);
INSERT INTO public2.locations VALUES (1847, 'Trenel', 42, -35.698329925537109, -64.133285522460938);
INSERT INTO public2.locations VALUES (1848, 'Ataliva Roca', 42, -37.031810760498047, -64.28533935546875);
INSERT INTO public2.locations VALUES (1849, 'Chacharramendi', 42, -37.3320426940918, -65.651626586914062);
INSERT INTO public2.locations VALUES (1850, 'Colonia Santa MarÃ­a', 42, -37.494789123535156, -64.224113464355469);
INSERT INTO public2.locations VALUES (1851, 'General Acha', 42, -37.378211975097656, -64.604217529296875);
INSERT INTO public2.locations VALUES (1852, 'QuehuÃ©', 42, -37.121822357177734, -64.515174865722656);
INSERT INTO public2.locations VALUES (1853, 'UnanuÃ©', 42, -37.544151306152344, -64.35125732421875);
INSERT INTO public2.locations VALUES (1854, 'Aimogasta', 46, -28.553760528564453, -66.813430786132812);
INSERT INTO public2.locations VALUES (1855, 'BaÃ±ado de los Pantanos', 46, -28.378555297851562, -66.830581665039062);
INSERT INTO public2.locations VALUES (1856, 'EstaciÃ³n MazÃ¡n', 46, -28.677701950073242, -66.490928649902344);
INSERT INTO public2.locations VALUES (1857, 'Termas de Santa Teresita', 46, -28.590538024902344, -66.555389404296875);
INSERT INTO public2.locations VALUES (1858, 'Villa MazÃ¡n', 46, -28.664104461669922, -66.544471740722656);
INSERT INTO public2.locations VALUES (1859, 'La Rioja', 46, -29.412883758544922, -66.855827331542969);
INSERT INTO public2.locations VALUES (1860, 'Aminga', 46, -28.84776496887207, -66.930496215820312);
INSERT INTO public2.locations VALUES (1861, 'Anillaco', 46, -28.80653190612793, -66.9413833618164);
INSERT INTO public2.locations VALUES (1862, 'AnjullÃ³n', 46, -28.723846435546875, -66.923385620117188);
INSERT INTO public2.locations VALUES (1863, 'Chuquis', 46, -28.890956878662109, -66.971626281738281);
INSERT INTO public2.locations VALUES (1864, 'Los Molinos', 46, -28.746225357055664, -66.9326400756836);
INSERT INTO public2.locations VALUES (1865, 'Pinchas', 46, -28.934785842895508, -66.961166381835938);
INSERT INTO public2.locations VALUES (1866, 'San Pedro', 46, -28.661724090576172, -66.923011779785156);
INSERT INTO public2.locations VALUES (1867, 'Santa Vera Cruz', 46, -28.675748825073242, -66.960556030273438);
INSERT INTO public2.locations VALUES (1868, 'AicuÃ±Ã¡', 46, -29.472785949707031, -67.774604797363281);
INSERT INTO public2.locations VALUES (1869, 'Guandacol', 46, -29.525239944458008, -68.562744140625);
INSERT INTO public2.locations VALUES (1870, 'Los Palacios', 46, -29.369304656982422, -68.235542297363281);
INSERT INTO public2.locations VALUES (1871, 'Pagancillo', 46, -29.541568756103516, -68.099937438964844);
INSERT INTO public2.locations VALUES (1872, 'Villa UniÃ³n', 46, -29.3177547454834, -68.227745056152344);
INSERT INTO public2.locations VALUES (1873, 'Chamical', 46, -30.359439849853516, -66.312660217285156);
INSERT INTO public2.locations VALUES (1874, 'Polco', 46, -30.405422210693359, -66.367996215820312);
INSERT INTO public2.locations VALUES (1875, 'Chilecito', 46, -29.165105819702148, -67.4952163696289);
INSERT INTO public2.locations VALUES (1876, 'Colonia AnguinÃ¡n', 46, -29.250576019287109, -67.443832397460938);
INSERT INTO public2.locations VALUES (1877, 'Colonia Malligasta', 46, -29.198064804077148, -67.3981704711914);
INSERT INTO public2.locations VALUES (1878, 'Colonia Vichigasta', 46, -29.449556350708008, -67.4876708984375);
INSERT INTO public2.locations VALUES (1879, 'GuanchÃ­n', 46, -29.190240859985352, -67.63775634765625);
INSERT INTO public2.locations VALUES (1880, 'Malligasta', 46, -29.176454544067383, -67.434890747070312);
INSERT INTO public2.locations VALUES (1881, 'Miranda', 46, -29.339189529418945, -67.6624755859375);
INSERT INTO public2.locations VALUES (1882, 'Nonogasta', 46, -29.302209854125977, -67.506187438964844);
INSERT INTO public2.locations VALUES (1883, 'San NicolÃ¡s', 46, -29.115036010742188, -67.473602294921875);
INSERT INTO public2.locations VALUES (1884, 'Santa Florentina', 46, -29.129322052001953, -67.556137084960938);
INSERT INTO public2.locations VALUES (1885, 'SaÃ±ogasta', 46, -29.322210311889648, -67.602828979492188);
INSERT INTO public2.locations VALUES (1886, 'Tilimuqui', 46, -29.143369674682617, -67.425384521484375);
INSERT INTO public2.locations VALUES (1887, 'Vichigasta', 46, -29.485263824462891, -67.50677490234375);
INSERT INTO public2.locations VALUES (1888, 'Alto Carrizal', 46, -28.866735458374023, -67.571418762207031);
INSERT INTO public2.locations VALUES (1889, 'Angulos', 46, -28.655654907226562, -67.652252197265625);
INSERT INTO public2.locations VALUES (1890, 'Antinaco', 46, -28.8193416595459, -67.314857482910156);
INSERT INTO public2.locations VALUES (1891, 'Bajo Carrizal', 46, -28.888063430786133, -67.564132690429688);
INSERT INTO public2.locations VALUES (1892, 'Campanas', 46, -28.552579879760742, -67.627883911132812);
INSERT INTO public2.locations VALUES (1893, 'ChaÃ±armuyo', 46, -28.603193283081055, -67.583183288574219);
INSERT INTO public2.locations VALUES (1894, 'Famatina', 46, -28.925048828125, -67.51959228515625);
INSERT INTO public2.locations VALUES (1895, 'La Cuadra', 46, -28.468244552612305, -67.692306518554688);
INSERT INTO public2.locations VALUES (1896, 'Pituil', 46, -28.575977325439453, -67.4490966796875);
INSERT INTO public2.locations VALUES (1897, 'Plaza Vieja', 46, -28.9654598236084, -67.5162353515625);
INSERT INTO public2.locations VALUES (1898, 'Santa Cruz', 46, -28.483879089355469, -67.6937255859375);
INSERT INTO public2.locations VALUES (1899, 'Santo Domin', 46, -28.554376602172852, -67.6719970703125);
INSERT INTO public2.locations VALUES (1900, 'Punta de los Llanos', 46, -30.154411315917969, -66.546737670898438);
INSERT INTO public2.locations VALUES (1901, 'Tama', 46, -30.506616592407227, -66.5289306640625);
INSERT INTO public2.locations VALUES (1902, 'Castro Barros', 46, -30.578893661499023, -65.72711181640625);
INSERT INTO public2.locations VALUES (1903, 'ChaÃ±ar', 46, -30.541440963745117, -65.956062316894531);
INSERT INTO public2.locations VALUES (1904, 'Loma Blanca', 46, -30.641008377075195, -66.242630004882812);
INSERT INTO public2.locations VALUES (1905, 'Olta', 46, -30.63067626953125, -66.267250061035156);
INSERT INTO public2.locations VALUES (1906, 'MalanzÃ¡n', 46, -30.804670333862305, -66.604232788085938);
INSERT INTO public2.locations VALUES (1907, 'NÃ¡cate', 46, -30.852907180786133, -66.4249496459961);
INSERT INTO public2.locations VALUES (1908, 'Portezuelo', 46, -30.836906433105469, -66.7018051147461);
INSERT INTO public2.locations VALUES (1909, 'San Antonio', 46, -31.085346221923828, -66.7315902709961);
INSERT INTO public2.locations VALUES (1910, 'Villa Castelli', 46, -29.0201416015625, -68.229484558105469);
INSERT INTO public2.locations VALUES (1911, 'Ambil', 46, -31.129579544067383, -66.343917846679688);
INSERT INTO public2.locations VALUES (1912, 'Colonia Ortiz de Ocampo', 46, -30.962785720825195, -66.17669677734375);
INSERT INTO public2.locations VALUES (1913, 'Milagro', 46, -31.005817413330078, -65.992393493652344);
INSERT INTO public2.locations VALUES (1914, 'Olpas', 46, -30.806182861328125, -66.24395751953125);
INSERT INTO public2.locations VALUES (1915, 'Santa Rita de Catuna', 46, -30.9547119140625, -66.220687866210938);
INSERT INTO public2.locations VALUES (1916, 'Ulapes', 46, -31.572746276855469, -66.237533569335938);
INSERT INTO public2.locations VALUES (1917, 'JagÃ¼Ã©', 46, -28.663721084594727, -68.3857421875);
INSERT INTO public2.locations VALUES (1918, 'Villa San JosÃ© de Vinchina', 46, -28.753696441650391, -68.204841613769531);
INSERT INTO public2.locations VALUES (1919, 'AmanÃ¡', 46, -30.054637908935547, -67.504432678222656);
INSERT INTO public2.locations VALUES (1920, 'PatquÃ­a', 46, -30.048147201538086, -66.879714965820312);
INSERT INTO public2.locations VALUES (1921, 'Chepes', 46, -31.340972900390625, -66.591926574707031);
INSERT INTO public2.locations VALUES (1922, 'Desiderio Tello', 46, -31.212497711181641, -66.3144302368164);
INSERT INTO public2.locations VALUES (1923, 'Salicas - San Blas', 46, -28.37384033203125, -67.070610046386719);
INSERT INTO public2.locations VALUES (1924, 'Villa Sanagasta', 46, -29.282281875610352, -67.020950317382812);
INSERT INTO public2.locations VALUES (1925, 'Mendoza', 50, -32.889732360839844, -68.844444274902344);
INSERT INTO public2.locations VALUES (1926, 'Bowen', 50, -35.000347137451172, -67.510337829589844);
INSERT INTO public2.locations VALUES (1927, 'Carmensa', 50, -35.1480827331543, -67.6552734375);
INSERT INTO public2.locations VALUES (1928, 'General Alvear', 50, -34.977470397949219, -67.696182250976562);
INSERT INTO public2.locations VALUES (1929, 'Los Compartos', 50, -34.977859497070312, -67.651168823242188);
INSERT INTO public2.locations VALUES (1930, 'doy Cruz', 50, -32.925334930419922, -68.844284057617188);
INSERT INTO public2.locations VALUES (1931, 'Colonia Sevia', 50, -32.847599029541016, -68.714111328125);
INSERT INTO public2.locations VALUES (1932, 'GuaymallÃ©n', 50, -32.900051116943359, -68.787673950195312);
INSERT INTO public2.locations VALUES (1933, 'La Primavera', 50, -32.922138214111328, -68.671096801757812);
INSERT INTO public2.locations VALUES (1934, 'Los Corralitos', 50, -32.901069641113281, -68.697578430175781);
INSERT INTO public2.locations VALUES (1935, 'Puente de Hierro', 50, -32.867477416992188, -68.675811767578125);
INSERT INTO public2.locations VALUES (1936, 'Ingeniero Giagnoni', 50, -33.127826690673828, -68.412391662597656);
INSERT INTO public2.locations VALUES (1937, 'JunÃ­n', 50, -33.146530151367188, -68.487266540527344);
INSERT INTO public2.locations VALUES (1938, 'La Colonia', 50, -33.098941802978516, -68.480499267578125);
INSERT INTO public2.locations VALUES (1939, 'Los Barriales', 50, -33.099678039550781, -68.568809509277344);
INSERT INTO public2.locations VALUES (1940, 'Medrano', 50, -33.176773071289062, -68.615165710449219);
INSERT INTO public2.locations VALUES (1941, 'Phillips', 50, -33.200981140136719, -68.377494812011719);
INSERT INTO public2.locations VALUES (1942, 'RodrÃ­guez PeÃ±a', 50, -33.120441436767578, -68.595161437988281);
INSERT INTO public2.locations VALUES (1943, 'Desaguadero', 50, -33.402538299560547, -67.155502319335938);
INSERT INTO public2.locations VALUES (1944, 'La Paz', 50, -33.461696624755859, -67.552276611328125);
INSERT INTO public2.locations VALUES (1945, 'Villa Antigua', 50, -33.465141296386719, -67.5938720703125);
INSERT INTO public2.locations VALUES (1946, 'Blanco Encalada', 50, -33.038932800292969, -69.006439208984375);
INSERT INTO public2.locations VALUES (1947, 'JocolÃ­', 50, -32.587123870849609, -68.6686782836914);
INSERT INTO public2.locations VALUES (1948, 'Las Cuevas', 50, -32.813949584960938, -70.048957824707031);
INSERT INTO public2.locations VALUES (1949, 'Las Heras', 50, -32.850341796875, -68.840522766113281);
INSERT INTO public2.locations VALUES (1950, 'Los Penitentes', 50, -32.841526031494141, -69.842269897460938);
INSERT INTO public2.locations VALUES (1951, 'Polvaredas', 50, -32.794879913330078, -69.653549194335938);
INSERT INTO public2.locations VALUES (1952, 'Puente del Inca', 50, -32.824554443359375, -69.90997314453125);
INSERT INTO public2.locations VALUES (1953, 'Punta de Vacas', 50, -32.855781555175781, -69.763214111328125);
INSERT INTO public2.locations VALUES (1954, 'Uspallata', 50, -32.591133117675781, -69.347831726074219);
INSERT INTO public2.locations VALUES (1955, 'Barrio Alto del Olvido', 50, -32.669651031494141, -68.580001831054688);
INSERT INTO public2.locations VALUES (1956, 'Barrio JocolÃ­ II', 50, -32.656665802001953, -68.658950805664062);
INSERT INTO public2.locations VALUES (1957, 'Barrio La Palmera', 50, -32.701969146728516, -68.540092468261719);
INSERT INTO public2.locations VALUES (1958, 'Barrio La Pega', 50, -32.808017730712891, -68.669548034667969);
INSERT INTO public2.locations VALUES (1959, 'Barrio Lagunas de Bartoluzzi', 50, -32.612449645996094, -68.5622329711914);
INSERT INTO public2.locations VALUES (1960, 'Barrio Los Jarilleros', 50, -32.716304779052734, -68.652107238769531);
INSERT INTO public2.locations VALUES (1961, 'Barrio Los Olivos', 50, -32.6793212890625, -68.331871032714844);
INSERT INTO public2.locations VALUES (1962, 'Barrio Virgen del Rosario', 50, -32.701820373535156, -68.31451416015625);
INSERT INTO public2.locations VALUES (1963, 'Costa de Araujo', 50, -32.757640838623047, -68.408271789550781);
INSERT INTO public2.locations VALUES (1964, 'El Paramillo', 50, -32.781223297119141, -68.5338134765625);
INSERT INTO public2.locations VALUES (1965, 'El Vergel', 50, -32.758804321289062, -68.634109497070312);
INSERT INTO public2.locations VALUES (1966, 'Ingeniero Gustavo AndrÃ©', 50, -32.679458618164062, -68.317054748535156);
INSERT INTO public2.locations VALUES (1967, 'JocolÃ­', 50, -32.581214904785156, -68.665145874023438);
INSERT INTO public2.locations VALUES (1968, 'JocolÃ­ Viejo', 50, -32.708160400390625, -68.673423767089844);
INSERT INTO public2.locations VALUES (1969, 'Las Violetas', 50, -32.822517395019531, -68.6048812866211);
INSERT INTO public2.locations VALUES (1970, '3 de Mayo', 50, -32.680469512939453, -68.639228820800781);
INSERT INTO public2.locations VALUES (1971, 'Villa Tulumaya', 50, -32.721450805664062, -68.595779418945312);
INSERT INTO public2.locations VALUES (1972, 'Agrelo', 50, -33.120288848876953, -68.889122009277344);
INSERT INTO public2.locations VALUES (1973, 'Barrio Perdriel IV', 50, -33.076683044433594, -68.9137954711914);
INSERT INTO public2.locations VALUES (1974, 'Cacheuta', 50, -33.013145446777344, -69.118972778320312);
INSERT INTO public2.locations VALUES (1975, 'Costa Flores', 50, -33.0582275390625, -68.931869506835938);
INSERT INTO public2.locations VALUES (1976, 'El Carrizal', 50, -33.319610595703125, -68.756546020507812);
INSERT INTO public2.locations VALUES (1977, 'El Salto', 50, -32.959743499755859, -69.264862060546875);
INSERT INTO public2.locations VALUES (1978, 'Las Compuertas', 50, -33.037429809570312, -68.98321533203125);
INSERT INTO public2.locations VALUES (1979, 'Las Vegas', 50, -33.014747619628906, -69.272247314453125);
INSERT INTO public2.locations VALUES (1980, 'LujÃ¡n de Cuyo', 50, -33.039169311523438, -68.879554748535156);
INSERT INTO public2.locations VALUES (1981, 'Perdriel', 50, -33.074901580810547, -68.888397216796875);
INSERT INTO public2.locations VALUES (1982, 'Potrerillos', 50, -32.962322235107422, -69.2010498046875);
INSERT INTO public2.locations VALUES (1983, 'Ugarteche', 50, -33.212070465087891, -68.891349792480469);
INSERT INTO public2.locations VALUES (1984, 'Barrancas', 50, -33.081832885742188, -68.727615356445312);
INSERT INTO public2.locations VALUES (1985, 'Barrio JesÃºs de Nazaret', 50, -33.009567260742188, -68.716110229492188);
INSERT INTO public2.locations VALUES (1986, 'Cruz de Piedra', 50, -33.030242919921875, -68.7804183959961);
INSERT INTO public2.locations VALUES (1987, 'El Pedregal', 50, -32.858497619628906, -68.649765014648438);
INSERT INTO public2.locations VALUES (1988, 'Fray Luis BeltrÃ¡n', 50, -33.003997802734375, -68.6644515991211);
INSERT INTO public2.locations VALUES (1989, 'MaipÃº', 50, -32.984619140625, -68.7882080078125);
INSERT INTO public2.locations VALUES (1990, 'Rodeo del Medio', 50, -32.994869232177734, -68.685966491699219);
INSERT INTO public2.locations VALUES (1991, 'San Roque', 50, -33.033241271972656, -68.58612060546875);
INSERT INTO public2.locations VALUES (1992, 'Villa Teresa', 50, -33.018318176269531, -68.628814697265625);
INSERT INTO public2.locations VALUES (1993, 'Agua Escondida', 50, -36.154926300048828, -68.300849914550781);
INSERT INTO public2.locations VALUES (1994, 'Las LeÃ±as', 50, -35.147609710693359, -70.0821304321289);
INSERT INTO public2.locations VALUES (1995, 'MalargÃ¼e', 50, -35.4683723449707, -69.584709167480469);
INSERT INTO public2.locations VALUES (1996, 'Andrade', 50, -33.172676086425781, -68.502349853515625);
INSERT INTO public2.locations VALUES (1997, 'Barrio Cooperativa Los Campamentos', 50, -33.272991180419922, -68.413459777832031);
INSERT INTO public2.locations VALUES (1998, 'Barrio Rivadavia', 50, -33.231605529785156, -68.476837158203125);
INSERT INTO public2.locations VALUES (1999, 'El Mirador', 50, -33.290302276611328, -68.339317321777344);
INSERT INTO public2.locations VALUES (2000, 'La Central', 50, -33.273166656494141, -68.315315246582031);
INSERT INTO public2.locations VALUES (2001, 'La Esperanza', 50, -33.320034027099609, -68.329795837402344);
INSERT INTO public2.locations VALUES (2002, 'La Florida', 50, -33.265586853027344, -68.456512451171875);
INSERT INTO public2.locations VALUES (2003, 'La Libertad', 50, -33.212265014648438, -68.507843017578125);
INSERT INTO public2.locations VALUES (2004, 'Los Ãrboles', 50, -33.183250427246094, -68.566535949707031);
INSERT INTO public2.locations VALUES (2005, 'Los Campamentos', 50, -33.275493621826172, -68.392578125);
INSERT INTO public2.locations VALUES (2006, 'Medrano', 50, -33.181045532226562, -68.614982604980469);
INSERT INTO public2.locations VALUES (2007, 'Mundo Nuevo', 50, -33.175178527832031, -68.427604675292969);
INSERT INTO public2.locations VALUES (2008, 'ReducciÃ³n de Abajo', 50, -33.221614837646484, -68.557487487792969);
INSERT INTO public2.locations VALUES (2009, 'Rivadavia', 50, -33.195766448974609, -68.4659194946289);
INSERT INTO public2.locations VALUES (2010, 'Santa MarÃ­a de Oro', 50, -33.205894470214844, -68.428878784179688);
INSERT INTO public2.locations VALUES (2011, 'Barrio Carrasco', 50, -33.831108093261719, -69.048858642578125);
INSERT INTO public2.locations VALUES (2012, 'Barrio El Cepillo', 50, -33.835269927978516, -69.123649597167969);
INSERT INTO public2.locations VALUES (2013, 'Chilecito', 50, -33.891471862792969, -69.0711898803711);
INSERT INTO public2.locations VALUES (2014, 'Eugenio Bustos', 50, -33.778884887695312, -69.065277099609375);
INSERT INTO public2.locations VALUES (2015, 'La Consulta', 50, -33.733848571777344, -69.119888305664062);
INSERT INTO public2.locations VALUES (2016, 'Pareditas', 50, -33.942550659179688, -69.078544616699219);
INSERT INTO public2.locations VALUES (2017, 'San Carlos', 50, -33.772068023681641, -69.040390014648438);
INSERT INTO public2.locations VALUES (2018, 'Alto Verde', 50, -33.119571685791016, -68.406753540039062);
INSERT INTO public2.locations VALUES (2019, 'Barrio Chivilcoy', 50, -33.041957855224609, -68.352706909179688);
INSERT INTO public2.locations VALUES (2020, 'Barrio Emanuel', 50, -32.842994689941406, -68.393257141113281);
INSERT INTO public2.locations VALUES (2021, 'Barrio La EstaciÃ³n', 50, -33.154884338378906, -68.355537414550781);
INSERT INTO public2.locations VALUES (2022, 'Barrio Los Charabones', 50, -32.996192932128906, -68.278228759765625);
INSERT INTO public2.locations VALUES (2023, 'Barrio Ntra. Sra. De FÃ¡tima', 50, -33.125358581542969, -68.347892761230469);
INSERT INTO public2.locations VALUES (2024, 'Chapanay', 50, -32.984714508056641, -68.464393615722656);
INSERT INTO public2.locations VALUES (2025, 'Chivilcoy', 50, -33.04266357421875, -68.447914123535156);
INSERT INTO public2.locations VALUES (2026, 'El Espino', 50, -33.074886322021484, -68.396835327148438);
INSERT INTO public2.locations VALUES (2027, 'El RamblÃ³n', 50, -33.157352447509766, -68.295547485351562);
INSERT INTO public2.locations VALUES (2028, 'Montecaseros', 50, -33.013729095458984, -68.389823913574219);
INSERT INTO public2.locations VALUES (2029, 'Nueva California', 50, -32.749519348144531, -68.324127197265625);
INSERT INTO public2.locations VALUES (2030, 'San MartÃ­n', 50, -33.087715148925781, -68.4758071899414);
INSERT INTO public2.locations VALUES (2031, 'Tres PorteÃ±as', 50, -32.899368286132812, -68.388557434082031);
INSERT INTO public2.locations VALUES (2032, 'Barrio El Nevado', 50, -34.788135528564453, -67.979995727539062);
INSERT INTO public2.locations VALUES (2033, 'Barrio Empleados de Comercio', 50, -34.555744171142578, -68.301834106445312);
INSERT INTO public2.locations VALUES (2034, 'Barrio Intendencia', 50, -34.646869659423828, -68.2649917602539);
INSERT INTO public2.locations VALUES (2035, 'CapitÃ¡n Montoya', 50, -34.582309722900391, -68.457603454589844);
INSERT INTO public2.locations VALUES (2036, 'Cuadro Benegas', 50, -34.6385612487793, -68.466629028320312);
INSERT INTO public2.locations VALUES (2037, 'El Nihuil', 50, -35.027294158935547, -68.672813415527344);
INSERT INTO public2.locations VALUES (2038, 'El Sosneado', 50, -35.080986022949219, -69.58251953125);
INSERT INTO public2.locations VALUES (2039, 'El TropezÃ³n', 50, -34.683906555175781, -68.277900695800781);
INSERT INTO public2.locations VALUES (2040, 'udge', 50, -34.680030822753906, -68.1317367553711);
INSERT INTO public2.locations VALUES (2041, 'Jaime Prats', 50, -34.9102897644043, -67.820480346679688);
INSERT INTO public2.locations VALUES (2042, 'La Llave Nueva', 50, -34.639137268066406, -68.009902954101562);
INSERT INTO public2.locations VALUES (2043, 'Las Malvinas', 50, -34.835098266601562, -68.2486343383789);
INSERT INTO public2.locations VALUES (2044, 'Los Reyunos', 50, -34.575580596923828, -68.706100463867188);
INSERT INTO public2.locations VALUES (2045, 'Monte ComÃ¡n', 50, -34.592369079589844, -67.868949890136719);
INSERT INTO public2.locations VALUES (2046, 'Pobre Diablo', 50, -34.664646148681641, -68.35693359375);
INSERT INTO public2.locations VALUES (2047, 'Punta del Agua', 50, -35.527637481689453, -68.078559875488281);
INSERT INTO public2.locations VALUES (2048, 'Rama CaÃ­da', 50, -34.701400756835938, -68.368682861328125);
INSERT INTO public2.locations VALUES (2049, 'Real del Padre', 50, -34.842533111572266, -67.768928527832031);
INSERT INTO public2.locations VALUES (2050, 'Salto de las Rosas', 50, -34.725460052490234, -68.231254577636719);
INSERT INTO public2.locations VALUES (2051, 'San Rafael', 50, -34.612861633300781, -68.330413818359375);
INSERT INTO public2.locations VALUES (2052, '25 de Mayo', 50, -34.582557678222656, -68.536872863769531);
INSERT INTO public2.locations VALUES (2053, 'Villa Atuel', 50, -34.832061767578125, -67.923507690429688);
INSERT INTO public2.locations VALUES (2054, 'Villa Atuel Norte', 50, -34.754756927490234, -68.031021118164062);
INSERT INTO public2.locations VALUES (2055, 'Barrio 12 de Octubre', 50, -33.197040557861328, -68.255142211914062);
INSERT INTO public2.locations VALUES (2056, 'Barrio MarÃ­a Auxiliadora', 50, -33.243946075439453, -68.1735610961914);
INSERT INTO public2.locations VALUES (2057, 'Barrio Molina Cabrera', 50, -33.109046936035156, -68.187515258789062);
INSERT INTO public2.locations VALUES (2058, 'La Dormida', 50, -33.346717834472656, -67.917129516601562);
INSERT INTO public2.locations VALUES (2059, 'Las Catitas', 50, -33.293842315673828, -68.048515319824219);
INSERT INTO public2.locations VALUES (2060, 'Santa Rosa', 50, -33.254074096679688, -68.150665283203125);
INSERT INTO public2.locations VALUES (2061, 'Barrio San Cayetano', 50, -33.633472442626953, -69.1797103881836);
INSERT INTO public2.locations VALUES (2062, 'Campo Los Andes', 50, -33.700321197509766, -69.176498413085938);
INSERT INTO public2.locations VALUES (2063, 'Colonia Las Rosas', 50, -33.605640411376953, -69.104423522949219);
INSERT INTO public2.locations VALUES (2064, 'El Manzano', 50, -33.586139678955078, -69.327110290527344);
INSERT INTO public2.locations VALUES (2065, 'Los Sauces', 50, -33.594463348388672, -69.175498962402344);
INSERT INTO public2.locations VALUES (2066, 'TunuyÃ¡n', 50, -33.581253051757812, -69.015365600585938);
INSERT INTO public2.locations VALUES (2067, 'Vista Flores', 50, -33.650875091552734, -69.15576171875);
INSERT INTO public2.locations VALUES (2068, 'Barrio Belgrano Norte', 50, -33.330783843994141, -69.126167297363281);
INSERT INTO public2.locations VALUES (2069, 'CordÃ³n del Plata', 50, -33.462429046630859, -69.143257141113281);
INSERT INTO public2.locations VALUES (2070, 'El Peral', 50, -33.367134094238281, -69.184089660644531);
INSERT INTO public2.locations VALUES (2071, 'El Zampal', 50, -33.399066925048828, -69.105743408203125);
INSERT INTO public2.locations VALUES (2072, 'La Arboleda', 50, -33.3614616394043, -69.1196060180664);
INSERT INTO public2.locations VALUES (2073, 'San JosÃ©', 50, -33.308280944824219, -69.152900695800781);
INSERT INTO public2.locations VALUES (2074, 'Tupungato', 50, -33.372840881347656, -69.147575378417969);
INSERT INTO public2.locations VALUES (2075, 'ApÃ³stoles', 54, -27.91413688659668, -55.754856109619141);
INSERT INTO public2.locations VALUES (2076, 'Azara', 54, -28.060707092285156, -55.677070617675781);
INSERT INTO public2.locations VALUES (2077, 'Barrio Rural', 54, -27.881124496459961, -55.787277221679688);
INSERT INTO public2.locations VALUES (2078, 'EstaciÃ³n ApÃ³stoles', 54, -27.911529541015625, -55.809219360351562);
INSERT INTO public2.locations VALUES (2079, 'Pindapoy', 54, -27.749423980712891, -55.794780731201172);
INSERT INTO public2.locations VALUES (2080, 'RincÃ³n de Azara', 54, -28.113618850708008, -55.629531860351562);
INSERT INTO public2.locations VALUES (2081, 'San JosÃ©', 54, -27.769994735717773, -55.780303955078125);
INSERT INTO public2.locations VALUES (2082, 'Tres Capones', 54, -28.004253387451172, -55.609405517578125);
INSERT INTO public2.locations VALUES (2083, 'AristÃ³bulo del Valle', 54, -27.095676422119141, -54.893417358398438);
INSERT INTO public2.locations VALUES (2084, 'Campo Grande', 54, -27.20796012878418, -54.979701995849609);
INSERT INTO public2.locations VALUES (2085, 'Dos de Mayo', 54, -27.019937515258789, -54.684532165527344);
INSERT INTO public2.locations VALUES (2086, 'Dos de Mayo Nucleo III (BÂº Bernardino Rivadavia)', 54, -27.013338088989258, -54.608154296875);
INSERT INTO public2.locations VALUES (2087, 'KilÃ³metro 17', 54, -27.315740585327148, -54.902725219726562);
INSERT INTO public2.locations VALUES (2088, '1Âº de Mayo', 54, -27.167991638183594, -55.0290641784668);
INSERT INTO public2.locations VALUES (2089, 'Pueblo Illia', 54, -27.152578353881836, -54.560737609863281);
INSERT INTO public2.locations VALUES (2090, 'Salto Encantado', 54, -27.087322235107422, -54.833366394042969);
INSERT INTO public2.locations VALUES (2091, 'Barrio del La', 54, -27.466522216796875, -55.798992156982422);
INSERT INTO public2.locations VALUES (2092, 'Bonpland', 54, -27.485403060913086, -55.480094909667969);
INSERT INTO public2.locations VALUES (2093, 'Candelaria', 54, -27.461217880249023, -55.743961334228516);
INSERT INTO public2.locations VALUES (2094, 'Cerro CorÃ¡', 54, -27.511917114257812, -55.609603881835938);
INSERT INTO public2.locations VALUES (2095, 'Loreto', 54, -27.332944869995117, -55.522251129150391);
INSERT INTO public2.locations VALUES (2096, 'MÃ¡rtires', 54, -27.423131942749023, -55.377296447753906);
INSERT INTO public2.locations VALUES (2097, 'Profundidad', 54, -27.56171989440918, -55.704566955566406);
INSERT INTO public2.locations VALUES (2098, 'Puerto Santa Ana', 54, -27.335647583007812, -55.583126068115234);
INSERT INTO public2.locations VALUES (2099, 'Santa Ana', 54, -27.369213104248047, -55.581710815429688);
INSERT INTO public2.locations VALUES (2100, 'GarupÃ¡', 54, -27.48377799987793, -55.8297004699707);
INSERT INTO public2.locations VALUES (2101, 'Nemesio Parma', 54, -27.356475830078125, -56.0172233581543);
INSERT INTO public2.locations VALUES (2102, 'Posadas', 54, -27.366426467895508, -55.89398193359375);
INSERT INTO public2.locations VALUES (2103, 'Posadas (ExtensiÃ³n)', 54, -27.452434539794922, -55.852710723876953);
INSERT INTO public2.locations VALUES (2104, 'Barra ConcepciÃ³n', 54, -28.116697311401367, -55.581516265869141);
INSERT INTO public2.locations VALUES (2105, 'ConcepciÃ³n de la Sierra', 54, -27.98057746887207, -55.521587371826172);
INSERT INTO public2.locations VALUES (2106, 'La Corita', 54, -27.892534255981445, -55.355556488037109);
INSERT INTO public2.locations VALUES (2107, 'Santa MarÃ­a', 54, -27.934514999389648, -55.407333374023438);
INSERT INTO public2.locations VALUES (2108, 'Colonia Victoria', 54, -26.333686828613281, -54.624610900878906);
INSERT INTO public2.locations VALUES (2109, 'Eldorado', 54, -26.408876419067383, -54.607051849365234);
INSERT INTO public2.locations VALUES (2110, 'MarÃ­a Magdalena', 54, -26.237283706665039, -54.602897644042969);
INSERT INTO public2.locations VALUES (2111, 'Nueva Delicia', 54, -26.181728363037109, -54.591217041015625);
INSERT INTO public2.locations VALUES (2112, '9 de Julio KilÃ³metro 28', 54, -26.430280685424805, -54.466472625732422);
INSERT INTO public2.locations VALUES (2113, '9 de Julio KilÃ³metro 20', 54, -26.414716720581055, -54.495857238769531);
INSERT INTO public2.locations VALUES (2114, 'Pueblo Nuevo', 54, -26.2434139251709, -54.591224670410156);
INSERT INTO public2.locations VALUES (2115, 'Puerto Mado', 54, -26.229743957519531, -54.6235466003418);
INSERT INTO public2.locations VALUES (2116, 'Puerto Pinares', 54, -26.427339553833008, -54.682964324951172);
INSERT INTO public2.locations VALUES (2117, 'Santia de Liniers', 54, -26.401189804077148, -54.415645599365234);
INSERT INTO public2.locations VALUES (2118, 'Valle Hermoso', 54, -26.384422302246094, -54.463462829589844);
INSERT INTO public2.locations VALUES (2119, 'Villa Roulet', 54, -26.44236946105957, -54.640468597412109);
INSERT INTO public2.locations VALUES (2120, 'Comandante Andresito', 54, -25.667165756225586, -54.049861907958984);
INSERT INTO public2.locations VALUES (2121, 'Bernardo de Iriyen', 54, -26.255331039428711, -53.646736145019531);
INSERT INTO public2.locations VALUES (2122, 'Caburei', 54, -25.6821346282959, -54.141361236572266);
INSERT INTO public2.locations VALUES (2123, 'Dos Hermanas', 54, -26.293079376220703, -53.756931304931641);
INSERT INTO public2.locations VALUES (2124, 'IntegraciÃ³n', 54, -25.770961761474609, -53.855182647705078);
INSERT INTO public2.locations VALUES (2125, 'PiÃ±alito Norte', 54, -25.933115005493164, -53.932960510253906);
INSERT INTO public2.locations VALUES (2126, 'Puerto Andresito', 54, -25.596214294433594, -54.002414703369141);
INSERT INTO public2.locations VALUES (2127, 'Puerto Deseado', 54, -25.785835266113281, -54.038955688476562);
INSERT INTO public2.locations VALUES (2128, 'San Antonio', 54, -26.057371139526367, -53.7341194152832);
INSERT INTO public2.locations VALUES (2129, 'El Soberbio', 54, -27.297510147094727, -54.197544097900391);
INSERT INTO public2.locations VALUES (2130, 'FracrÃ¡n', 54, -26.743431091308594, -54.297454833984375);
INSERT INTO public2.locations VALUES (2131, 'San Vicente', 54, -26.993297576904297, -54.486618041992188);
INSERT INTO public2.locations VALUES (2132, 'Puerto Esperanza', 54, -26.020612716674805, -54.615200042724609);
INSERT INTO public2.locations VALUES (2133, 'Puerto Libertad', 54, -25.921468734741211, -54.584316253662109);
INSERT INTO public2.locations VALUES (2134, 'Puerto IguazÃº', 54, -25.597209930419922, -54.577224731445312);
INSERT INTO public2.locations VALUES (2135, 'Villa Cooperativa', 54, -25.944196701049805, -54.544940948486328);
INSERT INTO public2.locations VALUES (2136, 'Colonia Wanda', 54, -25.973365783691406, -54.563037872314453);
INSERT INTO public2.locations VALUES (2137, 'Almafuerte', 54, -27.50811767578125, -55.403522491455078);
INSERT INTO public2.locations VALUES (2138, 'Arroyo del Medio', 54, -27.698257446289062, -55.404865264892578);
INSERT INTO public2.locations VALUES (2139, 'CaÃ¡ - YarÃ­', 54, -27.484874725341797, -55.2989616394043);
INSERT INTO public2.locations VALUES (2140, 'Cerro Azul', 54, -27.633575439453125, -55.497417449951172);
INSERT INTO public2.locations VALUES (2141, 'Dos Arroyos', 54, -27.699075698852539, -55.251823425292969);
INSERT INTO public2.locations VALUES (2142, 'bernador LÃ³pez', 54, -27.666357040405273, -55.213470458984375);
INSERT INTO public2.locations VALUES (2143, 'Leandro N. Alem', 54, -27.603731155395508, -55.3236198425293);
INSERT INTO public2.locations VALUES (2144, 'Olegario V. Andrade', 54, -27.567586898803711, -55.502281188964844);
INSERT INTO public2.locations VALUES (2145, 'Villa Libertad', 54, -27.5654354095459, -55.320198059082031);
INSERT INTO public2.locations VALUES (2146, 'CapiovÃ­', 54, -26.928314208984375, -55.057296752929688);
INSERT INTO public2.locations VALUES (2147, 'CapioviciÃ±o', 54, -26.891714096069336, -55.072238922119141);
INSERT INTO public2.locations VALUES (2148, 'El AlcÃ¡zar', 54, -26.713647842407227, -54.814048767089844);
INSERT INTO public2.locations VALUES (2149, 'GaruhapÃ©', 54, -26.821125030517578, -54.957744598388672);
INSERT INTO public2.locations VALUES (2150, 'MbopicuÃ¡', 54, -26.863851547241211, -55.045162200927734);
INSERT INTO public2.locations VALUES (2151, 'Puerto Leoni', 54, -26.989847183227539, -55.1658821105957);
INSERT INTO public2.locations VALUES (2152, 'Puerto Rico', 54, -26.808591842651367, -55.022125244140625);
INSERT INTO public2.locations VALUES (2153, 'Ruiz de Montoya', 54, -26.970432281494141, -55.052223205566406);
INSERT INTO public2.locations VALUES (2154, 'San Alberto', 54, -26.808237075805664, -54.989471435546875);
INSERT INTO public2.locations VALUES (2155, 'San tardo', 54, -26.923730850219727, -55.123752593994141);
INSERT INTO public2.locations VALUES (2156, 'San Miguel', 54, -26.853658676147461, -54.8887939453125);
INSERT INTO public2.locations VALUES (2157, 'Villa Akerman', 54, -26.943328857421875, -55.09552001953125);
INSERT INTO public2.locations VALUES (2158, 'Villa Urrutia', 54, -26.836893081665039, -54.7530632019043);
INSERT INTO public2.locations VALUES (2159, 'Barrio Cuatro Bocas', 54, -26.550296783447266, -54.680545806884766);
INSERT INTO public2.locations VALUES (2160, 'Barrio Guatambu', 54, -26.605524063110352, -54.698707580566406);
INSERT INTO public2.locations VALUES (2161, 'Bario Ita', 54, -26.529523849487305, -54.706806182861328);
INSERT INTO public2.locations VALUES (2162, 'Caraguatay', 54, -26.657281875610352, -54.739177703857422);
INSERT INTO public2.locations VALUES (2163, 'Laharrague', 54, -26.535390853881836, -54.649738311767578);
INSERT INTO public2.locations VALUES (2164, 'Montecarlo', 54, -26.566654205322266, -54.766128540039062);
INSERT INTO public2.locations VALUES (2165, 'Piray KilÃ³metro 18', 54, -26.516050338745117, -54.5914192199707);
INSERT INTO public2.locations VALUES (2166, 'Puerto Piray', 54, -26.467338562011719, -54.718025207519531);
INSERT INTO public2.locations VALUES (2167, 'TarumÃ¡', 54, -26.717435836791992, -54.720062255859375);
INSERT INTO public2.locations VALUES (2168, 'Villa Parodi', 54, -26.498905181884766, -54.678302764892578);
INSERT INTO public2.locations VALUES (2169, 'Colonia Alberdi', 54, -27.360031127929688, -55.231327056884766);
INSERT INTO public2.locations VALUES (2170, 'Barrio Escuela 461', 54, -27.624458312988281, -55.039466857910156);
INSERT INTO public2.locations VALUES (2171, 'Barrio Escuela 633', 54, -27.470355987548828, -55.080589294433594);
INSERT INTO public2.locations VALUES (2172, 'Campo RamÃ³n', 54, -27.454269409179688, -55.02294921875);
INSERT INTO public2.locations VALUES (2173, 'Campo Viera', 54, -27.330970764160156, -55.054252624511719);
INSERT INTO public2.locations VALUES (2174, 'El Salto', 54, -27.495195388793945, -55.198726654052734);
INSERT INTO public2.locations VALUES (2175, 'General Alvear', 54, -27.426347732543945, -55.169605255126953);
INSERT INTO public2.locations VALUES (2176, 'GuaranÃ­', 54, -27.523176193237305, -55.157646179199219);
INSERT INTO public2.locations VALUES (2177, 'Los Helechos', 54, -27.557662963867188, -55.076263427734375);
INSERT INTO public2.locations VALUES (2178, 'OberÃ¡', 54, -27.486791610717773, -55.12005615234375);
INSERT INTO public2.locations VALUES (2179, 'PanambÃ­', 54, -27.722028732299805, -54.914825439453125);
INSERT INTO public2.locations VALUES (2180, 'PanambÃ­ KilÃ³metro 8', 54, -27.668500900268555, -54.9826774597168);
INSERT INTO public2.locations VALUES (2181, 'Panambi KilÃ³metro 15', 54, -27.709150314331055, -54.967449188232422);
INSERT INTO public2.locations VALUES (2182, 'San MartÃ­n', 54, -27.466043472290039, -55.275543212890625);
INSERT INTO public2.locations VALUES (2183, 'Villa Bonita', 54, -27.482900619506836, -54.9648323059082);
INSERT INTO public2.locations VALUES (2184, 'Barrio Tunil', 54, -27.114814758300781, -55.383869171142578);
INSERT INTO public2.locations VALUES (2185, 'Colonia Polana', 54, -26.981992721557617, -55.3182258605957);
INSERT INTO public2.locations VALUES (2186, 'Corpus', 54, -27.12946891784668, -55.510829925537109);
INSERT INTO public2.locations VALUES (2187, 'Domin Savio', 54, -27.355430603027344, -55.338470458984375);
INSERT INTO public2.locations VALUES (2188, 'General Urquiza', 54, -27.107866287231445, -55.376617431640625);
INSERT INTO public2.locations VALUES (2189, 'bernador Roca', 54, -27.190061569213867, -55.469318389892578);
INSERT INTO public2.locations VALUES (2190, 'Helvecia', 54, -27.109733581542969, -55.344459533691406);
INSERT INTO public2.locations VALUES (2191, 'HipÃ³lito Yriyen', 54, -27.085710525512695, -55.287418365478516);
INSERT INTO public2.locations VALUES (2192, 'JardÃ­n AmÃ©rica', 54, -27.043159484863281, -55.227016448974609);
INSERT INTO public2.locations VALUES (2193, 'Oasis', 54, -26.971725463867188, -55.249725341796875);
INSERT INTO public2.locations VALUES (2194, 'Roca Chica', 54, -27.21424674987793, -55.420017242431641);
INSERT INTO public2.locations VALUES (2195, 'San Ignacio', 54, -27.258613586425781, -55.538974761962891);
INSERT INTO public2.locations VALUES (2196, 'Santo PipÃ³', 54, -27.14012336730957, -55.40850830078125);
INSERT INTO public2.locations VALUES (2197, 'Florentino Ameghino', 54, -27.633617401123047, -55.085525512695312);
INSERT INTO public2.locations VALUES (2198, 'ItacaruarÃ©', 54, -27.871400833129883, -55.262214660644531);
INSERT INTO public2.locations VALUES (2199, 'MojÃ³n Grande', 54, -27.7120418548584, -55.157432556152344);
INSERT INTO public2.locations VALUES (2200, 'San Javier', 54, -27.869480133056641, -55.138713836669922);
INSERT INTO public2.locations VALUES (2201, 'Cruce Caballero', 54, -26.542098999023438, -53.941879272460938);
INSERT INTO public2.locations VALUES (2202, 'ParaÃ­so', 54, -26.68707275390625, -54.203071594238281);
INSERT INTO public2.locations VALUES (2203, 'PiÃ±alito Sur', 54, -26.426101684570312, -53.8414306640625);
INSERT INTO public2.locations VALUES (2204, 'San Pedro', 54, -26.625532150268555, -54.116302490234375);
INSERT INTO public2.locations VALUES (2205, 'Tobuna', 54, -26.469972610473633, -53.8911247253418);
INSERT INTO public2.locations VALUES (2206, 'Alba Posse', 54, -27.568950653076172, -54.683040618896484);
INSERT INTO public2.locations VALUES (2207, 'Alicia Alta', 54, -27.377819061279297, -54.352096557617188);
INSERT INTO public2.locations VALUES (2208, 'Alicia Baja', 54, -27.439401626586914, -54.353710174560547);
INSERT INTO public2.locations VALUES (2209, 'Colonia Aurora', 54, -27.473724365234375, -54.52410888671875);
INSERT INTO public2.locations VALUES (2210, 'San Francisco de AsÃ­s', 54, -27.462654113769531, -54.745319366455078);
INSERT INTO public2.locations VALUES (2211, 'Santa Rita', 54, -27.52032470703125, -54.727909088134766);
INSERT INTO public2.locations VALUES (2212, '25 de Mayo', 54, -27.3781795501709, -54.744876861572266);
INSERT INTO public2.locations VALUES (2213, 'AluminÃ©', 58, -39.238468170166016, -70.91595458984375);
INSERT INTO public2.locations VALUES (2214, 'Moquehue', 58, -38.942119598388672, -71.329010009765625);
INSERT INTO public2.locations VALUES (2215, 'Villa Pehuenia', 58, -38.882064819335938, -71.17315673828125);
INSERT INTO public2.locations VALUES (2216, 'Aguada San Roque', 58, -37.998676300048828, -68.922904968261719);
INSERT INTO public2.locations VALUES (2217, 'AÃ±elo', 58, -38.354255676269531, -68.787544250488281);
INSERT INTO public2.locations VALUES (2218, 'San Patricio del ChaÃ±ar', 58, -38.625877380371094, -68.299896240234375);
INSERT INTO public2.locations VALUES (2219, 'Las Coloradas', 58, -39.5564079284668, -70.594154357910156);
INSERT INTO public2.locations VALUES (2220, 'Piedra del Ãguila', 58, -40.048480987548828, -70.075019836425781);
INSERT INTO public2.locations VALUES (2221, 'Santo TomÃ¡s', 58, -39.820743560791016, -70.100517272949219);
INSERT INTO public2.locations VALUES (2222, 'Arroyito', 58, -39.074436187744141, -68.5726089477539);
INSERT INTO public2.locations VALUES (2223, 'Centenario', 58, -38.830158233642578, -68.121475219726562);
INSERT INTO public2.locations VALUES (2224, 'Cutral CÃ³', 58, -38.937911987304688, -69.229362487792969);
INSERT INTO public2.locations VALUES (2225, 'Mari Menuco', 58, -38.541358947753906, -68.545166015625);
INSERT INTO public2.locations VALUES (2226, 'NeuquÃ©n', 58, -38.951828002929688, -68.0591812133789);
INSERT INTO public2.locations VALUES (2227, 'Plaza Huincul', 58, -38.930122375488281, -69.207778930664062);
INSERT INTO public2.locations VALUES (2228, 'Plottier', 58, -38.952354431152344, -68.2271499633789);
INSERT INTO public2.locations VALUES (2229, 'Senillosa', 58, -39.010093688964844, -68.425979614257812);
INSERT INTO public2.locations VALUES (2230, 'Villa El ChocÃ³n', 58, -39.261547088623047, -68.7789306640625);
INSERT INTO public2.locations VALUES (2231, 'Vista Alegre Norte', 58, -38.734184265136719, -68.172821044921875);
INSERT INTO public2.locations VALUES (2232, 'Vista Alegre Sur', 58, -38.773029327392578, -68.135490417480469);
INSERT INTO public2.locations VALUES (2233, 'Chos Malal', 58, -37.374828338623047, -70.276329040527344);
INSERT INTO public2.locations VALUES (2234, 'Tricao Malal', 58, -37.044734954833984, -70.324821472167969);
INSERT INTO public2.locations VALUES (2235, 'Villa del Curi LeuvÃº', 58, -37.131141662597656, -70.397735595703125);
INSERT INTO public2.locations VALUES (2236, 'JunÃ­n de los Andes', 58, -39.950885772705078, -71.07086181640625);
INSERT INTO public2.locations VALUES (2237, 'San MartÃ­n de los Andes', 58, -40.156936645507812, -71.352714538574219);
INSERT INTO public2.locations VALUES (2238, 'Villa La Meliquina', 58, -40.383251190185547, -71.2533950805664);
INSERT INTO public2.locations VALUES (2239, 'Chorriaca', 58, -37.936840057373047, -70.1003646850586);
INSERT INTO public2.locations VALUES (2240, 'LoncopuÃ©', 58, -38.073089599609375, -70.614448547363281);
INSERT INTO public2.locations VALUES (2241, 'Villa La Anstura', 58, -40.762996673583984, -71.640998840332031);
INSERT INTO public2.locations VALUES (2242, 'Villa Traful', 58, -40.65435791015625, -71.400039672851562);
INSERT INTO public2.locations VALUES (2243, 'Andacollo', 58, -37.179744720458984, -70.669960021972656);
INSERT INTO public2.locations VALUES (2244, 'Huinganco', 58, -37.160736083984375, -70.624092102050781);
INSERT INTO public2.locations VALUES (2245, 'Las Ovejas', 58, -36.988971710205078, -70.749519348144531);
INSERT INTO public2.locations VALUES (2246, 'Los Miches', 58, -37.2054443359375, -70.819221496582031);
INSERT INTO public2.locations VALUES (2247, 'Manzano Amar', 58, -36.753089904785156, -70.763214111328125);
INSERT INTO public2.locations VALUES (2248, 'Varvarco', 58, -36.854789733886719, -70.678153991699219);
INSERT INTO public2.locations VALUES (2249, 'Villa del Nahueve', 58, -37.120281219482422, -70.77001953125);
INSERT INTO public2.locations VALUES (2250, 'Caviahue', 58, -37.871078491210938, -71.055061340332031);
INSERT INTO public2.locations VALUES (2251, 'Copahue', 58, -37.8188591003418, -71.0987777709961);
INSERT INTO public2.locations VALUES (2252, 'El Cholar', 58, -37.441482543945312, -70.64544677734375);
INSERT INTO public2.locations VALUES (2253, 'El HuecÃº', 58, -37.6449089050293, -70.581024169921875);
INSERT INTO public2.locations VALUES (2254, 'TaquimilÃ¡n', 58, -37.517448425292969, -70.2487564086914);
INSERT INTO public2.locations VALUES (2255, 'Barrancas', 58, -36.821285247802734, -69.915283203125);
INSERT INTO public2.locations VALUES (2256, 'Buta Ranquil', 58, -37.051609039306641, -69.877792358398438);
INSERT INTO public2.locations VALUES (2257, 'Octavio Pico', 58, -37.589626312255859, -68.2582778930664);
INSERT INTO public2.locations VALUES (2258, 'RincÃ³n de los Sauces', 58, -37.390178680419922, -68.925186157226562);
INSERT INTO public2.locations VALUES (2259, 'El Sauce', 58, -39.479816436767578, -69.5311508178711);
INSERT INTO public2.locations VALUES (2260, 'Paso Aguerre', 58, -39.338783264160156, -69.843597412109375);
INSERT INTO public2.locations VALUES (2261, 'PicÃºn LeufÃº', 58, -39.518627166748047, -69.291061401367188);
INSERT INTO public2.locations VALUES (2262, 'Bajada del Agrio', 58, -38.407436370849609, -70.0331039428711);
INSERT INTO public2.locations VALUES (2263, 'La Buitrera', 58, -38.552230834960938, -70.369430541992188);
INSERT INTO public2.locations VALUES (2264, 'Las Lajas', 58, -38.523414611816406, -70.361640930175781);
INSERT INTO public2.locations VALUES (2265, 'Quili Malal', 58, -38.326148986816406, -69.81353759765625);
INSERT INTO public2.locations VALUES (2266, 'Los Catutos', 58, -38.837356567382812, -70.198417663574219);
INSERT INTO public2.locations VALUES (2267, 'Mariano Moreno', 58, -38.761337280273438, -70.036361694335938);
INSERT INTO public2.locations VALUES (2268, 'RamÃ³n M. Castro', 58, -38.864330291748047, -69.744697570800781);
INSERT INTO public2.locations VALUES (2269, 'Zapala', 58, -38.902935028076172, -70.064208984375);
INSERT INTO public2.locations VALUES (2270, 'BahÃ­a Creek', 62, -41.083198547363281, -63.932601928710938);
INSERT INTO public2.locations VALUES (2271, 'El CÃ³ndor', 62, -41.041286468505859, -62.829010009765625);
INSERT INTO public2.locations VALUES (2272, 'El Juncal', 62, -40.807407379150391, -63.1232795715332);
INSERT INTO public2.locations VALUES (2273, 'Guardia Mitre', 62, -40.42572021484375, -63.6722526550293);
INSERT INTO public2.locations VALUES (2274, 'La LoberÃ­a', 62, -41.152725219726562, -63.125415802001953);
INSERT INTO public2.locations VALUES (2275, 'Loteo Costa de RÃ­o', 62, -40.869804382324219, -62.920387268066406);
INSERT INTO public2.locations VALUES (2276, 'Pozo Salado', 62, -41.012752532958984, -64.1624984741211);
INSERT INTO public2.locations VALUES (2277, 'San Javier', 62, -40.749797821044922, -63.267112731933594);
INSERT INTO public2.locations VALUES (2278, 'Viedma', 62, -40.808368682861328, -62.994930267333984);
INSERT INTO public2.locations VALUES (2279, 'Barrio UniÃ³n', 62, -39.165409088134766, -66.146415710449219);
INSERT INTO public2.locations VALUES (2280, 'ChelforÃ³', 62, -39.087718963623047, -66.520751953125);
INSERT INTO public2.locations VALUES (2281, 'Chimpay', 62, -39.165397644042969, -66.146415710449219);
INSERT INTO public2.locations VALUES (2282, 'Choele Choel', 62, -39.296356201171875, -65.657676696777344);
INSERT INTO public2.locations VALUES (2283, 'Coronel Belisle', 62, -39.186767578125, -65.954795837402344);
INSERT INTO public2.locations VALUES (2284, 'Darwin', 62, -39.202953338623047, -65.739753723144531);
INSERT INTO public2.locations VALUES (2285, 'Lamarque', 62, -39.425155639648438, -65.7021484375);
INSERT INTO public2.locations VALUES (2286, 'Luis BeltrÃ¡n', 62, -39.310707092285156, -65.763565063476562);
INSERT INTO public2.locations VALUES (2287, 'Pomona', 62, -39.487045288085938, -65.610794067382812);
INSERT INTO public2.locations VALUES (2288, 'Colonia Suiza', 62, -41.094535827636719, -71.508613586425781);
INSERT INTO public2.locations VALUES (2289, 'El BolsÃ³n', 62, -41.965023040771484, -71.53436279296875);
INSERT INTO public2.locations VALUES (2290, 'El Foyel', 62, -41.653900146484375, -71.4600830078125);
INSERT INTO public2.locations VALUES (2291, 'MallÃ­n Ahogado', 62, -41.839633941650391, -71.504409790039062);
INSERT INTO public2.locations VALUES (2292, 'RÃ­o Villegas', 62, -41.577854156494141, -71.502510070800781);
INSERT INTO public2.locations VALUES (2293, 'San Carlos de Bariloche', 62, -41.134197235107422, -71.310958862304688);
INSERT INTO public2.locations VALUES (2294, 'Villa Catedral', 62, -41.167621612548828, -71.440216064453125);
INSERT INTO public2.locations VALUES (2295, 'Villa Mascardi', 62, -41.349552154541016, -71.509040832519531);
INSERT INTO public2.locations VALUES (2296, 'Barrio Colonia Conesa', 62, -40.151035308837891, -64.348594665527344);
INSERT INTO public2.locations VALUES (2297, 'General Conesa', 62, -40.106185913085938, -64.453010559082031);
INSERT INTO public2.locations VALUES (2298, 'Barrio Planta Compresora de Gas', 62, -40.061931610107422, -64.474853515625);
INSERT INTO public2.locations VALUES (2299, 'Aguada GuzmÃ¡n', 62, -39.981857299804688, -68.873870849609375);
INSERT INTO public2.locations VALUES (2300, 'Cerro PolicÃ­a', 62, -39.726276397705078, -68.491500854492188);
INSERT INTO public2.locations VALUES (2301, 'El Cuy', 62, -39.926094055175781, -68.3427505493164);
INSERT INTO public2.locations VALUES (2302, 'Las Perlas', 62, -38.982254028320312, -68.1497573852539);
INSERT INTO public2.locations VALUES (2303, 'MencuÃ©', 62, -40.423641204833984, -69.6145248413086);
INSERT INTO public2.locations VALUES (2304, 'Naupa Huen', 62, -39.830223083496094, -69.509124755859375);
INSERT INTO public2.locations VALUES (2305, 'Paso CÃ³rdova', 62, -39.113857269287109, -67.626632690429688);
INSERT INTO public2.locations VALUES (2306, 'Valle Azul', 62, -39.15631103515625, -66.787551879882812);
INSERT INTO public2.locations VALUES (2307, 'Allen', 62, -38.979511260986328, -67.828018188476562);
INSERT INTO public2.locations VALUES (2308, 'Paraje ArroyÃ³n (Bajo San Cayetano)', 62, -38.726459503173828, -68.041168212890625);
INSERT INTO public2.locations VALUES (2309, 'Barda del Medio', 62, -38.725635528564453, -68.155891418457031);
INSERT INTO public2.locations VALUES (2310, 'Barrio Blanco', 62, -39.0352783203125, -67.7930908203125);
INSERT INTO public2.locations VALUES (2311, 'Barrio Calle Ciega NÂº 10', 62, -39.02227783203125, -67.803421020507812);
INSERT INTO public2.locations VALUES (2312, 'Barrio Calle Ciega NÂº 6', 62, -39.049858093261719, -67.736801147460938);
INSERT INTO public2.locations VALUES (2313, 'Barrio Canale', 62, -39.068851470947266, -67.6385498046875);
INSERT INTO public2.locations VALUES (2314, 'Barrio Chacra Monte', 62, -39.0515022277832, -67.635734558105469);
INSERT INTO public2.locations VALUES (2315, 'Barrio Costa Este', 62, -39.0291862487793, -67.810844421386719);
INSERT INTO public2.locations VALUES (2316, 'Barrio Costa Oeste', 62, -39.028072357177734, -67.8406982421875);
INSERT INTO public2.locations VALUES (2317, 'Barrio Destacamento', 62, -37.693023681640625, -67.870277404785156);
INSERT INTO public2.locations VALUES (2318, 'Barrio El Labrador', 62, -38.666885375976562, -68.242935180664062);
INSERT INTO public2.locations VALUES (2319, 'Barrio El Maruchito', 62, -38.996280670166016, -67.761802673339844);
INSERT INTO public2.locations VALUES (2320, 'Barrio El PetrÃ³leo', 62, -39.0623779296875, -67.5115737915039);
INSERT INTO public2.locations VALUES (2321, 'Barrio Emergente', 62, -39.001285552978516, -67.84881591796875);
INSERT INTO public2.locations VALUES (2322, 'Barrio FÃ¡tima', 62, -39.057331085205078, -67.4727783203125);
INSERT INTO public2.locations VALUES (2323, 'Barrio Frontera', 62, -39.074272155761719, -67.705802917480469);
INSERT INTO public2.locations VALUES (2324, 'Barrio Guerrico', 62, -39.0173225402832, -67.718437194824219);
INSERT INTO public2.locations VALUES (2325, 'Barrio Isla 10', 62, -38.995475769042969, -67.9179916381836);
INSERT INTO public2.locations VALUES (2326, 'Barrio La Barda', 62, -39.050800323486328, -67.217460632324219);
INSERT INTO public2.locations VALUES (2327, 'Barrio La Costa', 62, -39.09228515625, -67.203353881835938);
INSERT INTO public2.locations VALUES (2328, 'Barrio La Defensa', 62, -39.031124114990234, -67.387298583984375);
INSERT INTO public2.locations VALUES (2329, 'Barrio La Herradura', 62, -39.041805267333984, -67.781478881835938);
INSERT INTO public2.locations VALUES (2330, 'Puente Cero', 62, -39.029117584228516, -67.499679565429688);
INSERT INTO public2.locations VALUES (2331, 'Barrio Luisillo', 62, -39.056198120117188, -67.3450927734375);
INSERT INTO public2.locations VALUES (2332, 'Barrio Mar del Plata', 62, -39.089347839355469, -67.672943115234375);
INSERT INTO public2.locations VALUES (2333, 'Barrio MarÃ­a Elvira', 62, -38.991607666015625, -67.964759826660156);
INSERT INTO public2.locations VALUES (2334, 'Barrio MoÃ±o Azul', 62, -39.135848999023438, -66.8947982788086);
INSERT INTO public2.locations VALUES (2335, 'Barrio Norte', 62, -38.867393493652344, -68.018684387207031);
INSERT INTO public2.locations VALUES (2336, 'Barrio Pinar', 62, -37.679534912109375, -67.873695373535156);
INSERT INTO public2.locations VALUES (2337, 'Barrio Porvenir', 62, -39.0445556640625, -67.456947326660156);
INSERT INTO public2.locations VALUES (2338, 'Barrio Santa Lucia', 62, -39.033519744873047, -67.298698425292969);
INSERT INTO public2.locations VALUES (2339, 'Barrio Santa Rita', 62, -39.126373291015625, -67.102737426757812);
INSERT INTO public2.locations VALUES (2340, 'Barrio UniÃ³n', 62, -38.968429565429688, -67.947647094726562);
INSERT INTO public2.locations VALUES (2341, 'Catriel', 62, -37.875522613525391, -67.794509887695312);
INSERT INTO public2.locations VALUES (2342, 'Cervantes', 62, -39.053962707519531, -67.394157409667969);
INSERT INTO public2.locations VALUES (2343, 'Chichinales', 62, -39.114749908447266, -66.942253112792969);
INSERT INTO public2.locations VALUES (2344, 'Cinco Saltos', 62, -38.827560424804688, -68.066169738769531);
INSERT INTO public2.locations VALUES (2345, 'Cipolletti', 62, -38.938785552978516, -67.9955062866211);
INSERT INTO public2.locations VALUES (2346, 'Contralmirante Cordero', 62, -38.757740020751953, -68.09967041015625);
INSERT INTO public2.locations VALUES (2347, 'Ferri', 62, -38.887943267822266, -68.007522583007812);
INSERT INTO public2.locations VALUES (2348, 'General Enrique doy', 62, -39.078449249267578, -67.157455444335938);
INSERT INTO public2.locations VALUES (2349, 'General FernÃ¡ndez Oro', 62, -38.954120635986328, -67.929229736328125);
INSERT INTO public2.locations VALUES (2350, 'General Roca', 62, -39.026821136474609, -67.574836730957031);
INSERT INTO public2.locations VALUES (2351, 'Ingeniero Luis A. Huer', 62, -39.073238372802734, -67.238685607910156);
INSERT INTO public2.locations VALUES (2352, 'Ingeniero Otto Krause', 62, -39.107234954833984, -66.998115539550781);
INSERT INTO public2.locations VALUES (2353, 'MainquÃ©', 62, -39.064247131347656, -67.3056411743164);
INSERT INTO public2.locations VALUES (2354, 'Paso CÃ³rdova', 62, -39.106781005859375, -67.627372741699219);
INSERT INTO public2.locations VALUES (2355, 'PenÃ­nsula Ruca Co', 62, -38.701702117919922, -68.028236389160156);
INSERT INTO public2.locations VALUES (2356, 'Sargento Vidal', 62, -38.686374664306641, -68.158615112304688);
INSERT INTO public2.locations VALUES (2357, 'Villa Alberdi', 62, -39.128620147705078, -67.0467758178711);
INSERT INTO public2.locations VALUES (2358, 'Villa del Parque', 62, -39.126136779785156, -66.9974594116211);
INSERT INTO public2.locations VALUES (2359, 'Villa Manzano', 62, -38.680618286132812, -68.216026306152344);
INSERT INTO public2.locations VALUES (2360, 'Villa Regina', 62, -39.094558715820312, -67.0823974609375);
INSERT INTO public2.locations VALUES (2361, 'Villa San Isidro', 62, -38.706695556640625, -68.173095703125);
INSERT INTO public2.locations VALUES (2362, 'ComicÃ³', 62, -41.070693969726562, -67.478065490722656);
INSERT INTO public2.locations VALUES (2363, 'Cona Niyeu', 62, -41.8655891418457, -66.93865966796875);
INSERT INTO public2.locations VALUES (2364, 'Ministro Ramos MexÃ­a', 62, -40.507038116455078, -67.260612487792969);
INSERT INTO public2.locations VALUES (2365, 'Prahuaniyeu', 62, -41.338081359863281, -67.905082702636719);
INSERT INTO public2.locations VALUES (2366, 'Sierra Colorada', 62, -40.587375640869141, -67.755607604980469);
INSERT INTO public2.locations VALUES (2367, 'Treneta', 62, -41.174354553222656, -66.994598388671875);
INSERT INTO public2.locations VALUES (2368, 'YaminuÃ©', 62, -40.977493286132812, -67.192352294921875);
INSERT INTO public2.locations VALUES (2369, 'Las Bayas', 62, -41.456081390380859, -70.6693344116211);
INSERT INTO public2.locations VALUES (2370, 'Mamuel Choique', 62, -41.772464752197266, -70.138069152832031);
INSERT INTO public2.locations VALUES (2371, 'Ã‘orquincÃ³', 62, -41.848926544189453, -70.8982162475586);
INSERT INTO public2.locations VALUES (2372, 'Ojos de Agua', 62, -41.556350708007812, -69.869369506835938);
INSERT INTO public2.locations VALUES (2373, 'RÃ­o Chico', 62, -41.710292816162109, -70.476722717285156);
INSERT INTO public2.locations VALUES (2374, 'Barrio Esperanza', 62, -39.045383453369141, -63.997196197509766);
INSERT INTO public2.locations VALUES (2375, 'Colonia JuliÃ¡ y Echarren', 62, -39.0345573425293, -64.0284652709961);
INSERT INTO public2.locations VALUES (2376, 'Juventud Unida', 62, -39.017719268798828, -64.065803527832031);
INSERT INTO public2.locations VALUES (2377, 'Pichi Mahuida', 62, -38.83197021484375, -64.934028625488281);
INSERT INTO public2.locations VALUES (2378, 'RÃ­o Colorado', 62, -38.9908332824707, -64.0958251953125);
INSERT INTO public2.locations VALUES (2379, 'Salto Andersen', 62, -38.823997497558594, -64.820732116699219);
INSERT INTO public2.locations VALUES (2380, 'CaÃ±adÃ³n Chileno', 62, -40.888954162597656, -70.023765563964844);
INSERT INTO public2.locations VALUES (2381, 'Comallo', 62, -41.030048370361328, -70.269325256347656);
INSERT INTO public2.locations VALUES (2382, 'Dina Huapi', 62, -41.0737190246582, -71.1574935913086);
INSERT INTO public2.locations VALUES (2383, 'Laguna Blanca', 62, -40.722023010253906, -69.8416976928711);
INSERT INTO public2.locations VALUES (2384, 'Ã‘irihuau', 62, -41.087387084960938, -71.14178466796875);
INSERT INTO public2.locations VALUES (2385, 'Pilcaniyeu', 62, -41.122638702392578, -70.721588134765625);
INSERT INTO public2.locations VALUES (2386, 'Pilquiniyeu del Limay', 62, -40.516231536865234, -70.025848388671875);
INSERT INTO public2.locations VALUES (2387, 'Villa LlanquÃ­n', 62, -40.894561767578125, -71.036666870117188);
INSERT INTO public2.locations VALUES (2388, 'El Empalme', 62, -40.7115592956543, -65.00372314453125);
INSERT INTO public2.locations VALUES (2389, 'Las Grutas', 62, -40.809085845947266, -65.08807373046875);
INSERT INTO public2.locations VALUES (2390, 'Playas Doradas', 62, -41.631137847900391, -65.026596069335938);
INSERT INTO public2.locations VALUES (2391, 'Puerto San Antonio Este', 62, -40.804344177246094, -64.880409240722656);
INSERT INTO public2.locations VALUES (2392, 'Punta Colorada', 62, -41.694431304931641, -65.029144287109375);
INSERT INTO public2.locations VALUES (2393, 'Saco Viejo', 62, -40.815250396728516, -64.7574234008789);
INSERT INTO public2.locations VALUES (2394, 'San Antonio Oeste', 62, -40.730133056640625, -64.938972473144531);
INSERT INTO public2.locations VALUES (2395, 'Sierra Grande', 62, -41.605461120605469, -65.357025146484375);
INSERT INTO public2.locations VALUES (2396, 'Aguada Cecilio', 62, -40.848941802978516, -65.842491149902344);
INSERT INTO public2.locations VALUES (2397, 'Arroyo Los Berros', 62, -41.434738159179688, -66.101234436035156);
INSERT INTO public2.locations VALUES (2398, 'Arroyo Ventana', 62, -41.665439605712891, -66.094245910644531);
INSERT INTO public2.locations VALUES (2399, 'Nahuel Niyeu', 62, -40.504112243652344, -66.564689636230469);
INSERT INTO public2.locations VALUES (2400, 'Sierra PailemÃ¡n', 62, -41.190567016601562, -65.9760971069336);
INSERT INTO public2.locations VALUES (2401, 'Valcheta', 62, -40.676353454589844, -66.166519165039062);
INSERT INTO public2.locations VALUES (2402, 'Aguada de Guerra', 62, -41.067886352539062, -68.381729125976562);
INSERT INTO public2.locations VALUES (2403, 'Clemente Onelli', 62, -41.24639892578125, -70.032707214355469);
INSERT INTO public2.locations VALUES (2404, 'Colan Conhue', 62, -40.668548583984375, -69.106697082519531);
INSERT INTO public2.locations VALUES (2405, 'El CaÃ­n', 62, -41.667362213134766, -68.16131591796875);
INSERT INTO public2.locations VALUES (2406, 'Ingeniero Jacobacci', 62, -41.330596923828125, -69.547065734863281);
INSERT INTO public2.locations VALUES (2407, 'Los Menucos', 62, -40.842811584472656, -68.085922241210938);
INSERT INTO public2.locations VALUES (2408, 'Maquinchao', 62, -41.250225067138672, -68.698257446289062);
INSERT INTO public2.locations VALUES (2409, 'Pilquiniyeu', 62, -41.831748962402344, -68.35125732421875);
INSERT INTO public2.locations VALUES (2410, 'Apolinario Saravia', 66, -24.430776596069336, -63.994945526123047);
INSERT INTO public2.locations VALUES (2411, 'Ceibalito', 66, -25.1102352142334, -64.275199890136719);
INSERT INTO public2.locations VALUES (2412, 'Centro 25 de Junio', 66, -24.957298278808594, -63.854644775390625);
INSERT INTO public2.locations VALUES (2413, 'Coronel Mollinedo', 66, -24.540008544921875, -64.100837707519531);
INSERT INTO public2.locations VALUES (2414, 'Coronel Olleros', 66, -25.100543975830078, -64.221572875976562);
INSERT INTO public2.locations VALUES (2415, 'El Quebrachal', 66, -25.331998825073242, -64.017646789550781);
INSERT INTO public2.locations VALUES (2416, 'Gaona', 66, -25.241491317749023, -64.037216186523438);
INSERT INTO public2.locations VALUES (2417, 'General Pizarro', 66, -24.227508544921875, -63.988559722900391);
INSERT INTO public2.locations VALUES (2418, 'JoaquÃ­n V. nzÃ¡lez', 66, -25.117391586303711, -64.124771118164062);
INSERT INTO public2.locations VALUES (2419, 'Las Lajitas', 66, -24.727401733398438, -64.195465087890625);
INSERT INTO public2.locations VALUES (2420, 'Luis Burela', 66, -24.388650894165039, -63.987861633300781);
INSERT INTO public2.locations VALUES (2421, 'Macapillo', 66, -25.4028263092041, -63.980972290039062);
INSERT INTO public2.locations VALUES (2422, 'Nuestra SeÃ±ora de Talavera', 66, -25.458992004394531, -63.779758453369141);
INSERT INTO public2.locations VALUES (2423, 'Piquete Cabado', 66, -24.820850372314453, -64.177665710449219);
INSERT INTO public2.locations VALUES (2424, 'RÃ­o del Valle', 66, -24.6747989654541, -64.201347351074219);
INSERT INTO public2.locations VALUES (2425, 'Tolloche', 66, -25.525701522827148, -63.524318695068359);
INSERT INTO public2.locations VALUES (2426, 'Cachi', 66, -25.119968414306641, -66.161872863769531);
INSERT INTO public2.locations VALUES (2427, 'Payogasta', 66, -25.051435470581055, -66.102943420410156);
INSERT INTO public2.locations VALUES (2428, 'Cafayate', 66, -26.073043823242188, -65.975982666015625);
INSERT INTO public2.locations VALUES (2429, 'TolombÃ³n', 66, -26.182714462280273, -65.939811706542969);
INSERT INTO public2.locations VALUES (2430, 'Salta', 66, -24.789272308349609, -65.410285949707031);
INSERT INTO public2.locations VALUES (2431, 'Villa San Lorenzo', 66, -24.731229782104492, -65.486312866210938);
INSERT INTO public2.locations VALUES (2432, 'Cerrillos', 66, -24.89581298828125, -65.487144470214844);
INSERT INTO public2.locations VALUES (2433, 'La Merced', 66, -24.966945648193359, -65.489013671875);
INSERT INTO public2.locations VALUES (2434, 'San AgustÃ­n', 66, -24.995962142944336, -65.440811157226562);
INSERT INTO public2.locations VALUES (2435, 'Barrio Finca La Maroma', 66, -25.1533203125, -65.4393539428711);
INSERT INTO public2.locations VALUES (2436, 'Barrio La Rotonda', 66, -25.0826358795166, -65.537635803222656);
INSERT INTO public2.locations VALUES (2437, 'Barrio Santa Teresita', 66, -25.037118911743164, -65.572158813476562);
INSERT INTO public2.locations VALUES (2438, 'Chicoana', 66, -25.1026668548584, -65.535049438476562);
INSERT INTO public2.locations VALUES (2439, 'El Carril', 66, -25.076671600341797, -65.4892349243164);
INSERT INTO public2.locations VALUES (2440, 'Campo Santo', 66, -24.682966232299805, -65.104942321777344);
INSERT INTO public2.locations VALUES (2441, 'Cobos', 66, -24.73600959777832, -65.084724426269531);
INSERT INTO public2.locations VALUES (2442, 'El Bordo', 66, -24.659883499145508, -65.1064682006836);
INSERT INTO public2.locations VALUES (2443, 'General GÃ¼emes', 66, -24.674448013305664, -65.046600341796875);
INSERT INTO public2.locations VALUES (2444, 'Aguaray', 66, -22.244873046875, -63.735336303710938);
INSERT INTO public2.locations VALUES (2445, 'Campichuelo', 66, -23.110855102539062, -63.999652862548828);
INSERT INTO public2.locations VALUES (2446, 'Campo DurÃ¡n', 66, -22.20073127746582, -63.675743103027344);
INSERT INTO public2.locations VALUES (2447, 'Capiazuti', 66, -22.203428268432617, -63.719654083251953);
INSERT INTO public2.locations VALUES (2448, 'Carboncito', 66, -23.236095428466797, -63.769111633300781);
INSERT INTO public2.locations VALUES (2449, 'Coronel Cornejo', 66, -22.736904144287109, -63.818897247314453);
INSERT INTO public2.locations VALUES (2450, 'Dranes', 66, -23.248754501342773, -63.341026306152344);
INSERT INTO public2.locations VALUES (2451, 'EmbarcaciÃ³n', 66, -23.210420608520508, -64.097244262695312);
INSERT INTO public2.locations VALUES (2452, 'General BalliviÃ¡n', 66, -22.935890197753906, -63.861255645751953);
INSERT INTO public2.locations VALUES (2453, 'General Mosconi', 66, -22.596168518066406, -63.811000823974609);
INSERT INTO public2.locations VALUES (2454, 'Hickman', 66, -23.212451934814453, -63.566608428955078);
INSERT INTO public2.locations VALUES (2455, 'MisiÃ³n ChaqueÃ±a', 66, -23.262247085571289, -63.739288330078125);
INSERT INTO public2.locations VALUES (2456, 'MisiÃ³n KilÃ³metro 6', 66, -22.513460159301758, -63.753250122070312);
INSERT INTO public2.locations VALUES (2457, 'PacarÃ¡', 66, -22.4500789642334, -63.4420051574707);
INSERT INTO public2.locations VALUES (2458, 'Padre Lozano', 66, -23.218439102172852, -63.8441276550293);
INSERT INTO public2.locations VALUES (2459, 'Piquirenda', 66, -22.325044631958008, -63.7533073425293);
INSERT INTO public2.locations VALUES (2460, 'Profesor Salvador Mazza', 66, -22.051656723022461, -63.69189453125);
INSERT INTO public2.locations VALUES (2461, 'Tartagal', 66, -22.516819000244141, -63.80560302734375);
INSERT INTO public2.locations VALUES (2462, 'Tobantirenda', 66, -22.148080825805664, -63.712940216064453);
INSERT INTO public2.locations VALUES (2463, 'Tranquitas', 66, -22.406223297119141, -63.775363922119141);
INSERT INTO public2.locations VALUES (2464, 'Yacuy', 66, -22.369318008422852, -63.768478393554688);
INSERT INTO public2.locations VALUES (2465, 'Guachipas', 66, -25.522653579711914, -65.510025024414062);
INSERT INTO public2.locations VALUES (2466, 'Iruya', 66, -22.792106628417969, -65.2162857055664);
INSERT INTO public2.locations VALUES (2467, 'Isla de CaÃ±as', 66, -22.899139404296875, -64.665199279785156);
INSERT INTO public2.locations VALUES (2468, 'Pueblo Viejo', 66, -22.836208343505859, -65.215538024902344);
INSERT INTO public2.locations VALUES (2469, 'La Caldera', 66, -24.602693557739258, -65.3806381225586);
INSERT INTO public2.locations VALUES (2470, 'Vaqueros', 66, -24.696475982666016, -65.4106216430664);
INSERT INTO public2.locations VALUES (2471, 'El JardÃ­n', 66, -26.079568862915039, -65.3930892944336);
INSERT INTO public2.locations VALUES (2472, 'El Tala', 66, -26.112211227416992, -65.277839660644531);
INSERT INTO public2.locations VALUES (2473, 'La Candelaria', 66, -26.127344131469727, -65.051322937011719);
INSERT INTO public2.locations VALUES (2474, 'Cobres', 66, -23.650503158569336, -66.28857421875);
INSERT INTO public2.locations VALUES (2475, 'La Poma', 66, -24.722564697265625, -66.2005844116211);
INSERT INTO public2.locations VALUES (2476, 'Ampascachi', 66, -25.352653503417969, -65.528228759765625);
INSERT INTO public2.locations VALUES (2477, 'Cabra Corral', 66, -25.27064323425293, -65.332756042480469);
INSERT INTO public2.locations VALUES (2478, 'Coronel Moldes', 66, -25.2800350189209, -65.478462219238281);
INSERT INTO public2.locations VALUES (2479, 'La ViÃ±a', 66, -25.468116760253906, -65.565559387207031);
INSERT INTO public2.locations VALUES (2480, 'Talapampa', 66, -25.545560836791992, -65.5561294555664);
INSERT INTO public2.locations VALUES (2481, 'Olacapato', 66, -24.137485504150391, -66.718826293945312);
INSERT INTO public2.locations VALUES (2482, 'San Antonio de los Cobres', 66, -24.216144561767578, -66.3210678100586);
INSERT INTO public2.locations VALUES (2483, 'Santa Rosa de los Pastos Grandes', 66, -24.467615127563477, -66.673568725585938);
INSERT INTO public2.locations VALUES (2484, 'Tolar Grande', 66, -24.589401245117188, -67.39520263671875);
INSERT INTO public2.locations VALUES (2485, 'El GalpÃ³n', 66, -25.380624771118164, -64.651618957519531);
INSERT INTO public2.locations VALUES (2486, 'El Tunal', 66, -25.253499984741211, -64.397781372070312);
INSERT INTO public2.locations VALUES (2487, 'Lumbreras', 66, -25.210271835327148, -64.927047729492188);
INSERT INTO public2.locations VALUES (2488, 'San JosÃ© de MetÃ¡n (Est. MetÃ¡n)', 66, -25.497104644775391, -64.971061706542969);
INSERT INTO public2.locations VALUES (2489, 'RÃ­o Piedras', 66, -25.3143253326416, -64.910385131835938);
INSERT INTO public2.locations VALUES (2490, 'San JosÃ© de Orquera', 66, -25.266157150268555, -64.075889587402344);
INSERT INTO public2.locations VALUES (2491, 'La Puerta', 66, -25.280054092407227, -66.449913024902344);
INSERT INTO public2.locations VALUES (2492, 'Molinos', 66, -25.437227249145508, -66.294509887695312);
INSERT INTO public2.locations VALUES (2493, 'SeclantÃ¡s', 66, -25.331758499145508, -66.24420166015625);
INSERT INTO public2.locations VALUES (2494, 'Aguas Blancas', 66, -22.737117767333984, -64.3532485961914);
INSERT INTO public2.locations VALUES (2495, 'Colonia Santa Rosa', 66, -23.394294738769531, -64.425575256347656);
INSERT INTO public2.locations VALUES (2496, 'El Tabacal', 66, -23.253484725952148, -64.245758056640625);
INSERT INTO public2.locations VALUES (2497, 'HipÃ³lito Yriyen', 66, -23.244342803955078, -64.27655029296875);
INSERT INTO public2.locations VALUES (2498, 'Pichanal', 66, -23.3245906829834, -64.225303649902344);
INSERT INTO public2.locations VALUES (2499, 'San RamÃ³n de la Nueva OrÃ¡n', 66, -23.136089324951172, -64.322929382324219);
INSERT INTO public2.locations VALUES (2500, 'Urundel', 66, -23.557863235473633, -64.396926879882812);
INSERT INTO public2.locations VALUES (2501, 'Alto de la Sierra', 66, -22.739952087402344, -62.498020172119141);
INSERT INTO public2.locations VALUES (2502, 'CapitÃ¡n Juan PagÃ©', 66, -23.688308715820312, -62.376247406005859);
INSERT INTO public2.locations VALUES (2503, 'Coronel Juan SolÃ¡', 66, -23.470478057861328, -62.887905120849609);
INSERT INTO public2.locations VALUES (2504, 'Hito 1', 66, -21.999710083007812, -62.823738098144531);
INSERT INTO public2.locations VALUES (2505, 'La UniÃ³n', 66, -23.896892547607422, -63.1970329284668);
INSERT INTO public2.locations VALUES (2506, 'Los Blancos', 66, -23.609415054321289, -62.59478759765625);
INSERT INTO public2.locations VALUES (2507, 'Pluma de Pato', 66, -23.371242523193359, -63.096721649169922);
INSERT INTO public2.locations VALUES (2508, 'Rivadavia', 66, -24.184970855712891, -62.8883056640625);
INSERT INTO public2.locations VALUES (2509, 'Santa MarÃ­a', 66, -22.153600692749023, -62.808643341064453);
INSERT INTO public2.locations VALUES (2510, 'Santa Rosa', 66, -24.025178909301758, -63.082248687744141);
INSERT INTO public2.locations VALUES (2511, 'Santa Victoria Este', 66, -22.272729873657227, -62.712577819824219);
INSERT INTO public2.locations VALUES (2512, 'AntillÃ¡', 66, -26.119577407836914, -64.593399047851562);
INSERT INTO public2.locations VALUES (2513, 'Copo Quile', 66, -26.011264801025391, -64.671150207519531);
INSERT INTO public2.locations VALUES (2514, 'El Naranjo', 66, -25.722202301025391, -65.013832092285156);
INSERT INTO public2.locations VALUES (2515, 'El Potrero', 66, -26.047172546386719, -64.644783020019531);
INSERT INTO public2.locations VALUES (2516, 'Rosario de la Frontera', 66, -25.798563003540039, -64.973861694335938);
INSERT INTO public2.locations VALUES (2517, 'San Felipe', 66, -25.717521667480469, -64.836830139160156);
INSERT INTO public2.locations VALUES (2518, 'Campo Quijano', 66, -24.908132553100586, -65.642982482910156);
INSERT INTO public2.locations VALUES (2519, 'La Merced del EncÃ³n', 66, -24.8728084564209, -65.563224792480469);
INSERT INTO public2.locations VALUES (2520, 'La Silleta', 66, -24.874975204467773, -65.5904769897461);
INSERT INTO public2.locations VALUES (2521, 'Rosario de Lerma', 66, -24.98582649230957, -65.578399658203125);
INSERT INTO public2.locations VALUES (2522, 'Angastaco', 66, -25.690948486328125, -66.167022705078125);
INSERT INTO public2.locations VALUES (2523, 'AnimanÃ¡', 66, -25.969484329223633, -65.9489974975586);
INSERT INTO public2.locations VALUES (2524, 'San Carlos', 66, -25.893167495727539, -65.9290542602539);
INSERT INTO public2.locations VALUES (2525, 'Acoyte', 66, -22.283830642700195, -65.0176773071289);
INSERT INTO public2.locations VALUES (2526, 'Campo La Cruz', 66, -22.498891830444336, -65.098014831542969);
INSERT INTO public2.locations VALUES (2527, 'Los Toldos', 66, -22.280368804931641, -64.698921203613281);
INSERT INTO public2.locations VALUES (2528, 'Nazareno', 66, -22.509477615356445, -65.102378845214844);
INSERT INTO public2.locations VALUES (2529, 'Poscaya', 66, -22.454404830932617, -65.083221435546875);
INSERT INTO public2.locations VALUES (2530, 'San Marcos', 66, -22.51544189453125, -65.1123275756836);
INSERT INTO public2.locations VALUES (2531, 'Santa Victoria', 66, -22.250444412231445, -64.96478271484375);
INSERT INTO public2.locations VALUES (2532, 'El RincÃ³n', 70, -31.448211669921875, -68.541206359863281);
INSERT INTO public2.locations VALUES (2533, 'Villa General San MartÃ­n - Campo Afuera', 70, -31.439785003662109, -68.5203857421875);
INSERT INTO public2.locations VALUES (2534, 'Las Tapias', 70, -31.41038703918457, -68.399307250976562);
INSERT INTO public2.locations VALUES (2535, 'Villa El Salvador - Villa Sefair', 70, -31.453269958496094, -68.403762817382812);
INSERT INTO public2.locations VALUES (2536, 'Barreal - Villa Pituil', 70, -31.644735336303711, -69.472076416015625);
INSERT INTO public2.locations VALUES (2537, 'Calingasta', 70, -31.334524154663086, -69.420700073242188);
INSERT INTO public2.locations VALUES (2538, 'TamberÃ­as', 70, -31.458099365234375, -69.421554565429688);
INSERT INTO public2.locations VALUES (2539, 'San Juan', 70, -31.537258148193359, -68.525016784667969);
INSERT INTO public2.locations VALUES (2540, 'Bermejo', 70, -31.588504791259766, -67.656990051269531);
INSERT INTO public2.locations VALUES (2541, 'Caucete', 70, -31.651479721069336, -68.281974792480469);
INSERT INTO public2.locations VALUES (2542, 'El RincÃ³n', 70, -31.670129776000977, -68.317306518554688);
INSERT INTO public2.locations VALUES (2543, 'Las Talas - Los MÃ©danos', 70, -31.596786499023438, -68.275177001953125);
INSERT INTO public2.locations VALUES (2544, 'Marayes', 70, -31.46343994140625, -67.351509094238281);
INSERT INTO public2.locations VALUES (2545, 'Pie de Palo', 70, -31.661264419555664, -68.2197036743164);
INSERT INTO public2.locations VALUES (2546, 'Vallecito', 70, -31.734640121459961, -67.982872009277344);
INSERT INTO public2.locations VALUES (2547, 'Villa Independencia', 70, -31.624582290649414, -68.313926696777344);
INSERT INTO public2.locations VALUES (2548, 'Chimbas', 70, -31.493267059326172, -68.532562255859375);
INSERT INTO public2.locations VALUES (2549, 'Angualasto', 70, -30.057247161865234, -69.174125671386719);
INSERT INTO public2.locations VALUES (2550, 'Iglesia', 70, -30.411056518554688, -69.223701477050781);
INSERT INTO public2.locations VALUES (2551, 'Las Flores', 70, -30.322484970092773, -69.204299926757812);
INSERT INTO public2.locations VALUES (2552, 'Pismanta', 70, -30.28022575378418, -69.227943420410156);
INSERT INTO public2.locations VALUES (2553, 'Rodeo', 70, -30.210159301757812, -69.131591796875);
INSERT INTO public2.locations VALUES (2554, 'Tudcum', 70, -30.188156127929688, -69.270736694335938);
INSERT INTO public2.locations VALUES (2555, 'El MÃ©dano', 70, -30.12701416015625, -68.681442260742188);
INSERT INTO public2.locations VALUES (2556, 'Gran China', 70, -30.120357513427734, -68.728187561035156);
INSERT INTO public2.locations VALUES (2557, 'Huaco', 70, -30.157754898071289, -68.482429504394531);
INSERT INTO public2.locations VALUES (2558, 'Mogna', 70, -30.695384979248047, -68.360305786132812);
INSERT INTO public2.locations VALUES (2559, 'Niquivil', 70, -30.408903121948242, -68.69134521484375);
INSERT INTO public2.locations VALUES (2560, 'Pampa Vieja', 70, -30.2181396484375, -68.688163757324219);
INSERT INTO public2.locations VALUES (2561, 'San Isidro', 70, -30.141216278076172, -68.705886840820312);
INSERT INTO public2.locations VALUES (2562, 'San JosÃ© de JÃ¡chal', 70, -30.24174690246582, -68.7464599609375);
INSERT INTO public2.locations VALUES (2563, 'TamberÃ­as', 70, -30.183023452758789, -68.72601318359375);
INSERT INTO public2.locations VALUES (2564, 'Villa Malvinas Argentinas', 70, -30.222074508666992, -68.7339096069336);
INSERT INTO public2.locations VALUES (2565, 'Villa Mercedes', 70, -30.108373641967773, -68.703201293945312);
INSERT INTO public2.locations VALUES (2566, 'Alto de Sierra', 70, -31.538932800292969, -68.4139175415039);
INSERT INTO public2.locations VALUES (2567, 'Las Chacritas', 70, -31.594194412231445, -68.4005126953125);
INSERT INTO public2.locations VALUES (2568, '9 de Julio', 70, -31.669750213623047, -68.390045166015625);
INSERT INTO public2.locations VALUES (2569, 'Barrio Municipal', 70, -31.752799987792969, -68.5531234741211);
INSERT INTO public2.locations VALUES (2570, 'Barrio Ruta 40', 70, -31.859043121337891, -68.536949157714844);
INSERT INTO public2.locations VALUES (2571, 'CarpinterÃ­a', 70, -31.8192195892334, -68.541343688964844);
INSERT INTO public2.locations VALUES (2572, 'Quinto Cuartel', 70, -31.613321304321289, -68.601203918457031);
INSERT INTO public2.locations VALUES (2573, 'Villa Aberastain - La Rinconada', 70, -31.658042907714844, -68.579414367675781);
INSERT INTO public2.locations VALUES (2574, 'Villa Barboza - Villa Nacusi', 70, -31.596435546875, -68.542633056640625);
INSERT INTO public2.locations VALUES (2575, 'Villa Centenario', 70, -31.69505500793457, -68.573257446289062);
INSERT INTO public2.locations VALUES (2576, 'Rawson', 70, -31.581888198852539, -68.5421142578125);
INSERT INTO public2.locations VALUES (2577, 'Villa BolaÃ±os (MÃ©dano de Oro)', 70, -31.628934860229492, -68.480377197265625);
INSERT INTO public2.locations VALUES (2578, 'Rivadavia', 70, -31.532442092895508, -68.597137451171875);
INSERT INTO public2.locations VALUES (2579, 'Barrio Sadop - Bella Vista', 70, -31.534214019775391, -68.398475646972656);
INSERT INTO public2.locations VALUES (2580, 'Dos Acequias', 70, -31.494855880737305, -68.416816711425781);
INSERT INTO public2.locations VALUES (2581, 'San Isidro', 70, -31.487148284912109, -68.324783325195312);
INSERT INTO public2.locations VALUES (2582, 'Villa del Salvador', 70, -31.465280532836914, -68.4111557006836);
INSERT INTO public2.locations VALUES (2583, 'Villa Dominguito', 70, -31.559162139892578, -68.300498962402344);
INSERT INTO public2.locations VALUES (2584, 'Villa Don Bosco', 70, -31.553815841674805, -68.338973999023438);
INSERT INTO public2.locations VALUES (2585, 'Villa San MartÃ­n', 70, -31.516685485839844, -68.3501205444336);
INSERT INTO public2.locations VALUES (2586, 'Santa LucÃ­a', 70, -31.540542602539062, -68.497871398925781);
INSERT INTO public2.locations VALUES (2587, 'CaÃ±ada Honda', 70, -31.985126495361328, -68.548660278320312);
INSERT INTO public2.locations VALUES (2588, 'Cienaguita', 70, -32.0771598815918, -68.693527221679688);
INSERT INTO public2.locations VALUES (2589, 'Colonia Fiscal', 70, -31.902206420898438, -68.470710754394531);
INSERT INTO public2.locations VALUES (2590, 'Divisadero', 70, -32.007270812988281, -68.6938705444336);
INSERT INTO public2.locations VALUES (2591, 'Las Lagunas', 70, -32.044147491455078, -68.367958068847656);
INSERT INTO public2.locations VALUES (2592, 'Los Berros', 70, -31.952831268310547, -68.654144287109375);
INSERT INTO public2.locations VALUES (2593, 'Pedernal', 70, -31.996410369873047, -68.763946533203125);
INSERT INTO public2.locations VALUES (2594, 'Punta del MÃ©dano', 70, -31.894184112548828, -68.41876220703125);
INSERT INTO public2.locations VALUES (2595, 'Villa Media Agua', 70, -31.981447219848633, -68.426673889160156);
INSERT INTO public2.locations VALUES (2596, 'Villa IbÃ¡Ã±ez', 70, -31.4656925201416, -68.734710693359375);
INSERT INTO public2.locations VALUES (2597, 'Astica', 70, -30.955057144165039, -67.304473876953125);
INSERT INTO public2.locations VALUES (2598, 'Balde del Rosario', 70, -30.320938110351562, -67.69683837890625);
INSERT INTO public2.locations VALUES (2599, 'Chucuma', 70, -31.069416046142578, -67.282112121582031);
INSERT INTO public2.locations VALUES (2600, 'Los Baldecitos', 70, -30.221542358398438, -67.695396423339844);
INSERT INTO public2.locations VALUES (2601, 'Usno', 70, -30.567073822021484, -67.54205322265625);
INSERT INTO public2.locations VALUES (2602, 'Villa San AgustÃ­n', 70, -30.634639739990234, -67.467819213867188);
INSERT INTO public2.locations VALUES (2603, 'El EncÃ³n', 70, -32.217056274414062, -67.795768737792969);
INSERT INTO public2.locations VALUES (2604, 'TupelÃ­', 70, -31.836114883422852, -68.358512878417969);
INSERT INTO public2.locations VALUES (2605, 'Villa Borjas - La Chimbera', 70, -31.810153961181641, -68.328445434570312);
INSERT INTO public2.locations VALUES (2606, 'Villa El Tan', 70, -31.749256134033203, -68.236083984375);
INSERT INTO public2.locations VALUES (2607, 'Villa Santa Rosa', 70, -31.744817733764648, -68.314292907714844);
INSERT INTO public2.locations VALUES (2608, 'Villa Basilio Nievas', 70, -31.550210952758789, -68.731330871582031);
INSERT INTO public2.locations VALUES (2609, 'Candelaria', 74, -32.0612678527832, -65.824813842773438);
INSERT INTO public2.locations VALUES (2610, 'Leandro N. Alem', 74, -32.486255645751953, -66.053016662597656);
INSERT INTO public2.locations VALUES (2611, 'LujÃ¡n', 74, -32.364570617675781, -65.933158874511719);
INSERT INTO public2.locations VALUES (2612, 'Quines', 74, -32.232856750488281, -65.805038452148438);
INSERT INTO public2.locations VALUES (2613, 'San Francisco del Monte de Oro', 74, -32.600345611572266, -66.127090454101562);
INSERT INTO public2.locations VALUES (2614, 'La Calera', 74, -32.863433837890625, -66.849525451660156);
INSERT INTO public2.locations VALUES (2615, 'NolÃ­', 74, -32.918666839599609, -66.324714660644531);
INSERT INTO public2.locations VALUES (2616, 'Villa de la Quebrada', 74, -33.016021728515625, -66.288055419921875);
INSERT INTO public2.locations VALUES (2617, 'Villa General Roca', 74, -32.665943145751953, -66.4507827758789);
INSERT INTO public2.locations VALUES (2618, 'Carolina', 74, -32.8108024597168, -66.091949462890625);
INSERT INTO public2.locations VALUES (2619, 'El Trapiche', 74, -33.109237670898438, -66.063072204589844);
INSERT INTO public2.locations VALUES (2620, 'Estancia Grande', 74, -33.189598083496094, -66.152603149414062);
INSERT INTO public2.locations VALUES (2621, 'Fraga', 74, -33.5020866394043, -65.792648315429688);
INSERT INTO public2.locations VALUES (2622, 'La Florida', 74, -33.116729736328125, -66.003456115722656);
INSERT INTO public2.locations VALUES (2623, 'La Toma', 74, -33.054496765136719, -65.621376037597656);
INSERT INTO public2.locations VALUES (2624, 'Riocito', 74, -33.094703674316406, -65.9928207397461);
INSERT INTO public2.locations VALUES (2625, 'Saladillo', 74, -33.202472686767578, -65.8553237915039);
INSERT INTO public2.locations VALUES (2626, 'ConcarÃ¡n', 74, -32.560874938964844, -65.244544982910156);
INSERT INTO public2.locations VALUES (2627, 'Cortaderas', 74, -32.505256652832031, -64.992149353027344);
INSERT INTO public2.locations VALUES (2628, 'Naschel', 74, -32.91522216796875, -65.375930786132812);
INSERT INTO public2.locations VALUES (2629, 'Papagayos', 74, -32.675102233886719, -64.98895263671875);
INSERT INTO public2.locations VALUES (2630, 'Renca', 74, -32.771591186523438, -65.364471435546875);
INSERT INTO public2.locations VALUES (2631, 'San Pablo', 74, -32.661197662353516, -65.305580139160156);
INSERT INTO public2.locations VALUES (2632, 'Tilisarao', 74, -32.731250762939453, -65.291343688964844);
INSERT INTO public2.locations VALUES (2633, 'Villa del Carmen', 74, -32.9399528503418, -65.03887939453125);
INSERT INTO public2.locations VALUES (2634, 'Villa Larca', 74, -32.6174430847168, -64.981460571289062);
INSERT INTO public2.locations VALUES (2635, 'Juan Jorba', 74, -33.6131706237793, -65.272186279296875);
INSERT INTO public2.locations VALUES (2636, 'Juan Llerena', 74, -33.280769348144531, -65.613960266113281);
INSERT INTO public2.locations VALUES (2637, 'Justo Daract', 74, -33.863372802734375, -65.178054809570312);
INSERT INTO public2.locations VALUES (2638, 'La Punilla', 74, -33.143882751464844, -65.090057373046875);
INSERT INTO public2.locations VALUES (2639, 'Lavaisse', 74, -33.822841644287109, -65.4264907836914);
INSERT INTO public2.locations VALUES (2640, 'NaciÃ³n Ranquel', 74, -34.608226776123047, -65.716987609863281);
INSERT INTO public2.locations VALUES (2641, 'San JosÃ© del Morro', 74, -33.212345123291016, -65.491180419921875);
INSERT INTO public2.locations VALUES (2642, 'Villa Mercedes', 74, -33.674472808837891, -65.462196350097656);
INSERT INTO public2.locations VALUES (2643, 'Villa Reynolds', 74, -33.720962524414062, -65.383628845214844);
INSERT INTO public2.locations VALUES (2644, 'Villa Salles', 74, -33.840038299560547, -65.21356201171875);
INSERT INTO public2.locations VALUES (2645, 'Anchorena', 74, -35.675708770751953, -65.424636840820312);
INSERT INTO public2.locations VALUES (2646, 'Arizona', 74, -35.725078582763672, -65.320487976074219);
INSERT INTO public2.locations VALUES (2647, 'Bagual', 74, -35.143043518066406, -65.56988525390625);
INSERT INTO public2.locations VALUES (2648, 'Batavia', 74, -34.778347015380859, -65.690048217773438);
INSERT INTO public2.locations VALUES (2649, 'Buena Esperanza', 74, -34.757888793945312, -65.253585815429688);
INSERT INTO public2.locations VALUES (2650, 'FortÃ­n El Patria', 74, -34.772468566894531, -65.522758483886719);
INSERT INTO public2.locations VALUES (2651, 'Fortuna', 74, -35.130699157714844, -65.383094787597656);
INSERT INTO public2.locations VALUES (2652, 'La Maroma', 74, -35.213920593261719, -66.329483032226562);
INSERT INTO public2.locations VALUES (2653, 'Los Overos', 74, -35.877479553222656, -66.453178405761719);
INSERT INTO public2.locations VALUES (2654, 'MartÃ­n de Loyola', 74, -35.712451934814453, -66.3538589477539);
INSERT INTO public2.locations VALUES (2655, 'Nahuel MapÃ¡', 74, -34.785739898681641, -66.17633056640625);
INSERT INTO public2.locations VALUES (2656, 'Navia', 74, -34.774864196777344, -66.586441040039062);
INSERT INTO public2.locations VALUES (2657, 'Nueva Galia', 74, -35.115180969238281, -65.258735656738281);
INSERT INTO public2.locations VALUES (2658, 'UniÃ³n', 74, -35.153781890869141, -65.946151733398438);
INSERT INTO public2.locations VALUES (2659, 'CarpinterÃ­a', 74, -32.410102844238281, -65.009918212890625);
INSERT INTO public2.locations VALUES (2660, 'Lafinur', 74, -32.062580108642578, -65.350143432617188);
INSERT INTO public2.locations VALUES (2661, 'Los Cajones', 74, -32.024044036865234, -65.372505187988281);
INSERT INTO public2.locations VALUES (2662, 'Los Molles', 74, -32.4385986328125, -65.009765625);
INSERT INTO public2.locations VALUES (2663, 'Merlo', 74, -32.342636108398438, -65.01373291015625);
INSERT INTO public2.locations VALUES (2664, 'Santa Rosa del Conlara', 74, -32.34283447265625, -65.208908081054688);
INSERT INTO public2.locations VALUES (2665, 'Talita', 74, -32.248950958251953, -65.583236694335938);
INSERT INTO public2.locations VALUES (2666, 'Alto Pelado', 74, -33.837028503417969, -66.139076232910156);
INSERT INTO public2.locations VALUES (2667, 'Alto Pencoso', 74, -33.432933807373047, -66.925941467285156);
INSERT INTO public2.locations VALUES (2668, 'Balde', 74, -33.341056823730469, -66.621696472167969);
INSERT INTO public2.locations VALUES (2669, 'Beazley', 74, -33.757484436035156, -66.6446762084961);
INSERT INTO public2.locations VALUES (2670, 'Cazador', 74, -33.854770660400391, -66.36907958984375);
INSERT INTO public2.locations VALUES (2671, 'Chosmes', 74, -33.403980255126953, -66.803550720214844);
INSERT INTO public2.locations VALUES (2672, 'Desaguadero', 74, -33.406009674072266, -67.149398803710938);
INSERT INTO public2.locations VALUES (2673, 'El VolcÃ¡n', 74, -33.253101348876953, -66.175163269042969);
INSERT INTO public2.locations VALUES (2674, 'Jarilla', 74, -33.396446228027344, -67.026580810546875);
INSERT INTO public2.locations VALUES (2675, 'Juana Koslay', 74, -33.288898468017578, -66.266639709472656);
INSERT INTO public2.locations VALUES (2676, 'La Punta', 74, -33.183673858642578, -66.312484741210938);
INSERT INTO public2.locations VALUES (2677, 'Mosmota', 74, -33.671176910400391, -66.972015380859375);
INSERT INTO public2.locations VALUES (2678, 'Potrero de los Funes', 74, -33.217399597167969, -66.231269836425781);
INSERT INTO public2.locations VALUES (2679, 'Salinas del Bebedero', 74, -33.501380920410156, -66.651458740234375);
INSERT INTO public2.locations VALUES (2680, 'San JerÃ³nimo', 74, -33.1380500793457, -66.5240249633789);
INSERT INTO public2.locations VALUES (2681, 'San Luis', 74, -33.302085876464844, -66.33685302734375);
INSERT INTO public2.locations VALUES (2682, 'Zanjitas', 74, -33.804981231689453, -66.415046691894531);
INSERT INTO public2.locations VALUES (2683, 'La Vertiente', 74, -32.7971076965332, -65.756294250488281);
INSERT INTO public2.locations VALUES (2684, 'Las Aguadas', 74, -32.375885009765625, -65.501136779785156);
INSERT INTO public2.locations VALUES (2685, 'Las Chacras', 74, -32.562538146972656, -65.776901245117188);
INSERT INTO public2.locations VALUES (2686, 'Las Lagunas', 74, -32.628059387207031, -65.548599243164062);
INSERT INTO public2.locations VALUES (2687, 'Paso Grande', 74, -32.877323150634766, -65.635055541992188);
INSERT INTO public2.locations VALUES (2688, 'Potrerillo', 74, -32.675559997558594, -65.649749755859375);
INSERT INTO public2.locations VALUES (2689, 'San MartÃ­n', 74, -32.410602569580078, -65.675712585449219);
INSERT INTO public2.locations VALUES (2690, 'Villa de Praga', 74, -32.5333366394043, -65.645858764648438);
INSERT INTO public2.locations VALUES (2691, 'Comandante Luis Piedrabuena', 78, -49.985576629638672, -68.9093017578125);
INSERT INTO public2.locations VALUES (2692, 'Puerto Santa Cruz', 78, -50.018657684326172, -68.5213623046875);
INSERT INTO public2.locations VALUES (2693, 'Caleta Olivia', 78, -46.447845458984375, -67.522743225097656);
INSERT INTO public2.locations VALUES (2694, 'CaÃ±adÃ³n Seco', 78, -46.5615348815918, -67.610633850097656);
INSERT INTO public2.locations VALUES (2695, 'Fitz Roy', 78, -47.026348114013672, -67.247398376464844);
INSERT INTO public2.locations VALUES (2696, 'Jaramillo', 78, -47.184028625488281, -67.144721984863281);
INSERT INTO public2.locations VALUES (2697, 'Koluel Kaike', 78, -46.716815948486328, -68.223579406738281);
INSERT INTO public2.locations VALUES (2698, 'Las Heras', 78, -46.541313171386719, -68.9322738647461);
INSERT INTO public2.locations VALUES (2699, 'Pico Truncado', 78, -46.799419403076172, -67.957855224609375);
INSERT INTO public2.locations VALUES (2700, 'Puerto Deseado', 78, -47.7517204284668, -65.900947570800781);
INSERT INTO public2.locations VALUES (2701, 'Tellier', 78, -47.649032592773438, -66.040046691894531);
INSERT INTO public2.locations VALUES (2702, 'El Turbio', 78, -51.6809196472168, -72.088493347167969);
INSERT INTO public2.locations VALUES (2703, 'Julia Dufour', 78, -51.547286987304688, -72.239044189453125);
INSERT INTO public2.locations VALUES (2704, 'RÃ­o Galles', 78, -51.623462677001953, -69.215866088867188);
INSERT INTO public2.locations VALUES (2705, 'Rospentek', 78, -51.665367126464844, -72.145469665527344);
INSERT INTO public2.locations VALUES (2706, '28 de Noviembre', 78, -51.579612731933594, -72.211639404296875);
INSERT INTO public2.locations VALUES (2707, 'Yacimientos RÃ­o Turbio', 78, -51.536422729492188, -72.337852478027344);
INSERT INTO public2.locations VALUES (2708, 'El Calafate', 78, -50.338027954101562, -72.260665893554688);
INSERT INTO public2.locations VALUES (2709, 'El ChaltÃ©n', 78, -49.33282470703125, -72.885910034179688);
INSERT INTO public2.locations VALUES (2710, 'Tres Las', 78, -49.5979118347168, -71.446746826171875);
INSERT INTO public2.locations VALUES (2711, 'Los Antiguos', 78, -46.551074981689453, -71.631271362304688);
INSERT INTO public2.locations VALUES (2712, 'Perito Moreno', 78, -46.593818664550781, -70.9299087524414);
INSERT INTO public2.locations VALUES (2713, 'Puerto San JuliÃ¡n', 78, -49.3140869140625, -67.719741821289062);
INSERT INTO public2.locations VALUES (2714, 'Bajo Caracoles', 78, -47.443172454833984, -70.9268798828125);
INSERT INTO public2.locations VALUES (2715, 'bernador Greres', 78, -48.750896453857422, -70.248519897460938);
INSERT INTO public2.locations VALUES (2716, 'HipÃ³lito Yriyen', 78, -47.5656623840332, -71.742851257324219);
INSERT INTO public2.locations VALUES (2717, 'Armstrong', 82, -32.7852897644043, -61.603309631347656);
INSERT INTO public2.locations VALUES (2718, 'Bouquet', 82, -32.423629760742188, -61.889736175537109);
INSERT INTO public2.locations VALUES (2719, 'Las Parejas', 82, -32.682949066162109, -61.5224494934082);
INSERT INTO public2.locations VALUES (2720, 'Las Rosas', 82, -32.475051879882812, -61.576507568359375);
INSERT INTO public2.locations VALUES (2721, 'Montes de Oca', 82, -32.566379547119141, -61.768459320068359);
INSERT INTO public2.locations VALUES (2722, 'Tortugas', 82, -32.747398376464844, -61.820987701416016);
INSERT INTO public2.locations VALUES (2723, 'Arequito', 82, -33.144802093505859, -61.469505310058594);
INSERT INTO public2.locations VALUES (2724, 'Arteaga', 82, -33.092681884765625, -61.792011260986328);
INSERT INTO public2.locations VALUES (2725, 'BeravebÃº', 82, -33.340843200683594, -61.862091064453125);
INSERT INTO public2.locations VALUES (2726, 'Bigand', 82, -33.3740348815918, -61.184745788574219);
INSERT INTO public2.locations VALUES (2727, 'Casilda', 82, -33.044696807861328, -61.164199829101562);
INSERT INTO public2.locations VALUES (2728, 'Chabas', 82, -33.2458381652832, -61.358852386474609);
INSERT INTO public2.locations VALUES (2729, 'ChaÃ±ar Ladeado', 82, -33.326168060302734, -62.035232543945312);
INSERT INTO public2.locations VALUES (2730, 'GÃ¶deken', 82, -33.400367736816406, -61.844337463378906);
INSERT INTO public2.locations VALUES (2731, 'Los Molinos', 82, -33.1044807434082, -61.325565338134766);
INSERT INTO public2.locations VALUES (2732, 'Los Nogales', 82, -33.14013671875, -61.604652404785156);
INSERT INTO public2.locations VALUES (2733, 'Los Quirquinchos', 82, -33.374858856201172, -61.710491180419922);
INSERT INTO public2.locations VALUES (2734, 'San JosÃ© de la Esquina', 82, -33.112281799316406, -61.702663421630859);
INSERT INTO public2.locations VALUES (2735, 'Sanford', 82, -33.145988464355469, -61.277198791503906);
INSERT INTO public2.locations VALUES (2736, 'Villada', 82, -33.348850250244141, -61.446620941162109);
INSERT INTO public2.locations VALUES (2737, 'Aldao', 82, -30.98057746887207, -61.743251800537109);
INSERT INTO public2.locations VALUES (2738, 'AngÃ©lica', 82, -31.550731658935547, -61.546337127685547);
INSERT INTO public2.locations VALUES (2739, 'Ataliva', 82, -30.996267318725586, -61.431907653808594);
INSERT INTO public2.locations VALUES (2740, 'Aurelia', 82, -31.419651031494141, -61.422462463378906);
INSERT INTO public2.locations VALUES (2741, 'Barrios Acapulco y Veracruz', 82, -31.415401458740234, -62.058620452880859);
INSERT INTO public2.locations VALUES (2742, 'Bauer y Sigel', 82, -31.27155876159668, -61.943016052246094);
INSERT INTO public2.locations VALUES (2743, 'Bella Italia', 82, -31.2832088470459, -61.409255981445312);
INSERT INTO public2.locations VALUES (2744, 'Castellanos', 82, -31.208858489990234, -61.7242317199707);
INSERT INTO public2.locations VALUES (2745, 'Colonia Bicha', 82, -30.854129791259766, -61.849536895751953);
INSERT INTO public2.locations VALUES (2746, 'Colonia Cello', 82, -31.43212890625, -61.841373443603516);
INSERT INTO public2.locations VALUES (2747, 'Colonia Margarita', 82, -31.685993194580078, -61.647724151611328);
INSERT INTO public2.locations VALUES (2748, 'Colonia Raquel', 82, -30.836833953857422, -61.488044738769531);
INSERT INTO public2.locations VALUES (2749, 'Coronel Fraga', 82, -31.174468994140625, -61.917484283447266);
INSERT INTO public2.locations VALUES (2750, 'Egusquiza', 82, -31.095455169677734, -61.627925872802734);
INSERT INTO public2.locations VALUES (2751, 'Esmeralda', 82, -31.612968444824219, -61.9328727722168);
INSERT INTO public2.locations VALUES (2752, 'EstaciÃ³n Clucellas', 82, -31.52410888671875, -61.718353271484375);
INSERT INTO public2.locations VALUES (2753, 'EstaciÃ³n Saguier', 82, -31.316272735595703, -61.696208953857422);
INSERT INTO public2.locations VALUES (2754, 'Eusebia y Carolina', 82, -30.947727203369141, -61.856075286865234);
INSERT INTO public2.locations VALUES (2755, 'Eustolia', 82, -31.576622009277344, -61.783535003662109);
INSERT INTO public2.locations VALUES (2756, 'Frontera', 82, -31.426464080810547, -62.059207916259766);
INSERT INTO public2.locations VALUES (2757, 'Garibaldi', 82, -31.649452209472656, -61.805866241455078);
INSERT INTO public2.locations VALUES (2758, 'Humberto Primo', 82, -30.868331909179688, -61.347942352294922);
INSERT INTO public2.locations VALUES (2759, 'Josefina', 82, -31.406301498413086, -61.9919548034668);
INSERT INTO public2.locations VALUES (2760, 'Lehmann', 82, -31.125373840332031, -61.452377319335938);
INSERT INTO public2.locations VALUES (2761, 'MarÃ­a Juana', 82, -31.675607681274414, -61.751678466796875);
INSERT INTO public2.locations VALUES (2762, 'Nueva Lehmann', 82, -31.118904113769531, -61.51519775390625);
INSERT INTO public2.locations VALUES (2763, 'Plaza Clucellas', 82, -31.452680587768555, -61.706783294677734);
INSERT INTO public2.locations VALUES (2764, 'Plaza Saguier', 82, -31.324283599853516, -61.668052673339844);
INSERT INTO public2.locations VALUES (2765, 'Presidente Roca', 82, -31.212175369262695, -61.613521575927734);
INSERT INTO public2.locations VALUES (2766, 'Pueblo Marini', 82, -31.038724899291992, -61.889381408691406);
INSERT INTO public2.locations VALUES (2767, 'Rafaela', 82, -31.252668380737305, -61.491661071777344);
INSERT INTO public2.locations VALUES (2768, 'Ramona', 82, -31.091856002807617, -61.902473449707031);
INSERT INTO public2.locations VALUES (2769, 'San Antonio', 82, -31.212320327758789, -61.724746704101562);
INSERT INTO public2.locations VALUES (2770, 'San Vicente', 82, -31.699159622192383, -61.567375183105469);
INSERT INTO public2.locations VALUES (2771, 'Santa Clara de Saguier', 82, -31.335748672485352, -61.817836761474609);
INSERT INTO public2.locations VALUES (2772, 'Sunchales', 82, -30.945077896118164, -61.560661315917969);
INSERT INTO public2.locations VALUES (2773, 'Susana', 82, -31.35576057434082, -61.515781402587891);
INSERT INTO public2.locations VALUES (2774, 'Tacural', 82, -30.84626579284668, -61.591747283935547);
INSERT INTO public2.locations VALUES (2775, 'Vila', 82, -31.190530776977539, -61.832904815673828);
INSERT INTO public2.locations VALUES (2776, 'Villa Josefina', 82, -31.440752029418945, -62.026241302490234);
INSERT INTO public2.locations VALUES (2777, 'Villa San JosÃ©', 82, -31.336666107177734, -61.621578216552734);
INSERT INTO public2.locations VALUES (2778, 'Virginia', 82, -30.739500045776367, -61.340126037597656);
INSERT INTO public2.locations VALUES (2779, 'ZenÃ³n Pereyra', 82, -31.560094833374023, -61.896236419677734);
INSERT INTO public2.locations VALUES (2780, 'Alcorta', 82, -33.538177490234375, -61.123928070068359);
INSERT INTO public2.locations VALUES (2781, 'Barrio Arroyo del Medio', 82, -33.283615112304688, -60.27142333984375);
INSERT INTO public2.locations VALUES (2782, 'Barrio Mitre', 82, -33.251724243164062, -60.388835906982422);
INSERT INTO public2.locations VALUES (2783, 'Bombal', 82, -33.457973480224609, -61.318210601806641);
INSERT INTO public2.locations VALUES (2784, 'CaÃ±ada Rica', 82, -33.516017913818359, -60.610103607177734);
INSERT INTO public2.locations VALUES (2785, 'Cepeda', 82, -33.398178100585938, -60.623916625976562);
INSERT INTO public2.locations VALUES (2786, 'Empalme Villa ConstituciÃ³n', 82, -33.26116943359375, -60.379604339599609);
INSERT INTO public2.locations VALUES (2787, 'Firmat', 82, -33.439071655273438, -61.482109069824219);
INSERT INTO public2.locations VALUES (2788, 'General Gelly', 82, -33.600177764892578, -60.597915649414062);
INSERT INTO public2.locations VALUES (2789, 'doy', 82, -33.367191314697266, -60.509300231933594);
INSERT INTO public2.locations VALUES (2790, 'Juan B. Molina', 82, -33.49383544921875, -60.510784149169922);
INSERT INTO public2.locations VALUES (2791, 'Juncal', 82, -33.716281890869141, -61.050910949707031);
INSERT INTO public2.locations VALUES (2792, 'La Vanguardia', 82, -33.357997894287109, -60.657375335693359);
INSERT INTO public2.locations VALUES (2793, 'MÃ¡ximo Paz', 82, -33.483177185058594, -60.956104278564453);
INSERT INTO public2.locations VALUES (2794, 'PavÃ³n', 82, -33.242900848388672, -60.407112121582031);
INSERT INTO public2.locations VALUES (2795, 'PavÃ³n Arriba', 82, -33.311588287353516, -60.824298858642578);
INSERT INTO public2.locations VALUES (2796, 'Peyrano', 82, -33.53778076171875, -60.799716949462891);
INSERT INTO public2.locations VALUES (2797, 'Rueda', 82, -33.335933685302734, -60.458782196044922);
INSERT INTO public2.locations VALUES (2798, 'Santa Teresa', 82, -33.4366455078125, -60.790489196777344);
INSERT INTO public2.locations VALUES (2799, 'Sargento Cabral', 82, -33.43133544921875, -60.629287719726562);
INSERT INTO public2.locations VALUES (2800, 'Stephenson', 82, -33.414340972900391, -60.559421539306641);
INSERT INTO public2.locations VALUES (2801, 'Theobald', 82, -33.310977935791016, -60.312374114990234);
INSERT INTO public2.locations VALUES (2802, 'Villa ConstituciÃ³n', 82, -33.227268218994141, -60.329750061035156);
INSERT INTO public2.locations VALUES (2803, 'CayastÃ¡', 82, -31.200750350952148, -60.159355163574219);
INSERT INTO public2.locations VALUES (2804, 'Helvecia', 82, -31.102357864379883, -60.088893890380859);
INSERT INTO public2.locations VALUES (2805, 'Los Zapallos', 82, -31.492002487182617, -60.428977966308594);
INSERT INTO public2.locations VALUES (2806, 'Saladero Mariano Cabal', 82, -30.880605697631836, -60.035243988037109);
INSERT INTO public2.locations VALUES (2807, 'Santa Rosa de Calchines', 82, -31.420387268066406, -60.332683563232422);
INSERT INTO public2.locations VALUES (2808, 'AarÃ³n Castellanos', 82, -34.332786560058594, -62.374080657958984);
INSERT INTO public2.locations VALUES (2809, 'AmenÃ¡bar', 82, -34.133579254150391, -62.423389434814453);
INSERT INTO public2.locations VALUES (2810, 'Cafferata', 82, -33.439537048339844, -62.086189270019531);
INSERT INTO public2.locations VALUES (2811, 'CaÃ±ada del Ucle', 82, -33.409465789794922, -61.605598449707031);
INSERT INTO public2.locations VALUES (2812, 'Carmen', 82, -33.730339050292969, -61.76226806640625);
INSERT INTO public2.locations VALUES (2813, 'Carreras', 82, -33.596145629882812, -61.310947418212891);
INSERT INTO public2.locations VALUES (2814, 'Chapuy', 82, -33.800708770751953, -61.744312286376953);
INSERT INTO public2.locations VALUES (2815, 'Chovet', 82, -33.598995208740234, -61.603958129882812);
INSERT INTO public2.locations VALUES (2816, 'Christophersen', 82, -34.18310546875, -62.025962829589844);
INSERT INTO public2.locations VALUES (2817, 'Die de Alvear', 82, -34.372650146484375, -62.128215789794922);
INSERT INTO public2.locations VALUES (2818, 'Elortondo', 82, -33.701984405517578, -61.615058898925781);
INSERT INTO public2.locations VALUES (2819, 'Firmat', 82, -33.458145141601562, -61.486209869384766);
INSERT INTO public2.locations VALUES (2820, 'Hughes', 82, -33.801200866699219, -61.336132049560547);
INSERT INTO public2.locations VALUES (2821, 'La Chispa', 82, -33.544204711914062, -61.974063873291016);
INSERT INTO public2.locations VALUES (2822, 'Labordeboy', 82, -33.717647552490234, -61.3140754699707);
INSERT INTO public2.locations VALUES (2823, 'Lazzarino', 82, -34.165462493896484, -62.428119659423828);
INSERT INTO public2.locations VALUES (2824, 'Maggiolo', 82, -33.721099853515625, -62.246246337890625);
INSERT INTO public2.locations VALUES (2825, 'MarÃ­a Teresa', 82, -34.012722015380859, -61.914752960205078);
INSERT INTO public2.locations VALUES (2826, 'MelincuÃ©', 82, -33.6611442565918, -61.456989288330078);
INSERT INTO public2.locations VALUES (2827, 'Miguel Torres', 82, -33.526462554931641, -61.465873718261719);
INSERT INTO public2.locations VALUES (2828, 'Murphy', 82, -33.642299652099609, -61.85833740234375);
INSERT INTO public2.locations VALUES (2829, 'Rufino', 82, -34.261871337890625, -62.711067199707031);
INSERT INTO public2.locations VALUES (2830, 'San Eduardo', 82, -33.871246337890625, -62.088924407958984);
INSERT INTO public2.locations VALUES (2831, 'San Francisco de Santa Fe', 82, -33.588497161865234, -62.1239013671875);
INSERT INTO public2.locations VALUES (2832, 'San Grerio', 82, -34.32537841796875, -62.035812377929688);
INSERT INTO public2.locations VALUES (2833, 'Sancti Spiritu', 82, -34.007724761962891, -62.241542816162109);
INSERT INTO public2.locations VALUES (2834, 'Santa Isabel', 82, -33.887657165527344, -61.695938110351562);
INSERT INTO public2.locations VALUES (2835, 'Teodelina', 82, -34.1895751953125, -61.526519775390625);
INSERT INTO public2.locations VALUES (2836, 'Venado Tuerto', 82, -33.745498657226562, -61.968734741210938);
INSERT INTO public2.locations VALUES (2837, 'Villa CaÃ±Ã¡s', 82, -34.004276275634766, -61.605827331542969);
INSERT INTO public2.locations VALUES (2838, 'Wheelwright', 82, -33.792308807373047, -61.210693359375);
INSERT INTO public2.locations VALUES (2839, 'Arroyo Ceibal', 82, -28.723081588745117, -59.477699279785156);
INSERT INTO public2.locations VALUES (2840, 'Avellaneda', 82, -29.117521286010742, -59.658473968505859);
INSERT INTO public2.locations VALUES (2841, 'Berna', 82, -29.272668838500977, -59.845310211181641);
INSERT INTO public2.locations VALUES (2842, 'El Araza', 82, -29.132999420166016, -59.947582244873047);
INSERT INTO public2.locations VALUES (2843, 'El RabÃ³n', 82, -28.22117805480957, -59.26422119140625);
INSERT INTO public2.locations VALUES (2844, 'Florencia', 82, -28.040632247924805, -59.218013763427734);
INSERT INTO public2.locations VALUES (2845, 'Guadalupe Norte', 82, -28.945053100585938, -59.563625335693359);
INSERT INTO public2.locations VALUES (2846, 'Ingeniero Chanourdie', 82, -28.75981330871582, -59.577232360839844);
INSERT INTO public2.locations VALUES (2847, 'La Isleta', 82, -28.492170333862305, -59.294193267822266);
INSERT INTO public2.locations VALUES (2848, 'La Sarita', 82, -28.972829818725586, -59.848838806152344);
INSERT INTO public2.locations VALUES (2849, 'Lanteri', 82, -28.840005874633789, -59.63519287109375);
INSERT INTO public2.locations VALUES (2850, 'Las Garzas', 82, -28.847137451171875, -59.499652862548828);
INSERT INTO public2.locations VALUES (2851, 'Las Toscas', 82, -28.354892730712891, -59.259300231933594);
INSERT INTO public2.locations VALUES (2852, 'Los Laureles', 82, -29.368648529052734, -59.736190795898438);
INSERT INTO public2.locations VALUES (2853, 'Malabri', 82, -29.348794937133789, -59.969905853271484);
INSERT INTO public2.locations VALUES (2854, 'Paraje San Manuel', 82, -28.87360954284668, -59.865982055664062);
INSERT INTO public2.locations VALUES (2855, 'Puerto Reconquista', 82, -29.233753204345703, -59.581039428710938);
INSERT INTO public2.locations VALUES (2856, 'Reconquista', 82, -29.14451789855957, -59.643547058105469);
INSERT INTO public2.locations VALUES (2857, 'San Antonio de Obligado', 82, -28.384252548217773, -59.264389038085938);
INSERT INTO public2.locations VALUES (2858, 'TacuarendÃ­', 82, -28.4178466796875, -59.257225036621094);
INSERT INTO public2.locations VALUES (2859, 'Villa Ana', 82, -28.49266242980957, -59.613327026367188);
INSERT INTO public2.locations VALUES (2860, 'Villa Guillermina', 82, -28.244524002075195, -59.451480865478516);
INSERT INTO public2.locations VALUES (2861, 'Villa Ocampo', 82, -28.486772537231445, -59.3547477722168);
INSERT INTO public2.locations VALUES (2862, 'Barrio Cicarelli', 82, -32.608310699462891, -61.324184417724609);
INSERT INTO public2.locations VALUES (2863, 'Bustinza', 82, -32.738243103027344, -61.290821075439453);
INSERT INTO public2.locations VALUES (2864, 'CaÃ±ada de GÃ³mez', 82, -32.821216583251953, -61.395198822021484);
INSERT INTO public2.locations VALUES (2865, 'Carrizales', 82, -32.508739471435547, -61.032203674316406);
INSERT INTO public2.locations VALUES (2866, 'Classon', 82, -32.462375640869141, -61.2903938293457);
INSERT INTO public2.locations VALUES (2867, 'Colonia MÃ©dici', 82, -32.5975456237793, -61.377964019775391);
INSERT INTO public2.locations VALUES (2868, 'Correa', 82, -32.848617553710938, -61.254497528076172);
INSERT INTO public2.locations VALUES (2869, 'LarguÃ­a', 82, -32.551982879638672, -61.218582153320312);
INSERT INTO public2.locations VALUES (2870, 'Lucio V. LÃ³pez', 82, -32.715396881103516, -61.017459869384766);
INSERT INTO public2.locations VALUES (2871, 'Oliveros', 82, -32.573932647705078, -60.854640960693359);
INSERT INTO public2.locations VALUES (2872, 'Pueblo Andino', 82, -32.669940948486328, -60.8753776550293);
INSERT INTO public2.locations VALUES (2873, 'Salto Grande', 82, -32.666057586669922, -61.088207244873047);
INSERT INTO public2.locations VALUES (2874, 'Serodino', 82, -32.603740692138672, -60.9473991394043);
INSERT INTO public2.locations VALUES (2875, 'Totoras', 82, -32.584274291992188, -61.166698455810547);
INSERT INTO public2.locations VALUES (2876, 'Villa EloÃ­sa', 82, -32.963890075683594, -61.5510139465332);
INSERT INTO public2.locations VALUES (2877, 'Villa La Rivera (Oliveros)', 82, -32.634971618652344, -60.820224761962891);
INSERT INTO public2.locations VALUES (2878, 'Villa La Rivera (Pueblo Andino)', 82, -32.638866424560547, -60.822666168212891);
INSERT INTO public2.locations VALUES (2879, 'Angel Gallardo', 82, -31.555826187133789, -60.678417205810547);
INSERT INTO public2.locations VALUES (2880, 'Arroyo Aguiar', 82, -31.432086944580078, -60.667930603027344);
INSERT INTO public2.locations VALUES (2881, 'Arroyo Leyes', 82, -31.558725357055664, -60.517509460449219);
INSERT INTO public2.locations VALUES (2882, 'Cabal', 82, -31.10399055480957, -60.727149963378906);
INSERT INTO public2.locations VALUES (2883, 'Campo Andino', 82, -31.239055633544922, -60.529808044433594);
INSERT INTO public2.locations VALUES (2884, 'Candioti', 82, -31.401390075683594, -60.748981475830078);
INSERT INTO public2.locations VALUES (2885, 'Emilia', 82, -31.059019088745117, -60.744907379150391);
INSERT INTO public2.locations VALUES (2886, 'Laguna Paiva', 82, -31.307357788085938, -60.6599235534668);
INSERT INTO public2.locations VALUES (2887, 'Llambi Campbell', 82, -31.184183120727539, -60.7476806640625);
INSERT INTO public2.locations VALUES (2888, 'Monte Vera', 82, -31.516801834106445, -60.678676605224609);
INSERT INTO public2.locations VALUES (2889, 'Nelson', 82, -31.265832901000977, -60.764450073242188);
INSERT INTO public2.locations VALUES (2890, 'Paraje Chaco Chico', 82, -31.566507339477539, -60.661518096923828);
INSERT INTO public2.locations VALUES (2891, 'Paraje La Costa', 82, -31.515356063842773, -60.613212585449219);
INSERT INTO public2.locations VALUES (2892, 'Recreo', 82, -31.49089241027832, -60.735450744628906);
INSERT INTO public2.locations VALUES (2893, 'RincÃ³n Potrero', 82, -31.528997421264648, -60.479995727539062);
INSERT INTO public2.locations VALUES (2894, 'San JosÃ© del RincÃ³n', 82, -31.60650634765625, -60.56744384765625);
INSERT INTO public2.locations VALUES (2895, 'Santa Fe', 82, -31.657474517822266, -60.710479736328125);
INSERT INTO public2.locations VALUES (2896, 'Santo TomÃ©', 82, -31.663019180297852, -60.761722564697266);
INSERT INTO public2.locations VALUES (2897, 'Sauce Viejo', 82, -31.771093368530273, -60.837142944335938);
INSERT INTO public2.locations VALUES (2898, 'Villa Laura', 82, -31.3720645904541, -60.66229248046875);
INSERT INTO public2.locations VALUES (2899, 'Cavour', 82, -31.364805221557617, -61.016544342041016);
INSERT INTO public2.locations VALUES (2900, 'CululÃº', 82, -31.206092834472656, -60.930019378662109);
INSERT INTO public2.locations VALUES (2901, 'Elisa', 82, -30.694492340087891, -61.049400329589844);
INSERT INTO public2.locations VALUES (2902, 'Empalme San Carlos', 82, -31.547704696655273, -60.813713073730469);
INSERT INTO public2.locations VALUES (2903, 'Esperanza', 82, -31.448890686035156, -60.930152893066406);
INSERT INTO public2.locations VALUES (2904, 'Felicia', 82, -31.244546890258789, -61.212184906005859);
INSERT INTO public2.locations VALUES (2905, 'Franck', 82, -31.587190628051758, -60.938339233398438);
INSERT INTO public2.locations VALUES (2906, 'Grutly', 82, -31.26869010925293, -61.071971893310547);
INSERT INTO public2.locations VALUES (2907, 'HipatÃ­a', 82, -31.125576019287109, -61.033004760742188);
INSERT INTO public2.locations VALUES (2908, 'Humboldt', 82, -31.400857925415039, -61.082298278808594);
INSERT INTO public2.locations VALUES (2909, 'Jacinto L. ArÃ¡uz', 82, -30.734298706054688, -60.975551605224609);
INSERT INTO public2.locations VALUES (2910, 'La Pelada', 82, -30.866241455078125, -60.968292236328125);
INSERT INTO public2.locations VALUES (2911, 'Las Tunas', 82, -31.571889877319336, -60.996131896972656);
INSERT INTO public2.locations VALUES (2912, 'MarÃ­a Luisa', 82, -31.010843276977539, -60.910762786865234);
INSERT INTO public2.locations VALUES (2913, 'Matilde', 82, -31.79157829284668, -60.979946136474609);
INSERT INTO public2.locations VALUES (2914, 'Nuevo Torino', 82, -31.345006942749023, -61.235134124755859);
INSERT INTO public2.locations VALUES (2915, 'Pilar', 82, -31.440410614013672, -61.259597778320312);
INSERT INTO public2.locations VALUES (2916, 'Plaza Matilde', 82, -31.796266555786133, -61.010013580322266);
INSERT INTO public2.locations VALUES (2917, 'Progreso', 82, -31.137866973876953, -60.989643096923828);
INSERT INTO public2.locations VALUES (2918, 'Providencia', 82, -30.98274040222168, -61.021125793457031);
INSERT INTO public2.locations VALUES (2919, 'Sa Pereyra', 82, -31.570455551147461, -61.376533508300781);
INSERT INTO public2.locations VALUES (2920, 'San AgustÃ­n', 82, -31.682872772216797, -60.940635681152344);
INSERT INTO public2.locations VALUES (2921, 'San Carlos Centro', 82, -31.726587295532227, -61.090728759765625);
INSERT INTO public2.locations VALUES (2922, 'San Carlos Norte', 82, -31.673543930053711, -61.07476806640625);
INSERT INTO public2.locations VALUES (2923, 'San Carlos Sud', 82, -31.760820388793945, -61.100578308105469);
INSERT INTO public2.locations VALUES (2924, 'San JerÃ³nimo del Sauce', 82, -31.609029769897461, -61.141353607177734);
INSERT INTO public2.locations VALUES (2925, 'San JerÃ³nimo Norte', 82, -31.552707672119141, -61.077922821044922);
INSERT INTO public2.locations VALUES (2926, 'San Mariano', 82, -31.668413162231445, -61.347442626953125);
INSERT INTO public2.locations VALUES (2927, 'Santa Clara de Buena Vista', 82, -31.762372970581055, -61.315799713134766);
INSERT INTO public2.locations VALUES (2928, 'Santo Domin', 82, -31.120466232299805, -60.887992858886719);
INSERT INTO public2.locations VALUES (2929, 'Sarmiento', 82, -31.058807373046875, -61.167198181152344);
INSERT INTO public2.locations VALUES (2930, 'Esteban Rams', 82, -29.772420883178711, -61.489982604980469);
INSERT INTO public2.locations VALUES (2931, 'Gato Colorado', 82, -28.022390365600586, -61.186580657958984);
INSERT INTO public2.locations VALUES (2932, 'Greria PÃ©rez de Denis', 82, -28.227453231811523, -61.527816772460938);
INSERT INTO public2.locations VALUES (2933, 'LogroÃ±o', 82, -29.503755569458008, -61.696147918701172);
INSERT INTO public2.locations VALUES (2934, 'Montefiore', 82, -29.6686954498291, -61.866893768310547);
INSERT INTO public2.locations VALUES (2935, 'Pozo Borrado', 82, -28.938083648681641, -61.704872131347656);
INSERT INTO public2.locations VALUES (2936, 'San Bernardo', 82, -28.667411804199219, -61.52801513671875);
INSERT INTO public2.locations VALUES (2937, 'Santa Margarita', 82, -28.313823699951172, -61.548755645751953);
INSERT INTO public2.locations VALUES (2938, 'Tostado', 82, -29.232728958129883, -61.771209716796875);
INSERT INTO public2.locations VALUES (2939, 'Villa Minetti', 82, -28.622961044311523, -61.626762390136719);
INSERT INTO public2.locations VALUES (2940, 'AcÃ©bal', 82, -33.241764068603516, -60.836479187011719);
INSERT INTO public2.locations VALUES (2941, 'Albarellos', 82, -33.239540100097656, -60.636760711669922);
INSERT INTO public2.locations VALUES (2942, 'Ãlvarez', 82, -33.128089904785156, -60.806190490722656);
INSERT INTO public2.locations VALUES (2943, 'Alvear', 82, -33.057842254638672, -60.619842529296875);
INSERT INTO public2.locations VALUES (2944, 'Arbilla', 82, -33.091064453125, -60.698478698730469);
INSERT INTO public2.locations VALUES (2945, 'Arminda', 82, -33.263576507568359, -60.967880249023438);
INSERT INTO public2.locations VALUES (2946, 'Arroyo Seco', 82, -33.158138275146484, -60.511940002441406);
INSERT INTO public2.locations VALUES (2947, 'Carmen del Sauce', 82, -33.236026763916016, -60.811771392822266);
INSERT INTO public2.locations VALUES (2948, 'Coronel Bogado', 82, -33.315853118896484, -60.602676391601562);
INSERT INTO public2.locations VALUES (2949, 'Coronel Rodolfo S. DomÃ­nguez', 82, -33.1837043762207, -60.721981048583984);
INSERT INTO public2.locations VALUES (2950, 'Cuatro Esquinas', 82, -33.2442626953125, -60.764324188232422);
INSERT INTO public2.locations VALUES (2951, 'El Caramelo', 82, -33.128517150878906, -60.713401794433594);
INSERT INTO public2.locations VALUES (2952, 'Fighiera', 82, -33.193862915039062, -60.469436645507812);
INSERT INTO public2.locations VALUES (2953, 'Funes', 82, -32.920864105224609, -60.811435699462891);
INSERT INTO public2.locations VALUES (2954, 'General Las', 82, -33.110042572021484, -60.564556121826172);
INSERT INTO public2.locations VALUES (2955, 'Granadero Bairria', 82, -32.861831665039062, -60.706333160400391);
INSERT INTO public2.locations VALUES (2956, 'Ibarlucea', 82, -32.851863861083984, -60.785480499267578);
INSERT INTO public2.locations VALUES (2957, 'KilÃ³metro 101', 82, -33.058788299560547, -60.684970855712891);
INSERT INTO public2.locations VALUES (2958, 'Los Muchachos - La Alborada', 82, -33.090297698974609, -60.736331939697266);
INSERT INTO public2.locations VALUES (2959, 'Monte Flores', 82, -33.076335906982422, -60.6334342956543);
INSERT INTO public2.locations VALUES (2960, 'PÃ©rez', 82, -32.998870849609375, -60.769866943359375);
INSERT INTO public2.locations VALUES (2961, 'PiÃ±ero', 82, -33.109138488769531, -60.796112060546875);
INSERT INTO public2.locations VALUES (2962, 'Pueblo Esther', 82, -33.072292327880859, -60.574993133544922);
INSERT INTO public2.locations VALUES (2963, 'Pueblo MuÃ±Ã³z', 82, -33.172046661376953, -60.898075103759766);
INSERT INTO public2.locations VALUES (2964, 'Pueblo Uranga', 82, -33.266036987304688, -60.705249786376953);
INSERT INTO public2.locations VALUES (2965, 'Puerto Arroyo Seco', 82, -33.130416870117188, -60.505844116210938);
INSERT INTO public2.locations VALUES (2966, 'Rosario', 82, -32.947212219238281, -60.633174896240234);
INSERT INTO public2.locations VALUES (2967, 'Soldini', 82, -33.027584075927734, -60.756755828857422);
INSERT INTO public2.locations VALUES (2968, 'Villa Amelia', 82, -33.175907135009766, -60.664100646972656);
INSERT INTO public2.locations VALUES (2969, 'Villa del Plata', 82, -33.126293182373047, -60.7069206237793);
INSERT INTO public2.locations VALUES (2970, 'Villa bernador GÃ¡lvez', 82, -33.025131225585938, -60.633689880371094);
INSERT INTO public2.locations VALUES (2971, 'Zavalla', 82, -33.019630432128906, -60.878498077392578);
INSERT INTO public2.locations VALUES (2972, 'AguarÃ¡ Grande', 82, -30.11610221862793, -60.894260406494141);
INSERT INTO public2.locations VALUES (2973, 'Ambrosetti', 82, -30.015241622924805, -61.576023101806641);
INSERT INTO public2.locations VALUES (2974, 'Arrufo', 82, -30.232418060302734, -61.728019714355469);
INSERT INTO public2.locations VALUES (2975, 'Balneario La Verde', 82, -29.980913162231445, -61.241905212402344);
INSERT INTO public2.locations VALUES (2976, 'Capivara', 82, -30.459709167480469, -61.271152496337891);
INSERT INTO public2.locations VALUES (2977, 'Ceres', 82, -29.881895065307617, -61.945095062255859);
INSERT INTO public2.locations VALUES (2978, 'Colonia Ana', 82, -30.143749237060547, -61.913692474365234);
INSERT INTO public2.locations VALUES (2979, 'Colonia Bossi', 82, -30.6678466796875, -61.787742614746094);
INSERT INTO public2.locations VALUES (2980, 'Colonia Rosa', 82, -30.300382614135742, -61.983818054199219);
INSERT INTO public2.locations VALUES (2981, 'Constanza', 82, -30.663518905639648, -61.319732666015625);
INSERT INTO public2.locations VALUES (2982, 'CurupaytÃ­', 82, -30.39610481262207, -61.653129577636719);
INSERT INTO public2.locations VALUES (2983, 'Hersilia', 82, -30.003944396972656, -61.839149475097656);
INSERT INTO public2.locations VALUES (2984, 'Huanqueros', 82, -30.011993408203125, -61.218463897705078);
INSERT INTO public2.locations VALUES (2985, 'La Cabral', 82, -30.086801528930664, -61.1783332824707);
INSERT INTO public2.locations VALUES (2986, 'La Lucila', 82, -30.419666290283203, -61.0033073425293);
INSERT INTO public2.locations VALUES (2987, 'La Rubia', 82, -30.110286712646484, -61.793502807617188);
INSERT INTO public2.locations VALUES (2988, 'Las Avispas', 82, -29.896417617797852, -61.288066864013672);
INSERT INTO public2.locations VALUES (2989, 'Las Palmeras', 82, -30.630256652832031, -61.625823974609375);
INSERT INTO public2.locations VALUES (2990, 'MoisÃ©s Ville', 82, -30.715585708618164, -61.469509124755859);
INSERT INTO public2.locations VALUES (2991, 'Monites', 82, -30.488367080688477, -61.634231567382812);
INSERT INTO public2.locations VALUES (2992, 'Ã‘anducita', 82, -30.369819641113281, -61.133377075195312);
INSERT INTO public2.locations VALUES (2993, 'Palacios', 82, -30.708583831787109, -61.622653961181641);
INSERT INTO public2.locations VALUES (2994, 'San CristÃ³bal', 82, -30.311689376831055, -61.2362060546875);
INSERT INTO public2.locations VALUES (2995, 'San Guillermo', 82, -30.358453750610352, -61.917320251464844);
INSERT INTO public2.locations VALUES (2996, 'Santurce', 82, -30.186567306518555, -61.181076049804688);
INSERT INTO public2.locations VALUES (2997, 'Soledad', 82, -30.619649887084961, -60.914512634277344);
INSERT INTO public2.locations VALUES (2998, 'Suardi', 82, -30.534423828125, -61.961006164550781);
INSERT INTO public2.locations VALUES (2999, 'Villa Saralegui', 82, -30.540840148925781, -60.746780395507812);
INSERT INTO public2.locations VALUES (3000, 'Villa Trinidad', 82, -30.216108322143555, -61.877090454101562);
INSERT INTO public2.locations VALUES (3001, 'Alejandra', 82, -29.909210205078125, -59.826869964599609);
INSERT INTO public2.locations VALUES (3002, 'Cacique AriacaiquÃ­n', 82, -30.656341552734375, -60.229808807373047);
INSERT INTO public2.locations VALUES (3003, 'Colonia DurÃ¡n', 82, -29.55811882019043, -59.926593780517578);
INSERT INTO public2.locations VALUES (3004, 'La Brava', 82, -30.447782516479492, -60.140937805175781);
INSERT INTO public2.locations VALUES (3005, 'Romang', 82, -29.499597549438477, -59.747703552246094);
INSERT INTO public2.locations VALUES (3006, 'San Javier', 82, -30.581666946411133, -59.9281005859375);
INSERT INTO public2.locations VALUES (3007, 'Arocena', 82, -32.082485198974609, -60.976814270019531);
INSERT INTO public2.locations VALUES (3008, 'Balneario Monje', 82, -32.334041595458984, -60.876548767089844);
INSERT INTO public2.locations VALUES (3009, 'Barrancas', 82, -32.234580993652344, -60.983516693115234);
INSERT INTO public2.locations VALUES (3010, 'Barrio Caima', 82, -31.837919235229492, -60.865032196044922);
INSERT INTO public2.locations VALUES (3011, 'Barrio El PacaÃ¡ - Barrio Comipini', 82, -32.128574371337891, -60.930557250976562);
INSERT INTO public2.locations VALUES (3012, 'Bernardo de Iriyen', 82, -32.169681549072266, -61.156688690185547);
INSERT INTO public2.locations VALUES (3013, 'Casalegno', 82, -32.263008117675781, -61.126468658447266);
INSERT INTO public2.locations VALUES (3014, 'Centeno', 82, -32.296024322509766, -61.407249450683594);
INSERT INTO public2.locations VALUES (3015, 'Coronda', 82, -31.974485397338867, -60.916091918945312);
INSERT INTO public2.locations VALUES (3016, 'DesvÃ­o ArijÃ³n', 82, -31.870552062988281, -60.889247894287109);
INSERT INTO public2.locations VALUES (3017, 'DÃ­az', 82, -32.370582580566406, -61.086448669433594);
INSERT INTO public2.locations VALUES (3018, 'Gaboto', 82, -32.432525634765625, -60.817813873291016);
INSERT INTO public2.locations VALUES (3019, 'GÃ¡lvez', 82, -32.030281066894531, -61.224327087402344);
INSERT INTO public2.locations VALUES (3020, 'Gessler', 82, -31.874298095703125, -61.126865386962891);
INSERT INTO public2.locations VALUES (3021, 'Iriyen', 82, -32.158145904541016, -61.1102294921875);
INSERT INTO public2.locations VALUES (3022, 'Larrechea', 82, -31.935415267944336, -61.045753479003906);
INSERT INTO public2.locations VALUES (3023, 'Loma Alta', 82, -31.961957931518555, -61.176712036132812);
INSERT INTO public2.locations VALUES (3024, 'LÃ³pez', 82, -31.904815673828125, -61.277755737304688);
INSERT INTO public2.locations VALUES (3025, 'Maciel', 82, -32.456840515136719, -60.892459869384766);
INSERT INTO public2.locations VALUES (3026, 'Monje', 82, -32.360370635986328, -60.942829132080078);
INSERT INTO public2.locations VALUES (3027, 'Puerto AragÃ³n', 82, -32.242950439453125, -60.923313140869141);
INSERT INTO public2.locations VALUES (3028, 'San Eugenio', 82, -32.076171875, -61.115798950195312);
INSERT INTO public2.locations VALUES (3029, 'San FabiÃ¡n', 82, -32.1379280090332, -60.983123779296875);
INSERT INTO public2.locations VALUES (3030, 'San Genaro', 82, -32.371650695800781, -61.359943389892578);
INSERT INTO public2.locations VALUES (3031, 'San Genaro Norte', 82, -32.364952087402344, -61.337165832519531);
INSERT INTO public2.locations VALUES (3032, 'Angeloni', 82, -30.85566520690918, -60.650177001953125);
INSERT INTO public2.locations VALUES (3033, 'Cayastacito', 82, -31.112810134887695, -60.579879760742188);
INSERT INTO public2.locations VALUES (3034, 'Colonia Dolores', 82, -30.38238525390625, -60.330486297607422);
INSERT INTO public2.locations VALUES (3035, 'Esther', 82, -31.040693283081055, -60.645191192626953);
INSERT INTO public2.locations VALUES (3036, 'bernador Crespo', 82, -30.362953186035156, -60.400238037109375);
INSERT INTO public2.locations VALUES (3037, 'La Criolla', 82, -30.223670959472656, -60.363605499267578);
INSERT INTO public2.locations VALUES (3038, 'La Penca y CaraguatÃ¡', 82, -30.346723556518555, -60.521247863769531);
INSERT INTO public2.locations VALUES (3039, 'Marcelino Escalada', 82, -30.580934524536133, -60.468307495117188);
INSERT INTO public2.locations VALUES (3040, 'NarÃ©', 82, -30.948776245117188, -60.467037200927734);
INSERT INTO public2.locations VALUES (3041, 'Pedro GÃ³mez Cello', 82, -30.038475036621094, -60.315242767333984);
INSERT INTO public2.locations VALUES (3042, 'RamayÃ³n', 82, -30.67194938659668, -60.505950927734375);
INSERT INTO public2.locations VALUES (3043, 'San Bernardo', 82, -30.889177322387695, -60.573978424072266);
INSERT INTO public2.locations VALUES (3044, 'San Justo', 82, -30.78917121887207, -60.593299865722656);
INSERT INTO public2.locations VALUES (3045, 'San MartÃ­n Norte', 82, -30.345714569091797, -60.303512573242188);
INSERT INTO public2.locations VALUES (3046, 'Silva', 82, -30.447299957275391, -60.430561065673828);
INSERT INTO public2.locations VALUES (3047, 'Vera y Pintado', 82, -30.144269943237305, -60.33880615234375);
INSERT INTO public2.locations VALUES (3048, 'Videla', 82, -30.942922592163086, -60.657012939453125);
INSERT INTO public2.locations VALUES (3049, 'Aldao', 82, -32.704475402832031, -60.815902709960938);
INSERT INTO public2.locations VALUES (3050, 'CapitÃ¡n BermÃºdez', 82, -32.826457977294922, -60.716156005859375);
INSERT INTO public2.locations VALUES (3051, 'CarcaraÃ±Ã¡', 82, -32.857387542724609, -61.1518669128418);
INSERT INTO public2.locations VALUES (3052, 'Coronel Arnold', 82, -33.106021881103516, -60.9668083190918);
INSERT INTO public2.locations VALUES (3053, 'Fray Luis BeltrÃ¡n', 82, -32.781547546386719, -60.731010437011719);
INSERT INTO public2.locations VALUES (3054, 'Fuentes', 82, -33.1724967956543, -61.074131011962891);
INSERT INTO public2.locations VALUES (3055, 'Luis Palacios', 82, -32.782341003417969, -60.904582977294922);
INSERT INTO public2.locations VALUES (3056, 'Puerto General San MartÃ­n', 82, -32.716037750244141, -60.731395721435547);
INSERT INTO public2.locations VALUES (3057, 'Pujato', 82, -33.017646789550781, -61.043052673339844);
INSERT INTO public2.locations VALUES (3058, 'Ricardone', 82, -32.770633697509766, -60.784072875976562);
INSERT INTO public2.locations VALUES (3059, 'RoldÃ¡n', 82, -32.898143768310547, -60.909648895263672);
INSERT INTO public2.locations VALUES (3060, 'San JerÃ³nimo Sud', 82, -32.879398345947266, -61.027694702148438);
INSERT INTO public2.locations VALUES (3061, 'San Lorenzo', 82, -32.747261047363281, -60.735687255859375);
INSERT INTO public2.locations VALUES (3062, 'TimbÃºes', 82, -32.667812347412109, -60.793647766113281);
INSERT INTO public2.locations VALUES (3063, 'Villa Elvira', 82, -32.641338348388672, -60.818275451660156);
INSERT INTO public2.locations VALUES (3064, 'Villa Mugueta', 82, -33.311965942382812, -61.056293487548828);
INSERT INTO public2.locations VALUES (3065, 'CaÃ±ada RosquÃ­n', 82, -32.054367065429688, -61.601860046386719);
INSERT INTO public2.locations VALUES (3066, 'Carlos Pellegrini', 82, -32.050453186035156, -61.782730102539062);
INSERT INTO public2.locations VALUES (3067, 'Casas', 82, -32.125633239746094, -61.539844512939453);
INSERT INTO public2.locations VALUES (3068, 'Castelar', 82, -31.668567657470703, -62.090133666992188);
INSERT INTO public2.locations VALUES (3069, 'Colonia Belgrano', 82, -31.909450531005859, -61.400917053222656);
INSERT INTO public2.locations VALUES (3070, 'Crispi', 82, -31.739847183227539, -62.037593841552734);
INSERT INTO public2.locations VALUES (3071, 'El TrÃ©bol', 82, -32.198040008544922, -61.7019157409668);
INSERT INTO public2.locations VALUES (3072, 'Landeta', 82, -32.012752532958984, -62.062282562255859);
INSERT INTO public2.locations VALUES (3073, 'Las Bandurrias', 82, -32.197475433349609, -61.492279052734375);
INSERT INTO public2.locations VALUES (3074, 'Las Petacas', 82, -31.821186065673828, -62.110500335693359);
INSERT INTO public2.locations VALUES (3075, 'Los Cardos', 82, -32.322261810302734, -61.631587982177734);
INSERT INTO public2.locations VALUES (3076, 'MarÃ­a Susana', 82, -32.2669792175293, -61.905868530273438);
INSERT INTO public2.locations VALUES (3077, 'Piamonte', 82, -32.143924713134766, -61.980442047119141);
INSERT INTO public2.locations VALUES (3078, 'San Jorge', 82, -31.896152496337891, -61.859653472900391);
INSERT INTO public2.locations VALUES (3079, 'San MartÃ­n de las Escobas', 82, -31.857864379882812, -61.569622039794922);
INSERT INTO public2.locations VALUES (3080, 'Sastre', 82, -31.767576217651367, -61.828876495361328);
INSERT INTO public2.locations VALUES (3081, 'Traill', 82, -31.92152214050293, -61.7026252746582);
INSERT INTO public2.locations VALUES (3082, 'Wildermuth', 82, -31.944833755493164, -61.401332855224609);
INSERT INTO public2.locations VALUES (3083, 'CalchaquÃ­', 82, -29.888010025024414, -60.283115386962891);
INSERT INTO public2.locations VALUES (3084, 'CaÃ±ada OmbÃº', 82, -28.30912971496582, -59.983554840087891);
INSERT INTO public2.locations VALUES (3085, 'Colmena', 82, -28.762500762939453, -60.091091156005859);
INSERT INTO public2.locations VALUES (3086, 'FortÃ­n Olmos', 82, -29.056953430175781, -60.412899017333984);
INSERT INTO public2.locations VALUES (3087, 'Garabato', 82, -28.954490661621094, -60.135078430175781);
INSERT INTO public2.locations VALUES (3088, 'londrina', 82, -28.556375503540039, -60.024787902832031);
INSERT INTO public2.locations VALUES (3089, 'Intiyaco', 82, -28.67486572265625, -60.070701599121094);
INSERT INTO public2.locations VALUES (3090, 'KilÃ³metro 115', 82, -28.824760437011719, -60.223403930664062);
INSERT INTO public2.locations VALUES (3091, 'La Gallareta', 82, -29.586275100708008, -60.378223419189453);
INSERT INTO public2.locations VALUES (3092, 'Los Amores', 82, -28.10181999206543, -59.977962493896484);
INSERT INTO public2.locations VALUES (3093, 'Margarita', 82, -29.687648773193359, -60.2531852722168);
INSERT INTO public2.locations VALUES (3094, 'Paraje 29', 82, -29.108224868774414, -60.239284515380859);
INSERT INTO public2.locations VALUES (3095, 'Pozo de los Indios', 82, -28.945133209228516, -60.252002716064453);
INSERT INTO public2.locations VALUES (3096, 'Pueblo Santa LucÃ­a', 82, -29.281917572021484, -60.402675628662109);
INSERT INTO public2.locations VALUES (3097, 'Tartagal', 82, -28.671054840087891, -59.848087310791016);
INSERT INTO public2.locations VALUES (3098, 'Toba', 82, -29.268163681030273, -60.171543121337891);
INSERT INTO public2.locations VALUES (3099, 'Vera', 82, -29.459228515625, -60.214771270751953);
INSERT INTO public2.locations VALUES (3100, 'Argentina', 86, -29.534709930419922, -62.267139434814453);
INSERT INTO public2.locations VALUES (3101, 'Casares', 86, -28.948139190673828, -62.800102233886719);
INSERT INTO public2.locations VALUES (3102, 'MalbrÃ¡n', 86, -29.349178314208984, -62.441768646240234);
INSERT INTO public2.locations VALUES (3103, 'Villa General Mitre', 86, -29.141754150390625, -62.654548645019531);
INSERT INTO public2.locations VALUES (3104, 'Campo Gallo', 86, -26.583951950073242, -62.847049713134766);
INSERT INTO public2.locations VALUES (3105, 'Coronel Manuel L. Rico', 86, -26.3857421875, -61.812286376953125);
INSERT INTO public2.locations VALUES (3106, 'Donadeu', 86, -26.725265502929688, -62.720729827880859);
INSERT INTO public2.locations VALUES (3107, 'Sachayoj', 86, -26.675407409667969, -61.815044403076172);
INSERT INTO public2.locations VALUES (3108, 'Santos Lugares', 86, -26.690597534179688, -63.559211730957031);
INSERT INTO public2.locations VALUES (3109, 'EstaciÃ³n Atamisqui', 86, -28.493728637695312, -63.937446594238281);
INSERT INTO public2.locations VALUES (3110, 'MedellÃ­n', 86, -28.652341842651367, -63.785507202148438);
INSERT INTO public2.locations VALUES (3111, 'Villa Atamisqui', 86, -28.496444702148438, -63.817329406738281);
INSERT INTO public2.locations VALUES (3112, 'Colonia Dora', 86, -28.604022979736328, -62.950416564941406);
INSERT INTO public2.locations VALUES (3113, 'Herrera', 86, -28.482913970947266, -63.066238403320312);
INSERT INTO public2.locations VALUES (3114, 'IcaÃ±o', 86, -28.681476593017578, -62.881179809570312);
INSERT INTO public2.locations VALUES (3115, 'Lunes', 86, -28.33635139465332, -63.339328765869141);
INSERT INTO public2.locations VALUES (3116, 'Real Sayana', 86, -28.814689636230469, -62.843063354492188);
INSERT INTO public2.locations VALUES (3117, 'Villa MailÃ­n', 86, -28.482601165771484, -63.276050567626953);
INSERT INTO public2.locations VALUES (3118, 'Abra Grande', 86, -27.290164947509766, -64.378173828125);
INSERT INTO public2.locations VALUES (3119, 'AntajÃ©', 86, -27.6229190826416, -64.254600524902344);
INSERT INTO public2.locations VALUES (3120, 'Ardiles', 86, -27.412055969238281, -64.499320983886719);
INSERT INTO public2.locations VALUES (3121, 'CaÃ±ada Escobar', 86, -27.708498001098633, -64.023155212402344);
INSERT INTO public2.locations VALUES (3122, 'Chaupi Pozo', 86, -27.506933212280273, -64.419837951660156);
INSERT INTO public2.locations VALUES (3123, 'Clodomira', 86, -27.580564498901367, -64.135223388671875);
INSERT INTO public2.locations VALUES (3124, 'Huyamampa', 86, -27.385665893554688, -64.295234680175781);
INSERT INTO public2.locations VALUES (3125, 'La Aurora', 86, -27.495941162109375, -64.230667114257812);
INSERT INTO public2.locations VALUES (3126, 'La Banda', 86, -27.730649948120117, -64.243362426757812);
INSERT INTO public2.locations VALUES (3127, 'La DÃ¡rsena', 86, -27.698419570922852, -64.288345336914062);
INSERT INTO public2.locations VALUES (3128, 'Los Quiroga', 86, -27.652603149414062, -64.3549575805664);
INSERT INTO public2.locations VALUES (3129, 'Los Soria', 86, -27.622367858886719, -64.370590209960938);
INSERT INTO public2.locations VALUES (3130, 'Simbolar', 86, -27.653810501098633, -64.193122863769531);
INSERT INTO public2.locations VALUES (3131, 'Tramo 16', 86, -27.696674346923828, -64.167152404785156);
INSERT INTO public2.locations VALUES (3132, 'Tramo 20', 86, -27.721181869506836, -64.118499755859375);
INSERT INTO public2.locations VALUES (3133, 'Bandera', 86, -28.888092041015625, -62.269023895263672);
INSERT INTO public2.locations VALUES (3134, 'Cuatro Bocas', 86, -28.864274978637695, -61.857593536376953);
INSERT INTO public2.locations VALUES (3135, 'FortÃ­n Inca', 86, -29.127471923828125, -61.934474945068359);
INSERT INTO public2.locations VALUES (3136, 'Guardia Escolta', 86, -28.988338470458984, -62.1265983581543);
INSERT INTO public2.locations VALUES (3137, 'El DeÃ¡n', 86, -27.71464729309082, -64.331291198730469);
INSERT INTO public2.locations VALUES (3138, 'El MojÃ³n', 86, -27.993623733520508, -64.208099365234375);
INSERT INTO public2.locations VALUES (3139, 'El ZanjÃ³n', 86, -27.870954513549805, -64.243194580078125);
INSERT INTO public2.locations VALUES (3140, 'Los Cardozos', 86, -27.912416458129883, -64.198127746582031);
INSERT INTO public2.locations VALUES (3141, 'Maco', 86, -27.870264053344727, -64.216590881347656);
INSERT INTO public2.locations VALUES (3142, 'Maquito', 86, -27.88286018371582, -64.208816528320312);
INSERT INTO public2.locations VALUES (3143, 'Morales', 86, -27.676149368286133, -64.365386962890625);
INSERT INTO public2.locations VALUES (3144, 'Puesto de San Antonio', 86, -27.663084030151367, -64.378593444824219);
INSERT INTO public2.locations VALUES (3145, 'San Pedro', 86, -27.94621467590332, -64.164009094238281);
INSERT INTO public2.locations VALUES (3146, 'Santa MarÃ­a', 86, -27.949089050292969, -64.219001770019531);
INSERT INTO public2.locations VALUES (3147, 'Santia del Estero', 86, -27.787685394287109, -64.2596664428711);
INSERT INTO public2.locations VALUES (3148, 'Vuelta de la Barranca', 86, -27.891498565673828, -64.195693969726562);
INSERT INTO public2.locations VALUES (3149, 'Yanda', 86, -27.909317016601562, -64.230308532714844);
INSERT INTO public2.locations VALUES (3150, 'El CaburÃ©', 86, -26.015884399414062, -62.334175109863281);
INSERT INTO public2.locations VALUES (3151, 'Los Pirpintos', 86, -26.131679534912109, -62.064365386962891);
INSERT INTO public2.locations VALUES (3152, 'Los Tigres', 86, -25.909212112426758, -62.591201782226562);
INSERT INTO public2.locations VALUES (3153, 'Monte Quemado', 86, -25.803569793701172, -62.830131530761719);
INSERT INTO public2.locations VALUES (3154, 'Pampa de los Guanacos', 86, -26.230182647705078, -61.836475372314453);
INSERT INTO public2.locations VALUES (3155, 'San JosÃ© del BoquerÃ³n', 86, -26.119211196899414, -63.704036712646484);
INSERT INTO public2.locations VALUES (3156, 'UrutaÃº', 86, -25.714277267456055, -63.0422477722168);
INSERT INTO public2.locations VALUES (3157, 'AncajÃ¡n', 86, -28.443893432617188, -64.929405212402344);
INSERT INTO public2.locations VALUES (3158, 'Choya', 86, -28.496103286743164, -64.856285095214844);
INSERT INTO public2.locations VALUES (3159, 'EstaciÃ³n La Punta', 86, -28.410299301147461, -64.755363464355469);
INSERT INTO public2.locations VALUES (3160, 'FrÃ­as', 86, -28.637544631958008, -65.128730773925781);
INSERT INTO public2.locations VALUES (3161, 'Laprida', 86, -28.375631332397461, -64.530548095703125);
INSERT INTO public2.locations VALUES (3162, 'San Pedro', 86, -28.468034744262695, -64.866973876953125);
INSERT INTO public2.locations VALUES (3163, 'Tapso', 86, -28.403755187988281, -65.09625244140625);
INSERT INTO public2.locations VALUES (3164, 'Villa La Punta', 86, -28.369726181030273, -64.794670104980469);
INSERT INTO public2.locations VALUES (3165, 'Bandera Bajada', 86, -27.273290634155273, -63.51318359375);
INSERT INTO public2.locations VALUES (3166, 'Caspi Corral', 86, -27.388416290283203, -63.546924591064453);
INSERT INTO public2.locations VALUES (3167, 'Colonia San Juan', 86, -27.617908477783203, -63.300575256347656);
INSERT INTO public2.locations VALUES (3168, 'El Crucero', 86, -27.574184417724609, -63.329036712646484);
INSERT INTO public2.locations VALUES (3169, 'La CaÃ±ada', 86, -27.709508895874023, -63.772552490234375);
INSERT INTO public2.locations VALUES (3170, 'La Invernada', 86, -27.382678985595703, -63.488155364990234);
INSERT INTO public2.locations VALUES (3171, 'Minerva', 86, -27.533035278320312, -63.383255004882812);
INSERT INTO public2.locations VALUES (3172, 'Vaca HuaÃ±una', 86, -27.463693618774414, -63.472419738769531);
INSERT INTO public2.locations VALUES (3173, 'Villa Figueroa', 86, -27.721227645874023, -63.506561279296875);
INSERT INTO public2.locations VALUES (3174, 'AÃ±atuya', 86, -28.460203170776367, -62.833541870117188);
INSERT INTO public2.locations VALUES (3175, 'AverÃ­as', 86, -28.747613906860352, -62.450702667236328);
INSERT INTO public2.locations VALUES (3176, 'EstaciÃ³n TacaÃ±itas', 86, -28.62653923034668, -62.606918334960938);
INSERT INTO public2.locations VALUES (3177, 'La Nena', 86, -28.452299118041992, -61.838314056396484);
INSERT INTO public2.locations VALUES (3178, 'Los JurÃ­es', 86, -28.462926864624023, -62.1102409362793);
INSERT INTO public2.locations VALUES (3179, 'TomÃ¡s Young', 86, -28.600540161132812, -62.182674407958984);
INSERT INTO public2.locations VALUES (3180, 'Lavalle', 86, -28.194511413574219, -65.107666015625);
INSERT INTO public2.locations VALUES (3181, 'San Pedro', 86, -27.955896377563477, -65.168495178222656);
INSERT INTO public2.locations VALUES (3182, 'El Arenal', 86, -26.770692825317383, -64.602874755859375);
INSERT INTO public2.locations VALUES (3183, 'El Bobadal', 86, -26.724040985107422, -64.3963623046875);
INSERT INTO public2.locations VALUES (3184, 'El Charco', 86, -27.225767135620117, -64.700302124023438);
INSERT INTO public2.locations VALUES (3185, 'El RincÃ³n', 86, -26.723644256591797, -64.445594787597656);
INSERT INTO public2.locations VALUES (3186, 'Gramilla', 86, -27.296630859375, -64.610282897949219);
INSERT INTO public2.locations VALUES (3187, 'Isca Yacu', 86, -27.028890609741211, -64.611526489257812);
INSERT INTO public2.locations VALUES (3188, 'Isca Yacu Semaul', 86, -27.046911239624023, -64.618392944335938);
INSERT INTO public2.locations VALUES (3189, 'Pozo Hondo', 86, -27.167064666748047, -64.490760803222656);
INSERT INTO public2.locations VALUES (3190, 'San Pedro', 86, -26.743619918823242, -64.391227722167969);
INSERT INTO public2.locations VALUES (3191, 'El Colorado', 86, -27.914533615112305, -62.1773567199707);
INSERT INTO public2.locations VALUES (3192, 'El Cuadrado', 86, -28.228376388549805, -61.802074432373047);
INSERT INTO public2.locations VALUES (3193, 'MatarÃ¡', 86, -28.110414505004883, -63.195072174072266);
INSERT INTO public2.locations VALUES (3194, 'Suncho Corral', 86, -27.932846069335938, -63.430152893066406);
INSERT INTO public2.locations VALUES (3195, 'Vilelas', 86, -27.961219787597656, -62.608936309814453);
INSERT INTO public2.locations VALUES (3196, 'YuchÃ¡n', 86, -27.780853271484375, -62.975265502929688);
INSERT INTO public2.locations VALUES (3197, 'Villa San MartÃ­n (Est. Loreto)', 86, -28.300987243652344, -64.18414306640625);
INSERT INTO public2.locations VALUES (3198, 'Villa UniÃ³n', 86, -29.413623809814453, -62.7904052734375);
INSERT INTO public2.locations VALUES (3199, 'Aerolito', 86, -27.234197616577148, -62.378765106201172);
INSERT INTO public2.locations VALUES (3200, 'Alhuampa', 86, -27.127546310424805, -62.547599792480469);
INSERT INTO public2.locations VALUES (3201, 'Hasse', 86, -27.06683349609375, -62.647247314453125);
INSERT INTO public2.locations VALUES (3202, 'HernÃ¡n MejÃ­a Miraval', 86, -27.177183151245117, -62.469650268554688);
INSERT INTO public2.locations VALUES (3203, 'Las Tinajas', 86, -27.465717315673828, -62.917964935302734);
INSERT INTO public2.locations VALUES (3204, 'Libertad', 86, -27.084892272949219, -63.070884704589844);
INSERT INTO public2.locations VALUES (3205, 'Lilo Viejo', 86, -26.938779830932617, -62.957267761230469);
INSERT INTO public2.locations VALUES (3206, 'Patay', 86, -26.840003967285156, -62.930519104003906);
INSERT INTO public2.locations VALUES (3207, 'Pueblo Pablo Torelo', 86, -27.327814102172852, -62.225193023681641);
INSERT INTO public2.locations VALUES (3208, 'Quimili', 86, -27.644685745239258, -62.4173698425293);
INSERT INTO public2.locations VALUES (3209, 'Roversi', 86, -27.592327117919922, -61.943729400634766);
INSERT INTO public2.locations VALUES (3210, 'Tintina', 86, -27.026288986206055, -62.706405639648438);
INSERT INTO public2.locations VALUES (3211, 'Weisburd', 86, -27.318901062011719, -62.585041046142578);
INSERT INTO public2.locations VALUES (3212, 'El 49', 86, -29.050580978393555, -63.957935333251953);
INSERT INTO public2.locations VALUES (3213, 'Sol de Julio', 86, -29.565328598022461, -63.457077026367188);
INSERT INTO public2.locations VALUES (3214, 'Villa Ojo de Agua', 86, -29.5028076171875, -63.694969177246094);
INSERT INTO public2.locations VALUES (3215, 'El MojÃ³n', 86, -26.092739105224609, -64.309150695800781);
INSERT INTO public2.locations VALUES (3216, 'Las Delicias', 86, -26.676914215087891, -64.005897521972656);
INSERT INTO public2.locations VALUES (3217, 'Nueva Esperanza', 86, -26.200185775756836, -64.240020751953125);
INSERT INTO public2.locations VALUES (3218, 'Pozo Betbeder', 86, -26.409809112548828, -64.3370590209961);
INSERT INTO public2.locations VALUES (3219, 'Rapelli', 86, -26.393318176269531, -64.505050659179688);
INSERT INTO public2.locations VALUES (3220, 'Santo Domin', 86, -26.216363906860352, -63.777496337890625);
INSERT INTO public2.locations VALUES (3221, 'RamÃ­rez de Velazco', 86, -29.230953216552734, -63.4742546081543);
INSERT INTO public2.locations VALUES (3222, 'Sumampa', 86, -29.382556915283203, -63.474838256835938);
INSERT INTO public2.locations VALUES (3223, 'Sumampa Viejo', 86, -29.385103225708008, -63.434291839599609);
INSERT INTO public2.locations VALUES (3224, 'Chauchillas', 86, -27.519359588623047, -64.559432983398438);
INSERT INTO public2.locations VALUES (3225, 'Colonia Tinco', 86, -27.4148006439209, -64.9407730102539);
INSERT INTO public2.locations VALUES (3226, 'El Charco', 86, -27.234888076782227, -64.697822570800781);
INSERT INTO public2.locations VALUES (3227, 'Gramilla', 86, -27.298582077026367, -64.613212585449219);
INSERT INTO public2.locations VALUES (3228, 'La Nueva Donosa', 86, -27.442178726196289, -64.94610595703125);
INSERT INTO public2.locations VALUES (3229, 'Los Miranda', 86, -27.468364715576172, -64.615188598632812);
INSERT INTO public2.locations VALUES (3230, 'Los NÃºÃ±ez', 86, -27.534221649169922, -64.5288314819336);
INSERT INTO public2.locations VALUES (3231, 'Mansupa', 86, -27.458402633666992, -64.907768249511719);
INSERT INTO public2.locations VALUES (3232, 'Pozuelos', 86, -27.305639266967773, -64.754936218261719);
INSERT INTO public2.locations VALUES (3233, 'Rodeo de Valdez', 86, -27.550193786621094, -64.512496948242188);
INSERT INTO public2.locations VALUES (3234, 'El Sauzal', 86, -27.488395690917969, -64.582023620605469);
INSERT INTO public2.locations VALUES (3235, 'Termas de RÃ­o Hondo', 86, -27.498634338378906, -64.860710144042969);
INSERT INTO public2.locations VALUES (3236, 'Villa GimÃ©nez', 86, -27.570993423461914, -64.477409362792969);
INSERT INTO public2.locations VALUES (3237, 'Villa RÃ­o Hondo', 86, -27.595621109008789, -64.8734359741211);
INSERT INTO public2.locations VALUES (3238, 'VinarÃ¡', 86, -27.378898620605469, -64.794601440429688);
INSERT INTO public2.locations VALUES (3239, 'Colonia Alpina', 86, -30.060096740722656, -62.1033935546875);
INSERT INTO public2.locations VALUES (3240, 'Palo Negro', 86, -29.675071716308594, -62.135623931884766);
INSERT INTO public2.locations VALUES (3241, 'Selva', 86, -29.768247604370117, -62.047531127929688);
INSERT INTO public2.locations VALUES (3242, 'BeltrÃ¡n', 86, -27.826833724975586, -64.058761596679688);
INSERT INTO public2.locations VALUES (3243, 'Colonia El Simbolar', 86, -27.727567672729492, -63.858760833740234);
INSERT INTO public2.locations VALUES (3244, 'FernÃ¡ndez', 86, -27.925315856933594, -63.894588470458984);
INSERT INTO public2.locations VALUES (3245, 'Ingeniero Forres', 86, -27.874567031860352, -63.977375030517578);
INSERT INTO public2.locations VALUES (3246, 'Vilmer', 86, -27.785425186157227, -64.1514892578125);
INSERT INTO public2.locations VALUES (3247, 'Chilca Juliana', 86, -28.797201156616211, -63.575344085693359);
INSERT INTO public2.locations VALUES (3248, 'Los Telares', 86, -28.985074996948242, -63.450401306152344);
INSERT INTO public2.locations VALUES (3249, 'Villa Salavina', 86, -28.804317474365234, -63.429649353027344);
INSERT INTO public2.locations VALUES (3250, 'Brea Pozo', 86, -28.243852615356445, -63.953338623046875);
INSERT INTO public2.locations VALUES (3251, 'EstaciÃ³n Robles', 86, -28.049079895019531, -63.991233825683594);
INSERT INTO public2.locations VALUES (3252, 'EstaciÃ³n Taboada', 86, -28.008451461791992, -63.744411468505859);
INSERT INTO public2.locations VALUES (3253, 'Villa Nueva', 86, -28.302444458007812, -64.020225524902344);
INSERT INTO public2.locations VALUES (3254, 'Garza', 86, -28.15294075012207, -63.538871765136719);
INSERT INTO public2.locations VALUES (3255, 'Ãrraga', 86, -28.051292419433594, -64.223793029785156);
INSERT INTO public2.locations VALUES (3256, 'Nueva Francia', 86, -28.173765182495117, -64.199981689453125);
INSERT INTO public2.locations VALUES (3257, 'Simbol', 86, -28.1010684967041, -64.213569641113281);
INSERT INTO public2.locations VALUES (3258, 'Sumamao', 86, -28.169399261474609, -64.098892211914062);
INSERT INTO public2.locations VALUES (3259, 'Villa SilÃ­pica', 86, -28.108463287353516, -64.14959716796875);
INSERT INTO public2.locations VALUES (3260, 'Barrio San Jorge', 90, -26.676851272583008, -65.045692443847656);
INSERT INTO public2.locations VALUES (3261, 'El ChaÃ±ar', 90, -26.757358551025391, -65.067962646484375);
INSERT INTO public2.locations VALUES (3262, 'El Naranjo', 90, -26.661741256713867, -65.0488052368164);
INSERT INTO public2.locations VALUES (3263, 'Garmendia', 90, -26.568538665771484, -64.557525634765625);
INSERT INTO public2.locations VALUES (3264, 'La Ramada', 90, -26.686557769775391, -64.9481430053711);
INSERT INTO public2.locations VALUES (3265, 'Macomitas', 90, -26.730461120605469, -65.010726928710938);
INSERT INTO public2.locations VALUES (3266, 'Piedrabuena', 90, -26.738348007202148, -64.648162841796875);
INSERT INTO public2.locations VALUES (3267, 'Villa BenjamÃ­n ArÃ¡oz', 90, -26.556060791015625, -64.797714233398438);
INSERT INTO public2.locations VALUES (3268, 'Villa BurruyacÃº', 90, -26.500473022460938, -64.7436752319336);
INSERT INTO public2.locations VALUES (3269, 'Villa Padre Monti', 90, -26.510534286499023, -64.994621276855469);
INSERT INTO public2.locations VALUES (3270, 'Alderetes', 90, -26.820226669311523, -65.143318176269531);
INSERT INTO public2.locations VALUES (3271, 'Banda del RÃ­o SalÃ­', 90, -26.839969635009766, -65.161857604980469);
INSERT INTO public2.locations VALUES (3272, 'Colombres', 90, -26.88542366027832, -65.0998306274414);
INSERT INTO public2.locations VALUES (3273, 'Colonia Mayo - Barrio La Milagrosa', 90, -26.83375358581543, -64.9881820678711);
INSERT INTO public2.locations VALUES (3274, 'DelfÃ­n Gallo', 90, -26.8442440032959, -65.093193054199219);
INSERT INTO public2.locations VALUES (3275, 'El Bracho', 90, -26.992168426513672, -65.1819076538086);
INSERT INTO public2.locations VALUES (3276, 'La Florida', 90, -26.820713043212891, -65.095382690429688);
INSERT INTO public2.locations VALUES (3277, 'Las Cejas', 90, -26.888408660888672, -64.741127014160156);
INSERT INTO public2.locations VALUES (3278, 'Los Ralos', 90, -26.889419555664062, -64.99700927734375);
INSERT INTO public2.locations VALUES (3279, 'PacarÃ¡', 90, -26.899242401123047, -65.149627685546875);
INSERT INTO public2.locations VALUES (3280, 'Ranchillos', 90, -26.95721435546875, -65.04449462890625);
INSERT INTO public2.locations VALUES (3281, 'San AndrÃ©s', 90, -26.8881778717041, -65.193550109863281);
INSERT INTO public2.locations VALUES (3282, 'Alpachiri', 90, -27.335790634155273, -65.7573471069336);
INSERT INTO public2.locations VALUES (3283, 'Alto Verde', 90, -27.377626419067383, -65.608123779296875);
INSERT INTO public2.locations VALUES (3284, 'Arcadia', 90, -27.305917739868164, -65.576850891113281);
INSERT INTO public2.locations VALUES (3285, 'ConcepciÃ³n', 90, -27.345920562744141, -65.5927505493164);
INSERT INTO public2.locations VALUES (3286, 'Iltico', 90, -27.335775375366211, -65.654434204101562);
INSERT INTO public2.locations VALUES (3287, 'La Trinidad', 90, -27.414285659790039, -65.516777038574219);
INSERT INTO public2.locations VALUES (3288, 'Medina', 90, -27.421897888183594, -65.532875061035156);
INSERT INTO public2.locations VALUES (3289, 'Campo de Herrera', 90, -27.026397705078125, -65.345626831054688);
INSERT INTO public2.locations VALUES (3290, 'FamaillÃ¡', 90, -27.054515838623047, -65.401893615722656);
INSERT INTO public2.locations VALUES (3291, 'Ingenio Fronterita', 90, -27.030927658081055, -65.460395812988281);
INSERT INTO public2.locations VALUES (3292, 'Graneros', 90, -27.649492263793945, -65.4394302368164);
INSERT INTO public2.locations VALUES (3293, 'Lamadrid', 90, -27.645065307617188, -65.2468490600586);
INSERT INTO public2.locations VALUES (3294, 'Taco Ralo', 90, -27.835067749023438, -65.1946029663086);
INSERT INTO public2.locations VALUES (3295, 'Juan Bautista Alberdi', 90, -27.585872650146484, -65.617294311523438);
INSERT INTO public2.locations VALUES (3296, 'Villa Belgrano', 90, -27.530929565429688, -65.615806579589844);
INSERT INTO public2.locations VALUES (3297, 'La Cocha', 90, -27.770009994506836, -65.58843994140625);
INSERT INTO public2.locations VALUES (3298, 'San JosÃ© de La Cocha', 90, -27.731220245361328, -65.583686828613281);
INSERT INTO public2.locations VALUES (3299, 'Bella Vista', 90, -27.032791137695312, -65.307090759277344);
INSERT INTO public2.locations VALUES (3300, 'EstaciÃ³n ArÃ¡oz', 90, -27.055149078369141, -64.921295166015625);
INSERT INTO public2.locations VALUES (3301, 'Los Puestos', 90, -27.281837463378906, -65.019439697265625);
INSERT INTO public2.locations VALUES (3302, 'Manuel GarcÃ­a FernÃ¡ndez', 90, -26.955703735351562, -65.2720718383789);
INSERT INTO public2.locations VALUES (3303, 'RÃ­o Colorado', 90, -27.148605346679688, -65.356948852539062);
INSERT INTO public2.locations VALUES (3304, 'Santa Rosa de Leales', 90, -27.137714385986328, -65.260871887207031);
INSERT INTO public2.locations VALUES (3305, 'Villa Fiad - Ingenio Leales', 90, -27.067747116088867, -65.2354507446289);
INSERT INTO public2.locations VALUES (3306, 'Villa de Leales', 90, -27.193830490112305, -65.31024169921875);
INSERT INTO public2.locations VALUES (3307, 'Barrio San Felipe', 90, -26.872104644775391, -65.232452392578125);
INSERT INTO public2.locations VALUES (3308, 'El Manantial', 90, -26.848052978515625, -65.2818603515625);
INSERT INTO public2.locations VALUES (3309, 'Ingenio San Pablo', 90, -26.869991302490234, -65.3108901977539);
INSERT INTO public2.locations VALUES (3310, 'La ReducciÃ³n', 90, -26.957603454589844, -65.350547790527344);
INSERT INTO public2.locations VALUES (3311, 'Lules', 90, -26.922183990478516, -65.337715148925781);
INSERT INTO public2.locations VALUES (3312, 'Acheral', 90, -27.120719909667969, -65.470565795898438);
INSERT INTO public2.locations VALUES (3313, 'CapitÃ¡n CÃ¡ceres', 90, -27.1900691986084, -65.604728698730469);
INSERT INTO public2.locations VALUES (3314, 'Monteros', 90, -27.165287017822266, -65.4972152709961);
INSERT INTO public2.locations VALUES (3315, 'Pueblo Independencia', 90, -27.219520568847656, -65.527328491210938);
INSERT INTO public2.locations VALUES (3316, 'RÃ­o Seco', 90, -27.268402099609375, -65.5573501586914);
INSERT INTO public2.locations VALUES (3317, 'Santa LucÃ­a', 90, -27.0927734375, -65.532516479492188);
INSERT INTO public2.locations VALUES (3318, 'Sargento Moya', 90, -27.2281551361084, -65.660018920898438);
INSERT INTO public2.locations VALUES (3319, 'Soldado Maldonado', 90, -27.14410400390625, -65.565437316894531);
INSERT INTO public2.locations VALUES (3320, 'Teniente Berdina', 90, -27.050336837768555, -65.487701416015625);
INSERT INTO public2.locations VALUES (3321, 'Villa Quinteros', 90, -27.252889633178711, -65.549201965332031);
INSERT INTO public2.locations VALUES (3322, 'Aguilares', 90, -27.43162727355957, -65.614540100097656);
INSERT INTO public2.locations VALUES (3323, 'Los Sarmientos', 90, -27.4147891998291, -65.693199157714844);
INSERT INTO public2.locations VALUES (3324, 'RÃ­o Chico', 90, -27.480045318603516, -65.625137329101562);
INSERT INTO public2.locations VALUES (3325, 'Santa Ana', 90, -27.473625183105469, -65.685386657714844);
INSERT INTO public2.locations VALUES (3326, 'Villa Clodomiro Hileret', 90, -27.474000930786133, -65.659149169921875);
INSERT INTO public2.locations VALUES (3327, 'San Miguel de TucumÃ¡n', 90, -26.830389022827148, -65.203781127929688);
INSERT INTO public2.locations VALUES (3328, 'Atahona', 90, -27.416868209838867, -65.28668212890625);
INSERT INTO public2.locations VALUES (3329, 'Monteagudo', 90, -27.510776519775391, -65.277328491210938);
INSERT INTO public2.locations VALUES (3330, 'Nueva Trinidad', 90, -27.48451042175293, -65.491249084472656);
INSERT INTO public2.locations VALUES (3331, 'Santa Cruz', 90, -27.389446258544922, -65.458076477050781);
INSERT INTO public2.locations VALUES (3332, 'Simoca', 90, -27.262903213500977, -65.357917785644531);
INSERT INTO public2.locations VALUES (3333, 'Villa Chicligasta', 90, -27.43408203125, -65.164237976074219);
INSERT INTO public2.locations VALUES (3334, 'Amaicha del Valle', 90, -26.593660354614258, -65.920082092285156);
INSERT INTO public2.locations VALUES (3335, 'Colalao del Valle', 90, -26.363107681274414, -65.957069396972656);
INSERT INTO public2.locations VALUES (3336, 'El Mollar', 90, -26.939796447753906, -65.709197998046875);
INSERT INTO public2.locations VALUES (3337, 'TafÃ­ del Valle', 90, -26.851943969726562, -65.710693359375);
INSERT INTO public2.locations VALUES (3338, 'Barrio Mutual San MartÃ­n', 90, -26.718015670776367, -65.225379943847656);
INSERT INTO public2.locations VALUES (3339, 'El Cadillal', 90, -26.631866455078125, -65.207107543945312);
INSERT INTO public2.locations VALUES (3340, 'TafÃ­ Viejo', 90, -26.729982376098633, -65.2628402709961);
INSERT INTO public2.locations VALUES (3341, 'Villa Mariano Moreno - El Colmenar', 90, -26.775827407836914, -65.209091186523438);
INSERT INTO public2.locations VALUES (3342, 'Choromoro', 90, -26.411273956298828, -65.319953918457031);
INSERT INTO public2.locations VALUES (3343, 'San Pedro de Colalao', 90, -26.234960556030273, -65.494766235351562);
INSERT INTO public2.locations VALUES (3344, 'Villa de Trancas', 90, -26.230907440185547, -65.283447265625);
INSERT INTO public2.locations VALUES (3345, 'Villa Carmela', 90, -26.767972946166992, -65.272407531738281);
INSERT INTO public2.locations VALUES (3346, 'Yerba Buena - Marcos Paz', 90, -26.816041946411133, -65.29254150390625);
INSERT INTO public2.locations VALUES (3347, 'RÃ­o Grande', 94, -53.786327362060547, -67.696327209472656);
INSERT INTO public2.locations VALUES (3348, 'Laguna Escondida', 94, -54.640781402587891, -67.762901306152344);
INSERT INTO public2.locations VALUES (3349, 'Ushuaia', 94, -54.807403564453125, -68.303756713867188);
INSERT INTO public2.locations VALUES (3350, 'Puerto Argentino', 94, -51.693679809570312, -57.860855102539062);
INSERT INTO public2.locations VALUES (3351, 'ConstituciÃ³n', 2, -34.626823425292969, -58.387187957763672);
INSERT INTO public2.locations VALUES (3352, 'Monserrat', 2, -34.613224029541016, -58.383056640625);
INSERT INTO public2.locations VALUES (3353, 'Puerto Madero', 2, -34.607818603515625, -58.3623046875);
INSERT INTO public2.locations VALUES (3354, 'Retiro', 2, -34.5946044921875, -58.375659942626953);
INSERT INTO public2.locations VALUES (3355, 'San NicolÃ¡s', 2, -34.6037712097168, -58.381595611572266);
INSERT INTO public2.locations VALUES (3356, 'San Telmo', 2, -34.620540618896484, -58.371711730957031);
INSERT INTO public2.locations VALUES (3357, 'Recoleta', 2, -34.588043212890625, -58.397182464599609);
INSERT INTO public2.locations VALUES (3358, 'Balvanera', 2, -34.608787536621094, -58.401782989501953);
INSERT INTO public2.locations VALUES (3359, 'San CristÃ³bal', 2, -34.623783111572266, -58.402122497558594);
INSERT INTO public2.locations VALUES (3360, 'Barracas', 2, -34.637523651123047, -58.374393463134766);
INSERT INTO public2.locations VALUES (3361, 'Boca', 2, -34.632125854492188, -58.360771179199219);
INSERT INTO public2.locations VALUES (3362, 'Nueva Pompeya', 2, -34.652057647705078, -58.416000366210938);
INSERT INTO public2.locations VALUES (3363, 'Parque Patricios', 2, -34.637283325195312, -58.4053955078125);
INSERT INTO public2.locations VALUES (3364, 'Almagro', 2, -34.605781555175781, -58.419101715087891);
INSERT INTO public2.locations VALUES (3365, 'Boedo', 2, -34.625579833984375, -58.416084289550781);
INSERT INTO public2.locations VALUES (3366, 'Caballito', 2, -34.616275787353516, -58.4405517578125);
INSERT INTO public2.locations VALUES (3367, 'Flores', 2, -34.628532409667969, -58.463687896728516);
INSERT INTO public2.locations VALUES (3368, 'Parque Chacabuco', 2, -34.635276794433594, -58.439029693603516);
INSERT INTO public2.locations VALUES (3369, 'Villa Lugano', 2, -34.675735473632812, -58.475112915039062);
INSERT INTO public2.locations VALUES (3370, 'Villa Riachuelo', 2, -34.693553924560547, -58.468936920166016);
INSERT INTO public2.locations VALUES (3371, 'Villa Soldati', 2, -34.663887023925781, -58.444538116455078);
INSERT INTO public2.locations VALUES (3372, 'Liniers', 2, -34.638710021972656, -58.521240234375);
INSERT INTO public2.locations VALUES (3373, 'Mataderos', 2, -34.660114288330078, -58.502933502197266);
INSERT INTO public2.locations VALUES (3374, 'Parque Avellaneda', 2, -34.647445678710938, -58.484027862548828);
INSERT INTO public2.locations VALUES (3375, 'Floresta', 2, -34.630043029785156, -58.482521057128906);
INSERT INTO public2.locations VALUES (3376, 'Monte Castro', 2, -34.6198616027832, -58.505977630615234);
INSERT INTO public2.locations VALUES (3377, 'VÃ©lez Sarsfield', 2, -34.631473541259766, -58.492374420166016);
INSERT INTO public2.locations VALUES (3378, 'Versalles', 2, -34.630027770996094, -58.523929595947266);
INSERT INTO public2.locations VALUES (3379, 'Villa Luro', 2, -34.6389274597168, -58.500778198242188);
INSERT INTO public2.locations VALUES (3380, 'Villa Real', 2, -34.620620727539062, -58.5268669128418);
INSERT INTO public2.locations VALUES (3381, 'Villa del Parque', 2, -34.605659484863281, -58.492584228515625);
INSERT INTO public2.locations VALUES (3382, 'Villa Devoto', 2, -34.599330902099609, -58.512222290039062);
INSERT INTO public2.locations VALUES (3383, 'Villa General Mitre', 2, -34.610477447509766, -58.467609405517578);
INSERT INTO public2.locations VALUES (3384, 'Villa Santa Rita', 2, -34.615409851074219, -58.483661651611328);
INSERT INTO public2.locations VALUES (3385, 'Coghlan', 2, -34.558925628662109, -58.4743766784668);
INSERT INTO public2.locations VALUES (3386, 'Saavedra', 2, -34.554897308349609, -58.486328125);
INSERT INTO public2.locations VALUES (3387, 'Villa PueyrredÃ³n', 2, -34.584526062011719, -58.501834869384766);
INSERT INTO public2.locations VALUES (3388, 'Villa Urquiza', 2, -34.572063446044922, -58.4892578125);
INSERT INTO public2.locations VALUES (3389, 'Belgrano', 2, -34.56207275390625, -58.4565544128418);
INSERT INTO public2.locations VALUES (3390, 'Colegiales', 2, -34.575824737548828, -58.4486198425293);
INSERT INTO public2.locations VALUES (3391, 'NuÃ±ez', 2, -34.548805236816406, -58.463230133056641);
INSERT INTO public2.locations VALUES (3392, 'Palermo', 2, -34.58123779296875, -58.421016693115234);
INSERT INTO public2.locations VALUES (3393, 'AgronomÃ­a', 2, -34.592308044433594, -58.489681243896484);
INSERT INTO public2.locations VALUES (3394, 'Chacarita', 2, -34.58526611328125, -58.453956604003906);
INSERT INTO public2.locations VALUES (3395, 'Parque Chas', 2, -34.582546234130859, -58.479228973388672);
INSERT INTO public2.locations VALUES (3396, 'Paternal', 2, -34.598873138427734, -58.466453552246094);
INSERT INTO public2.locations VALUES (3397, 'Villa Crespo', 2, -34.599876403808594, -58.438816070556641);
INSERT INTO public2.locations VALUES (3398, 'Villa OrtÃºzar', 2, -34.578670501708984, -58.469482421875);
INSERT INTO public2.locations VALUES (3399, 'AdroguÃ©', 6, -34.797370910644531, -58.388454437255859);
INSERT INTO public2.locations VALUES (3400, 'Burzaco', 6, -34.828170776367188, -58.391033172607422);
INSERT INTO public2.locations VALUES (3401, 'Claypole', 6, -34.797557830810547, -58.335205078125);
INSERT INTO public2.locations VALUES (3402, 'Don Orione', 6, -34.819290161132812, -58.341854095458984);
INSERT INTO public2.locations VALUES (3403, 'Glew', 6, -34.888336181640625, -58.382785797119141);
INSERT INTO public2.locations VALUES (3404, 'JosÃ© MÃ¡rmol', 6, -34.78631591796875, -58.369842529296875);
INSERT INTO public2.locations VALUES (3405, 'Longchamps', 6, -34.8607292175293, -58.389183044433594);
INSERT INTO public2.locations VALUES (3406, 'Malvinas Argentinas', 6, -34.818756103515625, -58.423389434814453);
INSERT INTO public2.locations VALUES (3407, 'Ministro Rivadavia', 6, -34.844020843505859, -58.362754821777344);
INSERT INTO public2.locations VALUES (3408, 'Rafael Calzada', 6, -34.797359466552734, -58.361671447753906);
INSERT INTO public2.locations VALUES (3409, 'San Francisco Solano', 6, -34.785652160644531, -58.3195686340332);
INSERT INTO public2.locations VALUES (3410, 'San JosÃ©', 6, -34.763633728027344, -58.343391418457031);
INSERT INTO public2.locations VALUES (3411, 'Ãrea Reserva CinturÃ³n EcolÃ³gico', 6, -34.6844596862793, -58.307735443115234);
INSERT INTO public2.locations VALUES (3412, 'Avellaneda', 6, -34.6638298034668, -58.362735748291016);
INSERT INTO public2.locations VALUES (3413, 'Crucesita', 6, -34.667991638183594, -58.357124328613281);
INSERT INTO public2.locations VALUES (3414, 'Dock Sud', 6, -34.6501350402832, -58.344902038574219);
INSERT INTO public2.locations VALUES (3415, 'Gerli', 6, -34.683773040771484, -58.374443054199219);
INSERT INTO public2.locations VALUES (3416, 'PiÃ±eyro', 6, -34.668083190917969, -58.387744903564453);
INSERT INTO public2.locations VALUES (3417, 'SarandÃ­', 6, -34.681797027587891, -58.346309661865234);
INSERT INTO public2.locations VALUES (3418, 'Villa DomÃ­nico', 6, -34.694576263427734, -58.3304557800293);
INSERT INTO public2.locations VALUES (3419, 'Wilde', 6, -34.704078674316406, -58.317211151123047);
INSERT INTO public2.locations VALUES (3420, 'BahÃ­a Blanca', 6, -38.722770690917969, -62.272743225097656);
INSERT INTO public2.locations VALUES (3421, 'GrÃ¼nbein', 6, -38.749271392822266, -62.190887451171875);
INSERT INTO public2.locations VALUES (3422, 'Ingeniero White', 6, -38.779491424560547, -62.265579223632812);
INSERT INTO public2.locations VALUES (3423, 'Villa Bordeau', 6, -38.693557739257812, -62.335018157958984);
INSERT INTO public2.locations VALUES (3424, 'Villa Espora', 6, -38.741416931152344, -62.1713752746582);
INSERT INTO public2.locations VALUES (3425, 'Berazategui', 6, -34.763015747070312, -58.2121696472168);
INSERT INTO public2.locations VALUES (3426, 'Berazategui Oeste', 6, -34.777004241943359, -58.238887786865234);
INSERT INTO public2.locations VALUES (3427, 'Carlos TomÃ¡s Sourigues', 6, -34.806251525878906, -58.215389251708984);
INSERT INTO public2.locations VALUES (3428, 'El Pato', 6, -34.884830474853516, -58.173851013183594);
INSERT INTO public2.locations VALUES (3429, 'Guillermo Enrique Hudson', 6, -34.791847229003906, -58.151618957519531);
INSERT INTO public2.locations VALUES (3430, 'Juan MarÃ­a GutiÃ©rrez', 6, -34.833908081054688, -58.183807373046875);
INSERT INTO public2.locations VALUES (3431, 'Pereyra', 6, -34.836177825927734, -58.094287872314453);
INSERT INTO public2.locations VALUES (3432, 'PlÃ¡tanos', 6, -34.781806945800781, -58.170185089111328);
INSERT INTO public2.locations VALUES (3433, 'Ranelagh', 6, -34.787788391113281, -58.20318603515625);
INSERT INTO public2.locations VALUES (3434, 'Villa EspaÃ±a', 6, -34.775470733642578, -58.199440002441406);
INSERT INTO public2.locations VALUES (3435, 'Barrio Banco Provincia', 6, -34.874294281005859, -57.8547248840332);
INSERT INTO public2.locations VALUES (3436, 'Barrio El Carmen Este', 6, -34.930282592773438, -57.885311126708984);
INSERT INTO public2.locations VALUES (3437, 'Barrio Universitario', 6, -34.902347564697266, -57.924827575683594);
INSERT INTO public2.locations VALUES (3438, 'Berisso', 6, -34.870292663574219, -57.883323669433594);
INSERT INTO public2.locations VALUES (3439, 'Los Talas', 6, -34.9110221862793, -57.784267425537109);
INSERT INTO public2.locations VALUES (3440, 'Villa ArgÃ¼ello', 6, -34.906932830810547, -57.916347503662109);
INSERT INTO public2.locations VALUES (3441, 'Villa Dolores', 6, -34.878730773925781, -57.867374420166016);
INSERT INTO public2.locations VALUES (3442, 'Villa Independencia', 6, -34.882167816162109, -57.8595085144043);
INSERT INTO public2.locations VALUES (3443, 'Villa Nueva', 6, -34.895271301269531, -57.907497406005859);
INSERT INTO public2.locations VALUES (3444, 'Villa PorteÃ±a', 6, -34.887153625488281, -57.898086547851562);
INSERT INTO public2.locations VALUES (3445, 'Villa Progreso', 6, -34.924053192138672, -57.899887084960938);
INSERT INTO public2.locations VALUES (3446, 'Villa San Carlos', 6, -34.876972198486328, -57.874397277832031);
INSERT INTO public2.locations VALUES (3447, 'Villa Zula', 6, -34.882976531982422, -57.8447151184082);
INSERT INTO public2.locations VALUES (3448, 'Punta Alta', 6, -38.878173828125, -62.0794792175293);
INSERT INTO public2.locations VALUES (3449, 'Villa del Mar', 6, -38.854389190673828, -62.116519927978516);
INSERT INTO public2.locations VALUES (3450, 'ChascomÃºs', 6, -35.5742073059082, -58.011280059814453);
INSERT INTO public2.locations VALUES (3451, 'Barrio San Cayetano', 6, -35.5353889465332, -58.013996124267578);
INSERT INTO public2.locations VALUES (3452, 'Dique NÂ° 1', 6, -34.8947868347168, -57.934268951416016);
INSERT INTO public2.locations VALUES (3453, 'Ensenada', 6, -34.862419128417969, -57.908943176269531);
INSERT INTO public2.locations VALUES (3454, 'Isla Santia', 6, -34.84552001953125, -57.894783020019531);
INSERT INTO public2.locations VALUES (3455, 'Punta Lara', 6, -34.809814453125, -57.983798980712891);
INSERT INTO public2.locations VALUES (3456, 'Villa Catela', 6, -34.887187957763672, -57.94842529296875);
INSERT INTO public2.locations VALUES (3457, 'BelÃ©n de Escobar', 6, -34.3454704284668, -58.792808532714844);
INSERT INTO public2.locations VALUES (3458, 'El Cazador', 6, -34.3115234375, -58.764347076416016);
INSERT INTO public2.locations VALUES (3459, 'GarÃ­n', 6, -34.42303466796875, -58.739459991455078);
INSERT INTO public2.locations VALUES (3460, 'Ingeniero Maschwitz', 6, -34.389236450195312, -58.737865447998047);
INSERT INTO public2.locations VALUES (3461, 'Loma Verde', 6, -34.3306999206543, -58.845806121826172);
INSERT INTO public2.locations VALUES (3462, 'Matheu', 6, -34.385246276855469, -58.827804565429688);
INSERT INTO public2.locations VALUES (3463, 'Maquinista F. Savio Este', 6, -34.400650024414062, -58.776290893554688);
INSERT INTO public2.locations VALUES (3464, 'Canning', 6, -34.857017517089844, -58.497905731201172);
INSERT INTO public2.locations VALUES (3465, 'El JagÃ¼el', 6, -34.830852508544922, -58.4948844909668);
INSERT INTO public2.locations VALUES (3466, 'Luis GuillÃ³n', 6, -34.802642822265625, -58.450675964355469);
INSERT INTO public2.locations VALUES (3467, 'Monte Grande', 6, -34.816356658935547, -58.468265533447266);
INSERT INTO public2.locations VALUES (3468, '9 de Abril', 6, -34.762786865234375, -58.487548828125);
INSERT INTO public2.locations VALUES (3469, 'El Remanso', 6, -34.3897705078125, -59.080780029296875);
INSERT INTO public2.locations VALUES (3470, 'Parada Robles', 6, -34.371891021728516, -59.124683380126953);
INSERT INTO public2.locations VALUES (3471, 'PavÃ³n', 6, -34.393180847167969, -59.034702301025391);
INSERT INTO public2.locations VALUES (3472, 'Aeropuerto Internacional Ezeiza', 6, -34.792503356933594, -58.524639129638672);
INSERT INTO public2.locations VALUES (3473, 'Canning', 6, -34.877395629882812, -58.507534027099609);
INSERT INTO public2.locations VALUES (3474, 'Carlos Spegazzini', 6, -34.911746978759766, -58.592166900634766);
INSERT INTO public2.locations VALUES (3475, 'JosÃ© MarÃ­a Ezeiza', 6, -34.852760314941406, -58.523200988769531);
INSERT INTO public2.locations VALUES (3476, 'La UniÃ³n', 6, -34.875564575195312, -58.5419807434082);
INSERT INTO public2.locations VALUES (3477, 'TristÃ¡n SuÃ¡rez', 6, -34.890960693359375, -58.566555023193359);
INSERT INTO public2.locations VALUES (3478, 'Bosques', 6, -34.816612243652344, -58.231315612792969);
INSERT INTO public2.locations VALUES (3479, 'Estanislao Severo Zeballos', 6, -34.814178466796875, -58.241218566894531);
INSERT INTO public2.locations VALUES (3480, 'San Juan Bautista', 6, -34.808986663818359, -58.276149749755859);
INSERT INTO public2.locations VALUES (3481, 'bernador Julio A. Costa', 6, -34.807548522949219, -58.303852081298828);
INSERT INTO public2.locations VALUES (3482, 'Ingeniero Juan Allan', 6, -34.866683959960938, -58.198558807373047);
INSERT INTO public2.locations VALUES (3483, 'Villa Brown', 6, -34.871295928955078, -58.275493621826172);
INSERT INTO public2.locations VALUES (3484, 'Villa San Luis', 6, -34.857376098632812, -58.273811340332031);
INSERT INTO public2.locations VALUES (3485, 'Villa Santa Rosa', 6, -34.837062835693359, -58.282180786132812);
INSERT INTO public2.locations VALUES (3486, 'Villa Vatteone', 6, -34.826972961425781, -58.271400451660156);
INSERT INTO public2.locations VALUES (3487, 'El TropezÃ³n', 6, -34.946525573730469, -58.26727294921875);
INSERT INTO public2.locations VALUES (3488, 'La Capilla', 6, -34.925693511962891, -58.264698028564453);
INSERT INTO public2.locations VALUES (3489, 'Barrio Kennedy', 6, -37.020286560058594, -57.103389739990234);
INSERT INTO public2.locations VALUES (3490, 'General Juan Madariaga', 6, -37.001956939697266, -57.135837554931641);
INSERT INTO public2.locations VALUES (3491, 'Camet', 6, -37.940139770507812, -57.549942016601562);
INSERT INTO public2.locations VALUES (3492, 'EstaciÃ³n Camet', 6, -37.888423919677734, -57.6069450378418);
INSERT INTO public2.locations VALUES (3493, 'Mar del Plata', 6, -38.006450653076172, -57.543838500976562);
INSERT INTO public2.locations VALUES (3494, 'Punta Motes', 6, -38.066951751708984, -57.551040649414062);
INSERT INTO public2.locations VALUES (3495, 'Barrio El Casal', 6, -37.831596374511719, -57.622112274169922);
INSERT INTO public2.locations VALUES (3496, 'Barrio Colinas Verdes', 6, -37.892524719238281, -57.82452392578125);
INSERT INTO public2.locations VALUES (3497, 'Barrio El Coyunco', 6, -37.910499572753906, -57.748809814453125);
INSERT INTO public2.locations VALUES (3498, 'Barrio La Gloria', 6, -37.933265686035156, -57.775558471679688);
INSERT INTO public2.locations VALUES (3499, 'Sierra de los Padres', 6, -37.947628021240234, -57.777866363525391);
INSERT INTO public2.locations VALUES (3500, 'Barrio Morabo', 6, -34.556686401367188, -58.938385009765625);
INSERT INTO public2.locations VALUES (3501, 'Barrio Ruta 24 KilÃ³metro 10', 6, -34.684307098388672, -58.958293914794922);
INSERT INTO public2.locations VALUES (3502, 'Country Club Bosque Real', 6, -34.589847564697266, -58.906005859375);
INSERT INTO public2.locations VALUES (3503, 'General RodrÃ­guez', 6, -34.608207702636719, -58.951080322265625);
INSERT INTO public2.locations VALUES (3504, 'Barrio Parque General San MartÃ­n', 6, -34.565635681152344, -58.586132049560547);
INSERT INTO public2.locations VALUES (3505, 'Billinghurst', 6, -34.5752067565918, -58.574737548828125);
INSERT INTO public2.locations VALUES (3506, 'Ciudad del Libertador General San MartÃ­n', 6, -34.579250335693359, -58.5391731262207);
INSERT INTO public2.locations VALUES (3507, 'Ciudad JardÃ­n El Libertador', 6, -34.541969299316406, -58.594841003417969);
INSERT INTO public2.locations VALUES (3508, 'Villa Ayacucho', 6, -34.589550018310547, -58.553394317626953);
INSERT INTO public2.locations VALUES (3509, 'Villa Ballester', 6, -34.5480842590332, -58.557083129882812);
INSERT INTO public2.locations VALUES (3510, 'Villa Bernardo Monteagudo', 6, -34.589534759521484, -58.540870666503906);
INSERT INTO public2.locations VALUES (3511, 'Villa Chacabuco', 6, -34.582015991210938, -58.527172088623047);
INSERT INTO public2.locations VALUES (3512, 'Villa Coronel JosÃ© M. Zapiola', 6, -34.558868408203125, -58.5766487121582);
INSERT INTO public2.locations VALUES (3513, 'Villa General Antonio J. de Sucre', 6, -34.545940399169922, -58.568710327148438);
INSERT INTO public2.locations VALUES (3514, 'Villa General Eugenio Necochea', 6, -34.512496948242188, -58.579833984375);
INSERT INTO public2.locations VALUES (3515, 'Villa General JosÃ© TomÃ¡s Guido', 6, -34.552658081054688, -58.567153930664062);
INSERT INTO public2.locations VALUES (3516, 'Villa General Juan G. Las Heras', 6, -34.560539245605469, -58.558540344238281);
INSERT INTO public2.locations VALUES (3517, 'Villa doy Cruz', 6, -34.542747497558594, -58.576522827148438);
INSERT INTO public2.locations VALUES (3518, 'Villa Granaderos de San MartÃ­n', 6, -34.551071166992188, -58.528865814208984);
INSERT INTO public2.locations VALUES (3519, 'Villa Greria Matorras', 6, -34.538066864013672, -58.549091339111328);
INSERT INTO public2.locations VALUES (3520, 'Villa JosÃ© LeÃ³n SuÃ¡rez', 6, -34.5309944152832, -58.576309204101562);
INSERT INTO public2.locations VALUES (3521, 'Villa Juan MartÃ­n de PueyrredÃ³n', 6, -34.572067260742188, -58.562335968017578);
INSERT INTO public2.locations VALUES (3522, 'Villa Libertad', 6, -34.584278106689453, -58.5626106262207);
INSERT INTO public2.locations VALUES (3523, 'Villa Lynch', 6, -34.592144012451172, -58.5240592956543);
INSERT INTO public2.locations VALUES (3524, 'Villa MaipÃº', 6, -34.568893432617188, -58.524440765380859);
INSERT INTO public2.locations VALUES (3525, 'Va.MarÃ­a Irene de los Remedios Escalada', 6, -34.564910888671875, -58.592620849609375);
INSERT INTO public2.locations VALUES (3526, 'Va.MarquÃ©s Alejandro MarÃ­a de Aguado', 6, -34.556362152099609, -58.538825988769531);
INSERT INTO public2.locations VALUES (3527, 'Villa Parque Presidente Figueroa Alcorta', 6, -34.594520568847656, -58.532527923583984);
INSERT INTO public2.locations VALUES (3528, 'Villa Parque San Lorenzo', 6, -34.563591003417969, -58.533176422119141);
INSERT INTO public2.locations VALUES (3529, 'Villa San AndrÃ©s', 6, -34.5650749206543, -58.5418701171875);
INSERT INTO public2.locations VALUES (3530, 'Villa YapeyÃº', 6, -34.571502685546875, -58.548625946044922);
INSERT INTO public2.locations VALUES (3531, 'Hurlingham', 6, -34.589839935302734, -58.637416839599609);
INSERT INTO public2.locations VALUES (3532, 'Villa Santos Tesei', 6, -34.619956970214844, -58.640163421630859);
INSERT INTO public2.locations VALUES (3533, 'William C. Morris', 6, -34.579696655273438, -58.657077789306641);
INSERT INTO public2.locations VALUES (3534, 'ItuzaingÃ³ Centro', 6, -34.650604248046875, -58.671722412109375);
INSERT INTO public2.locations VALUES (3535, 'ItuzaingÃ³ Sur', 6, -34.663764953613281, -58.665477752685547);
INSERT INTO public2.locations VALUES (3536, 'Villa bernador Udadondo', 6, -34.61834716796875, -58.696723937988281);
INSERT INTO public2.locations VALUES (3537, 'Del Viso', 6, -34.476081848144531, -58.799350738525391);
INSERT INTO public2.locations VALUES (3538, 'JosÃ© C. Paz', 6, -34.521747589111328, -58.755374908447266);
INSERT INTO public2.locations VALUES (3539, 'Tortuguitas', 6, -34.488216400146484, -58.778266906738281);
INSERT INTO public2.locations VALUES (3540, 'Aguas Verdes', 6, -36.636890411376953, -56.690059661865234);
INSERT INTO public2.locations VALUES (3541, 'Lucila del Mar', 6, -36.66015625, -56.682460784912109);
INSERT INTO public2.locations VALUES (3542, 'Mar de AjÃ³', 6, -36.729557037353516, -56.677295684814453);
INSERT INTO public2.locations VALUES (3543, 'Mar de AjÃ³ Norte', 6, -36.717113494873047, -56.677066802978516);
INSERT INTO public2.locations VALUES (3544, 'San Bernardo', 6, -36.686790466308594, -56.679061889648438);
INSERT INTO public2.locations VALUES (3545, 'Mar del TuyÃº', 6, -36.573875427246094, -56.690891265869141);
INSERT INTO public2.locations VALUES (3546, 'Santa Teresita', 6, -36.540592193603516, -56.692939758300781);
INSERT INTO public2.locations VALUES (3547, 'Aldo Bonzi', 6, -34.706985473632812, -58.519168853759766);
INSERT INTO public2.locations VALUES (3548, 'Ciudad Evita', 6, -34.715774536132812, -58.534946441650391);
INSERT INTO public2.locations VALUES (3549, 'nzÃ¡lez CatÃ¡n', 6, -34.773025512695312, -58.644039154052734);
INSERT INTO public2.locations VALUES (3550, 'Grerio de Laferrere', 6, -34.746994018554688, -58.589256286621094);
INSERT INTO public2.locations VALUES (3551, 'Isidro Casanova', 6, -34.710971832275391, -58.585807800292969);
INSERT INTO public2.locations VALUES (3552, 'La Tablada', 6, -34.68646240234375, -58.5256462097168);
INSERT INTO public2.locations VALUES (3553, 'Lomas del Mirador', 6, -34.665275573730469, -58.531772613525391);
INSERT INTO public2.locations VALUES (3554, 'Rafael Castillo', 6, -34.709098815917969, -58.625633239746094);
INSERT INTO public2.locations VALUES (3555, 'Ramos MejÃ­a', 6, -34.645500183105469, -58.559665679931641);
INSERT INTO public2.locations VALUES (3556, 'San Justo', 6, -34.6811408996582, -58.563739776611328);
INSERT INTO public2.locations VALUES (3557, 'Tapiales', 6, -34.699050903320312, -58.507858276367188);
INSERT INTO public2.locations VALUES (3558, '20 de Junio', 6, -34.776153564453125, -58.729568481445312);
INSERT INTO public2.locations VALUES (3559, 'Villa Eduardo Madero', 6, -34.688133239746094, -58.4931755065918);
INSERT INTO public2.locations VALUES (3560, 'Villa Luzuriaga', 6, -34.663532257080078, -58.582393646240234);
INSERT INTO public2.locations VALUES (3561, 'Virrey del Pino', 6, -34.837654113769531, -58.646968841552734);
INSERT INTO public2.locations VALUES (3562, 'Gerli', 6, -34.690834045410156, -58.381931304931641);
INSERT INTO public2.locations VALUES (3563, 'LanÃºs Este', 6, -34.714160919189453, -58.374305725097656);
INSERT INTO public2.locations VALUES (3564, 'LanÃºs Oeste', 6, -34.703769683837891, -58.400558471679688);
INSERT INTO public2.locations VALUES (3565, 'Monte Chinlo', 6, -34.729583740234375, -58.354221343994141);
INSERT INTO public2.locations VALUES (3566, 'Remedios de Escalada de San MartÃ­n', 6, -34.725910186767578, -58.396701812744141);
INSERT INTO public2.locations VALUES (3567, 'ValentÃ­n Alsina', 6, -34.671413421630859, -58.409049987792969);
INSERT INTO public2.locations VALUES (3568, 'Abasto', 6, -34.986759185791016, -58.090866088867188);
INSERT INTO public2.locations VALUES (3569, 'Ãngel Etcheverry', 6, -35.024482727050781, -58.0781364440918);
INSERT INTO public2.locations VALUES (3570, 'Arana', 6, -34.999603271484375, -57.892463684082031);
INSERT INTO public2.locations VALUES (3571, 'Arturo SeguÃ­', 6, -34.8913459777832, -58.131935119628906);
INSERT INTO public2.locations VALUES (3572, 'Barrio El Carmen Oeste', 6, -34.938930511474609, -57.877597808837891);
INSERT INTO public2.locations VALUES (3573, 'Barrio Gambier', 6, -34.936107635498047, -57.984931945800781);
INSERT INTO public2.locations VALUES (3574, 'Barrio Las Malvinas', 6, -34.934329986572266, -58.001724243164062);
INSERT INTO public2.locations VALUES (3575, 'Barrio Las Quintas', 6, -34.925117492675781, -58.016471862792969);
INSERT INTO public2.locations VALUES (3576, 'City Bell', 6, -34.867473602294922, -58.04742431640625);
INSERT INTO public2.locations VALUES (3577, 'El Retiro', 6, -34.948314666748047, -57.994880676269531);
INSERT INTO public2.locations VALUES (3578, 'JoaquÃ­n rina', 6, -34.905448913574219, -58.043636322021484);
INSERT INTO public2.locations VALUES (3579, 'JosÃ© HernÃ¡ndez', 6, -34.898860931396484, -58.010635375976562);
INSERT INTO public2.locations VALUES (3580, 'JosÃ© Melchor Romero', 6, -34.945674896240234, -58.036479949951172);
INSERT INTO public2.locations VALUES (3581, 'La Cumbre', 6, -34.923305511474609, -58.003379821777344);
INSERT INTO public2.locations VALUES (3582, 'La Plata', 6, -34.915496826171875, -57.9479866027832);
INSERT INTO public2.locations VALUES (3583, 'Lisandro Olmos', 6, -34.999057769775391, -58.048614501953125);
INSERT INTO public2.locations VALUES (3584, 'Los Hornos', 6, -34.959354400634766, -57.980735778808594);
INSERT INTO public2.locations VALUES (3585, 'Manuel B. nnet', 6, -34.881855010986328, -58.010322570800781);
INSERT INTO public2.locations VALUES (3586, 'Ringuelet', 6, -34.884803771972656, -57.991508483886719);
INSERT INTO public2.locations VALUES (3587, 'Rufino de Elizalde', 6, -34.961254119873047, -57.950382232666016);
INSERT INTO public2.locations VALUES (3588, 'Tolosa', 6, -34.891765594482422, -57.974174499511719);
INSERT INTO public2.locations VALUES (3589, 'Transradio', 6, -34.876670837402344, -58.083992004394531);
INSERT INTO public2.locations VALUES (3590, 'Villa Elisa', 6, -34.851467132568359, -58.085433959960938);
INSERT INTO public2.locations VALUES (3591, 'Villa Elvira', 6, -34.939445495605469, -57.920833587646484);
INSERT INTO public2.locations VALUES (3592, 'Villa Garibaldi', 6, -34.998966217041016, -57.858364105224609);
INSERT INTO public2.locations VALUES (3593, 'Villa Montoro', 6, -34.9614372253418, -57.900569915771484);
INSERT INTO public2.locations VALUES (3594, 'Villa Parque Sicardi', 6, -34.987491607666016, -57.8597526550293);
INSERT INTO public2.locations VALUES (3595, 'Banfield', 6, -34.744712829589844, -58.392925262451172);
INSERT INTO public2.locations VALUES (3596, 'Llavallol', 6, -34.793071746826172, -58.4262809753418);
INSERT INTO public2.locations VALUES (3597, 'Lomas de Zamora', 6, -34.759613037109375, -58.399467468261719);
INSERT INTO public2.locations VALUES (3598, 'Temperley', 6, -34.772602081298828, -58.389595031738281);
INSERT INTO public2.locations VALUES (3599, 'Turdera', 6, -34.790985107421875, -58.405193328857422);
INSERT INTO public2.locations VALUES (3600, 'Villa Centenario', 6, -34.727359771728516, -58.430587768554688);
INSERT INTO public2.locations VALUES (3601, 'Villa Fiorito', 6, -34.7056999206543, -58.444465637207031);
INSERT INTO public2.locations VALUES (3602, 'Barrio Las Casuarinas', 6, -34.562404632568359, -59.178260803222656);
INSERT INTO public2.locations VALUES (3603, 'Cortines', 6, -34.556552886962891, -59.203983306884766);
INSERT INTO public2.locations VALUES (3604, 'Lezica y Torrezuri', 6, -34.585483551025391, -59.058280944824219);
INSERT INTO public2.locations VALUES (3605, 'LujÃ¡n', 6, -34.566848754882812, -59.1145133972168);
INSERT INTO public2.locations VALUES (3606, 'Villa Flandria Norte', 6, -34.574913024902344, -59.179515838623047);
INSERT INTO public2.locations VALUES (3607, 'Villa Flandria Sur', 6, -34.598854064941406, -59.177291870117188);
INSERT INTO public2.locations VALUES (3608, 'Country Club Las Praderas', 6, -34.518222808837891, -59.092567443847656);
INSERT INTO public2.locations VALUES (3609, 'Open Door', 6, -34.491493225097656, -59.077507019042969);
INSERT INTO public2.locations VALUES (3610, 'Ãrea de PromociÃ³n El TriÃ¡ngulo', 6, -34.455833435058594, -58.708599090576172);
INSERT INTO public2.locations VALUES (3611, 'Grand Bourg', 6, -34.489013671875, -58.726387023925781);
INSERT INTO public2.locations VALUES (3612, 'Ingeniero Adolfo Sourdeaux', 6, -34.500473022460938, -58.662036895751953);
INSERT INTO public2.locations VALUES (3613, 'Ingeniero Pablo NoguÃ©s', 6, -34.489471435546875, -58.706092834472656);
INSERT INTO public2.locations VALUES (3614, 'Los Polvorines', 6, -34.502090454101562, -58.694995880126953);
INSERT INTO public2.locations VALUES (3615, 'Malvinas Argentinas', 6, -34.494743347167969, -58.699634552001953);
INSERT INTO public2.locations VALUES (3616, 'Tortuguitas', 6, -34.474517822265625, -58.75494384765625);
INSERT INTO public2.locations VALUES (3617, 'Villa de Mayo', 6, -34.506607055664062, -58.678974151611328);
INSERT INTO public2.locations VALUES (3618, 'La Baliza', 6, -37.771610260009766, -57.447311401367188);
INSERT INTO public2.locations VALUES (3619, 'La Caleta', 6, -37.782646179199219, -57.459854125976562);
INSERT INTO public2.locations VALUES (3620, 'Mar de Cobo', 6, -37.776290893554688, -57.451148986816406);
INSERT INTO public2.locations VALUES (3621, 'AtlÃ¡ntida', 6, -37.847705841064453, -57.513263702392578);
INSERT INTO public2.locations VALUES (3622, 'Camet Norte', 6, -37.824481964111328, -57.491847991943359);
INSERT INTO public2.locations VALUES (3623, 'Frente Mar', 6, -37.858848571777344, -57.513477325439453);
INSERT INTO public2.locations VALUES (3624, 'Playa Dorada', 6, -37.873489379882812, -57.519184112548828);
INSERT INTO public2.locations VALUES (3625, 'Santa Clara del Mar', 6, -37.837444305419922, -57.501998901367188);
INSERT INTO public2.locations VALUES (3626, 'Santa Elena', 6, -37.863616943359375, -57.51715087890625);
INSERT INTO public2.locations VALUES (3627, 'Barrio Lisandro de la Torre y Santa Marta', 6, -34.906291961669922, -58.706546783447266);
INSERT INTO public2.locations VALUES (3628, 'Marcos Paz', 6, -34.784317016601562, -58.8353385925293);
INSERT INTO public2.locations VALUES (3629, 'Libertad', 6, -34.698638916015625, -58.690231323242188);
INSERT INTO public2.locations VALUES (3630, 'Mariano Acosta', 6, -34.722919464111328, -58.795406341552734);
INSERT INTO public2.locations VALUES (3631, 'Merlo', 6, -34.666969299316406, -58.727951049804688);
INSERT INTO public2.locations VALUES (3632, 'Pontevedra', 6, -34.750259399414062, -58.701255798339844);
INSERT INTO public2.locations VALUES (3633, 'San Antonio de Padua', 6, -34.662666320800781, -58.698127746582031);
INSERT INTO public2.locations VALUES (3634, 'Cuartel V', 6, -34.548824310302734, -58.809879302978516);
INSERT INTO public2.locations VALUES (3635, 'Francisco Ãlvarez', 6, -34.6331901550293, -58.855464935302734);
INSERT INTO public2.locations VALUES (3636, 'La Reja', 6, -34.639011383056641, -58.826694488525391);
INSERT INTO public2.locations VALUES (3637, 'Moreno', 6, -34.646907806396484, -58.7889289855957);
INSERT INTO public2.locations VALUES (3638, 'Paso del Rey', 6, -34.653133392333984, -58.7612419128418);
INSERT INTO public2.locations VALUES (3639, 'Trujui', 6, -34.590736389160156, -58.7556266784668);
INSERT INTO public2.locations VALUES (3640, 'Castelar', 6, -34.651821136474609, -58.646045684814453);
INSERT INTO public2.locations VALUES (3641, 'El Palomar', 6, -34.610855102539062, -58.595680236816406);
INSERT INTO public2.locations VALUES (3642, 'Haedo', 6, -34.643608093261719, -58.594520568847656);
INSERT INTO public2.locations VALUES (3643, 'MorÃ³n', 6, -34.647457122802734, -58.621860504150391);
INSERT INTO public2.locations VALUES (3644, 'Villa Sarmiento', 6, -34.633358001708984, -58.570407867431641);
INSERT INTO public2.locations VALUES (3645, 'Necochea', 6, -38.571224212646484, -58.726242065429688);
INSERT INTO public2.locations VALUES (3646, 'QuequÃ©n', 6, -38.566112518310547, -58.706180572509766);
INSERT INTO public2.locations VALUES (3647, 'Costa Bonita', 6, -38.559974670410156, -58.628482818603516);
INSERT INTO public2.locations VALUES (3648, 'Colonia Hinojo', 6, -36.879909515380859, -60.177497863769531);
INSERT INTO public2.locations VALUES (3649, 'Hinojo', 6, -36.866542816162109, -60.161834716796875);
INSERT INTO public2.locations VALUES (3650, 'Sierras Bayas', 6, -36.932720184326172, -60.161384582519531);
INSERT INTO public2.locations VALUES (3651, 'Villa Arrieta', 6, -36.943809509277344, -60.158351898193359);
INSERT INTO public2.locations VALUES (3652, 'Del Viso', 6, -34.450214385986328, -58.798633575439453);
INSERT INTO public2.locations VALUES (3653, 'FÃ¡tima', 6, -34.427883148193359, -58.993667602539062);
INSERT INTO public2.locations VALUES (3654, 'La Lonja', 6, -34.448486328125, -58.846096038818359);
INSERT INTO public2.locations VALUES (3655, 'Los Cachorros', 6, -34.423049926757812, -58.792755126953125);
INSERT INTO public2.locations VALUES (3656, 'Manzanares', 6, -34.450382232666016, -59.007041931152344);
INSERT INTO public2.locations VALUES (3657, 'Manzone', 6, -34.508617401123047, -58.861354827880859);
INSERT INTO public2.locations VALUES (3658, 'Maquinista F. Savio Oeste', 6, -34.407386779785156, -58.780178070068359);
INSERT INTO public2.locations VALUES (3659, 'Pilar', 6, -34.456981658935547, -58.913909912109375);
INSERT INTO public2.locations VALUES (3660, 'Presidente Derqui', 6, -34.492267608642578, -58.839019775390625);
INSERT INTO public2.locations VALUES (3661, 'Roberto de Vicenzo', 6, -34.432380676269531, -58.772422790527344);
INSERT INTO public2.locations VALUES (3662, 'Santa Teresa', 6, -34.438514709472656, -58.753665924072266);
INSERT INTO public2.locations VALUES (3663, 'Tortuguitas', 6, -34.460773468017578, -58.763179779052734);
INSERT INTO public2.locations VALUES (3664, 'Villa Astolfi', 6, -34.488002777099609, -58.8758544921875);
INSERT INTO public2.locations VALUES (3665, 'Villa Rosa', 6, -34.415290832519531, -58.869548797607422);
INSERT INTO public2.locations VALUES (3666, 'Zelaya', 6, -34.371566772460938, -58.869449615478516);
INSERT INTO public2.locations VALUES (3667, 'CarilÃ³', 6, -37.165218353271484, -56.898818969726562);
INSERT INTO public2.locations VALUES (3668, 'Ostende', 6, -37.129680633544922, -56.871200561523438);
INSERT INTO public2.locations VALUES (3669, 'Pinamar', 6, -37.113822937011719, -56.858078002929688);
INSERT INTO public2.locations VALUES (3670, 'Valeria del Mar', 6, -37.145648956298828, -56.881973266601562);
INSERT INTO public2.locations VALUES (3671, 'Barrio AmÃ©rica Unida', 6, -34.883235931396484, -58.417778015136719);
INSERT INTO public2.locations VALUES (3672, 'Guernica', 6, -34.917987823486328, -58.382156372070312);
INSERT INTO public2.locations VALUES (3673, 'Bernal', 6, -34.710903167724609, -58.283393859863281);
INSERT INTO public2.locations VALUES (3674, 'Bernal Oeste', 6, -34.726295471191406, -58.317913055419922);
INSERT INTO public2.locations VALUES (3675, 'Don Bosco', 6, -34.704463958740234, -58.297584533691406);
INSERT INTO public2.locations VALUES (3676, 'Ezpeleta', 6, -34.745944976806641, -58.234794616699219);
INSERT INTO public2.locations VALUES (3677, 'Ezpeleta Oeste', 6, -34.7572135925293, -58.263957977294922);
INSERT INTO public2.locations VALUES (3678, 'Quilmes', 6, -34.720066070556641, -58.254348754882812);
INSERT INTO public2.locations VALUES (3679, 'Quilmes Oeste', 6, -34.746055603027344, -58.299125671386719);
INSERT INTO public2.locations VALUES (3680, 'San Francisco Solano', 6, -34.779762268066406, -58.311161041259766);
INSERT INTO public2.locations VALUES (3681, 'Villa La Florida', 6, -34.772270202636719, -58.292930603027344);
INSERT INTO public2.locations VALUES (3682, 'Barrio Las Margaritas', 6, -34.184726715087891, -60.6989860534668);
INSERT INTO public2.locations VALUES (3683, 'Rojas', 6, -34.2002067565918, -60.7294807434082);
INSERT INTO public2.locations VALUES (3684, 'Villa Parque Cecir', 6, -34.174945831298828, -60.694431304931641);
INSERT INTO public2.locations VALUES (3685, 'San Fernando', 6, -34.443660736083984, -58.558647155761719);
INSERT INTO public2.locations VALUES (3686, 'Victoria', 6, -34.453048706054688, -58.542190551757812);
INSERT INTO public2.locations VALUES (3687, 'Virreyes', 6, -34.453750610351562, -58.554340362548828);
INSERT INTO public2.locations VALUES (3688, 'Acasusso', 6, -34.478229522705078, -58.502681732177734);
INSERT INTO public2.locations VALUES (3689, 'BÃ©ccar', 6, -34.460197448730469, -58.5313606262207);
INSERT INTO public2.locations VALUES (3690, 'Boulogne Sur Mer', 6, -34.509479522705078, -58.566909790039062);
INSERT INTO public2.locations VALUES (3691, 'MartÃ­nez', 6, -34.489009857177734, -58.499382019042969);
INSERT INTO public2.locations VALUES (3692, 'San Isidro', 6, -34.469882965087891, -58.511295318603516);
INSERT INTO public2.locations VALUES (3693, 'Villa Adelina', 6, -34.518856048583984, -58.547355651855469);
INSERT INTO public2.locations VALUES (3694, 'Bella Vista', 6, -34.568271636962891, -58.682060241699219);
INSERT INTO public2.locations VALUES (3695, 'Campo de Mayo', 6, -34.555061340332031, -58.652214050292969);
INSERT INTO public2.locations VALUES (3696, 'MuÃ±iz', 6, -34.552494049072266, -58.704792022705078);
INSERT INTO public2.locations VALUES (3697, 'San Miguel', 6, -34.543132781982422, -58.709201812744141);
INSERT INTO public2.locations VALUES (3698, 'La Emilia', 6, -33.349040985107422, -60.315677642822266);
INSERT INTO public2.locations VALUES (3699, 'Villa Campi', 6, -33.360725402832031, -60.300048828125);
INSERT INTO public2.locations VALUES (3700, 'Villa Canto', 6, -33.369792938232422, -60.295272827148438);
INSERT INTO public2.locations VALUES (3701, 'Villa Riccio', 6, -33.364356994628906, -60.294708251953125);
INSERT INTO public2.locations VALUES (3702, 'Campos Salles', 6, -33.40167236328125, -60.237468719482422);
INSERT INTO public2.locations VALUES (3703, 'San NicolÃ¡s de los Arroyos', 6, -33.338405609130859, -60.22149658203125);
INSERT INTO public2.locations VALUES (3704, 'Alejandro Korn', 6, -34.981410980224609, -58.376728057861328);
INSERT INTO public2.locations VALUES (3705, 'San Vicente', 6, -35.025901794433594, -58.422405242919922);
INSERT INTO public2.locations VALUES (3706, 'Domselaar', 6, -35.073894500732422, -58.290458679199219);
INSERT INTO public2.locations VALUES (3707, 'BenavÃ­dez', 6, -34.411571502685547, -58.689926147460938);
INSERT INTO public2.locations VALUES (3708, 'Dique LujÃ¡n', 6, -34.361305236816406, -58.686561584472656);
INSERT INTO public2.locations VALUES (3709, 'Don Torcuato Este', 6, -34.487529754638672, -58.615577697753906);
INSERT INTO public2.locations VALUES (3710, 'Don Torcuato Oeste', 6, -34.501312255859375, -58.6266975402832);
INSERT INTO public2.locations VALUES (3711, 'El Talar', 6, -34.463581085205078, -58.661350250244141);
INSERT INTO public2.locations VALUES (3712, 'General Pacheco', 6, -34.454921722412109, -58.634147644042969);
INSERT INTO public2.locations VALUES (3713, 'Troncos del Talar', 6, -34.454811096191406, -58.61334228515625);
INSERT INTO public2.locations VALUES (3714, 'Ricardo Rojas', 6, -34.458454132080078, -58.68304443359375);
INSERT INTO public2.locations VALUES (3715, 'RincÃ³n de Milberg', 6, -34.41046142578125, -58.601997375488281);
INSERT INTO public2.locations VALUES (3716, 'Tigre', 6, -34.424812316894531, -58.575527191162109);
INSERT INTO public2.locations VALUES (3717, 'ClaromecÃ³', 6, -38.853958129882812, -60.072834014892578);
INSERT INTO public2.locations VALUES (3718, 'Dunamar', 6, -38.858558654785156, -60.086189270019531);
INSERT INTO public2.locations VALUES (3719, 'Caseros', 6, -34.607936859130859, -58.563938140869141);
INSERT INTO public2.locations VALUES (3720, 'Churruca', 6, -34.559089660644531, -58.621086120605469);
INSERT INTO public2.locations VALUES (3721, 'Ciudad JardÃ­n Lomas del Palomar', 6, -34.602058410644531, -58.591812133789062);
INSERT INTO public2.locations VALUES (3722, 'Ciudadela', 6, -34.637916564941406, -58.539344787597656);
INSERT INTO public2.locations VALUES (3723, 'El Libertador', 6, -34.555427551269531, -58.612812042236328);
INSERT INTO public2.locations VALUES (3724, 'JosÃ© Ingenieros', 6, -34.617168426513672, -58.535945892333984);
INSERT INTO public2.locations VALUES (3725, 'Loma Hermosa', 6, -34.568675994873047, -58.602142333984375);
INSERT INTO public2.locations VALUES (3726, 'MartÃ­n Coronado', 6, -34.583766937255859, -58.596702575683594);
INSERT INTO public2.locations VALUES (3727, '11 de Septiembre', 6, -34.565994262695312, -58.618595123291016);
INSERT INTO public2.locations VALUES (3728, 'Pablo PodestÃ¡', 6, -34.5849494934082, -58.611637115478516);
INSERT INTO public2.locations VALUES (3729, 'Remedios de Escalada', 6, -34.570972442626953, -58.619804382324219);
INSERT INTO public2.locations VALUES (3730, 'SÃ¡enz PeÃ±a', 6, -34.600147247314453, -58.527633666992188);
INSERT INTO public2.locations VALUES (3731, 'Santos Lugares', 6, -34.603008270263672, -58.540824890136719);
INSERT INTO public2.locations VALUES (3732, 'Villa Bosch', 6, -34.586814880371094, -58.573806762695312);
INSERT INTO public2.locations VALUES (3733, 'Villa Raffo', 6, -34.608402252197266, -58.530914306640625);
INSERT INTO public2.locations VALUES (3734, 'Carapachay', 6, -34.528205871582031, -58.534614562988281);
INSERT INTO public2.locations VALUES (3735, 'Florida', 6, -34.532009124755859, -58.492824554443359);
INSERT INTO public2.locations VALUES (3736, 'Florida Oeste', 6, -34.538505554199219, -58.515457153320312);
INSERT INTO public2.locations VALUES (3737, 'La Lucila', 6, -34.498695373535156, -58.488601684570312);
INSERT INTO public2.locations VALUES (3738, 'Munro', 6, -34.529804229736328, -58.525184631347656);
INSERT INTO public2.locations VALUES (3739, 'Olivos', 6, -34.509319305419922, -58.481395721435547);
INSERT INTO public2.locations VALUES (3740, 'Vicente LÃ³pez', 6, -34.525741577148438, -58.474151611328125);
INSERT INTO public2.locations VALUES (3741, 'Villa Adelina', 6, -34.526504516601562, -58.545467376708984);
INSERT INTO public2.locations VALUES (3742, 'Villa Martelli', 6, -34.551303863525391, -58.506626129150391);
INSERT INTO public2.locations VALUES (3743, 'Mar Azul', 6, -37.336811065673828, -57.029537200927734);
INSERT INTO public2.locations VALUES (3744, 'Mar de las Pampas', 6, -37.326564788818359, -57.022537231445312);
INSERT INTO public2.locations VALUES (3745, 'Barrio Saavedra', 6, -34.138027191162109, -59.005401611328125);
INSERT INTO public2.locations VALUES (3746, 'ZÃ¡rate', 6, -34.098915100097656, -59.0296630859375);
INSERT INTO public2.locations VALUES (3747, 'Buena Vista', 10, -27.505720138549805, -66.022880554199219);
INSERT INTO public2.locations VALUES (3748, 'El Alamito', 10, -27.49456787109375, -66.022445678710938);
INSERT INTO public2.locations VALUES (3749, 'Aconquija', 10, -27.468097686767578, -66.01031494140625);
INSERT INTO public2.locations VALUES (3750, 'Alto de las Juntas', 10, -27.427932739257812, -65.9950942993164);
INSERT INTO public2.locations VALUES (3751, 'El Lindero', 10, -27.453105926513672, -66.004501342773438);
INSERT INTO public2.locations VALUES (3752, 'La Mesada', 10, -27.444154739379883, -66.002212524414062);
INSERT INTO public2.locations VALUES (3753, 'Los Ãngeles Norte', 10, -28.459144592285156, -65.948822021484375);
INSERT INTO public2.locations VALUES (3754, 'Los Ãngeles Sur', 10, -28.48298454284668, -65.950614929199219);
INSERT INTO public2.locations VALUES (3755, 'El Hueco', 10, -28.42207145690918, -65.711761474609375);
INSERT INTO public2.locations VALUES (3756, 'La Carrera', 10, -28.356842041015625, -65.707313537597656);
INSERT INTO public2.locations VALUES (3757, 'La Falda de San Antonio', 10, -28.424993515014648, -65.696731567382812);
INSERT INTO public2.locations VALUES (3758, 'La Tercena', 10, -28.372188568115234, -65.704879760742188);
INSERT INTO public2.locations VALUES (3759, 'San Antonio', 10, -28.425756454467773, -65.708381652832031);
INSERT INTO public2.locations VALUES (3760, 'San JosÃ©', 10, -28.390405654907227, -65.701713562011719);
INSERT INTO public2.locations VALUES (3761, 'ChaÃ±ar Punco', 10, -26.724559783935547, -66.076095581054688);
INSERT INTO public2.locations VALUES (3762, 'Lampacito', 10, -26.71455192565918, -66.068290710449219);
INSERT INTO public2.locations VALUES (3763, 'Medanitos', 10, -26.750778198242188, -66.078720092773438);
INSERT INTO public2.locations VALUES (3764, 'Famatanca', 10, -26.770956039428711, -66.082275390625);
INSERT INTO public2.locations VALUES (3765, 'San JosÃ© Banda', 10, -26.797435760498047, -66.0851821899414);
INSERT INTO public2.locations VALUES (3766, 'El Cerrito', 10, -26.671915054321289, -66.060791015625);
INSERT INTO public2.locations VALUES (3767, 'Las Mojarras', 10, -26.693756103515625, -66.066215515136719);
INSERT INTO public2.locations VALUES (3768, 'Casa de Piedra', 10, -26.816619873046875, -66.079498291015625);
INSERT INTO public2.locations VALUES (3769, 'La Puntilla', 10, -26.824888229370117, -66.0850830078125);
INSERT INTO public2.locations VALUES (3770, 'Palo Seco', 10, -26.809274673461914, -66.074615478515625);
INSERT INTO public2.locations VALUES (3771, 'San JosÃ© Norte', 10, -26.788515090942383, -66.065925598144531);
INSERT INTO public2.locations VALUES (3772, 'San JosÃ© Villa', 10, -26.801328659057617, -66.0683364868164);
INSERT INTO public2.locations VALUES (3773, 'Copacabana', 10, -28.1754150390625, -67.488037109375);
INSERT INTO public2.locations VALUES (3774, 'La Puntilla', 10, -28.129331588745117, -67.499755859375);
INSERT INTO public2.locations VALUES (3775, 'FiambalÃ¡', 10, -27.689455032348633, -67.619148254394531);
INSERT INTO public2.locations VALUES (3776, 'La Ramadita', 10, -27.684459686279297, -67.619438171386719);
INSERT INTO public2.locations VALUES (3777, 'Pampa Blanca', 10, -27.65252685546875, -67.614761352539062);
INSERT INTO public2.locations VALUES (3778, 'El BaÃ±ado', 10, -28.460111618041992, -65.7120132446289);
INSERT INTO public2.locations VALUES (3779, 'Polcos', 10, -28.437240600585938, -65.720771789550781);
INSERT INTO public2.locations VALUES (3780, 'Pozo del Mistol', 10, -28.472116470336914, -65.7227554321289);
INSERT INTO public2.locations VALUES (3781, 'San Isidro', 10, -28.459667205810547, -65.72589111328125);
INSERT INTO public2.locations VALUES (3782, 'Santa Rosa', 10, -28.442560195922852, -65.7108383178711);
INSERT INTO public2.locations VALUES (3783, 'Sumalao', 10, -28.474964141845703, -65.737586975097656);
INSERT INTO public2.locations VALUES (3784, 'Villa Dolores', 10, -28.461166381835938, -65.732818603515625);
INSERT INTO public2.locations VALUES (3785, 'Los Molinos', 14, -31.856359481811523, -64.379554748535156);
INSERT INTO public2.locations VALUES (3786, 'Villa San Miguel', 14, -31.863428115844727, -64.375);
INSERT INTO public2.locations VALUES (3787, 'Santa MÃ³nica', 14, -32.068824768066406, -64.574310302734375);
INSERT INTO public2.locations VALUES (3788, 'Santa Rosa de Calamuchita', 14, -32.069908142089844, -64.539093017578125);
INSERT INTO public2.locations VALUES (3789, 'San Ignacio (Loteo VÃ©lez Crespo)', 14, -32.098949432373047, -64.537139892578125);
INSERT INTO public2.locations VALUES (3790, 'Villa Ciudad Parque Los Reartes', 14, -31.910371780395508, -64.5377426147461);
INSERT INTO public2.locations VALUES (3791, 'Va.Ciudad Pque.Los Reartes (1Â° SecciÃ³n)', 14, -31.914247512817383, -64.525909423828125);
INSERT INTO public2.locations VALUES (3792, 'Va.Ciudad Pque.Los Reartes (3Â° SecciÃ³n)', 14, -31.904933929443359, -64.561363220214844);
INSERT INTO public2.locations VALUES (3793, 'JardÃ­n Arenales', 14, -31.368585586547852, -64.0605239868164);
INSERT INTO public2.locations VALUES (3794, 'La Floresta', 14, -31.396846771240234, -64.059867858886719);
INSERT INTO public2.locations VALUES (3795, 'CÃ³rdoba', 14, -31.415046691894531, -64.179115295410156);
INSERT INTO public2.locations VALUES (3796, 'Dumesnil', 14, -31.336528778076172, -64.337165832519531);
INSERT INTO public2.locations VALUES (3797, 'La Calera', 14, -31.35035514831543, -64.337944030761719);
INSERT INTO public2.locations VALUES (3798, 'El Diquecito', 14, -31.351083755493164, -64.365318298339844);
INSERT INTO public2.locations VALUES (3799, 'El Pueblito', 14, -31.106199264526367, -64.292289733886719);
INSERT INTO public2.locations VALUES (3800, 'Salsipuedes', 14, -31.137880325317383, -64.292770385742188);
INSERT INTO public2.locations VALUES (3801, 'GuiÃ±azÃº Norte', 14, -31.3077335357666, -64.175445556640625);
INSERT INTO public2.locations VALUES (3802, 'Parque Norte', 14, -31.300498962402344, -64.176963806152344);
INSERT INTO public2.locations VALUES (3803, '1Â° de Asto', 14, -31.307806015014648, -64.178146362304688);
INSERT INTO public2.locations VALUES (3804, 'Allmirante Brown', 14, -31.3074893951416, -64.182731628417969);
INSERT INTO public2.locations VALUES (3805, 'Ciudad de los NiÃ±os', 14, -31.295749664306641, -64.177330017089844);
INSERT INTO public2.locations VALUES (3806, 'Villa Pastora', 14, -31.305816650390625, -64.179183959960938);
INSERT INTO public2.locations VALUES (3807, 'JuÃ¡rez Celman', 14, -31.258041381835938, -64.166244506835938);
INSERT INTO public2.locations VALUES (3808, 'Villa Los Llanos', 14, -31.276466369628906, -64.160903930664062);
INSERT INTO public2.locations VALUES (3809, 'Bialet MassÃ©', 14, -31.314348220825195, -64.461532592773438);
INSERT INTO public2.locations VALUES (3810, 'San Roque del La', 14, -31.323905944824219, -64.451972961425781);
INSERT INTO public2.locations VALUES (3811, 'Alto Resbaloso - El Barrial', 14, -31.960292816162109, -65.065811157226562);
INSERT INTO public2.locations VALUES (3812, 'El Pueblito', 14, -31.957809448242188, -65.0744400024414);
INSERT INTO public2.locations VALUES (3813, 'El Valle', 14, -31.945167541503906, -65.064491271972656);
INSERT INTO public2.locations VALUES (3814, 'Las Chacras', 14, -31.941965103149414, -65.0251235961914);
INSERT INTO public2.locations VALUES (3815, 'Villa de las Rosas', 14, -31.950363159179688, -65.053993225097656);
INSERT INTO public2.locations VALUES (3816, 'Barrio Gilbert', 14, -31.441671371459961, -64.318000793457031);
INSERT INTO public2.locations VALUES (3817, 'Tejas Tres', 14, -31.440219879150391, -64.314613342285156);
INSERT INTO public2.locations VALUES (3818, 'Las Quintas', 14, -31.537683486938477, -64.3034439086914);
INSERT INTO public2.locations VALUES (3819, 'Los Cedros', 14, -31.526485443115234, -64.281417846679688);
INSERT INTO public2.locations VALUES (3820, 'Barrio Villa del Parque', 14, -31.798131942749023, -64.516387939453125);
INSERT INTO public2.locations VALUES (3821, 'Villa Ciudad de AmÃ©rica', 14, -31.783243179321289, -64.530517578125);
INSERT INTO public2.locations VALUES (3822, 'Villa del Prado', 14, -31.618431091308594, -64.391273498535156);
INSERT INTO public2.locations VALUES (3823, 'La Donosa', 14, -31.621316909790039, -64.382049560546875);
INSERT INTO public2.locations VALUES (3824, 'Mi Valle', 14, -31.584489822387695, -64.356254577636719);
INSERT INTO public2.locations VALUES (3825, 'Villa Parque Santa Ana', 14, -31.592159271240234, -64.352432250976562);
INSERT INTO public2.locations VALUES (3826, 'Acceso Norte', 26, -45.783794403076172, -67.4960708618164);
INSERT INTO public2.locations VALUES (3827, 'Barrio Caleta CÃ³rdova', 26, -45.748798370361328, -67.378768920898438);
INSERT INTO public2.locations VALUES (3828, 'Caleta Olivares', 26, -45.7751579284668, -67.388847351074219);
INSERT INTO public2.locations VALUES (3829, 'Barrio Castelli', 26, -45.816390991210938, -67.4764175415039);
INSERT INTO public2.locations VALUES (3830, 'Barrio Ciudadela', 26, -45.796653747558594, -67.496879577636719);
INSERT INTO public2.locations VALUES (3831, 'Barrio Gasoducto', 26, -45.794235229492188, -67.50494384765625);
INSERT INTO public2.locations VALUES (3832, 'Barrio GÃ¼emes', 26, -45.822238922119141, -67.492073059082031);
INSERT INTO public2.locations VALUES (3833, 'Barrio Laprida', 26, -45.828392028808594, -67.542640686035156);
INSERT INTO public2.locations VALUES (3834, 'Barrio Manantial Rosales', 26, -45.818401336669922, -67.525680541992188);
INSERT INTO public2.locations VALUES (3835, 'Barrio Militar y Aeropuerto', 26, -45.791896820068359, -67.4708023071289);
INSERT INTO public2.locations VALUES (3836, 'Barrio PrÃ³spero Palazzo', 26, -45.795734405517578, -67.470573425292969);
INSERT INTO public2.locations VALUES (3837, 'Barrio Restinga AlÃ­', 26, -45.793155670166016, -67.407844543457031);
INSERT INTO public2.locations VALUES (3838, 'Barrio RodrÃ­guez PeÃ±a', 26, -45.810768127441406, -67.4746322631836);
INSERT INTO public2.locations VALUES (3839, 'Barrio Saavedra', 26, -45.841510772705078, -67.506423950195312);
INSERT INTO public2.locations VALUES (3840, 'Barrio Sarmiento', 26, -45.819370269775391, -67.50262451171875);
INSERT INTO public2.locations VALUES (3841, 'Barrio 25 de Mayo', 26, -45.826408386230469, -67.463241577148438);
INSERT INTO public2.locations VALUES (3842, 'Barrio Villa S.U.P.E.', 26, -45.83648681640625, -67.502456665039062);
INSERT INTO public2.locations VALUES (3843, 'Comodoro Rivadavia', 26, -45.862564086914062, -67.494003295898438);
INSERT INTO public2.locations VALUES (3844, 'KilÃ³metro 5 - Presidente OrtÃ­z', 26, -45.814216613769531, -67.456001281738281);
INSERT INTO public2.locations VALUES (3845, 'KilÃ³metro 8 - Don Bosco', 26, -45.789230346679688, -67.431236267089844);
INSERT INTO public2.locations VALUES (3846, 'KilÃ³metro 11 - Cuarteles', 26, -45.769428253173828, -67.435859680175781);
INSERT INTO public2.locations VALUES (3847, 'KilÃ³metro 3 - General Mosconi', 26, -45.839672088623047, -67.473892211914062);
INSERT INTO public2.locations VALUES (3848, 'El Brillante', 30, -32.179569244384766, -58.213321685791016);
INSERT INTO public2.locations VALUES (3849, 'El Colorado', 30, -32.181972503662109, -58.194683074951172);
INSERT INTO public2.locations VALUES (3850, 'San JosÃ©', 30, -32.20849609375, -58.218673706054688);
INSERT INTO public2.locations VALUES (3851, 'Benito LegerÃ©n', 30, -31.434638977050781, -58.071941375732422);
INSERT INTO public2.locations VALUES (3852, 'Villa Adela', 30, -31.398292541503906, -58.069770812988281);
INSERT INTO public2.locations VALUES (3853, 'Las Tejas', 30, -31.411161422729492, -58.079265594482422);
INSERT INTO public2.locations VALUES (3854, 'Concordia', 30, -31.397451400756836, -58.017204284667969);
INSERT INTO public2.locations VALUES (3855, 'Villa ZorraquÃ­n', 30, -31.321857452392578, -58.014484405517578);
INSERT INTO public2.locations VALUES (3856, 'Diamante', 30, -32.0671272277832, -60.642646789550781);
INSERT INTO public2.locations VALUES (3857, 'Strobel', 30, -32.053775787353516, -60.61248779296875);
INSERT INTO public2.locations VALUES (3858, 'EstaciÃ³n Puiggari', 30, -32.055828094482422, -60.4468879699707);
INSERT INTO public2.locations VALUES (3859, 'Villa Libertador San MartÃ­n', 30, -32.073928833007812, -60.461040496826172);
INSERT INTO public2.locations VALUES (3860, 'Cerrito', 30, -31.582389831542969, -60.073688507080078);
INSERT INTO public2.locations VALUES (3861, 'Pueblo Moreno', 30, -31.587003707885742, -60.060161590576172);
INSERT INTO public2.locations VALUES (3862, 'BartolomÃ© de las Casas', 34, -25.409061431884766, -59.571418762207031);
INSERT INTO public2.locations VALUES (3863, 'Comunidad Aborigen BartolomÃ© de las Casas', 34, -25.34868049621582, -59.612232208251953);
INSERT INTO public2.locations VALUES (3864, 'Aguas Calientes', 38, -24.58502197265625, -64.922760009765625);
INSERT INTO public2.locations VALUES (3865, 'Fleming', 38, -24.587469100952148, -64.923530578613281);
INSERT INTO public2.locations VALUES (3866, 'Pila Pardo', 38, -24.582462310791016, -64.920051574707031);
INSERT INTO public2.locations VALUES (3867, 'Los Nogales', 38, -24.116903305053711, -65.40338134765625);
INSERT INTO public2.locations VALUES (3868, 'San Pablo de Reyes', 38, -24.146854400634766, -65.3939437866211);
INSERT INTO public2.locations VALUES (3869, 'Yala', 38, -24.12236213684082, -65.401573181152344);
INSERT INTO public2.locations VALUES (3870, 'Libertador General San MartÃ­n', 38, -23.813232421875, -64.793197631835938);
INSERT INTO public2.locations VALUES (3871, 'Pueblo Ledesma', 38, -23.83460807800293, -64.7896499633789);
INSERT INTO public2.locations VALUES (3872, 'PalpalÃ¡', 38, -24.259944915771484, -65.2061767578125);
INSERT INTO public2.locations VALUES (3873, 'RÃ­o Blanco', 38, -24.22998046875, -65.234603881835938);
INSERT INTO public2.locations VALUES (3874, 'Colonia San JosÃ©', 38, -23.393796920776367, -65.34521484375);
INSERT INTO public2.locations VALUES (3875, 'Yacoraite', 38, -23.387805938720703, -65.344688415527344);
INSERT INTO public2.locations VALUES (3876, 'San JosÃ©', 38, -22.134603500366211, -65.468154907226562);
INSERT INTO public2.locations VALUES (3877, 'Yavi', 38, -22.1317195892334, -65.461341857910156);
INSERT INTO public2.locations VALUES (3878, 'Aimogasta', 46, -28.559831619262695, -66.8061752319336);
INSERT INTO public2.locations VALUES (3879, 'Machigasta', 46, -28.543537139892578, -66.791107177734375);
INSERT INTO public2.locations VALUES (3880, 'San Antonio', 46, -28.557857513427734, -66.7923355102539);
INSERT INTO public2.locations VALUES (3881, 'Guandacol', 46, -29.525222778320312, -68.559310913085938);
INSERT INTO public2.locations VALUES (3882, 'Santa Clara', 46, -29.561281204223633, -68.533050537109375);
INSERT INTO public2.locations VALUES (3883, 'Banda Florida', 46, -29.305841445922852, -68.2451400756836);
INSERT INTO public2.locations VALUES (3884, 'Villa UniÃ³n', 46, -29.316574096679688, -68.227401733398438);
INSERT INTO public2.locations VALUES (3885, 'AnguinÃ¡n', 46, -29.199073791503906, -67.462142944335938);
INSERT INTO public2.locations VALUES (3886, 'Chilecito', 46, -29.162385940551758, -67.499305725097656);
INSERT INTO public2.locations VALUES (3887, 'La Puntilla', 46, -29.159599304199219, -67.480598449707031);
INSERT INTO public2.locations VALUES (3888, 'Los Sarmientos', 46, -29.150930404663086, -67.482467651367188);
INSERT INTO public2.locations VALUES (3889, 'San Miguel', 46, -29.178241729736328, -67.474418640136719);
INSERT INTO public2.locations VALUES (3890, 'Alpasinche', 46, -28.321596145629883, -67.053909301757812);
INSERT INTO public2.locations VALUES (3891, 'Amuschina', 46, -28.583505630493164, -67.183273315429688);
INSERT INTO public2.locations VALUES (3892, 'Andolucas', 46, -28.50047492980957, -67.135147094726562);
INSERT INTO public2.locations VALUES (3893, 'Chaupihuasi', 46, -28.351533889770508, -67.072227478027344);
INSERT INTO public2.locations VALUES (3894, 'CuipÃ¡n', 46, -28.457340240478516, -67.12158203125);
INSERT INTO public2.locations VALUES (3895, 'Las Talas', 46, -28.441799163818359, -67.119232177734375);
INSERT INTO public2.locations VALUES (3896, 'Los Robles', 46, -28.4256649017334, -67.110565185546875);
INSERT INTO public2.locations VALUES (3897, 'Salicas', 46, -28.375938415527344, -67.070648193359375);
INSERT INTO public2.locations VALUES (3898, 'San Blas', 46, -28.408313751220703, -67.091934204101562);
INSERT INTO public2.locations VALUES (3899, 'Shaqui', 46, -28.480627059936523, -67.1284408569336);
INSERT INTO public2.locations VALUES (3900, 'Suriyaco', 46, -28.539968490600586, -67.156906127929688);
INSERT INTO public2.locations VALUES (3901, 'Tuyubil', 46, -28.5789737701416, -67.197395324707031);
INSERT INTO public2.locations VALUES (3902, '1ra SecciÃ³n', 50, -32.887622833251953, -68.841033935546875);
INSERT INTO public2.locations VALUES (3903, '2da SecciÃ³n', 50, -32.891624450683594, -68.840988159179688);
INSERT INTO public2.locations VALUES (3904, '3ra SecciÃ³n', 50, -32.8883056640625, -68.83209228515625);
INSERT INTO public2.locations VALUES (3905, '4ta SecciÃ³n', 50, -32.869472503662109, -68.838264465332031);
INSERT INTO public2.locations VALUES (3906, '5ta SecciÃ³n', 50, -32.887973785400391, -68.853813171386719);
INSERT INTO public2.locations VALUES (3907, '6ta SecciÃ³n', 50, -32.878890991210938, -68.853256225585938);
INSERT INTO public2.locations VALUES (3908, '7ma SecciÃ³n', 50, -32.877643585205078, -68.87091064453125);
INSERT INTO public2.locations VALUES (3909, '8va SecciÃ³n', 50, -32.867393493652344, -68.868637084960938);
INSERT INTO public2.locations VALUES (3910, '9na SecciÃ³n', 50, -32.884140014648438, -68.873451232910156);
INSERT INTO public2.locations VALUES (3911, '10ma SecciÃ³n', 50, -32.87078857421875, -68.891754150390625);
INSERT INTO public2.locations VALUES (3912, '11va SecciÃ³n', 50, -32.890434265136719, -68.911224365234375);
INSERT INTO public2.locations VALUES (3913, 'Ciudad de doy Cruz', 50, -32.929649353027344, -68.844932556152344);
INSERT INTO public2.locations VALUES (3914, 'bernador Benegas', 50, -32.943061828613281, -68.846633911132812);
INSERT INTO public2.locations VALUES (3915, 'Las Tortugas', 50, -32.945194244384766, -68.823104858398438);
INSERT INTO public2.locations VALUES (3916, 'Presidente Sarmiento', 50, -32.944297790527344, -68.866889953613281);
INSERT INTO public2.locations VALUES (3917, 'San Francisco del Monte', 50, -32.931735992431641, -68.8326644897461);
INSERT INTO public2.locations VALUES (3918, 'Bermejo', 50, -32.867313385009766, -68.779541015625);
INSERT INTO public2.locations VALUES (3919, 'Buena Nueva', 50, -32.897052764892578, -68.760467529296875);
INSERT INTO public2.locations VALUES (3920, 'Capilla del Rosario', 50, -32.906787872314453, -68.766799926757812);
INSERT INTO public2.locations VALUES (3921, 'Dorre', 50, -32.918910980224609, -68.833061218261719);
INSERT INTO public2.locations VALUES (3922, 'El Sauce', 50, -32.87286376953125, -68.753753662109375);
INSERT INTO public2.locations VALUES (3923, 'General Belgrano', 50, -32.884681701660156, -68.79302978515625);
INSERT INTO public2.locations VALUES (3924, 'JesÃºs Nazareno', 50, -32.923793792724609, -68.782310485839844);
INSERT INTO public2.locations VALUES (3925, 'Las CaÃ±as', 50, -32.911636352539062, -68.817375183105469);
INSERT INTO public2.locations VALUES (3926, 'Nueva Ciudad', 50, -32.893718719482422, -68.8089370727539);
INSERT INTO public2.locations VALUES (3927, 'Pedro Molina', 50, -32.879291534423828, -68.820709228515625);
INSERT INTO public2.locations VALUES (3928, 'Rodeo de la Cruz', 50, -32.921047210693359, -68.738899230957031);
INSERT INTO public2.locations VALUES (3929, 'San Francisco del Monte', 50, -32.922737121582031, -68.793296813964844);
INSERT INTO public2.locations VALUES (3930, 'San JosÃ©', 50, -32.8910026550293, -68.8233871459961);
INSERT INTO public2.locations VALUES (3931, 'Villa Nueva', 50, -32.897365570068359, -68.787101745605469);
INSERT INTO public2.locations VALUES (3932, 'Capdevila', 50, -32.8055305480957, -68.826889038085938);
INSERT INTO public2.locations VALUES (3933, 'Ciudad de Las Heras', 50, -32.850944519042969, -68.836013793945312);
INSERT INTO public2.locations VALUES (3934, 'El Algarrobal', 50, -32.836883544921875, -68.770759582519531);
INSERT INTO public2.locations VALUES (3935, 'El BorbollÃ³n', 50, -32.806560516357422, -68.766281127929688);
INSERT INTO public2.locations VALUES (3936, 'El Challao', 50, -32.854640960693359, -68.892982482910156);
INSERT INTO public2.locations VALUES (3937, 'El Plumerillo', 50, -32.848609924316406, -68.805458068847656);
INSERT INTO public2.locations VALUES (3938, 'El Resguardo', 50, -32.830337524414062, -68.820968627929688);
INSERT INTO public2.locations VALUES (3939, 'El Zapallar', 50, -32.862480163574219, -68.8056411743164);
INSERT INTO public2.locations VALUES (3940, 'La Cieneguita', 50, -32.855888366699219, -68.84417724609375);
INSERT INTO public2.locations VALUES (3941, 'PanquehuÃ¡', 50, -32.839515686035156, -68.83154296875);
INSERT INTO public2.locations VALUES (3942, 'Sierras de Encalada', 50, -32.993953704833984, -68.932731628417969);
INSERT INTO public2.locations VALUES (3943, 'Carrodilla', 50, -32.967422485351562, -68.851615905761719);
INSERT INTO public2.locations VALUES (3944, 'Chacras de Coria', 50, -32.969482421875, -68.871513366699219);
INSERT INTO public2.locations VALUES (3945, 'Ciudad LujÃ¡n de Cuyo', 50, -33.034549713134766, -68.88458251953125);
INSERT INTO public2.locations VALUES (3946, 'La Puntilla', 50, -32.962074279785156, -68.860969543457031);
INSERT INTO public2.locations VALUES (3947, 'Mayor Drummond', 50, -33.0194206237793, -68.875740051269531);
INSERT INTO public2.locations VALUES (3948, 'Vistalba', 50, -33.040824890136719, -68.925361633300781);
INSERT INTO public2.locations VALUES (3949, 'Ciudad de MaipÃº', 50, -32.981159210205078, -68.795173645019531);
INSERT INTO public2.locations VALUES (3950, 'Coquimbito', 50, -32.970928192138672, -68.756729125976562);
INSERT INTO public2.locations VALUES (3951, 'General GutiÃ©rrez', 50, -32.960407257080078, -68.787467956542969);
INSERT INTO public2.locations VALUES (3952, 'Luzuriaga', 50, -32.944583892822266, -68.806999206542969);
INSERT INTO public2.locations VALUES (3953, 'Cuadro Ortega', 50, -33.271663665771484, -68.428985595703125);
INSERT INTO public2.locations VALUES (3954, 'La Florida', 50, -33.267677307128906, -68.4546890258789);
INSERT INTO public2.locations VALUES (3955, 'Palmira', 50, -33.050502777099609, -68.5609130859375);
INSERT INTO public2.locations VALUES (3956, 'San MartÃ­n', 50, -33.0806884765625, -68.470451354980469);
INSERT INTO public2.locations VALUES (3957, 'Cuadro Nacional', 50, -34.617137908935547, -68.275375366210938);
INSERT INTO public2.locations VALUES (3958, 'San Rafael', 50, -34.617774963378906, -68.335647583007812);
INSERT INTO public2.locations VALUES (3959, 'Tupungato', 50, -33.369316101074219, -69.146591186523438);
INSERT INTO public2.locations VALUES (3960, 'Villa Bastias', 50, -33.350864410400391, -69.136978149414062);
INSERT INTO public2.locations VALUES (3961, 'Dos de Mayo NÃºcleo I', 54, -27.0221004486084, -54.68560791015625);
INSERT INTO public2.locations VALUES (3962, 'Dos de Mayo NÃºcleo II', 54, -27.031862258911133, -54.664913177490234);
INSERT INTO public2.locations VALUES (3963, 'Covunco Centro', 58, -38.751125335693359, -70.026046752929688);
INSERT INTO public2.locations VALUES (3964, 'Mariano Moreno', 58, -38.76361083984375, -70.0374526977539);
INSERT INTO public2.locations VALUES (3965, 'San Carlos de Bariloche', 62, -41.135807037353516, -71.304336547851562);
INSERT INTO public2.locations VALUES (3966, 'Villa Campanario', 62, -41.060688018798828, -71.493888854980469);
INSERT INTO public2.locations VALUES (3967, 'Villa Llao Llao', 62, -41.04644775390625, -71.514717102050781);
INSERT INTO public2.locations VALUES (3968, 'Barrio Presidente PerÃ³n', 62, -38.800846099853516, -68.073661804199219);
INSERT INTO public2.locations VALUES (3969, 'Cinco Saltos', 62, -38.82489013671875, -68.061767578125);
INSERT INTO public2.locations VALUES (3970, 'Barrio La Lor', 62, -38.935138702392578, -68.028251647949219);
INSERT INTO public2.locations VALUES (3971, 'Cipolletti', 62, -38.934764862060547, -68.001785278320312);
INSERT INTO public2.locations VALUES (3972, 'Barrio Pino Azul', 62, -39.059085845947266, -67.5848159790039);
INSERT INTO public2.locations VALUES (3973, 'General Roca', 62, -39.031513214111328, -67.577987670898438);
INSERT INTO public2.locations VALUES (3974, 'Country Club El Tipal', 66, -24.75645637512207, -65.475845336914062);
INSERT INTO public2.locations VALUES (3975, 'Country Club La Almudena', 66, -24.761663436889648, -65.4665756225586);
INSERT INTO public2.locations VALUES (3976, 'Salta', 66, -24.783199310302734, -65.410247802734375);
INSERT INTO public2.locations VALUES (3977, 'EmbarcaciÃ³n', 66, -23.207761764526367, -64.094940185546875);
INSERT INTO public2.locations VALUES (3978, 'MisiÃ³n Tierras Fiscales', 66, -23.226015090942383, -64.091964721679688);
INSERT INTO public2.locations VALUES (3979, 'General Mosconi', 66, -22.599550247192383, -63.811328887939453);
INSERT INTO public2.locations VALUES (3980, 'Recaredo', 66, -22.577056884765625, -63.806316375732422);
INSERT INTO public2.locations VALUES (3981, 'Colonia Santa Rosa', 66, -23.391887664794922, -64.4247055053711);
INSERT INTO public2.locations VALUES (3982, 'La MisiÃ³n', 66, -23.373311996459961, -64.429824829101562);
INSERT INTO public2.locations VALUES (3983, 'Villa El Salvador', 70, -31.455282211303711, -68.4046401977539);
INSERT INTO public2.locations VALUES (3984, 'Villa Sefair', 70, -31.442461013793945, -68.443962097167969);
INSERT INTO public2.locations VALUES (3985, 'Las Talas', 70, -31.597007751464844, -68.27392578125);
INSERT INTO public2.locations VALUES (3986, 'Los MÃ©danos', 70, -31.604232788085938, -68.2696304321289);
INSERT INTO public2.locations VALUES (3987, 'La Falda', 70, -30.181482315063477, -68.679801940917969);
INSERT INTO public2.locations VALUES (3988, 'Pampa Vieja', 70, -30.215185165405273, -68.68798828125);
INSERT INTO public2.locations VALUES (3989, 'La Rinconada', 70, -31.690464019775391, -68.586631774902344);
INSERT INTO public2.locations VALUES (3990, 'Villa Aberastain', 70, -31.653829574584961, -68.575996398925781);
INSERT INTO public2.locations VALUES (3991, 'Villa Barboza', 70, -31.592897415161133, -68.55712890625);
INSERT INTO public2.locations VALUES (3992, 'Villa Nacusi', 70, -31.595508575439453, -68.535636901855469);
INSERT INTO public2.locations VALUES (3993, 'El Medanito', 70, -31.583061218261719, -68.504722595214844);
INSERT INTO public2.locations VALUES (3994, 'Rawson', 70, -31.569169998168945, -68.541748046875);
INSERT INTO public2.locations VALUES (3995, 'Colonia GutiÃ©rrez', 70, -31.527286529541016, -68.472221374511719);
INSERT INTO public2.locations VALUES (3996, 'Santa LucÃ­a', 70, -31.53126335144043, -68.499832153320312);
INSERT INTO public2.locations VALUES (3997, 'La Chimbera', 70, -31.829011917114258, -68.246833801269531);
INSERT INTO public2.locations VALUES (3998, 'Villa Borjas', 70, -31.81407356262207, -68.328788757324219);
INSERT INTO public2.locations VALUES (3999, 'Villa Basilio Nievas', 70, -31.548463821411133, -68.7293701171875);
INSERT INTO public2.locations VALUES (4000, 'Villa TacÃº', 70, -31.52617073059082, -68.705245971679688);
INSERT INTO public2.locations VALUES (4001, 'La Ribera', 74, -33.691928863525391, -65.502250671386719);
INSERT INTO public2.locations VALUES (4002, 'Villa Mercedes', 74, -33.680366516113281, -65.4697494506836);
INSERT INTO public2.locations VALUES (4003, 'Country Club Los Caldenes', 74, -33.70733642578125, -65.383506774902344);
INSERT INTO public2.locations VALUES (4004, '5ta Brigada', 74, -33.722015380859375, -65.380706787109375);
INSERT INTO public2.locations VALUES (4005, 'Cerro Colorado', 74, -33.25140380859375, -66.227363586425781);
INSERT INTO public2.locations VALUES (4006, 'Cruz de Piedra', 74, -33.266048431396484, -66.215782165527344);
INSERT INTO public2.locations VALUES (4007, 'El Chorrillo', 74, -33.290447235107422, -66.265533447265625);
INSERT INTO public2.locations VALUES (4008, 'Las Chacras', 74, -33.267162322998047, -66.2362289428711);
INSERT INTO public2.locations VALUES (4009, 'San Roque', 74, -33.269401550292969, -66.226654052734375);
INSERT INTO public2.locations VALUES (4010, 'EstaciÃ³n Presidente Roca', 82, -31.232128143310547, -61.610279083251953);
INSERT INTO public2.locations VALUES (4011, 'Presidente Roca', 82, -31.214214324951172, -61.612911224365234);
INSERT INTO public2.locations VALUES (4012, 'Arroyo Leyes', 82, -31.560445785522461, -60.519180297851562);
INSERT INTO public2.locations VALUES (4013, 'RincÃ³n Norte', 82, -31.571836471557617, -60.531089782714844);
INSERT INTO public2.locations VALUES (4014, 'Sauce Viejo', 82, -31.766036987304688, -60.830558776855469);
INSERT INTO public2.locations VALUES (4015, 'Villa Adelina', 82, -31.721029281616211, -60.801589965820312);
INSERT INTO public2.locations VALUES (4016, 'Alderetes', 90, -26.817873001098633, -65.142021179199219);
INSERT INTO public2.locations VALUES (4017, 'El Corte', 90, -26.829984664916992, -65.156440734863281);
INSERT INTO public2.locations VALUES (4018, 'Los GutiÃ©rrez', 90, -26.80644416809082, -65.141448974609375);
INSERT INTO public2.locations VALUES (4019, 'Banda del RÃ­o SalÃ­', 90, -26.835355758666992, -65.163970947265625);
INSERT INTO public2.locations VALUES (4020, 'Barrio Aeropuerto', 90, -26.849912643432617, -65.129043579101562);
INSERT INTO public2.locations VALUES (4021, 'Lastenia', 90, -26.859701156616211, -65.158889770507812);
INSERT INTO public2.locations VALUES (4022, 'El ParaÃ­so', 90, -26.836814880371094, -65.095306396484375);
INSERT INTO public2.locations VALUES (4023, 'Ex Ingenio Esperanza', 90, -26.845022201538086, -65.089096069335938);
INSERT INTO public2.locations VALUES (4024, 'Ex Ingenio LujÃ¡n', 90, -26.853584289550781, -65.092323303222656);
INSERT INTO public2.locations VALUES (4025, 'Ingenio La Florida', 90, -26.81608772277832, -65.0816879272461);
INSERT INTO public2.locations VALUES (4026, 'La Florida', 90, -26.818883895874023, -65.093612670898438);
INSERT INTO public2.locations VALUES (4027, 'Ex Ingenio Los Ralos', 90, -26.888679504394531, -64.995529174804688);
INSERT INTO public2.locations VALUES (4028, 'Villa Recaste', 90, -26.886920928955078, -65.006904602050781);
INSERT INTO public2.locations VALUES (4029, 'Villa Tercera', 90, -26.891696929931641, -65.0125503540039);
INSERT INTO public2.locations VALUES (4030, 'Ex Ingenio Nueva Baviera', 90, -27.070564270019531, -65.399673461914062);
INSERT INTO public2.locations VALUES (4031, 'FamaillÃ¡', 90, -27.057647705078125, -65.4030532836914);
INSERT INTO public2.locations VALUES (4032, 'Barrio Araujo', 90, -26.842002868652344, -65.272247314453125);
INSERT INTO public2.locations VALUES (4033, 'El Manantial', 90, -26.846214294433594, -65.279342651367188);
INSERT INTO public2.locations VALUES (4034, 'Aguilares', 90, -27.435083389282227, -65.614982604980469);
INSERT INTO public2.locations VALUES (4035, 'Ingenio Santa BÃ¡rbara', 90, -27.456188201904297, -65.603713989257812);
INSERT INTO public2.locations VALUES (4036, 'Ex Ingenio San JosÃ©', 90, -26.8026065826416, -65.267929077148438);
INSERT INTO public2.locations VALUES (4037, 'Yerba Buena - Marcos Paz', 90, -26.810819625854492, -65.283432006835938);


--
-- TOC entry 4856 (class 0 OID 24775)
-- Dependencies: 227
-- Data for Name: provinces; Type: TABLE DATA; Schema: public2; Owner: postgres
--

INSERT INTO public2.provinces VALUES (6, 'Buenos Aires', 'Provincia de Buenos Aires', -36.677391052246094, -60.558475494384766, 20);
INSERT INTO public2.provinces VALUES (10, 'Catamarca', 'Provincia de Catamarca', -27.335954666137695, -66.9478988647461, 30);
INSERT INTO public2.provinces VALUES (22, 'Chaco', 'Provincia del Chaco', -26.386987686157227, -60.765117645263672, 40);
INSERT INTO public2.provinces VALUES (26, 'Chubut', 'Provincia del Chubut', -43.788627624511719, -68.5267333984375, 50);
INSERT INTO public2.provinces VALUES (2, 'Ciudad AutÃ³noma de Buenos Aires', 'Ciudad AutÃ³noma de Buenos Aires', -34.61444091796875, -58.445877075195312, 10);
INSERT INTO public2.provinces VALUES (14, 'CÃ³rdoba', 'Provincia de CÃ³rdoba', -32.144798278808594, -63.801975250244141, 60);
INSERT INTO public2.provinces VALUES (18, 'Corrientes', 'Provincia de Corrientes', -28.774204254150391, -57.801082611083984, 70);
INSERT INTO public2.provinces VALUES (30, 'Entre RÃ­os', 'Provincia de Entre RÃ­os', -32.058929443359375, -59.201263427734375, 80);
INSERT INTO public2.provinces VALUES (34, 'Formosa', 'Provincia de Formosa', -24.895086288452148, -59.93218994140625, 90);
INSERT INTO public2.provinces VALUES (38, 'Jujuy', 'Provincia de Jujuy', -23.319974899291992, -65.7644271850586, 100);
INSERT INTO public2.provinces VALUES (42, 'La Pampa', 'Provincia de La Pampa', -37.135066986083984, -65.447647094726562, 110);
INSERT INTO public2.provinces VALUES (46, 'La Rioja', 'Provincia de La Rioja', -29.6849365234375, -67.181755065917969, 120);
INSERT INTO public2.provinces VALUES (50, 'Mendoza', 'Provincia de Mendoza', -34.630390167236328, -68.58294677734375, 130);
INSERT INTO public2.provinces VALUES (54, 'Misiones', 'Provincia de Misiones', -26.875303268432617, -54.651569366455078, 140);
INSERT INTO public2.provinces VALUES (58, 'NeuquÃ©n', 'Provincia del NeuquÃ©n', -38.641983032226562, -70.1198959350586, 150);
INSERT INTO public2.provinces VALUES (62, 'RÃ­o Negro', 'Provincia de RÃ­o Negro', -40.405078887939453, -67.22967529296875, 160);
INSERT INTO public2.provinces VALUES (66, 'Salta', 'Provincia de Salta', -24.299283981323242, -64.814155578613281, 170);
INSERT INTO public2.provinces VALUES (70, 'San Juan', 'Provincia de San Juan', -30.86566162109375, -68.8881607055664, 180);
INSERT INTO public2.provinces VALUES (74, 'San Luis', 'Provincia de San Luis', -33.761104583740234, -66.025230407714844, 190);
INSERT INTO public2.provinces VALUES (78, 'Santa Cruz', 'Provincia de Santa Cruz', -48.815547943115234, -69.955764770507812, 200);
INSERT INTO public2.provinces VALUES (82, 'Santa Fe', 'Provincia de Santa Fe', -30.708822250366211, -60.950687408447266, 210);
INSERT INTO public2.provinces VALUES (86, 'Santiago del Estero', 'Provincia de Santiago del Estero', -27.783432006835938, -63.252628326416016, 220);
INSERT INTO public2.provinces VALUES (94, 'Tierra del Fuego, AntÃ¡rtida e Islas del AtlÃ¡ntico Sur', 'Provincia de Tierra del Fuego, AntÃ¡rtida e Islas del AtlÃ¡ntico Sur', -82.521133422851562, -50.74285888671875, 230);
INSERT INTO public2.provinces VALUES (90, 'TucumÃ¡n', 'Provincia de TucumÃ¡n', -26.948284149169922, -65.3647689819336, 240);


--
-- TOC entry 4858 (class 0 OID 24781)
-- Dependencies: 229
-- Data for Name: tags; Type: TABLE DATA; Schema: public2; Owner: postgres
--

INSERT INTO public2.tags VALUES (1, 'rock');
INSERT INTO public2.tags VALUES (2, 'pop');


--
-- TOC entry 4860 (class 0 OID 24787)
-- Dependencies: 231
-- Data for Name: users; Type: TABLE DATA; Schema: public2; Owner: postgres
--

INSERT INTO public2.users VALUES (1, 'Pablo', 'Ulman', 'pablo.ulman@ort.edu.ar', 'pabulm101');
INSERT INTO public2.users VALUES (2, 'Julian', 'Schiffer', 'julian.schiffer@ort.edu.ar', 'julshi102');
INSERT INTO public2.users VALUES (12, 'IlÃ¡n', 'Averbuch', 'ilÃ¡n@gmail.com', 'ilaave112');
INSERT INTO public2.users VALUES (3, 'Angeles', 'PeÃ±a', 'angeles.pena@ort.edu.ar', 'angpeÃ±103');
INSERT INTO public2.users VALUES (4, 'Jesica', 'Rodriguez', 'jesica.rodriguez@ort.edu.ar', 'jesrod104');
INSERT INTO public2.users VALUES (8, 'MatÃ­as', 'Aboudara', 'matÃ­as@gmail.com', 'matabo108');
INSERT INTO public2.users VALUES (9, 'Marco', 'Ambricca', 'marco@gmail.com', 'maramb109');
INSERT INTO public2.users VALUES (10, 'Martin', 'Aran', 'martin@gmail.com', 'marara110');
INSERT INTO public2.users VALUES (11, 'Emilia InÃ©s', 'Armeno', 'emiliainÃ©s@gmail.com', 'emiarm111');
INSERT INTO public2.users VALUES (13, 'NicolÃ¡s David', 'Becherman', 'nicolÃ¡sdavid@gmail.com', 'nicbec113');
INSERT INTO public2.users VALUES (14, 'Federico Eitan', 'Biderman', 'federicoeitan@gmail.com', 'fedbid114');
INSERT INTO public2.users VALUES (15, 'Felipe', 'Blaustein', 'felipe@gmail.com', 'felbla115');
INSERT INTO public2.users VALUES (16, 'Agostina', 'Bottarini', 'agostina@gmail.com', 'agobot116');
INSERT INTO public2.users VALUES (17, 'Ezequiel Alejandro', 'Boulet', 'ezequielalejandro@gmail.com', 'ezebou117');
INSERT INTO public2.users VALUES (18, 'Franco Iair', 'Bronsztein Castellan', 'francoiair@gmail.com', 'frabro118');
INSERT INTO public2.users VALUES (19, 'Nicole', 'Brunstein', 'nicole@gmail.com', 'nicbru119');
INSERT INTO public2.users VALUES (20, 'Benicio Uriel', 'Bursztyn', 'beniciouriel@gmail.com', 'benbur120');
INSERT INTO public2.users VALUES (21, 'Santiago Mateo', 'Butler', 'santiagomateo@gmail.com', 'sanbut121');
INSERT INTO public2.users VALUES (22, 'Santiago', 'CaÃ±ete Sztejn', 'santiago@gmail.com', 'sancaÃ±122');
INSERT INTO public2.users VALUES (23, 'Ariana Sofia', 'Castro', 'arianasofia@gmail.com', 'aricas123');
INSERT INTO public2.users VALUES (24, 'Roni', 'Chmielevsky', 'roni@gmail.com', 'ronchm124');
INSERT INTO public2.users VALUES (26, 'Mateo', 'Cottet', 'mateo@gmail.com', 'matcot126');
INSERT INTO public2.users VALUES (52, 'Julieta', 'Izbicki', 'julieta@gmail.com', 'julizb152');
INSERT INTO public2.users VALUES (53, 'Ivan Federico', 'Joaquin', 'ivanfederico@gmail.com', 'ivajoa153');
INSERT INTO public2.users VALUES (54, 'Alan Nataniel', 'Jolodovsky', 'alannataniel@gmail.com', 'alajol154');
INSERT INTO public2.users VALUES (55, 'TomÃ¡s', 'Kalinscky', 'tomÃ¡s@gmail.com', 'tomkal155');
INSERT INTO public2.users VALUES (56, 'Ulises MartÃ­n', 'Kaltman', 'ulisesmartÃ­n@gmail.com', 'ulikal156');
INSERT INTO public2.users VALUES (57, 'Raian Ju Ho', 'Kim', 'raianjuho@gmail.com', 'raikim157');
INSERT INTO public2.users VALUES (58, 'Axel NicolÃ¡s', 'Kleiman', 'axelnicolÃ¡s@gmail.com', 'axekle158');
INSERT INTO public2.users VALUES (117, 'Lautaro Fernando', 'Yukelson', 'lautarofernando@gmail.com', 'lauyuk217');
INSERT INTO public2.users VALUES (118, 'Facundo Manuel', 'Yuzefoff', 'facundomanuel@gmail.com', 'facyuz218');
INSERT INTO public2.users VALUES (119, 'Tobias', 'Zaselsky', 'tobias@gmail.com', 'tobzas219');
INSERT INTO public2.users VALUES (40, 'BenjamÃ­n Rolando', 'Feldman AgÃ¼ero', 'benjamÃ­nrolando@gmail.com', 'benfel140');
INSERT INTO public2.users VALUES (41, 'Tomas', 'Fernandez Zabala', 'tomas@gmail.com', 'tomfer141');
INSERT INTO public2.users VALUES (42, 'Santiago', 'Ferrara', 'santiago@gmail.com', 'sanfer142');
INSERT INTO public2.users VALUES (43, 'IvÃ¡n', 'Frankowski', 'ivÃ¡n@gmail.com', 'ivÃ¡fra143');
INSERT INTO public2.users VALUES (44, 'Julian', 'Furland Otero', 'julian@gmail.com', 'julfur144');
INSERT INTO public2.users VALUES (45, 'Ezequiel', 'Gajer Solmesky', 'ezequiel@gmail.com', 'ezegaj145');
INSERT INTO public2.users VALUES (46, 'Maximiliano', 'Garbarino', 'maximiliano@gmail.com', 'maxgar146');
INSERT INTO public2.users VALUES (47, 'Maria Emilia', 'Gayoso Martinez', 'mariaemilia@gmail.com', 'margay147');
INSERT INTO public2.users VALUES (48, 'Facundo', 'Giraudi RiverÃ³s', 'facundo@gmail.com', 'facgir148');
INSERT INTO public2.users VALUES (49, 'Uma Catarina', 'Gotfryd', 'umacatarina@gmail.com', 'umagot149');
INSERT INTO public2.users VALUES (50, 'Olivia', 'Granovsky', 'olivia@gmail.com', 'oligra150');
INSERT INTO public2.users VALUES (51, 'Bruno John', 'Gurwicz', 'brunojohn@gmail.com', 'brugur151');
INSERT INTO public2.users VALUES (25, 'Guido', 'Cohen Falah', 'guido@gmail.com', 'guicoh125');
INSERT INTO public2.users VALUES (27, 'Uriel Gregorio', 'Cwirenbaum', 'urielgregorio@gmail.com', 'uricwi127');
INSERT INTO public2.users VALUES (59, 'Lucas Nicolas', 'Koziupa', 'lucasnicolas@gmail.com', 'luckoz159');
INSERT INTO public2.users VALUES (60, 'Maia', 'Kupersmid', 'maia@gmail.com', 'maikup160');
INSERT INTO public2.users VALUES (61, 'Yisroel Yehoshua', 'Kurtz', 'yisroelyehoshua@gmail.com', 'yiskur161');
INSERT INTO public2.users VALUES (62, 'Ramiro Paolo', 'Kwon', 'ramiropaolo@gmail.com', 'ramkwo162');
INSERT INTO public2.users VALUES (63, 'Joaquin', 'Lasca', 'joaquin@gmail.com', 'joalas163');
INSERT INTO public2.users VALUES (64, 'Ivan', 'Latascheff', 'ivan@gmail.com', 'ivalat164');
INSERT INTO public2.users VALUES (65, 'Llauro Julian Eric', 'Lavera', 'llaurojulianeric@gmail.com', 'llalav165');
INSERT INTO public2.users VALUES (66, 'Tomas Dylan', 'Lerman', 'tomasdylan@gmail.com', 'tomler166');
INSERT INTO public2.users VALUES (67, 'Yannick', 'Lerner', 'yannick@gmail.com', 'yanler167');
INSERT INTO public2.users VALUES (68, 'Ian Gabriel', 'Levin', 'iangabriel@gmail.com', 'ianlev168');
INSERT INTO public2.users VALUES (69, 'Thiago NicolÃ¡s', 'Lewin', 'thiagonicolÃ¡s@gmail.com', 'thilew169');
INSERT INTO public2.users VALUES (70, 'JuliÃ¡n', 'Lifschitz', 'juliÃ¡n@gmail.com', 'jullif170');
INSERT INTO public2.users VALUES (71, 'Luca', 'Listingart Maekanehisa', 'luca@gmail.com', 'luclis171');
INSERT INTO public2.users VALUES (72, 'Santino', 'Lo Giudice', 'santino@gmail.com', 'sanlo172');
INSERT INTO public2.users VALUES (73, 'Camila BelÃ©n', 'Lo Iacono', 'camilabelÃ©n@gmail.com', 'camlo173');
INSERT INTO public2.users VALUES (74, 'Dana Leila', 'Mandelbaum', 'danaleila@gmail.com', 'danman174');
INSERT INTO public2.users VALUES (75, 'Marcos Paul', 'Martinez Del Franco', 'marcospaul@gmail.com', 'marmar175');
INSERT INTO public2.users VALUES (76, 'Matias Francisco', 'Mazzeo', 'matiasfrancisco@gmail.com', 'matmaz176');
INSERT INTO public2.users VALUES (77, 'Marcos', 'Mellebovsky', 'marcos@gmail.com', 'marmel177');
INSERT INTO public2.users VALUES (78, 'Joaquin', 'Naccache', 'joaquin@gmail.com', 'joanac178');
INSERT INTO public2.users VALUES (79, 'Tomas', 'Naccache', 'tomas@gmail.com', 'tomnac179');
INSERT INTO public2.users VALUES (80, 'Zarek Alexis', 'Nazar Dutka', 'zarekalexis@gmail.com', 'zarnaz180');
INSERT INTO public2.users VALUES (81, 'Tomas', 'Neimerman Grosso', 'tomas@gmail.com', 'tomnei181');
INSERT INTO public2.users VALUES (82, 'Federico Ilan', 'Ostrovsky', 'federicoilan@gmail.com', 'fedost182');
INSERT INTO public2.users VALUES (83, 'Thiago', 'Palachi', 'thiago@gmail.com', 'thipal183');
INSERT INTO public2.users VALUES (84, 'Santiago Alejandro', 'Palma', 'santiagoalejandro@gmail.com', 'sanpal184');
INSERT INTO public2.users VALUES (85, 'Franco', 'Pasquale Sanguinetti', 'franco@gmail.com', 'frapas185');
INSERT INTO public2.users VALUES (86, 'Joaquin', 'Piva', 'joaquin@gmail.com', 'joapiv186');
INSERT INTO public2.users VALUES (87, 'Agustina', 'Potasman', 'agustina@gmail.com', 'agupot187');
INSERT INTO public2.users VALUES (93, 'Ian', 'Roitman', 'ian@gmail.com', 'ianroi193');
INSERT INTO public2.users VALUES (88, 'Martin Ezequiel', 'Raber', 'martinezequiel@gmail.com', 'marrab188');
INSERT INTO public2.users VALUES (89, 'Franco', 'Ragusa', 'franco@gmail.com', 'frarag189');
INSERT INTO public2.users VALUES (90, 'Manuel', 'Ramasso', 'manuel@gmail.com', 'manram190');
INSERT INTO public2.users VALUES (91, 'Nicolas Iair', 'Reifut', 'nicolasiair@gmail.com', 'nicrei191');
INSERT INTO public2.users VALUES (92, 'Micaela', 'Riccardi', 'micaela@gmail.com', 'micric192');
INSERT INTO public2.users VALUES (94, 'Lucas Uriel', 'Rosenbaum', 'lucasuriel@gmail.com', 'lucros194');
INSERT INTO public2.users VALUES (95, 'Noah Demian', 'Rotbard', 'noahdemian@gmail.com', 'noarot195');
INSERT INTO public2.users VALUES (96, 'Vicente', 'Ruiz Barrea', 'vicente@gmail.com', 'vicrui196');
INSERT INTO public2.users VALUES (97, 'Yael', 'Saroka', 'yael@gmail.com', 'yaesar197');
INSERT INTO public2.users VALUES (98, 'Martin', 'Sedam Dugatkin', 'martin@gmail.com', 'marsed198');
INSERT INTO public2.users VALUES (99, 'Tiago', 'Shebar', 'tiago@gmail.com', 'tiashe199');
INSERT INTO public2.users VALUES (100, 'Maximiliano', 'Sher', 'maximiliano@gmail.com', 'maxshe200');
INSERT INTO public2.users VALUES (101, 'Dante', 'Siegel', 'dante@gmail.com', 'dansie201');
INSERT INTO public2.users VALUES (102, 'Nicolas Gabriel', 'Simone', 'nicolasgabriel@gmail.com', 'nicsim202');
INSERT INTO public2.users VALUES (28, 'MartÃ­n Eliezer', 'Cygiel', 'martÃ­neliezer@gmail.com', 'marcyg128');
INSERT INTO public2.users VALUES (29, 'Tomas', 'Czernuszka Schirmer', 'tomas@gmail.com', 'tomcze129');
INSERT INTO public2.users VALUES (30, 'Milena Avril', 'Dawidowicz', 'milenaavril@gmail.com', 'mildaw130');
INSERT INTO public2.users VALUES (31, 'TomÃ¡s Leonel', 'Degese', 'tomÃ¡sleonel@gmail.com', 'tomdeg131');
INSERT INTO public2.users VALUES (32, 'Korob Noah', 'Denenberg', 'korobnoah@gmail.com', 'korden132');
INSERT INTO public2.users VALUES (33, 'Lucas Yoel', 'Dercye Flomin', 'lucasyoel@gmail.com', 'lucder133');
INSERT INTO public2.users VALUES (34, 'Olivia Gala', 'Di Carlo Matsuo', 'oliviagala@gmail.com', 'olidi134');
INSERT INTO public2.users VALUES (35, 'Francisco', 'Dominguez Navarro', 'francisco@gmail.com', 'fradom135');
INSERT INTO public2.users VALUES (36, 'Tamara Yael', 'Dratler', 'tamarayael@gmail.com', 'tamdra136');
INSERT INTO public2.users VALUES (37, 'Alex', 'Droblas', 'alex@gmail.com', 'aledro137');
INSERT INTO public2.users VALUES (38, 'MatÃ­as NicolÃ¡s', 'Esteves', 'matÃ­asnicolÃ¡s@gmail.com', 'matest138');
INSERT INTO public2.users VALUES (39, 'Lara Micaela', 'Farina', 'laramicaela@gmail.com', 'larfar139');
INSERT INTO public2.users VALUES (103, 'Iair Barak', 'Steimberg', 'iairbarak@gmail.com', 'iaiste203');
INSERT INTO public2.users VALUES (104, 'Ramiro', 'Sued', 'ramiro@gmail.com', 'ramsue204');
INSERT INTO public2.users VALUES (105, 'SimÃ³n', 'Suken Rosenberg', 'simÃ³n@gmail.com', 'simsuk205');
INSERT INTO public2.users VALUES (106, 'Mateo', 'Sverdloff', 'mateo@gmail.com', 'matsve206');
INSERT INTO public2.users VALUES (107, 'Matias Ivan', 'Szabo', 'matiasivan@gmail.com', 'matsza207');
INSERT INTO public2.users VALUES (108, 'Eitan Gabriel', 'Toporovskaja', 'eitangabriel@gmail.com', 'eittop208');
INSERT INTO public2.users VALUES (109, 'AmÃ©lie', 'Torre Walsh', 'amÃ©lie@gmail.com', 'amÃ©tor209');
INSERT INTO public2.users VALUES (110, 'Lola', 'Vazquez', 'lola@gmail.com', 'lolvaz210');
INSERT INTO public2.users VALUES (111, 'Dante', 'Verdi Gutierrez', 'dante@gmail.com', 'danver211');
INSERT INTO public2.users VALUES (112, 'Sasha Mia', 'Vilamowski', 'sashamia@gmail.com', 'sasvil212');
INSERT INTO public2.users VALUES (113, 'Valentina Orit', 'Vugin', 'valentinaorit@gmail.com', 'valvug213');
INSERT INTO public2.users VALUES (114, 'JuliÃ¡n', 'Wegman', 'juliÃ¡n@gmail.com', 'julweg214');
INSERT INTO public2.users VALUES (115, 'David Ezequiel', 'Weissbrod', 'davidezequiel@gmail.com', 'davwei215');
INSERT INTO public2.users VALUES (116, 'Agustin', 'Yudcovsky', 'agustin@gmail.com', 'aguyud216');
INSERT INTO public2.users VALUES (120, 'Pablo Fabrizio', 'Zurbano', 'pablofabrizio@gmail.com', 'pabzur220');


--
-- TOC entry 4876 (class 0 OID 0)
-- Dependencies: 216
-- Name: event_categories_id_seq; Type: SEQUENCE SET; Schema: public2; Owner: postgres
--

SELECT pg_catalog.setval('public2.event_categories_id_seq', 11, true);


--
-- TOC entry 4877 (class 0 OID 0)
-- Dependencies: 218
-- Name: event_enrollments_id_seq; Type: SEQUENCE SET; Schema: public2; Owner: postgres
--

SELECT pg_catalog.setval('public2.event_enrollments_id_seq', 1, false);


--
-- TOC entry 4878 (class 0 OID 0)
-- Dependencies: 220
-- Name: event_locations_id_seq; Type: SEQUENCE SET; Schema: public2; Owner: postgres
--

SELECT pg_catalog.setval('public2.event_locations_id_seq', 9, true);


--
-- TOC entry 4879 (class 0 OID 0)
-- Dependencies: 222
-- Name: event_tags_id_seq; Type: SEQUENCE SET; Schema: public2; Owner: postgres
--

SELECT pg_catalog.setval('public2.event_tags_id_seq', 5, true);


--
-- TOC entry 4880 (class 0 OID 0)
-- Dependencies: 224
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public2; Owner: postgres
--

SELECT pg_catalog.setval('public2.events_id_seq', 63, true);


--
-- TOC entry 4881 (class 0 OID 0)
-- Dependencies: 226
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public2; Owner: postgres
--

SELECT pg_catalog.setval('public2.locations_id_seq', 4037, true);


--
-- TOC entry 4882 (class 0 OID 0)
-- Dependencies: 228
-- Name: provinces_id_seq; Type: SEQUENCE SET; Schema: public2; Owner: postgres
--

SELECT pg_catalog.setval('public2.provinces_id_seq', 94, true);


--
-- TOC entry 4883 (class 0 OID 0)
-- Dependencies: 230
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public2; Owner: postgres
--

SELECT pg_catalog.setval('public2.tags_id_seq', 2, true);


--
-- TOC entry 4884 (class 0 OID 0)
-- Dependencies: 232
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public2; Owner: postgres
--

SELECT pg_catalog.setval('public2.users_id_seq', 120, true);


--
-- TOC entry 4675 (class 2606 OID 24803)
-- Name: event_categories PK_EventCategories; Type: CONSTRAINT; Schema: public2; Owner: postgres
--

ALTER TABLE ONLY public2.event_categories
    ADD CONSTRAINT "PK_EventCategories" PRIMARY KEY (id);


--
-- TOC entry 4677 (class 2606 OID 24805)
-- Name: event_enrollments PK_EventEnrollments; Type: CONSTRAINT; Schema: public2; Owner: postgres
--

ALTER TABLE ONLY public2.event_enrollments
    ADD CONSTRAINT "PK_EventEnrollments" PRIMARY KEY (id);


--
-- TOC entry 4679 (class 2606 OID 24807)
-- Name: event_locations PK_EventLocations; Type: CONSTRAINT; Schema: public2; Owner: postgres
--

ALTER TABLE ONLY public2.event_locations
    ADD CONSTRAINT "PK_EventLocations" PRIMARY KEY (id);


--
-- TOC entry 4681 (class 2606 OID 24809)
-- Name: event_tags PK_EventTags; Type: CONSTRAINT; Schema: public2; Owner: postgres
--

ALTER TABLE ONLY public2.event_tags
    ADD CONSTRAINT "PK_EventTags" PRIMARY KEY (id);


--
-- TOC entry 4683 (class 2606 OID 24811)
-- Name: events PK_Events; Type: CONSTRAINT; Schema: public2; Owner: postgres
--

ALTER TABLE ONLY public2.events
    ADD CONSTRAINT "PK_Events" PRIMARY KEY (id);


--
-- TOC entry 4685 (class 2606 OID 24813)
-- Name: locations PK_Locations; Type: CONSTRAINT; Schema: public2; Owner: postgres
--

ALTER TABLE ONLY public2.locations
    ADD CONSTRAINT "PK_Locations" PRIMARY KEY (id);


--
-- TOC entry 4687 (class 2606 OID 24815)
-- Name: provinces PK_Provinces ; Type: CONSTRAINT; Schema: public2; Owner: postgres
--

ALTER TABLE ONLY public2.provinces
    ADD CONSTRAINT "PK_Provinces " PRIMARY KEY (id);


--
-- TOC entry 4689 (class 2606 OID 24817)
-- Name: tags PK_Tags; Type: CONSTRAINT; Schema: public2; Owner: postgres
--

ALTER TABLE ONLY public2.tags
    ADD CONSTRAINT "PK_Tags" PRIMARY KEY (id);


--
-- TOC entry 4691 (class 2606 OID 24819)
-- Name: users PK_Users; Type: CONSTRAINT; Schema: public2; Owner: postgres
--

ALTER TABLE ONLY public2.users
    ADD CONSTRAINT "PK_Users" PRIMARY KEY (id);


--
-- TOC entry 4692 (class 2606 OID 24820)
-- Name: event_enrollments fk_event_enrollments_events; Type: FK CONSTRAINT; Schema: public2; Owner: postgres
--

ALTER TABLE ONLY public2.event_enrollments
    ADD CONSTRAINT fk_event_enrollments_events FOREIGN KEY (id_event) REFERENCES public2.events(id);


--
-- TOC entry 4693 (class 2606 OID 24825)
-- Name: event_enrollments fk_event_enrollments_users; Type: FK CONSTRAINT; Schema: public2; Owner: postgres
--

ALTER TABLE ONLY public2.event_enrollments
    ADD CONSTRAINT fk_event_enrollments_users FOREIGN KEY (id_user) REFERENCES public2.users(id);


--
-- TOC entry 4694 (class 2606 OID 24830)
-- Name: event_locations fk_event_locations_locations; Type: FK CONSTRAINT; Schema: public2; Owner: postgres
--

ALTER TABLE ONLY public2.event_locations
    ADD CONSTRAINT fk_event_locations_locations FOREIGN KEY (id_location) REFERENCES public2.locations(id);


--
-- TOC entry 4695 (class 2606 OID 24835)
-- Name: event_tags fk_event_tags_events; Type: FK CONSTRAINT; Schema: public2; Owner: postgres
--

ALTER TABLE ONLY public2.event_tags
    ADD CONSTRAINT fk_event_tags_events FOREIGN KEY (id_event) REFERENCES public2.events(id);


--
-- TOC entry 4696 (class 2606 OID 24840)
-- Name: event_tags fk_event_tags_tags; Type: FK CONSTRAINT; Schema: public2; Owner: postgres
--

ALTER TABLE ONLY public2.event_tags
    ADD CONSTRAINT fk_event_tags_tags FOREIGN KEY (id_tag) REFERENCES public2.tags(id);


--
-- TOC entry 4697 (class 2606 OID 24845)
-- Name: events fk_events_event_categories; Type: FK CONSTRAINT; Schema: public2; Owner: postgres
--

ALTER TABLE ONLY public2.events
    ADD CONSTRAINT fk_events_event_categories FOREIGN KEY (id_event_category) REFERENCES public2.event_categories(id);


--
-- TOC entry 4698 (class 2606 OID 24850)
-- Name: events fk_events_event_locations; Type: FK CONSTRAINT; Schema: public2; Owner: postgres
--

ALTER TABLE ONLY public2.events
    ADD CONSTRAINT fk_events_event_locations FOREIGN KEY (id_event_location) REFERENCES public2.event_locations(id);


--
-- TOC entry 4699 (class 2606 OID 24855)
-- Name: events fk_events_users; Type: FK CONSTRAINT; Schema: public2; Owner: postgres
--

ALTER TABLE ONLY public2.events
    ADD CONSTRAINT fk_events_users FOREIGN KEY (id_creator_user) REFERENCES public2.users(id);


--
-- TOC entry 4700 (class 2606 OID 24860)
-- Name: locations fk_locations_provinces; Type: FK CONSTRAINT; Schema: public2; Owner: postgres
--

ALTER TABLE ONLY public2.locations
    ADD CONSTRAINT fk_locations_provinces FOREIGN KEY (id_province) REFERENCES public2.provinces(id);


-- Completed on 2024-05-14 20:10:42

--
-- PostgreSQL database dump complete
--