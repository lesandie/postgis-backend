--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.8
-- Dumped by pg_dump version 9.6.8

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: topology; Type: SCHEMA; Schema: -; Owner: admin
--

CREATE SCHEMA topology;


ALTER SCHEMA topology OWNER TO admin;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


--
-- Name: postgis_topology; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS postgis_topology WITH SCHEMA topology;


--
-- Name: EXTENSION postgis_topology; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_topology IS 'PostGIS topology spatial types and functions';

--

CREATE TABLE public.cl_cara (
    id_cara integer NOT NULL,
    cara integer NOT NULL,
    angulo integer DEFAULT 1
);


ALTER TABLE public.cl_cara OWNER TO admin;

--
-- Name: cl_circuito; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.cl_circuito (
    id_circuito integer NOT NULL,
    circuito character varying(50)
);


ALTER TABLE public.cl_circuito OWNER TO admin;

--
-- Name: cl_tense; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.cl_tense (
    id_tense integer NOT NULL,
    tense character varying(50)
);


ALTER TABLE public.cl_tense OWNER TO admin;

--
-- Name: cl_tense_id_tense_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.cl_tense_id_tense_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cl_tense_id_tense_seq OWNER TO admin;

--
-- Name: cl_tense_id_tense_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.cl_tense_id_tense_seq OWNED BY public.cl_tense.id_tense;


--
-- Name: cl_tipo_apoyo; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.cl_tipo_apoyo (
    id_tipoapoyo integer NOT NULL,
    alt_apoyo character varying(2),
    esfuerzo character varying(50),
    material character varying(50),
    tipoapoyo character varying(50),
    num_tipoapoyo character varying(2)
);


ALTER TABLE public.cl_tipo_apoyo OWNER TO admin;

--
-- Name: cl_tipo_apoyo_id_tipoapoyo_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.cl_tipo_apoyo_id_tipoapoyo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cl_tipo_apoyo_id_tipoapoyo_seq OWNER TO admin;

--
-- Name: cl_tipo_apoyo_id_tipoapoyo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.cl_tipo_apoyo_id_tipoapoyo_seq OWNED BY public.cl_tipo_apoyo.id_tipoapoyo;


--
-- Name: cl_tipo_conductor; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.cl_tipo_conductor (
    id_tipoconductor integer NOT NULL,
    tipo_conductor character varying(50),
    tense character varying(25),
    designacion character varying(25)
);


ALTER TABLE public.cl_tipo_conductor OWNER TO admin;

--
-- Name: cl_tipo_conductor_id_tipoconductor_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.cl_tipo_conductor_id_tipoconductor_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cl_tipo_conductor_id_tipoconductor_seq OWNER TO admin;

--
-- Name: cl_tipo_conductor_id_tipoconductor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.cl_tipo_conductor_id_tipoconductor_seq OWNED BY public.cl_tipo_conductor.id_tipoconductor;


--
-- Name: cl_tipo_cruzamiento; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.cl_tipo_cruzamiento (
    id_tipocruzamiento integer NOT NULL,
    tipo_cruzamiento character varying(50),
    ref_cruzamiento character varying(3)
);


ALTER TABLE public.cl_tipo_cruzamiento OWNER TO admin;

--
-- Name: cl_tipo_cruzamiento_id_tipocruzamiento_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.cl_tipo_cruzamiento_id_tipocruzamiento_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cl_tipo_cruzamiento_id_tipocruzamiento_seq OWNER TO admin;

--
-- Name: cl_tipo_cruzamiento_id_tipocruzamiento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.cl_tipo_cruzamiento_id_tipocruzamiento_seq OWNED BY public.cl_tipo_cruzamiento.id_tipocruzamiento;


--
-- Name: cl_tipo_red; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.cl_tipo_red (
    id_tipo_red integer NOT NULL,
    tipo_red character varying(50) NOT NULL
);


ALTER TABLE public.cl_tipo_red OWNER TO admin;

--
-- Name: cl_tipo_red_id_tipo_red_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.cl_tipo_red_id_tipo_red_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cl_tipo_red_id_tipo_red_seq OWNER TO admin;

--
-- Name: cl_tipo_red_id_tipo_red_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.cl_tipo_red_id_tipo_red_seq OWNED BY public.cl_tipo_red.id_tipo_red;


--
-- Name: vl_usuarios; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.vl_usuarios (
    id_usuario integer NOT NULL,
    nombre character varying(150)
);


ALTER TABLE public.vl_usuarios OWNER TO admin;

--
-- Name: lv_usuarios_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.lv_usuarios_id_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lv_usuarios_id_usuario_seq OWNER TO admin;

--
-- Name: lv_usuarios_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.lv_usuarios_id_usuario_seq OWNED BY public.vl_usuarios.id_usuario;


