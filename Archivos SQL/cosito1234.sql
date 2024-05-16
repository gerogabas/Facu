--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4
-- Dumped by pg_dump version 15.4

-- Started on 2023-09-12 20:52:24

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

--
-- TOC entry 866 (class 1247 OID 25668)
-- Name: dni; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN public.dni AS character varying(8)
	CONSTRAINT dninum CHECK (((VALUE)::text ~ '^[0-9]+$'::text));


ALTER DOMAIN public.dni OWNER TO postgres;

--
-- TOC entry 870 (class 1247 OID 25671)
-- Name: id_legajo; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN public.id_legajo AS character varying(10)
	CONSTRAINT id_legajonum CHECK (((VALUE)::text ~ '^[0-9]+$'::text));


ALTER DOMAIN public.id_legajo OWNER TO postgres;

--
-- TOC entry 862 (class 1247 OID 25665)
-- Name: isbn; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN public.isbn AS character varying(13)
	CONSTRAINT isbnnum CHECK (((VALUE)::text ~ '^[0-9]+$'::text));


ALTER DOMAIN public.isbn OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 231 (class 1259 OID 25819)
-- Name: alumnos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alumnos (
    libreta public.id_legajo NOT NULL,
    dni public.dni,
    carrera_id integer,
    fecha_inscripcion date,
    foto bytea
);


ALTER TABLE public.alumnos OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 25903)
-- Name: articulo_revista; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.articulo_revista (
    elem_id public.isbn NOT NULL,
    nro_articulo character varying(3) NOT NULL,
    detalle text
);


ALTER TABLE public.articulo_revista OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 25915)
-- Name: autor_articulo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.autor_articulo (
    elem_id public.isbn NOT NULL,
    nro_articulo character varying(3) NOT NULL,
    autor_id integer NOT NULL
);


ALTER TABLE public.autor_articulo OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 25733)
-- Name: autores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.autores (
    autor_id integer NOT NULL,
    apellidos character varying(30),
    nombres character varying(30)
);


ALTER TABLE public.autores OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 25732)
-- Name: autores_autor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.autores_autor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.autores_autor_id_seq OWNER TO postgres;

--
-- TOC entry 3511 (class 0 OID 0)
-- Dependencies: 223
-- Name: autores_autor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.autores_autor_id_seq OWNED BY public.autores.autor_id;


--
-- TOC entry 225 (class 1259 OID 25739)
-- Name: autores_libros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.autores_libros (
    elem_id public.isbn NOT NULL,
    autor_id integer NOT NULL
);


ALTER TABLE public.autores_libros OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 25693)
-- Name: carreras; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.carreras (
    carrera_id integer NOT NULL,
    tipo_carrera character varying(30),
    detalle text
);


ALTER TABLE public.carreras OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 25692)
-- Name: carreras_carrera_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.carreras_carrera_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.carreras_carrera_id_seq OWNER TO postgres;

--
-- TOC entry 3512 (class 0 OID 0)
-- Dependencies: 216
-- Name: carreras_carrera_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.carreras_carrera_id_seq OWNED BY public.carreras.carrera_id;


--
-- TOC entry 233 (class 1259 OID 25848)
-- Name: docentes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.docentes (
    id_legajo public.id_legajo NOT NULL,
    dni public.dni,
    fecha_inscripcion date
);


ALTER TABLE public.docentes OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 25726)
-- Name: editorial; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.editorial (
    editorial_id integer NOT NULL,
    nom_editorial character varying(30),
    pagina_oficial character varying(50),
    mail character varying(30)
);


ALTER TABLE public.editorial OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 25725)
-- Name: editorial_editorial_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.editorial_editorial_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.editorial_editorial_id_seq OWNER TO postgres;

--
-- TOC entry 3513 (class 0 OID 0)
-- Dependencies: 221
-- Name: editorial_editorial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.editorial_editorial_id_seq OWNED BY public.editorial.editorial_id;


--
-- TOC entry 227 (class 1259 OID 25778)
-- Name: ejemplares; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ejemplares (
    elem_id public.isbn NOT NULL,
    nro_ejemplar integer NOT NULL,
    retirable boolean
);


ALTER TABLE public.ejemplares OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 25701)
-- Name: elemento_carrera; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.elemento_carrera (
    elem_id public.isbn NOT NULL,
    carrera_id integer NOT NULL
);


ALTER TABLE public.elemento_carrera OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 25673)
-- Name: elementos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.elementos (
    elem_id public.isbn NOT NULL,
    titulo character varying(50),
    max_dias character varying(1)
);


