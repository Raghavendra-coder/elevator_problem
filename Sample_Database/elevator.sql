--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.auth_group ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.auth_group_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.auth_permission ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.auth_user_groups ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.auth_user ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.django_admin_log ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.django_content_type ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.django_migrations ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: elevator_destinationfloorrequest; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.elevator_destinationfloorrequest (
    id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_by timestamp with time zone NOT NULL,
    destination_floor_id uuid,
    elevator_id uuid
);


ALTER TABLE public.elevator_destinationfloorrequest OWNER TO postgres;

--
-- Name: elevator_elevator; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.elevator_elevator (
    id uuid NOT NULL,
    elevator_name character varying(20),
    elevator_number integer NOT NULL,
    reached_floor integer,
    moving_status character varying(1),
    door_status character varying(1),
    status_light character varying(1),
    availability character varying(1),
    created_at timestamp with time zone NOT NULL,
    updated_by timestamp with time zone NOT NULL
);


ALTER TABLE public.elevator_elevator OWNER TO postgres;

--
-- Name: elevator_elevatorrequest; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.elevator_elevatorrequest (
    id uuid NOT NULL,
    elevator_id uuid,
    requested_floor_id uuid,
    created_at timestamp with time zone NOT NULL,
    updated_by timestamp with time zone NOT NULL
);


ALTER TABLE public.elevator_elevatorrequest OWNER TO postgres;

--
-- Name: elevator_floor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.elevator_floor (
    id uuid NOT NULL,
    floor_number integer,
    created_at timestamp with time zone NOT NULL,
    updated_by timestamp with time zone NOT NULL
);


ALTER TABLE public.elevator_floor OWNER TO postgres;

