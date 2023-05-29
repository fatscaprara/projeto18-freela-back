--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7 (Ubuntu 14.7-0ubuntu0.22.10.1)
-- Dumped by pg_dump version 14.7 (Ubuntu 14.7-0ubuntu0.22.10.1)

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
-- Name: airlines; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.airlines (
    id integer NOT NULL,
    name text NOT NULL
);


--
-- Name: airlines_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.airlines_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: airlines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.airlines_id_seq OWNED BY public.airlines.id;


--
-- Name: amenities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.amenities (
    id integer NOT NULL,
    name text NOT NULL
);


--
-- Name: amenities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.amenities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: amenities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.amenities_id_seq OWNED BY public.amenities.id;


--
-- Name: cities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cities (
    id integer NOT NULL,
    name text NOT NULL
);


--
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cities_id_seq OWNED BY public.cities.id;


--
-- Name: hotel_amenities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.hotel_amenities (
    id integer NOT NULL,
    hotel_id integer,
    amenity_id integer
);


--
-- Name: hotel_amenities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.hotel_amenities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: hotel_amenities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.hotel_amenities_id_seq OWNED BY public.hotel_amenities.id;


--
-- Name: hotels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.hotels (
    id integer NOT NULL,
    address text NOT NULL,
    price integer NOT NULL,
    description text NOT NULL,
    city_id integer NOT NULL,
    name text
);


--
-- Name: hotels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.hotels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: hotels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.hotels_id_seq OWNED BY public.hotels.id;


--
-- Name: images; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.images (
    id integer NOT NULL,
    hotel_id integer,
    url text NOT NULL
);


--
-- Name: images_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.images_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.images_id_seq OWNED BY public.images.id;


--
-- Name: tickets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tickets (
    id integer NOT NULL,
    origin_city_id integer NOT NULL,
    destination_city_id integer NOT NULL,
    airline_id integer NOT NULL,
    departure_time timestamp without time zone NOT NULL,
    arrival_time timestamp without time zone NOT NULL,
    price integer NOT NULL,
    image_url text NOT NULL
);


--
-- Name: tickets_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tickets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tickets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tickets_id_seq OWNED BY public.tickets.id;


--
-- Name: airlines id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.airlines ALTER COLUMN id SET DEFAULT nextval('public.airlines_id_seq'::regclass);


--
-- Name: amenities id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.amenities ALTER COLUMN id SET DEFAULT nextval('public.amenities_id_seq'::regclass);


--
-- Name: cities id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cities ALTER COLUMN id SET DEFAULT nextval('public.cities_id_seq'::regclass);


--
-- Name: hotel_amenities id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hotel_amenities ALTER COLUMN id SET DEFAULT nextval('public.hotel_amenities_id_seq'::regclass);


--
-- Name: hotels id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hotels ALTER COLUMN id SET DEFAULT nextval('public.hotels_id_seq'::regclass);


--
-- Name: images id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.images ALTER COLUMN id SET DEFAULT nextval('public.images_id_seq'::regclass);


--
-- Name: tickets id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tickets ALTER COLUMN id SET DEFAULT nextval('public.tickets_id_seq'::regclass);


--
-- Data for Name: airlines; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.airlines VALUES (1, 'Gol');
INSERT INTO public.airlines VALUES (2, 'Azul');
INSERT INTO public.airlines VALUES (3, 'Voe Já');
INSERT INTO public.airlines VALUES (4, 'Latam');


--
-- Data for Name: amenities; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.amenities VALUES (1, 'Wi-Fi');
INSERT INTO public.amenities VALUES (2, 'Ar-condicionado');
INSERT INTO public.amenities VALUES (3, 'Estacionamento');
INSERT INTO public.amenities VALUES (4, 'Piscina');
INSERT INTO public.amenities VALUES (5, 'Academia');
INSERT INTO public.amenities VALUES (6, 'Restaurante');


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cities VALUES (1, 'São Paulo');
INSERT INTO public.cities VALUES (2, 'Rio de Janeiro');
INSERT INTO public.cities VALUES (3, 'Campo Grande');
INSERT INTO public.cities VALUES (4, 'Belo Horizonte');
INSERT INTO public.cities VALUES (5, 'Cuiabá');
INSERT INTO public.cities VALUES (6, 'Goiânia');
INSERT INTO public.cities VALUES (7, 'Florianópolis');


