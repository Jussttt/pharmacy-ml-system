--
-- PostgreSQL database dump
--

\restrict 7M1qSuEOquwvKQBxY7gTVY8TYV9c5dmDGD5jefe2Naqy89qeZboMNpb9PX6TcJj

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

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

--
-- Data for Name: knex_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.knex_migrations (id, name, batch, migration_time) FROM stdin;
1	20260221185714_init_schema.js	1	2026-02-22 00:50:19.298+05:30
2	20260222060049_add_gst_fields_to_sales.js	2	2026-02-22 11:31:16.842+05:30
3	20260312171708_update_suppliers_table.js	3	2026-03-12 22:48:43.795+05:30
4	20260312171723_add_supplier_to_stock_batches.js	3	2026-03-12 22:48:43.854+05:30
5	20260312171734_create_purchase_orders.js	3	2026-03-12 22:48:43.998+05:30
6	20260313125809_add_user_status.js	4	2026-03-13 19:12:40.856+05:30
7	20260315020602_update_inventory_structure.js	5	2026-03-15 07:38:13.193+05:30
8	20260320141623_add-expired-to-alert-type.js	6	2026-03-20 19:48:10.889+05:30
9	20260320142146_add-batch-id-to-notifications.js	7	2026-03-20 19:52:20.563+05:30
10	20260322072516_add_alert_flags_to_stock_batches.js	8	2026-03-22 12:56:16.555+05:30
\.


--
-- Data for Name: knex_migrations_lock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.knex_migrations_lock (index, is_locked) FROM stdin;
1	0
\.


--
-- Data for Name: medicines; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.medicines (medicine_id, name, generic_name, atc_code, hsn_code, gst_rate, target_stock_days, expiry_alert_days, is_active, created_at, safety_stock) FROM stdin;
1	Voveran	Diclofenac	M01AB	30049099	12.00	30	60	t	2026-03-23 04:32:06.26952+05:30	50
2	Brufen	Ibuprofen	M01AE	30049099	12.00	30	60	t	2026-03-23 04:33:26.240644+05:30	40
3	Ecosprin	Aspirin	N02BA	30049099	12.00	30	60	t	2026-03-23 04:35:12.095408+05:30	30
4	Crocin	Paracetamol	N02BE	30049099	12.00	30	60	t	2026-03-23 04:35:12.095408+05:30	100
5	Alprax	Alprazolam	N05B	30049099	12.00	30	60	t	2026-03-23 04:35:12.095408+05:30	20
6	Zolfresh	Zolpidem	N05C	30049099	12.00	30	60	t	2026-03-23 04:35:12.095408+05:30	15
7	Asthalin	Salbutamol	R03	30049099	12.00	30	60	t	2026-03-23 04:35:12.095408+05:30	35
8	Cetzine	Cetirizine	R06	30049099	12.00	30	60	t	2026-03-23 04:35:12.095408+05:30	45
9	Dicloran	Diclofenac Sodium	M01AB	30049099	12.00	30	60	t	2026-03-24 18:16:33.680439+05:30	45
\.


--
-- Data for Name: suppliers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.suppliers (supplier_id, supplier_name, phone, email, is_active, created_at, contact_person, address, gst_number) FROM stdin;
1	MedPlus Distributors	9876543210	medplus.dist@gmail.com	t	2026-03-23 04:37:21.885901+05:30	Rahul Sharma	MG Road, Kochi, Kerala, 682016	32ABCDE1234F1Z5
2	HealthCare Pharma Supply	9123456780	healthcare.pharma@gmail.com	t	2026-03-23 04:38:00.213319+05:30	Anjali Nair	Thrissur Town, Kerala, 680001	32PQRSX5678L1Z2
3	Apollo Medical Agencies	9988776655	apollo.agencies@gmail.com	t	2026-03-23 04:38:00.213319+05:30	Arjun Menon	Calicut Road, Malappuram, Kerala, 676505	32LMNOP4321K1Z9
\.


--
-- Data for Name: medicine_suppliers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.medicine_suppliers (id, medicine_id, supplier_id, last_purchase_price, is_primary, lead_time_days) FROM stdin;
1	1	3	18.00	t	3
2	2	1	12.00	t	2
3	3	2	8.00	t	3
4	4	2	10.00	t	2
5	5	3	22.00	t	4
6	6	3	35.00	t	4
7	7	1	85.00	t	5
8	8	2	14.00	t	2
9	3	3	8.00	f	4
10	2	3	10.00	f	3
11	9	3	15.00	t	3
\.