--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add elevator	1	add_elevator
2	Can change elevator	1	change_elevator
3	Can delete elevator	1	delete_elevator
4	Can view elevator	1	view_elevator
5	Can add floor	2	add_floor
6	Can change floor	2	change_floor
7	Can delete floor	2	delete_floor
8	Can view floor	2	view_floor
9	Can add elevator request	3	add_elevatorrequest
10	Can change elevator request	3	change_elevatorrequest
11	Can delete elevator request	3	delete_elevatorrequest
12	Can view elevator request	3	view_elevatorrequest
13	Can add log entry	4	add_logentry
14	Can change log entry	4	change_logentry
15	Can delete log entry	4	delete_logentry
16	Can view log entry	4	view_logentry
17	Can add permission	5	add_permission
18	Can change permission	5	change_permission
19	Can delete permission	5	delete_permission
20	Can view permission	5	view_permission
21	Can add group	6	add_group
22	Can change group	6	change_group
23	Can delete group	6	delete_group
24	Can view group	6	view_group
25	Can add user	7	add_user
26	Can change user	7	change_user
27	Can delete user	7	delete_user
28	Can view user	7	view_user
29	Can add content type	8	add_contenttype
30	Can change content type	8	change_contenttype
31	Can delete content type	8	delete_contenttype
32	Can view content type	8	view_contenttype
33	Can add session	9	add_session
34	Can change session	9	change_session
35	Can delete session	9	delete_session
36	Can view session	9	view_session
37	Can add destination floor request	10	add_destinationfloorrequest
38	Can change destination floor request	10	change_destinationfloorrequest
39	Can delete destination floor request	10	delete_destinationfloorrequest
40	Can view destination floor request	10	view_destinationfloorrequest
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$600000$1J9Wq7Gz2tkaLXGBxDVQct$duGQVm1vz+j3S7yUD5Rd5j49zv4d5C4iqHQmosoEqmA=	2023-07-07 11:20:46.451306+05:30	t	admin			admin@elevator.com	t	t	2023-07-07 11:20:21.663414+05:30
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2023-07-07 11:26:56.293227+05:30	249342bb-2454-4309-b413-fa97677300a9	Elevator : 1	2	[{"changed": {"fields": ["Moving status", "Status light", "Availability"]}}]	1	1
2	2023-07-07 11:29:34.573166+05:30	249342bb-2454-4309-b413-fa97677300a9	Elevator : 1	2	[{"changed": {"fields": ["Moving status", "Status light", "Availability"]}}]	1	1
3	2023-07-07 11:33:52.841644+05:30	249342bb-2454-4309-b413-fa97677300a9	Elevator : 1	2	[{"changed": {"fields": ["Reached floor"]}}]	1	1
4	2023-07-07 11:34:41.734191+05:30	7c3c8317-16fe-4c50-8896-ec3e82cb44a9	elevator : 1	2	[{"changed": {"fields": ["Requested floor"]}}]	3	1
5	2023-07-07 11:48:00.328422+05:30	7c3c8317-16fe-4c50-8896-ec3e82cb44a9	elevator : 1	3		3	1
6	2023-07-07 11:48:00.335445+05:30	7a8d3807-ebe0-40f0-9cd1-79bbde7c47eb	elevator : 1	3		3	1
7	2023-07-07 11:48:00.336419+05:30	36f2f9ea-3fd3-4be0-89dc-8f10dee9186d	elevator : 1	3		3	1
8	2023-07-07 11:48:19.94325+05:30	249342bb-2454-4309-b413-fa97677300a9	Elevator : 1	2	[{"changed": {"fields": ["Reached floor"]}}]	1	1
9	2023-07-07 11:55:50.480412+05:30	e0af8e8b-f37d-4e46-95eb-acc47c3a1dec	elevator : 1	2	[{"changed": {"fields": ["Requested floor"]}}]	3	1
10	2023-07-07 12:03:40.554648+05:30	e0af8e8b-f37d-4e46-95eb-acc47c3a1dec	elevator : 1	3		3	1
11	2023-07-07 12:03:54.232053+05:30	249342bb-2454-4309-b413-fa97677300a9	Elevator : 1	2	[{"changed": {"fields": ["Reached floor"]}}]	1	1
12	2023-07-07 12:06:56.506528+05:30	90ac874b-69e0-4b1b-bc65-c6d49e4abf95	elevator : 1	3		3	1
13	2023-07-07 12:07:06.855664+05:30	249342bb-2454-4309-b413-fa97677300a9	Elevator : 1	2	[{"changed": {"fields": ["Reached floor"]}}]	1	1
14	2023-07-07 12:11:01.574489+05:30	249342bb-2454-4309-b413-fa97677300a9	Elevator : 1	2	[{"changed": {"fields": ["Reached floor", "Availability"]}}]	1	1
15	2023-07-07 12:11:10.195337+05:30	30ea2f79-0c94-4a6c-967c-4c521a71265a	elevator : 1	3		3	1
16	2023-07-07 12:25:40.769389+05:30	3246c886-b1b2-4fc5-a481-6b34039e485f	elevator : 1	3		3	1
17	2023-07-07 12:26:34.232038+05:30	3246c886-b1b2-4fc5-a481-6b34039e485f	elevator : 1	3		3	1
18	2023-07-07 12:33:29.494202+05:30	249342bb-2454-4309-b413-fa97677300a9	Elevator : 1	2	[{"changed": {"fields": ["Reached floor"]}}]	1	1
19	2023-07-07 12:54:02.481627+05:30	9b44b2e6-2c31-4d81-8277-4d95f802f465	destination floor : 1	1	[{"added": {}}]	10	1
20	2023-07-07 12:56:19.716822+05:30	e5088ac7-8364-414c-b252-fb5397a3ff39	elevator : 1	2	[{"changed": {"fields": ["Requested floor"]}}]	3	1
21	2023-07-07 12:56:35.130192+05:30	06469aff-3c1b-4602-84b9-bc6a728709f0	elevator : 1	3		3	1
22	2023-07-07 12:56:48.317599+05:30	e4c0c60d-9649-417c-bebb-b550c83ba254	destination floor : 0	3		10	1
23	2023-07-07 12:57:00.910944+05:30	249342bb-2454-4309-b413-fa97677300a9	Elevator : 1	2	[]	1	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	elevator	elevator
2	elevator	floor
3	elevator	elevatorrequest
4	admin	logentry
5	auth	permission
6	auth	group
7	auth	user
8	contenttypes	contenttype
9	sessions	session
10	elevator	destinationfloorrequest
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2023-07-07 10:36:23.884248+05:30
2	auth	0001_initial	2023-07-07 10:36:23.980382+05:30
3	admin	0001_initial	2023-07-07 10:36:24.016892+05:30
4	admin	0002_logentry_remove_auto_add	2023-07-07 10:36:24.026882+05:30
5	admin	0003_logentry_add_action_flag_choices	2023-07-07 10:36:24.038978+05:30
6	contenttypes	0002_remove_content_type_name	2023-07-07 10:36:24.060882+05:30
7	auth	0002_alter_permission_name_max_length	2023-07-07 10:36:24.081883+05:30
8	auth	0003_alter_user_email_max_length	2023-07-07 10:36:24.09189+05:30
9	auth	0004_alter_user_username_opts	2023-07-07 10:36:24.098889+05:30
10	auth	0005_alter_user_last_login_null	2023-07-07 10:36:24.109539+05:30
11	auth	0006_require_contenttypes_0002	2023-07-07 10:36:24.124551+05:30
12	auth	0007_alter_validators_add_error_messages	2023-07-07 10:36:24.129503+05:30
13	auth	0008_alter_user_username_max_length	2023-07-07 10:36:24.153504+05:30
14	auth	0009_alter_user_last_name_max_length	2023-07-07 10:36:24.165503+05:30
15	auth	0010_alter_group_name_max_length	2023-07-07 10:36:24.172502+05:30
16	auth	0011_update_proxy_permissions	2023-07-07 10:36:24.179502+05:30
17	auth	0012_alter_user_first_name_max_length	2023-07-07 10:36:24.18751+05:30
18	elevator	0001_initial	2023-07-07 10:36:24.229801+05:30
19	elevator	0002_rename_last_floor_elevator_reached_floor	2023-07-07 10:36:24.236847+05:30
20	elevator	0003_remove_elevatorrequest_floor_and_more	2023-07-07 10:36:24.276801+05:30
21	sessions	0001_initial	2023-07-07 10:36:24.298809+05:30
22	elevator	0004_remove_elevatorrequest_destination_floor_and_more	2023-07-07 10:37:09.369104+05:30
23	elevator	0005_remove_destinationfloorrequest_elevator_request_and_more	2023-07-07 12:27:26.951825+05:30
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
dzcyz96t85brejrxc4swi47dxup7egxl	.eJxVjMsOwiAQRf-FtSEgb5fu-w1kBhipGkhKuzL-uzbpQrf3nHNfLMK21riNssQ5swuT7PS7IaRHaTvId2i3zlNv6zIj3xV-0MGnnsvzerh_BxVG_dYhadDJhqSKR9LOWiIN5KX0FNCTUlDIOUAsRmTyQgsyFEwGAhRnxd4fCIw5BQ:1qHeMg:N9jMlWXI4aaRKOFOiYrF_gHB-Dv3OKOVPiNmdryTEm8	2023-07-21 11:20:46.460307+05:30
\.