ALTER TABLE public.elementos OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 25872)
-- Name: empleados; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.empleados (
    cod_empleado character varying(1) NOT NULL,
    descripcion character varying(30),
    observacion text
);


ALTER TABLE public.empleados OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 25756)
-- Name: libros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.libros (
    elem_id public.isbn NOT NULL,
    tipo_libro integer,
    id_editorial integer,
    lengua_origen character varying(50),
    lengua_escritura character varying(50),
    cant_paginas integer
);


ALTER TABLE public.libros OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 25860)
-- Name: moras_docentes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.moras_docentes (
    id_legajo public.id_legajo NOT NULL,
    suspension_ts timestamp without time zone NOT NULL,
    descripcion text
);


ALTER TABLE public.moras_docentes OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 25790)
-- Name: periodo_revista; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.periodo_revista (
    tipo_periodo character varying(1) NOT NULL,
    descripcion character varying(20)
);


ALTER TABLE public.periodo_revista OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 25812)
-- Name: personas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personas (
    dni public.dni NOT NULL,
    apellidos character varying(40),
    nombres character varying(30)
);


ALTER TABLE public.personas OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 25880)
-- Name: prestamos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prestamos (
    cod_prestamo integer NOT NULL,
    elemento_id public.isbn,
    nro_ejemplar integer,
    cod_empleado character varying(1),
    id_legajo public.id_legajo,
    fecha_retiro date,
    fecha_devol date,
    fecha_realdevol date
);


ALTER TABLE public.prestamos OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 25879)
-- Name: prestamos_cod_prestamo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.prestamos_cod_prestamo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prestamos_cod_prestamo_seq OWNER TO postgres;

--
-- TOC entry 3514 (class 0 OID 0)
-- Dependencies: 236
-- Name: prestamos_cod_prestamo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.prestamos_cod_prestamo_seq OWNED BY public.prestamos.cod_prestamo;


--
-- TOC entry 215 (class 1259 OID 25680)
-- Name: resumenes_capitulo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resumenes_capitulo (
    elem_id public.isbn NOT NULL,
    nro_capitulo character varying(3) NOT NULL,
    resumen text
);


ALTER TABLE public.resumenes_capitulo OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 25795)
-- Name: revistas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.revistas (
    elem_id public.isbn NOT NULL,
    nro_edicion character varying(5) NOT NULL,
    tipo_periodo character varying(1)
);


ALTER TABLE public.revistas OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 25836)
-- Name: suspensiones_alumn; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.suspensiones_alumn (
    libreta public.id_legajo NOT NULL,
    suspension_ts timestamp without time zone NOT NULL,
    descripcion text
);


ALTER TABLE public.suspensiones_alumn OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 25719)
-- Name: tipo_libro; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_libro (
    id_tipo_libro integer NOT NULL,
    descripcion character varying(20)
);


ALTER TABLE public.tipo_libro OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 25718)
-- Name: tipo_libro_id_tipo_libro_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipo_libro_id_tipo_libro_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_libro_id_tipo_libro_seq OWNER TO postgres;

--
-- TOC entry 3515 (class 0 OID 0)
-- Dependencies: 219
-- Name: tipo_libro_id_tipo_libro_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipo_libro_id_tipo_libro_seq OWNED BY public.tipo_libro.id_tipo_libro;


--
-- TOC entry 3272 (class 2604 OID 25736)
-- Name: autores autor_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autores ALTER COLUMN autor_id SET DEFAULT nextval('public.autores_autor_id_seq'::regclass);


--
-- TOC entry 3269 (class 2604 OID 25696)
-- Name: carreras carrera_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carreras ALTER COLUMN carrera_id SET DEFAULT nextval('public.carreras_carrera_id_seq'::regclass);


--
-- TOC entry 3271 (class 2604 OID 25729)
-- Name: editorial editorial_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.editorial ALTER COLUMN editorial_id SET DEFAULT nextval('public.editorial_editorial_id_seq'::regclass);


--
-- TOC entry 3273 (class 2604 OID 25883)
-- Name: prestamos cod_prestamo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prestamos ALTER COLUMN cod_prestamo SET DEFAULT nextval('public.prestamos_cod_prestamo_seq'::regclass);


--
-- TOC entry 3270 (class 2604 OID 25722)
-- Name: tipo_libro id_tipo_libro; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_libro ALTER COLUMN id_tipo_libro SET DEFAULT nextval('public.tipo_libro_id_tipo_libro_seq'::regclass);