--
-- Data for Name: stock_batches; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stock_batches (batch_id, medicine_id, batch_number, mfg_date, expiry_date, quantity, purchase_price, mrp, created_at, supplier_id, low_stock_alert_sent, expiry_risk_alert_sent, expired_alert_sent) FROM stdin;
2	1	DIC2026A	2025-01-01	2027-12-01	100	18.00	35.00	2026-03-23 04:53:23.931881+05:30	3	f	f	f
4	3	ASP2026C	2025-03-01	2028-02-01	80	8.00	18.00	2026-03-23 04:56:22.172461+05:30	2	f	f	f
6	6	ZOL2026F	2025-05-01	2028-04-01	39	35.00	70.00	2026-03-23 04:58:55.630172+05:30	3	f	f	f
8	8	CET2026H	2025-03-01	2028-02-01	88	14.00	30.00	2026-03-23 05:01:22.736672+05:30	2	f	f	f
5	4	PAR2026D	2025-01-01	2027-12-01	146	10.00	20.00	2026-03-23 04:57:26.478025+05:30	2	f	f	f
1	5	ALP2026E	2024-04-01	2028-03-01	49	22.00	45.00	2026-03-23 04:51:35.284927+05:30	3	f	f	f
9	7	ASTHIN-0924-X	2026-03-01	2027-03-01	20	85.00	160.00	2026-03-24 12:24:17.650468+05:30	1	t	f	f
11	2	ABB-BRF-7780	2026-03-01	2028-01-01	20	12.00	25.00	2026-03-24 12:54:28.779407+05:30	1	t	f	f
10	2	ABB-BRF-7789	2026-03-01	2028-01-24	10	12.00	25.00	2026-03-24 12:52:36.879461+05:30	1	t	f	f
12	4	CROCIN-1124-X	2026-03-01	2028-03-01	10	10.00	20.00	2026-03-24 12:59:33.360046+05:30	2	f	f	f
14	3	TR-ALI	2026-03-01	2028-01-01	80	8.00	18.00	2026-03-24 13:49:00.177941+05:30	2	f	f	f
15	2	ABNHRY	2026-03-01	2028-01-01	20	12.00	25.00	2026-03-24 13:55:45.770588+05:30	1	f	f	f
16	9	AKJKK	2026-03-01	2028-01-01	100	15.00	28.00	2026-03-24 18:19:14.239396+05:30	3	f	f	f
3	2	IBU2026B	2025-02-01	2028-01-01	118	12.00	25.00	2026-03-23 04:55:05.466398+05:30	1	f	f	f
13	4	10	2026-03-01	2027-11-01	9	10.00	20.00	2026-03-24 13:44:48.022575+05:30	2	f	f	f
7	7	SAL2026G	2025-02-01	2027-01-01	47	85.00	160.00	2026-03-23 05:00:07.012497+05:30	1	f	f	f
\.


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notifications (notification_id, medicine_id, supplier_id, alert_type, predicted_daily_velocity, reorder_point, suggested_quantity, is_resolved, created_at, batch_id) FROM stdin;
1	7	1	Low Stock	27.80	63	43	t	2026-03-24 12:30:18.601+05:30	9
2	2	1	Low Stock	8.40	49	29	t	2026-03-24 12:55:46.599+05:30	11
3	2	1	Low Stock	8.40	49	39	t	2026-03-24 12:55:46.649+05:30	10
4	5	3	Low Stock	33.27	54	5	t	2026-03-24 13:28:21.939+05:30	\N
7	5	3	Low Stock	33.27	54	5	t	2026-03-24 13:33:53.918+05:30	\N
6	5	3	Low Stock	33.27	54	5	t	2026-03-24 13:30:36.841+05:30	\N
5	5	3	Low Stock	33.27	54	5	t	2026-03-24 13:28:28.532+05:30	\N
8	5	3	Low Stock	33.27	54	5	t	2026-03-24 13:39:53.861+05:30	\N
9	5	3	Low Stock	33.27	54	5	f	2026-03-24 14:14:22.885+05:30	\N
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, username, password_hash, role, created_at, is_active) FROM stdin;
3	Parthan	$2b$10$sUJgw3rg5AXXe7y7R.bUheFvb6lRgnjD5yCT31g1YVfZBfi4mRBpC	Pharmacist	2026-03-24 12:40:10.18779+05:30	t
4	Jestin	$2b$10$fnFCPFDqiWf3SHk2uiokvulzH9Noh0Hk1sP8v9lao0p4xmCMaolyG	Pharmacist	2026-03-24 17:57:30.168235+05:30	t
5	ram	$2b$10$JcyAB9BG6KEKNAiKgnElc.oUes2j/zbgRm5CknYpG8XVdpg3sJgW6	Staff	2026-03-24 18:02:46.341612+05:30	t
1	Sagar	$2b$10$6wsjdid.JbPPHhVoOuYc.eUz7US6COWubhC3y6juE7kfJdtI0LKym	Owner	2026-03-23 04:28:18.561748+05:30	t
2	Akash	$2b$10$iBAsamSIOL7VAGTmjOn8oOD4FzGnafryRw8nP6.GDxGpRbn/A8LtS	Staff	2026-03-23 05:03:35.603576+05:30	t
6	jj	$2b$10$b/FavcM5vG5VgNJI2lU39.yTnPPlGLgqNhdw6NJjpmq1riBLL7yG6	Staff	2026-05-15 14:39:31.631469+05:30	t
\.


