--
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 12.7 (Ubuntu 12.7-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.7 (Ubuntu 12.7-0ubuntu0.20.04.1)

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

DROP DATABASE "SISA11_development";
--
-- Name: SISA11_development; Type: DATABASE; Schema: -; Owner: mdiaz
--

CREATE DATABASE "SISA11_development" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'es_AR.UTF-8' LC_CTYPE = 'es_AR.UTF-8';


ALTER DATABASE "SISA11_development" OWNER TO mdiaz;

\connect "SISA11_development"

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
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: mdiaz
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO mdiaz;

--
-- Name: clientes; Type: TABLE; Schema: public; Owner: mdiaz
--

CREATE TABLE public.clientes (
    id bigint NOT NULL,
    cuit character varying,
    rubro character varying,
    apellido character varying,
    nombre character varying,
    domicilio character varying,
    barrio character varying,
    celular character varying,
    telefono character varying,
    correo character varying,
    observaciones_cliente character varying,
    tipo_cliente character varying,
    calificacion integer,
    baja boolean,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    localidad character varying
);


ALTER TABLE public.clientes OWNER TO mdiaz;

--
-- Name: clientes_id_seq; Type: SEQUENCE; Schema: public; Owner: mdiaz
--

CREATE SEQUENCE public.clientes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clientes_id_seq OWNER TO mdiaz;

--
-- Name: clientes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdiaz
--

ALTER SEQUENCE public.clientes_id_seq OWNED BY public.clientes.id;


--
-- Name: contactos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contactos (
    id_cliente bigint,
    apellido character varying,
    nombre character varying,
    domicilio character varying,
    telefono character varying,
    celular character varying,
    barrio character varying,
    rubro character varying,
    estado character varying
);


ALTER TABLE public.contactos OWNER TO postgres;

--
-- Name: orden_fumigacions; Type: TABLE; Schema: public; Owner: mdiaz
--

CREATE TABLE public.orden_fumigacions (
    id bigint NOT NULL,
    cliente_id bigint NOT NULL,
    tecnico_id bigint NOT NULL,
    nro_ordfumigacion integer,
    nro_certificado integer,
    tipo_certificado character varying,
    fecha_aplicacion date,
    hora_aplicacion time without time zone,
    tratamiento character varying,
    vector character varying,
    superficie character varying,
    veneno character varying,
    droga character varying,
    observaciones_ordfumigacion character varying,
    fecha_vencimiento date,
    proximo_tratamiento date,
    importe integer,
    estado character varying,
    baja boolean,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.orden_fumigacions OWNER TO mdiaz;

--
-- Name: orden_fumigacions_id_seq; Type: SEQUENCE; Schema: public; Owner: mdiaz
--

CREATE SEQUENCE public.orden_fumigacions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orden_fumigacions_id_seq OWNER TO mdiaz;

--
-- Name: orden_fumigacions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdiaz
--

ALTER SEQUENCE public.orden_fumigacions_id_seq OWNED BY public.orden_fumigacions.id;


--
-- Name: quejas; Type: TABLE; Schema: public; Owner: mdiaz
--

CREATE TABLE public.quejas (
    id bigint NOT NULL,
    orden_fumigacion_id bigint NOT NULL,
    nro_queja integer,
    fecha_queja date,
    observaciones_queja character varying,
    estado character varying,
    baja boolean,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.quejas OWNER TO mdiaz;

--
-- Name: quejas_id_seq; Type: SEQUENCE; Schema: public; Owner: mdiaz
--

CREATE SEQUENCE public.quejas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.quejas_id_seq OWNER TO mdiaz;

--
-- Name: quejas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdiaz
--

ALTER SEQUENCE public.quejas_id_seq OWNED BY public.quejas.id;


--
-- Name: remitos; Type: TABLE; Schema: public; Owner: mdiaz
--

CREATE TABLE public.remitos (
    id bigint NOT NULL,
    orden_fumigacion_id bigint NOT NULL,
    nro_remito character varying,
    fecha_remito date,
    concepto character varying,
    importe integer,
    baja boolean,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.remitos OWNER TO mdiaz;

--
-- Name: remitos_id_seq; Type: SEQUENCE; Schema: public; Owner: mdiaz
--

CREATE SEQUENCE public.remitos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.remitos_id_seq OWNER TO mdiaz;

--
-- Name: remitos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdiaz
--

ALTER SEQUENCE public.remitos_id_seq OWNED BY public.remitos.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: mdiaz
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO mdiaz;

--
-- Name: seguimientos; Type: TABLE; Schema: public; Owner: mdiaz
--

CREATE TABLE public.seguimientos (
    id bigint NOT NULL,
    usuario character varying,
    controlador character varying,
    registro_procesado character varying,
    accion character varying,
    baja boolean,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.seguimientos OWNER TO mdiaz;

--
-- Name: seguimientos_id_seq; Type: SEQUENCE; Schema: public; Owner: mdiaz
--

CREATE SEQUENCE public.seguimientos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seguimientos_id_seq OWNER TO mdiaz;

--
-- Name: seguimientos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdiaz
--

ALTER SEQUENCE public.seguimientos_id_seq OWNED BY public.seguimientos.id;


--
-- Name: tecnicos; Type: TABLE; Schema: public; Owner: mdiaz
--

CREATE TABLE public.tecnicos (
    id bigint NOT NULL,
    dni character varying,
    apellido character varying,
    nombre character varying,
    domicilio character varying,
    barrio character varying,
    celular character varying,
    telefono character varying,
    correo character varying,
    observaciones_tecnico character varying,
    baja boolean,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.tecnicos OWNER TO mdiaz;

--
-- Name: tecnicos_id_seq; Type: SEQUENCE; Schema: public; Owner: mdiaz
--

CREATE SEQUENCE public.tecnicos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tecnicos_id_seq OWNER TO mdiaz;

--
-- Name: tecnicos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdiaz
--

ALTER SEQUENCE public.tecnicos_id_seq OWNED BY public.tecnicos.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: mdiaz
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.users OWNER TO mdiaz;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: mdiaz
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO mdiaz;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mdiaz
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: clientes id; Type: DEFAULT; Schema: public; Owner: mdiaz
--

ALTER TABLE ONLY public.clientes ALTER COLUMN id SET DEFAULT nextval('public.clientes_id_seq'::regclass);


--
-- Name: orden_fumigacions id; Type: DEFAULT; Schema: public; Owner: mdiaz
--

ALTER TABLE ONLY public.orden_fumigacions ALTER COLUMN id SET DEFAULT nextval('public.orden_fumigacions_id_seq'::regclass);


--
-- Name: quejas id; Type: DEFAULT; Schema: public; Owner: mdiaz
--

ALTER TABLE ONLY public.quejas ALTER COLUMN id SET DEFAULT nextval('public.quejas_id_seq'::regclass);


--
-- Name: remitos id; Type: DEFAULT; Schema: public; Owner: mdiaz
--

ALTER TABLE ONLY public.remitos ALTER COLUMN id SET DEFAULT nextval('public.remitos_id_seq'::regclass);


--
-- Name: seguimientos id; Type: DEFAULT; Schema: public; Owner: mdiaz
--

ALTER TABLE ONLY public.seguimientos ALTER COLUMN id SET DEFAULT nextval('public.seguimientos_id_seq'::regclass);


--
-- Name: tecnicos id; Type: DEFAULT; Schema: public; Owner: mdiaz
--

ALTER TABLE ONLY public.tecnicos ALTER COLUMN id SET DEFAULT nextval('public.tecnicos_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: mdiaz
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: mdiaz
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
\.
COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM '$$PATH$$/3094.dat';

--
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: mdiaz
--

COPY public.clientes (id, cuit, rubro, apellido, nombre, domicilio, barrio, celular, telefono, correo, observaciones_cliente, tipo_cliente, calificacion, baja, created_at, updated_at, localidad) FROM stdin;
\.
COPY public.clientes (id, cuit, rubro, apellido, nombre, domicilio, barrio, celular, telefono, correo, observaciones_cliente, tipo_cliente, calificacion, baja, created_at, updated_at, localidad) FROM '$$PATH$$/3096.dat';

--
-- Data for Name: contactos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contactos (id_cliente, apellido, nombre, domicilio, telefono, celular, barrio, rubro, estado) FROM stdin;
\.
COPY public.contactos (id_cliente, apellido, nombre, domicilio, telefono, celular, barrio, rubro, estado) FROM '$$PATH$$/3107.dat';

--
-- Data for Name: orden_fumigacions; Type: TABLE DATA; Schema: public; Owner: mdiaz
--

COPY public.orden_fumigacions (id, cliente_id, tecnico_id, nro_ordfumigacion, nro_certificado, tipo_certificado, fecha_aplicacion, hora_aplicacion, tratamiento, vector, superficie, veneno, droga, observaciones_ordfumigacion, fecha_vencimiento, proximo_tratamiento, importe, estado, baja, created_at, updated_at) FROM stdin;
\.
COPY public.orden_fumigacions (id, cliente_id, tecnico_id, nro_ordfumigacion, nro_certificado, tipo_certificado, fecha_aplicacion, hora_aplicacion, tratamiento, vector, superficie, veneno, droga, observaciones_ordfumigacion, fecha_vencimiento, proximo_tratamiento, importe, estado, baja, created_at, updated_at) FROM '$$PATH$$/3100.dat';

--
-- Data for Name: quejas; Type: TABLE DATA; Schema: public; Owner: mdiaz
--

COPY public.quejas (id, orden_fumigacion_id, nro_queja, fecha_queja, observaciones_queja, estado, baja, created_at, updated_at) FROM stdin;
\.
COPY public.quejas (id, orden_fumigacion_id, nro_queja, fecha_queja, observaciones_queja, estado, baja, created_at, updated_at) FROM '$$PATH$$/3102.dat';

--
-- Data for Name: remitos; Type: TABLE DATA; Schema: public; Owner: mdiaz
--

COPY public.remitos (id, orden_fumigacion_id, nro_remito, fecha_remito, concepto, importe, baja, created_at, updated_at) FROM stdin;
\.
COPY public.remitos (id, orden_fumigacion_id, nro_remito, fecha_remito, concepto, importe, baja, created_at, updated_at) FROM '$$PATH$$/3106.dat';

--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: mdiaz
--

COPY public.schema_migrations (version) FROM stdin;
\.
COPY public.schema_migrations (version) FROM '$$PATH$$/3093.dat';

--
-- Data for Name: seguimientos; Type: TABLE DATA; Schema: public; Owner: mdiaz
--

COPY public.seguimientos (id, usuario, controlador, registro_procesado, accion, baja, created_at, updated_at) FROM stdin;
\.
COPY public.seguimientos (id, usuario, controlador, registro_procesado, accion, baja, created_at, updated_at) FROM '$$PATH$$/3109.dat';

--
-- Data for Name: tecnicos; Type: TABLE DATA; Schema: public; Owner: mdiaz
--

COPY public.tecnicos (id, dni, apellido, nombre, domicilio, barrio, celular, telefono, correo, observaciones_tecnico, baja, created_at, updated_at) FROM stdin;
\.
COPY public.tecnicos (id, dni, apellido, nombre, domicilio, barrio, celular, telefono, correo, observaciones_tecnico, baja, created_at, updated_at) FROM '$$PATH$$/3098.dat';

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: mdiaz
--

COPY public.users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, created_at, updated_at) FROM stdin;
\.
COPY public.users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, created_at, updated_at) FROM '$$PATH$$/3104.dat';

--
-- Name: clientes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdiaz
--

SELECT pg_catalog.setval('public.clientes_id_seq', 13939, true);


--
-- Name: orden_fumigacions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdiaz
--

SELECT pg_catalog.setval('public.orden_fumigacions_id_seq', 27, true);


--
-- Name: quejas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdiaz
--

SELECT pg_catalog.setval('public.quejas_id_seq', 1, true);


--
-- Name: remitos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdiaz
--

SELECT pg_catalog.setval('public.remitos_id_seq', 1, false);


--
-- Name: seguimientos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdiaz
--

SELECT pg_catalog.setval('public.seguimientos_id_seq', 88, true);


--
-- Name: tecnicos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdiaz
--

SELECT pg_catalog.setval('public.tecnicos_id_seq', 14, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mdiaz
--

SELECT pg_catalog.setval('public.users_id_seq', 5, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: mdiaz
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: clientes clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: mdiaz
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id);


--
-- Name: orden_fumigacions orden_fumigacions_pkey; Type: CONSTRAINT; Schema: public; Owner: mdiaz
--

ALTER TABLE ONLY public.orden_fumigacions
    ADD CONSTRAINT orden_fumigacions_pkey PRIMARY KEY (id);


--
-- Name: quejas quejas_pkey; Type: CONSTRAINT; Schema: public; Owner: mdiaz
--

ALTER TABLE ONLY public.quejas
    ADD CONSTRAINT quejas_pkey PRIMARY KEY (id);


--
-- Name: remitos remitos_pkey; Type: CONSTRAINT; Schema: public; Owner: mdiaz
--

ALTER TABLE ONLY public.remitos
    ADD CONSTRAINT remitos_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: mdiaz
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: seguimientos seguimientos_pkey; Type: CONSTRAINT; Schema: public; Owner: mdiaz
--

ALTER TABLE ONLY public.seguimientos
    ADD CONSTRAINT seguimientos_pkey PRIMARY KEY (id);


--
-- Name: tecnicos tecnicos_pkey; Type: CONSTRAINT; Schema: public; Owner: mdiaz
--

ALTER TABLE ONLY public.tecnicos
    ADD CONSTRAINT tecnicos_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: mdiaz
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_orden_fumigacions_on_cliente_id; Type: INDEX; Schema: public; Owner: mdiaz
--

CREATE INDEX index_orden_fumigacions_on_cliente_id ON public.orden_fumigacions USING btree (cliente_id);


--
-- Name: index_orden_fumigacions_on_tecnico_id; Type: INDEX; Schema: public; Owner: mdiaz
--

CREATE INDEX index_orden_fumigacions_on_tecnico_id ON public.orden_fumigacions USING btree (tecnico_id);


--
-- Name: index_quejas_on_orden_fumigacion_id; Type: INDEX; Schema: public; Owner: mdiaz
--

CREATE INDEX index_quejas_on_orden_fumigacion_id ON public.quejas USING btree (orden_fumigacion_id);


--
-- Name: index_remitos_on_orden_fumigacion_id; Type: INDEX; Schema: public; Owner: mdiaz
--

CREATE INDEX index_remitos_on_orden_fumigacion_id ON public.remitos USING btree (orden_fumigacion_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: mdiaz
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: mdiaz
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: remitos fk_rails_29a2fb4ee0; Type: FK CONSTRAINT; Schema: public; Owner: mdiaz
--

ALTER TABLE ONLY public.remitos
    ADD CONSTRAINT fk_rails_29a2fb4ee0 FOREIGN KEY (orden_fumigacion_id) REFERENCES public.orden_fumigacions(id);


--
-- Name: orden_fumigacions fk_rails_7073db5b0d; Type: FK CONSTRAINT; Schema: public; Owner: mdiaz
--

ALTER TABLE ONLY public.orden_fumigacions
    ADD CONSTRAINT fk_rails_7073db5b0d FOREIGN KEY (tecnico_id) REFERENCES public.tecnicos(id);


--
-- Name: orden_fumigacions fk_rails_779f665010; Type: FK CONSTRAINT; Schema: public; Owner: mdiaz
--

ALTER TABLE ONLY public.orden_fumigacions
    ADD CONSTRAINT fk_rails_779f665010 FOREIGN KEY (cliente_id) REFERENCES public.clientes(id);


--
-- Name: quejas fk_rails_8f47f0dd36; Type: FK CONSTRAINT; Schema: public; Owner: mdiaz
--

ALTER TABLE ONLY public.quejas
    ADD CONSTRAINT fk_rails_8f47f0dd36 FOREIGN KEY (orden_fumigacion_id) REFERENCES public.orden_fumigacions(id);


--
-- PostgreSQL database dump complete
--