--
-- TOC entry 3497 (class 0 OID 25819)
-- Dependencies: 231
-- Data for Name: alumnos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alumnos (libreta, dni, carrera_id, fecha_inscripcion, foto) FROM stdin;
17290	40160500	4	\N	\N
17291	40160501	3	\N	\N
17292	40160502	1	\N	\N
17293	40160503	1	\N	\N
\.


--
-- TOC entry 3504 (class 0 OID 25903)
-- Dependencies: 238
-- Data for Name: articulo_revista; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.articulo_revista (elem_id, nro_articulo, detalle) FROM stdin;
\.


--
-- TOC entry 3505 (class 0 OID 25915)
-- Dependencies: 239
-- Data for Name: autor_articulo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.autor_articulo (elem_id, nro_articulo, autor_id) FROM stdin;
\.


--
-- TOC entry 3490 (class 0 OID 25733)
-- Dependencies: 224
-- Data for Name: autores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.autores (autor_id, apellidos, nombres) FROM stdin;
\.


--
-- TOC entry 3491 (class 0 OID 25739)
-- Dependencies: 225
-- Data for Name: autores_libros; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.autores_libros (elem_id, autor_id) FROM stdin;
\.


--
-- TOC entry 3483 (class 0 OID 25693)
-- Dependencies: 217
-- Data for Name: carreras; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.carreras (carrera_id, tipo_carrera, detalle) FROM stdin;
1	Pre-Grado	Tecnicatura en Programacion
2	Pre-Grado	Tecnicatura en Alimentacion
3	Ingenieria	Civil
4	Ingenieria	Electronica
5	Ingenieria	ElectroMecanica
\.


--
-- TOC entry 3499 (class 0 OID 25848)
-- Dependencies: 233
-- Data for Name: docentes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.docentes (id_legajo, dni, fecha_inscripcion) FROM stdin;
\.


--
-- TOC entry 3488 (class 0 OID 25726)
-- Dependencies: 222
-- Data for Name: editorial; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.editorial (editorial_id, nom_editorial, pagina_oficial, mail) FROM stdin;
\.


--
-- TOC entry 3493 (class 0 OID 25778)
-- Dependencies: 227
-- Data for Name: ejemplares; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ejemplares (elem_id, nro_ejemplar, retirable) FROM stdin;
\.


--
-- TOC entry 3484 (class 0 OID 25701)
-- Dependencies: 218
-- Data for Name: elemento_carrera; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.elemento_carrera (elem_id, carrera_id) FROM stdin;
\.


--
-- TOC entry 3480 (class 0 OID 25673)
-- Dependencies: 214
-- Data for Name: elementos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.elementos (elem_id, titulo, max_dias) FROM stdin;
\.


--
-- TOC entry 3501 (class 0 OID 25872)
-- Dependencies: 235
-- Data for Name: empleados; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.empleados (cod_empleado, descripcion, observacion) FROM stdin;
B	Bibliotecario	Jefe
A	Auxiliar	\N
E	Becario	No pueden entregar prestamos, solo recibir devoluciones
\.


--
-- TOC entry 3492 (class 0 OID 25756)
-- Dependencies: 226
-- Data for Name: libros; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.libros (elem_id, tipo_libro, id_editorial, lengua_origen, lengua_escritura, cant_paginas) FROM stdin;
\.


--
-- TOC entry 3500 (class 0 OID 25860)
-- Dependencies: 234
-- Data for Name: moras_docentes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.moras_docentes (id_legajo, suspension_ts, descripcion) FROM stdin;
\.


--
-- TOC entry 3494 (class 0 OID 25790)
-- Dependencies: 228
-- Data for Name: periodo_revista; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.periodo_revista (tipo_periodo, descripcion) FROM stdin;
\.


--
-- TOC entry 3496 (class 0 OID 25812)
-- Dependencies: 230
-- Data for Name: personas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personas (dni, apellidos, nombres) FROM stdin;
40160500	gomez	roberto
40160501	gomez	juan
40160502	gomez	Marcos
40160503	gomez	Pedro
\.