--
-- Data for Name: purchase_orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.purchase_orders (po_id, supplier_id, ordered_by, order_date, status, created_at) FROM stdin;
1	3	1	2026-03-23 04:44:07.610181+05:30	Delivered	2026-03-23 04:44:07.610181+05:30
3	3	1	2026-03-23 04:45:24.7867+05:30	Delivered	2026-03-23 04:45:24.7867+05:30
4	1	1	2026-03-23 04:45:49.654855+05:30	Delivered	2026-03-23 04:45:49.654855+05:30
6	2	1	2026-03-23 04:46:46.009202+05:30	Delivered	2026-03-23 04:46:46.009202+05:30
7	2	1	2026-03-23 04:47:05.432219+05:30	Delivered	2026-03-23 04:47:05.432219+05:30
2	3	1	2026-03-23 04:44:37.927336+05:30	Delivered	2026-03-23 04:44:37.927336+05:30
5	1	1	2026-03-23 04:46:15.071457+05:30	Delivered	2026-03-23 04:46:15.071457+05:30
8	2	1	2026-03-23 04:47:26.745751+05:30	Delivered	2026-03-23 04:47:26.745751+05:30
10	1	1	2026-03-24 12:20:58.101176+05:30	Delivered	2026-03-24 12:20:58.101176+05:30
9	1	1	2026-03-23 10:34:20.764868+05:30	Cancelled	2026-03-23 10:34:20.764868+05:30
11	1	1	2026-03-24 12:50:23.210869+05:30	Delivered	2026-03-24 12:50:23.210869+05:30
12	2	1	2026-03-24 12:58:41.728692+05:30	Delivered	2026-03-24 12:58:41.728692+05:30
13	2	1	2026-03-24 13:47:56.057514+05:30	Delivered	2026-03-24 13:47:56.057514+05:30
14	1	1	2026-03-24 13:54:54.502259+05:30	Delivered	2026-03-24 13:54:54.502259+05:30
15	3	3	2026-03-24 18:18:21.072816+05:30	Delivered	2026-03-24 18:18:21.072816+05:30
\.


--
-- Data for Name: purchase_order_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.purchase_order_items (item_id, po_id, medicine_id, quantity, unit_price, line_total) FROM stdin;
1	1	5	50	22.00	1100.00
2	2	6	40	35.00	1400.00
3	3	1	100	18.00	1800.00
4	4	2	120	18.00	2160.00
5	5	7	60	85.00	5100.00
6	6	3	80	8.00	640.00
7	7	4	150	10.00	1500.00
8	8	8	90	14.00	1260.00
9	9	2	5	45.00	225.00
10	10	7	20	85.00	1700.00
11	11	2	30	12.00	360.00
12	12	4	20	10.00	200.00
13	13	3	80	8.00	640.00
14	14	2	20	12.00	240.00
15	15	9	100	12.00	1200.00
\.


--
-- Data for Name: sales_master; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sales_master (invoice_id, user_id, sale_date, total_sale_amount, total_taxable_amount, total_gst_amount) FROM stdin;
1	1	2026-03-23 05:04:27.64974+05:30	40.00	35.72	4.28
2	1	2026-03-23 05:04:52.518451+05:30	230.00	205.36	24.64
3	1	2026-03-23 10:23:01.463497+05:30	80.00	71.44	8.56
4	1	2026-03-23 10:24:58.332863+05:30	25.00	22.32	2.68
5	1	2026-03-23 10:31:50.496326+05:30	20.00	17.86	2.14
6	1	2026-03-24 12:16:40.523186+05:30	365.00	325.90	39.10
7	1	2026-03-24 12:45:23.43781+05:30	480.00	428.58	51.42
8	1	2026-03-24 18:54:42.664853+05:30	345.00	308.04	36.96
9	1	2026-03-25 12:17:57.986303+05:30	180.00	160.72	19.28
\.


