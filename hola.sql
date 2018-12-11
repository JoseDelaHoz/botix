--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.5

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


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: apicultores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.apicultores (
    id integer NOT NULL,
    nombre text,
    rut text,
    nick text,
    custom json,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.apicultores OWNER TO postgres;

--
-- Name: apicultores_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.apicultores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apicultores_id_seq OWNER TO postgres;

--
-- Name: apicultores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.apicultores_id_seq OWNED BY public.apicultores.id;


--
-- Name: apicultores_usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.apicultores_usuarios (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    apicultor_id integer NOT NULL,
    usuario_id integer NOT NULL
);


ALTER TABLE public.apicultores_usuarios OWNER TO postgres;

--
-- Name: colmenas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.colmenas (
    id integer NOT NULL,
    color text,
    serie text,
    ubicacion public.geometry,
    custom json,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    apicultor_id integer,
    predio_id integer
);


ALTER TABLE public.colmenas OWNER TO postgres;

--
-- Name: colmenas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.colmenas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.colmenas_id_seq OWNER TO postgres;

--
-- Name: colmenas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.colmenas_id_seq OWNED BY public.colmenas.id;


--
-- Name: conexiones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.conexiones (
    id integer NOT NULL,
    ip text,
    tx integer,
    data text,
    info json,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    nodo_id integer,
    predio_id integer
);


ALTER TABLE public.conexiones OWNER TO postgres;

--
-- Name: conexiones_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.conexiones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.conexiones_id_seq OWNER TO postgres;

--
-- Name: conexiones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.conexiones_id_seq OWNED BY public.conexiones.id;


--
-- Name: grupos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.grupos (
    id integer NOT NULL,
    nombre text,
    custom json,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    rol_id integer,
    plan_id integer
);


ALTER TABLE public.grupos OWNER TO postgres;

--
-- Name: grupos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.grupos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.grupos_id_seq OWNER TO postgres;

--
-- Name: grupos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.grupos_id_seq OWNED BY public.grupos.id;


--
-- Name: grupos_predios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.grupos_predios (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    grupo_id integer NOT NULL,
    predio_id integer NOT NULL
);


ALTER TABLE public.grupos_predios OWNER TO postgres;

--
-- Name: nodos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nodos (
    id integer NOT NULL,
    microcontrolador text,
    mac text,
    imei double precision,
    enable boolean,
    online boolean,
    configuracion json,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    colmena_id integer,
    sim_id integer,
    version_id integer
);


ALTER TABLE public.nodos OWNER TO postgres;

--
-- Name: nodos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.nodos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nodos_id_seq OWNER TO postgres;

--
-- Name: nodos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.nodos_id_seq OWNED BY public.nodos.id;


--
-- Name: nodos_sensores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nodos_sensores (
    id integer NOT NULL,
    pinout json,
    custom json,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    nodo_id integer,
    sensor_id integer
);


ALTER TABLE public.nodos_sensores OWNER TO postgres;

--
-- Name: nodos_sensores_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.nodos_sensores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nodos_sensores_id_seq OWNER TO postgres;

--
-- Name: nodos_sensores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.nodos_sensores_id_seq OWNED BY public.nodos_sensores.id;


--
-- Name: operadores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.operadores (
    id integer NOT NULL,
    nombre text,
    "MCC" integer,
    "MNC" integer,
    bandas json,
    cobertura public.geometry,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.operadores OWNER TO postgres;

--
-- Name: operadores_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.operadores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.operadores_id_seq OWNER TO postgres;

--
-- Name: operadores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.operadores_id_seq OWNED BY public.operadores.id;


--
-- Name: planes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.planes (
    id integer NOT NULL,
    plan text,
    precio integer,
    custom json,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.planes OWNER TO postgres;

--
-- Name: planes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.planes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planes_id_seq OWNER TO postgres;

--
-- Name: planes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.planes_id_seq OWNED BY public.planes.id;


--
-- Name: predios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.predios (
    id integer NOT NULL,
    nombre text,
    codigo text,
    localidad text,
    ubicacion public.geometry,
    limites public.geometry,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.predios OWNER TO postgres;

--
-- Name: predios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.predios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.predios_id_seq OWNER TO postgres;

--
-- Name: predios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.predios_id_seq OWNED BY public.predios.id;


--
-- Name: registros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.registros (
    id integer NOT NULL,
    valor integer,
    hora timestamp with time zone,
    custom json,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    utilidad_id integer,
    nodo_id integer,
    predio_id integer,
    nodo_sensor_id integer
);


ALTER TABLE public.registros OWNER TO postgres;

--
-- Name: registros_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.registros_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.registros_id_seq OWNER TO postgres;

--
-- Name: registros_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.registros_id_seq OWNED BY public.registros.id;


--
-- Name: reportes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reportes (
    id integer NOT NULL,
    asunto text,
    mensaje text,
    whatstapp boolean,
    email boolean,
    telegram boolean,
    sms boolean,
    web boolean,
    app boolean,
    custom text,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    usuario_id integer
);


ALTER TABLE public.reportes OWNER TO postgres;

--
-- Name: reportes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reportes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reportes_id_seq OWNER TO postgres;

--
-- Name: reportes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reportes_id_seq OWNED BY public.reportes.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    roles text,
    custom json,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: roles_usuarios_grupos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles_usuarios_grupos (
    id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    grupo_id integer,
    usuario_id integer,
    rol_id integer
);


ALTER TABLE public.roles_usuarios_grupos OWNER TO postgres;

--
-- Name: roles_usuarios_grupos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_usuarios_grupos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_usuarios_grupos_id_seq OWNER TO postgres;

--
-- Name: roles_usuarios_grupos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_usuarios_grupos_id_seq OWNED BY public.roles_usuarios_grupos.id;


--
-- Name: sensores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sensores (
    id integer NOT NULL,
    nombre text,
    descripcion text,
    custom json,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.sensores OWNER TO postgres;

--
-- Name: sensores_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sensores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sensores_id_seq OWNER TO postgres;

--
-- Name: sensores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sensores_id_seq OWNED BY public.sensores.id;


--
-- Name: sensores_utilidades; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sensores_utilidades (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    sensor_id integer NOT NULL,
    utilidad_id integer NOT NULL
);


ALTER TABLE public.sensores_utilidades OWNER TO postgres;

--
-- Name: sims; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sims (
    id integer NOT NULL,
    "ICCID" text,
    numero double precision,
    dueno integer,
    estado integer,
    plan json,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    operador_id integer
);


ALTER TABLE public.sims OWNER TO postgres;

--
-- Name: sims_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sims_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sims_id_seq OWNER TO postgres;

--
-- Name: sims_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sims_id_seq OWNED BY public.sims.id;


--
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    id integer NOT NULL,
    nombres text,
    apellidos text,
    rut text,
    passwd text,
    email text,
    telefono text,
    enable boolean,
    custom json,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    rol_id integer
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuarios_id_seq OWNER TO postgres;

--
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;


--
-- Name: utilidades; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.utilidades (
    id integer NOT NULL,
    utilidad text,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.utilidades OWNER TO postgres;

--
-- Name: utilidades_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.utilidades_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.utilidades_id_seq OWNER TO postgres;

--
-- Name: utilidades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.utilidades_id_seq OWNED BY public.utilidades.id;


--
-- Name: versiones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.versiones (
    id integer NOT NULL,
    version text,
    revision text,
    custom json,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.versiones OWNER TO postgres;

--
-- Name: versiones_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.versiones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.versiones_id_seq OWNER TO postgres;

--
-- Name: versiones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.versiones_id_seq OWNED BY public.versiones.id;


--
-- Name: apicultores id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.apicultores ALTER COLUMN id SET DEFAULT nextval('public.apicultores_id_seq'::regclass);


--
-- Name: colmenas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colmenas ALTER COLUMN id SET DEFAULT nextval('public.colmenas_id_seq'::regclass);


--
-- Name: conexiones id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conexiones ALTER COLUMN id SET DEFAULT nextval('public.conexiones_id_seq'::regclass);


--
-- Name: grupos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grupos ALTER COLUMN id SET DEFAULT nextval('public.grupos_id_seq'::regclass);


--
-- Name: nodos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nodos ALTER COLUMN id SET DEFAULT nextval('public.nodos_id_seq'::regclass);


--
-- Name: nodos_sensores id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nodos_sensores ALTER COLUMN id SET DEFAULT nextval('public.nodos_sensores_id_seq'::regclass);


--
-- Name: operadores id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.operadores ALTER COLUMN id SET DEFAULT nextval('public.operadores_id_seq'::regclass);


--
-- Name: planes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planes ALTER COLUMN id SET DEFAULT nextval('public.planes_id_seq'::regclass);


--
-- Name: predios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.predios ALTER COLUMN id SET DEFAULT nextval('public.predios_id_seq'::regclass);


--
-- Name: registros id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registros ALTER COLUMN id SET DEFAULT nextval('public.registros_id_seq'::regclass);


--
-- Name: reportes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reportes ALTER COLUMN id SET DEFAULT nextval('public.reportes_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: roles_usuarios_grupos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles_usuarios_grupos ALTER COLUMN id SET DEFAULT nextval('public.roles_usuarios_grupos_id_seq'::regclass);


--
-- Name: sensores id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sensores ALTER COLUMN id SET DEFAULT nextval('public.sensores_id_seq'::regclass);


--
-- Name: sims id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sims ALTER COLUMN id SET DEFAULT nextval('public.sims_id_seq'::regclass);


--
-- Name: usuarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);


--
-- Name: utilidades id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilidades ALTER COLUMN id SET DEFAULT nextval('public.utilidades_id_seq'::regclass);


--
-- Name: versiones id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.versiones ALTER COLUMN id SET DEFAULT nextval('public.versiones_id_seq'::regclass);


--
-- Data for Name: apicultores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.apicultores (id, nombre, rut, nick, custom, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: apicultores_usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.apicultores_usuarios ("createdAt", "updatedAt", apicultor_id, usuario_id) FROM stdin;
\.


--
-- Data for Name: colmenas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.colmenas (id, color, serie, ubicacion, custom, "createdAt", "updatedAt", apicultor_id, predio_id) FROM stdin;
1	Morada	538	0101000000551344DD07E551C004A9143B1AAF41C0	\N	2018-08-25 16:39:45.516-03	2018-08-25 16:39:45.516-03	\N	1
2	N/A	539	0101000000551344DD07E551C004A9143B1AAF41C0	\N	2018-08-25 16:39:45.535-03	2018-08-25 16:39:45.535-03	\N	1
3	N/A	540	0101000000551344DD07E551C004A9143B1AAF41C0	\N	2018-08-25 16:39:45.539-03	2018-08-25 16:39:45.539-03	\N	1
4	N/A	541	0101000000551344DD07E551C004A9143B1AAF41C0	\N	2018-08-25 16:39:45.541-03	2018-08-25 16:39:45.541-03	\N	1
5	N/A	542	0101000000551344DD07E551C004A9143B1AAF41C0	\N	2018-08-25 16:39:45.544-03	2018-08-25 16:39:45.544-03	\N	1
\.


--
-- Data for Name: conexiones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.conexiones (id, ip, tx, data, info, "createdAt", "updatedAt", nodo_id, predio_id) FROM stdin;
3	181.43.0.111	1	\N	\N	2018-08-28 02:41:55.078-03	2018-08-28 02:41:55.078-03	1	1
4	181.43.0.111	1	1	\N	2018-08-28 02:44:15.964-03	2018-08-28 02:44:15.964-03	1	1
5	181.43.0.111	1		\N	2018-08-28 02:44:30.278-03	2018-08-28 02:44:30.278-03	1	1
6	181.43.0.111	1	oka	\N	2018-08-28 02:44:43.57-03	2018-08-28 02:44:43.57-03	1	1
7	181.43.0.111	1		\N	2018-08-28 02:54:21.654-03	2018-08-28 02:54:21.654-03	1	1
8	181.43.0.111	1		\N	2018-08-28 02:55:23.208-03	2018-08-28 02:55:23.208-03	1	1
9	181.43.0.111	1		\N	2018-08-28 02:55:36.962-03	2018-08-28 02:55:36.962-03	1	1
10	181.43.0.111	1		\N	2018-08-28 02:56:01.117-03	2018-08-28 02:56:01.117-03	1	1
11	181.43.0.111	1		\N	2018-08-28 02:56:23.673-03	2018-08-28 02:56:23.673-03	1	1
12	181.43.0.111	1		\N	2018-08-28 02:56:29.55-03	2018-08-28 02:56:29.55-03	1	1
13	181.43.0.111	1		\N	2018-08-28 02:57:04.976-03	2018-08-28 02:57:04.976-03	1	1
14	181.43.0.111	1	hola que tal soy el chico de las fantasias	\N	2018-08-28 03:05:07.135-03	2018-08-28 03:05:07.135-03	1	1
15	181.43.0.111	1		\N	2018-08-28 13:41:45.984-03	2018-08-28 13:41:45.984-03	1	1
16	181.43.0.111	1		\N	2018-08-28 13:46:08.793-03	2018-08-28 13:46:08.793-03	1	1
17	181.43.0.111	1		\N	2018-08-28 13:47:12.677-03	2018-08-28 13:47:12.677-03	1	1
18	181.43.0.111	2		\N	2018-08-28 13:49:07.403-03	2018-08-28 13:49:07.403-03	1	1
19	181.43.0.111	2		\N	2018-08-28 13:51:43.502-03	2018-08-28 13:51:43.502-03	1	1
20	181.43.0.111	2		\N	2018-08-28 13:53:52.712-03	2018-08-28 13:53:52.712-03	1	1
21	181.43.0.111	1		\N	2018-08-28 16:09:01.55-03	2018-08-28 16:09:01.55-03	6	1
22	181.43.0.111	1		\N	2018-08-28 16:09:21.974-03	2018-08-28 16:09:21.974-03	6	1
23	181.43.0.111	1		\N	2018-08-28 16:09:27.557-03	2018-08-28 16:09:27.557-03	6	1
24	181.43.0.111	2	0	\N	2018-08-28 16:09:32.592-03	2018-08-28 16:09:32.592-03	6	1
25	181.43.0.111	2	\\0�z7	\N	2018-08-28 16:14:09.363-03	2018-08-28 16:14:09.363-03	6	1
26	181.43.0.111	2	\\0�z7	\N	2018-08-28 16:16:04.348-03	2018-08-28 16:16:04.348-03	6	1
27	181.43.0.111	2	\\0�z7	\N	2018-08-28 16:18:13.051-03	2018-08-28 16:18:13.051-03	6	1
28	181.43.0.111	2	\\0�z7	\N	2018-08-28 16:18:27.88-03	2018-08-28 16:18:27.88-03	6	1
29	181.43.0.111	2	\\0�z7	\N	2018-08-28 16:20:10.058-03	2018-08-28 16:20:10.058-03	6	1
30	181.43.0.111	2	\\0�z7	\N	2018-08-28 16:21:51.649-03	2018-08-28 16:21:51.649-03	6	1
31	181.43.0.111	2	\\0�z7	\N	2018-08-28 16:22:36.435-03	2018-08-28 16:22:36.435-03	6	1
32	181.43.0.111	2	\\0�z7	\N	2018-08-28 16:22:46.745-03	2018-08-28 16:22:46.745-03	6	1
33	181.43.0.111	2	\\0�z7	\N	2018-08-28 16:22:53.503-03	2018-08-28 16:22:53.503-03	6	1
34	181.43.0.111	2	\\0�z7	\N	2018-08-28 16:23:04.383-03	2018-08-28 16:23:04.383-03	6	1
35	181.43.0.111	2	\\0�z7	\N	2018-08-28 16:25:16.22-03	2018-08-28 16:25:16.22-03	6	1
36	181.43.0.111	2	\\0�z7	\N	2018-08-28 16:25:32.081-03	2018-08-28 16:25:32.081-03	6	1
37	181.43.0.111	2	\\0�z7	\N	2018-08-28 16:25:58.315-03	2018-08-28 16:25:58.315-03	6	1
38	181.43.0.111	2	\\0�z7	\N	2018-08-28 16:26:32.801-03	2018-08-28 16:26:32.801-03	6	1
39	181.43.0.111	2	\\0�z7	\N	2018-08-28 16:26:47.959-03	2018-08-28 16:26:47.959-03	6	1
40	181.43.0.111	2	\\0�z7	\N	2018-08-28 16:26:55.343-03	2018-08-28 16:26:55.343-03	6	1
41	181.43.0.111	2	\\0�z7	\N	2018-08-28 16:27:12.835-03	2018-08-28 16:27:12.835-03	6	1
42	181.43.0.111	2	\\0�z7	\N	2018-08-28 16:28:05.028-03	2018-08-28 16:28:05.028-03	6	1
43	181.43.0.111	2	\\0�z7	\N	2018-08-28 16:28:16.057-03	2018-08-28 16:28:16.057-03	6	1
44	181.43.0.111	2	\\0�z7	\N	2018-08-28 16:28:19.007-03	2018-08-28 16:28:19.007-03	6	1
45	181.43.0.111	2	\\0�z7	\N	2018-08-28 16:28:35.137-03	2018-08-28 16:28:35.137-03	6	1
46	181.43.0.111	2	\\0�z7	\N	2018-08-28 16:29:14.581-03	2018-08-28 16:29:14.581-03	6	1
47	181.43.0.111	2	\\0�z7	\N	2018-08-28 16:29:36.703-03	2018-08-28 16:29:36.703-03	6	1
48	181.43.0.111	2	\\0�z7	\N	2018-08-28 16:29:54.029-03	2018-08-28 16:29:54.029-03	6	1
49	181.43.0.111	2	\\0�z7	\N	2018-08-28 16:31:54.575-03	2018-08-28 16:31:54.575-03	6	1
50	181.43.0.111	2	\\x3330616561343862326132383200b2017a063714	\N	2018-08-28 16:32:29.892-03	2018-08-28 16:32:29.892-03	6	1
51	181.43.0.111	2	\\0�z7	\N	2018-08-28 16:34:18.232-03	2018-08-28 16:34:18.232-03	6	1
52	181.43.0.111	2	\\0�z7	\N	2018-08-28 16:34:41.398-03	2018-08-28 16:34:41.398-03	6	1
53	181.43.0.111	2	\\x3330616561343862326132383200b2017a063714	\N	2018-08-28 16:36:08.134-03	2018-08-28 16:36:08.134-03	6	1
54	181.43.0.111	2	\\x3330616561343862326132383200b2017a063714	\N	2018-08-28 16:36:19.598-03	2018-08-28 16:36:19.598-03	6	1
55	181.43.0.111	2	\\x3330616561343862326132383200b2017a063714	\N	2018-08-28 16:36:25.813-03	2018-08-28 16:36:25.813-03	6	1
56	181.43.0.111	2	\\x3330616561343862326132383200b2017a063714	\N	2018-08-28 16:36:49.052-03	2018-08-28 16:36:49.052-03	6	1
57	181.43.0.111	2	\\x3330616561343862326132383200b2017a063714	\N	2018-08-28 16:36:57.28-03	2018-08-28 16:36:57.28-03	6	1
58	181.43.0.111	2	\\x3330616561343862326132383200b2017a063714	\N	2018-08-28 16:37:34.934-03	2018-08-28 16:37:34.934-03	6	1
59	181.43.0.111	2	\\x3330616561343862326132383200b2017a063714	\N	2018-08-28 16:37:51.342-03	2018-08-28 16:37:51.342-03	6	1
60	181.43.0.111	2	\\x3330616561343862326132383200b2017a063714	\N	2018-08-28 16:38:11.06-03	2018-08-28 16:38:11.06-03	6	1
61	181.43.0.111	2	\\x3330616561343862326132383200b2017a063714	\N	2018-08-28 16:42:02.041-03	2018-08-28 16:42:02.041-03	6	1
62	181.43.0.111	2	\\x3330616561343862326132383200b2017a063714	\N	2018-08-28 16:53:40.086-03	2018-08-28 16:53:40.086-03	6	1
63	181.43.0.111	1	\\x33306165613438623261323831	\N	2018-08-28 17:21:41.85-03	2018-08-28 17:21:41.85-03	6	1
64	181.43.0.111	1	\\x33306165613438623261323831	\N	2018-08-28 17:30:34.934-03	2018-08-28 17:30:34.934-03	6	1
65	181.43.0.111	1	\\x33306165613438623261323831	\N	2018-08-28 17:37:44.077-03	2018-08-28 17:37:44.077-03	6	1
66	181.43.0.111	1	\\x33306165613438623261323831	\N	2018-08-28 17:44:56.41-03	2018-08-28 17:44:56.41-03	6	1
67	181.43.0.111	1	\\x33306165613438623261323831	\N	2018-08-28 17:55:05.088-03	2018-08-28 17:55:05.088-03	6	1
68	181.43.0.111	1	\\x33306165613438623261323831	\N	2018-08-28 18:01:20.725-03	2018-08-28 18:01:20.725-03	6	1
69	181.43.0.111	1	\\x33306165613438623261323831	\N	2018-08-28 18:04:07.551-03	2018-08-28 18:04:07.551-03	6	1
70	181.43.0.111	1	\\x33306165613438623261323831	\N	2018-08-28 18:08:29.336-03	2018-08-28 18:08:29.336-03	6	1
71	181.43.0.111	1	\\x33306165613438623261323831	\N	2018-08-28 18:37:01.34-03	2018-08-28 18:37:01.34-03	6	1
72	181.43.0.111	1	\\x33306165613438623261323831	\N	2018-08-28 18:37:47.85-03	2018-08-28 18:37:47.85-03	6	1
73	181.43.0.111	1	\\x33306165613438623261323831	\N	2018-08-28 18:38:34.95-03	2018-08-28 18:38:34.95-03	6	1
74	181.43.0.111	1	\\x33306165613438623261323831	\N	2018-08-28 18:39:59.246-03	2018-08-28 18:39:59.246-03	6	1
75	181.43.0.111	1	\\x33306165613438623261323831	\N	2018-08-28 18:46:22.967-03	2018-08-28 18:46:22.967-03	6	1
76	181.43.0.111	2	\\x3330616561343862326132383200850295000670370000000000000595	\N	2018-08-28 19:24:38.858-03	2018-08-28 19:24:38.858-03	6	1
77	181.43.0.111	2	\\x33306165613438623261323832007c02a90006706c0000000023185e4a	\N	2018-08-28 19:25:53.67-03	2018-08-28 19:25:53.67-03	6	1
78	181.43.0.111	2	\\x33306165613438623261323832007c02af000672530000000023185eb8	\N	2018-08-28 19:27:54.494-03	2018-08-28 19:27:54.494-03	6	1
79	181.43.0.111	2	\\x33306165613438623261323832007b02ad000677090000000023185f38	\N	2018-08-28 19:29:55.335-03	2018-08-28 19:29:55.335-03	6	1
80	181.43.0.111	2	\\x33306165613438623261323832007b02bd000677dd0000000023185fb8	\N	2018-08-28 19:31:56.167-03	2018-08-28 19:31:56.167-03	6	1
81	181.43.0.111	2	\\x33306165613438623261323832007c02db000679970000000023186038	\N	2018-08-28 19:33:56.988-03	2018-08-28 19:33:56.988-03	6	1
82	181.43.0.111	2	\\x33306165613438623261323832007b02ba00067b5a00000000231860b8	\N	2018-08-28 19:36:01.007-03	2018-08-28 19:36:01.007-03	6	1
83	181.43.0.111	2	\\x33306165613438623261323832007b02b100067f1800000000231860f8	\N	2018-08-28 19:38:01.83-03	2018-08-28 19:38:01.83-03	6	1
84	181.43.0.111	2	\\x33306165613438623261323832007a02b2000680fb0000000023186178	\N	2018-08-28 19:40:02.659-03	2018-08-28 19:40:02.659-03	6	1
85	181.43.0.111	2	\\x33306165613438623261323832007902c1000684e100000000231861f8	\N	2018-08-28 19:42:05.154-03	2018-08-28 19:42:05.154-03	6	1
86	181.43.0.111	2	\\x33306165613438623261323832007902ce000686e20000000023186278	\N	2018-08-28 19:44:05.978-03	2018-08-28 19:44:05.978-03	6	1
87	181.43.0.111	2	\\x33306165613438623261323832007802bb00068bde00000000231862f8	\N	2018-08-28 19:46:06.798-03	2018-08-28 19:46:06.798-03	6	1
88	181.43.0.111	2	\\x33306165613438623261323832007902ca00068a340000000023186378	\N	2018-08-28 19:48:08.561-03	2018-08-28 19:48:08.561-03	6	1
89	181.43.0.111	2	\\x33306165613438623261323832007802cb00068c3700000000231863f8	\N	2018-08-28 19:50:09.38-03	2018-08-28 19:50:09.38-03	6	1
90	181.43.0.111	2	\\x33306165613438623261323832007802d800068f8a0000000023186438	\N	2018-08-28 19:52:10.199-03	2018-08-28 19:52:10.199-03	6	1
91	181.43.0.111	2	\\x33306165613438623261323832007902cf0006923f00000000231864b8	\N	2018-08-28 19:54:11.033-03	2018-08-28 19:54:11.033-03	6	1
92	181.43.0.111	2	\\x33306165613438623261323832007902c7000695570000000023186538	\N	2018-08-28 19:56:11.857-03	2018-08-28 19:56:11.857-03	6	1
93	181.43.0.111	2	\\x33306165613438623261323832007702da0006960a00000000231865f8	\N	2018-08-28 19:58:12.677-03	2018-08-28 19:58:12.677-03	6	1
94	181.43.0.111	2	\\x33306165613438623261323832007602d100069a4a0000000023186678	\N	2018-08-28 20:00:13.888-03	2018-08-28 20:00:13.888-03	6	1
95	181.43.0.111	2	\\x33306165613438623261323832007502ea00069d6f00000000231866f8	\N	2018-08-28 20:02:14.709-03	2018-08-28 20:02:14.709-03	6	1
96	181.43.0.111	2	\\x33306165613438623261323832007502d500069e880000000023186738	\N	2018-08-28 20:04:15.531-03	2018-08-28 20:04:15.531-03	6	1
97	181.43.0.111	2	\\x33306165613438623261323832005403bc0008369c0000000000000004	\N	2018-08-28 23:29:07.343-03	2018-08-28 23:29:07.343-03	6	1
98	181.43.0.111	2	\\x33306165613438623261323832005303b800075ed70000000000000004	\N	2018-08-28 23:29:29.431-03	2018-08-28 23:29:29.431-03	6	1
99	181.43.0.111	2	\\x33306165613438623261323832005303b8000754990000000000000004	\N	2018-08-28 23:29:55.941-03	2018-08-28 23:29:55.941-03	6	1
100	181.43.0.111	1	\\x33306165613438623261323831	\N	2018-08-28 23:38:45.673-03	2018-08-28 23:38:45.673-03	6	1
101	181.43.0.111	2	\\x33306165613438623261323832005403c7000733890000000023189980	\N	2018-08-28 23:38:46.066-03	2018-08-28 23:38:46.066-03	6	1
102	181.43.0.111	1	\\x33306165613438623261323831	\N	2018-08-28 23:38:54.082-03	2018-08-28 23:38:54.082-03	6	1
103	181.43.0.111	2	\\x33306165613438623261323832005503c4000733930000000023189980	\N	2018-08-28 23:38:54.474-03	2018-08-28 23:38:54.474-03	6	1
104	181.43.0.111	2	\\x33306165613438623261323832005403c40007343300000000231899f8	\N	2018-08-28 23:40:55.296-03	2018-08-28 23:40:55.296-03	6	1
105	181.43.0.111	2	\\x33306165613438623261323832005503ca000740bd0000000023189a78	\N	2018-08-28 23:42:56.118-03	2018-08-28 23:42:56.118-03	6	1
106	181.43.0.111	1	\\x33306165613438623261323831	\N	2018-08-29 00:23:31.172-03	2018-08-29 00:23:31.172-03	6	1
107	181.43.0.111	2	\\x33306165613438623261323832006203e1000756c6000000002318a400	\N	2018-08-29 00:23:31.559-03	2018-08-29 00:23:31.559-03	6	1
108	181.43.0.111	2	\\x33306165613438623261323832005103db00077213000000002318b122	\N	2018-08-29 01:19:35.038-03	2018-08-29 01:19:35.038-03	6	1
109	192.168.7.172	2	\\x33306165613438623261323832004903e70007759f000000002318b3a3	\N	2018-08-29 01:51:34.48-03	2018-08-29 01:51:34.48-03	6	1
110	192.168.7.172	1	\\x33306165613438623261323831	\N	2018-08-29 01:51:34.491-03	2018-08-29 01:51:34.491-03	6	1
111	192.168.7.172	1	\\x33306165613438623261323831	\N	2018-08-29 01:51:34.5-03	2018-08-29 01:51:34.5-03	6	1
112	192.168.7.172	2	\\x33306165613438623261323832004903e70007759f000000002318b3a3	\N	2018-08-29 01:51:51.114-03	2018-08-29 01:51:51.114-03	6	1
113	192.168.7.172	1	\\x33306165613438623261323831	\N	2018-08-29 01:51:51.12-03	2018-08-29 01:51:51.12-03	6	1
114	192.168.7.172	1	\\x33306165613438623261323831	\N	2018-08-29 01:51:51.126-03	2018-08-29 01:51:51.126-03	6	1
115	192.168.7.172	2	\\x33306165613438623261323832004903e70007759f000000002318b3a3	\N	2018-08-29 01:57:47.344-03	2018-08-29 01:57:47.344-03	6	1
116	192.168.7.172	1	\\x33306165613438623261323831	\N	2018-08-29 01:57:47.356-03	2018-08-29 01:57:47.356-03	6	1
117	192.168.7.172	1	\\x33306165613438623261323831	\N	2018-08-29 01:57:47.362-03	2018-08-29 01:57:47.362-03	6	1
118	192.168.7.172	1	\\x33306165613438623261323831	\N	2018-08-29 01:57:47.372-03	2018-08-29 01:57:47.372-03	6	1
119	192.168.7.172	2	\\x33306165613438623261323832004903e70007759f000000002318b3a3	\N	2018-08-29 02:00:55.461-03	2018-08-29 02:00:55.461-03	6	1
120	192.168.7.172	1	\\x33306165613438623261323831	\N	2018-08-29 02:00:55.484-03	2018-08-29 02:00:55.484-03	6	1
121	192.168.7.172	1	\\x33306165613438623261323831	\N	2018-08-29 02:00:55.495-03	2018-08-29 02:00:55.495-03	6	1
122	192.168.7.172	1	\\x33306165613438623261323831	\N	2018-08-29 02:00:55.501-03	2018-08-29 02:00:55.501-03	6	1
123	192.168.7.172	2	\\x33306165613438623261323832004803e700077ef7000000002318ba24	\N	2018-08-29 02:00:55.507-03	2018-08-29 02:00:55.507-03	6	1
124	192.168.7.172	2	\\x33306165613438623261323832004703e7000780bc000000002318ba43	\N	2018-08-29 02:00:55.515-03	2018-08-29 02:00:55.515-03	6	1
125	192.168.7.172	2	\\x33306165613438623261323832004703e700077dd3000000002318ba62	\N	2018-08-29 02:00:55.526-03	2018-08-29 02:00:55.526-03	6	1
126	192.168.7.172	2	\\x33306165613438623261323832004603e700077f31000000002318ba81	\N	2018-08-29 02:00:55.533-03	2018-08-29 02:00:55.533-03	6	1
127	192.168.7.172	1	\\x33306165613438623261323831	\N	2018-08-29 02:00:55.54-03	2018-08-29 02:00:55.54-03	6	1
128	192.168.7.172	1	\\x33306165613438623261323831	\N	2018-08-29 02:00:55.546-03	2018-08-29 02:00:55.546-03	6	1
129	192.168.7.172	2	\\x33306165613438623261323832004603e70007810a000000002318bac0	\N	2018-08-29 02:00:55.552-03	2018-08-29 02:00:55.552-03	6	1
130	192.168.7.172	2	\\x33306165613438623261323832004703e700077f8d000000002318bae0	\N	2018-08-29 02:00:55.559-03	2018-08-29 02:00:55.559-03	6	1
131	192.168.7.172	2	\\x33306165613438623261323832004903e70007759f000000002318b3a3	\N	2018-08-29 02:01:26.871-03	2018-08-29 02:01:26.871-03	6	1
132	192.168.7.172	1	\\x33306165613438623261323831	\N	2018-08-29 02:01:26.881-03	2018-08-29 02:01:26.881-03	6	1
133	192.168.7.172	1	\\x33306165613438623261323831	\N	2018-08-29 02:01:26.887-03	2018-08-29 02:01:26.887-03	6	1
134	192.168.7.172	1	\\x33306165613438623261323831	\N	2018-08-29 02:01:26.894-03	2018-08-29 02:01:26.894-03	6	1
135	192.168.7.172	2	\\x33306165613438623261323832004803e700077ef7000000002318ba24	\N	2018-08-29 02:01:26.903-03	2018-08-29 02:01:26.903-03	6	1
136	192.168.7.172	2	\\x33306165613438623261323832004703e7000780bc000000002318ba43	\N	2018-08-29 02:01:26.912-03	2018-08-29 02:01:26.912-03	6	1
137	192.168.7.172	2	\\x33306165613438623261323832004703e700077dd3000000002318ba62	\N	2018-08-29 02:01:26.922-03	2018-08-29 02:01:26.922-03	6	1
140	192.168.7.172	1	\\x33306165613438623261323831	\N	2018-08-29 02:01:26.941-03	2018-08-29 02:01:26.941-03	6	1
141	192.168.7.172	2	\\x33306165613438623261323832004603e70007810a000000002318bac0	\N	2018-08-29 02:01:26.952-03	2018-08-29 02:01:26.952-03	6	1
138	192.168.7.172	2	\\x33306165613438623261323832004603e700077f31000000002318ba81	\N	2018-08-29 02:01:26.929-03	2018-08-29 02:01:26.929-03	6	1
139	192.168.7.172	1	\\x33306165613438623261323831	\N	2018-08-29 02:01:26.935-03	2018-08-29 02:01:26.935-03	6	1
143	192.168.7.172	2	\\x33306165613438623261323832004703e700077dc4000000002318baff	\N	2018-08-29 02:01:26.969-03	2018-08-29 02:01:26.969-03	6	1
142	192.168.7.172	2	\\x33306165613438623261323832004703e700077f8d000000002318bae0	\N	2018-08-29 02:01:26.959-03	2018-08-29 02:01:26.959-03	6	1
144	192.168.7.172	2	\\x33306165613438623261323832004903e70007759f000000002318b3a3	\N	2018-08-29 10:53:40.965-03	2018-08-29 10:53:40.965-03	6	1
145	192.168.7.172	1	\\x33306165613438623261323831	\N	2018-08-29 10:53:41.001-03	2018-08-29 10:53:41.001-03	6	1
146	192.168.7.172	1	\\x33306165613438623261323831	\N	2018-08-29 10:53:41.009-03	2018-08-29 10:53:41.009-03	6	1
147	192.168.7.172	1	\\x33306165613438623261323831	\N	2018-08-29 10:53:41.015-03	2018-08-29 10:53:41.015-03	6	1
148	192.168.7.172	2	\\x33306165613438623261323832004803e700077ef7000000002318ba24	\N	2018-08-29 10:53:41.021-03	2018-08-29 10:53:41.021-03	6	1
149	192.168.7.172	2	\\x33306165613438623261323832004703e7000780bc000000002318ba43	\N	2018-08-29 10:53:41.029-03	2018-08-29 10:53:41.029-03	6	1
150	192.168.7.172	2	\\x33306165613438623261323832004703e700077dd3000000002318ba62	\N	2018-08-29 10:53:41.035-03	2018-08-29 10:53:41.035-03	6	1
151	192.168.7.172	2	\\x33306165613438623261323832004603e700077f31000000002318ba81	\N	2018-08-29 10:53:41.042-03	2018-08-29 10:53:41.042-03	6	1
152	192.168.7.172	1	\\x33306165613438623261323831	\N	2018-08-29 10:53:41.051-03	2018-08-29 10:53:41.051-03	6	1
153	192.168.7.172	1	\\x33306165613438623261323831	\N	2018-08-29 10:53:41.058-03	2018-08-29 10:53:41.058-03	6	1
154	192.168.7.172	2	\\x33306165613438623261323832004603e70007810a000000002318bac0	\N	2018-08-29 10:53:41.064-03	2018-08-29 10:53:41.064-03	6	1
155	192.168.7.172	2	\\x33306165613438623261323832004703e700077f8d000000002318bae0	\N	2018-08-29 10:53:41.072-03	2018-08-29 10:53:41.072-03	6	1
156	192.168.7.172	2	\\x33306165613438623261323832004703e700077dc4000000002318baff	\N	2018-08-29 10:53:41.076-03	2018-08-29 10:53:41.076-03	6	1
157	192.168.7.172	2	\\x33306165613438623261323832004703e700078016000000002318bb1e	\N	2018-08-29 10:53:41.088-03	2018-08-29 10:53:41.088-03	6	1
158	192.168.7.172	1	\\x33306165613438623261323831	\N	2018-08-29 10:53:41.093-03	2018-08-29 10:53:41.093-03	6	1
159	192.168.7.172	2	\\x33306165613438623261323832004703e700077f15000000002318bb59	\N	2018-08-29 10:53:41.102-03	2018-08-29 10:53:41.102-03	6	1
160	192.168.7.172	2	\\x33306165613438623261323832004703e7000787da000000002318c262	\N	2018-08-29 10:53:41.114-03	2018-08-29 10:53:41.114-03	6	1
161	192.168.7.172	2	\\x33306165613438623261323832004303e700078ef4000000002318c96b	\N	2018-08-29 10:53:41.118-03	2018-08-29 10:53:41.118-03	6	1
162	192.168.7.172	2	\\x33306165613438623261323832004103e70007967a000000002318d074	\N	2018-08-29 10:53:41.128-03	2018-08-29 10:53:41.128-03	6	1
163	192.168.7.172	2	\\x33306165613438623261323832003d03e700079859000000002318d77d	\N	2018-08-29 10:53:41.131-03	2018-08-29 10:53:41.131-03	6	1
164	192.168.7.172	2	\\x33306165613438623261323832003c03e700079c75000000002318de86	\N	2018-08-29 10:53:41.141-03	2018-08-29 10:53:41.141-03	6	1
165	192.168.7.172	2	\\x33306165613438623261323832003903e70007a071000000002318e590	\N	2018-08-29 10:53:41.151-03	2018-08-29 10:53:41.151-03	6	1
166	192.168.7.172	2	\\x33306165613438623261323832003903e700079732000000002318ec99	\N	2018-08-29 10:53:41.155-03	2018-08-29 10:53:41.155-03	6	1
167	192.168.7.172	2	\\x33306165613438623261323832003e03e700079c23000000002318f3a2	\N	2018-08-29 10:53:41.167-03	2018-08-29 10:53:41.167-03	6	1
168	192.168.7.172	2	\\x33306165613438623261323832003703e700079e15000000002318faab	\N	2018-08-29 10:53:41.168-03	2018-08-29 10:53:41.168-03	6	1
169	192.168.7.172	2	\\x33306165613438623261323832003503e70007bfff00000000231901b4	\N	2018-08-29 10:53:41.179-03	2018-08-29 10:53:41.179-03	6	1
170	192.168.7.172	2	\\x33306165613438623261323832003503e70007a04c00000000231908bd	\N	2018-08-29 10:53:41.189-03	2018-08-29 10:53:41.189-03	6	1
171	192.168.7.172	2	\\x33306165613438623261323832003203e70007a0bb0000000023190fc6	\N	2018-08-29 10:53:41.194-03	2018-08-29 10:53:41.194-03	6	1
172	192.168.7.172	2	\\x33306165613438623261323832003103e70007a3c600000000231916cf	\N	2018-08-29 10:53:41.202-03	2018-08-29 10:53:41.202-03	6	1
173	192.168.7.172	2	\\x33306165613438623261323832003203e70007a55e0000000023191dd9	\N	2018-08-29 10:53:41.206-03	2018-08-29 10:53:41.206-03	6	1
174	192.168.7.172	2	\\x33306165613438623261323832003d03e70007943e00000000231924e2	\N	2018-08-29 10:53:41.217-03	2018-08-29 10:53:41.217-03	6	1
175	192.168.7.172	2	\\x33306165613438623261323832005503e400077f4a0000000023192beb	\N	2018-08-29 10:53:41.221-03	2018-08-29 10:53:41.221-03	6	1
176	192.168.7.172	2	\\x33306165613438623261323832006503950007655a00000000231932f4	\N	2018-08-29 10:53:41.229-03	2018-08-29 10:53:41.229-03	6	1
177	192.168.7.172	1	\\x33306165613438623261323831	\N	2018-08-29 10:53:41.236-03	2018-08-29 10:53:41.236-03	6	1
178	192.168.7.172	2	\\x33306165613438623261323832004903e70007759f000000002318b3a3	\N	2018-08-29 10:53:42.124-03	2018-08-29 10:53:42.124-03	6	1
179	192.168.7.172	1	\\x33306165613438623261323831	\N	2018-08-29 10:53:42.129-03	2018-08-29 10:53:42.129-03	6	1
180	192.168.7.172	1	\\x33306165613438623261323831	\N	2018-08-29 10:53:42.135-03	2018-08-29 10:53:42.135-03	6	1
181	192.168.7.172	1	\\x33306165613438623261323831	\N	2018-08-29 10:53:42.141-03	2018-08-29 10:53:42.141-03	6	1
182	192.168.7.172	2	\\x33306165613438623261323832004803e700077ef7000000002318ba24	\N	2018-08-29 10:53:42.15-03	2018-08-29 10:53:42.15-03	6	1
183	192.168.7.172	2	\\x33306165613438623261323832004703e7000780bc000000002318ba43	\N	2018-08-29 10:53:42.156-03	2018-08-29 10:53:42.156-03	6	1
184	192.168.7.172	2	\\x33306165613438623261323832004703e700077dd3000000002318ba62	\N	2018-08-29 10:53:42.164-03	2018-08-29 10:53:42.164-03	6	1
185	192.168.7.172	2	\\x33306165613438623261323832004603e700077f31000000002318ba81	\N	2018-08-29 10:53:42.171-03	2018-08-29 10:53:42.171-03	6	1
186	192.168.7.172	1	\\x33306165613438623261323831	\N	2018-08-29 10:53:42.18-03	2018-08-29 10:53:42.18-03	6	1
187	192.168.7.172	1	\\x33306165613438623261323831	\N	2018-08-29 10:53:42.187-03	2018-08-29 10:53:42.187-03	6	1
188	192.168.7.172	2	\\x33306165613438623261323832004603e70007810a000000002318bac0	\N	2018-08-29 10:53:42.195-03	2018-08-29 10:53:42.195-03	6	1
189	192.168.7.172	2	\\x33306165613438623261323832004703e700077f8d000000002318bae0	\N	2018-08-29 10:53:42.209-03	2018-08-29 10:53:42.209-03	6	1
190	192.168.7.172	2	\\x33306165613438623261323832004703e700077dc4000000002318baff	\N	2018-08-29 10:53:42.224-03	2018-08-29 10:53:42.224-03	6	1
191	192.168.7.172	2	\\x33306165613438623261323832004703e700078016000000002318bb1e	\N	2018-08-29 10:53:42.237-03	2018-08-29 10:53:42.237-03	6	1
192	192.168.7.172	1	\\x33306165613438623261323831	\N	2018-08-29 10:53:42.245-03	2018-08-29 10:53:42.245-03	6	1
193	192.168.7.172	2	\\x33306165613438623261323832004703e700077f15000000002318bb59	\N	2018-08-29 10:53:42.253-03	2018-08-29 10:53:42.253-03	6	1
194	192.168.7.172	2	\\x33306165613438623261323832004703e7000787da000000002318c262	\N	2018-08-29 10:53:42.262-03	2018-08-29 10:53:42.262-03	6	1
195	192.168.7.172	2	\\x33306165613438623261323832004303e700078ef4000000002318c96b	\N	2018-08-29 10:53:42.271-03	2018-08-29 10:53:42.271-03	6	1
196	192.168.7.172	2	\\x33306165613438623261323832004103e70007967a000000002318d074	\N	2018-08-29 10:53:42.277-03	2018-08-29 10:53:42.277-03	6	1
197	192.168.7.172	2	\\x33306165613438623261323832003d03e700079859000000002318d77d	\N	2018-08-29 10:53:42.282-03	2018-08-29 10:53:42.282-03	6	1
198	192.168.7.172	2	\\x33306165613438623261323832003c03e700079c75000000002318de86	\N	2018-08-29 10:53:42.29-03	2018-08-29 10:53:42.29-03	6	1
199	192.168.7.172	2	\\x33306165613438623261323832003903e70007a071000000002318e590	\N	2018-08-29 10:53:42.298-03	2018-08-29 10:53:42.298-03	6	1
200	192.168.7.172	2	\\x33306165613438623261323832003903e700079732000000002318ec99	\N	2018-08-29 10:53:42.305-03	2018-08-29 10:53:42.305-03	6	1
201	192.168.7.172	2	\\x33306165613438623261323832003e03e700079c23000000002318f3a2	\N	2018-08-29 10:53:42.313-03	2018-08-29 10:53:42.313-03	6	1
206	192.168.7.172	2	\\x33306165613438623261323832003103e70007a3c600000000231916cf	\N	2018-08-29 10:53:42.356-03	2018-08-29 10:53:42.356-03	6	1
202	192.168.7.172	2	\\x33306165613438623261323832003703e700079e15000000002318faab	\N	2018-08-29 10:53:42.325-03	2018-08-29 10:53:42.325-03	6	1
207	192.168.7.172	2	\\x33306165613438623261323832003203e70007a55e0000000023191dd9	\N	2018-08-29 10:53:42.365-03	2018-08-29 10:53:42.365-03	6	1
211	192.168.7.172	1	\\x33306165613438623261323831	\N	2018-08-29 10:53:42.394-03	2018-08-29 10:53:42.394-03	6	1
203	192.168.7.172	2	\\x33306165613438623261323832003503e70007bfff00000000231901b4	\N	2018-08-29 10:53:42.331-03	2018-08-29 10:53:42.331-03	6	1
208	192.168.7.172	2	\\x33306165613438623261323832003d03e70007943e00000000231924e2	\N	2018-08-29 10:53:42.371-03	2018-08-29 10:53:42.371-03	6	1
204	192.168.7.172	2	\\x33306165613438623261323832003503e70007a04c00000000231908bd	\N	2018-08-29 10:53:42.337-03	2018-08-29 10:53:42.337-03	6	1
209	192.168.7.172	2	\\x33306165613438623261323832005503e400077f4a0000000023192beb	\N	2018-08-29 10:53:42.378-03	2018-08-29 10:53:42.378-03	6	1
212	192.168.7.172	2	\\x333061656134386232613238320076035f0007549200000000231937be	\N	2018-08-29 10:53:42.4-03	2018-08-29 10:53:42.4-03	6	1
205	192.168.7.172	2	\\x33306165613438623261323832003203e70007a0bb0000000023190fc6	\N	2018-08-29 10:53:42.351-03	2018-08-29 10:53:42.351-03	6	1
210	192.168.7.172	2	\\x33306165613438623261323832006503950007655a00000000231932f4	\N	2018-08-29 10:53:42.386-03	2018-08-29 10:53:42.386-03	6	1
213	192.168.7.172	2	\\x33306165613438623261323832004903e70007759f000000002318b3a3	\N	2018-08-29 11:23:43.911-03	2018-08-29 11:23:43.911-03	6	1
214	192.168.7.172	1	\\x33306165613438623261323831	\N	2018-08-29 11:23:43.934-03	2018-08-29 11:23:43.934-03	6	1
215	192.168.7.172	1	\\x33306165613438623261323831	\N	2018-08-29 11:23:43.944-03	2018-08-29 11:23:43.944-03	6	1
216	192.168.7.172	1	\\x33306165613438623261323831	\N	2018-08-29 11:23:43.962-03	2018-08-29 11:23:43.962-03	6	1
217	192.168.7.172	2	\\x33306165613438623261323832004803e700077ef7000000002318ba24	\N	2018-08-29 11:23:43.973-03	2018-08-29 11:23:43.973-03	6	1
218	192.168.7.172	2	\\x33306165613438623261323832004703e7000780bc000000002318ba43	\N	2018-08-29 11:23:43.984-03	2018-08-29 11:23:43.984-03	6	1
219	192.168.7.172	2	\\x33306165613438623261323832004703e700077dd3000000002318ba62	\N	2018-08-29 11:23:44-03	2018-08-29 11:23:44-03	6	1
220	192.168.7.172	2	\\x33306165613438623261323832004603e700077f31000000002318ba81	\N	2018-08-29 11:23:44.007-03	2018-08-29 11:23:44.007-03	6	1
221	192.168.7.172	1	\\x33306165613438623261323831	\N	2018-08-29 11:23:44.026-03	2018-08-29 11:23:44.026-03	6	1
222	192.168.7.172	1	\\x33306165613438623261323831	\N	2018-08-29 11:23:44.046-03	2018-08-29 11:23:44.046-03	6	1
223	192.168.7.172	2	\\x33306165613438623261323832004603e70007810a000000002318bac0	\N	2018-08-29 11:23:44.057-03	2018-08-29 11:23:44.057-03	6	1
224	192.168.7.172	2	\\x33306165613438623261323832004703e700077f8d000000002318bae0	\N	2018-08-29 11:23:44.064-03	2018-08-29 11:23:44.064-03	6	1
225	192.168.7.172	2	\\x33306165613438623261323832004703e700077dc4000000002318baff	\N	2018-08-29 11:23:44.084-03	2018-08-29 11:23:44.084-03	6	1
226	192.168.7.172	2	\\x33306165613438623261323832004703e700078016000000002318bb1e	\N	2018-08-29 11:23:44.091-03	2018-08-29 11:23:44.091-03	6	1
227	192.168.7.172	1	\\x33306165613438623261323831	\N	2018-08-29 11:23:44.097-03	2018-08-29 11:23:44.097-03	6	1
228	192.168.7.172	2	\\x33306165613438623261323832004703e700077f15000000002318bb59	\N	2018-08-29 11:23:44.103-03	2018-08-29 11:23:44.103-03	6	1
229	192.168.7.172	2	\\x33306165613438623261323832004703e7000787da000000002318c262	\N	2018-08-29 11:23:44.113-03	2018-08-29 11:23:44.113-03	6	1
230	192.168.7.172	2	\\x33306165613438623261323832004303e700078ef4000000002318c96b	\N	2018-08-29 11:23:44.128-03	2018-08-29 11:23:44.128-03	6	1
231	192.168.7.172	2	\\x33306165613438623261323832004103e70007967a000000002318d074	\N	2018-08-29 11:23:44.134-03	2018-08-29 11:23:44.134-03	6	1
232	192.168.7.172	2	\\x33306165613438623261323832003d03e700079859000000002318d77d	\N	2018-08-29 11:23:44.173-03	2018-08-29 11:23:44.173-03	6	1
233	192.168.7.172	2	\\x33306165613438623261323832003c03e700079c75000000002318de86	\N	2018-08-29 11:23:44.181-03	2018-08-29 11:23:44.181-03	6	1
234	192.168.7.172	2	\\x33306165613438623261323832003903e70007a071000000002318e590	\N	2018-08-29 11:23:44.191-03	2018-08-29 11:23:44.191-03	6	1
235	192.168.7.172	2	\\x33306165613438623261323832003903e700079732000000002318ec99	\N	2018-08-29 11:23:44.199-03	2018-08-29 11:23:44.199-03	6	1
236	192.168.7.172	2	\\x33306165613438623261323832003e03e700079c23000000002318f3a2	\N	2018-08-29 11:23:44.227-03	2018-08-29 11:23:44.227-03	6	1
237	192.168.7.172	2	\\x33306165613438623261323832003703e700079e15000000002318faab	\N	2018-08-29 11:23:44.236-03	2018-08-29 11:23:44.236-03	6	1
238	192.168.7.172	2	\\x33306165613438623261323832003503e70007bfff00000000231901b4	\N	2018-08-29 11:23:44.273-03	2018-08-29 11:23:44.273-03	6	1
239	192.168.7.172	2	\\x33306165613438623261323832003503e70007a04c00000000231908bd	\N	2018-08-29 11:23:44.284-03	2018-08-29 11:23:44.284-03	6	1
240	192.168.7.172	2	\\x33306165613438623261323832003203e70007a0bb0000000023190fc6	\N	2018-08-29 11:23:44.292-03	2018-08-29 11:23:44.292-03	6	1
241	192.168.7.172	2	\\x33306165613438623261323832003103e70007a3c600000000231916cf	\N	2018-08-29 11:23:44.302-03	2018-08-29 11:23:44.302-03	6	1
242	192.168.7.172	2	\\x33306165613438623261323832003203e70007a55e0000000023191dd9	\N	2018-08-29 11:23:44.314-03	2018-08-29 11:23:44.314-03	6	1
243	192.168.7.172	2	\\x33306165613438623261323832003d03e70007943e00000000231924e2	\N	2018-08-29 11:23:44.324-03	2018-08-29 11:23:44.324-03	6	1
244	192.168.7.172	2	\\x33306165613438623261323832005503e400077f4a0000000023192beb	\N	2018-08-29 11:23:44.357-03	2018-08-29 11:23:44.357-03	6	1
245	192.168.7.172	2	\\x33306165613438623261323832006503950007655a00000000231932f4	\N	2018-08-29 11:23:44.363-03	2018-08-29 11:23:44.363-03	6	1
246	192.168.7.172	1	\\x33306165613438623261323831	\N	2018-08-29 11:23:44.369-03	2018-08-29 11:23:44.369-03	6	1
247	192.168.7.172	2	\\x333061656134386232613238320076035f0007549200000000231937be	\N	2018-08-29 11:23:44.375-03	2018-08-29 11:23:44.375-03	6	1
248	192.168.7.172	2	\\x3330616561343862326132383200870302000734830000000023193ec8	\N	2018-08-29 11:23:44.391-03	2018-08-29 11:23:44.391-03	6	1
249	192.168.7.172	2	\\x33306165613438623261323832004903e70007759f000000002318b3a3	\N	2018-08-29 11:53:45.819-03	2018-08-29 11:53:45.819-03	6	1
250	192.168.7.172	1	\\x33306165613438623261323831	\N	2018-08-29 11:53:45.937-03	2018-08-29 11:53:45.937-03	6	1
251	192.168.7.172	1	\\x33306165613438623261323831	\N	2018-08-29 11:53:45.95-03	2018-08-29 11:53:45.95-03	6	1
252	192.168.7.172	1	\\x33306165613438623261323831	\N	2018-08-29 11:53:45.962-03	2018-08-29 11:53:45.962-03	6	1
253	192.168.7.172	2	\\x33306165613438623261323832004803e700077ef7000000002318ba24	\N	2018-08-29 11:53:46.017-03	2018-08-29 11:53:46.017-03	6	1
254	192.168.7.172	2	\\x33306165613438623261323832004703e7000780bc000000002318ba43	\N	2018-08-29 11:53:46.032-03	2018-08-29 11:53:46.032-03	6	1
255	192.168.7.172	2	\\x33306165613438623261323832004603e700077f31000000002318ba81	\N	2018-08-29 11:53:46.054-03	2018-08-29 11:53:46.054-03	6	1
256	192.168.7.172	2	\\x33306165613438623261323832004703e700077dd3000000002318ba62	\N	2018-08-29 11:53:46.046-03	2018-08-29 11:53:46.046-03	6	1
257	192.168.7.172	1	\\x33306165613438623261323831	\N	2018-08-29 11:53:46.101-03	2018-08-29 11:53:46.101-03	6	1
258	192.168.7.172	1	\\x33306165613438623261323831	\N	2018-08-29 11:53:46.184-03	2018-08-29 11:53:46.184-03	6	1
259	192.168.7.172	2	\\x33306165613438623261323832004603e70007810a000000002318bac0	\N	2018-08-29 11:53:46.345-03	2018-08-29 11:53:46.345-03	6	1
260	192.168.7.172	2	\\x33306165613438623261323832004703e700077f8d000000002318bae0	\N	2018-08-29 11:53:46.351-03	2018-08-29 11:53:46.351-03	6	1
261	192.168.7.172	2	\\x33306165613438623261323832004703e700077dc4000000002318baff	\N	2018-08-29 11:53:46.361-03	2018-08-29 11:53:46.361-03	6	1
262	192.168.7.172	2	\\x33306165613438623261323832004703e700078016000000002318bb1e	\N	2018-08-29 11:53:46.368-03	2018-08-29 11:53:46.368-03	6	1
263	192.168.7.172	1	\\x33306165613438623261323831	\N	2018-08-29 11:53:46.377-03	2018-08-29 11:53:46.377-03	6	1
264	192.168.7.172	2	\\x33306165613438623261323832004703e700077f15000000002318bb59	\N	2018-08-29 11:53:46.407-03	2018-08-29 11:53:46.407-03	6	1
265	192.168.7.172	2	\\x33306165613438623261323832004703e7000787da000000002318c262	\N	2018-08-29 11:53:46.417-03	2018-08-29 11:53:46.417-03	6	1
266	192.168.7.172	2	\\x33306165613438623261323832004303e700078ef4000000002318c96b	\N	2018-08-29 11:53:46.424-03	2018-08-29 11:53:46.424-03	6	1
267	192.168.7.172	2	\\x33306165613438623261323832004103e70007967a000000002318d074	\N	2018-08-29 11:53:46.431-03	2018-08-29 11:53:46.431-03	6	1
268	192.168.7.172	2	\\x33306165613438623261323832003d03e700079859000000002318d77d	\N	2018-08-29 11:53:46.439-03	2018-08-29 11:53:46.439-03	6	1
269	192.168.7.172	2	\\x33306165613438623261323832003c03e700079c75000000002318de86	\N	2018-08-29 11:53:46.51-03	2018-08-29 11:53:46.51-03	6	1
274	192.168.7.172	2	\\x33306165613438623261323832003503e70007bfff00000000231901b4	\N	2018-08-29 11:53:46.769-03	2018-08-29 11:53:46.769-03	6	1
278	192.168.7.172	2	\\x33306165613438623261323832003203e70007a55e0000000023191dd9	\N	2018-08-29 11:53:46.816-03	2018-08-29 11:53:46.816-03	6	1
282	192.168.7.172	1	\\x33306165613438623261323831	\N	2018-08-29 11:53:46.84-03	2018-08-29 11:53:46.84-03	6	1
271	192.168.7.172	2	\\x33306165613438623261323832003903e700079732000000002318ec99	\N	2018-08-29 11:53:46.56-03	2018-08-29 11:53:46.56-03	6	1
277	192.168.7.172	2	\\x33306165613438623261323832003103e70007a3c600000000231916cf	\N	2018-08-29 11:53:46.809-03	2018-08-29 11:53:46.809-03	6	1
285	192.168.7.172	2	\\x33306165613438623261323832009802a40007143f00000000231945d2	\N	2018-08-29 11:53:46.87-03	2018-08-29 11:53:46.87-03	6	1
370	200.72.211.70	4	\\x33306165613438393137363434a759595959595959595959595958595959595859585858595959595859595859595858595958585858585858585858585858585858585859585858585859585858585859585858585858585858585858585858585858585858575757575757575757575757575757575757585758585757595959595859585958585859585959595959585858585959585959595959595959595959595959595959585858575756565555555453545353535252505150504f4f4e4e4e4d4e4e4e4e4d4d4d4e4e4e4e4e4d4d4d4e4e	\N	2018-08-30 05:49:09.769-03	2018-08-30 05:49:09.769-03	6	1
273	192.168.7.172	2	\\x33306165613438623261323832003703e700079e15000000002318faab	\N	2018-08-29 11:53:46.758-03	2018-08-29 11:53:46.758-03	6	1
279	192.168.7.172	2	\\x33306165613438623261323832003d03e70007943e00000000231924e2	\N	2018-08-29 11:53:46.821-03	2018-08-29 11:53:46.821-03	6	1
371	200.72.211.70	4	\\x33306165613438393137363434a759595959595959595959595958595959595859585858595959595859595859595858595958585858585858585858585858585858585859585858585859585858585859585858585858585858585858585858585858585858575757575757575757575757575757575757585758585757595959595859585958585859585959595959585858585959585959595959595959595959595959595959585858575756565555555453545353535252505150504f4f4e4e4e4d4e4e4e4e4d4d4d4e4e4e4e4e4d4d4d4e4e	\N	2018-08-30 05:56:53.299-03	2018-08-30 05:56:53.299-03	6	1
275	192.168.7.172	2	\\x33306165613438623261323832003503e70007a04c00000000231908bd	\N	2018-08-29 11:53:46.776-03	2018-08-29 11:53:46.776-03	6	1
276	192.168.7.172	2	\\x33306165613438623261323832003203e70007a0bb0000000023190fc6	\N	2018-08-29 11:53:46.803-03	2018-08-29 11:53:46.803-03	6	1
281	192.168.7.172	2	\\x33306165613438623261323832006503950007655a00000000231932f4	\N	2018-08-29 11:53:46.834-03	2018-08-29 11:53:46.834-03	6	1
284	192.168.7.172	2	\\x3330616561343862326132383200870302000734830000000023193ec8	\N	2018-08-29 11:53:46.858-03	2018-08-29 11:53:46.858-03	6	1
372	200.72.211.70	4	\\x33306165613438393137363434a759595959595959595959595958595959595859585858595959595859595859595858595958585858585858585858585858585858585859585858585859585858585859585858585858585858585858585858585858585858575757575757575757575757575757575757585758585757595959595859585958585859585959595959585858585959585959595959595959595959595959595959585858575756565555555453545353535252505150504f4f4e4e4e4d4e4e4e4e4d4d4d4e4e4e4e4e4d4d4d4e4e	\N	2018-08-30 06:01:18.278-03	2018-08-30 06:01:18.278-03	6	1
286	192.168.7.172	2	\\x33306165613438623261323832004903e70007759f000000002318b3a3	\N	2018-08-29 11:56:52.412-03	2018-08-29 11:56:52.412-03	6	1
289	192.168.7.172	1	\\x33306165613438623261323831	\N	2018-08-29 11:56:52.444-03	2018-08-29 11:56:52.444-03	6	1
290	192.168.7.172	2	\\x33306165613438623261323832004803e700077ef7000000002318ba24	\N	2018-08-29 11:56:52.456-03	2018-08-29 11:56:52.456-03	6	1
293	192.168.7.172	2	\\x33306165613438623261323832004603e700077f31000000002318ba81	\N	2018-08-29 11:56:52.477-03	2018-08-29 11:56:52.477-03	6	1
294	192.168.7.172	1	\\x33306165613438623261323831	\N	2018-08-29 11:56:52.488-03	2018-08-29 11:56:52.488-03	6	1
297	192.168.7.172	2	\\x33306165613438623261323832004703e700077f8d000000002318bae0	\N	2018-08-29 11:56:52.518-03	2018-08-29 11:56:52.518-03	6	1
299	192.168.7.172	2	\\x33306165613438623261323832004703e700078016000000002318bb1e	\N	2018-08-29 11:56:52.53-03	2018-08-29 11:56:52.53-03	6	1
300	192.168.7.172	1	\\x33306165613438623261323831	\N	2018-08-29 11:56:52.537-03	2018-08-29 11:56:52.537-03	6	1
301	192.168.7.172	2	\\x33306165613438623261323832004703e700077f15000000002318bb59	\N	2018-08-29 11:56:52.546-03	2018-08-29 11:56:52.546-03	6	1
304	192.168.7.172	2	\\x33306165613438623261323832004103e70007967a000000002318d074	\N	2018-08-29 11:56:52.571-03	2018-08-29 11:56:52.571-03	6	1
307	192.168.7.172	2	\\x33306165613438623261323832003903e70007a071000000002318e590	\N	2018-08-29 11:56:52.597-03	2018-08-29 11:56:52.597-03	6	1
309	192.168.7.172	2	\\x33306165613438623261323832003e03e700079c23000000002318f3a2	\N	2018-08-29 11:56:52.612-03	2018-08-29 11:56:52.612-03	6	1
312	192.168.7.172	2	\\x33306165613438623261323832003503e70007a04c00000000231908bd	\N	2018-08-29 11:56:52.656-03	2018-08-29 11:56:52.656-03	6	1
318	192.168.7.172	2	\\x33306165613438623261323832006503950007655a00000000231932f4	\N	2018-08-29 11:56:52.739-03	2018-08-29 11:56:52.739-03	6	1
321	192.168.7.172	2	\\x3330616561343862326132383200870302000734830000000023193ec8	\N	2018-08-29 11:56:52.772-03	2018-08-29 11:56:52.772-03	6	1
324	192.168.7.172	2	\\x3330616561343862326132383200ad024f000710ba000000002319468e	\N	2018-08-29 11:56:53.668-03	2018-08-29 11:56:53.668-03	6	1
373	200.72.211.70	4	\\x33306165613438393137363434a759595959595959595959595958595959595859585858595959595859595859595858595958585858585858585858585858585858585859585858585859585858585859585858585858585858585858585858585858585858575757575757575757575757575757575757585758585757595959595859585958585859585959595959585858585959585959595959595959595959595959595959585858575756565555555453545353535252505150504f4f4e4e4e4d4e4e4e4e4d4d4d4e4e4e4e4e4d4d4d4e4e	\N	2018-08-30 06:01:50.198-03	2018-08-30 06:01:50.198-03	6	1
287	192.168.7.172	1	\\x33306165613438623261323831	\N	2018-08-29 11:56:52.426-03	2018-08-29 11:56:52.426-03	6	1
292	192.168.7.172	2	\\x33306165613438623261323832004703e700077dd3000000002318ba62	\N	2018-08-29 11:56:52.471-03	2018-08-29 11:56:52.471-03	6	1
295	192.168.7.172	1	\\x33306165613438623261323831	\N	2018-08-29 11:56:52.5-03	2018-08-29 11:56:52.5-03	6	1
296	192.168.7.172	2	\\x33306165613438623261323832004603e70007810a000000002318bac0	\N	2018-08-29 11:56:52.512-03	2018-08-29 11:56:52.512-03	6	1
302	192.168.7.172	2	\\x33306165613438623261323832004703e7000787da000000002318c262	\N	2018-08-29 11:56:52.555-03	2018-08-29 11:56:52.555-03	6	1
305	192.168.7.172	2	\\x33306165613438623261323832003d03e700079859000000002318d77d	\N	2018-08-29 11:56:52.584-03	2018-08-29 11:56:52.584-03	6	1
308	192.168.7.172	2	\\x33306165613438623261323832003903e700079732000000002318ec99	\N	2018-08-29 11:56:52.605-03	2018-08-29 11:56:52.605-03	6	1
313	192.168.7.172	2	\\x33306165613438623261323832003203e70007a0bb0000000023190fc6	\N	2018-08-29 11:56:52.663-03	2018-08-29 11:56:52.663-03	6	1
315	192.168.7.172	2	\\x33306165613438623261323832003203e70007a55e0000000023191dd9	\N	2018-08-29 11:56:52.703-03	2018-08-29 11:56:52.703-03	6	1
319	192.168.7.172	1	\\x33306165613438623261323831	\N	2018-08-29 11:56:52.747-03	2018-08-29 11:56:52.747-03	6	1
374	200.72.211.70	1	\\x33306165613438393137363431	\N	2018-08-30 06:14:33.311-03	2018-08-30 06:14:33.311-03	6	1
288	192.168.7.172	1	\\x33306165613438623261323831	\N	2018-08-29 11:56:52.436-03	2018-08-29 11:56:52.436-03	6	1
291	192.168.7.172	2	\\x33306165613438623261323832004703e7000780bc000000002318ba43	\N	2018-08-29 11:56:52.463-03	2018-08-29 11:56:52.463-03	6	1
298	192.168.7.172	2	\\x33306165613438623261323832004703e700077dc4000000002318baff	\N	2018-08-29 11:56:52.525-03	2018-08-29 11:56:52.525-03	6	1
303	192.168.7.172	2	\\x33306165613438623261323832004303e700078ef4000000002318c96b	\N	2018-08-29 11:56:52.562-03	2018-08-29 11:56:52.562-03	6	1
306	192.168.7.172	2	\\x33306165613438623261323832003c03e700079c75000000002318de86	\N	2018-08-29 11:56:52.59-03	2018-08-29 11:56:52.59-03	6	1
316	192.168.7.172	2	\\x33306165613438623261323832003d03e70007943e00000000231924e2	\N	2018-08-29 11:56:52.712-03	2018-08-29 11:56:52.712-03	6	1
323	192.168.7.172	1	\\x33306165613438623261323831	\N	2018-08-29 11:56:52.794-03	2018-08-29 11:56:52.794-03	6	1
375	200.72.211.70	1	\\x33306165613438393137363431	\N	2018-08-30 06:17:48.573-03	2018-08-30 06:17:48.573-03	6	1
310	192.168.7.172	2	\\x33306165613438623261323832003703e700079e15000000002318faab	\N	2018-08-29 11:56:52.627-03	2018-08-29 11:56:52.627-03	6	1
311	192.168.7.172	2	\\x33306165613438623261323832003503e70007bfff00000000231901b4	\N	2018-08-29 11:56:52.65-03	2018-08-29 11:56:52.65-03	6	1
317	192.168.7.172	2	\\x33306165613438623261323832005503e400077f4a0000000023192beb	\N	2018-08-29 11:56:52.73-03	2018-08-29 11:56:52.73-03	6	1
320	192.168.7.172	2	\\x333061656134386232613238320076035f0007549200000000231937be	\N	2018-08-29 11:56:52.764-03	2018-08-29 11:56:52.764-03	6	1
376	200.72.211.70	2	\\x3330616561343839313736343200c2022300086c310000000023	\N	2018-08-30 06:20:37.638-03	2018-08-30 06:20:37.638-03	6	1
314	192.168.7.172	2	\\x33306165613438623261323832003103e70007a3c600000000231916cf	\N	2018-08-29 11:56:52.696-03	2018-08-29 11:56:52.696-03	6	1
322	192.168.7.172	2	\\x33306165613438623261323832009802a40007143f00000000231945d2	\N	2018-08-29 11:56:52.782-03	2018-08-29 11:56:52.782-03	6	1
377	200.72.211.70	4	\\x33306165613438393137363434ab525353535253535253535353535454545454545454545354545454545554555555555555555555555656565657575757575757575757585757585758585857575757565756555655555554555454545352515150504f4e4e4e4d4d4d4d4d4c4c4c4d4d4d4d4d4d4c4d4d4d4e4e4f4f505052525253535353545454555556575757575758585757575757575758585757575757575757575858575757575758585857575759585959585858585858595958595858585858585857575757575655555555555454530000000023	\N	2018-08-30 06:21:09.828-03	2018-08-30 06:21:09.828-03	6	1
325	192.168.7.172	2	\\x3330616561343862326132383200af02440006e7ab0000000023194d97	\N	2018-08-29 12:26:55-03	2018-08-29 12:26:55-03	6	1
326	192.168.7.172	1	\\x33306165613438623261323831	\N	2018-08-29 14:57:53.097-03	2018-08-29 14:57:53.097-03	3	1
327	192.168.7.172	2	\\x3330616561343862326132383200bb01f9000637f60000000023196fcf	\N	2018-08-29 14:57:53.114-03	2018-08-29 14:57:53.114-03	3	1
328	192.168.7.172	1	\\x33306165613438623261323831	\N	2018-08-29 14:57:53.128-03	2018-08-29 14:57:53.128-03	3	1
329	192.168.7.172	2	\\x3330616561343862326132383200c7017e00065cbc0000000000000007	\N	2018-08-29 14:57:54.001-03	2018-08-29 14:57:54.001-03	3	1
330	192.168.7.172	1	\\x33306165613438623261323831	\N	2018-08-29 14:58:30.915-03	2018-08-29 14:58:30.915-03	3	1
331	192.168.7.172	2	\\x3330616561343862326132383200c5017000065e880000000000000007	\N	2018-08-29 14:58:31.788-03	2018-08-29 14:58:31.788-03	3	1
332	200.72.211.70	1	\\x33306165613438393137363431	\N	2018-08-29 22:55:28.037-03	2018-08-29 22:55:28.037-03	6	1
333	200.72.211.70	1	\\x33306165613438393137363431	\N	2018-08-29 23:07:19.7-03	2018-08-29 23:07:19.7-03	6	1
334	200.72.211.70	1	\\x33306165613438393137363431	\N	2018-08-29 23:07:24.552-03	2018-08-29 23:07:24.552-03	6	1
335	200.72.211.70	1	\\x33306165613438393137363431	\N	2018-08-29 23:07:29.542-03	2018-08-29 23:07:29.542-03	6	1
336	200.72.211.70	1	\\x33306165613438393137363431	\N	2018-08-30 00:44:26.787-03	2018-08-30 00:44:26.787-03	6	1
337	200.72.211.70	1	\\x33306165613438393137363431	\N	2018-08-30 00:53:24.624-03	2018-08-30 00:53:24.624-03	6	1
338	200.72.211.70	2	\\x3330616561343839313736343200dd01910008c0040000000000000010	\N	2018-08-30 00:53:29.529-03	2018-08-30 00:53:29.529-03	6	1
339	200.72.211.70	1	\\x33306165613438393137363431	\N	2018-08-30 00:55:44.222-03	2018-08-30 00:55:44.222-03	6	1
340	200.72.211.70	2	\\x33306165613438393137363432007002c30008c27c000000000000009c	\N	2018-08-30 00:55:54.251-03	2018-08-30 00:55:54.251-03	6	1
341	200.72.211.70	1	\\x33306165613438393137363431	\N	2018-08-30 01:38:03.223-03	2018-08-30 01:38:03.223-03	6	1
342	200.72.211.70	1	\\x33306165613438393137363431	\N	2018-08-30 01:38:13.15-03	2018-08-30 01:38:13.15-03	6	1
343	200.72.211.70	1	\\x33306165613438393137363431	\N	2018-08-30 01:38:23.154-03	2018-08-30 01:38:23.154-03	6	1
344	200.72.211.70	1	\\x33306165613438393137363431	\N	2018-08-30 01:38:33.127-03	2018-08-30 01:38:33.127-03	6	1
345	200.72.211.70	1	\\x33306165613438393137363431	\N	2018-08-30 01:38:43.157-03	2018-08-30 01:38:43.157-03	6	1
346	200.72.211.70	1	\\x33306165613438393137363431	\N	2018-08-30 01:38:53.149-03	2018-08-30 01:38:53.149-03	6	1
347	200.72.211.70	1	\\x33306165613438393137363431	\N	2018-08-30 01:39:06.156-03	2018-08-30 01:39:06.156-03	6	1
348	200.72.211.70	2	\\x3330616561343839313736343200cd02720005ca560000000000000001	\N	2018-08-30 01:39:22.055-03	2018-08-30 01:39:22.055-03	6	1
349	200.72.211.70	1	\\x33306165613438393137363431	\N	2018-08-30 01:39:22.778-03	2018-08-30 01:39:22.778-03	6	1
350	200.72.211.70	1	\\x33306165613438393137363431	\N	2018-08-30 01:45:08.437-03	2018-08-30 01:45:08.437-03	6	1
351	200.72.211.70	1	\\x33306165613438393137363431	\N	2018-08-30 01:45:41.035-03	2018-08-30 01:45:41.035-03	6	1
352	200.72.211.70	1	\\x33306165613438393137363431	\N	2018-08-30 01:46:12.438-03	2018-08-30 01:46:12.438-03	6	1
353	200.72.211.70	1	\\x33306165613438393137363431	\N	2018-08-30 01:46:44.577-03	2018-08-30 01:46:44.577-03	6	1
354	200.72.211.70	1	\\x33306165613438393137363431	\N	2018-08-30 01:47:16.461-03	2018-08-30 01:47:16.461-03	6	1
355	200.72.211.70	1	\\x33306165613438393137363431	\N	2018-08-30 01:47:48.561-03	2018-08-30 01:47:48.561-03	6	1
356	200.72.211.70	1	\\x33306165613438393137363431	\N	2018-08-30 01:48:20.433-03	2018-08-30 01:48:20.433-03	6	1
357	200.72.211.70	2	\\x3330616561343839313736343200cd02720005ca560000000000000001	\N	2018-08-30 01:48:52.177-03	2018-08-30 01:48:52.177-03	6	1
358	200.72.211.70	1	\\x33306165613438393137363431	\N	2018-08-30 01:49:24.338-03	2018-08-30 01:49:24.338-03	6	1
359	200.72.211.70	1	\\x33306165613438393137363431	\N	2018-08-30 01:52:45.343-03	2018-08-30 01:52:45.343-03	6	1
360	200.72.211.70	2	\\x3330616561343839313736343200d20247000765fb0000000023	\N	2018-08-30 01:53:17.376-03	2018-08-30 01:53:17.376-03	6	1
361	200.72.211.70	1	\\x33306165613438393137363431	\N	2018-08-30 02:09:38.958-03	2018-08-30 02:09:38.958-03	6	1
362	200.72.211.70	2	\\x3330616561343839313736343200d5022d00077a430000000023	\N	2018-08-30 02:23:00.483-03	2018-08-30 02:23:00.483-03	6	1
363	200.72.211.70	2	\\x3330616561343839313736343200d70226000773a70000000023	\N	2018-08-30 02:29:18.975-03	2018-08-30 02:29:18.975-03	6	1
364	200.72.211.70	2	\\x3330616561343839313736343200d70227000770030000000023	\N	2018-08-30 02:32:28.212-03	2018-08-30 02:32:28.212-03	6	1
365	200.72.211.70	2	\\x3330616561343839313736343200d60216000786780000000023	\N	2018-08-30 02:38:46.784-03	2018-08-30 02:38:46.784-03	6	1
366	200.72.211.70	2	\\x3330616561343839313736343200d5021300078a230000000023	\N	2018-08-30 02:41:56.121-03	2018-08-30 02:41:56.121-03	6	1
367	200.72.211.70	1	\\x33306165613438393137363431	\N	2018-08-30 05:03:54.755-03	2018-08-30 05:03:54.755-03	6	1
368	200.72.211.70	1	\\x33306165613438393137363431	\N	2018-08-30 05:04:26.775-03	2018-08-30 05:04:26.775-03	6	1
369	200.72.211.70	2	\\x3330616561343839313736343200c1021600087fd30000000000000001	\N	2018-08-30 05:04:58.771-03	2018-08-30 05:04:58.771-03	6	1
270	192.168.7.172	2	\\x33306165613438623261323832003903e70007a071000000002318e590	\N	2018-08-29 11:53:46.551-03	2018-08-29 11:53:46.551-03	6	1
272	192.168.7.172	2	\\x33306165613438623261323832003e03e700079c23000000002318f3a2	\N	2018-08-29 11:53:46.634-03	2018-08-29 11:53:46.634-03	6	1
280	192.168.7.172	2	\\x33306165613438623261323832005503e400077f4a0000000023192beb	\N	2018-08-29 11:53:46.827-03	2018-08-29 11:53:46.827-03	6	1
283	192.168.7.172	2	\\x333061656134386232613238320076035f0007549200000000231937be	\N	2018-08-29 11:53:46.852-03	2018-08-29 11:53:46.852-03	6	1
\.


--
-- Data for Name: grupos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.grupos (id, nombre, custom, "createdAt", "updatedAt", rol_id, plan_id) FROM stdin;
1	TEST DEV	\N	2018-08-25 16:39:45.507-03	2018-08-25 16:39:45.507-03	1	1
\.


--
-- Data for Name: grupos_predios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.grupos_predios ("createdAt", "updatedAt", grupo_id, predio_id) FROM stdin;
2018-08-25 16:39:45.51-03	2018-08-25 16:39:45.51-03	1	1
\.


--
-- Data for Name: nodos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nodos (id, microcontrolador, mac, imei, enable, online, configuracion, "createdAt", "updatedAt", colmena_id, sim_id, version_id) FROM stdin;
3	ESP32	30aea48b2a28	867856031720714	t	f	{"sync":{"minuto":1,"cantidad":2}}	2018-08-25 16:39:45.552-03	2018-08-25 16:39:45.552-03	3	19	1
1	ESP32	30aea48918b4	867856031767764	t	f	{"sync":{"minuto":1,"cantidad":2}}	2018-08-25 16:39:45.547-03	2018-08-25 16:39:45.547-03	1	20	1
6	ESP32	30aea4891764	867856030590621	t	f	{"sync":{"minuto":1,"cantidad":2}}	2018-08-25 16:39:45.562-03	2018-08-25 16:39:45.562-03	5	18	1
5	ESP32	30aea4893dc0	865691035566785	t	f	{"sync":{"minuto":1,"cantidad":2}}	2018-08-25 16:39:45.558-03	2018-08-25 16:39:45.558-03	5	\N	1
4	ESP32	30aea4891798	867856031769158	t	f	{"sync":{"minuto":1,"cantidad":2}}	2018-08-25 16:39:45.556-03	2018-08-25 16:39:45.556-03	4	\N	1
2	ESP32	30aea48835b4	867856031769158	t	f	{"sync":{"minuto":1,"cantidad":2}}	2018-08-25 16:39:45.55-03	2018-08-25 16:39:45.55-03	2	\N	1
\.


--
-- Data for Name: nodos_sensores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nodos_sensores (id, pinout, custom, "createdAt", "updatedAt", nodo_id, sensor_id) FROM stdin;
1	[2]	\N	2018-08-25 16:39:45.564-03	2018-08-25 16:39:45.564-03	1	1
3	[18,26]	\N	2018-08-25 16:39:45.57-03	2018-08-25 16:39:45.57-03	6	3
4	[]	\N	2018-08-25 16:39:45.572-03	2018-08-25 16:39:45.572-03	6	5
2	[2]	\N	2018-08-25 16:39:45.567-03	2018-08-25 16:39:45.567-03	6	1
\.


--
-- Data for Name: operadores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.operadores (id, nombre, "MCC", "MNC", bandas, cobertura, "createdAt", "updatedAt") FROM stdin;
1	ClaroChile	730	3	\N	\N	2018-08-25 16:39:45.391-03	2018-08-25 16:39:45.391-03
2	Movistar	730	2	\N	\N	2018-08-25 16:39:45.404-03	2018-08-25 16:39:45.404-03
3	Entel	730	1	\N	\N	2018-08-25 16:39:45.406-03	2018-08-25 16:39:45.406-03
\.


--
-- Data for Name: planes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.planes (id, plan, precio, custom, "createdAt", "updatedAt") FROM stdin;
1	Prueba Test	0	\N	2018-08-25 16:39:45.505-03	2018-08-25 16:39:45.505-03
\.


--
-- Data for Name: predios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.predios (id, nombre, codigo, localidad, ubicacion, limites, "createdAt", "updatedAt") FROM stdin;
1	Base Desarrollo		Providenca	0101000000FA60191B3AA651C00D96A07543B840C0	\N	2018-08-25 16:39:45.472-03	2018-08-25 16:39:45.472-03
2	Apiario		San Francisco De Mostazal	010100000078A27FDDC4AD51C0A1D79FC4E7FB40C0	\N	2018-08-25 16:39:45.476-03	2018-08-25 16:39:45.476-03
3	Repollo TALCA	CBO2304	Pelarco	0101000000A2B437F8C2DF51C0C72B103D29B541C0	\N	2018-08-25 16:39:45.478-03	2018-08-25 16:39:45.478-03
4	Repollo CHIMBARONGO	CBO2249	Chimbarongo	010100000063D2DF4BE1BE51C04F05DCF3FC5741C0	\N	2018-08-25 16:39:45.48-03	2018-08-25 16:39:45.48-03
5	Bunching Onion  TALCA		Talca	0101000000551344DD07E551C004A9143B1AAF41C0	\N	2018-08-25 16:39:45.484-03	2018-08-25 16:39:45.484-03
\.


--
-- Data for Name: registros; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.registros (id, valor, hora, custom, "createdAt", "updatedAt", utilidad_id, nodo_id, predio_id, nodo_sensor_id) FROM stdin;
589	221	\N	\N	2018-08-30 00:53:29.535-03	2018-08-30 00:53:29.535-03	1	6	1	1
590	401	\N	\N	2018-08-30 00:53:29.535-03	2018-08-30 00:53:29.535-03	2	6	1	1
591	40	\N	\N	2018-08-30 00:53:29.535-03	2018-08-30 00:53:29.535-03	3	6	1	3
592	112	\N	\N	2018-08-30 00:55:54.255-03	2018-08-30 00:55:54.255-03	1	6	1	1
593	707	\N	\N	2018-08-30 00:55:54.255-03	2018-08-30 00:55:54.255-03	2	6	1	1
594	40	\N	\N	2018-08-30 00:55:54.255-03	2018-08-30 00:55:54.255-03	3	6	1	3
595	205	\N	\N	2018-08-30 01:39:22.06-03	2018-08-30 01:39:22.06-03	1	6	1	1
596	626	\N	\N	2018-08-30 01:39:22.06-03	2018-08-30 01:39:22.06-03	2	6	1	1
597	40	\N	\N	2018-08-30 01:39:22.06-03	2018-08-30 01:39:22.06-03	3	6	1	3
598	205	\N	\N	2018-08-30 01:48:52.18-03	2018-08-30 01:48:52.18-03	1	6	1	1
599	626	\N	\N	2018-08-30 01:48:52.18-03	2018-08-30 01:48:52.18-03	2	6	1	1
600	40	\N	\N	2018-08-30 01:48:52.18-03	2018-08-30 01:48:52.18-03	3	6	1	3
601	210	\N	\N	2018-08-30 01:53:17.379-03	2018-08-30 01:53:17.379-03	1	6	1	1
602	583	\N	\N	2018-08-30 01:53:17.379-03	2018-08-30 01:53:17.379-03	2	6	1	1
603	40	\N	\N	2018-08-30 01:53:17.379-03	2018-08-30 01:53:17.379-03	3	6	1	3
604	213	\N	\N	2018-08-30 02:23:00.496-03	2018-08-30 02:23:00.496-03	1	6	1	1
605	557	\N	\N	2018-08-30 02:23:00.496-03	2018-08-30 02:23:00.496-03	2	6	1	1
606	40	\N	\N	2018-08-30 02:23:00.496-03	2018-08-30 02:23:00.496-03	3	6	1	3
607	215	\N	\N	2018-08-30 02:29:18.979-03	2018-08-30 02:29:18.979-03	1	6	1	1
608	550	\N	\N	2018-08-30 02:29:18.979-03	2018-08-30 02:29:18.979-03	2	6	1	1
609	40	\N	\N	2018-08-30 02:29:18.979-03	2018-08-30 02:29:18.979-03	3	6	1	3
610	215	\N	\N	2018-08-30 02:32:28.218-03	2018-08-30 02:32:28.218-03	1	6	1	1
611	551	\N	\N	2018-08-30 02:32:28.218-03	2018-08-30 02:32:28.218-03	2	6	1	1
612	40	\N	\N	2018-08-30 02:32:28.218-03	2018-08-30 02:32:28.218-03	3	6	1	3
613	214	\N	\N	2018-08-30 02:38:46.787-03	2018-08-30 02:38:46.787-03	1	6	1	1
614	534	\N	\N	2018-08-30 02:38:46.787-03	2018-08-30 02:38:46.787-03	2	6	1	1
615	40	\N	\N	2018-08-30 02:38:46.787-03	2018-08-30 02:38:46.787-03	3	6	1	3
616	213	\N	\N	2018-08-30 02:41:56.124-03	2018-08-30 02:41:56.124-03	1	6	1	1
617	531	\N	\N	2018-08-30 02:41:56.124-03	2018-08-30 02:41:56.124-03	2	6	1	1
618	40	\N	\N	2018-08-30 02:41:56.124-03	2018-08-30 02:41:56.124-03	3	6	1	3
619	193	\N	\N	2018-08-30 05:04:58.775-03	2018-08-30 05:04:58.775-03	1	6	1	1
620	534	\N	\N	2018-08-30 05:04:58.775-03	2018-08-30 05:04:58.775-03	2	6	1	1
621	40	\N	\N	2018-08-30 05:04:58.775-03	2018-08-30 05:04:58.775-03	3	6	1	3
622	\N	\N	[]	2018-08-30 05:49:09.77-03	2018-08-30 05:49:09.77-03	4	6	1	\N
623	\N	\N	[167,89,89,89,89,89,89,89,89,89,89,89,89,88,89,89,89,89,88,89,88,88,88,89,89,89,89,88,89,89,88,89,89,88,88,89,89,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,89,88,88,88,88,88,89,88,88,88,88,88,89,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,88,87,88,88,87,87,89,89,89,89,88,89,88,89,88,88,88,89,88,89,89,89,89,89,88,88,88,88,89,89,88,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,88,88,88,87,87,86,86,85,85,85,84,83,84,83,83,83,82,82,80,81,80,80,79,79,78,78,78,77,78,78,78,78,77,77,77,78,78,78,78,78,77,77,77,78,78]	2018-08-30 06:01:18.284-03	2018-08-30 06:01:18.284-03	4	6	1	\N
624	\N	\N	[167,89,89,89,89,89,89,89,89,89,89,89,89,88,89,89,89,89,88,89,88,88,88,89,89,89,89,88,89,89,88,89,89,88,88,89,89,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,89,88,88,88,88,88,89,88,88,88,88,88,89,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,88,87,88,88,87,87,89,89,89,89,88,89,88,89,88,88,88,89,88,89,89,89,89,89,88,88,88,88,89,89,88,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,88,88,88,87,87,86,86,85,85,85,84,83,84,83,83,83,82,82,80,81,80,80,79,79,78,78,78,77,78,78,78,78,77,77,77,78,78,78,78,78,77,77,77,78,78]	2018-08-30 06:01:50.205-03	2018-08-30 06:01:50.205-03	4	6	1	\N
625	194	\N	\N	2018-08-30 06:20:37.641-03	2018-08-30 06:20:37.641-03	1	6	1	1
626	547	\N	\N	2018-08-30 06:20:37.641-03	2018-08-30 06:20:37.641-03	2	6	1	1
627	40	\N	\N	2018-08-30 06:20:37.641-03	2018-08-30 06:20:37.641-03	3	6	1	3
628	\N	\N	[171,82,83,83,83,82,83,83,82,83,83,83,83,83,84,84,84,84,84,84,84,84,84,83,84,84,84,84,84,85,84,85,85,85,85,85,85,85,85,85,85,86,86,86,86,87,87,87,87,87,87,87,87,87,87,88,87,87,88,87,88,88,88,87,87,87,87,86,87,86,85,86,85,85,85,84,85,84,84,84,83,82,81,81,80,80,79,78,78,78,77,77,77,77,77,76,76,76,77,77,77,77,77,77,76,77,77,77,78,78,79,79,80,80,82,82,82,83,83,83,83,84,84,84,85,85,86,87,87,87,87,87,88,88,87,87,87,87,87,87,87,88,88,87,87,87,87,87,87,87,87,87,88,88,87,87,87,87,87,88,88,88,87,87,87,89,88,89,89,88,88,88,88,88,88,89,89,88,89,88,88,88,88,88,88,88,87,87,87,87,87,86,85,85,85,85,85,84,84,83]	2018-08-30 06:21:09.834-03	2018-08-30 06:21:09.834-03	4	6	1	\N
\.


--
-- Data for Name: reportes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reportes (id, asunto, mensaje, whatstapp, email, telegram, sms, web, app, custom, "createdAt", "updatedAt", usuario_id) FROM stdin;
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, roles, custom, "createdAt", "updatedAt") FROM stdin;
1	SuperAdministrador	\N	2018-08-25 16:39:45.487-03	2018-08-25 16:39:45.487-03
2	Administrador Previo	\N	2018-08-25 16:39:45.489-03	2018-08-25 16:39:45.489-03
3	Apicultor	\N	2018-08-25 16:39:45.491-03	2018-08-25 16:39:45.491-03
4	Agricultor	\N	2018-08-25 16:39:45.493-03	2018-08-25 16:39:45.493-03
\.


--
-- Data for Name: roles_usuarios_grupos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles_usuarios_grupos (id, "createdAt", "updatedAt", grupo_id, usuario_id, rol_id) FROM stdin;
1	2018-08-25 16:39:45.513-03	2018-08-25 16:39:45.513-03	1	1	1
\.


--
-- Data for Name: sensores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sensores (id, nombre, descripcion, custom, "createdAt", "updatedAt") FROM stdin;
1	DH11	Mide sensor temperatura y humedad	\N	2018-08-25 16:39:45.453-03	2018-08-25 16:39:45.453-03
2	DH22	Mide sensor temperatura y humedad	\N	2018-08-25 16:39:45.457-03	2018-08-25 16:39:45.457-03
3	Celda de Carga	Modulo HX711 con dos celdas de cargas de 20kg 	\N	2018-08-25 16:39:45.459-03	2018-08-25 16:39:45.459-03
4	SIM800H	Conexion al operador movil, Modem 2g rojo	\N	2018-08-25 16:39:45.461-03	2018-08-25 16:39:45.461-03
5	SIM800L	Conexion al operador movil, Modem 2g azul con antena	\N	2018-08-25 16:39:45.464-03	2018-08-25 16:39:45.464-03
6	Telit	Conexion al operador movil, Modem 3g	\N	2018-08-25 16:39:45.466-03	2018-08-25 16:39:45.466-03
\.


--
-- Data for Name: sensores_utilidades; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sensores_utilidades ("createdAt", "updatedAt", sensor_id, utilidad_id) FROM stdin;
2018-08-25 16:39:45.582-03	2018-08-25 16:39:45.582-03	1	1
2018-08-25 16:39:45.585-03	2018-08-25 16:39:45.585-03	2	1
2018-08-25 16:39:45.588-03	2018-08-25 16:39:45.588-03	1	2
2018-08-25 16:39:45.59-03	2018-08-25 16:39:45.59-03	2	2
2018-08-25 16:39:45.592-03	2018-08-25 16:39:45.592-03	3	3
\.


--
-- Data for Name: sims; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sims (id, "ICCID", numero, dueno, estado, plan, "createdAt", "updatedAt", operador_id) FROM stdin;
1	8956030176691257858	56946117201	2	0	{"plan":"Bolsa M2M 10 MB","valor":0}	2018-08-25 16:39:45.408-03	2018-08-25 16:39:45.408-03	1
2	8956030176691192709	56931272295	2	0	{"plan":"Bolsa BAM 3GB","valor":0}	2018-08-25 16:39:45.412-03	2018-08-25 16:39:45.412-03	1
3	8956034176006010022	56931208132	1	0	{"plan":"Bolsa M2M 20 MB","valor":832}	2018-08-25 16:39:45.415-03	2018-08-25 16:39:45.415-03	1
4	8956034176006010006	56941684719	1	0	{"plan":"Bolsa M2M 20 MB","valor":832}	2018-08-25 16:39:45.417-03	2018-08-25 16:39:45.417-03	1
5	8956034176006010014	56941687162	1	0	{"plan":"Bolsa M2M 20 MB","valor":832}	2018-08-25 16:39:45.419-03	2018-08-25 16:39:45.419-03	1
6	8956034176006010030	56941659820	1	0	{"plan":"Bolsa M2M 20 MB","valor":832}	2018-08-25 16:39:45.424-03	2018-08-25 16:39:45.424-03	1
7	8956034176006010048	56941685904	1	0	{"plan":"Bolsa M2M 20 MB","valor":832}	2018-08-25 16:39:45.426-03	2018-08-25 16:39:45.426-03	1
8	8956034176006010055	56941686747	1	0	{"plan":"Bolsa M2M 20 MB","valor":832}	2018-08-25 16:39:45.429-03	2018-08-25 16:39:45.429-03	1
9	8956034176006010063	56941675408	1	0	{"plan":"Bolsa M2M 20 MB","valor":832}	2018-08-25 16:39:45.432-03	2018-08-25 16:39:45.432-03	1
10	8956034176006010071	56941663536	1	0	{"plan":"Bolsa M2M 20 MB","valor":832}	2018-08-25 16:39:45.434-03	2018-08-25 16:39:45.434-03	1
11	8956034176006010089	56941681740	1	0	{"plan":"Bolsa M2M 20 MB","valor":832}	2018-08-25 16:39:45.437-03	2018-08-25 16:39:45.437-03	1
12	8956034176006010253	56941684263	1	0	{"plan":"Bolsa M2M 20 MB","valor":832}	2018-08-25 16:39:45.439-03	2018-08-25 16:39:45.439-03	1
13	8956030163614062458	56946216664	2	1	{"plan":"Bolsa M2M 10 MB","valor":0}	2018-08-25 16:39:45.441-03	2018-08-25 16:39:45.441-03	1
14	8956030163614062235	56946216663	2	0	{"plan":"Bolsa M2M 10 MB","valor":0}	2018-08-25 16:39:45.443-03	2018-08-25 16:39:45.443-03	1
15	8956030163614062243	56946216603	2	0	{"plan":"Bolsa M2M 10 MB","valor":0}	2018-08-25 16:39:45.446-03	2018-08-25 16:39:45.446-03	1
16	8956030163614062474	56946216666	2	0	{"plan":"Bolsa M2M 10 MB","valor":0}	2018-08-25 16:39:45.448-03	2018-08-25 16:39:45.448-03	1
17	8956030163614062466	56946216667	2	0	{"plan":"Bolsa M2M 10 MB","valor":0}	2018-08-25 16:39:45.451-03	2018-08-25 16:39:45.451-03	1
20	8560100000864719006	\N	1	1	\N	2018-08-29 14:03:44.372112-03	2018-08-29 14:03:44.372112-03	3
18	8560100000864718974	\N	1	1	\N	2018-08-29 14:02:18.599855-03	2018-08-29 14:02:18.599855-03	3
19	8560100000864724956	\N	1	1	\N	2018-08-29 14:04:27.679837-03	2018-08-29 14:04:27.679837-03	3
21	8560100000864718990	\N	1	1	\N	2018-08-29 14:04:52.664683-03	2018-08-29 14:04:52.664683-03	3
23	8560100000864724576	\N	1	1	\N	2018-08-29 14:06:02.923225-03	2018-08-29 14:06:02.923225-03	3
22	8560100000897172603	\N	1	1	\N	2018-08-29 14:05:19.617138-03	2018-08-29 14:05:19.617138-03	3
\.


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (id, nombres, apellidos, rut, passwd, email, telefono, enable, custom, "createdAt", "updatedAt", rol_id) FROM stdin;
1	Manuel	Alba	180206779	mmae2010	malba@beewaze.com	+56968344738	t	\N	2018-08-25 16:39:45.495-03	2018-08-25 16:39:45.495-03	1
2	Monica	Herrera		monica	monica@beewaze.com		t	\N	2018-08-25 16:39:45.498-03	2018-08-25 16:39:45.498-03	1
3	David	Bustamante		bustamante17	david@beewaze.com		t	\N	2018-08-25 16:39:45.5-03	2018-08-25 16:39:45.5-03	1
4	Maximiliano	Barrientos		max	maximiliano@beewaze.com		t	\N	2018-08-25 16:39:45.502-03	2018-08-25 16:39:45.502-03	1
\.


--
-- Data for Name: utilidades; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.utilidades (id, utilidad, "createdAt", "updatedAt") FROM stdin;
1	Temperatura	2018-08-25 16:39:45.574-03	2018-08-25 16:39:45.574-03
2	Humedad	2018-08-25 16:39:45.576-03	2018-08-25 16:39:45.576-03
3	Peso	2018-08-25 16:39:45.578-03	2018-08-25 16:39:45.578-03
4	Sonido	2018-08-25 16:39:45.58-03	2018-08-25 16:39:45.58-03
\.


--
-- Data for Name: versiones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.versiones (id, version, revision, custom, "createdAt", "updatedAt") FROM stdin;
1	BeeOne	A1	\N	2018-08-25 16:39:45.469-03	2018-08-25 16:39:45.469-03
\.


--
-- Name: apicultores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.apicultores_id_seq', 1, false);


--
-- Name: colmenas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.colmenas_id_seq', 5, true);


--
-- Name: conexiones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.conexiones_id_seq', 377, true);


--
-- Name: grupos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.grupos_id_seq', 1, true);


--
-- Name: nodos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.nodos_id_seq', 6, true);


--
-- Name: nodos_sensores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.nodos_sensores_id_seq', 4, true);


--
-- Name: operadores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.operadores_id_seq', 3, true);


--
-- Name: planes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.planes_id_seq', 1, true);


--
-- Name: predios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.predios_id_seq', 5, true);


--
-- Name: registros_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.registros_id_seq', 628, true);


--
-- Name: reportes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reportes_id_seq', 1, false);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 4, true);


--
-- Name: roles_usuarios_grupos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_usuarios_grupos_id_seq', 1, true);


--
-- Name: sensores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sensores_id_seq', 6, true);


--
-- Name: sims_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sims_id_seq', 23, true);


--
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_seq', 4, true);


--
-- Name: utilidades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.utilidades_id_seq', 4, true);


--
-- Name: versiones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.versiones_id_seq', 1, true);


--
-- Name: apicultores apicultores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.apicultores
    ADD CONSTRAINT apicultores_pkey PRIMARY KEY (id);


--
-- Name: apicultores_usuarios apicultores_usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.apicultores_usuarios
    ADD CONSTRAINT apicultores_usuarios_pkey PRIMARY KEY (apicultor_id, usuario_id);


--
-- Name: colmenas colmenas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colmenas
    ADD CONSTRAINT colmenas_pkey PRIMARY KEY (id);


--
-- Name: conexiones conexiones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conexiones
    ADD CONSTRAINT conexiones_pkey PRIMARY KEY (id);


--
-- Name: grupos grupos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grupos
    ADD CONSTRAINT grupos_pkey PRIMARY KEY (id);


--
-- Name: grupos_predios grupos_predios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grupos_predios
    ADD CONSTRAINT grupos_predios_pkey PRIMARY KEY (grupo_id, predio_id);


--
-- Name: nodos nodos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nodos
    ADD CONSTRAINT nodos_pkey PRIMARY KEY (id);


--
-- Name: nodos_sensores nodos_sensores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nodos_sensores
    ADD CONSTRAINT nodos_sensores_pkey PRIMARY KEY (id);


--
-- Name: operadores operadores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.operadores
    ADD CONSTRAINT operadores_pkey PRIMARY KEY (id);


--
-- Name: planes planes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planes
    ADD CONSTRAINT planes_pkey PRIMARY KEY (id);


--
-- Name: predios predios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.predios
    ADD CONSTRAINT predios_pkey PRIMARY KEY (id);


--
-- Name: registros registros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registros
    ADD CONSTRAINT registros_pkey PRIMARY KEY (id);


--
-- Name: reportes reportes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reportes
    ADD CONSTRAINT reportes_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: roles_usuarios_grupos roles_usuarios_grupos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles_usuarios_grupos
    ADD CONSTRAINT roles_usuarios_grupos_pkey PRIMARY KEY (id);


--
-- Name: sensores sensores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sensores
    ADD CONSTRAINT sensores_pkey PRIMARY KEY (id);


--
-- Name: sensores_utilidades sensores_utilidades_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sensores_utilidades
    ADD CONSTRAINT sensores_utilidades_pkey PRIMARY KEY (sensor_id, utilidad_id);


--
-- Name: sims sims_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sims
    ADD CONSTRAINT sims_pkey PRIMARY KEY (id);


--
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- Name: utilidades utilidades_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilidades
    ADD CONSTRAINT utilidades_pkey PRIMARY KEY (id);


--
-- Name: versiones versiones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.versiones
    ADD CONSTRAINT versiones_pkey PRIMARY KEY (id);


--
-- Name: apicultores_usuarios apicultores_usuarios_apicultor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.apicultores_usuarios
    ADD CONSTRAINT apicultores_usuarios_apicultor_id_fkey FOREIGN KEY (apicultor_id) REFERENCES public.apicultores(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: apicultores_usuarios apicultores_usuarios_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.apicultores_usuarios
    ADD CONSTRAINT apicultores_usuarios_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: colmenas colmenas_apicultor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colmenas
    ADD CONSTRAINT colmenas_apicultor_id_fkey FOREIGN KEY (apicultor_id) REFERENCES public.apicultores(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: colmenas colmenas_predio_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colmenas
    ADD CONSTRAINT colmenas_predio_id_fkey FOREIGN KEY (predio_id) REFERENCES public.predios(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: conexiones conexiones_nodo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conexiones
    ADD CONSTRAINT conexiones_nodo_id_fkey FOREIGN KEY (nodo_id) REFERENCES public.nodos(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: conexiones conexiones_predio_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conexiones
    ADD CONSTRAINT conexiones_predio_id_fkey FOREIGN KEY (predio_id) REFERENCES public.predios(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: grupos grupos_plan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grupos
    ADD CONSTRAINT grupos_plan_id_fkey FOREIGN KEY (plan_id) REFERENCES public.planes(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: grupos_predios grupos_predios_grupo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grupos_predios
    ADD CONSTRAINT grupos_predios_grupo_id_fkey FOREIGN KEY (grupo_id) REFERENCES public.grupos(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: grupos_predios grupos_predios_predio_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grupos_predios
    ADD CONSTRAINT grupos_predios_predio_id_fkey FOREIGN KEY (predio_id) REFERENCES public.predios(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: grupos grupos_rol_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grupos
    ADD CONSTRAINT grupos_rol_id_fkey FOREIGN KEY (rol_id) REFERENCES public.roles(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: nodos nodos_colmena_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nodos
    ADD CONSTRAINT nodos_colmena_id_fkey FOREIGN KEY (colmena_id) REFERENCES public.colmenas(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: nodos_sensores nodos_sensores_nodo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nodos_sensores
    ADD CONSTRAINT nodos_sensores_nodo_id_fkey FOREIGN KEY (nodo_id) REFERENCES public.nodos(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: nodos_sensores nodos_sensores_sensor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nodos_sensores
    ADD CONSTRAINT nodos_sensores_sensor_id_fkey FOREIGN KEY (sensor_id) REFERENCES public.sensores(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: nodos nodos_sim_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nodos
    ADD CONSTRAINT nodos_sim_id_fkey FOREIGN KEY (sim_id) REFERENCES public.sims(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: nodos nodos_version_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nodos
    ADD CONSTRAINT nodos_version_id_fkey FOREIGN KEY (version_id) REFERENCES public.versiones(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: registros registros_nodo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registros
    ADD CONSTRAINT registros_nodo_id_fkey FOREIGN KEY (nodo_id) REFERENCES public.nodos(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: registros registros_nodo_sensor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registros
    ADD CONSTRAINT registros_nodo_sensor_id_fkey FOREIGN KEY (nodo_sensor_id) REFERENCES public.nodos_sensores(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: registros registros_predio_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registros
    ADD CONSTRAINT registros_predio_id_fkey FOREIGN KEY (predio_id) REFERENCES public.predios(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: registros registros_utilidad_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registros
    ADD CONSTRAINT registros_utilidad_id_fkey FOREIGN KEY (utilidad_id) REFERENCES public.utilidades(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: reportes reportes_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reportes
    ADD CONSTRAINT reportes_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: roles_usuarios_grupos roles_usuarios_grupos_grupo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles_usuarios_grupos
    ADD CONSTRAINT roles_usuarios_grupos_grupo_id_fkey FOREIGN KEY (grupo_id) REFERENCES public.grupos(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: roles_usuarios_grupos roles_usuarios_grupos_rol_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles_usuarios_grupos
    ADD CONSTRAINT roles_usuarios_grupos_rol_id_fkey FOREIGN KEY (rol_id) REFERENCES public.roles(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: roles_usuarios_grupos roles_usuarios_grupos_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles_usuarios_grupos
    ADD CONSTRAINT roles_usuarios_grupos_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: sensores_utilidades sensores_utilidades_sensor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sensores_utilidades
    ADD CONSTRAINT sensores_utilidades_sensor_id_fkey FOREIGN KEY (sensor_id) REFERENCES public.sensores(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: sensores_utilidades sensores_utilidades_utilidad_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sensores_utilidades
    ADD CONSTRAINT sensores_utilidades_utilidad_id_fkey FOREIGN KEY (utilidad_id) REFERENCES public.utilidades(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: sims sims_operador_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sims
    ADD CONSTRAINT sims_operador_id_fkey FOREIGN KEY (operador_id) REFERENCES public.operadores(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: usuarios usuarios_rol_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_rol_id_fkey FOREIGN KEY (rol_id) REFERENCES public.roles(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