--
-- TOC entry 3503 (class 0 OID 25880)
-- Dependencies: 237
-- Data for Name: prestamos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prestamos (cod_prestamo, elemento_id, nro_ejemplar, cod_empleado, id_legajo, fecha_retiro, fecha_devol, fecha_realdevol) FROM stdin;
1	\N	\N	\N	17290	2023-09-12	\N	\N
2	\N	\N	\N	17290	2023-09-12	\N	\N
3	\N	\N	\N	17290	2023-09-12	\N	\N
4	\N	\N	\N	17290	2023-09-12	\N	\N
5	\N	\N	\N	17291	2023-09-12	\N	\N
6	\N	\N	\N	17291	2023-09-12	\N	\N
7	\N	\N	\N	17291	2023-09-12	\N	\N
8	\N	\N	\N	17291	2023-09-12	\N	\N
9	\N	\N	\N	17292	2023-09-12	\N	\N
10	\N	\N	\N	17292	2023-09-12	\N	\N
11	\N	\N	\N	17292	2023-09-12	\N	\N
12	\N	\N	\N	17293	2023-09-12	\N	\N
13	\N	\N	\N	17293	2023-09-12	\N	\N
\.


--
-- TOC entry 3481 (class 0 OID 25680)
-- Dependencies: 215
-- Data for Name: resumenes_capitulo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resumenes_capitulo (elem_id, nro_capitulo, resumen) FROM stdin;
\.


--
-- TOC entry 3495 (class 0 OID 25795)
-- Dependencies: 229
-- Data for Name: revistas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.revistas (elem_id, nro_edicion, tipo_periodo) FROM stdin;
\.


--
-- TOC entry 3498 (class 0 OID 25836)
-- Dependencies: 232
-- Data for Name: suspensiones_alumn; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.suspensiones_alumn (libreta, suspension_ts, descripcion) FROM stdin;
\.


--
-- TOC entry 3486 (class 0 OID 25719)
-- Dependencies: 220
-- Data for Name: tipo_libro; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tipo_libro (id_tipo_libro, descripcion) FROM stdin;
\.


--
-- TOC entry 3516 (class 0 OID 0)
-- Dependencies: 223
-- Name: autores_autor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.autores_autor_id_seq', 1, false);


--
-- TOC entry 3517 (class 0 OID 0)
-- Dependencies: 216
-- Name: carreras_carrera_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.carreras_carrera_id_seq', 5, true);


--
-- TOC entry 3518 (class 0 OID 0)
-- Dependencies: 221
-- Name: editorial_editorial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.editorial_editorial_id_seq', 1, false);


--
-- TOC entry 3519 (class 0 OID 0)
-- Dependencies: 236
-- Name: prestamos_cod_prestamo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.prestamos_cod_prestamo_seq', 13, true);


--
-- TOC entry 3520 (class 0 OID 0)
-- Dependencies: 219
-- Name: tipo_libro_id_tipo_libro_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipo_libro_id_tipo_libro_seq', 1, false);


--
-- TOC entry 3301 (class 2606 OID 25825)
-- Name: alumnos alumnos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumnos
    ADD CONSTRAINT alumnos_pkey PRIMARY KEY (libreta);


--
-- TOC entry 3313 (class 2606 OID 25909)
-- Name: articulo_revista articulo_revista_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.articulo_revista
    ADD CONSTRAINT articulo_revista_pkey PRIMARY KEY (elem_id, nro_articulo);


--
-- TOC entry 3315 (class 2606 OID 25921)
-- Name: autor_articulo autor_articulo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autor_articulo
    ADD CONSTRAINT autor_articulo_pkey PRIMARY KEY (elem_id, nro_articulo, autor_id);


--
-- TOC entry 3289 (class 2606 OID 25745)
-- Name: autores_libros autores_libros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autores_libros
    ADD CONSTRAINT autores_libros_pkey PRIMARY KEY (elem_id, autor_id);


--
-- TOC entry 3287 (class 2606 OID 25738)
-- Name: autores autores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autores
    ADD CONSTRAINT autores_pkey PRIMARY KEY (autor_id);


--
-- TOC entry 3279 (class 2606 OID 25700)
-- Name: carreras carreras_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carreras
    ADD CONSTRAINT carreras_pkey PRIMARY KEY (carrera_id);


--
-- TOC entry 3305 (class 2606 OID 25854)
-- Name: docentes docentes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.docentes
    ADD CONSTRAINT docentes_pkey PRIMARY KEY (id_legajo);


--
-- TOC entry 3285 (class 2606 OID 25731)
-- Name: editorial editorial_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.editorial
    ADD CONSTRAINT editorial_pkey PRIMARY KEY (editorial_id);


--
-- TOC entry 3293 (class 2606 OID 25784)
-- Name: ejemplares ejemplares_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ejemplares
    ADD CONSTRAINT ejemplares_pkey PRIMARY KEY (elem_id, nro_ejemplar);


