--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)

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
-- Name: adress; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.adress (
    id integer NOT NULL,
    adress_name character varying(255) NOT NULL,
    cep character varying(255) NOT NULL,
    cidade character varying(255) NOT NULL,
    estate character varying(100) NOT NULL
);


ALTER TABLE public.adress OWNER TO postgres;

--
-- Name: adress_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.adress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.adress_id_seq OWNER TO postgres;

--
-- Name: adress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.adress_id_seq OWNED BY public.adress.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    token character varying(255) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.sessions OWNER TO postgres;

--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sessions_id_seq OWNER TO postgres;

--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: subscription; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subscription (
    id integer NOT NULL,
    user_id integer NOT NULL,
    category_id integer NOT NULL,
    subscription_date date NOT NULL,
    adress_id integer NOT NULL,
    chosen_date character varying(255) NOT NULL
);


ALTER TABLE public.subscription OWNER TO postgres;

--
-- Name: subscription_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subscription_category (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.subscription_category OWNER TO postgres;

--
-- Name: subscription_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subscription_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subscription_category_id_seq OWNER TO postgres;

--
-- Name: subscription_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subscription_category_id_seq OWNED BY public.subscription_category.id;


--
-- Name: subscription_final; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subscription_final (
    id integer NOT NULL,
    subscription_id integer NOT NULL,
    item_id integer NOT NULL
);


ALTER TABLE public.subscription_final OWNER TO postgres;

--
-- Name: subscription_final_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subscription_final_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subscription_final_id_seq OWNER TO postgres;

--
-- Name: subscription_final_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subscription_final_id_seq OWNED BY public.subscription_final.id;


--
-- Name: subscription_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subscription_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subscription_id_seq OWNER TO postgres;

--
-- Name: subscription_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subscription_id_seq OWNED BY public.subscription.id;


--
-- Name: subscription_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subscription_items (
    id integer NOT NULL,
    item_name character varying(100) NOT NULL
);


ALTER TABLE public.subscription_items OWNER TO postgres;

--
-- Name: subscription_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subscription_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subscription_items_id_seq OWNER TO postgres;

--
-- Name: subscription_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subscription_items_id_seq OWNED BY public.subscription_items.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(255) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: adress id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adress ALTER COLUMN id SET DEFAULT nextval('public.adress_id_seq'::regclass);


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: subscription id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscription ALTER COLUMN id SET DEFAULT nextval('public.subscription_id_seq'::regclass);


--
-- Name: subscription_category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscription_category ALTER COLUMN id SET DEFAULT nextval('public.subscription_category_id_seq'::regclass);


--
-- Name: subscription_final id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscription_final ALTER COLUMN id SET DEFAULT nextval('public.subscription_final_id_seq'::regclass);


--
-- Name: subscription_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscription_items ALTER COLUMN id SET DEFAULT nextval('public.subscription_items_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: adress; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.adress (id, adress_name, cep, cidade, estate) FROM stdin;
1	Rua Linderson	22020060	Rio de Janeiro	RJ
2	Rua Linderson	22020060	Rio de Janeiro	RJ
3	Rua Laranja	22020060	Rio de Janeiro	RJ
4	Rua Larnaha	22020060	Rio de Janeiro	RJ
5	Rua dddd	22020060	Rio de Janeiro	RJ
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessions (id, token, user_id) FROM stdin;
1	a7f9ff3c-f2d5-4130-a00a-2060aaa4fe48	1
2	329534e3-6be9-47f2-b52f-ad19181f5bae	2
3	07c7a5e2-69c4-4044-848e-28431c02e7b3	2
4	8c0ada96-561c-4dc7-84ea-221eb4011260	2
5	6b9a6980-9654-40ba-a4d9-eca2ef9aeaef	1
6	c905f60f-f64c-44a0-8d3c-5ed60c6ed886	1
7	e9ee62ec-739a-463c-a34f-1f22bfc16e58	2
8	40f54ff6-18cb-440d-a028-74c505c26869	2
9	94ec7bd9-8545-43a0-a042-84458a423fcb	1
10	ebb97b03-8486-42b8-952b-d43657bc65b5	2
11	4b6d5e08-2d4e-4448-aebe-a757ead0ba81	1
12	61e2d1c6-cdd1-46b5-91f0-b5a314f20e92	2
13	f9d1435c-6ebb-4b0b-ab00-0a1811ceb4fe	1
14	dd581735-17e4-4506-a653-619b426e692a	1
15	67a882f3-c760-4cf2-95f6-6d20f386c323	3
16	32cf4636-e93a-4486-8ac1-9042d2aafad8	1
17	4841972d-6fd3-4044-aa89-d570f5a73380	4
18	441276e9-bbd0-466d-8dd6-e72be6a57236	5
19	4f2174e7-34bc-4db5-be72-310d959bfb65	6
20	d9ceb85a-c0c0-4a25-a5b8-464bead8dff2	1
21	8c6b87a0-2e70-4768-aea2-38820c7bd747	1
22	8837a0c5-96bf-4dd9-a63a-604aa21f4dc1	1
23	2e40c0c2-62ad-42bd-aeea-3ced43510d3a	1
24	bddaac97-61f0-4f24-b232-54db34c3a9db	1
\.


--
-- Data for Name: subscription; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subscription (id, user_id, category_id, subscription_date, adress_id, chosen_date) FROM stdin;
1	1	2	2021-11-18	1	20
2	2	1	2021-11-18	2	1
3	4	1	2021-11-19	3	1
4	5	1	2021-11-19	4	3
5	6	1	2021-11-22	5	1
\.


--
-- Data for Name: subscription_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subscription_category (id, name) FROM stdin;
1	Semanal
2	Mensal
\.


--
-- Data for Name: subscription_final; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subscription_final (id, subscription_id, item_id) FROM stdin;
1	1	1
3	2	1
5	1	2
6	1	3
7	3	1
8	3	3
9	4	1
10	4	2
11	5	2
\.


--
-- Data for Name: subscription_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subscription_items (id, item_name) FROM stdin;
1	Chás
2	Incensos
3	Produtos organicos
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, password) FROM stdin;
1	Diego	diegomamede@gmail.com	$2b$10$EvT/suYX/2A7YdUz/gjMIO4qKph4dPBYisKQv26uuZRtt9GAUWTae
2	diego	diegomamede@gmail.com.b	$2b$10$WCOhl81AYjBgINkjlky0jOan2n/zYmJAB5tfevDbK2iihyKegLt.W
3	Didi	diego@gmail.com	$2b$10$A/88T5bjfZKPkB1PxMD/b.5/IEqWIWQL0hKd/lkESQ92Xuqb9Pay2
4	Diego Nogueira	diegomamede@poli.ufrj.br	$2b$10$JkIL8Pj1aDydrJWw7/182erWhCsnXLg13pOzMLWHc8Olzpq.noy2.
5	Diego Nogueira	diego@gmail.cc	$2b$10$8mpSEqdnfGPMvYJTqEI5OeyKnXnlLweIp5t.9N1O7YHW.iUkGk.aS
6	Diego Nogueira	diegomamede@poli.br	$2b$10$xJs50XUbzi8pj3TiAJLLyeVA33GKIScK7vsj8PjmguIvTEof6MhC2
\.


--
-- Name: adress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.adress_id_seq', 5, true);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sessions_id_seq', 24, true);


