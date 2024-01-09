--
-- TOC entry 3101 (class 0 OID 17242)
-- Dependencies: 200
-- Data for Name: AttestationTypes; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."AttestationTypes" VALUES ('f5fd2eb1-eeed-4bc4-b8bc-ee8493f22a5b', 'зачет');
INSERT INTO public."AttestationTypes" VALUES ('8f9e31ec-f3cc-4b68-ac34-a78740b822d5', 'экзамен');


--
-- TOC entry 3102 (class 0 OID 17250)
-- Dependencies: 201
-- Data for Name: EducationalForms; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."EducationalForms" VALUES ('c6ca522a-09a2-4d33-ad85-14bc3c9b96c5', 'заочная');
INSERT INTO public."EducationalForms" VALUES ('91b9d4e8-a93b-49f3-95bf-a7aff27df61b', 'очная');


--
-- TOC entry 3109 (class 0 OID 17303)
-- Dependencies: 208
-- Data for Name: Groups; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Groups" VALUES ('8c80c3dc-6b7c-4606-8be0-65dedfee0253', 'ОПАСУ-2', 'ab02864d-be6b-48df-8379-2360ca16879a', 'c6ca522a-09a2-4d33-ad85-14bc3c9b96c5');
INSERT INTO public."Groups" VALUES ('1e533562-7d84-4bc4-9301-a043e2f2e789', 'ОПАСУ-1', '5afa3614-927a-441b-867d-bd8314909aa6', '91b9d4e8-a93b-49f3-95bf-a7aff27df61b');


--
-- TOC entry 3110 (class 0 OID 17321)
-- Dependencies: 209
-- Data for Name: LessonForms; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."LessonForms" VALUES ('094d6faf-4b11-47ea-9340-a1f47d036b65', '328ae016-3903-4c4f-b368-50b00466f3e5', '3fa85f64-5717-4562-b3fc-2c963f66afa6', 35);
INSERT INTO public."LessonForms" VALUES ('23e64553-b525-4788-a065-e72cddf4b07f', 'c9b5002c-32fc-4b36-9cb8-327409e5d66f', '11c87747-3430-4a1a-948e-62ac7efc8ca5', 40);


--
-- TOC entry 3103 (class 0 OID 17258)
-- Dependencies: 202
-- Data for Name: LessonTypes; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."LessonTypes" VALUES ('328ae016-3903-4c4f-b368-50b00466f3e5', 'практическое занятие');
INSERT INTO public."LessonTypes" VALUES ('c9b5002c-32fc-4b36-9cb8-327409e5d66f', 'лекция');


--
-- TOC entry 3113 (class 0 OID 17374)
-- Dependencies: 212
-- Data for Name: Lessons; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Lessons" VALUES ('741face3-85f7-40ea-9bdd-240fa48f02a5', '2023-09-04', '5afa3614-927a-441b-867d-bd8314909aa6', 'Матрица', '64e29027-f03f-47b9-b7f7-a2efc1fa97dd');
INSERT INTO public."Lessons" VALUES ('cd85f2e6-faec-4c5e-90b4-7edc521e5a42', '2023-09-01', '5afa3614-927a-441b-867d-bd8314909aa6', 'Комплексные числа', '64e29027-f03f-47b9-b7f7-a2efc1fa97dd');
INSERT INTO public."Lessons" VALUES ('50a750c6-9d75-438e-9ab1-0b21b29d90ef', '2023-12-15', '115315bb-dd4c-4a01-a03a-0b1460884a3d', 'к/п', '64e29027-f03f-47b9-b7f7-a2efc1fa97dd');
INSERT INTO public."Lessons" VALUES ('f9b0a734-e0ec-4f7f-8f90-02bc705b5310', '2024-01-09', '115315bb-dd4c-4a01-a03a-0b1460884a3d', 'экзамен', '64e29027-f03f-47b9-b7f7-a2efc1fa97dd');
INSERT INTO public."Lessons" VALUES ('4bc8415b-5ad5-459b-8405-a19e0331a579', '2023-09-01', '115315bb-dd4c-4a01-a03a-0b1460884a3d', 'Комплексные числа', '09f22edd-01c7-4e77-8785-d0dca6b4f8ec');
INSERT INTO public."Lessons" VALUES ('ec21d9f7-e145-4fbc-b229-0ec0534e25d6', '2024-01-18', '5afa3614-927a-441b-867d-bd8314909aa6', 'экзамен', '6866bd84-6a1a-4db0-9785-b436f0c3f803');
INSERT INTO public."Lessons" VALUES ('7b97379b-2598-42a3-b701-af1eae827006', '2023-09-03', '5afa3614-927a-441b-867d-bd8314909aa6', 'Предлоги 123', '6866bd84-6a1a-4db0-9785-b436f0c3f803');


--
-- TOC entry 3104 (class 0 OID 17266)
-- Dependencies: 203
-- Data for Name: Marks; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Marks" VALUES ('e2fb9cef-4b04-40f3-b251-56b5f3189ece', '+', 'присутствие (без оценки)');
INSERT INTO public."Marks" VALUES ('ce98ef88-66d3-44af-b0a4-1213ea3628e2', 'Н', 'отсутствие');
INSERT INTO public."Marks" VALUES ('2a95b81a-6cbb-4275-8f65-426b8549c0eb', '2', 'неудовлетворительно');
INSERT INTO public."Marks" VALUES ('5efead35-7285-4c43-a4c3-eaa000b7e9a7', '3', 'удовлетворительно');
INSERT INTO public."Marks" VALUES ('8bd69bf0-fffe-4706-bf19-7e1850dece3b', '4', 'хорошо');
INSERT INTO public."Marks" VALUES ('9e77b05a-3341-4cc2-9978-9be9de280c54', '5', 'отлично');