--
-- Data for Name: hotel_amenities; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.hotel_amenities VALUES (1, 1, 1);
INSERT INTO public.hotel_amenities VALUES (3, 3, 1);
INSERT INTO public.hotel_amenities VALUES (4, 4, 1);
INSERT INTO public.hotel_amenities VALUES (6, 6, 1);
INSERT INTO public.hotel_amenities VALUES (8, 1, 2);
INSERT INTO public.hotel_amenities VALUES (9, 2, 2);
INSERT INTO public.hotel_amenities VALUES (10, 3, 2);
INSERT INTO public.hotel_amenities VALUES (12, 5, 2);
INSERT INTO public.hotel_amenities VALUES (13, 6, 2);
INSERT INTO public.hotel_amenities VALUES (15, 1, 3);
INSERT INTO public.hotel_amenities VALUES (16, 2, 3);
INSERT INTO public.hotel_amenities VALUES (17, 3, 3);
INSERT INTO public.hotel_amenities VALUES (18, 4, 3);
INSERT INTO public.hotel_amenities VALUES (20, 6, 3);
INSERT INTO public.hotel_amenities VALUES (23, 2, 4);
INSERT INTO public.hotel_amenities VALUES (24, 3, 4);
INSERT INTO public.hotel_amenities VALUES (25, 4, 4);
INSERT INTO public.hotel_amenities VALUES (26, 5, 4);
INSERT INTO public.hotel_amenities VALUES (27, 6, 4);
INSERT INTO public.hotel_amenities VALUES (29, 1, 5);
INSERT INTO public.hotel_amenities VALUES (30, 2, 5);
INSERT INTO public.hotel_amenities VALUES (31, 3, 5);
INSERT INTO public.hotel_amenities VALUES (32, 4, 5);
INSERT INTO public.hotel_amenities VALUES (33, 5, 5);
INSERT INTO public.hotel_amenities VALUES (35, 7, 5);
INSERT INTO public.hotel_amenities VALUES (36, 1, 6);
INSERT INTO public.hotel_amenities VALUES (37, 2, 6);
INSERT INTO public.hotel_amenities VALUES (38, 3, 6);
INSERT INTO public.hotel_amenities VALUES (40, 5, 6);
INSERT INTO public.hotel_amenities VALUES (42, 7, 6);


