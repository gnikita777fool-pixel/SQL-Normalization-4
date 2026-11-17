--
-- PostgreSQL database dump
--

\restrict uV4mPHJecSbAJFT3I1bkkNUvRTMgg910RYgcI4BTOLcmIwhpAuu7mUPfM3dYc5c

-- Dumped from database version 18.7 (Debian 18.7-1.pgdg13+2)
-- Dumped by pg_dump version 18.7 (Debian 18.7-1.pgdg13+2)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: order_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_items (
    order_id integer NOT NULL,
    prod_id integer NOT NULL,
    quantity integer NOT NULL
);


ALTER TABLE public.order_items OWNER TO postgres;

--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    order_id integer NOT NULL,
    order_date date NOT NULL,
    client_id integer NOT NULL,
    rep_id integer NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    prod_id integer NOT NULL,
    prod_name character varying(100) NOT NULL,
    price numeric(10,2) NOT NULL
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: representatives; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.representatives (
    rep_id integer NOT NULL,
    rep_name character varying(100) NOT NULL
);


ALTER TABLE public.representatives OWNER TO postgres;

--
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_items (order_id, prod_id, quantity) FROM stdin;
1001	101	1
1001	102	2
1002	104	1
1002	103	1
1003	105	3
1004	101	1
1004	103	1
1005	102	1
1005	105	2
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (order_id, order_date, client_id, rep_id) FROM stdin;
1001	2026-11-10	501	1
1002	2026-11-12	502	2
1003	2026-11-15	503	1
1004	2026-11-17	501	3
1005	2026-11-17	504	2
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (prod_id, prod_name, price) FROM stdin;
101	Ноутбук ASUS VivoBook	55000.00
102	Мышь Logitech MX Master	7500.00
103	Клавиатура Keychron K2	9800.00
104	Монитор Dell UltraSharp	32000.00
105	USB-хаб Baseus	1500.00
\.


--
-- Data for Name: representatives; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.representatives (rep_id, rep_name) FROM stdin;
1	Иванов Иван Иванович
2	Петров Петр Петрович
3	Сидорова Анна Сергеевна
\.


--
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (order_id, prod_id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (prod_id);


--
-- Name: representatives representatives_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.representatives
    ADD CONSTRAINT representatives_pkey PRIMARY KEY (rep_id);


--
-- Name: order_items order_items_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id);


--
-- Name: order_items order_items_prod_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_prod_id_fkey FOREIGN KEY (prod_id) REFERENCES public.products(prod_id);


--
-- Name: orders orders_rep_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_rep_id_fkey FOREIGN KEY (rep_id) REFERENCES public.representatives(rep_id);


--
-- PostgreSQL database dump complete
--

\unrestrict uV4mPHJecSbAJFT3I1bkkNUvRTMgg910RYgcI4BTOLcmIwhpAuu7mUPfM3dYc5c