--
-- TOC entry 3281 (class 2606 OID 25707)
-- Name: elemento_carrera elemento_carrera_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.elemento_carrera
    ADD CONSTRAINT elemento_carrera_pkey PRIMARY KEY (elem_id, carrera_id);


--
-- TOC entry 3275 (class 2606 OID 25679)
-- Name: elementos elementos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.elementos
    ADD CONSTRAINT elementos_pkey PRIMARY KEY (elem_id);


--
-- TOC entry 3309 (class 2606 OID 25878)
-- Name: empleados empleados_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleados
    ADD CONSTRAINT empleados_pkey PRIMARY KEY (cod_empleado);


--
-- TOC entry 3291 (class 2606 OID 25762)
-- Name: libros libros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros
    ADD CONSTRAINT libros_pkey PRIMARY KEY (elem_id);


--
-- TOC entry 3307 (class 2606 OID 25866)
-- Name: moras_docentes moras_docentes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moras_docentes
    ADD CONSTRAINT moras_docentes_pkey PRIMARY KEY (id_legajo, suspension_ts);


--
-- TOC entry 3295 (class 2606 OID 25794)
-- Name: periodo_revista periodo_revista_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.periodo_revista
    ADD CONSTRAINT periodo_revista_pkey PRIMARY KEY (tipo_periodo);


--
-- TOC entry 3299 (class 2606 OID 25818)
-- Name: personas personas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personas
    ADD CONSTRAINT personas_pkey PRIMARY KEY (dni);


--
-- TOC entry 3311 (class 2606 OID 25887)
-- Name: prestamos prestamos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prestamos
    ADD CONSTRAINT prestamos_pkey PRIMARY KEY (cod_prestamo);


--
-- TOC entry 3277 (class 2606 OID 25686)
-- Name: resumenes_capitulo resumenes_capitulo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resumenes_capitulo
    ADD CONSTRAINT resumenes_capitulo_pkey PRIMARY KEY (elem_id, nro_capitulo);


--
-- TOC entry 3297 (class 2606 OID 25801)
-- Name: revistas revistas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.revistas
    ADD CONSTRAINT revistas_pkey PRIMARY KEY (elem_id, nro_edicion);


--
-- TOC entry 3303 (class 2606 OID 25842)
-- Name: suspensiones_alumn suspensiones_alumn_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suspensiones_alumn
    ADD CONSTRAINT suspensiones_alumn_pkey PRIMARY KEY (libreta, suspension_ts);


--
-- TOC entry 3283 (class 2606 OID 25724)
-- Name: tipo_libro tipo_libro_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_libro
    ADD CONSTRAINT tipo_libro_pkey PRIMARY KEY (id_tipo_libro);


--
-- TOC entry 3327 (class 2606 OID 25831)
-- Name: alumnos alumnos_carrera_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumnos
    ADD CONSTRAINT alumnos_carrera_id_fkey FOREIGN KEY (carrera_id) REFERENCES public.carreras(carrera_id);


--
-- TOC entry 3328 (class 2606 OID 25826)
-- Name: alumnos alumnos_dni_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumnos
    ADD CONSTRAINT alumnos_dni_fkey FOREIGN KEY (dni) REFERENCES public.personas(dni);