--
-- Data for Name: hotels; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.hotels VALUES (1, 'Rua 864, Bairro 10', 388, 'Excelente localização e serviço de primeira', 1, 'Hotel eb4eb');
INSERT INTO public.hotels VALUES (2, 'Rua 572, Bairro 5', 303, 'Hotel aconchegante e confortável', 2, 'Hotel 5aa90');
INSERT INTO public.hotels VALUES (3, 'Rua 660, Bairro 7', 490, 'Hotel aconchegante e confortável', 3, 'Hotel 15355');
INSERT INTO public.hotels VALUES (4, 'Rua 587, Bairro 2', 293, 'Excelente localização e serviço de primeira', 4, 'Hotel c86b2');
INSERT INTO public.hotels VALUES (5, 'Rua 113, Bairro 6', 226, 'Excelente localização e serviço de primeira', 5, 'Hotel 388c8');
INSERT INTO public.hotels VALUES (6, 'Rua 353, Bairro 7', 232, 'Hotel aconchegante e confortável', 6, 'Hotel 228ff');
INSERT INTO public.hotels VALUES (7, 'Rua 798, Bairro 4', 245, 'Excelente localização e serviço de primeira', 7, 'Hotel b2c6f');
INSERT INTO public.hotels VALUES (8, 'Rua 806, Bairro 7', 68, 'Excelente localização e serviço de primeira', 1, 'Hotel 4bde4');
INSERT INTO public.hotels VALUES (9, 'Rua 40, Bairro 1', 499, 'Excelente localização e serviço de primeira', 2, 'Hotel 12524');
INSERT INTO public.hotels VALUES (10, 'Rua 781, Bairro 1', 346, 'Excelente localização e serviço de primeira', 3, 'Hotel d0101');
INSERT INTO public.hotels VALUES (11, 'Rua 292, Bairro 8', 497, 'Ótima opção para sua estadia na cidade', 4, 'Hotel 7ada0');
INSERT INTO public.hotels VALUES (12, 'Rua 662, Bairro 7', 240, 'Ótima opção para sua estadia na cidade', 5, 'Hotel 4cb46');
INSERT INTO public.hotels VALUES (13, 'Rua 684, Bairro 3', 345, 'Hotel aconchegante e confortável', 6, 'Hotel b1de8');
INSERT INTO public.hotels VALUES (14, 'Rua 99, Bairro 6', 77, 'Excelente localização e serviço de primeira', 7, 'Hotel dab34');
INSERT INTO public.hotels VALUES (15, 'Rua 739, Bairro 8', 283, 'Excelente localização e serviço de primeira', 1, 'Hotel f8ee8');
INSERT INTO public.hotels VALUES (16, 'Rua 113, Bairro 2', 191, 'Excelente localização e serviço de primeira', 2, 'Hotel af259');
INSERT INTO public.hotels VALUES (17, 'Rua 391, Bairro 6', 548, 'Ótima opção para sua estadia na cidade', 3, 'Hotel a7d7a');
INSERT INTO public.hotels VALUES (18, 'Rua 989, Bairro 3', 510, 'Hotel aconchegante e confortável', 4, 'Hotel 92ca0');
INSERT INTO public.hotels VALUES (19, 'Rua 866, Bairro 1', 182, 'Ótima opção para sua estadia na cidade', 5, 'Hotel 1e800');
INSERT INTO public.hotels VALUES (20, 'Rua 59, Bairro 2', 114, 'Ótima opção para sua estadia na cidade', 6, 'Hotel 85f83');
INSERT INTO public.hotels VALUES (21, 'Rua 228, Bairro 9', 395, 'Excelente localização e serviço de primeira', 7, 'Hotel 5e62f');


