--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

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
-- Data for Name: campus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.campus (idcampus, nombrecampus, direccioncampus) FROM stdin;
1	Campus Principal	Av. Central 1500
2	Campus Zona Norte	Calle del Conocimiento 250
\.


--
-- Data for Name: carreras; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.carreras (idcarrera, nombrecarrera, titulootorgado) FROM stdin;
2	Matemáticas Aplicadas	Licenciado en Matemáticas
3	Literatura Comparada	Licenciado en Literatura
\.


--
-- Data for Name: departamentos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.departamentos (iddepartamento, nombredepartamento, edificio) FROM stdin;
1	Ingeniería y Tecnología	Edificio Tecnológico
2	Ciencias Exactas	Edificio Científico
\.


--
-- Data for Name: cursos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cursos (idcurso, nombrecurso, descripcion, creditos, semestre, iddepartamento, idcampus) FROM stdin;
1	Programación I	Fundamentos de programación en Python	5	2024-1	1	1
2	Cálculo Diferencial	Fundamentos del cálculo diferencial con aplicaciones	5	2023-1	2	2
\.


--
-- Data for Name: profesores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profesores (idprofesor, nombre, apellido, titulo, iddepartamento, email) FROM stdin;
1	Ana María	García	PhD	1	anamaria.garcia@uni.edu
2	Carlos	López	PhD	2	carlos.lopez.m@uni.edu
\.


--
-- Data for Name: cursosprofesores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cursosprofesores (idcursoprofesor, idcurso, idprofesor) FROM stdin;
2	2	2
\.


--
-- Data for Name: estudiantes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estudiantes (idestudiante, nombre, apellido, fechanacimiento, direccion, email, idcarrera) FROM stdin;
2	Laura	Gómez	2001-03-22	Calle Estudiante 123	laura.gomez@est.uni.edu	\N
3	Pedro Antonio	Sánchez	1999-11-10	Boulevard Universitario 789	pedro.sanchez.2019@est.uni.edu	\N
\.


--
-- Data for Name: estudiantescarreras; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estudiantescarreras (idestudiantecarrera, idestudiante, idcarrera) FROM stdin;
2	2	2
3	3	3
\.


--
-- Data for Name: horarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.horarios (idhorario, idcurso, idaula, fechainicio, fechafin, horainicio, horafin) FROM stdin;
2	2	2	2024-01-15	2024-05-25	14:00:00	16:00:00
\.


--
-- Data for Name: inscripciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inscripciones (idinscripcion, idestudiante, idcurso, fechainscripcion, calificacion) FROM stdin;
2	2	2	2023-01-10	8.0
\.


--
-- Data for Name: programasestudio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.programasestudio (idprograma, nombreprograma, descripcionprograma) FROM stdin;
1	Programa de Ingeniería	Programa integral de ingenierías con enfoque en tecnologías modernas
2	Programa de Ciencias Básicas y Aplicadas	Abarca matemáticas y física avanzada
\.


--
-- Data for Name: programascursos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.programascursos (idprogramacurso, idprograma, idcurso) FROM stdin;
2	2	2
\.


--
-- Name: campus_idcampus_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.campus_idcampus_seq', 3, true);


--
-- Name: carreras_idcarrera_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.carreras_idcarrera_seq', 3, true);


--
-- Name: cursos_idcurso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cursos_idcurso_seq', 3, true);


--
-- Name: cursosprofesores_idcursoprofesor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cursosprofesores_idcursoprofesor_seq', 3, true);


--
-- Name: departamentos_iddepartamento_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.departamentos_iddepartamento_seq', 3, true);


--
-- Name: estudiantes_idestudiante_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estudiantes_idestudiante_seq', 3, true);


--
-- Name: estudiantescarreras_idestudiantecarrera_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estudiantescarreras_idestudiantecarrera_seq', 3, true);


--
-- Name: horarios_idhorario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.horarios_idhorario_seq', 3, true);


--
-- Name: inscripciones_idinscripcion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inscripciones_idinscripcion_seq', 3, true);


--
-- Name: profesores_idprofesor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.profesores_idprofesor_seq', 3, true);


--
-- Name: programascursos_idprogramacurso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.programascursos_idprogramacurso_seq', 3, true);


--
-- Name: programasestudio_idprograma_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.programasestudio_idprograma_seq', 3, true);


--
-- PostgreSQL database dump complete
--