--
-- Data for Name: elevator_destinationfloorrequest; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.elevator_destinationfloorrequest (id, created_at, updated_by, destination_floor_id, elevator_id) FROM stdin;
\.


--
-- Data for Name: elevator_elevator; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.elevator_elevator (id, elevator_name, elevator_number, reached_floor, moving_status, door_status, status_light, availability, created_at, updated_by) FROM stdin;
249342bb-2454-4309-b413-fa97677300a9	X-1	1	0	S	C	G	A	2023-07-07 11:21:11.569784+05:30	2023-07-07 13:04:05.518956+05:30
\.


--
-- Data for Name: elevator_elevatorrequest; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.elevator_elevatorrequest (id, elevator_id, requested_floor_id, created_at, updated_by) FROM stdin;
\.


--
-- Data for Name: elevator_floor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.elevator_floor (id, floor_number, created_at, updated_by) FROM stdin;
0258eb22-ac45-4e4e-a5d8-5a356c52e29a	0	2023-07-07 11:21:05.883885+05:30	2023-07-07 11:21:05.883885+05:30
87f6dc77-f7da-4240-9794-0c6ab41530b0	1	2023-07-07 11:21:05.886884+05:30	2023-07-07 11:21:05.886884+05:30
b00bb21a-6451-4f67-b38e-10bf78963430	2	2023-07-07 11:21:05.886884+05:30	2023-07-07 11:21:05.886884+05:30
22817ad8-18e0-4ac2-9969-8985c18451aa	3	2023-07-07 11:21:05.887888+05:30	2023-07-07 11:21:05.887888+05:30
b19409d1-aa72-4b9e-a1b9-7332b8c6a5dd	4	2023-07-07 11:21:05.887888+05:30	2023-07-07 11:21:05.887888+05:30
42ba0364-d6d9-4d04-b70e-755309b8626b	5	2023-07-07 11:21:05.888888+05:30	2023-07-07 11:21:05.888888+05:30
8cd0b1c0-3c70-44f8-9733-06f3eb6f2031	6	2023-07-07 11:21:05.888888+05:30	2023-07-07 11:21:05.888888+05:30
6b3cf9c5-2167-4ced-a580-9e4817258b20	7	2023-07-07 11:21:05.889888+05:30	2023-07-07 11:21:05.889888+05:30
2ed006ce-11e3-4233-808b-351bf563de46	8	2023-07-07 11:21:05.889888+05:30	2023-07-07 11:21:05.889888+05:30
b2a031ce-96ae-4648-ac98-ac47070306f8	9	2023-07-07 11:21:05.891884+05:30	2023-07-07 11:21:05.891884+05:30
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 40, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 23, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 10, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 23, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: elevator_destinationfloorrequest elevator_destinationfloorrequest_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.elevator_destinationfloorrequest
    ADD CONSTRAINT elevator_destinationfloorrequest_pkey PRIMARY KEY (id);