--
-- Name: vl_apoyo_3857; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.vl_apoyo_3857 (
    id_apoyo integer NOT NULL,
    matricula character varying(30) NOT NULL,
    num_ap integer DEFAULT 0,
    id_tipoapoyo integer,
    orientacion_ap double precision DEFAULT 0,
    acometida_bool boolean DEFAULT false,
    acometida_orientacion double precision DEFAULT 0,
    luminaria_bool boolean DEFAULT false,
    luminaria_orientacion double precision DEFAULT 0,
    id_usuario integer,
    fecha timestamp without time zone DEFAULT ('now'::text)::date,
    the_geom public.geometry(Point,3857),
    orientacion_ap_bool boolean DEFAULT false,
    observaciones character varying(150),
    tipoapoyo_otro character varying(15),
    tipoapoyo_observ character varying(150),
    campo_ap character varying,
    CONSTRAINT enforce_dims_the_geom4 CHECK ((public.st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom4 CHECK (((public.geometrytype(the_geom) = 'POINT'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom4 CHECK ((public.st_srid(the_geom) = 3857))
);


ALTER TABLE public.vl_apoyo_3857 OWNER TO admin;

--
-- Name: vl_apoyo_3857_id_apoyo_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.vl_apoyo_3857_id_apoyo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vl_apoyo_3857_id_apoyo_seq OWNER TO admin;

--
-- Name: vl_apoyo_3857_id_apoyo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.vl_apoyo_3857_id_apoyo_seq OWNED BY public.vl_apoyo_3857.id_apoyo;


--
-- Name: vl_circuito_id_circuito_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.vl_circuito_id_circuito_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vl_circuito_id_circuito_seq OWNER TO admin;

--
-- Name: vl_circuito_id_circuito_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.vl_circuito_id_circuito_seq OWNED BY public.cl_circuito.id_circuito;


--
-- Name: vl_conductor_3857; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.vl_conductor_3857 (
    id_conductor integer NOT NULL,
    matricula character varying(30) NOT NULL,
    id_circuito integer NOT NULL,
    id_tipoconductor integer,
    tense_obs text,
    id_usuario integer,
    fecha timestamp without time zone DEFAULT now(),
    azimut double precision DEFAULT 0,
    the_geom public.geometry(LineString,3857),
    observaciones character varying(150),
    longitud double precision,
    CONSTRAINT enforce_dims_the_geom4 CHECK ((public.st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom4 CHECK (((public.geometrytype(the_geom) = 'LINESTRING'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom4 CHECK ((public.st_srid(the_geom) = 3857))
);


ALTER TABLE public.vl_conductor_3857 OWNER TO admin;

--
-- Name: vl_conductor_3857_id_conductor_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.vl_conductor_3857_id_conductor_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vl_conductor_3857_id_conductor_seq OWNER TO admin;

--
-- Name: vl_conductor_3857_id_conductor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.vl_conductor_3857_id_conductor_seq OWNED BY public.vl_conductor_3857.id_conductor;


--
-- Name: vl_cruces_point_3857; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.vl_cruces_point_3857 (
    id_cruce integer NOT NULL,
    id_cruzamiento integer NOT NULL,
    id_conductor integer NOT NULL,
    the_geom public.geometry(Point,3857),
    CONSTRAINT enforce_dims_the_geom5 CHECK ((public.st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom5 CHECK (((public.geometrytype(the_geom) = 'POINT'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom5 CHECK ((public.st_srid(the_geom) = 3857))
);


ALTER TABLE public.vl_cruces_point_3857 OWNER TO admin;

--
-- Name: vl_cruces_point_3857_id_cruce_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.vl_cruces_point_3857_id_cruce_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vl_cruces_point_3857_id_cruce_seq OWNER TO admin;

--
-- Name: vl_cruces_point_3857_id_cruce_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.vl_cruces_point_3857_id_cruce_seq OWNED BY public.vl_cruces_point_3857.id_cruce;


--
-- Name: vl_cruzamientos_3857; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.vl_cruzamientos_3857 (
    id_cruzamiento integer NOT NULL,
    id_usuario integer,
    fecha timestamp without time zone DEFAULT now(),
    matricula character varying(30),
    id_circuito integer,
    id_tipocruzamiento integer,
    resultado double precision,
    the_geom public.geometry(LineString,3857),
    alt_circuito double precision,
    alt_cruzamiento double precision,
    observaciones character varying(150),
    CONSTRAINT enforce_dims_the_geom4 CHECK ((public.st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom4 CHECK (((public.geometrytype(the_geom) = 'LINESTRING'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom4 CHECK ((public.st_srid(the_geom) = 3857))
);


ALTER TABLE public.vl_cruzamientos_3857 OWNER TO admin;

--
-- Name: vl_cruzamientos_3857_id_cruzamiento_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.vl_cruzamientos_3857_id_cruzamiento_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vl_cruzamientos_3857_id_cruzamiento_seq OWNER TO admin;

--
-- Name: vl_cruzamientos_3857_id_cruzamiento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.vl_cruzamientos_3857_id_cruzamiento_seq OWNED BY public.vl_cruzamientos_3857.id_cruzamiento;


--
-- Name: vl_red_3857; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.vl_red_3857 (
    matricula character varying(30) NOT NULL,
    alias character varying(150),
    id_usuario integer,
    fecha timestamp without time zone DEFAULT ('now'::text)::date,
    id_tipo_red integer DEFAULT 1,
    id_cara_lmt integer DEFAULT 1,
    the_geom public.geometry(Point,3857),
    orientacion_red double precision,
    observaciones character varying(150),
    CONSTRAINT enforce_dims_the_geom5 CHECK ((public.st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom5 CHECK (((public.geometrytype(the_geom) = 'POINT'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom5 CHECK ((public.st_srid(the_geom) = 3857))
);


ALTER TABLE public.vl_red_3857 OWNER TO admin;

--
-- Name: cl_circuito id_circuito; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.cl_circuito ALTER COLUMN id_circuito SET DEFAULT nextval('public.vl_circuito_id_circuito_seq'::regclass);


--
-- Name: cl_tense id_tense; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.cl_tense ALTER COLUMN id_tense SET DEFAULT nextval('public.cl_tense_id_tense_seq'::regclass);


--
-- Name: cl_tipo_apoyo id_tipoapoyo; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.cl_tipo_apoyo ALTER COLUMN id_tipoapoyo SET DEFAULT nextval('public.cl_tipo_apoyo_id_tipoapoyo_seq'::regclass);


--
-- Name: cl_tipo_conductor id_tipoconductor; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.cl_tipo_conductor ALTER COLUMN id_tipoconductor SET DEFAULT nextval('public.cl_tipo_conductor_id_tipoconductor_seq'::regclass);


--
-- Name: cl_tipo_cruzamiento id_tipocruzamiento; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.cl_tipo_cruzamiento ALTER COLUMN id_tipocruzamiento SET DEFAULT nextval('public.cl_tipo_cruzamiento_id_tipocruzamiento_seq'::regclass);


--
-- Name: cl_tipo_red id_tipo_red; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.cl_tipo_red ALTER COLUMN id_tipo_red SET DEFAULT nextval('public.cl_tipo_red_id_tipo_red_seq'::regclass);


--
-- Name: vl_apoyo_3857 id_apoyo; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.vl_apoyo_3857 ALTER COLUMN id_apoyo SET DEFAULT nextval('public.vl_apoyo_3857_id_apoyo_seq'::regclass);


--
-- Name: vl_conductor_3857 id_conductor; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.vl_conductor_3857 ALTER COLUMN id_conductor SET DEFAULT nextval('public.vl_conductor_3857_id_conductor_seq'::regclass);


--
-- Name: vl_cruces_point_3857 id_cruce; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.vl_cruces_point_3857 ALTER COLUMN id_cruce SET DEFAULT nextval('public.vl_cruces_point_3857_id_cruce_seq'::regclass);


--
-- Name: vl_cruzamientos_3857 id_cruzamiento; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.vl_cruzamientos_3857 ALTER COLUMN id_cruzamiento SET DEFAULT nextval('public.vl_cruzamientos_3857_id_cruzamiento_seq'::regclass);


--
-- Name: vl_usuarios id_usuario; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.vl_usuarios ALTER COLUMN id_usuario SET DEFAULT nextval('public.lv_usuarios_id_usuario_seq'::regclass);


--
-- Data for Name: cl_cara; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.cl_cara (id_cara, cara, angulo) FROM stdin;
1	1	0
2	2	90
3	3	180
4	4	270
\.


--
-- Data for Name: cl_circuito; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.cl_circuito (id_circuito, circuito) FROM stdin;
10	Circuito 10
1	Circuito 01
2	Circuito 02
3	Circuito 03
4	Circuito 04
5	Circuito 05
6	Circuito 06
7	Circuito 07
8	Circuito 08
9	Circuito 09
\.


--
-- Data for Name: cl_tense; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.cl_tense (id_tense, tense) FROM stdin;
1	Tense 1
2	Tense 2
3	Distinto
\.


--
-- Name: cl_tense_id_tense_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.cl_tense_id_tense_seq', 3, true);


--
-- Data for Name: cl_tipo_apoyo; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.cl_tipo_apoyo (id_tipoapoyo, alt_apoyo, esfuerzo, material, tipoapoyo, num_tipoapoyo) FROM stdin;
2	10	120	Madera	M-10-III\r\n	02
4	11	250	Hormigón	HV-250-R-11\r\n	04
5	13	250	Hormigón	HV-250-R-13\r\n	05
7	11	400	Hormigón	HV-400-R-11\r\n	07
8	13	400	Hormigón	HV-400-R-13\r\n	08
9	15	400	Hormigón	HV-400-R-15\r\n	09
11	11	630	Hormigón	HV-630-R-11\r\n	11
12	13	630	Hormigón	HV-630-R-13\r\n	12
13	15	630	Hormigón	HV-630-R-15\r\n	13
15	11	800	Hormigón	HV-800-R-11\r\n	15
16	13	800	Hormigón	HV-800-R-13\r\n	16
17	13	800	Hormigón	HV-800-R-15\r\n	17
19	11	1000	Hormigón	HV-1000-R-11\r\n	19
20	13	1000	Hormigón	HV-1000-R-13\r\n	20
21	15	1000	Hormigón	HV-1000-R-15\r\n	21
23	11	1600	Hormigón	HV-1600-R-11\r\n	23
24	13	1600	Hormigón	HV-1600-R-13\r\n	24
25	15	1600	Hormigón	HV-1600-R-15\r\n	25
26	10	C-500	Metálico	C-500-10\r\n	26
27	12	C-500	Metálico	C-500-12\r\n	27
28	14	C-500	Metálico	C-500-14\r\n	28
29	16	C-500	Metálico	C-500-16\r\n	29
30	18	C-500	Metálico	C-500-18\r\n	30
31	20	C-500	Metálico	C-500-20\r\n	31
32	22	C-500	Metálico	C-500-22\r\n	32
80	15	630	Chapa	CH-630-15\r\n	80
1	09	120	Madera	M-9-III\r\n	01
3	09	250	Hormigón	HV-250-R-9\r\n	03
6	09	400	Hormigón	HV-400-R-9\r\n	06
10	09	630	Hormigón	HV-630-R-9\r\n	10
14	09	800	Hormigón	HV-800-R-9\r\n	14
18	09	1000	Hormigón	HV-1000-R-9\r\n	18
22	09	1600	Hormigón	HV-1600-R-9\r\n	22
33	24	C-500	Metálico	C-500-24\r\n	33
34	26	C-500	Metálico	C-500-26\r\n	34
35	28	C-500	Metálico	C-500-28\r\n	35
69	28	C-3000	Metálico	C-3000-28\r\n	69
70	30	C-3000	Metálico	C-3000-30\r\n	70
71	09	250	Chapa	CH-250-9\r\n	71
36	30	C-500	Metálico	C-500-30\r\n	36
37	10	C-1000	Metálico	C-1000-10\r\n	37
38	12	C-1000	Metálico	C-1000-12\r\n	38
39	14	C-1000	Metálico	C-1000-14\r\n	39
40	16	C-1000	Metálico	C-1000-16\r\n	40
42	18	C-1000	Metálico	C-1000-18\r\n	42
43	20	C-1000	Metálico	C-1000-20\r\n	43
44	22	C-1000	Metálico	C-1000-22\r\n	44
45	24	C-1000	Metálico	C-1000-24\r\n	45
46	26	C-1000	Metálico	C-1000-26\r\n	46
47	28	C-1000	Metálico	C-1000-28\r\n	47
48	30	C-1000	Metálico	C-1000-30\r\n	48
49	10	C-2000	Metálico	C-2000-10\r\n	49
50	12	C-2000	Metálico	C-2000-12\r\n	50
51	14	C-2000	Metálico	C-2000-14\r\n	51
52	16	C-2000	Metálico	C-2000-16\r\n	52
53	18	C-2000	Metálico	C-2000-18\r\n	53
54	20	C-2000	Metálico	C-2000-20\r\n	54
55	22	C-2000	Metálico	C-2000-22\r\n	55
72	11	250	Chapa	CH-250-11\r\n	72
73	13	250	Chapa	CH-250-13\r\n	73
74	09	400	Chapa	CH-400-9\r\n	74
75	11	400	Chapa	CH-400-11\r\n	75
56	24	C-2000	Metálico	C-2000-24\r\n	56
76	13	400	Chapa	CH-400-13\r\n	76
77	09	630	Chapa	CH-630-9\r\n	77
78	11	630	Chapa	CH-630-11\r\n	78
79	13	630	Chapa	CH-630-13\r\n	79
81	09	1000	Chapa	CH-1000-9\r\n	81
82	11	1000	Chapa	CH-1000-11\r\n	82
83	13	1000	Chapa	CH-1000-13\r\n	83
84	15	1000	Chapa	CH-1000-15\r\n	84
85	--	--	--	Fachada	85
57	26	C-2000	Metálico	C-2000-26\r\n	57
58	28	C-2000	Metálico	C-2000-28\r\n	58
59	30	C-2000	Metálico	C-2000-30\r\n	59
60	10	C-3000	Metálico	C-3000-10\r\n	60
61	12	C-3000	Metálico	C-3000-12\r\n	61
62	14	C-3000	Metálico	C-3000-14\r\n	62
63	16	C-3000	Metálico	C-3000-16\r\n	63
64	18	C-3000	Metálico	C-3000-18\r\n	64
65	20	C-3000	Metálico	C-3000-20\r\n	65
66	22	C-3000	Metálico	C-3000-22\r\n	66
67	24	C-3000	Metálico	C-3000-24\r\n	67
68	26	C-3000	Metálico	C-3000-26\r\n	68
86	-	-	-	Otros	86
\.


--
-- Name: cl_tipo_apoyo_id_tipoapoyo_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.cl_tipo_apoyo_id_tipoapoyo_seq', 3, true);


--
-- Data for Name: cl_tipo_conductor; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.cl_tipo_conductor (id_tipoconductor, tipo_conductor, tense, designacion) FROM stdin;
1	RZ 150/80	500	RZ-3X150/80 Al
2	RZ 150/80	900	RZ-3X150/80 Al
3	RZ 150/95	500	RZ-3X150/80 Al
4	RZ 150/95	900	RZ-3X150/80 Al
5	RZ 95	500	RZ-3X95/54,6 Al
6	RZ 95	315	RZ-3X95/54,6 Al
7	RZ 70	500	RZ-3X70/54,6 Al
8	RZ 70	315	RZ-3X70/54,6 Al
9	RZ 50	500	RZ-3X50/54,6 Al
10	RZ 50	315	RZ-3X50/54,6 Al
11	RZ 35	500	RZ-3X35/54,6 Al
12	RZ 35	315	RZ-3X35/54,6 Al
13	RZ 25	500	RZ-3X25/54,6 Al
14	RZ 25	315	RZ-3X25/54,6 Al
15	RZ 4X25	160	RZ-4X25 Al
16	RZ 2X25	160	RZ-2X25 Al\r\n
17	RZ 4X16	160	RZ-4X16 AI
18	RZ 2X16	160	RZ-2X16 Al\r\n
19	LC 28 (2)	25	LC 28 (2)
20	LC 28 (2)	40	LC 28 (2)
21	LC 28 (3)	25	LC 28 (3)
22	LC 28 (3)	40	LC 28 (3)
23	LC 28 (4)	25	LC 28 (4)
24	LC 28 (4)	40	LC 28 (4)
25	LC 56 (2)	50	LC 56 (2)
26	LC 56 (2)	80	LC 56 (2)
27	LC 56 (3)	50	LC 56 (3)
28	LC 56 (3)	80	LC 56 (3)
29	LC 56 (4)	50	LC 56 (4)
30	LC 56 (4)	80	LC 56 (4)
31	LC 80 (2)	70	LC 80 (2)
32	LC 80 (2)	110	LC 80 (2)
33	LC 80 (3)	70	LC 80 (3)
34	LC 80 (3)	110	LC 80 (3)
35	LC 80 (4)	70	LC 80 (4)
36	LC 80 (4)	110	LC 80 (4)
\.


--
-- Name: cl_tipo_conductor_id_tipoconductor_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.cl_tipo_conductor_id_tipoconductor_seq', 36, true);


--
-- Data for Name: cl_tipo_cruzamiento; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.cl_tipo_cruzamiento (id_tipocruzamiento, tipo_cruzamiento, ref_cruzamiento) FROM stdin;
1	Terreno	T
2	Vial	V
3	Telefónica	TEL
4	Alumbrado Público	AP
5	Alta Tensión	AT
6	Baja Tensión	BT
7	Río	R
8	Renfe/Adif	R/A
\.


--
-- Name: cl_tipo_cruzamiento_id_tipocruzamiento_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.cl_tipo_cruzamiento_id_tipocruzamiento_seq', 8, true);


--
-- Data for Name: cl_tipo_red; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.cl_tipo_red (id_tipo_red, tipo_red) FROM stdin;
2	C.T.C. (Centro transformación caseta)
1	C.T.I. (Centro de transformación intemperie)
3	Alumbrado
\.


--
-- Name: cl_tipo_red_id_tipo_red_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.cl_tipo_red_id_tipo_red_seq', 6, true);


--
-- Name: lv_usuarios_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.lv_usuarios_id_usuario_seq', 1, true);


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Data for Name: vl_apoyo_3857; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.vl_apoyo_3857 (id_apoyo, matricula, num_ap, id_tipoapoyo, orientacion_ap, acometida_bool, acometida_orientacion, luminaria_bool, luminaria_orientacion, id_usuario, fecha, the_geom, orientacion_ap_bool, observaciones, tipoapoyo_otro, tipoapoyo_observ, campo_ap) FROM stdin;
120	123456	3	3	134.460122755081983	t	45	f	0	1	2018-05-21 19:07:49	0101000020110F0000FD572F8F95A929C16E242DF6E7425441	f	\N	\N	\N	\N
119	123456	2	3	122.872217223191498	f	0	f	0	1	2018-05-21 19:07:39	0101000020110F0000429F7D49D3A929C19AEEEC72EC425441	f	\N	\N	\N	\N
122	123456	5	3	168.532085819857997	f	0	f	0	1	2018-05-21 19:09:31	0101000020110F000033CF4E4E90A929C16C4AC796DF425441	f	\N	\N	\N	\N
123	123456	6	4	112.205791139309497	f	0	f	0	1	2018-05-21 20:00:54	0101000020110F00000B4736A92DA929C1F7119045E3425441	f	\N	\N	\N	\N
126	123456	8	3	160.916316835902478	f	0	f	0	1	2018-05-21 20:46:58	0101000020110F0000FE872A68EDA829C1F775F615E0425441	f	\N	\N	\N	\N
121	123456	4	3	135.571932176595993	f	0	t	40	1	2018-05-21 19:08:02	0101000020110F0000EA32192559A929C1113BC68DE5425441	f	\N	\N	\N	\N
118	123456	1	3	124.522596427130992	f	0	f	0	1	2018-05-21 19:07:12	0101000020110F0000103B0E9900AA29C1B6029A7FF0425441	f	\N	\N	\N	\N
124	123456	7	3	251.548777649252997	f	0	f	0	1	2018-05-21 20:15:15	0101000020110F00002334185288A929C17073EC98DC425441	f	\N	\N	\N	\N
128	123456	10	3	300.19601984398696	f	0	f	0	1	2018-05-21 20:48:01	0101000020110F00008C38C7CF10A929C112CB0B7BD8425441	f	\N	\N	\N	\N
127	123456	9	86	276.256436051761	f	0	f	0	1	2018-05-21 20:46:41	0101000020110F00008CEC838C5BA929C10E1416D0E2425441	f	\N	tipo alternativ	caracteristicas	1
\.


--
-- Name: vl_apoyo_3857_id_apoyo_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.vl_apoyo_3857_id_apoyo_seq', 128, true);


--
-- Name: vl_circuito_id_circuito_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.vl_circuito_id_circuito_seq', 10, true);


--
-- Data for Name: vl_conductor_3857; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.vl_conductor_3857 (id_conductor, matricula, id_circuito, id_tipoconductor, tense_obs, id_usuario, fecha, azimut, the_geom, observaciones, longitud) FROM stdin;
81	123456	1	1	\N	1	2018-05-21 19:08:33	123.481340655436	0102000020110F0000020000006A8D563238AA29C1677A5E18F5425441103B0E9900AA29C1B6029A7FF0425441	\N	\N
82	123456	1	1	\N	1	2018-05-21 19:08:48	125.563852198825998	0102000020110F000002000000103B0E9900AA29C1B6029A7FF0425441429F7D49D3A929C19AEEEC72EC425441	\N	\N
83	123456	1	1	\N	1	2018-05-21 19:09:03	120.180582247556998	0102000020110F000002000000429F7D49D3A929C19AEEEC72EC425441FD572F8F95A929C16E242DF6E7425441	\N	\N
84	123456	1	1	\N	1	2018-05-21 19:09:13	107.684392027225996	0102000020110F000002000000FD572F8F95A929C16E242DF6E7425441EA32192559A929C1113BC68DE5425441	\N	\N
85	123456	1	1	\N	1	2018-05-21 19:09:56	175.515393990462996	0102000020110F000002000000FD572F8F95A929C16E242DF6E742544133CF4E4E90A929C16C4AC796DF425441	\N	\N
86	123456	2	1	\N	1	2018-05-21 20:01:20	112.774968450800998	0102000020110F000002000000EA32192559A929C1113BC68DE54254410B4736A92DA929C1F7119045E3425441	\N	\N
90	123456	1	1	\N	1	2018-05-21 20:41:07	161.548777649252997	0102000020110F00000200000033CF4E4E90A929C16C4AC796DF4254412334185288A929C17073EC98DC425441	\N	\N
91	123456	1	1	\N	1	2018-05-21 20:47:32	111.636613827817996	0102000020110F0000020000000B4736A92DA929C1F7119045E3425441FE872A68EDA829C1F775F615E0425441	\N	\N
92	123456	1	3	\N	1	2018-05-21 20:48:18	210.196019843986988	0102000020110F000002000000FE872A68EDA829C1F775F615E04254418C38C7CF10A929C112CB0B7BD8425441	\N	\N
93	123456	1	1	\N	1	2018-05-21 20:52:07	186.256436051761	0102000020110F000002000000EA32192559A929C1113BC68DE54254418CEC838C5BA929C10E1416D0E2425441	\N	\N
\.


--
-- Name: vl_conductor_3857_id_conductor_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.vl_conductor_3857_id_conductor_seq', 93, true);


--
-- Data for Name: vl_cruces_point_3857; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.vl_cruces_point_3857 (id_cruce, id_cruzamiento, id_conductor, the_geom) FROM stdin;
7	6	46	0101000020110F000008F162F487AA29C1B3BB323BE7425441
8	7	81	0101000020110F00002328840517AA29C1EDE4345AF2425441
9	7	81	0101000020110F00002328840517AA29C1EDE4345AF2425441
10	8	81	0101000020110F0000DAD666A225AA29C1980F7E8FF3425441
\.


--
-- Name: vl_cruces_point_3857_id_cruce_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.vl_cruces_point_3857_id_cruce_seq', 10, true);


--
-- Data for Name: vl_cruzamientos_3857; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.vl_cruzamientos_3857 (id_cruzamiento, id_usuario, fecha, matricula, id_circuito, id_tipocruzamiento, resultado, the_geom, alt_circuito, alt_cruzamiento, observaciones) FROM stdin;
1	1	2018-05-18 11:18:47	\N	1	1	\N	0102000020110F000002000000D3F4C7C09E9729C1A63524B7A7405441FF337A963B9929C1953E37A164405441	10	5	\N
7	1	2018-05-21 21:00:15	123456	1	1	4	0102000020110F000002000000E4DE689A0EAA29C16997EC0FF3425441F96C7F1921AA29C1A6EEA980F1425441	4	0	\N
8	1	2018-05-21 21:10:22	123456	1	1	1.10000000000000009	0102000020110F0000020000003672FC081EAA29C1A8F8A255F44254415FF473CF2CAA29C1A9A662D4F2425441	4.25	3.14999999999999991	\N
\.


--
-- Name: vl_cruzamientos_3857_id_cruzamiento_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.vl_cruzamientos_3857_id_cruzamiento_seq', 8, true);


--
-- Data for Name: vl_red_3857; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.vl_red_3857 (matricula, alias, id_usuario, fecha, id_tipo_red, id_cara_lmt, the_geom, orientacion_red, observaciones) FROM stdin;
123456	\N	1	2018-05-21 19:06:43	2	1	0101000020110F00006A8D563238AA29C1677A5E18F5425441	25	\N
\.


--
-- Data for Name: vl_usuarios; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.vl_usuarios (id_usuario, nombre) FROM stdin;
1	Usuario 1
\.


--
-- Data for Name: topology; Type: TABLE DATA; Schema: topology; Owner: postgres
--

COPY topology.topology (id, name, srid, "precision", hasz) FROM stdin;
\.


--
-- Data for Name: layer; Type: TABLE DATA; Schema: topology; Owner: postgres
--

COPY topology.layer (topology_id, layer_id, schema_name, table_name, feature_column, feature_type, level, child_id) FROM stdin;
\.


--
-- Name: cl_cara cl_cara_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.cl_cara
    ADD CONSTRAINT cl_cara_pkey PRIMARY KEY (id_cara);


--
-- Name: cl_tense cl_tense_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.cl_tense
    ADD CONSTRAINT cl_tense_pkey PRIMARY KEY (id_tense);


--
-- Name: cl_tipo_apoyo cl_tipo_apoyo_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.cl_tipo_apoyo
    ADD CONSTRAINT cl_tipo_apoyo_pkey PRIMARY KEY (id_tipoapoyo);


--
-- Name: cl_tipo_conductor cl_tipo_conductor_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.cl_tipo_conductor
    ADD CONSTRAINT cl_tipo_conductor_pkey PRIMARY KEY (id_tipoconductor);


--
-- Name: cl_tipo_cruzamiento cl_tipo_cruzamiento_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.cl_tipo_cruzamiento
    ADD CONSTRAINT cl_tipo_cruzamiento_pkey PRIMARY KEY (id_tipocruzamiento);


--
-- Name: cl_tipo_red cl_tipo_red_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.cl_tipo_red
    ADD CONSTRAINT cl_tipo_red_pkey PRIMARY KEY (id_tipo_red);


--
-- Name: vl_red_3857 lv_red_pkey2; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.vl_red_3857
    ADD CONSTRAINT lv_red_pkey2 PRIMARY KEY (matricula);


--
-- Name: vl_usuarios lv_usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.vl_usuarios
    ADD CONSTRAINT lv_usuarios_pkey PRIMARY KEY (id_usuario);


--
-- Name: vl_apoyo_3857 vl_apoyo_pk2; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.vl_apoyo_3857
    ADD CONSTRAINT vl_apoyo_pk2 PRIMARY KEY (id_apoyo);


--
-- Name: cl_circuito vl_circuito_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.cl_circuito
    ADD CONSTRAINT vl_circuito_pkey PRIMARY KEY (id_circuito);


--
-- Name: vl_conductor_3857 vl_conductor_pkey2; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.vl_conductor_3857
    ADD CONSTRAINT vl_conductor_pkey2 PRIMARY KEY (matricula, id_circuito, id_conductor);


--
-- Name: vl_cruces_point_3857 vl_cruce_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.vl_cruces_point_3857
    ADD CONSTRAINT vl_cruce_pkey PRIMARY KEY (id_cruce);


--
-- Name: vl_cruzamientos_3857 vl_cruzamiento_pkey2; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.vl_cruzamientos_3857
    ADD CONSTRAINT vl_cruzamiento_pkey2 PRIMARY KEY (id_cruzamiento);


--
-- Name: cl_tipo_apoyo__id_tipoapoyo; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX cl_tipo_apoyo__id_tipoapoyo ON public.cl_tipo_apoyo USING btree (id_tipoapoyo);


--
-- Name: cl_tipo_conductor__id_tipoapoyo; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX cl_tipo_conductor__id_tipoapoyo ON public.cl_tipo_conductor USING btree (id_tipoconductor);


--
-- Name: cl_tipo_cruzamiento__id_tipocruzamiento; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX cl_tipo_cruzamiento__id_tipocruzamiento ON public.cl_tipo_cruzamiento USING btree (id_tipocruzamiento);


--
-- Name: cl_tipo_red__id_tipored; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX cl_tipo_red__id_tipored ON public.cl_tipo_red USING btree (id_tipo_red);


--
-- Name: vl_apoyo_3857__id_tipoapoyo; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX vl_apoyo_3857__id_tipoapoyo ON public.vl_apoyo_3857 USING btree (id_tipoapoyo);


--
-- Name: vl_apoyo_3857__id_usuario; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX vl_apoyo_3857__id_usuario ON public.vl_apoyo_3857 USING btree (id_usuario);


--
-- Name: vl_apoyo_3857__matricula; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX vl_apoyo_3857__matricula ON public.vl_apoyo_3857 USING btree (matricula);


--
-- Name: vl_conductor_3857__id_tipoconductor; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX vl_conductor_3857__id_tipoconductor ON public.vl_conductor_3857 USING btree (id_tipoconductor);


--
-- Name: vl_conductor_3857__id_usuario; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX vl_conductor_3857__id_usuario ON public.vl_conductor_3857 USING btree (id_usuario);


--
-- Name: vl_conductor_3857__matricula; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX vl_conductor_3857__matricula ON public.vl_conductor_3857 USING btree (matricula);


--
-- Name: vl_cruzamientos_3857__id_tipocruzamiento; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX vl_cruzamientos_3857__id_tipocruzamiento ON public.vl_cruzamientos_3857 USING btree (id_tipocruzamiento);


--
-- Name: vl_cruzamientos_3857__id_usuario; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX vl_cruzamientos_3857__id_usuario ON public.vl_cruzamientos_3857 USING btree (id_usuario);


--
-- Name: vl_cruzamientos_3857__matricula; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX vl_cruzamientos_3857__matricula ON public.vl_cruzamientos_3857 USING btree (matricula);


--
-- Name: vl_red_3857__id_tipo_red; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX vl_red_3857__id_tipo_red ON public.vl_red_3857 USING btree (id_tipo_red);


--
-- Name: vl_red_3857__id_usuario; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX vl_red_3857__id_usuario ON public.vl_red_3857 USING btree (id_usuario);


--
-- Name: vl_red_3857__matricula; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX vl_red_3857__matricula ON public.vl_red_3857 USING btree (matricula);


--
-- Name: vl_usuarios__id_usuario; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX vl_usuarios__id_usuario ON public.vl_usuarios USING btree (id_usuario);


--
-- Name: cl_tipo_apoyo trigger_tipo_apoyo; Type: TRIGGER; Schema: public; Owner: admin
--

CREATE TRIGGER trigger_tipo_apoyo BEFORE INSERT ON public.cl_tipo_apoyo FOR EACH ROW EXECUTE PROCEDURE public.actualizar_cl_tipoapoyo();


--
-- Name: vl_apoyo_3857 vl_apoyo_trigger; Type: TRIGGER; Schema: public; Owner: admin
--

CREATE TRIGGER vl_apoyo_trigger AFTER INSERT ON public.vl_apoyo_3857 FOR EACH ROW EXECUTE PROCEDURE public.actualizar_vl_apoyo2();


--
-- Name: vl_conductor_3857 vl_conductor_trigger; Type: TRIGGER; Schema: public; Owner: admin
--

CREATE TRIGGER vl_conductor_trigger AFTER INSERT ON public.vl_conductor_3857 FOR EACH ROW EXECUTE PROCEDURE public.actualizar_vl_apoyo1();


--
-- Name: vl_cruzamientos_3857 vl_cruzamientos_trigger_after; Type: TRIGGER; Schema: public; Owner: admin
--

CREATE TRIGGER vl_cruzamientos_trigger_after AFTER INSERT ON public.vl_cruzamientos_3857 FOR EACH ROW EXECUTE PROCEDURE public.actualizar_vl_cruzamientos_after();


--
-- Name: vl_cruzamientos_3857 vl_cruzamientos_trigger_before; Type: TRIGGER; Schema: public; Owner: admin
--

CREATE TRIGGER vl_cruzamientos_trigger_before BEFORE INSERT ON public.vl_cruzamientos_3857 FOR EACH ROW EXECUTE PROCEDURE public.actualizar_vl_cruzamientos_before();


--
-- Name: vl_apoyo_3857 apoyo_tipo_fkey2; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.vl_apoyo_3857
    ADD CONSTRAINT apoyo_tipo_fkey2 FOREIGN KEY (id_tipoapoyo) REFERENCES public.cl_tipo_apoyo(id_tipoapoyo) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: vl_conductor_3857 conductor_cicuito_fkey2; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.vl_conductor_3857
    ADD CONSTRAINT conductor_cicuito_fkey2 FOREIGN KEY (id_circuito) REFERENCES public.cl_circuito(id_circuito) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: vl_conductor_3857 conductor_tipocicuito_fkey2; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.vl_conductor_3857
    ADD CONSTRAINT conductor_tipocicuito_fkey2 FOREIGN KEY (id_tipoconductor) REFERENCES public.cl_tipo_conductor(id_tipoconductor) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: vl_conductor_3857 conductor_usuario_fkey2; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.vl_conductor_3857
    ADD CONSTRAINT conductor_usuario_fkey2 FOREIGN KEY (id_usuario) REFERENCES public.vl_usuarios(id_usuario) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: vl_cruzamientos_3857 cruzamiento_usuario_fkey2; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.vl_cruzamientos_3857
    ADD CONSTRAINT cruzamiento_usuario_fkey2 FOREIGN KEY (id_usuario) REFERENCES public.vl_usuarios(id_usuario) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: vl_red_3857 red_cara_fk2; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.vl_red_3857
    ADD CONSTRAINT red_cara_fk2 FOREIGN KEY (id_cara_lmt) REFERENCES public.cl_cara(id_cara) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: vl_red_3857 red_user_fkey3; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.vl_red_3857
    ADD CONSTRAINT red_user_fkey3 FOREIGN KEY (id_usuario) REFERENCES public.vl_usuarios(id_usuario) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: vl_red_3857 tipored_fk3; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.vl_red_3857
    ADD CONSTRAINT tipored_fk3 FOREIGN KEY (id_tipo_red) REFERENCES public.cl_tipo_red(id_tipo_red) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: admin
--

GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