--
-- TOC entry 3105 (class 0 OID 17274)
-- Dependencies: 204
-- Data for Name: Schedules; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Schedules" VALUES ('5afa3614-927a-441b-867d-bd8314909aa6', 2, '10:00:00', '11:35:00');
INSERT INTO public."Schedules" VALUES ('115315bb-dd4c-4a01-a03a-0b1460884a3d', 1, '08:00:00', '09:35:00');


--
-- TOC entry 3106 (class 0 OID 17279)
-- Dependencies: 205
-- Data for Name: Specializations; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Specializations" VALUES ('dc6dadd2-2f87-4dfd-94d9-aa7b313f8262', '46.04.01', 'История');
INSERT INTO public."Specializations" VALUES ('5afa3614-927a-441b-867d-bd8314909aa6', '09.03.01', 'Информатика и вычислительная техника');
INSERT INTO public."Specializations" VALUES ('ab02864d-be6b-48df-8379-2360ca16879a', '01.03.02', 'Прикладная математика и информатика');


--
-- TOC entry 3111 (class 0 OID 17336)
-- Dependencies: 210
-- Data for Name: Students; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Students" VALUES ('7f5c4eab-f0e2-40ae-997b-5e7fad7233e7', 'Максим', 'Клещенок', 'Сергеевич', '2000-07-01', '8c80c3dc-6b7c-4606-8be0-65dedfee0253', 100006, false);
INSERT INTO public."Students" VALUES ('aa1af087-9baa-4345-abce-a210856b1e9d', 'Олег', 'Иванов', 'Петрович', '2000-06-01', '8c80c3dc-6b7c-4606-8be0-65dedfee0253', 100005, false);
INSERT INTO public."Students" VALUES ('99a9e352-4ee4-4559-89b2-5bbe12de0be6', 'Тарас', 'Брус', 'Вадимович', '2000-05-01', '8c80c3dc-6b7c-4606-8be0-65dedfee0253', 100004, true);
INSERT INTO public."Students" VALUES ('c80f1e72-da37-478c-b3ae-f720b00ff57c', 'Алена', 'Филиппова', 'Олеговна', '2000-04-01', '1e533562-7d84-4bc4-9301-a043e2f2e789', 100003, true);
INSERT INTO public."Students" VALUES ('d41c3d85-0cce-4918-9980-85e4512d0430', 'Ксения', 'Соболева', 'Сергеевна', '2000-03-01', '1e533562-7d84-4bc4-9301-a043e2f2e789', 100002, false);
INSERT INTO public."Students" VALUES ('9a2ea651-fb0f-4a56-8869-26a4c25e357d', 'Александр', 'Махоткин', 'Павлович', '2000-02-01', '1e533562-7d84-4bc4-9301-a043e2f2e789', 100001, false);
INSERT INTO public."Students" VALUES ('0c5127a1-108c-4783-88d4-185f599a5a24', 'Екатерина', 'Иванова', 'Сергеевна', '2000-01-01', '1e533562-7d84-4bc4-9301-a043e2f2e789', 100000, false);


--
-- TOC entry 3107 (class 0 OID 17287)
-- Dependencies: 206
-- Data for Name: Subjects; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Subjects" VALUES ('1128edb1-baa5-4116-8f22-d87f51b25876', 'высшая математика');
INSERT INTO public."Subjects" VALUES ('199684cb-2b47-4611-b337-06d0810ce5cd', 'английский язык');
INSERT INTO public."Subjects" VALUES ('4eb530b7-2890-4e9e-8cb6-508e0cbe2162', 'физическая культура');
INSERT INTO public."Subjects" VALUES ('1c382dd8-d768-4085-9712-423e3d6d9791', 'история');


--
-- TOC entry 3108 (class 0 OID 17295)
-- Dependencies: 207
-- Data for Name: Teachers; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Teachers" VALUES ('11c87747-3430-4a1a-948e-62ac7efc8ca5', 'Анна', 'Сидорова', 'Ивановна', 'старший преподаватель');
INSERT INTO public."Teachers" VALUES ('3fa85f64-5717-4562-b3fc-2c963f66afa6', 'Петр', 'Петров', 'Петрович', 'старший преподаватель');
INSERT INTO public."Teachers" VALUES ('3fa85f64-5717-4562-b3fc-2c963f66af55', 'Иван', 'Иванов', 'Иванович', 'зав. кафедрой');


--
-- TOC entry 3112 (class 0 OID 17349)
-- Dependencies: 211
-- Data for Name: Teachings; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Teachings" VALUES ('09f22edd-01c7-4e77-8785-d0dca6b4f8ec', '1128edb1-baa5-4116-8f22-d87f51b25876', '1e533562-7d84-4bc4-9301-a043e2f2e789', '8f9e31ec-f3cc-4b68-ac34-a78740b822d5', 1, false, '094d6faf-4b11-47ea-9340-a1f47d036b65');
INSERT INTO public."Teachings" VALUES ('6866bd84-6a1a-4db0-9785-b436f0c3f803', '199684cb-2b47-4611-b337-06d0810ce5cd', '1e533562-7d84-4bc4-9301-a043e2f2e789', '8f9e31ec-f3cc-4b68-ac34-a78740b822d5', 1, false, '094d6faf-4b11-47ea-9340-a1f47d036b65');
INSERT INTO public."Teachings" VALUES ('64e29027-f03f-47b9-b7f7-a2efc1fa97dd', '1128edb1-baa5-4116-8f22-d87f51b25876', '1e533562-7d84-4bc4-9301-a043e2f2e789', '8f9e31ec-f3cc-4b68-ac34-a78740b822d5', 1, true, '23e64553-b525-4788-a065-e72cddf4b07f');