--
-- Name: elevator_elevator elevator_elevator_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.elevator_elevator
    ADD CONSTRAINT elevator_elevator_pkey PRIMARY KEY (id);


--
-- Name: elevator_elevatorrequest elevator_elevatorrequest_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.elevator_elevatorrequest
    ADD CONSTRAINT elevator_elevatorrequest_pkey PRIMARY KEY (id);


--
-- Name: elevator_floor elevator_floor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.elevator_floor
    ADD CONSTRAINT elevator_floor_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: elevator_destinationfloorrequest_destination_floor_id_b0362641; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX elevator_destinationfloorrequest_destination_floor_id_b0362641 ON public.elevator_destinationfloorrequest USING btree (destination_floor_id);


--
-- Name: elevator_destinationfloorrequest_elevator_id_ed221af4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX elevator_destinationfloorrequest_elevator_id_ed221af4 ON public.elevator_destinationfloorrequest USING btree (elevator_id);


--
-- Name: elevator_elevatorrequest_elevator_id_18023cc4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX elevator_elevatorrequest_elevator_id_18023cc4 ON public.elevator_elevatorrequest USING btree (elevator_id);


--
-- Name: elevator_elevatorrequest_requested_floor_id_d396584c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX elevator_elevatorrequest_requested_floor_id_d396584c ON public.elevator_elevatorrequest USING btree (requested_floor_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: elevator_destinationfloorrequest elevator_destination_destination_floor_id_b0362641_fk_elevator_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.elevator_destinationfloorrequest
    ADD CONSTRAINT elevator_destination_destination_floor_id_b0362641_fk_elevator_ FOREIGN KEY (destination_floor_id) REFERENCES public.elevator_floor(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: elevator_destinationfloorrequest elevator_destination_elevator_id_ed221af4_fk_elevator_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.elevator_destinationfloorrequest
    ADD CONSTRAINT elevator_destination_elevator_id_ed221af4_fk_elevator_ FOREIGN KEY (elevator_id) REFERENCES public.elevator_elevator(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: elevator_elevatorrequest elevator_elevatorreq_elevator_id_18023cc4_fk_elevator_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.elevator_elevatorrequest
    ADD CONSTRAINT elevator_elevatorreq_elevator_id_18023cc4_fk_elevator_ FOREIGN KEY (elevator_id) REFERENCES public.elevator_elevator(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: elevator_elevatorrequest elevator_elevatorreq_requested_floor_id_d396584c_fk_elevator_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.elevator_elevatorrequest
    ADD CONSTRAINT elevator_elevatorreq_requested_floor_id_d396584c_fk_elevator_ FOREIGN KEY (requested_floor_id) REFERENCES public.elevator_floor(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--
