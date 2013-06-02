--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: efm; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO efm;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: efm
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO efm;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: efm
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: efm; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO efm;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: efm
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO efm;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: efm
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: efm; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO efm;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: efm
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO efm;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: efm
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: efm; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(75) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO efm;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: efm; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO efm;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: efm
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO efm;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: efm
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: efm
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO efm;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: efm
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: efm; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO efm;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: efm
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO efm;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: efm
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: efm; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    content_type_id integer,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO efm;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: efm
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO efm;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: efm
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: efm; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO efm;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: efm
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO efm;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: efm
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: efm; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO efm;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: efm; Tablespace: 
--

CREATE TABLE django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO efm;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: efm
--

CREATE SEQUENCE django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO efm;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: efm
--

ALTER SEQUENCE django_site_id_seq OWNED BY django_site.id;


--
-- Name: home_application; Type: TABLE; Schema: public; Owner: efm; Tablespace: 
--

CREATE TABLE home_application (
    id integer NOT NULL,
    name character varying(15) NOT NULL,
    lead character varying(25) NOT NULL,
    installed boolean DEFAULT false NOT NULL,
    date date NOT NULL,
    sensor_id integer DEFAULT 1 NOT NULL,
    author character varying(15) NOT NULL,
    icon character varying(25) DEFAULT ''::character varying NOT NULL,
    category_id integer
);


ALTER TABLE public.home_application OWNER TO efm;

--
-- Name: home_application_id_seq; Type: SEQUENCE; Schema: public; Owner: efm
--

CREATE SEQUENCE home_application_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.home_application_id_seq OWNER TO efm;

--
-- Name: home_application_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: efm
--

ALTER SEQUENCE home_application_id_seq OWNED BY home_application.id;


--
-- Name: home_brand; Type: TABLE; Schema: public; Owner: efm; Tablespace: 
--

CREATE TABLE home_brand (
    id integer NOT NULL,
    name character varying(20) NOT NULL,
    logo character varying(100) NOT NULL
);


ALTER TABLE public.home_brand OWNER TO efm;

--
-- Name: home_brand_id_seq; Type: SEQUENCE; Schema: public; Owner: efm
--

CREATE SEQUENCE home_brand_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.home_brand_id_seq OWNER TO efm;

--
-- Name: home_brand_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: efm
--

ALTER SEQUENCE home_brand_id_seq OWNED BY home_brand.id;


--
-- Name: home_category; Type: TABLE; Schema: public; Owner: efm; Tablespace: 
--

CREATE TABLE home_category (
    id integer NOT NULL,
    name character varying(20) NOT NULL
);


ALTER TABLE public.home_category OWNER TO efm;

--
-- Name: home_category_id_seq; Type: SEQUENCE; Schema: public; Owner: efm
--

CREATE SEQUENCE home_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.home_category_id_seq OWNER TO efm;

--
-- Name: home_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: efm
--

ALTER SEQUENCE home_category_id_seq OWNED BY home_category.id;


--
-- Name: home_sensor; Type: TABLE; Schema: public; Owner: efm; Tablespace: 
--

CREATE TABLE home_sensor (
    id integer NOT NULL,
    label character varying(20) NOT NULL,
    code character varying(20) NOT NULL,
    lead character varying(25) NOT NULL,
    price numeric(6,2),
    installed boolean DEFAULT false NOT NULL,
    date date NOT NULL,
    number integer,
    brand_id integer,
    technology_id integer,
    picture character varying(100) NOT NULL,
    CONSTRAINT ck_number_pstv_5b73c1a2 CHECK ((number >= 0)),
    CONSTRAINT home_sensor_number_check CHECK ((number >= 0))
);


ALTER TABLE public.home_sensor OWNER TO efm;

--
-- Name: home_sensor_id_seq; Type: SEQUENCE; Schema: public; Owner: efm
--

CREATE SEQUENCE home_sensor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.home_sensor_id_seq OWNER TO efm;

--
-- Name: home_sensor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: efm
--

ALTER SEQUENCE home_sensor_id_seq OWNED BY home_sensor.id;


--
-- Name: home_technology; Type: TABLE; Schema: public; Owner: efm; Tablespace: 
--

CREATE TABLE home_technology (
    id integer NOT NULL,
    name character varying(20) NOT NULL,
    logo character varying(100) NOT NULL
);


ALTER TABLE public.home_technology OWNER TO efm;

--
-- Name: home_technology_id_seq; Type: SEQUENCE; Schema: public; Owner: efm
--

CREATE SEQUENCE home_technology_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.home_technology_id_seq OWNER TO efm;

--
-- Name: home_technology_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: efm
--

ALTER SEQUENCE home_technology_id_seq OWNED BY home_technology.id;


--
-- Name: provider_example; Type: TABLE; Schema: public; Owner: efm; Tablespace: 
--

CREATE TABLE provider_example (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    datastr1 character varying(30) NOT NULL,
    datastr2 character varying(30) NOT NULL
);


ALTER TABLE public.provider_example OWNER TO efm;

--
-- Name: provider_example_id_seq; Type: SEQUENCE; Schema: public; Owner: efm
--

CREATE SEQUENCE provider_example_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.provider_example_id_seq OWNER TO efm;

--
-- Name: provider_example_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: efm
--

ALTER SEQUENCE provider_example_id_seq OWNED BY provider_example.id;


--
-- Name: services_exampleservice; Type: TABLE; Schema: public; Owner: efm; Tablespace: 
--

CREATE TABLE services_exampleservice (
    id integer NOT NULL,
    name character varying(15) NOT NULL,
    lead character varying(50) NOT NULL,
    service_description text NOT NULL,
    additional_description text NOT NULL,
    sensor_1 character varying(20) NOT NULL,
    sensor_2 character varying(20) NOT NULL,
    package_id integer,
    logo character varying(100) NOT NULL
);


ALTER TABLE public.services_exampleservice OWNER TO efm;

--
-- Name: services_exampleservice_id_seq; Type: SEQUENCE; Schema: public; Owner: efm
--

CREATE SEQUENCE services_exampleservice_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.services_exampleservice_id_seq OWNER TO efm;

--
-- Name: services_exampleservice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: efm
--

ALTER SEQUENCE services_exampleservice_id_seq OWNED BY services_exampleservice.id;


--
-- Name: services_package; Type: TABLE; Schema: public; Owner: efm; Tablespace: 
--

CREATE TABLE services_package (
    id integer NOT NULL,
    name character varying(20) NOT NULL,
    lead character varying(35) NOT NULL,
    general_description text NOT NULL,
    additional_description text NOT NULL,
    price numeric(6,2),
    picture character varying(100) NOT NULL
);


ALTER TABLE public.services_package OWNER TO efm;

--
-- Name: services_package_id_seq; Type: SEQUENCE; Schema: public; Owner: efm
--

CREATE SEQUENCE services_package_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.services_package_id_seq OWNER TO efm;

--
-- Name: services_package_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: efm
--

ALTER SEQUENCE services_package_id_seq OWNED BY services_package.id;


--
-- Name: south_migrationhistory; Type: TABLE; Schema: public; Owner: efm; Tablespace: 
--