--
-- Data for Name: images; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.images VALUES (1, 1, 'https://images.trvl-media.com/lodging/6000000/5370000/5360400/5360332/24ed23a0.jpg?impolicy=resizecrop&rw=500&ra=fit');
INSERT INTO public.images VALUES (3, 1, 'https://imgcy.trivago.com/c_limit,d_dummy.jpeg,f_auto,h_600,q_auto,w_600//itemimages/16/46/164673_v5.jpeg');
INSERT INTO public.images VALUES (4, 2, 'https://images.trvl-media.com/lodging/6000000/5370000/5360400/5360332/24ed23a0.jpg?impolicy=resizecrop&rw=500&ra=fit');
INSERT INTO public.images VALUES (6, 2, 'https://imgcy.trivago.com/c_limit,d_dummy.jpeg,f_auto,h_600,q_auto,w_600//itemimages/16/46/164673_v5.jpeg');
INSERT INTO public.images VALUES (7, 3, 'https://images.trvl-media.com/lodging/6000000/5370000/5360400/5360332/24ed23a0.jpg?impolicy=resizecrop&rw=500&ra=fit');
INSERT INTO public.images VALUES (9, 3, 'https://imgcy.trivago.com/c_limit,d_dummy.jpeg,f_auto,h_600,q_auto,w_600//itemimages/16/46/164673_v5.jpeg');
INSERT INTO public.images VALUES (10, 4, 'https://images.trvl-media.com/lodging/6000000/5370000/5360400/5360332/24ed23a0.jpg?impolicy=resizecrop&rw=500&ra=fit');
INSERT INTO public.images VALUES (12, 4, 'https://imgcy.trivago.com/c_limit,d_dummy.jpeg,f_auto,h_600,q_auto,w_600//itemimages/16/46/164673_v5.jpeg');
INSERT INTO public.images VALUES (13, 5, 'https://images.trvl-media.com/lodging/6000000/5370000/5360400/5360332/24ed23a0.jpg?impolicy=resizecrop&rw=500&ra=fit');
INSERT INTO public.images VALUES (15, 5, 'https://imgcy.trivago.com/c_limit,d_dummy.jpeg,f_auto,h_600,q_auto,w_600//itemimages/16/46/164673_v5.jpeg');
INSERT INTO public.images VALUES (16, 6, 'https://images.trvl-media.com/lodging/6000000/5370000/5360400/5360332/24ed23a0.jpg?impolicy=resizecrop&rw=500&ra=fit');
INSERT INTO public.images VALUES (18, 6, 'https://imgcy.trivago.com/c_limit,d_dummy.jpeg,f_auto,h_600,q_auto,w_600//itemimages/16/46/164673_v5.jpeg');
INSERT INTO public.images VALUES (19, 7, 'https://images.trvl-media.com/lodging/6000000/5370000/5360400/5360332/24ed23a0.jpg?impolicy=resizecrop&rw=500&ra=fit');
INSERT INTO public.images VALUES (21, 7, 'https://imgcy.trivago.com/c_limit,d_dummy.jpeg,f_auto,h_600,q_auto,w_600//itemimages/16/46/164673_v5.jpeg');
INSERT INTO public.images VALUES (2, 1, 'https://website-hangar-assets.maxmilhas.com.br/2023/04/06/642edcfcaa1d2vitrine_simples_resortallinclusive.webp');
INSERT INTO public.images VALUES (5, 2, 'https://website-hangar-assets.maxmilhas.com.br/2023/04/06/642edcfcaa1d2vitrine_simples_resortallinclusive.webp');
INSERT INTO public.images VALUES (8, 3, 'https://website-hangar-assets.maxmilhas.com.br/2023/04/06/642edcfcaa1d2vitrine_simples_resortallinclusive.webp');
INSERT INTO public.images VALUES (11, 4, 'https://website-hangar-assets.maxmilhas.com.br/2023/04/06/642edcfcaa1d2vitrine_simples_resortallinclusive.webp');
INSERT INTO public.images VALUES (14, 5, 'https://website-hangar-assets.maxmilhas.com.br/2023/04/06/642edcfcaa1d2vitrine_simples_resortallinclusive.webp');
INSERT INTO public.images VALUES (17, 6, 'https://website-hangar-assets.maxmilhas.com.br/2023/04/06/642edcfcaa1d2vitrine_simples_resortallinclusive.webp');
INSERT INTO public.images VALUES (20, 7, 'https://website-hangar-assets.maxmilhas.com.br/2023/04/06/642edcfcaa1d2vitrine_simples_resortallinclusive.webp');


--
-- Data for Name: tickets; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tickets VALUES (1, 1, 1, 1, '2023-06-03 17:59:03.417845', '2023-05-30 09:13:02.105777', 709, 'https://www.visitbrasil.com/wp-content/uploads/2021/08/Sao-Paulo-SP-Visit-Brasil-7-1-1024x683.jpg');
INSERT INTO public.tickets VALUES (7, 1, 2, 3, '2023-05-27 12:49:58.684275', '2023-05-27 21:35:48.828462', 269, 'https://www.melhoresdestinos.com.br/wp-content/uploads/2019/08/rio-de-janeiro-capa2019-01.jpg');
INSERT INTO public.tickets VALUES (9, 1, 3, 1, '2023-05-28 00:46:32.438001', '2023-06-04 22:03:12.441892', 1089, 'https://static.preparaenem.com/2021/09/parque-nacoes-indigenas.jpg');
INSERT INTO public.tickets VALUES (10, 1, 3, 2, '2023-05-26 13:58:42.827507', '2023-05-31 04:40:23.785159', 246, 'https://static.preparaenem.com/2021/09/parque-nacoes-indigenas.jpg');
INSERT INTO public.tickets VALUES (2, 2, 1, 2, '2023-05-31 11:53:23.481355', '2023-05-28 07:37:13.093315', 250, 'https://www.visitbrasil.com/wp-content/uploads/2021/08/Sao-Paulo-SP-Visit-Brasil-7-1-1024x683.jpg');
INSERT INTO public.tickets VALUES (3, 3, 1, 3, '2023-05-26 21:21:03.838026', '2023-05-27 19:38:47.793969', 385, 'https://www.visitbrasil.com/wp-content/uploads/2021/08/Sao-Paulo-SP-Visit-Brasil-7-1-1024x683.jpg');
INSERT INTO public.tickets VALUES (4, 4, 1, 4, '2023-06-04 09:12:06.844803', '2023-05-28 03:54:09.749261', 932, 'https://www.visitbrasil.com/wp-content/uploads/2021/08/Sao-Paulo-SP-Visit-Brasil-7-1-1024x683.jpg');
INSERT INTO public.tickets VALUES (5, 5, 2, 1, '2023-05-28 09:28:55.914381', '2023-06-02 01:02:13.153723', 974, 'https://www.melhoresdestinos.com.br/wp-content/uploads/2019/08/rio-de-janeiro-capa2019-01.jpg');
INSERT INTO public.tickets VALUES (6, 6, 2, 2, '2023-05-30 06:21:09.684531', '2023-05-26 21:14:59.958382', 336, 'https://www.melhoresdestinos.com.br/wp-content/uploads/2019/08/rio-de-janeiro-capa2019-01.jpg');
INSERT INTO public.tickets VALUES (8, 7, 2, 4, '2023-05-29 14:39:12.908479', '2023-06-04 10:10:45.471626', 181, 'https://www.melhoresdestinos.com.br/wp-content/uploads/2019/08/rio-de-janeiro-capa2019-01.jpg');