--
-- Data for Name: sales_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sales_items (item_id, invoice_id, medicine_id, batch_id, quantity, unit_price, gst_rate, taxable_amount, gst_amount, line_total) FROM stdin;
1	1	4	5	2	20.00	12.00	35.72	4.28	40.00
2	2	7	7	1	160.00	12.00	142.86	17.14	160.00
3	2	6	6	1	70.00	12.00	62.50	7.50	70.00
4	3	8	8	2	30.00	12.00	53.58	6.42	60.00
5	3	4	5	1	20.00	12.00	17.86	2.14	20.00
6	4	2	3	1	25.00	12.00	22.32	2.68	25.00
7	5	4	5	1	20.00	12.00	17.86	2.14	20.00
8	6	7	7	2	160.00	12.00	285.72	34.28	320.00
9	6	5	1	1	45.00	12.00	40.18	4.82	45.00
10	7	7	7	3	160.00	12.00	428.58	51.42	480.00
11	8	2	3	1	25.00	12.00	22.32	2.68	25.00
12	8	7	7	2	160.00	12.00	285.72	34.28	320.00
13	9	4	13	1	20.00	12.00	17.86	2.14	20.00
14	9	7	7	1	160.00	12.00	142.86	17.14	160.00
\.


--
-- Data for Name: stock_movements; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stock_movements (movement_id, batch_id, change_qty, reason, reference_id, created_at) FROM stdin;
1	1	50	Purchase	1	2026-03-23 04:51:35.284927+05:30
2	2	100	Purchase	3	2026-03-23 04:53:23.931881+05:30
3	3	120	Purchase	4	2026-03-23 04:55:05.466398+05:30
4	4	80	Purchase	6	2026-03-23 04:56:22.172461+05:30
5	5	150	Purchase	7	2026-03-23 04:57:26.478025+05:30
6	6	40	Purchase	2	2026-03-23 04:58:55.630172+05:30
7	7	60	Purchase	5	2026-03-23 05:00:07.012497+05:30
8	8	90	Purchase	8	2026-03-23 05:01:22.736672+05:30
9	5	-2	Sale	1	2026-03-23 05:04:27.64974+05:30
10	7	-1	Sale	2	2026-03-23 05:04:52.518451+05:30
11	6	-1	Sale	2	2026-03-23 05:04:52.518451+05:30
12	8	-2	Sale	3	2026-03-23 10:23:01.463497+05:30
13	5	-1	Sale	3	2026-03-23 10:23:01.463497+05:30
14	3	-1	Sale	4	2026-03-23 10:24:58.332863+05:30
15	5	-1	Sale	5	2026-03-23 10:31:50.496326+05:30
16	7	-2	Sale	6	2026-03-24 12:16:40.523186+05:30
17	1	-1	Sale	6	2026-03-24 12:16:40.523186+05:30
18	7	1	Adjustment	\N	2026-03-24 12:18:07.887182+05:30
19	9	20	Purchase	10	2026-03-24 12:24:17.650468+05:30
20	7	-3	Sale	7	2026-03-24 12:45:23.43781+05:30
21	7	-5	Adjustment	\N	2026-03-24 12:46:53.169237+05:30
22	10	10	Purchase	11	2026-03-24 12:52:36.879461+05:30
23	11	20	Purchase	11	2026-03-24 12:54:28.779407+05:30
24	12	10	Purchase	12	2026-03-24 12:59:33.360046+05:30
25	13	10	Purchase	12	2026-03-24 13:44:48.022575+05:30
26	14	80	Purchase	13	2026-03-24 13:49:00.177941+05:30
27	15	20	Purchase	14	2026-03-24 13:55:45.770588+05:30
28	16	100	Purchase	15	2026-03-24 18:19:14.239396+05:30
29	3	-1	Sale	8	2026-03-24 18:54:42.664853+05:30
30	7	-2	Sale	8	2026-03-24 18:54:42.664853+05:30
31	13	-1	Sale	9	2026-03-25 12:17:57.986303+05:30
32	7	-1	Sale	9	2026-03-25 12:17:57.986303+05:30
\.


--
-- Name: knex_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.knex_migrations_id_seq', 10, true);


--
-- Name: knex_migrations_lock_index_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.knex_migrations_lock_index_seq', 1, true);


--
-- Name: medicine_suppliers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.medicine_suppliers_id_seq', 11, true);


--
-- Name: medicines_medicine_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.medicines_medicine_id_seq', 9, true);


--
-- Name: notifications_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notifications_notification_id_seq', 9, true);


--
-- Name: purchase_order_items_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.purchase_order_items_item_id_seq', 15, true);


--
-- Name: purchase_orders_po_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.purchase_orders_po_id_seq', 15, true);


--
-- Name: sales_items_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sales_items_item_id_seq', 14, true);


--
-- Name: sales_master_invoice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sales_master_invoice_id_seq', 9, true);


--
-- Name: stock_batches_batch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stock_batches_batch_id_seq', 16, true);


--
-- Name: stock_movements_movement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stock_movements_movement_id_seq', 32, true);


--
-- Name: suppliers_supplier_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.suppliers_supplier_id_seq', 3, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 6, true);


--
-- PostgreSQL database dump complete
--

\unrestrict 7M1qSuEOquwvKQBxY7gTVY8TYV9c5dmDGD5jefe2Naqy89qeZboMNpb9PX6TcJj