CREATE TABLE south_migrationhistory (
    id integer NOT NULL,
    app_name character varying(255) NOT NULL,
    migration character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.south_migrationhistory OWNER TO efm;

--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE; Schema: public; Owner: efm
--

CREATE SEQUENCE south_migrationhistory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.south_migrationhistory_id_seq OWNER TO efm;

--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: efm
--

ALTER SEQUENCE south_migrationhistory_id_seq OWNED BY south_migrationhistory.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: efm
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: efm
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: efm
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: efm
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: efm
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: efm
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: efm
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: efm
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: efm
--

ALTER TABLE ONLY django_site ALTER COLUMN id SET DEFAULT nextval('django_site_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: efm
--

ALTER TABLE ONLY home_application ALTER COLUMN id SET DEFAULT nextval('home_application_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: efm
--

ALTER TABLE ONLY home_brand ALTER COLUMN id SET DEFAULT nextval('home_brand_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: efm
--

ALTER TABLE ONLY home_category ALTER COLUMN id SET DEFAULT nextval('home_category_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: efm
--

ALTER TABLE ONLY home_sensor ALTER COLUMN id SET DEFAULT nextval('home_sensor_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: efm
--

ALTER TABLE ONLY home_technology ALTER COLUMN id SET DEFAULT nextval('home_technology_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: efm
--

ALTER TABLE ONLY provider_example ALTER COLUMN id SET DEFAULT nextval('provider_example_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: efm
--

ALTER TABLE ONLY services_exampleservice ALTER COLUMN id SET DEFAULT nextval('services_exampleservice_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: efm
--

ALTER TABLE ONLY services_package ALTER COLUMN id SET DEFAULT nextval('services_package_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: efm
--

ALTER TABLE ONLY south_migrationhistory ALTER COLUMN id SET DEFAULT nextval('south_migrationhistory_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: efm
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: efm
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: efm
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: efm
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: efm
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add permission	1	add_permission
2	Can change permission	1	change_permission
3	Can delete permission	1	delete_permission
4	Can add group	2	add_group
5	Can change group	2	change_group
6	Can delete group	2	delete_group
7	Can add user	3	add_user
8	Can change user	3	change_user
9	Can delete user	3	delete_user
10	Can add content type	4	add_contenttype
11	Can change content type	4	change_contenttype
12	Can delete content type	4	delete_contenttype
13	Can add session	5	add_session
14	Can change session	5	change_session
15	Can delete session	5	delete_session
16	Can add site	6	add_site
17	Can change site	6	change_site
18	Can delete site	6	delete_site
19	Can add log entry	7	add_logentry
20	Can change log entry	7	change_logentry
21	Can delete log entry	7	delete_logentry
22	Can add example	8	add_example
23	Can change example	8	change_example
24	Can delete example	8	delete_example
25	Can add migration history	9	add_migrationhistory
26	Can change migration history	9	change_migrationhistory
27	Can delete migration history	9	delete_migrationhistory
28	Can add technology	10	add_technology
29	Can change technology	10	change_technology
30	Can delete technology	10	delete_technology
31	Can add sensor	11	add_sensor
32	Can change sensor	11	change_sensor
33	Can delete sensor	11	delete_sensor
34	Can add category	12	add_category
35	Can change category	12	change_category
36	Can delete category	12	delete_category
40	Can add application	14	add_application
41	Can change application	14	change_application
42	Can delete application	14	delete_application
43	Can add example service	15	add_exampleservice
44	Can change example service	15	change_exampleservice
45	Can delete example service	15	delete_exampleservice
46	Can add brand	16	add_brand
47	Can change brand	16	change_brand
48	Can delete brand	16	delete_brand
49	Can add package	17	add_package
50	Can change package	17	change_package
51	Can delete package	17	delete_package
52	Can add icon	18	add_icon
53	Can change icon	18	change_icon
54	Can delete icon	18	delete_icon
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: efm
--

SELECT pg_catalog.setval('auth_permission_id_seq', 54, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: efm
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
2	pbkdf2_sha256$10000$cigkWTu0CaUH$iqA1OLrF5UBXCZa0IpYQ7emIIGJRFm9xLmbdDYpJdeM=	2013-05-28 15:56:18.481848+00	f	me310				t	t	2013-05-24 23:20:40+00
1	pbkdf2_sha256$10000$gLaw4KUDMs4k$ctptrNEx/LV+I5kOUwjeg3MksKYwNqggkcEsArJis8A=	2013-06-02 12:52:26.857+00	t	efm				t	t	2013-05-24 23:19:34.319+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: efm
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: efm
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: efm
--

SELECT pg_catalog.setval('auth_user_id_seq', 2, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: efm
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
4	2	43
5	2	44
6	2	45
7	2	49
8	2	50
9	2	51
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: efm
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 9, true);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: efm
--

COPY django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) FROM stdin;
1	2013-05-24 23:20:41.091+00	1	3	2	me310	1	
2	2013-05-24 23:22:20.835+00	1	3	2	me310	2	Changed password and is_staff.
3	2013-05-24 23:25:23.732+00	1	3	2	me310	2	Changed password and user_permissions.
4	2013-05-24 23:34:16.735+00	2	15	1	Provider Finder	1	
5	2013-05-24 23:39:46.168+00	2	15	1	Provider Finder	2	Changed lead.
6	2013-05-24 23:49:01.722+00	2	15	2	Energy Account	1	
7	2013-05-24 23:49:31.814+00	2	15	2	Energy Account	2	Changed lead.
8	2013-05-24 23:53:18.155+00	2	15	3	Gas Detector	1	
9	2013-05-24 23:58:34.428+00	2	15	4	Share Device	1	
10	2013-05-24 23:59:26.338+00	2	15	1	Provider Finder	2	Changed lead.
11	2013-05-25 00:00:53.338+00	2	15	4	Shared Devices	2	Changed name.
12	2013-05-26 09:59:57.518+00	1	14	1	Electricity	1	
13	2013-05-26 10:17:50.382+00	1	14	1	Electricity	2	Changed code.
14	2013-05-26 10:22:36.472+00	1	14	1	Electricity	3	
15	2013-05-26 10:25:11.415+00	1	14	2	Webcam	1	
16	2013-05-26 10:52:32.037+00	1	14	3	Temperature	1	
17	2013-05-26 10:52:48.747+00	1	14	3	Temperature	2	Changed installed.
18	2013-05-26 10:53:00.55+00	1	14	2	Webcam	2	Changed installed.
19	2013-05-26 10:54:02.28+00	1	14	3	Temperature	2	Changed lead.
20	2013-05-26 11:12:21.707+00	1	10	4	Wlan	1	
21	2013-05-26 11:12:31.211+00	1	10	4	Wlan	2	No fields changed.
22	2013-05-26 11:13:27.243+00	1	10	5	Z-Wave	1	
23	2013-05-26 11:15:19.586+00	1	10	6	433 MHz	1	
24	2013-05-26 11:20:20.709+00	1	16	1	Everspring	1	
25	2013-05-26 11:20:58.073+00	1	16	2	Ninja Blocks	1	
26	2013-05-26 11:21:23.382+00	1	16	3	D-Link	1	
27	2013-05-26 11:40:21.494+00	1	14	4	Electricity	1	
28	2013-05-26 14:03:54.413+00	1	14	3	Temperature	2	Changed installed.
29	2013-05-26 14:56:44.542+00	1	14	4	Electricity	2	Changed sensor and installed.
30	2013-05-26 14:58:58.552+00	1	14	3	Temperature	2	Changed sensor.
31	2013-05-26 14:59:01.371+00	1	14	3	Temperature	2	Changed installed.
32	2013-05-26 14:59:14.949+00	1	14	2	Webcam	2	Changed sensor and installed.
33	2013-05-26 15:00:25.765+00	1	14	4	Electricity	2	Changed installed.
34	2013-05-26 16:59:47.754+00	1	14	6	jthgfrgf	2	No fields changed.
35	2013-05-26 17:05:39.626+00	1	14	6	jthgfrgf	3	
36	2013-05-26 18:06:51.467+00	1	14	7	mun appliiiii	2	Changed installed.
37	2013-05-26 18:47:12.33+00	1	14	8	Stuff Appliscat	2	Changed sensor.
38	2013-05-26 18:47:48.89+00	1	14	8	Stuff Appliscat	2	Changed sensor.
39	2013-05-26 22:48:10.104+00	1	14	3	Temperature	2	Changed sensor.
40	2013-05-26 23:37:59.123+00	1	11	1	Webcam	1	
41	2013-05-26 23:40:43.421+00	1	10	7	433 n	1	
42	2013-05-26 23:40:50.314+00	1	11	2	Temperature sensor	1	
43	2013-05-26 23:44:29.93+00	1	11	3	Smart Switcher	1	
44	2013-05-26 23:46:17.345+00	1	11	4	Switcher	1	
45	2013-05-26 23:47:36.1+00	1	11	5	Water detector	1	
46	2013-05-27 08:33:15.269+00	1	14	3	Temperature	2	Changed installed.
47	2013-05-27 08:45:46.364+00	1	14	4	Electricity	2	Changed installed.
48	2013-05-27 08:49:40.121+00	1	14	7	mun appliiiii	2	Changed installed.
49	2013-05-27 08:50:08.322+00	1	14	7	mun appliiiii	2	No fields changed.
50	2013-05-27 19:33:39.028+00	1	3	2	me310	2	Changed password and user_permissions.
51	2013-05-28 08:13:58.252+00	1	14	5	Mun Appi	2	Changed installed.
52	2013-05-28 08:16:47.662+00	1	14	9	aksksadksd	3	
53	2013-05-28 08:16:47.806+00	1	14	8	Stuff Appliscat	3	
54	2013-05-28 08:16:48.071+00	1	14	7	mun appliiiii	3	
55	2013-05-28 08:16:48.234+00	1	14	16	Application	3	
56	2013-05-28 08:16:48.505+00	1	14	15	fdsfddf	3	
57	2013-05-28 08:16:48.817+00	1	14	13	Joni's lamp	3	
58	2013-05-28 08:16:49.132+00	1	14	12	sadsad	3	
59	2013-05-28 08:16:49.443+00	1	14	11	Joni's smart	3	
60	2013-05-28 13:09:42.592541+00	2	15	5	Roomba	1	
61	2013-05-28 13:17:57.303938+00	2	15	5	Roomba	2	Changed logo_url.
62	2013-05-28 13:42:23.99166+00	2	15	1	Provider Finder	2	Changed logo_url.
63	2013-05-28 13:48:53.992229+00	2	15	4	Shared Devices	2	Changed logo_url.
64	2013-05-28 14:08:57.207+00	1	15	4	Shared Devices	2	Changed logo_url.
65	2013-05-28 14:10:12.828+00	1	15	4	Shared Devices	2	Changed logo_url.
66	2013-05-28 14:10:46.88+00	1	15	4	Shared Devices	2	Changed logo_url.
67	2013-05-28 14:11:49.863+00	1	15	4	Shared Devices	2	Changed logo_url.
68	2013-05-28 15:59:11.111325+00	2	15	6	Plumbing	1	
69	2013-05-28 16:01:22.991621+00	2	15	6	Plumbing	2	No fields changed.
70	2013-05-28 16:02:42.278277+00	2	15	6	Plumbing	2	Changed logo_url.
71	2013-05-28 16:04:16.270168+00	2	15	6	Plumbing	2	Changed logo_url.
72	2013-05-28 16:05:21.523545+00	2	15	6	Plumbing	2	Changed logo_url.
73	2013-05-28 16:56:24.175+00	1	18	1	test1	1	
74	2013-05-28 16:56:32.848+00	1	18	2	test2	1	
75	2013-05-28 18:37:48.647+00	1	14	3	Temperature	2	Changed installed.
76	2013-05-28 18:42:34.115+00	1	14	21	qswqwq	3	
77	2013-05-28 18:42:34.323+00	1	14	20	aasa	3	
78	2013-05-28 18:42:34.637+00	1	14	17	Jina's Swicther	3	
79	2013-05-28 18:43:22.372+00	1	14	5	Mun Appi	3	
80	2013-05-28 18:43:22.675+00	1	14	4	Electricity	3	
81	2013-05-28 18:43:22.986+00	1	14	3	Temperature	3	
82	2013-05-28 18:43:23.416+00	1	14	2	Webcam	3	
83	2013-05-28 18:43:23.728+00	1	14	14	Karvajalkalampp	3	
84	2013-05-28 18:43:24.041+00	1	14	10	Test App	3	
85	2013-05-28 18:43:24.25+00	1	14	19	test cam	3	
86	2013-05-28 18:43:24.563+00	1	14	18	kaffe	3	
87	2013-05-28 20:42:36.41+00	1	14	23	Security Camera	3	
88	2013-05-28 21:07:43.404+00	1	14	22	Security Camera	2	No fields changed.
89	2013-05-28 21:39:39.105+00	1	11	5	Water detector	2	Changed code.
90	2013-05-28 21:42:50.666+00	1	11	1	Webcam	2	Changed code, picture_url, brand, technology and price.
91	2013-05-28 21:43:01.527+00	1	11	1	Webcam	2	No fields changed.
92	2013-05-28 21:43:39.129+00	1	16	1	Everspring	2	No fields changed.
93	2013-05-28 22:59:45.857+00	1	11	2	Temperature sensor	2	Changed code, picture_url, brand and technology.
94	2013-05-28 23:15:19.007+00	1	11	3	Multi Switch	2	Changed label, code, lead, brand and technology.
95	2013-05-28 23:16:36.508+00	1	11	4	Lampswitch	2	Changed label, code, lead, brand and technology.
96	2013-05-28 23:17:02.312+00	1	11	5	Water detector	2	Changed code, brand and technology.
97	2013-05-28 23:20:45.313+00	1	16	4	Nexa	1	
98	2013-05-28 23:20:56.586+00	1	11	6	Switcher	1	
99	2013-05-28 23:21:16.222+00	1	11	6	Switcher	2	No fields changed.
100	2013-05-28 23:21:24.198+00	1	11	6	Switcher	2	No fields changed.
101	2013-05-28 23:22:09.7+00	1	11	7	Switcher	1	
102	2013-05-28 23:22:48.556+00	1	11	8	Switcher	1	
103	2013-05-29 06:56:52.789+00	1	17	1	Starter	1	
104	2013-05-29 07:16:58.028+00	1	11	3	Multi Switch	2	No fields changed.
105	2013-05-29 07:25:08.937+00	1	11	4	Lampswitch	2	Changed picture_url.
106	2013-05-29 07:27:15.254+00	1	11	5	Water detector	2	No fields changed.
107	2013-05-29 15:06:24.545+00	1	17	1	Starter	2	No fields changed.
108	2013-05-29 15:06:55.152+00	1	17	2	Advanced	1	
109	2013-05-29 15:09:46.659+00	1	15	1	Provider Finder	2	Changed service_description and additional_description.
110	2013-05-29 15:12:50.895+00	1	15	2	Energy Account	2	Changed service_description and additional_description.
111	2013-05-29 15:16:13.743+00	1	15	3	Gas Detector	2	Changed service_description and additional_description.
112	2013-05-29 15:18:49.681+00	1	15	4	Shared Devices	2	Changed service_description and additional_description.
113	2013-05-29 15:19:06.919+00	1	15	5	Roomba	2	No fields changed.
114	2013-05-29 15:19:24.469+00	1	15	6	Plumbing	3	
115	2013-05-31 19:53:54.048+00	1	14	22	Security Camera	3	
116	2013-05-31 19:53:54.252+00	1	14	46	Webca	3	
117	2013-05-31 19:53:54.559+00	1	14	45	Temp	3	
118	2013-05-31 19:53:54.866+00	1	14	44	Red lamp	3	
119	2013-05-31 19:53:55.173+00	1	14	43	red lamp	3	
120	2013-05-31 19:53:55.48+00	1	14	42	lkjfdsfds	3	
121	2013-05-31 19:53:55.787+00	1	14	41	Tuuletin	3	
122	2013-05-31 19:53:56.095+00	1	14	40	Water detector	3	
123	2013-05-31 19:53:56.402+00	1	14	39	Mummin lääkekaa	3	
124	2013-05-31 19:53:56.71+00	1	14	38	red light	3	
125	2013-05-31 19:53:57.007+00	1	14	37	lamppu	3	
126	2013-05-31 19:53:57.263+00	1	14	36	Punainen lyhty	3	
127	2013-05-31 19:53:57.451+00	1	14	35	red lamp	3	
128	2013-05-31 19:53:57.734+00	1	14	34	Corner lamp	3	
129	2013-05-31 19:53:57.939+00	1	14	33	<szdxsd	3	
130	2013-05-31 19:53:58.246+00	1	14	32	Water sensor	3	
131	2013-05-31 19:53:58.451+00	1	14	31	sadksjd	3	
132	2013-05-31 19:53:58.758+00	1	14	30	aqwasa	3	
133	2013-05-31 19:53:59.065+00	1	14	29	Lamp Puuhamaa	3	
134	2013-05-31 19:53:59.475+00	1	14	28	Lights for WC	3	
135	2013-05-31 19:53:59.782+00	1	14	27	Lights for WC	3	
136	2013-05-31 19:54:00.027+00	1	14	26	Lamp control	3	
137	2013-05-31 19:54:00.294+00	1	14	25	My device	3	
138	2013-05-31 19:54:00.601+00	1	14	24	Temperature	3	
139	2013-05-31 20:23:06.921+00	1	10	7	433.5 MHz	2	Changed name.
140	2013-05-31 20:39:04.014+00	1	14	49	Eletronics	2	Changed installed.
141	2013-06-02 14:22:30.4+00	1	15	1	Provider Finder	2	Changed logo_url.
142	2013-06-02 14:24:19.356+00	1	15	1	Provider Finder	2	No fields changed.
143	2013-06-02 14:25:42.486+00	1	15	2	Energy Account	2	Changed logo_url.
144	2013-06-02 14:25:58.583+00	1	15	3	Gas Detector	2	Changed logo_url.
145	2013-06-02 14:26:15.275+00	1	15	4	Shared Devices	2	Changed logo_url.
146	2013-06-02 14:28:38.124+00	1	15	5	Roomba	2	Changed logo_url.
147	2013-06-02 14:30:35.58+00	1	15	5	Roomba	2	Changed logo_url.
148	2013-06-02 15:02:07.662+00	1	10	7	433.92 MHz	2	Changed name.
149	2013-06-02 15:11:18.072+00	1	11	1	Webcam	2	Changed picture_url.
150	2013-06-02 15:13:05.799+00	1	11	1	Webcam	2	Changed picture_url.
151	2013-06-02 15:24:56.571+00	1	11	1	Webcam	2	Changed picture.
152	2013-06-02 15:28:01.04+00	1	15	1	Provider Finder	2	Changed logo.
153	2013-06-02 15:28:16.562+00	1	15	2	Energy Account	2	Changed logo.
154	2013-06-02 15:28:30.488+00	1	15	3	Gas Detector	2	Changed logo.
155	2013-06-02 15:28:47.078+00	1	15	3	Gas Detector	2	Changed logo.
156	2013-06-02 15:29:01.926+00	1	15	4	Shared Devices	2	Changed logo.
157	2013-06-02 15:29:15.032+00	1	15	5	Roomba	2	Changed logo.
158	2013-06-02 15:36:10.684+00	1	11	2	Temperature sensor	2	Changed picture.
159	2013-06-02 15:37:41.819+00	1	11	3	Multi Switch	2	Changed picture.
160	2013-06-02 15:40:09.894+00	1	11	4	Lampswitch	2	Changed picture.
161	2013-06-02 15:43:35.312+00	1	11	5	Water detector	2	Changed picture.
162	2013-06-02 15:46:32.262+00	1	11	6	Switcher	2	Changed picture.
163	2013-06-02 15:46:43.015+00	1	11	7	Switcher	2	Changed picture.
164	2013-06-02 15:46:53.563+00	1	11	8	Switcher	2	Changed picture.
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: efm
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 164, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: efm
--

COPY django_content_type (id, name, app_label, model) FROM stdin;
1	permission	auth	permission
2	group	auth	group
3	user	auth	user
4	content type	contenttypes	contenttype
5	session	sessions	session
6	site	sites	site
7	log entry	admin	logentry
8	example	provider	example
9	migration history	south	migrationhistory
10	technology	home	technology
11	sensor	home	sensor
12	category	home	category
14	application	home	application
15	example service	services	exampleservice
16	brand	home	brand
17	package	services	package
18	icon	home	icon
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: efm
--

SELECT pg_catalog.setval('django_content_type_id_seq', 18, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: efm
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
zy72nla3z2nhcrj5h0vibro4d6rgqaxq	NzZiOThiMzk2OWM2NWI3MGE3ZDg1OWY4MTc2YmUwMTM1ZTgyMjYyYzqAAn1xAVUGd2ViY2FtcQKJcy4=	2013-06-15 07:37:04.198212+00
zxsrd6cin4ezkyg30ou9q90d8djzbztm	MGRkOTM0M2FmNDA1NmFlZmM5ZWU0NTBmMmEyYzgxN2EwODFkZGY0OTqAAn1xAS4=	2013-06-11 07:09:03.288946+00
sd0fuwgqzkpo7vf0p8dffgsnr28bid3l	YTFiZmNiMmI4YmI3Mjg4OGZhMWNmOGFiNzZiM2E5NzZjZTliNTAyNjqAAn1xAShVBndlYmNhbYlVDWxhdGVzdF9zZW5zb3JjZGphbmdvLmRiLm1vZGVscy5xdWVyeQpRdWVyeVNldApxAimBcQN9cQQoVQVfaXRlcnEFTlUZX3ByZWZldGNoX3JlbGF0ZWRfbG9va3Vwc3EGXXEHVQ5fc3RpY2t5X2ZpbHRlcnEIiVUDX2RicQlOVQ1fcmVzdWx0X2NhY2hlcQpdcQtjY29weV9yZWcKX3JlY29uc3RydWN0b3IKcQxjaG9tZS5tb2RlbHMKU2Vuc29yCnENY19fYnVpbHRpbl9fCm9iamVjdApxDk6HUnEPfXEQKFUHcGljdHVyZXERWAoAAAB3ZWJjYW0ucG5nVQRjb2RlcRJYAgAAADAxVQRsZWFkcRNYDwAAAFNlY3VyaXR5IENhbWVyYVUMX2JyYW5kX2NhY2hlcRRoDGNob21lLm1vZGVscwpCcmFuZApxFWgOTodScRZ9cRcoVQRsb2dvcRhYAAAAAFUGX3N0YXRlcRljZGphbmdvLmRiLm1vZGVscy5iYXNlCk1vZGVsU3RhdGUKcRopgXEbfXEcKFUGYWRkaW5ncR2JVQJkYnEeVQdkZWZhdWx0cR91YlUCaWRxIEsDVQRuYW1lcSFYBgAAAEQtTGlua3ViVQVwcmljZXEiY2RlY2ltYWwKRGVjaW1hbApxI1UGMTE0Ljk1hVJxJGgZaBopgXElfXEmKGgdiWgeaB91YlUGbnVtYmVycSdLAVUFbGFiZWxxKFgGAAAAV2ViY2FtVQhicmFuZF9pZHEpSwNVDXRlY2hub2xvZ3lfaWRxKksEVRFfdGVjaG5vbG9neV9jYWNoZXEraAxjaG9tZS5tb2RlbHMKVGVjaG5vbG9neQpxLGgOTodScS19cS4oaBhYAAAAAGgZaBopgXEvfXEwKGgdiWgeaB91YmggSwRoIVgEAAAAV2xhbnViVQRkYXRlcTFjZGF0ZXRpbWUKZGF0ZQpxMlUEB90FG4VScTNVCWluc3RhbGxlZHE0iGggSwF1YmFVDl9wcmVmZXRjaF9kb25lcTWJVQpfZm9yX3dyaXRlcTaJVQVxdWVyeXE3Y2RqYW5nby5kYi5tb2RlbHMuc3FsLnF1ZXJ5ClF1ZXJ5CnE4KYFxOX1xOihVFWFnZ3JlZ2F0ZV9zZWxlY3RfbWFza3E7TlUXX2FnZ3JlZ2F0ZV9zZWxlY3RfY2FjaGVxPE5VBWV4dHJhcT1jZGphbmdvLnV0aWxzLmRhdGFzdHJ1Y3R1cmVzClNvcnRlZERpY3QKcT4pgXE/fXFAVQhrZXlPcmRlcnFBXXNiVQhqb2luX21hcHFCfXFDKE5YCwAAAGhvbWVfc2Vuc29ycUROTnRoRIVzVRVyZWxhdGVkX3NlbGVjdF9maWVsZHNxRV1VDGV4dHJhX3RhYmxlc3FGKVUJYWxpYXNfbWFwcUd9cUhoRGNkamFuZ28uZGIubW9kZWxzLnNxbC5jb25zdGFudHMKSm9pbkluZm8KcUkoaERoRE5OTk6JdIFxSmNjb2xsZWN0aW9ucwpPcmRlcmVkRGljdApxS11xTChdcU0oVQp0YWJsZV9uYW1lcU5oRGVdcU8oVQlyaHNfYWxpYXNxUGhEZV1xUShVCWpvaW5fdHlwZXFSTmVdcVMoVQlsaHNfYWxpYXNxVE5lXXFVKFUMbGhzX2pvaW5fY29scVZOZV1xVyhVDHJoc19qb2luX2NvbHFYTmVdcVkoVQhudWxsYWJsZXFaiWVlhVJxW2JzVQZ0YWJsZXNxXF1xXWhEYVUMdXNlZF9hbGlhc2VzcV5jX19idWlsdGluX18Kc2V0CnFfXXFgaERhhVJxYVUIb3JkZXJfYnlxYl1xY1UIZGlzdGluY3RxZIlVDmR1cGVfYXZvaWRhbmNlcWV9cWZVEGRlZmF1bHRfb3JkZXJpbmdxZ4hVCGdyb3VwX2J5cWhOVRFzZWxlY3RfZm9yX3VwZGF0ZXFpiVUOc2VsZWN0X3JlbGF0ZWRxaolVEGRlZmVycmVkX2xvYWRpbmdxa2hfXYVScWyIhnFtVQ1zZWxlY3RfZmllbGRzcW5dVRNfZXh0cmFfc2VsZWN0X2NhY2hlcW9OVQltYXhfZGVwdGhxcEsFVQZzZWxlY3RxcV1xclUOZXh0cmFfb3JkZXJfYnlxcylVD2Rpc3RpbmN0X2ZpZWxkc3F0XXF1VQphZ2dyZWdhdGVzcXZoPimBcXd9cXhoQV1zYlUZX2xvYWRlZF9maWVsZF9uYW1lc19jYWNoZXF5fXF6VRFleHRyYV9zZWxlY3RfbWFza3F7TlUYc2VsZWN0X2Zvcl91cGRhdGVfbm93YWl0cXyJVQhsb3dfbWFya3F9SwBVDmFsaWFzX3JlZmNvdW50cX59cX9oREsBc1UTcmVsYXRlZF9zZWxlY3RfY29sc3GAXVUMZGVmYXVsdF9jb2xzcYGIVRBvcmRlcmluZ19hbGlhc2VzcYJdcYNVCWhpZ2hfbWFya3GETlUZaW5jbHVkZWRfaW5oZXJpdGVkX21vZGVsc3GFfXGGTmhEc1UJdGFibGVfbWFwcYd9cYhoRF1xiWhEYXNVC3doZXJlX2NsYXNzcYpjZGphbmdvLmRiLm1vZGVscy5zcWwud2hlcmUKV2hlcmVOb2RlCnGLVQVtb2RlbHGMaA1VEXN0YW5kYXJkX29yZGVyaW5ncY2IVQV3aGVyZXGOaIspgXGPfXGQKFUJY29ubmVjdG9ycZFVA0FORHGSVQduZWdhdGVkcZOJVQhjaGlsZHJlbnGUXXGVaIspgXGWfXGXKGiRaJJok4lolF1xmChjZGphbmdvLmRiLm1vZGVscy5zcWwud2hlcmUKQ29uc3RyYWludApxmSmBcZp9cZsoVQVhbGlhc3GcaERVBW1vZGVscZ1oDVUKZmllbGRfbmFtZXGeaBJVA2NvbHGfVQRjb2RlcaB1YlUFZXhhY3SIWAIAAAAwMXRxoWFVD3N1YnRyZWVfcGFyZW50c3GiXXViYWiiXXViVQZoYXZpbmdxo2iLKYFxpH1xpShokWiSaJOJaJRdaKJddWJVEGZpbHRlcl9pc19zdGlja3lxpol1YmidaA1VFl9rbm93bl9yZWxhdGVkX29iamVjdHNxp31xqHViVQ1fYXV0aF91c2VyX2lkSwFVEl9hdXRoX3VzZXJfYmFja2VuZFUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmR1Lg==	2013-06-16 17:20:07.377+00
v7sffh17bfuqtnkhppttwqm5o89u56p7	MDkzY2M5YTdkZjIwNDQ2MzA1MTZhODkyZjhiNTQzMTVjYjIwMjBiMDqAAn1xAShVBndlYmNhbYlVDWxhdGVzdF9zZW5zb3JxAmNkamFuZ28uZGIubW9kZWxzLnF1ZXJ5ClF1ZXJ5U2V0CnEDKYFxBH1xBShVBV9pdGVycQZOVRlfcHJlZmV0Y2hfcmVsYXRlZF9sb29rdXBzcQddcQhVDl9zdGlja3lfZmlsdGVycQmJVQNfZGJxCk5VDV9yZXN1bHRfY2FjaGVxC11xDGNjb3B5X3JlZwpfcmVjb25zdHJ1Y3RvcgpxDWNob21lLm1vZGVscwpTZW5zb3IKcQ5jX19idWlsdGluX18Kb2JqZWN0CnEPTodScRB9cREoVQxfYnJhbmRfY2FjaGVxEmgNY2hvbWUubW9kZWxzCkJyYW5kCnETaA9Oh1JxFH1xFShVCGxvZ29fdXJscRZYyAAAAGh0dHA6Ly93d3cuZ29vZ2xlLmZpL3VybD9zYT1pJnJjdD1qJnE9JmVzcmM9cyZzb3VyY2U9aW1hZ2VzJmNkPSZjYWQ9cmphJmRvY2lkPURiLVZUM2M5eTY4bFlNJnRibmlkPUdFNDVITUNpcUY5SXJNOiZ2ZWQ9MENBVVFqUncmdXJsPWh0dHAlM0ElMkYlMkZ3d3cuY29tcHV0ZXguZmklMkZjYXRhbG9nJTJGaW5kZXgucGhwJTNGbWFudWZhY3R1cmVyc19pVQZfc3RhdGVxF2NkamFuZ28uZGIubW9kZWxzLmJhc2UKTW9kZWxTdGF0ZQpxGCmBcRl9cRooVQZhZGRpbmdxG4lVAmRicRxVB2RlZmF1bHRxHXViVQJpZHEeSwRVBG5hbWVxH1gEAAAATmV4YXViVQRjb2RlcSBYAgAAADEyVQRsZWFkcSFYFAAAAEJhc2ljIHBvd2VyIHN3aXRjaGVyVQVwcmljZXEiTlULcGljdHVyZV91cmxxI1hNAAAAaHR0cDovL2NkbjEuaWNvbmZpbmRlci5jb20vZGF0YS9pY29ucy9YLU1hYy9tdWx0aW1lZGlhL3BuZy8xMjgvc3dpdGNoX29mZi5wbmdoF2gYKYFxJH1xJShoG4loHGgddWJVBm51bWJlcnEmSwxVBWxhYmVscSdYCAAAAFN3aXRjaGVyVQhicmFuZF9pZHEoSwRVDXRlY2hub2xvZ3lfaWRxKUsGVRFfdGVjaG5vbG9neV9jYWNoZXEqaA1jaG9tZS5tb2RlbHMKVGVjaG5vbG9neQpxK2gPTodScSx9cS0oaBZYyAAAAGh0dHA6Ly93d3cuZ29vZ2xlLmZpL3VybD9zYT1pJnJjdD1qJnE9JmVzcmM9cyZzb3VyY2U9aW1hZ2VzJmNkPSZjYWQ9cmphJmRvY2lkPW5Hemc2Yy1LMWY1bjhNJnRibmlkPW1GWjdGMU9hRFJhOHpNOiZ2ZWQ9MENBVVFqUncmdXJsPWh0dHAlM0ElMkYlMkZ3d3cuaWNvbnNob2NrLmNvbSUyRmljb24tc2V0cyUyRnhtYWMtbXVsdGltZWRpYS1pY29ucy5oaBdoGCmBcS59cS8oaBuJaBxoHXViaB5LBmgfWAcAAAA0MzMgTUh6dWJVBGRhdGVxMGNkYXRldGltZQpkYXRlCnExVQQH3QUdhVJxMlUJaW5zdGFsbGVkcTOIaB5LCHViYVUOX3ByZWZldGNoX2RvbmVxNIlVCl9mb3Jfd3JpdGVxNYlVBXF1ZXJ5cTZjZGphbmdvLmRiLm1vZGVscy5zcWwucXVlcnkKUXVlcnkKcTcpgXE4fXE5KFUVYWdncmVnYXRlX3NlbGVjdF9tYXNrcTpOVRdfYWdncmVnYXRlX3NlbGVjdF9jYWNoZXE7TlUFZXh0cmFxPGNkamFuZ28udXRpbHMuZGF0YXN0cnVjdHVyZXMKU29ydGVkRGljdApxPSmBcT59cT9VCGtleU9yZGVycUBdc2JVCGpvaW5fbWFwcUF9cUIoTlgLAAAAaG9tZV9zZW5zb3JxQ05OdGhDhXNVFXJlbGF0ZWRfc2VsZWN0X2ZpZWxkc3FEXVUMZXh0cmFfdGFibGVzcUUpVQZzZWxlY3RxRl1xR1UGdGFibGVzcUhdcUloQ2FVDHVzZWRfYWxpYXNlc3FKY19fYnVpbHRpbl9fCnNldApxS11xTGhDYYVScU1VCG9yZGVyX2J5cU5dcU9VCGRpc3RpbmN0cVCJVQ5kdXBlX2F2b2lkYW5jZXFRfXFSVRBkZWZhdWx0X29yZGVyaW5ncVOIVQhncm91cF9ieXFUTlURc2VsZWN0X2Zvcl91cGRhdGVxVYlVDnNlbGVjdF9yZWxhdGVkcVaJVRBkZWZlcnJlZF9sb2FkaW5ncVdoS12FUnFYiIZxWVUNc2VsZWN0X2ZpZWxkc3FaXVUJYWxpYXNfbWFwcVt9cVxoQ2NkamFuZ28uZGIubW9kZWxzLnNxbC5jb25zdGFudHMKSm9pbkluZm8KcV0oaENoQ05OTk6JdIFxXnNVCW1heF9kZXB0aHFfSwVVEXN0YW5kYXJkX29yZGVyaW5ncWCIVQ5leHRyYV9vcmRlcl9ieXFhKVUPZGlzdGluY3RfZmllbGRzcWJdcWNVCmFnZ3JlZ2F0ZXNxZGg9KYFxZX1xZmhAXXNiVRlfbG9hZGVkX2ZpZWxkX25hbWVzX2NhY2hlcWd9cWhVEWV4dHJhX3NlbGVjdF9tYXNrcWlOVRhzZWxlY3RfZm9yX3VwZGF0ZV9ub3dhaXRxaolVE19leHRyYV9zZWxlY3RfY2FjaGVxa05VCGxvd19tYXJrcWxLAFUOYWxpYXNfcmVmY291bnRxbX1xbmhDSwFzVRNyZWxhdGVkX3NlbGVjdF9jb2xzcW9dVQxkZWZhdWx0X2NvbHNxcIhVEG9yZGVyaW5nX2FsaWFzZXNxcV1xclUJaGlnaF9tYXJrcXNOVRlpbmNsdWRlZF9pbmhlcml0ZWRfbW9kZWxzcXR9cXVOaENzVQl0YWJsZV9tYXBxdn1xd2hDXXF4aENhc1ULd2hlcmVfY2xhc3NxeWNkamFuZ28uZGIubW9kZWxzLnNxbC53aGVyZQpXaGVyZU5vZGUKcXpVBW1vZGVscXtoDlUFd2hlcmVxfGh6KYFxfX1xfihVCWNvbm5lY3RvcnF/VQNBTkRxgFUHbmVnYXRlZHGBiVUIY2hpbGRyZW5xgl1xg2h6KYFxhH1xhShof2iAaIGJaIJdcYYoY2RqYW5nby5kYi5tb2RlbHMuc3FsLndoZXJlCkNvbnN0cmFpbnQKcYcpgXGIfXGJKFUFYWxpYXNximhDaHtoDlUKZmllbGRfbmFtZXGLaCBVA2NvbHGMaCB1YlUFZXhhY3RxjYhYAgAAADEycY50cY9hVQ9zdWJ0cmVlX3BhcmVudHNxkF11YmFokF11YlUGaGF2aW5ncZFoeimBcZJ9cZMoaH9ogGiBiWiCXWiQXXViVRBmaWx0ZXJfaXNfc3RpY2t5cZSJdWJoe2gOVRZfa25vd25fcmVsYXRlZF9vYmplY3RzcZV9cZZ1YnUu	2013-06-15 08:45:25.05413+00
3172523ffa8dc7c29071ccb05a2cc5fd	MDUwZmQ0ZDhkYjY3ZDU0MWFjOGJlYWYyMTk3NDkwOGIwM2I1MGFmNzqAAn1xAVUGd2ViY2FtiXMu\n	2013-06-16 17:26:17.296888+00
an9hetk9zl6bj5j6tle6u6a0yq4ysenz	NzZiOThiMzk2OWM2NWI3MGE3ZDg1OWY4MTc2YmUwMTM1ZTgyMjYyYzqAAn1xAVUGd2ViY2FtcQKJcy4=	2013-06-15 09:24:04.010265+00
v1p48zst9g4dfl4p66j4fbepe2peoknz	ZjhmNWVjOWUzNmI3OWFiODAxZGEzOTE2MzQxZjIzMGFlOTBmM2YxZDqAAn1xAVUNbGF0ZXN0X3NlbnNvcnECWAAAAABzLg==	2013-06-10 13:59:56.058+00
pzcs6hz0ynhuzptd4jxndk1km49200rq	NzZiOThiMzk2OWM2NWI3MGE3ZDg1OWY4MTc2YmUwMTM1ZTgyMjYyYzqAAn1xAVUGd2ViY2FtcQKJcy4=	2013-06-13 11:58:33.531552+00
uhhwkb3678ibfggrtch54k0e9r8b0zmr	NzZiOThiMzk2OWM2NWI3MGE3ZDg1OWY4MTc2YmUwMTM1ZTgyMjYyYzqAAn1xAVUGd2ViY2FtcQKJcy4=	2013-06-13 12:00:11.920855+00
82919dd7aa7fc94324efcf444846ec5f	NzZiOThiMzk2OWM2NWI3MGE3ZDg1OWY4MTc2YmUwMTM1ZTgyMjYyYzqAAn1xAVUGd2ViY2FtcQKJ\ncy4=\n	2013-06-16 17:55:33.805556+00
6ete76rx5nw84kxk4rkc4bhlbiuqfsg0	MjYyNDk5MjYzMzRhNDc3MmVjZDI0ZmFmODExMzE3ZmJkZTM4Mzc4ZjqAAn1xAShVBndlYmNhbYlVDWxhdGVzdF9zZW5zb3JjZGphbmdvLmRiLm1vZGVscy5xdWVyeQpRdWVyeVNldApxAimBcQN9cQQoVQVfaXRlcnEFTlUWX2tub3duX3JlbGF0ZWRfb2JqZWN0c3EGfXEHVQ5fc3RpY2t5X2ZpbHRlcnEIiVUDX2RicQlOVQ1fcmVzdWx0X2NhY2hlcQpdcQtjY29weV9yZWcKX3JlY29uc3RydWN0b3IKcQxjaG9tZS5tb2RlbHMKU2Vuc29yCnENY19fYnVpbHRpbl9fCm9iamVjdApxDk6HUnEPfXEQKFUMX2JyYW5kX2NhY2hlaAxjaG9tZS5tb2RlbHMKQnJhbmQKcRFoDk6HUnESfXETKFUIbG9nb191cmxxFFhqAAAAaHR0cHM6Ly9lbmNyeXB0ZWQtdGJuMi5nc3RhdGljLmNvbS9pbWFnZXM/cT10Ym46QU5kOUdjVEhObzhqdExscEswV3pybXo2YUh0NzJQMGtHUU5ibERRS2tTUmtnSGt4QVdlMTVCbHlpZ1UGX3N0YXRlcRVjZGphbmdvLmRiLm1vZGVscy5iYXNlCk1vZGVsU3RhdGUKcRYpgXEXfXEYKFUGYWRkaW5ncRmJVQJkYnEaVQdkZWZhdWx0cRt1YlUCaWRxHEsCVQRuYW1lcR1YDAAAAE5pbmphIEJsb2Nrc3ViVQRjb2RlcR5YAgAAADAyVQRsZWFkcR9YFAAAAE1lYXN1cmVzIHRlbXBlcmF0dXJlVQVwcmljZXEgTlULcGljdHVyZV91cmxxIVgsAAAAaHR0cDovL3d3dy5icmVzaW5rLmRlL0ltYWdlcy9UZW1wTW9uaXRvci5wbmdoFWgWKYFxIn1xIyhoGYloGmgbdWJVBm51bWJlcnEkSwJVBWxhYmVscSVYEgAAAFRlbXBlcmF0dXJlIHNlbnNvclUIYnJhbmRfaWRxJksCVQ10ZWNobm9sb2d5X2lkcSdLB1URX3RlY2hub2xvZ3lfY2FjaGVoDGNob21lLm1vZGVscwpUZWNobm9sb2d5CnEoaA5Oh1JxKX1xKihoFFhIAAAAaHR0cDovL3N0YXRpYy5pb3NwaXJpdC5jb20vc3RhdGljL29iamVjdGZpbGVzL2ltYWdlLzg2OS9IYXJkd2FyZVdMQU4ucG5naBVoFimBcSt9cSwoaBmJaBpoG3ViaBxLB2gdWAUAAAA0MzMgbnViVQRkYXRlcS1jZGF0ZXRpbWUKZGF0ZQpxLlUEB90FG4VScS9VCWluc3RhbGxlZHEwiGgcSwJ1YmFVDl9wcmVmZXRjaF9kb25lcTGJVQpfZm9yX3dyaXRlcTKJVQVxdWVyeXEzY2RqYW5nby5kYi5tb2RlbHMuc3FsLnF1ZXJ5ClF1ZXJ5CnE0KYFxNX1xNihVFWFnZ3JlZ2F0ZV9zZWxlY3RfbWFza3E3TlUXX2FnZ3JlZ2F0ZV9zZWxlY3RfY2FjaGVxOE5VBWV4dHJhcTljZGphbmdvLnV0aWxzLmRhdGFzdHJ1Y3R1cmVzClNvcnRlZERpY3QKcTopgXE7fXE8VQhrZXlPcmRlcnE9XXNiVQhqb2luX21hcHE+fXE/KE5YCwAAAGhvbWVfc2Vuc29ycUBOTnRoQIVzVRVyZWxhdGVkX3NlbGVjdF9maWVsZHNxQV1VDGV4dHJhX3RhYmxlc3FCKVUJYWxpYXNfbWFwcUN9cURoQGNkamFuZ28uZGIubW9kZWxzLnNxbC5jb25zdGFudHMKSm9pbkluZm8KcUUoaEBoQE5OTk6JdIFxRnNVBnRhYmxlc3FHXXFIaEBhVQx1c2VkX2FsaWFzZXNxSWNfX2J1aWx0aW5fXwpzZXQKcUpdcUtoQGGFUnFMVQhvcmRlcl9ieXFNXXFOVQhkaXN0aW5jdHFPiVUOZHVwZV9hdm9pZGFuY2VxUH1xUVUJdGFibGVfbWFwcVJ9cVNoQF1xVGhAYXNVCGdyb3VwX2J5cVVOVRFzZWxlY3RfZm9yX3VwZGF0ZXFWiVUOc2VsZWN0X3JlbGF0ZWRxV4lVEGRlZmVycmVkX2xvYWRpbmdxWGhKXYVScVmIhnFaVQ1zZWxlY3RfZmllbGRzcVtdVRNfZXh0cmFfc2VsZWN0X2NhY2hlcVxOVQltYXhfZGVwdGhxXUsFVQZzZWxlY3RxXl1xX1UOZXh0cmFfb3JkZXJfYnlxYClVD2Rpc3RpbmN0X2ZpZWxkc3FhXXFiVQphZ2dyZWdhdGVzcWNoOimBcWR9cWVoPV1zYlUZX2xvYWRlZF9maWVsZF9uYW1lc19jYWNoZXFmfXFnVRFleHRyYV9zZWxlY3RfbWFza3FoTlUYc2VsZWN0X2Zvcl91cGRhdGVfbm93YWl0cWmJVQhsb3dfbWFya3FqSwBVDmFsaWFzX3JlZmNvdW50cWt9cWxoQEsBc1UTcmVsYXRlZF9zZWxlY3RfY29sc3FtXVUMZGVmYXVsdF9jb2xzcW6IVRBvcmRlcmluZ19hbGlhc2VzcW9dcXBVBmhhdmluZ3FxY2RqYW5nby5kYi5tb2RlbHMuc3FsLndoZXJlCldoZXJlTm9kZQpxcimBcXN9cXQoVQljb25uZWN0b3JxdVUDQU5EcXZVB25lZ2F0ZWRxd4lVCGNoaWxkcmVucXhdVQ9zdWJ0cmVlX3BhcmVudHNxeV11YlUZaW5jbHVkZWRfaW5oZXJpdGVkX21vZGVsc3F6fXF7TmhAc1UQZGVmYXVsdF9vcmRlcmluZ3F8iFULd2hlcmVfY2xhc3NxfWhyVQVtb2RlbHF+aA1VEXN0YW5kYXJkX29yZGVyaW5ncX+IVQV3aGVyZXGAaHIpgXGBfXGCKGh1aHZod4loeF1xg2hyKYFxhH1xhShodWh2aHeJaHhdcYYoY2RqYW5nby5kYi5tb2RlbHMuc3FsLndoZXJlCkNvbnN0cmFpbnQKcYcpgXGIfXGJKFUFYWxpYXNximhAVQVtb2RlbHGLaA1VCmZpZWxkX25hbWVxjGgeVQNjb2xxjVUEY29kZXGOdWJVBWV4YWN0iFgCAAAAMDJ0cY9haHlddWJhaHlddWJVCWhpZ2hfbWFya3GQTlUQZmlsdGVyX2lzX3N0aWNreXGRiXViaItoDVUZX3ByZWZldGNoX3JlbGF0ZWRfbG9va3Vwc3GSXXGTdWJ1Lg==	2013-06-15 11:01:35.662047+00
e9lau1vh37p9xhxfk2ns60ysl7orwvnu	NzZiOThiMzk2OWM2NWI3MGE3ZDg1OWY4MTc2YmUwMTM1ZTgyMjYyYzqAAn1xAVUGd2ViY2FtcQKJcy4=	2013-06-16 18:08:33.09374+00
8k8319a9rc47udm4bwoh4l6c8yssisay	NzZiOThiMzk2OWM2NWI3MGE3ZDg1OWY4MTc2YmUwMTM1ZTgyMjYyYzqAAn1xAVUGd2ViY2FtcQKJcy4=	2013-06-15 12:39:07.630875+00
rgy8u96et54d4uderabra21hq15i4wc2	NzZiOThiMzk2OWM2NWI3MGE3ZDg1OWY4MTc2YmUwMTM1ZTgyMjYyYzqAAn1xAVUGd2ViY2FtcQKJcy4=	2013-06-15 14:54:10.184049+00
7spqzwi31mv7okpyczoqz78oqwojz4ja	MGNiNjE0NTIwYWY0OWNjOTk4NWRkZDM3M2E5NGZlNTEwNzE4OGEzYTqAAn1xAShVBndlYmNhbYlVDWxhdGVzdF9zZW5zb3JjZGphbmdvLmRiLm1vZGVscy5xdWVyeQpRdWVyeVNldApxAimBcQN9cQQoVQVfaXRlcnEFTlUZX3ByZWZldGNoX3JlbGF0ZWRfbG9va3Vwc3EGXXEHVQ5fc3RpY2t5X2ZpbHRlcnEIiVUDX2RicQlOVQ1fcmVzdWx0X2NhY2hlcQpdcQtjY29weV9yZWcKX3JlY29uc3RydWN0b3IKcQxjaG9tZS5tb2RlbHMKU2Vuc29yCnENY19fYnVpbHRpbl9fCm9iamVjdApxDk6HUnEPfXEQKFUMX2JyYW5kX2NhY2hlcRFoDGNob21lLm1vZGVscwpCcmFuZApxEmgOTodScRN9cRQoVQhsb2dvX3VybHEVWD0AAABodHRwOi8vc3RvcmUuaG9tZXNlZXIuY29tL3N0b3JlL0Fzc2V0cy9ldmVyc3ByaW5nLWxvZ28tNzUuZ2lmVQZfc3RhdGVxFmNkamFuZ28uZGIubW9kZWxzLmJhc2UKTW9kZWxTdGF0ZQpxFymBcRh9cRkoVQZhZGRpbmdxGolVAmRicRtVB2RlZmF1bHRxHHViVQJpZHEdSwFVBG5hbWVxHlgKAAAARXZlcnNwcmluZ3ViVQRjb2RlcR9YAgAAADA0VQRsZWFkcSBYFgAAAExhbXAgYnVsZCBwb3dlciBzd2l0Y2hVBXByaWNlcSFOVQtwaWN0dXJlX3VybHEiWGoAAABodHRwOi8vZmlsZXMuc29mdGljb25zLmNvbS9kb3dubG9hZC9vYmplY3QtaWNvbnMvd29ya2VkLWF3aGlsZS1saWdodHMtaWNvbnMtYnktYXJ0YmVlcy9wbmcvMTI4L09mZkxhbXAucG5naBZoFymBcSN9cSQoaBqJaBtoHHViVQZudW1iZXJxJUsEVQVsYWJlbHEmWAoAAABMYW1wc3dpdGNoVQhicmFuZF9pZHEnSwFVDXRlY2hub2xvZ3lfaWRxKEsFVRFfdGVjaG5vbG9neV9jYWNoZXEpaAxjaG9tZS5tb2RlbHMKVGVjaG5vbG9neQpxKmgOTodScSt9cSwoaBVYagAAAGh0dHBzOi8vZW5jcnlwdGVkLXRibjMuZ3N0YXRpYy5jb20vaW1hZ2VzP3E9dGJuOkFOZDlHY1RqTFYzZUVJaEM2QWQ3U3VpUmM2a1Rlb0FnaDcweDlsWWdWVkxGWVdUY1JuYlJMOWxmaXdoFmgXKYFxLX1xLihoGoloG2gcdWJoHUsFaB5YBgAAAFotV2F2ZXViVQRkYXRlcS9jZGF0ZXRpbWUKZGF0ZQpxMFUEB90FG4VScTFVCWluc3RhbGxlZHEyiGgdSwR1YmFVDl9wcmVmZXRjaF9kb25lcTOJVQpfZm9yX3dyaXRlcTSJVQVxdWVyeXE1Y2RqYW5nby5kYi5tb2RlbHMuc3FsLnF1ZXJ5ClF1ZXJ5CnE2KYFxN31xOChVFWFnZ3JlZ2F0ZV9zZWxlY3RfbWFza3E5TlUXX2FnZ3JlZ2F0ZV9zZWxlY3RfY2FjaGVxOk5VBWV4dHJhcTtjZGphbmdvLnV0aWxzLmRhdGFzdHJ1Y3R1cmVzClNvcnRlZERpY3QKcTwpgXE9fXE+VQhrZXlPcmRlcnE/XXNiVQhqb2luX21hcHFAfXFBKE5YCwAAAGhvbWVfc2Vuc29ycUJOTnRoQoVzVRVyZWxhdGVkX3NlbGVjdF9maWVsZHNxQ11VDGV4dHJhX3RhYmxlc3FEKVUJYWxpYXNfbWFwcUV9cUZoQmNkamFuZ28uZGIubW9kZWxzLnNxbC5jb25zdGFudHMKSm9pbkluZm8KcUcoaEJoQk5OTk6JdIFxSHNVBnRhYmxlc3FJXXFKaEJhVQx1c2VkX2FsaWFzZXNxS2NfX2J1aWx0aW5fXwpzZXQKcUxdcU1oQmGFUnFOVQhvcmRlcl9ieXFPXXFQVQhkaXN0aW5jdHFRiVUOZHVwZV9hdm9pZGFuY2VxUn1xU1UQZGVmYXVsdF9vcmRlcmluZ3FUiFUIZ3JvdXBfYnlxVU5VEXNlbGVjdF9mb3JfdXBkYXRlcVaJVQ5zZWxlY3RfcmVsYXRlZHFXiVUQZGVmZXJyZWRfbG9hZGluZ3FYaExdhVJxWYiGcVpVDXNlbGVjdF9maWVsZHNxW11VE19leHRyYV9zZWxlY3RfY2FjaGVxXE5VCW1heF9kZXB0aHFdSwVVBnNlbGVjdHFeXXFfVQ5leHRyYV9vcmRlcl9ieXFgKVUPZGlzdGluY3RfZmllbGRzcWFdcWJVCmFnZ3JlZ2F0ZXNxY2g8KYFxZH1xZWg/XXNiVRlfbG9hZGVkX2ZpZWxkX25hbWVzX2NhY2hlcWZ9cWdVEWV4dHJhX3NlbGVjdF9tYXNrcWhOVRhzZWxlY3RfZm9yX3VwZGF0ZV9ub3dhaXRxaYlVCGxvd19tYXJrcWpLAFUOYWxpYXNfcmVmY291bnRxa31xbGhCSwFzVRNyZWxhdGVkX3NlbGVjdF9jb2xzcW1dVQxkZWZhdWx0X2NvbHNxbohVEG9yZGVyaW5nX2FsaWFzZXNxb11xcFUJaGlnaF9tYXJrcXFOVRlpbmNsdWRlZF9pbmhlcml0ZWRfbW9kZWxzcXJ9cXNOaEJzVQl0YWJsZV9tYXBxdH1xdWhCXXF2aEJhc1ULd2hlcmVfY2xhc3Nxd2NkamFuZ28uZGIubW9kZWxzLnNxbC53aGVyZQpXaGVyZU5vZGUKcXhVBW1vZGVscXloDVURc3RhbmRhcmRfb3JkZXJpbmdxeohVBXdoZXJlcXtoeCmBcXx9cX0oVQljb25uZWN0b3JxflUDQU5EcX9VB25lZ2F0ZWRxgIlVCGNoaWxkcmVucYFdcYJoeCmBcYN9cYQoaH5of2iAiWiBXXGFKGNkamFuZ28uZGIubW9kZWxzLnNxbC53aGVyZQpDb25zdHJhaW50CnGGKYFxh31xiChVBWFsaWFzcYloQlUFbW9kZWxximgNVQpmaWVsZF9uYW1lcYtoH1UDY29scYxVBGNvZGVxjXViVQVleGFjdIhYAgAAADA0dHGOYVUPc3VidHJlZV9wYXJlbnRzcY9ddWJhaI9ddWJVBmhhdmluZ3GQaHgpgXGRfXGSKGh+aH9ogIlogV1oj111YlUQZmlsdGVyX2lzX3N0aWNreXGTiXViaIpoDVUWX2tub3duX3JlbGF0ZWRfb2JqZWN0c3GUfXGVdWJVBHVzZXJYBgAAAFBpcmtrb3Uu	2013-06-16 18:10:11.805937+00
yxr424qpbf7pyu1q9g9atxifj55sgz00	OGVmNjE5ZWQxZTg0NGJjZDIyNjI2ZjNiYzBkMzcyM2E0YTM2ZDA1ZTqAAn1xAShVBndlYmNhbYlVDWxhdGVzdF9zZW5zb3JjZGphbmdvLmRiLm1vZGVscy5xdWVyeQpRdWVyeVNldApxAimBcQN9cQQoVQVfaXRlcnEFTlUWX2tub3duX3JlbGF0ZWRfb2JqZWN0c3EGfXEHVQ5fc3RpY2t5X2ZpbHRlcnEIiVUDX2RicQlOVQ1fcmVzdWx0X2NhY2hlcQpdcQtjY29weV9yZWcKX3JlY29uc3RydWN0b3IKcQxjaG9tZS5tb2RlbHMKU2Vuc29yCnENY19fYnVpbHRpbl9fCm9iamVjdApxDk6HUnEPfXEQKFUMX2JyYW5kX2NhY2hlcRFoDGNob21lLm1vZGVscwpCcmFuZApxEmgOTodScRN9cRQoVQhsb2dvX3VybHEVWD0AAABodHRwOi8vc3RvcmUuaG9tZXNlZXIuY29tL3N0b3JlL0Fzc2V0cy9ldmVyc3ByaW5nLWxvZ28tNzUuZ2lmVQZfc3RhdGVxFmNkamFuZ28uZGIubW9kZWxzLmJhc2UKTW9kZWxTdGF0ZQpxFymBcRh9cRkoVQZhZGRpbmdxGolVAmRicRtVB2RlZmF1bHRxHHViVQJpZHEdSwFVBG5hbWVxHlgKAAAARXZlcnNwcmluZ3ViVQRjb2RlcR9YAgAAADAzVQRsZWFkcSBYGQAAAEVuZXJneSBtZXRlciBhbmQgc3dpdGNoZXJVBXByaWNlcSFOVQtwaWN0dXJlX3VybHEiWGoAAABodHRwczovL2VuY3J5cHRlZC10Ym4zLmdzdGF0aWMuY29tL2ltYWdlcz9xPXRibjpBTmQ5R2NTTk1ONW52ejkza1lsNElHakkwazNCNF9yVWZiMzZFb2Z5S0JIVThReFBuWWRYbjRmUmtnaBZoFymBcSN9cSQoaBqJaBtoHHViVQZudW1iZXJxJUsDVQVsYWJlbHEmWAwAAABNdWx0aSBTd2l0Y2hVCGJyYW5kX2lkcSdLAVUNdGVjaG5vbG9neV9pZHEoSwVVEV90ZWNobm9sb2d5X2NhY2hlcSloDGNob21lLm1vZGVscwpUZWNobm9sb2d5CnEqaA5Oh1JxK31xLChoFVhqAAAAaHR0cHM6Ly9lbmNyeXB0ZWQtdGJuMy5nc3RhdGljLmNvbS9pbWFnZXM/cT10Ym46QU5kOUdjVGpMVjNlRUloQzZBZDdTdWlSYzZrVGVvQWdoNzB4OWxZZ1ZWTEZZV1RjUm5iUkw5bGZpd2gWaBcpgXEtfXEuKGgaiWgbaBx1YmgdSwVoHlgGAAAAWi1XYXZldWJVBGRhdGVxL2NkYXRldGltZQpkYXRlCnEwVQQH3QUbhVJxMVUJaW5zdGFsbGVkcTKIaB1LA3ViYVUOX3ByZWZldGNoX2RvbmVxM4lVCl9mb3Jfd3JpdGVxNIlVBXF1ZXJ5cTVjZGphbmdvLmRiLm1vZGVscy5zcWwucXVlcnkKUXVlcnkKcTYpgXE3fXE4KFUVYWdncmVnYXRlX3NlbGVjdF9tYXNrcTlOVRdfYWdncmVnYXRlX3NlbGVjdF9jYWNoZXE6TlUFZXh0cmFxO2NkamFuZ28udXRpbHMuZGF0YXN0cnVjdHVyZXMKU29ydGVkRGljdApxPCmBcT19cT5VCGtleU9yZGVycT9dc2JVCGpvaW5fbWFwcUB9cUEoTlgLAAAAaG9tZV9zZW5zb3JxQk5OdGhChXNVFXJlbGF0ZWRfc2VsZWN0X2ZpZWxkc3FDXVUMZXh0cmFfdGFibGVzcUQpVQlhbGlhc19tYXBxRX1xRmhCY2RqYW5nby5kYi5tb2RlbHMuc3FsLmNvbnN0YW50cwpKb2luSW5mbwpxRyhoQmhCTk5OTol0gXFIc1UGdGFibGVzcUldcUpoQmFVDHVzZWRfYWxpYXNlc3FLY19fYnVpbHRpbl9fCnNldApxTF1xTWhCYYVScU5VCG9yZGVyX2J5cU9dcVBVCGRpc3RpbmN0cVGJVQ5kdXBlX2F2b2lkYW5jZXFSfXFTVQl0YWJsZV9tYXBxVH1xVWhCXXFWaEJhc1UIZ3JvdXBfYnlxV05VEXNlbGVjdF9mb3JfdXBkYXRlcViJVQ5zZWxlY3RfcmVsYXRlZHFZiVUQZGVmZXJyZWRfbG9hZGluZ3FaaExdhVJxW4iGcVxVDXNlbGVjdF9maWVsZHNxXV1VE19leHRyYV9zZWxlY3RfY2FjaGVxXk5VCW1heF9kZXB0aHFfSwVVBnNlbGVjdHFgXXFhVQ5leHRyYV9vcmRlcl9ieXFiKVUPZGlzdGluY3RfZmllbGRzcWNdcWRVCmFnZ3JlZ2F0ZXNxZWg8KYFxZn1xZ2g/XXNiVRlfbG9hZGVkX2ZpZWxkX25hbWVzX2NhY2hlcWh9cWlVEWV4dHJhX3NlbGVjdF9tYXNrcWpOVRhzZWxlY3RfZm9yX3VwZGF0ZV9ub3dhaXRxa4lVCGxvd19tYXJrcWxLAFUOYWxpYXNfcmVmY291bnRxbX1xbmhCSwFzVRNyZWxhdGVkX3NlbGVjdF9jb2xzcW9dVQxkZWZhdWx0X2NvbHNxcIhVEG9yZGVyaW5nX2FsaWFzZXNxcV1xclUGaGF2aW5ncXNjZGphbmdvLmRiLm1vZGVscy5zcWwud2hlcmUKV2hlcmVOb2RlCnF0KYFxdX1xdihVCWNvbm5lY3RvcnF3VQNBTkRxeFUHbmVnYXRlZHF5iVUIY2hpbGRyZW5xel1VD3N1YnRyZWVfcGFyZW50c3F7XXViVRlpbmNsdWRlZF9pbmhlcml0ZWRfbW9kZWxzcXx9cX1OaEJzVRBkZWZhdWx0X29yZGVyaW5ncX6IVQt3aGVyZV9jbGFzc3F/aHRVBW1vZGVscYBoDVURc3RhbmRhcmRfb3JkZXJpbmdxgYhVBXdoZXJlcYJodCmBcYN9cYQoaHdoeGh5iWh6XXGFaHQpgXGGfXGHKGh3aHhoeYloel1xiChjZGphbmdvLmRiLm1vZGVscy5zcWwud2hlcmUKQ29uc3RyYWludApxiSmBcYp9cYsoVQVhbGlhc3GMaEJVBW1vZGVscY1oDVUKZmllbGRfbmFtZXGOaB9VA2NvbHGPVQRjb2RlcZB1YlUFZXhhY3SIWAIAAAAwM3RxkWFoe111YmFoe111YlUJaGlnaF9tYXJrcZJOVRBmaWx0ZXJfaXNfc3RpY2t5cZOJdWJojWgNVRlfcHJlZmV0Y2hfcmVsYXRlZF9sb29rdXBzcZRdcZV1YlUEdXNlclgFAAAASm9vbmF1Lg==	2013-06-16 18:15:32.3496+00
uo4g86fkptec3frihrgj4kasx2cl4w0y	NzZiOThiMzk2OWM2NWI3MGE3ZDg1OWY4MTc2YmUwMTM1ZTgyMjYyYzqAAn1xAVUGd2ViY2FtcQKJcy4=	2013-06-12 15:57:10.339778+00
yz3f0v8a9srfudr9c2ur0u75sdk2n2y2	MDUwZmQ0ZDhkYjY3ZDU0MWFjOGJlYWYyMTk3NDkwOGIwM2I1MGFmNzqAAn1xAVUGd2ViY2FtiXMu	2013-06-16 18:21:15.918857+00
j9l4k07hywo8xs4uof9mocmbmfz72qq7	NzZiOThiMzk2OWM2NWI3MGE3ZDg1OWY4MTc2YmUwMTM1ZTgyMjYyYzqAAn1xAVUGd2ViY2FtcQKJcy4=	2013-06-15 18:28:19.745915+00
gsufobe79mwk5t3cv7htini1ucgq6y18	ZDJlZWU1MDY2OTViNGJlNWMzZDY5NzQzMmNlMGQyNGY1YjE4YzQ2ZjqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQRLAXUu	2013-06-09 17:56:12.396424+00
3w3fy31htkowp189ib3zmzbjss1h0cqa	NzZiOThiMzk2OWM2NWI3MGE3ZDg1OWY4MTc2YmUwMTM1ZTgyMjYyYzqAAn1xAVUGd2ViY2FtcQKJcy4=	2013-06-15 18:31:03.147488+00
in9a4sig03ar3kfbg89djx47eq621mls	Y2U1YmRiZmY3OWNkOGQ0NjY5NWZjYjk4NWFlMWNiNWM3MDgwMTdlMzqAAn1xAShVBndlYmNhbYlVEl9hdXRoX3VzZXJfYmFja2VuZFUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmRVDV9hdXRoX3VzZXJfaWRLAXUu	2013-06-14 20:32:15.961421+00
sbr5e8m5dusog9vbpn15yrgfus80q0fw	MGRkOTM0M2FmNDA1NmFlZmM5ZWU0NTBmMmEyYzgxN2EwODFkZGY0OTqAAn1xAS4=	2013-06-15 19:40:07.874942+00
cdxjzj1w739xwpflut6z5icz11h075ps	ZjBmMGViZjFhMGUyZTIyYmMzZTdkNWQ1MmI1NTk3MzQ0YmMwY2ZmNTqAAn1xAShVBndlYmNhbYlVDWxhdGVzdF9zZW5zb3JjZGphbmdvLmRiLm1vZGVscy5xdWVyeQpRdWVyeVNldApxAimBcQN9cQQoVQVfaXRlcnEFTlUZX3ByZWZldGNoX3JlbGF0ZWRfbG9va3Vwc3EGXXEHVQ5fc3RpY2t5X2ZpbHRlcnEIiVUDX2RicQlOVQ1fcmVzdWx0X2NhY2hlcQpdcQtjY29weV9yZWcKX3JlY29uc3RydWN0b3IKcQxjaG9tZS5tb2RlbHMKU2Vuc29yCnENY19fYnVpbHRpbl9fCm9iamVjdApxDk6HUnEPfXEQKFUMX2JyYW5kX2NhY2hlcRFoDGNob21lLm1vZGVscwpCcmFuZApxEmgOTodScRN9cRQoVQhsb2dvX3VybHEVWGoAAABodHRwczovL2VuY3J5cHRlZC10Ym4yLmdzdGF0aWMuY29tL2ltYWdlcz9xPXRibjpBTmQ5R2NUSE5vOGp0TGxwSzBXenJtejZhSHQ3MlAwa0dRTmJsRFFLa1NSa2dIa3hBV2UxNUJseWlnVQZfc3RhdGVxFmNkamFuZ28uZGIubW9kZWxzLmJhc2UKTW9kZWxTdGF0ZQpxFymBcRh9cRkoVQZhZGRpbmdxGolVAmRicRtVB2RlZmF1bHRxHHViVQJpZHEdSwJVBG5hbWVxHlgMAAAATmluamEgQmxvY2tzdWJVBGNvZGVxH1gCAAAAMDJVBGxlYWRxIFgUAAAATWVhc3VyZXMgdGVtcGVyYXR1cmVVBXByaWNlcSFOVQtwaWN0dXJlX3VybHEiWCwAAABodHRwOi8vd3d3LmJyZXNpbmsuZGUvSW1hZ2VzL1RlbXBNb25pdG9yLnBuZ2gWaBcpgXEjfXEkKGgaiWgbaBx1YlUGbnVtYmVycSVLAlUFbGFiZWxxJlgSAAAAVGVtcGVyYXR1cmUgc2Vuc29yVQhicmFuZF9pZHEnSwJVDXRlY2hub2xvZ3lfaWRxKEsHVRFfdGVjaG5vbG9neV9jYWNoZXEpaAxjaG9tZS5tb2RlbHMKVGVjaG5vbG9neQpxKmgOTodScSt9cSwoaBVYSAAAAGh0dHA6Ly9zdGF0aWMuaW9zcGlyaXQuY29tL3N0YXRpYy9vYmplY3RmaWxlcy9pbWFnZS84NjkvSGFyZHdhcmVXTEFOLnBuZ2gWaBcpgXEtfXEuKGgaiWgbaBx1YmgdSwdoHlgJAAAANDMzLjUgTUh6dWJVBGRhdGVxL2NkYXRldGltZQpkYXRlCnEwVQQH3QUbhVJxMVUJaW5zdGFsbGVkcTKIaB1LAnViYVUOX3ByZWZldGNoX2RvbmVxM4lVCl9mb3Jfd3JpdGVxNIlVBXF1ZXJ5cTVjZGphbmdvLmRiLm1vZGVscy5zcWwucXVlcnkKUXVlcnkKcTYpgXE3fXE4KFUVYWdncmVnYXRlX3NlbGVjdF9tYXNrcTlOVRdfYWdncmVnYXRlX3NlbGVjdF9jYWNoZXE6TlUFZXh0cmFxO2NkamFuZ28udXRpbHMuZGF0YXN0cnVjdHVyZXMKU29ydGVkRGljdApxPCmBcT19cT5VCGtleU9yZGVycT9dc2JVCGpvaW5fbWFwcUB9cUEoTlgLAAAAaG9tZV9zZW5zb3JxQk5OdGhChXNVFXJlbGF0ZWRfc2VsZWN0X2ZpZWxkc3FDXVUMZXh0cmFfdGFibGVzcUQpVQZzZWxlY3RxRV1xRlUGdGFibGVzcUddcUhoQmFVDHVzZWRfYWxpYXNlc3FJY19fYnVpbHRpbl9fCnNldApxSl1xS2hCYYVScUxVCG9yZGVyX2J5cU1dcU5VCGRpc3RpbmN0cU+JVQ5kdXBlX2F2b2lkYW5jZXFQfXFRVRBkZWZhdWx0X29yZGVyaW5ncVKIVQhncm91cF9ieXFTTlURc2VsZWN0X2Zvcl91cGRhdGVxVIlVDnNlbGVjdF9yZWxhdGVkcVWJVRBkZWZlcnJlZF9sb2FkaW5ncVZoSl2FUnFXiIZxWFUNc2VsZWN0X2ZpZWxkc3FZXVUJYWxpYXNfbWFwcVp9cVtoQmNkamFuZ28uZGIubW9kZWxzLnNxbC5jb25zdGFudHMKSm9pbkluZm8KcVwoaEJoQk5OTk6JdIFxXXNVCW1heF9kZXB0aHFeSwVVEXN0YW5kYXJkX29yZGVyaW5ncV+IVQ5leHRyYV9vcmRlcl9ieXFgKVUPZGlzdGluY3RfZmllbGRzcWFdcWJVCmFnZ3JlZ2F0ZXNxY2g8KYFxZH1xZWg/XXNiVRlfbG9hZGVkX2ZpZWxkX25hbWVzX2NhY2hlcWZ9cWdVEWV4dHJhX3NlbGVjdF9tYXNrcWhOVRhzZWxlY3RfZm9yX3VwZGF0ZV9ub3dhaXRxaYlVE19leHRyYV9zZWxlY3RfY2FjaGVxak5VCGxvd19tYXJrcWtLAFUOYWxpYXNfcmVmY291bnRxbH1xbWhCSwFzVRNyZWxhdGVkX3NlbGVjdF9jb2xzcW5dVQxkZWZhdWx0X2NvbHNxb4hVEG9yZGVyaW5nX2FsaWFzZXNxcF1xcVUJaGlnaF9tYXJrcXJOVRlpbmNsdWRlZF9pbmhlcml0ZWRfbW9kZWxzcXN9cXROaEJzVQl0YWJsZV9tYXBxdX1xdmhCXXF3aEJhc1ULd2hlcmVfY2xhc3NxeGNkamFuZ28uZGIubW9kZWxzLnNxbC53aGVyZQpXaGVyZU5vZGUKcXlVBW1vZGVscXpoDVUFd2hlcmVxe2h5KYFxfH1xfShVCWNvbm5lY3RvcnF+VQNBTkRxf1UHbmVnYXRlZHGAiVUIY2hpbGRyZW5xgV1xgmh5KYFxg31xhChofmh/aICJaIFdcYUoY2RqYW5nby5kYi5tb2RlbHMuc3FsLndoZXJlCkNvbnN0cmFpbnQKcYYpgXGHfXGIKFUFYWxpYXNxiWhCaHpoDVUKZmllbGRfbmFtZXGKaB9VA2NvbHGLaB91YlUFZXhhY3RxjIhYAgAAADAycY10cY5hVQ9zdWJ0cmVlX3BhcmVudHNxj111YmFoj111YlUGaGF2aW5ncZBoeSmBcZF9cZIoaH5of2iAiWiBXWiPXXViVRBmaWx0ZXJfaXNfc3RpY2t5cZOJdWJoemgNVRZfa25vd25fcmVsYXRlZF9vYmplY3RzcZR9cZV1YnUu	2013-06-15 20:49:44.669383+00
ywbpto18bjfgvmloiinzw1cuugfm596f	MGQyOGU4NDcxYzIxOTQ0OGNiZGU4ZTZhMjdjZTlmODQxZDRkYjM2MDqAAn1xAShVBndlYmNhbYlVDWxhdGVzdF9zZW5zb3JjZGphbmdvLmRiLm1vZGVscy5xdWVyeQpRdWVyeVNldApxAimBcQN9cQQoVQVfaXRlcnEFTlUZX3ByZWZldGNoX3JlbGF0ZWRfbG9va3Vwc3EGXXEHVQ5fc3RpY2t5X2ZpbHRlcnEIiVUDX2RicQlOVQ1fcmVzdWx0X2NhY2hlcQpdcQtjY29weV9yZWcKX3JlY29uc3RydWN0b3IKcQxjaG9tZS5tb2RlbHMKU2Vuc29yCnENY19fYnVpbHRpbl9fCm9iamVjdApxDk6HUnEPfXEQKFUMX2JyYW5kX2NhY2hlcRFoDGNob21lLm1vZGVscwpCcmFuZApxEmgOTodScRN9cRQoVQhsb2dvX3VybHEVWGoAAABodHRwczovL2VuY3J5cHRlZC10Ym4xLmdzdGF0aWMuY29tL2ltYWdlcz9xPXRibjpBTmQ5R2NRRTFpSlpLdllzM0FhR0pGdjM3Sk5PMnRUaDNZcVljckMzNlFGdzQ1dml1dU96OFdiSFRBVQZfc3RhdGVxFmNkamFuZ28uZGIubW9kZWxzLmJhc2UKTW9kZWxTdGF0ZQpxFymBcRh9cRkoVQZhZGRpbmdxGolVAmRicRtVB2RlZmF1bHRxHHViVQJpZHEdSwNVBG5hbWVxHlgGAAAARC1MaW5rdWJVBGNvZGVxH1gCAAAAMDFVBGxlYWRxIFgPAAAAU2VjdXJpdHkgQ2FtZXJhVQVwcmljZXEhY2RlY2ltYWwKRGVjaW1hbApxIlUGMTE0Ljk1hVJxI1ULcGljdHVyZV91cmxxJFhIAAAAaHR0cDovL2NkbjQuaWNvbmZpbmRlci5jb20vZGF0YS9pY29ucy9yZWZyZXNoX2NsLzEyOC9IYXJkd2FyZS9XZWJjYW0ucG5naBZoFymBcSV9cSYoaBqJaBtoHHViVQZudW1iZXJxJ0sBVQVsYWJlbHEoWAYAAABXZWJjYW1VCGJyYW5kX2lkcSlLA1UNdGVjaG5vbG9neV9pZHEqSwRVEV90ZWNobm9sb2d5X2NhY2hlcStoDGNob21lLm1vZGVscwpUZWNobm9sb2d5CnEsaA5Oh1JxLX1xLihoFVjIAAAAaHR0cDovL3d3dy5nb29nbGUuZmkvdXJsP3NhPWkmcmN0PWomcT0mZXNyYz1zJnNvdXJjZT1pbWFnZXMmY2Q9JmNhZD1yamEmZG9jaWQ9STAzTnROZDUyTURnUU0mdGJuaWQ9amdNZTZuMFRXbzIyZE06JnZlZD0wQ0FVUWpSdyZ1cmw9aHR0cCUzQSUyRiUyRnd3dy5lYXN5aWNvbi5uZXQlMkZsYW5ndWFnZS5lbiUyRmljb25zZWFyY2glMkZ3aWZpJTJGJmVoFmgXKYFxL31xMChoGoloG2gcdWJoHUsEaB5YBAAAAFdsYW51YlUEZGF0ZXExY2RhdGV0aW1lCmRhdGUKcTJVBAfdBRuFUnEzVQlpbnN0YWxsZWRxNIhoHUsBdWJhVQ5fcHJlZmV0Y2hfZG9uZXE1iVUKX2Zvcl93cml0ZXE2iVUFcXVlcnlxN2NkamFuZ28uZGIubW9kZWxzLnNxbC5xdWVyeQpRdWVyeQpxOCmBcTl9cTooVRVhZ2dyZWdhdGVfc2VsZWN0X21hc2txO05VF19hZ2dyZWdhdGVfc2VsZWN0X2NhY2hlcTxOVQVleHRyYXE9Y2RqYW5nby51dGlscy5kYXRhc3RydWN0dXJlcwpTb3J0ZWREaWN0CnE+KYFxP31xQFUIa2V5T3JkZXJxQV1zYlUIam9pbl9tYXBxQn1xQyhOWAsAAABob21lX3NlbnNvcnFETk50aESFc1UVcmVsYXRlZF9zZWxlY3RfZmllbGRzcUVdVQxleHRyYV90YWJsZXNxRilVBnNlbGVjdHFHXXFIVQZ0YWJsZXNxSV1xSmhEYVUMdXNlZF9hbGlhc2VzcUtjX19idWlsdGluX18Kc2V0CnFMXXFNaERhhVJxTlUIb3JkZXJfYnlxT11xUFUIZGlzdGluY3RxUYlVDmR1cGVfYXZvaWRhbmNlcVJ9cVNVEGRlZmF1bHRfb3JkZXJpbmdxVIhVCGdyb3VwX2J5cVVOVRFzZWxlY3RfZm9yX3VwZGF0ZXFWiVUOc2VsZWN0X3JlbGF0ZWRxV4lVEGRlZmVycmVkX2xvYWRpbmdxWGhMXYVScVmIhnFaVQ1zZWxlY3RfZmllbGRzcVtdVQlhbGlhc19tYXBxXH1xXWhEY2RqYW5nby5kYi5tb2RlbHMuc3FsLmNvbnN0YW50cwpKb2luSW5mbwpxXihoRGhETk5OTol0gXFfc1UJbWF4X2RlcHRocWBLBVURc3RhbmRhcmRfb3JkZXJpbmdxYYhVDmV4dHJhX29yZGVyX2J5cWIpVQ9kaXN0aW5jdF9maWVsZHNxY11xZFUKYWdncmVnYXRlc3FlaD4pgXFmfXFnaEFdc2JVGV9sb2FkZWRfZmllbGRfbmFtZXNfY2FjaGVxaH1xaVURZXh0cmFfc2VsZWN0X21hc2txak5VGHNlbGVjdF9mb3JfdXBkYXRlX25vd2FpdHFriVUTX2V4dHJhX3NlbGVjdF9jYWNoZXFsTlUIbG93X21hcmtxbUsAVQ5hbGlhc19yZWZjb3VudHFufXFvaERLAXNVE3JlbGF0ZWRfc2VsZWN0X2NvbHNxcF1VDGRlZmF1bHRfY29sc3FxiFUQb3JkZXJpbmdfYWxpYXNlc3FyXXFzVQloaWdoX21hcmtxdE5VGWluY2x1ZGVkX2luaGVyaXRlZF9tb2RlbHNxdX1xdk5oRHNVCXRhYmxlX21hcHF3fXF4aERdcXloRGFzVQt3aGVyZV9jbGFzc3F6Y2RqYW5nby5kYi5tb2RlbHMuc3FsLndoZXJlCldoZXJlTm9kZQpxe1UFbW9kZWxxfGgNVQV3aGVyZXF9aHspgXF+fXF/KFUJY29ubmVjdG9ycYBVA0FORHGBVQduZWdhdGVkcYKJVQhjaGlsZHJlbnGDXXGEaHspgXGFfXGGKGiAaIFogolog11xhyhjZGphbmdvLmRiLm1vZGVscy5zcWwud2hlcmUKQ29uc3RyYWludApxiCmBcYl9cYooVQVhbGlhc3GLaERofGgNVQpmaWVsZF9uYW1lcYxoH1UDY29scY1oH3ViVQVleGFjdHGOiFgCAAAAMDFxj3RxkGFVD3N1YnRyZWVfcGFyZW50c3GRXXViYWiRXXViVQZoYXZpbmdxkmh7KYFxk31xlChogGiBaIKJaINdaJFddWJVEGZpbHRlcl9pc19zdGlja3lxlYl1Ymh8aA1VFl9rbm93bl9yZWxhdGVkX29iamVjdHNxln1xl3VidS4=	2013-06-15 22:50:11.066815+00
59w5wqp2wnbgrgstsnlf14n2svjnzkoc	MDUwZmQ0ZDhkYjY3ZDU0MWFjOGJlYWYyMTk3NDkwOGIwM2I1MGFmNzqAAn1xAVUGd2ViY2FtiXMu	2013-06-11 14:46:47.26773+00
0w64y1yhtj65zv11zjbk3usis14k677p	YjY3MTQ3YjlhZjIxZDFjOGY1ZTA4MDEyZWIyNjdkNzJkNzE1OGZlMTqAAn1xAVUGd2ViY2FtiHMu	2013-06-11 14:47:03.884064+00
xxjn4rrtas30vrzhs68pg8xpvjyp1vka	MGRkOTM0M2FmNDA1NmFlZmM5ZWU0NTBmMmEyYzgxN2EwODFkZGY0OTqAAn1xAS4=	2013-06-16 01:42:41.624606+00
1f13l43j19ftl18h6unrdqsixigx7krj	Mjg0NDhhYTA3OTQ1ZjZiZjc3YWRmN2JhMDAzODdjZDBmMmZiNzkyYTqAAn1xAShVBndlYmNhbYlVDWxhdGVzdF9zZW5zb3JjZGphbmdvLmRiLm1vZGVscy5xdWVyeQpRdWVyeVNldApxAimBcQN9cQQoVQVfaXRlcnEFTlUWX2tub3duX3JlbGF0ZWRfb2JqZWN0c3EGfXEHVQ5fc3RpY2t5X2ZpbHRlcnEIiVUDX2RicQlOVQ1fcmVzdWx0X2NhY2hlcQpdcQtjY29weV9yZWcKX3JlY29uc3RydWN0b3IKcQxjaG9tZS5tb2RlbHMKU2Vuc29yCnENY19fYnVpbHRpbl9fCm9iamVjdApxDk6HUnEPfXEQKFUMX2JyYW5kX2NhY2hlcRFoDGNob21lLm1vZGVscwpCcmFuZApxEmgOTodScRN9cRQoVQhsb2dvX3VybHEVWMgAAABodHRwOi8vd3d3Lmdvb2dsZS5maS91cmw/c2E9aSZyY3Q9aiZxPSZlc3JjPXMmc291cmNlPWltYWdlcyZjZD0mY2FkPXJqYSZkb2NpZD1EYi1WVDNjOXk2OGxZTSZ0Ym5pZD1HRTQ1SE1DaXFGOUlyTTomdmVkPTBDQVVRalJ3JnVybD1odHRwJTNBJTJGJTJGd3d3LmNvbXB1dGV4LmZpJTJGY2F0YWxvZyUyRmluZGV4LnBocCUzRm1hbnVmYWN0dXJlcnNfaVUGX3N0YXRlcRZjZGphbmdvLmRiLm1vZGVscy5iYXNlCk1vZGVsU3RhdGUKcRcpgXEYfXEZKFUGYWRkaW5ncRqJVQJkYnEbVQdkZWZhdWx0cRx1YlUCaWRxHUsEVQRuYW1lcR5YBAAAAE5leGF1YlUEY29kZXEfWAIAAAAwNlUEbGVhZHEgWBQAAABCYXNpYyBwb3dlciBzd2l0Y2hlclUFcHJpY2VxIU5VC3BpY3R1cmVfdXJscSJYTQAAAGh0dHA6Ly9jZG4xLmljb25maW5kZXIuY29tL2RhdGEvaWNvbnMvWC1NYWMvbXVsdGltZWRpYS9wbmcvMTI4L3N3aXRjaF9vZmYucG5naBZoFymBcSN9cSQoaBqJaBtoHHViVQZudW1iZXJxJUsGVQVsYWJlbHEmWAgAAABTd2l0Y2hlclUIYnJhbmRfaWRxJ0sEVQ10ZWNobm9sb2d5X2lkcShLBlURX3RlY2hub2xvZ3lfY2FjaGVxKWgMY2hvbWUubW9kZWxzClRlY2hub2xvZ3kKcSpoDk6HUnErfXEsKGgVWMgAAABodHRwOi8vd3d3Lmdvb2dsZS5maS91cmw/c2E9aSZyY3Q9aiZxPSZlc3JjPXMmc291cmNlPWltYWdlcyZjZD0mY2FkPXJqYSZkb2NpZD1uR3pnNmMtSzFmNW44TSZ0Ym5pZD1tRlo3RjFPYURSYTh6TTomdmVkPTBDQVVRalJ3JnVybD1odHRwJTNBJTJGJTJGd3d3Lmljb25zaG9jay5jb20lMkZpY29uLXNldHMlMkZ4bWFjLW11bHRpbWVkaWEtaWNvbnMuaGgWaBcpgXEtfXEuKGgaiWgbaBx1YmgdSwZoHlgHAAAANDMzIE1IenViVQRkYXRlcS9jZGF0ZXRpbWUKZGF0ZQpxMFUEB90FHYVScTFVCWluc3RhbGxlZHEyiGgdSwZ1YmFVDl9wcmVmZXRjaF9kb25lcTOJVQpfZm9yX3dyaXRlcTSJVQVxdWVyeXE1Y2RqYW5nby5kYi5tb2RlbHMuc3FsLnF1ZXJ5ClF1ZXJ5CnE2KYFxN31xOChVFWFnZ3JlZ2F0ZV9zZWxlY3RfbWFza3E5TlUXX2FnZ3JlZ2F0ZV9zZWxlY3RfY2FjaGVxOk5VBWV4dHJhcTtjZGphbmdvLnV0aWxzLmRhdGFzdHJ1Y3R1cmVzClNvcnRlZERpY3QKcTwpgXE9fXE+VQhrZXlPcmRlcnE/XXNiVQhqb2luX21hcHFAfXFBKE5YCwAAAGhvbWVfc2Vuc29ycUJOTnRoQoVzVRVyZWxhdGVkX3NlbGVjdF9maWVsZHNxQ11VDGV4dHJhX3RhYmxlc3FEKVUJYWxpYXNfbWFwcUV9cUZoQmNkamFuZ28uZGIubW9kZWxzLnNxbC5jb25zdGFudHMKSm9pbkluZm8KcUcoaEJoQk5OTk6JdIFxSHNVBnRhYmxlc3FJXXFKaEJhVQx1c2VkX2FsaWFzZXNxS2NfX2J1aWx0aW5fXwpzZXQKcUxdcU1oQmGFUnFOVQhvcmRlcl9ieXFPXXFQVQhkaXN0aW5jdHFRiVUOZHVwZV9hdm9pZGFuY2VxUn1xU1UJdGFibGVfbWFwcVR9cVVoQl1xVmhCYXNVCGdyb3VwX2J5cVdOVRFzZWxlY3RfZm9yX3VwZGF0ZXFYiVUOc2VsZWN0X3JlbGF0ZWRxWYlVEGRlZmVycmVkX2xvYWRpbmdxWmhMXYVScVuIhnFcVQ1zZWxlY3RfZmllbGRzcV1dVRNfZXh0cmFfc2VsZWN0X2NhY2hlcV5OVQltYXhfZGVwdGhxX0sFVQZzZWxlY3RxYF1xYVUOZXh0cmFfb3JkZXJfYnlxYilVD2Rpc3RpbmN0X2ZpZWxkc3FjXXFkVQphZ2dyZWdhdGVzcWVoPCmBcWZ9cWdoP11zYlUZX2xvYWRlZF9maWVsZF9uYW1lc19jYWNoZXFofXFpVRFleHRyYV9zZWxlY3RfbWFza3FqTlUYc2VsZWN0X2Zvcl91cGRhdGVfbm93YWl0cWuJVQhsb3dfbWFya3FsSwBVDmFsaWFzX3JlZmNvdW50cW19cW5oQksBc1UTcmVsYXRlZF9zZWxlY3RfY29sc3FvXVUMZGVmYXVsdF9jb2xzcXCIVRBvcmRlcmluZ19hbGlhc2VzcXFdcXJVBmhhdmluZ3FzY2RqYW5nby5kYi5tb2RlbHMuc3FsLndoZXJlCldoZXJlTm9kZQpxdCmBcXV9cXYoVQljb25uZWN0b3Jxd1UDQU5EcXhVB25lZ2F0ZWRxeYlVCGNoaWxkcmVucXpdVQ9zdWJ0cmVlX3BhcmVudHNxe111YlUZaW5jbHVkZWRfaW5oZXJpdGVkX21vZGVsc3F8fXF9TmhCc1UQZGVmYXVsdF9vcmRlcmluZ3F+iFULd2hlcmVfY2xhc3Nxf2h0VQVtb2RlbHGAaA1VEXN0YW5kYXJkX29yZGVyaW5ncYGIVQV3aGVyZXGCaHQpgXGDfXGEKGh3aHhoeYloel1xhWh0KYFxhn1xhyhod2h4aHmJaHpdcYgoY2RqYW5nby5kYi5tb2RlbHMuc3FsLndoZXJlCkNvbnN0cmFpbnQKcYkpgXGKfXGLKFUFYWxpYXNxjGhCVQVtb2RlbHGNaA1VCmZpZWxkX25hbWVxjmgfVQNjb2xxj1UEY29kZXGQdWJVBWV4YWN0iFgCAAAAMDZ0cZFhaHtddWJhaHtddWJVCWhpZ2hfbWFya3GSTlUQZmlsdGVyX2lzX3N0aWNreXGTiXViaI1oDVUZX3ByZWZldGNoX3JlbGF0ZWRfbG9va3Vwc3GUXXGVdWJYCgAAAHRlc3Rjb29raWVYBgAAAHdvcmtlZFUEdXNlclgFAAAATWF0dGlxlnUu	2013-06-14 22:02:15.713204+00
j5yud4hy5yud58s2z05kxie2grc599s4	YzVmMWIwNzg2N2IxOWViMjE2MDBkNGY5YThmNzIxZDI1MDVlNjZmYTqAAn1xAShVBndlYmNhbYlVDWxhdGVzdF9zZW5zb3JjZGphbmdvLmRiLm1vZGVscy5xdWVyeQpRdWVyeVNldApxAimBcQN9cQQoVQVfaXRlcnEFTlUZX3ByZWZldGNoX3JlbGF0ZWRfbG9va3Vwc3EGXXEHVQ5fc3RpY2t5X2ZpbHRlcnEIiVUDX2RicQlOVQ1fcmVzdWx0X2NhY2hlcQpdcQtjY29weV9yZWcKX3JlY29uc3RydWN0b3IKcQxjaG9tZS5tb2RlbHMKU2Vuc29yCnENY19fYnVpbHRpbl9fCm9iamVjdApxDk6HUnEPfXEQKFUMX2JyYW5kX2NhY2hlcRFoDGNob21lLm1vZGVscwpCcmFuZApxEmgOTodScRN9cRQoVQhsb2dvX3VybHEVWD0AAABodHRwOi8vc3RvcmUuaG9tZXNlZXIuY29tL3N0b3JlL0Fzc2V0cy9ldmVyc3ByaW5nLWxvZ28tNzUuZ2lmVQZfc3RhdGVxFmNkamFuZ28uZGIubW9kZWxzLmJhc2UKTW9kZWxTdGF0ZQpxFymBcRh9cRkoVQZhZGRpbmdxGolVAmRicRtVB2RlZmF1bHRxHHViVQJpZHEdSwFVBG5hbWVxHlgKAAAARXZlcnNwcmluZ3ViVQRjb2RlcR9YAgAAADA1VQRsZWFkcSBYFgAAAFJlY29nbml6ZXMgd2F0ZXIgbGVha3NVBXByaWNlcSFOVQtwaWN0dXJlX3VybHEiWDQAAABodHRwOi8vd3d3LnVsdHJhc29uaWMtZmxvdy5jb20vaW1nL3AvMzAtMTAwLWhvbWUuanBnaBZoFymBcSN9cSQoaBqJaBtoHHViVQZudW1iZXJxJUsFVQVsYWJlbHEmWA4AAABXYXRlciBkZXRlY3RvclUIYnJhbmRfaWRxJ0sBVQ10ZWNobm9sb2d5X2lkcShLBVURX3RlY2hub2xvZ3lfY2FjaGVxKWgMY2hvbWUubW9kZWxzClRlY2hub2xvZ3kKcSpoDk6HUnErfXEsKGgVWGoAAABodHRwczovL2VuY3J5cHRlZC10Ym4zLmdzdGF0aWMuY29tL2ltYWdlcz9xPXRibjpBTmQ5R2NUakxWM2VFSWhDNkFkN1N1aVJjNmtUZW9BZ2g3MHg5bFlnVlZMRllXVGNSbmJSTDlsZml3aBZoFymBcS19cS4oaBqJaBtoHHViaB1LBWgeWAYAAABaLVdhdmV1YlUEZGF0ZXEvY2RhdGV0aW1lCmRhdGUKcTBVBAfdBRuFUnExVQlpbnN0YWxsZWRxMohoHUsFdWJhVQ5fcHJlZmV0Y2hfZG9uZXEziVUKX2Zvcl93cml0ZXE0iVUFcXVlcnlxNWNkamFuZ28uZGIubW9kZWxzLnNxbC5xdWVyeQpRdWVyeQpxNimBcTd9cTgoVRVhZ2dyZWdhdGVfc2VsZWN0X21hc2txOU5VF19hZ2dyZWdhdGVfc2VsZWN0X2NhY2hlcTpOVQVleHRyYXE7Y2RqYW5nby51dGlscy5kYXRhc3RydWN0dXJlcwpTb3J0ZWREaWN0CnE8KYFxPX1xPlUIa2V5T3JkZXJxP11zYlUIam9pbl9tYXBxQH1xQShOWAsAAABob21lX3NlbnNvcnFCTk50aEKFc1UVcmVsYXRlZF9zZWxlY3RfZmllbGRzcUNdVQxleHRyYV90YWJsZXNxRClVBnNlbGVjdHFFXXFGVQZ0YWJsZXNxR11xSGhCYVUMdXNlZF9hbGlhc2VzcUljX19idWlsdGluX18Kc2V0CnFKXXFLaEJhhVJxTFUIb3JkZXJfYnlxTV1xTlUIZGlzdGluY3RxT4lVDmR1cGVfYXZvaWRhbmNlcVB9cVFVEGRlZmF1bHRfb3JkZXJpbmdxUohVCGdyb3VwX2J5cVNOVRFzZWxlY3RfZm9yX3VwZGF0ZXFUiVUOc2VsZWN0X3JlbGF0ZWRxVYlVEGRlZmVycmVkX2xvYWRpbmdxVmhKXYVScVeIhnFYVQ1zZWxlY3RfZmllbGRzcVldVQlhbGlhc19tYXBxWn1xW2hCY2RqYW5nby5kYi5tb2RlbHMuc3FsLmNvbnN0YW50cwpKb2luSW5mbwpxXChoQmhCTk5OTol0gXFdc1UJbWF4X2RlcHRocV5LBVURc3RhbmRhcmRfb3JkZXJpbmdxX4hVDmV4dHJhX29yZGVyX2J5cWApVQ9kaXN0aW5jdF9maWVsZHNxYV1xYlUKYWdncmVnYXRlc3FjaDwpgXFkfXFlaD9dc2JVGV9sb2FkZWRfZmllbGRfbmFtZXNfY2FjaGVxZn1xZ1URZXh0cmFfc2VsZWN0X21hc2txaE5VGHNlbGVjdF9mb3JfdXBkYXRlX25vd2FpdHFpiVUTX2V4dHJhX3NlbGVjdF9jYWNoZXFqTlUIbG93X21hcmtxa0sAVQ5hbGlhc19yZWZjb3VudHFsfXFtaEJLAXNVE3JlbGF0ZWRfc2VsZWN0X2NvbHNxbl1VDGRlZmF1bHRfY29sc3FviFUQb3JkZXJpbmdfYWxpYXNlc3FwXXFxVQloaWdoX21hcmtxck5VGWluY2x1ZGVkX2luaGVyaXRlZF9tb2RlbHNxc31xdE5oQnNVCXRhYmxlX21hcHF1fXF2aEJdcXdoQmFzVQt3aGVyZV9jbGFzc3F4Y2RqYW5nby5kYi5tb2RlbHMuc3FsLndoZXJlCldoZXJlTm9kZQpxeVUFbW9kZWxxemgNVQV3aGVyZXF7aHkpgXF8fXF9KFUJY29ubmVjdG9ycX5VA0FORHF/VQduZWdhdGVkcYCJVQhjaGlsZHJlbnGBXXGCaHkpgXGDfXGEKGh+aH9ogIlogV1xhShjZGphbmdvLmRiLm1vZGVscy5zcWwud2hlcmUKQ29uc3RyYWludApxhimBcYd9cYgoVQVhbGlhc3GJaEJoemgNVQpmaWVsZF9uYW1lcYpoH1UDY29scYtoH3ViVQVleGFjdHGMiFgCAAAAMDVxjXRxjmFVD3N1YnRyZWVfcGFyZW50c3GPXXViYWiPXXViVQZoYXZpbmdxkGh5KYFxkX1xkihofmh/aICJaIFdaI9ddWJVEGZpbHRlcl9pc19zdGlja3lxk4l1Ymh6aA1VFl9rbm93bl9yZWxhdGVkX29iamVjdHNxlH1xlXVidS4=	2013-06-16 08:41:54.187309+00
lonagqkrwaxuxd74vzgn09ux42vl8ldv	NzZiOThiMzk2OWM2NWI3MGE3ZDg1OWY4MTc2YmUwMTM1ZTgyMjYyYzqAAn1xAVUGd2ViY2FtcQKJcy4=	2013-06-12 16:53:07.863393+00
3na6curu6uf1jm2j2pqsdtqbogxpj4s5	NzZiOThiMzk2OWM2NWI3MGE3ZDg1OWY4MTc2YmUwMTM1ZTgyMjYyYzqAAn1xAVUGd2ViY2FtcQKJcy4=	2013-06-16 10:49:55.205834+00
b05x4aa56w0ji0nylmaoo9jn0qj3cjcw	MDUwZmQ0ZDhkYjY3ZDU0MWFjOGJlYWYyMTk3NDkwOGIwM2I1MGFmNzqAAn1xAVUGd2ViY2FtiXMu	2013-06-14 22:07:38.010298+00
kl3az7j7bb9lyktyrt8miknrdgevcvy6	NzZiOThiMzk2OWM2NWI3MGE3ZDg1OWY4MTc2YmUwMTM1ZTgyMjYyYzqAAn1xAVUGd2ViY2FtcQKJcy4=	2013-06-16 11:43:22.449+00
67zydjme5v3t84ja4tohnldifp4lvldi	MDUwZmQ0ZDhkYjY3ZDU0MWFjOGJlYWYyMTk3NDkwOGIwM2I1MGFmNzqAAn1xAVUGd2ViY2FtiXMu	2013-06-14 22:24:02.212118+00
l1sxlxe4191rdtrg3b7zs2qub9it5ea6	MDUwZmQ0ZDhkYjY3ZDU0MWFjOGJlYWYyMTk3NDkwOGIwM2I1MGFmNzqAAn1xAVUGd2ViY2FtiXMu	2013-06-15 01:41:15.769831+00
dwgt0kxzd91oy7rg5yieu1qa0avxbg7a	ZGUzNzkxNDc4ZGIzY2VkN2I3Y2FlYThkYTVmZjA1OWIxNDljY2EzODqAAn1xAShVBndlYmNhbYlVDV9hdXRoX3VzZXJfaWRLAVUNbGF0ZXN0X3NlbnNvcmNkamFuZ28uZGIubW9kZWxzLnF1ZXJ5ClF1ZXJ5U2V0CnECKYFxA31xBChVBV9pdGVycQVOVRZfa25vd25fcmVsYXRlZF9vYmplY3RzcQZ9cQdVDl9zdGlja3lfZmlsdGVycQiJVQNfZGJxCU5VDV9yZXN1bHRfY2FjaGVxCl1xC2Njb3B5X3JlZwpfcmVjb25zdHJ1Y3RvcgpxDGNob21lLm1vZGVscwpTZW5zb3IKcQ1jX19idWlsdGluX18Kb2JqZWN0CnEOTodScQ99cRAoVQxfYnJhbmRfY2FjaGVxEWgMY2hvbWUubW9kZWxzCkJyYW5kCnESaA5Oh1JxE31xFChVCGxvZ29fdXJscRVYagAAAGh0dHBzOi8vZW5jcnlwdGVkLXRibjEuZ3N0YXRpYy5jb20vaW1hZ2VzP3E9dGJuOkFOZDlHY1FFMWlKWkt2WXMzQWFHSkZ2MzdKTk8ydFRoM1lxWWNyQzM2UUZ3NDV2aXV1T3o4V2JIVEFVBl9zdGF0ZXEWY2RqYW5nby5kYi5tb2RlbHMuYmFzZQpNb2RlbFN0YXRlCnEXKYFxGH1xGShVBmFkZGluZ3EaiVUCZGJxG1UHZGVmYXVsdHEcdWJVAmlkcR1LA1UEbmFtZXEeWAYAAABELUxpbmt1YlUEY29kZXEfWAIAAAAwMVUEbGVhZHEgWA8AAABTZWN1cml0eSBDYW1lcmFVBXByaWNlcSFjZGVjaW1hbApEZWNpbWFsCnEiVQYxMTQuOTWFUnEjVQtwaWN0dXJlX3VybHEkWEgAAABodHRwOi8vY2RuNC5pY29uZmluZGVyLmNvbS9kYXRhL2ljb25zL3JlZnJlc2hfY2wvMTI4L0hhcmR3YXJlL1dlYmNhbS5wbmdoFmgXKYFxJX1xJihoGoloG2gcdWJVBm51bWJlcnEnSwFVBWxhYmVscShYBgAAAFdlYmNhbVUIYnJhbmRfaWRxKUsDVQ10ZWNobm9sb2d5X2lkcSpLBFURX3RlY2hub2xvZ3lfY2FjaGVxK2gMY2hvbWUubW9kZWxzClRlY2hub2xvZ3kKcSxoDk6HUnEtfXEuKGgVWMgAAABodHRwOi8vd3d3Lmdvb2dsZS5maS91cmw/c2E9aSZyY3Q9aiZxPSZlc3JjPXMmc291cmNlPWltYWdlcyZjZD0mY2FkPXJqYSZkb2NpZD1JMDNOdE5kNTJNRGdRTSZ0Ym5pZD1qZ01lNm4wVFdvMjJkTTomdmVkPTBDQVVRalJ3JnVybD1odHRwJTNBJTJGJTJGd3d3LmVhc3lpY29uLm5ldCUyRmxhbmd1YWdlLmVuJTJGaWNvbnNlYXJjaCUyRndpZmklMkYmZWgWaBcpgXEvfXEwKGgaiWgbaBx1YmgdSwRoHlgEAAAAV2xhbnViVQRkYXRlcTFjZGF0ZXRpbWUKZGF0ZQpxMlUEB90FG4VScTNVCWluc3RhbGxlZHE0iGgdSwF1YmFVDl9wcmVmZXRjaF9kb25lcTWJVQpfZm9yX3dyaXRlcTaJVQVxdWVyeXE3Y2RqYW5nby5kYi5tb2RlbHMuc3FsLnF1ZXJ5ClF1ZXJ5CnE4KYFxOX1xOihVFWFnZ3JlZ2F0ZV9zZWxlY3RfbWFza3E7TlUXX2FnZ3JlZ2F0ZV9zZWxlY3RfY2FjaGVxPE5VBWV4dHJhcT1jZGphbmdvLnV0aWxzLmRhdGFzdHJ1Y3R1cmVzClNvcnRlZERpY3QKcT4pgXE/fXFAVQhrZXlPcmRlcnFBXXNiVQhqb2luX21hcHFCfXFDKE5YCwAAAGhvbWVfc2Vuc29ycUROTnRoRIVzVRVyZWxhdGVkX3NlbGVjdF9maWVsZHNxRV1VDGV4dHJhX3RhYmxlc3FGKVUJYWxpYXNfbWFwcUd9cUhoRGNkamFuZ28uZGIubW9kZWxzLnNxbC5jb25zdGFudHMKSm9pbkluZm8KcUkoaERoRE5OTk6JdIFxSmNjb2xsZWN0aW9ucwpPcmRlcmVkRGljdApxS11xTChdcU0oVQp0YWJsZV9uYW1lcU5oRGVdcU8oVQlyaHNfYWxpYXNxUGhEZV1xUShVCWpvaW5fdHlwZXFSTmVdcVMoVQlsaHNfYWxpYXNxVE5lXXFVKFUMbGhzX2pvaW5fY29scVZOZV1xVyhVDHJoc19qb2luX2NvbHFYTmVdcVkoVQhudWxsYWJsZXFaiWVlhVJxW2JzVQZ0YWJsZXNxXF1xXWhEYVUMdXNlZF9hbGlhc2VzcV5jX19idWlsdGluX18Kc2V0CnFfXXFgaERhhVJxYVUIb3JkZXJfYnlxYl1xY1UIZGlzdGluY3RxZIlVDmR1cGVfYXZvaWRhbmNlcWV9cWZVCXRhYmxlX21hcHFnfXFoaERdcWloRGFzVQhncm91cF9ieXFqTlURc2VsZWN0X2Zvcl91cGRhdGVxa4lVDnNlbGVjdF9yZWxhdGVkcWyJVRBkZWZlcnJlZF9sb2FkaW5ncW1oX12FUnFuiIZxb1UNc2VsZWN0X2ZpZWxkc3FwXVUTX2V4dHJhX3NlbGVjdF9jYWNoZXFxTlUJbWF4X2RlcHRocXJLBVUGc2VsZWN0cXNdcXRVDmV4dHJhX29yZGVyX2J5cXUpVQ9kaXN0aW5jdF9maWVsZHNxdl1xd1UKYWdncmVnYXRlc3F4aD4pgXF5fXF6aEFdc2JVGV9sb2FkZWRfZmllbGRfbmFtZXNfY2FjaGVxe31xfFURZXh0cmFfc2VsZWN0X21hc2txfU5VGHNlbGVjdF9mb3JfdXBkYXRlX25vd2FpdHF+iVUIbG93X21hcmtxf0sAVQ5hbGlhc19yZWZjb3VudHGAfXGBaERLAXNVE3JlbGF0ZWRfc2VsZWN0X2NvbHNxgl1VDGRlZmF1bHRfY29sc3GDiFUQb3JkZXJpbmdfYWxpYXNlc3GEXXGFVQZoYXZpbmdxhmNkamFuZ28uZGIubW9kZWxzLnNxbC53aGVyZQpXaGVyZU5vZGUKcYcpgXGIfXGJKFUJY29ubmVjdG9ycYpVA0FORHGLVQduZWdhdGVkcYyJVQhjaGlsZHJlbnGNXVUPc3VidHJlZV9wYXJlbnRzcY5ddWJVGWluY2x1ZGVkX2luaGVyaXRlZF9tb2RlbHNxj31xkE5oRHNVEGRlZmF1bHRfb3JkZXJpbmdxkYhVC3doZXJlX2NsYXNzcZJoh1UFbW9kZWxxk2gNVRFzdGFuZGFyZF9vcmRlcmluZ3GUiFUFd2hlcmVxlWiHKYFxln1xlyhoimiLaIyJaI1dcZhohymBcZl9cZooaIpoi2iMiWiNXXGbKGNkamFuZ28uZGIubW9kZWxzLnNxbC53aGVyZQpDb25zdHJhaW50CnGcKYFxnX1xnihVBWFsaWFzcZ9oRFUFbW9kZWxxoGgNVQpmaWVsZF9uYW1lcaFoH1UDY29scaJVBGNvZGVxo3ViVQVleGFjdIhYAgAAADAxdHGkYWiOXXViYWiOXXViVQloaWdoX21hcmtxpU5VEGZpbHRlcl9pc19zdGlja3lxpol1YmigaA1VGV9wcmVmZXRjaF9yZWxhdGVkX2xvb2t1cHNxp11xqHViVQdtb2R1bGUziFUHbW9kdWxlMohVEl9hdXRoX3VzZXJfYmFja2VuZFUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmRVB21vZHVsZTGIdS4=	2013-06-16 12:33:15.553+00
7jr0nwjrbh3mf0zb562m4coausu4xyu5	MDUwZmQ0ZDhkYjY3ZDU0MWFjOGJlYWYyMTk3NDkwOGIwM2I1MGFmNzqAAn1xAVUGd2ViY2FtiXMu	2013-06-12 12:32:34.968346+00
wxrqbghykebh5m073mumeue54l5x7vbc	NzZiOThiMzk2OWM2NWI3MGE3ZDg1OWY4MTc2YmUwMTM1ZTgyMjYyYzqAAn1xAVUGd2ViY2FtcQKJcy4=	2013-06-12 00:40:48.342338+00
ychvyckuhkynhoadadlpz6coacz15z15	ZmNkM2VjYjdhYzlkOGNjMTU4N2U4MzRkYmI0N2YwYzNiMGZkNzIzZTqAAn1xAShVBndlYmNhbYlVDWxhdGVzdF9zZW5zb3JxAmNkamFuZ28uZGIubW9kZWxzLnF1ZXJ5ClF1ZXJ5U2V0CnEDKYFxBH1xBShVBV9pdGVycQZOVRlfcHJlZmV0Y2hfcmVsYXRlZF9sb29rdXBzcQddcQhVDl9zdGlja3lfZmlsdGVycQmJVQNfZGJxCk5VDV9yZXN1bHRfY2FjaGVxC11xDGNjb3B5X3JlZwpfcmVjb25zdHJ1Y3RvcgpxDWNob21lLm1vZGVscwpTZW5zb3IKcQ5jX19idWlsdGluX18Kb2JqZWN0CnEPTodScRB9cREoVQxfYnJhbmRfY2FjaGVoDWNob21lLm1vZGVscwpCcmFuZApxEmgPTodScRN9cRQoVQhsb2dvX3VybHEVWGoAAABodHRwczovL2VuY3J5cHRlZC10Ym4xLmdzdGF0aWMuY29tL2ltYWdlcz9xPXRibjpBTmQ5R2NRRTFpSlpLdllzM0FhR0pGdjM3Sk5PMnRUaDNZcVljckMzNlFGdzQ1dml1dU96OFdiSFRBVQZfc3RhdGVxFmNkamFuZ28uZGIubW9kZWxzLmJhc2UKTW9kZWxTdGF0ZQpxFymBcRh9cRkoVQZhZGRpbmdxGolVAmRicRtVB2RlZmF1bHRxHHViVQJpZHEdSwNVBG5hbWVxHlgGAAAARC1MaW5rdWJVBGNvZGVxH1gCAAAAMDFVBGxlYWRxIFgPAAAAU2VjdXJpdHkgQ2FtZXJhVQVwcmljZXEhY2RlY2ltYWwKRGVjaW1hbApxIlUGMTE0Ljk1hVJxI1ULcGljdHVyZV91cmxxJFhIAAAAaHR0cDovL2NkbjQuaWNvbmZpbmRlci5jb20vZGF0YS9pY29ucy9yZWZyZXNoX2NsLzEyOC9IYXJkd2FyZS9XZWJjYW0ucG5naBZoFymBcSV9cSYoaBqJaBtoHHViVQZudW1iZXJxJ0sBVQVsYWJlbHEoWAYAAABXZWJjYW1VCGJyYW5kX2lkcSlLA1UNdGVjaG5vbG9neV9pZHEqSwRVEV90ZWNobm9sb2d5X2NhY2hlcStoDWNob21lLm1vZGVscwpUZWNobm9sb2d5CnEsaA9Oh1JxLX1xLihoFVjIAAAAaHR0cDovL3d3dy5nb29nbGUuZmkvdXJsP3NhPWkmcmN0PWomcT0mZXNyYz1zJnNvdXJjZT1pbWFnZXMmY2Q9JmNhZD1yamEmZG9jaWQ9STAzTnROZDUyTURnUU0mdGJuaWQ9amdNZTZuMFRXbzIyZE06JnZlZD0wQ0FVUWpSdyZ1cmw9aHR0cCUzQSUyRiUyRnd3dy5lYXN5aWNvbi5uZXQlMkZsYW5ndWFnZS5lbiUyRmljb25zZWFyY2glMkZ3aWZpJTJGJmVoFmgXKYFxL31xMChoGoloG2gcdWJoHUsEaB5YBAAAAFdsYW51YlUEZGF0ZXExY2RhdGV0aW1lCmRhdGUKcTJVBAfdBRuFUnEzVQlpbnN0YWxsZWRxNIhoHUsBdWJhVQ5fcHJlZmV0Y2hfZG9uZXE1iVUKX2Zvcl93cml0ZXE2iVUFcXVlcnlxN2NkamFuZ28uZGIubW9kZWxzLnNxbC5xdWVyeQpRdWVyeQpxOCmBcTl9cTooVRVhZ2dyZWdhdGVfc2VsZWN0X21hc2txO05VF19hZ2dyZWdhdGVfc2VsZWN0X2NhY2hlcTxOVQVleHRyYXE9Y2RqYW5nby51dGlscy5kYXRhc3RydWN0dXJlcwpTb3J0ZWREaWN0CnE+KYFxP31xQFUIa2V5T3JkZXJxQV1zYlUIam9pbl9tYXBxQn1xQyhOWAsAAABob21lX3NlbnNvcnFETk50aESFc1UVcmVsYXRlZF9zZWxlY3RfZmllbGRzcUVdVQxleHRyYV90YWJsZXNxRilVBnNlbGVjdHFHXXFIVQZ0YWJsZXNxSV1xSmhEYVUMdXNlZF9hbGlhc2VzcUtjX19idWlsdGluX18Kc2V0CnFMXXFNaERhhVJxTlUIb3JkZXJfYnlxT11xUFUIZGlzdGluY3RxUYlVDmR1cGVfYXZvaWRhbmNlcVJ9cVNVEGRlZmF1bHRfb3JkZXJpbmdxVIhVCGdyb3VwX2J5cVVOVRFzZWxlY3RfZm9yX3VwZGF0ZXFWiVUOc2VsZWN0X3JlbGF0ZWRxV4lVEGRlZmVycmVkX2xvYWRpbmdxWGhMXYVScVmIhnFaVQ1zZWxlY3RfZmllbGRzcVtdVQlhbGlhc19tYXBxXH1xXWhEY2RqYW5nby5kYi5tb2RlbHMuc3FsLmNvbnN0YW50cwpKb2luSW5mbwpxXihoRGhETk5OTol0gXFfc1UJbWF4X2RlcHRocWBLBVURc3RhbmRhcmRfb3JkZXJpbmdxYYhVDmV4dHJhX29yZGVyX2J5cWIpVQ9kaXN0aW5jdF9maWVsZHNxY11xZFUKYWdncmVnYXRlc3FlaD4pgXFmfXFnaEFdc2JVGV9sb2FkZWRfZmllbGRfbmFtZXNfY2FjaGVxaH1xaVURZXh0cmFfc2VsZWN0X21hc2txak5VGHNlbGVjdF9mb3JfdXBkYXRlX25vd2FpdHFriVUTX2V4dHJhX3NlbGVjdF9jYWNoZXFsTlUIbG93X21hcmtxbUsAVQ5hbGlhc19yZWZjb3VudHFufXFvaERLAXNVE3JlbGF0ZWRfc2VsZWN0X2NvbHNxcF1VDGRlZmF1bHRfY29sc3FxiFUQb3JkZXJpbmdfYWxpYXNlc3FyXXFzVQloaWdoX21hcmtxdE5VGWluY2x1ZGVkX2luaGVyaXRlZF9tb2RlbHNxdX1xdk5oRHNVCXRhYmxlX21hcHF3fXF4aERdcXloRGFzVQt3aGVyZV9jbGFzc3F6Y2RqYW5nby5kYi5tb2RlbHMuc3FsLndoZXJlCldoZXJlTm9kZQpxe1UFbW9kZWxxfGgOVQV3aGVyZXF9aHspgXF+fXF/KFUJY29ubmVjdG9ycYBVA0FORHGBVQduZWdhdGVkcYKJVQhjaGlsZHJlbnGDXXGEaHspgXGFfXGGKGiAaIFogolog11xhyhjZGphbmdvLmRiLm1vZGVscy5zcWwud2hlcmUKQ29uc3RyYWludApxiCmBcYl9cYooVQVhbGlhc3GLaERofGgOVQpmaWVsZF9uYW1lcYxoH1UDY29scY1oH3ViVQVleGFjdHGOiFgCAAAAMDFxj3RxkGFVD3N1YnRyZWVfcGFyZW50c3GRXXViYWiRXXViVQZoYXZpbmdxkmh7KYFxk31xlChogGiBaIKJaINdaJFddWJVEGZpbHRlcl9pc19zdGlja3lxlYl1Ymh8aA5VFl9rbm93bl9yZWxhdGVkX29iamVjdHNxln1xl3ViVQ1fYXV0aF91c2VyX2lkSwJVEl9hdXRoX3VzZXJfYmFja2VuZFUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmR1Lg==	2013-06-12 12:51:45.17028+00
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: efm
--

COPY django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: efm
--

SELECT pg_catalog.setval('django_site_id_seq', 1, true);


--
-- Data for Name: home_application; Type: TABLE DATA; Schema: public; Owner: efm
--

COPY home_application (id, name, lead, installed, date, sensor_id, author, icon, category_id) FROM stdin;
49	Eletronics	Entertainment center	t	2013-05-31	3	Jorma	eye	\N
50	Lobby lamp	Control lighting	t	2013-05-31	4	Pirkko	cmd	\N
51	Water Detector	Reports water leaks	t	2013-05-31	5	Kake	location	\N
52	Coffee Machine	Lobby	t	2013-06-01	6	Matti	checkround	\N
48	Temperature	Lobby temp	t	2013-05-31	2	Keijo	settings	\N
47	Security Camera	Lobby stream	t	2013-05-31	1	Jaska	video	\N
\.


--
-- Name: home_application_id_seq; Type: SEQUENCE SET; Schema: public; Owner: efm
--

SELECT pg_catalog.setval('home_application_id_seq', 52, true);


--
-- Data for Name: home_brand; Type: TABLE DATA; Schema: public; Owner: efm
--

COPY home_brand (id, name, logo) FROM stdin;
2	Ninja Blocks	
3	D-Link	
1	Everspring	
4	Nexa	
\.


--
-- Name: home_brand_id_seq; Type: SEQUENCE SET; Schema: public; Owner: efm
--

SELECT pg_catalog.setval('home_brand_id_seq', 4, true);


--
-- Data for Name: home_category; Type: TABLE DATA; Schema: public; Owner: efm
--

COPY home_category (id, name) FROM stdin;
\.


--
-- Name: home_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: efm
--

SELECT pg_catalog.setval('home_category_id_seq', 1, false);


--
-- Data for Name: home_sensor; Type: TABLE DATA; Schema: public; Owner: efm
--

COPY home_sensor (id, label, code, lead, price, installed, date, number, brand_id, technology_id, picture) FROM stdin;
1	Webcam	01	Security Camera	114.95	t	2013-05-27	1	3	4	webcam.png
2	Temperature sensor	02	Measures temperature	\N	t	2013-05-27	2	2	7	temperature.png
3	Multi Switch	03	Energy meter and switcher	\N	t	2013-05-27	3	1	5	multiswitch.png
4	Lampswitch	04	Lamp buld power switch	\N	t	2013-05-27	4	1	5	lampswitch.png
5	Water detector	05	Recognizes water leaks	\N	t	2013-05-27	5	1	5	water.png
6	Switcher	06	Basic power switcher	\N	t	2013-05-29	6	4	6	switcher.png
7	Switcher	08	Basic power switcher	\N	t	2013-05-29	8	4	6	switcher.png
8	Switcher	12	Basic power switcher	\N	t	2013-05-29	12	4	6	switcher.png
\.


--
-- Name: home_sensor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: efm
--

SELECT pg_catalog.setval('home_sensor_id_seq', 8, true);


--
-- Data for Name: home_technology; Type: TABLE DATA; Schema: public; Owner: efm
--

COPY home_technology (id, name, logo) FROM stdin;
4	Wlan	
5	Z-Wave	
6	433 MHz	
7	433.92 MHz	
\.


--
-- Name: home_technology_id_seq; Type: SEQUENCE SET; Schema: public; Owner: efm
--

SELECT pg_catalog.setval('home_technology_id_seq', 7, true);


--
-- Data for Name: provider_example; Type: TABLE DATA; Schema: public; Owner: efm
--

COPY provider_example (id, name, datastr1, datastr2) FROM stdin;
\.


--
-- Name: provider_example_id_seq; Type: SEQUENCE SET; Schema: public; Owner: efm
--

SELECT pg_catalog.setval('provider_example_id_seq', 1, false);


--
-- Data for Name: services_exampleservice; Type: TABLE DATA; Schema: public; Owner: efm
--

COPY services_exampleservice (id, name, lead, service_description, additional_description, sensor_1, sensor_2, package_id, logo) FROM stdin;
1	Provider Finder	Connects you to the best service provider	With Provider Finder you can let your home sensors to track for technical failures. By choosing a suitable service plan provided by our service company pertners, you don't need to worry about those anymore.		Failure sensor		\N	search.png
2	Energy Account	Makes energy consumption visible	With energy account you can monitor your overall energy consumption in a easy way. You can connect all existing web-based meter services to your account and extend it by setting energy sensoring devices to your local network.	You will also be able to connect your account to your social network so that you can play and compare energy consumption in yout network.	Energy meter	Additonal sensors	\N	energy.png
3	Gas Detector	Don't worry about gas leaks	Let your gas sensor to worry about possible of gas leaks. You will be informed in the ways of your preferences.		Gas sensor		\N	gas.png
4	Shared Devices	Share and use devices with your neighbours	You can share your devices with your neighbours or other network.				\N	printer.png
5	Roomba	Control your Roomba	Service description..	Addition description..	Joona's EEG helmet		\N	roomba.png
\.


--
-- Name: services_exampleservice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: efm
--

SELECT pg_catalog.setval('services_exampleservice_id_seq', 6, true);


--
-- Data for Name: services_package; Type: TABLE DATA; Schema: public; Owner: efm
--

COPY services_package (id, name, lead, general_description, additional_description, price, picture) FROM stdin;
1	Starter	Basic Package	This..		\N	
2	Advanced	Large collection	This..		\N	
\.


--
-- Name: services_package_id_seq; Type: SEQUENCE SET; Schema: public; Owner: efm
--

SELECT pg_catalog.setval('services_package_id_seq', 2, true);


--
-- Data for Name: south_migrationhistory; Type: TABLE DATA; Schema: public; Owner: efm
--

COPY south_migrationhistory (id, app_name, migration, applied) FROM stdin;
1	home	0001_initial	2013-05-24 23:24:20.852+00
2	services	0001_initial	2013-05-24 23:24:33.84+00
3	manager	0001_initial	2013-05-24 23:24:43.871+00
4	services	0002_auto__chg_field_exampleservice_additional_description__chg_field_examp	2013-05-24 23:46:46.366+00
5	services	0003_auto__chg_field_exampleservice_lead	2013-05-24 23:46:47.515+00
6	home	0002_auto__del_package__add_field_application_code	2013-05-26 10:17:26.045+00
7	home	0003_auto__add_field_application_number	2013-05-26 10:20:25.176+00
8	home	0004_auto__del_field_application_extra_field_2__del_field_application_extra	2013-05-26 11:12:21.714+00
9	home	0005_auto__add_brand	2013-05-26 11:19:34.648+00
10	home	0006_auto__del_field_application_number__add_field_sensor_number	2013-05-26 11:39:06.213+00
11	home	0007_auto__add_field_application_sensor	2013-05-26 14:36:57.578+00
12	home	0008_auto__add_field_application_author	2013-05-26 16:23:14.718+00
13	services	0004_auto__add_package	2013-05-27 17:49:08.002+00
14	services	0005_auto__chg_field_exampleservice_logo_url	2013-05-28 10:59:52.595+00
15	home	0009_auto__add_icon__add_field_application_icon	2013-05-28 16:55:01.972+00
16	home	0010_auto__del_icon__chg_field_application_icon	2013-05-28 20:36:58.412+00
17	home	0011_auto__chg_field_application_sensor	2013-05-28 21:07:04.861+00
18	home	0012_auto__del_field_category_lead__del_field_application_picture_url__add_	2013-05-28 21:16:05.596+00
19	home	0013_auto__add_field_sensor_brand__add_field_sensor_technology	2013-05-28 21:16:50.059+00
20	home	0014_auto__chg_field_sensor_code	2013-05-28 21:40:56.815+00
21	services	0006_auto__add_field_exampleservice_package	2013-05-29 06:58:34.835+00
22	home	0015_auto__del_field_technology_logo_url__add_field_technology_logo__del_fi	2013-06-02 15:24:06.814+00
23	services	0007_auto__del_field_exampleservice_logo_url__add_field_exampleservice_logo	2013-06-02 15:24:34.349+00
\.


--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: efm
--

SELECT pg_catalog.setval('south_migrationhistory_id_seq', 23, true);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: efm; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: efm; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: efm; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: efm; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: efm; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: efm; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: efm; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: efm; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: efm; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: efm; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: efm; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: efm; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: efm; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_model_key; Type: CONSTRAINT; Schema: public; Owner: efm; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_key UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: efm; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: efm; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: efm; Tablespace: 
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: home_application_pkey; Type: CONSTRAINT; Schema: public; Owner: efm; Tablespace: 
--

ALTER TABLE ONLY home_application
    ADD CONSTRAINT home_application_pkey PRIMARY KEY (id);


--
-- Name: home_brand_pkey; Type: CONSTRAINT; Schema: public; Owner: efm; Tablespace: 
--

ALTER TABLE ONLY home_brand
    ADD CONSTRAINT home_brand_pkey PRIMARY KEY (id);


--
-- Name: home_category_pkey; Type: CONSTRAINT; Schema: public; Owner: efm; Tablespace: 
--

ALTER TABLE ONLY home_category
    ADD CONSTRAINT home_category_pkey PRIMARY KEY (id);


--
-- Name: home_sensor_pkey; Type: CONSTRAINT; Schema: public; Owner: efm; Tablespace: 
--

ALTER TABLE ONLY home_sensor
    ADD CONSTRAINT home_sensor_pkey PRIMARY KEY (id);


--
-- Name: home_technology_pkey; Type: CONSTRAINT; Schema: public; Owner: efm; Tablespace: 
--

ALTER TABLE ONLY home_technology
    ADD CONSTRAINT home_technology_pkey PRIMARY KEY (id);


--
-- Name: provider_example_pkey; Type: CONSTRAINT; Schema: public; Owner: efm; Tablespace: 
--

ALTER TABLE ONLY provider_example
    ADD CONSTRAINT provider_example_pkey PRIMARY KEY (id);


--
-- Name: services_exampleservice_pkey; Type: CONSTRAINT; Schema: public; Owner: efm; Tablespace: 
--

ALTER TABLE ONLY services_exampleservice
    ADD CONSTRAINT services_exampleservice_pkey PRIMARY KEY (id);


--
-- Name: services_package_pkey; Type: CONSTRAINT; Schema: public; Owner: efm; Tablespace: 
--

ALTER TABLE ONLY services_package
    ADD CONSTRAINT services_package_pkey PRIMARY KEY (id);


--
-- Name: south_migrationhistory_pkey; Type: CONSTRAINT; Schema: public; Owner: efm; Tablespace: 
--

ALTER TABLE ONLY south_migrationhistory
    ADD CONSTRAINT south_migrationhistory_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_like; Type: INDEX; Schema: public; Owner: efm; Tablespace: 
--

CREATE INDEX auth_group_name_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id; Type: INDEX; Schema: public; Owner: efm; Tablespace: 
--

CREATE INDEX auth_group_permissions_group_id ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id; Type: INDEX; Schema: public; Owner: efm; Tablespace: 
--

CREATE INDEX auth_group_permissions_permission_id ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id; Type: INDEX; Schema: public; Owner: efm; Tablespace: 
--

CREATE INDEX auth_permission_content_type_id ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id; Type: INDEX; Schema: public; Owner: efm; Tablespace: 
--

CREATE INDEX auth_user_groups_group_id ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id; Type: INDEX; Schema: public; Owner: efm; Tablespace: 
--

CREATE INDEX auth_user_groups_user_id ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id; Type: INDEX; Schema: public; Owner: efm; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_permission_id ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id; Type: INDEX; Schema: public; Owner: efm; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_user_id ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_like; Type: INDEX; Schema: public; Owner: efm; Tablespace: 
--

CREATE INDEX auth_user_username_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id; Type: INDEX; Schema: public; Owner: efm; Tablespace: 
--

CREATE INDEX django_admin_log_content_type_id ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id; Type: INDEX; Schema: public; Owner: efm; Tablespace: 
--

CREATE INDEX django_admin_log_user_id ON django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date; Type: INDEX; Schema: public; Owner: efm; Tablespace: 
--

CREATE INDEX django_session_expire_date ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_like; Type: INDEX; Schema: public; Owner: efm; Tablespace: 
--

CREATE INDEX django_session_session_key_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: home_application_category_id; Type: INDEX; Schema: public; Owner: efm; Tablespace: 
--

CREATE INDEX home_application_category_id ON home_application USING btree (category_id);


--
-- Name: home_application_sensor_id; Type: INDEX; Schema: public; Owner: efm; Tablespace: 
--

CREATE INDEX home_application_sensor_id ON home_application USING btree (sensor_id);


--
-- Name: home_sensor_brand_id; Type: INDEX; Schema: public; Owner: efm; Tablespace: 
--

CREATE INDEX home_sensor_brand_id ON home_sensor USING btree (brand_id);


--
-- Name: home_sensor_technology_id; Type: INDEX; Schema: public; Owner: efm; Tablespace: 
--

CREATE INDEX home_sensor_technology_id ON home_sensor USING btree (technology_id);


--
-- Name: services_exampleservice_package_id; Type: INDEX; Schema: public; Owner: efm; Tablespace: 
--

CREATE INDEX services_exampleservice_package_id ON services_exampleservice USING btree (package_id);


--
-- Name: auth_group_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: efm
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: efm
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_fkey FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: efm
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: brand_id_refs_id_7d8aecd1; Type: FK CONSTRAINT; Schema: public; Owner: efm
--

ALTER TABLE ONLY home_sensor
    ADD CONSTRAINT brand_id_refs_id_7d8aecd1 FOREIGN KEY (brand_id) REFERENCES home_brand(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: category_id_refs_id_71249672; Type: FK CONSTRAINT; Schema: public; Owner: efm
--

ALTER TABLE ONLY home_application
    ADD CONSTRAINT category_id_refs_id_71249672 FOREIGN KEY (category_id) REFERENCES home_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_type_id_refs_id_d043b34a; Type: FK CONSTRAINT; Schema: public; Owner: efm
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT content_type_id_refs_id_d043b34a FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: efm
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: efm
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: group_id_refs_id_f4b32aac; Type: FK CONSTRAINT; Schema: public; Owner: efm
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT group_id_refs_id_f4b32aac FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: package_id_refs_id_54e04491; Type: FK CONSTRAINT; Schema: public; Owner: efm
--

ALTER TABLE ONLY services_exampleservice
    ADD CONSTRAINT package_id_refs_id_54e04491 FOREIGN KEY (package_id) REFERENCES services_package(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sensor_id_refs_id_1e443576; Type: FK CONSTRAINT; Schema: public; Owner: efm
--

ALTER TABLE ONLY home_application
    ADD CONSTRAINT sensor_id_refs_id_1e443576 FOREIGN KEY (sensor_id) REFERENCES home_sensor(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: technology_id_refs_id_3f44dd4b; Type: FK CONSTRAINT; Schema: public; Owner: efm
--

ALTER TABLE ONLY home_sensor
    ADD CONSTRAINT technology_id_refs_id_3f44dd4b FOREIGN KEY (technology_id) REFERENCES home_technology(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_40c41112; Type: FK CONSTRAINT; Schema: public; Owner: efm
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT user_id_refs_id_40c41112 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_4dc23c39; Type: FK CONSTRAINT; Schema: public; Owner: efm
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT user_id_refs_id_4dc23c39 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