--
-- Name: subscription_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subscription_category_id_seq', 2, true);


--
-- Name: subscription_final_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subscription_final_id_seq', 11, true);


--
-- Name: subscription_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subscription_id_seq', 5, true);


--
-- Name: subscription_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subscription_items_id_seq', 3, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 6, true);


--
-- Name: adress adress_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adress
    ADD CONSTRAINT adress_pk PRIMARY KEY (id);


--
-- Name: sessions sessions_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pk PRIMARY KEY (id);


--
-- Name: subscription_category subscription_category_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscription_category
    ADD CONSTRAINT subscription_category_pk PRIMARY KEY (id);


--
-- Name: subscription_final subscription_final_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscription_final
    ADD CONSTRAINT subscription_final_pk PRIMARY KEY (id);


--
-- Name: subscription_items subscription_items_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscription_items
    ADD CONSTRAINT subscription_items_pk PRIMARY KEY (id);


--
-- Name: subscription subscription_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscription
    ADD CONSTRAINT subscription_pk PRIMARY KEY (id);


--
-- Name: users users_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pk PRIMARY KEY (id);


--
-- Name: sessions sessions_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_fk0 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: subscription_final subscription_final_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscription_final
    ADD CONSTRAINT subscription_final_fk0 FOREIGN KEY (subscription_id) REFERENCES public.subscription(id);


--
-- Name: subscription_final subscription_final_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscription_final
    ADD CONSTRAINT subscription_final_fk1 FOREIGN KEY (item_id) REFERENCES public.subscription_items(id);


--
-- Name: subscription subscription_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscription
    ADD CONSTRAINT subscription_fk0 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: subscription subscription_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscription
    ADD CONSTRAINT subscription_fk1 FOREIGN KEY (category_id) REFERENCES public.subscription_category(id);


--
-- Name: subscription subscription_fk2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscription
    ADD CONSTRAINT subscription_fk2 FOREIGN KEY (adress_id) REFERENCES public.adress(id);


--
-- PostgreSQL database dump complete
--