--
-- TOC entry 3335 (class 2606 OID 25910)
-- Name: articulo_revista articulo_revista_elem_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.articulo_revista
    ADD CONSTRAINT articulo_revista_elem_id_fkey FOREIGN KEY (elem_id) REFERENCES public.elementos(elem_id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3336 (class 2606 OID 25927)
-- Name: autor_articulo autor_articulo_autor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autor_articulo
    ADD CONSTRAINT autor_articulo_autor_id_fkey FOREIGN KEY (autor_id) REFERENCES public.autores(autor_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3337 (class 2606 OID 25922)
-- Name: autor_articulo autor_articulo_elem_id_nro_articulo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autor_articulo
    ADD CONSTRAINT autor_articulo_elem_id_nro_articulo_fkey FOREIGN KEY (elem_id, nro_articulo) REFERENCES public.articulo_revista(elem_id, nro_articulo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3319 (class 2606 OID 25751)
-- Name: autores_libros autores_libros_autor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autores_libros
    ADD CONSTRAINT autores_libros_autor_id_fkey FOREIGN KEY (autor_id) REFERENCES public.autores(autor_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3320 (class 2606 OID 25746)
-- Name: autores_libros autores_libros_elem_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autores_libros
    ADD CONSTRAINT autores_libros_elem_id_fkey FOREIGN KEY (elem_id) REFERENCES public.elementos(elem_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3330 (class 2606 OID 25855)
-- Name: docentes docentes_dni_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.docentes
    ADD CONSTRAINT docentes_dni_fkey FOREIGN KEY (dni) REFERENCES public.personas(dni);


--
-- TOC entry 3324 (class 2606 OID 25785)
-- Name: ejemplares ejemplares_elem_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ejemplares
    ADD CONSTRAINT ejemplares_elem_id_fkey FOREIGN KEY (elem_id) REFERENCES public.elementos(elem_id) ON DELETE SET NULL;


--
-- TOC entry 3317 (class 2606 OID 25713)
-- Name: elemento_carrera elemento_carrera_carrera_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.elemento_carrera
    ADD CONSTRAINT elemento_carrera_carrera_id_fkey FOREIGN KEY (carrera_id) REFERENCES public.carreras(carrera_id) ON DELETE CASCADE;


--
-- TOC entry 3318 (class 2606 OID 25708)
-- Name: elemento_carrera elemento_carrera_elem_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.elemento_carrera
    ADD CONSTRAINT elemento_carrera_elem_id_fkey FOREIGN KEY (elem_id) REFERENCES public.elementos(elem_id) ON DELETE CASCADE;


--
-- TOC entry 3321 (class 2606 OID 25763)
-- Name: libros libros_elem_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros
    ADD CONSTRAINT libros_elem_id_fkey FOREIGN KEY (elem_id) REFERENCES public.elementos(elem_id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3322 (class 2606 OID 25773)
-- Name: libros libros_id_editorial_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros
    ADD CONSTRAINT libros_id_editorial_fkey FOREIGN KEY (id_editorial) REFERENCES public.editorial(editorial_id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3323 (class 2606 OID 25768)
-- Name: libros libros_tipo_libro_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros
    ADD CONSTRAINT libros_tipo_libro_fkey FOREIGN KEY (tipo_libro) REFERENCES public.tipo_libro(id_tipo_libro) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3331 (class 2606 OID 25867)
-- Name: moras_docentes moras_docentes_id_legajo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moras_docentes
    ADD CONSTRAINT moras_docentes_id_legajo_fkey FOREIGN KEY (id_legajo) REFERENCES public.docentes(id_legajo);


--
-- TOC entry 3332 (class 2606 OID 25888)
-- Name: prestamos prestamos_cod_empleado_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prestamos
    ADD CONSTRAINT prestamos_cod_empleado_fkey FOREIGN KEY (cod_empleado) REFERENCES public.empleados(cod_empleado);


--
-- TOC entry 3333 (class 2606 OID 25898)
-- Name: prestamos prestamos_elemento_id_nro_ejemplar_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prestamos
    ADD CONSTRAINT prestamos_elemento_id_nro_ejemplar_fkey FOREIGN KEY (elemento_id, nro_ejemplar) REFERENCES public.ejemplares(elem_id, nro_ejemplar);


--
-- TOC entry 3334 (class 2606 OID 25893)
-- Name: prestamos prestamos_id_legajo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prestamos
    ADD CONSTRAINT prestamos_id_legajo_fkey FOREIGN KEY (id_legajo) REFERENCES public.alumnos(libreta);


--
-- TOC entry 3316 (class 2606 OID 25687)
-- Name: resumenes_capitulo resumenes_capitulo_elem_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resumenes_capitulo
    ADD CONSTRAINT resumenes_capitulo_elem_id_fkey FOREIGN KEY (elem_id) REFERENCES public.elementos(elem_id) ON DELETE CASCADE;


--
-- TOC entry 3325 (class 2606 OID 25802)
-- Name: revistas revistas_elem_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.revistas
    ADD CONSTRAINT revistas_elem_id_fkey FOREIGN KEY (elem_id) REFERENCES public.elementos(elem_id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3326 (class 2606 OID 25807)
-- Name: revistas revistas_tipo_periodo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.revistas
    ADD CONSTRAINT revistas_tipo_periodo_fkey FOREIGN KEY (tipo_periodo) REFERENCES public.periodo_revista(tipo_periodo) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3329 (class 2606 OID 25843)
-- Name: suspensiones_alumn suspensiones_alumn_libreta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suspensiones_alumn
    ADD CONSTRAINT suspensiones_alumn_libreta_fkey FOREIGN KEY (libreta) REFERENCES public.alumnos(libreta);


-- Completed on 2023-09-12 20:52:24

--
-- PostgreSQL database dump complete
--