--
-- Name: airlines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.airlines_id_seq', 4, true);


--
-- Name: amenities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.amenities_id_seq', 6, true);


--
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cities_id_seq', 7, true);


--
-- Name: hotel_amenities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.hotel_amenities_id_seq', 42, true);


--
-- Name: hotels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.hotels_id_seq', 21, true);


--
-- Name: images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.images_id_seq', 21, true);


--
-- Name: tickets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tickets_id_seq', 10, true);


--
-- Name: airlines airlines_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.airlines
    ADD CONSTRAINT airlines_name_key UNIQUE (name);


--
-- Name: airlines airlines_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.airlines
    ADD CONSTRAINT airlines_pkey PRIMARY KEY (id);


--
-- Name: amenities amenities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.amenities
    ADD CONSTRAINT amenities_pkey PRIMARY KEY (id);


--
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- Name: hotel_amenities hotel_amenities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hotel_amenities
    ADD CONSTRAINT hotel_amenities_pkey PRIMARY KEY (id);


--
-- Name: hotels hotels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hotels
    ADD CONSTRAINT hotels_pkey PRIMARY KEY (id);


--
-- Name: images images_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.images
    ADD CONSTRAINT images_pkey PRIMARY KEY (id);


--
-- Name: tickets tickets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_pkey PRIMARY KEY (id);


--
-- Name: hotel_amenities hotel_amenities_amenity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hotel_amenities
    ADD CONSTRAINT hotel_amenities_amenity_id_fkey FOREIGN KEY (amenity_id) REFERENCES public.amenities(id);


--
-- Name: hotel_amenities hotel_amenities_hotel_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hotel_amenities
    ADD CONSTRAINT hotel_amenities_hotel_id_fkey FOREIGN KEY (hotel_id) REFERENCES public.hotels(id);


--
-- Name: hotels hotels_city_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hotels
    ADD CONSTRAINT hotels_city_id_fkey FOREIGN KEY (city_id) REFERENCES public.cities(id);


--
-- Name: images images_hotel_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.images
    ADD CONSTRAINT images_hotel_id_fkey FOREIGN KEY (hotel_id) REFERENCES public.hotels(id);


--
-- Name: tickets tickets_airline_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_airline_id_fkey FOREIGN KEY (airline_id) REFERENCES public.airlines(id);


--
-- Name: tickets tickets_destination_city_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_destination_city_id_fkey FOREIGN KEY (destination_city_id) REFERENCES public.cities(id);


--
-- Name: tickets tickets_origin_city_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_origin_city_id_fkey FOREIGN KEY (origin_city_id) REFERENCES public.cities(id);


--
-- PostgreSQL database dump complete
--

