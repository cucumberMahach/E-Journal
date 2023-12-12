--
-- PostgreSQL database dump
--

-- Dumped from database version 13.13 (Debian 13.13-0+deb11u1)
-- Dumped by pg_dump version 15.2

-- Started on 2023-12-10 20:38:57

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
-- TOC entry 3107 (class 0 OID 17052)
-- Dependencies: 200
-- Data for Name: AttestationTypes; Type: TABLE DATA; Schema: public; Owner: pupa
--

INSERT INTO public."AttestationTypes" ("Id", "Name") VALUES ('f5fd2eb1-eeed-4bc4-b8bc-ee8493f22a5b', 'зачет');
INSERT INTO public."AttestationTypes" ("Id", "Name") VALUES ('8f9e31ec-f3cc-4b68-ac34-a78740b822d5', 'экзамен');


--
-- TOC entry 3108 (class 0 OID 17060)
-- Dependencies: 201
-- Data for Name: EducationalForms; Type: TABLE DATA; Schema: public; Owner: pupa
--

INSERT INTO public."EducationalForms" ("Id", "Name") VALUES ('c6ca522a-09a2-4d33-ad85-14bc3c9b96c5', 'заочная');
INSERT INTO public."EducationalForms" ("Id", "Name") VALUES ('91b9d4e8-a93b-49f3-95bf-a7aff27df61b', 'очная');


--
-- TOC entry 3112 (class 0 OID 17089)
-- Dependencies: 205
-- Data for Name: Specializations; Type: TABLE DATA; Schema: public; Owner: pupa
--

INSERT INTO public."Specializations" ("Id", "Code", "Name") VALUES ('dc6dadd2-2f87-4dfd-94d9-aa7b313f8262', '46.04.01', 'История');
INSERT INTO public."Specializations" ("Id", "Code", "Name") VALUES ('5afa3614-927a-441b-867d-bd8314909aa6', '09.03.01', 'Информатика и вычислительная техника');
INSERT INTO public."Specializations" ("Id", "Code", "Name") VALUES ('ab02864d-be6b-48df-8379-2360ca16879a', '01.03.02', 'Прикладная математика и информатика');


--
-- TOC entry 3115 (class 0 OID 17113)
-- Dependencies: 208
-- Data for Name: Groups; Type: TABLE DATA; Schema: public; Owner: pupa
--

INSERT INTO public."Groups" ("Id", "Number", "SpecializationId", "EducationalFormId") VALUES ('8c80c3dc-6b7c-4606-8be0-65dedfee0253', 'ОПАСУ-2', 'ab02864d-be6b-48df-8379-2360ca16879a', 'c6ca522a-09a2-4d33-ad85-14bc3c9b96c5');
INSERT INTO public."Groups" ("Id", "Number", "SpecializationId", "EducationalFormId") VALUES ('1e533562-7d84-4bc4-9301-a043e2f2e789', 'ОПАСУ-1', '5afa3614-927a-441b-867d-bd8314909aa6', '91b9d4e8-a93b-49f3-95bf-a7aff27df61b');


--
-- TOC entry 3109 (class 0 OID 17068)
-- Dependencies: 202
-- Data for Name: LessonTypes; Type: TABLE DATA; Schema: public; Owner: pupa
--

INSERT INTO public."LessonTypes" ("Id", "Name") VALUES ('328ae016-3903-4c4f-b368-50b00466f3e5', 'практическое занятие');
INSERT INTO public."LessonTypes" ("Id", "Name") VALUES ('c9b5002c-32fc-4b36-9cb8-327409e5d66f', 'лекция');


--
-- TOC entry 3114 (class 0 OID 17105)
-- Dependencies: 207
-- Data for Name: Teachers; Type: TABLE DATA; Schema: public; Owner: pupa
--

INSERT INTO public."Teachers" ("Id", "FirstName", "LastName", "Patronymic", "Post") VALUES ('3fa85f64-5717-4562-b3fc-2c963f66afa6', 'Петр', 'Петров', 'Петрович', 'старший преподаватель');
INSERT INTO public."Teachers" ("Id", "FirstName", "LastName", "Patronymic", "Post") VALUES ('3fa85f64-5717-4562-b3fc-2c963f66af55', 'Иван', 'Иванов', 'Иванович', 'зав. кафедрой');
INSERT INTO public."Teachers" ("Id", "FirstName", "LastName", "Patronymic", "Post") VALUES ('11c87747-3430-4a1a-948e-62ac7efc8ca5', 'Анна', 'Ивановна', 'Сидорова', 'старший преподаватель');


--
-- TOC entry 3116 (class 0 OID 17131)
-- Dependencies: 209
-- Data for Name: LessonForms; Type: TABLE DATA; Schema: public; Owner: pupa
--

INSERT INTO public."LessonForms" ("Id", "LessonTypeId", "TeacherId", "Hours") VALUES ('094d6faf-4b11-47ea-9340-a1f47d036b65', '328ae016-3903-4c4f-b368-50b00466f3e5', '3fa85f64-5717-4562-b3fc-2c963f66afa6', 35);
INSERT INTO public."LessonForms" ("Id", "LessonTypeId", "TeacherId", "Hours") VALUES ('23e64553-b525-4788-a065-e72cddf4b07f', 'c9b5002c-32fc-4b36-9cb8-327409e5d66f', '11c87747-3430-4a1a-948e-62ac7efc8ca5', 40);


--
-- TOC entry 3111 (class 0 OID 17084)
-- Dependencies: 204
-- Data for Name: Schedules; Type: TABLE DATA; Schema: public; Owner: pupa
--

INSERT INTO public."Schedules" ("Id", "Number", "StartTime", "EndTime") VALUES ('5afa3614-927a-441b-867d-bd8314909aa6', 2, '10:00:00', '11:35:00');
INSERT INTO public."Schedules" ("Id", "Number", "StartTime", "EndTime") VALUES ('115315bb-dd4c-4a01-a03a-0b1460884a3d', 1, '08:00:00', '09:35:00');


--
-- TOC entry 3113 (class 0 OID 17097)
-- Dependencies: 206
-- Data for Name: Subjects; Type: TABLE DATA; Schema: public; Owner: pupa
--

INSERT INTO public."Subjects" ("Id", "Name") VALUES ('1128edb1-baa5-4116-8f22-d87f51b25876', 'высшая математика');
INSERT INTO public."Subjects" ("Id", "Name") VALUES ('199684cb-2b47-4611-b337-06d0810ce5cd', 'английский язык');
INSERT INTO public."Subjects" ("Id", "Name") VALUES ('4eb530b7-2890-4e9e-8cb6-508e0cbe2162', 'физическая культура');
INSERT INTO public."Subjects" ("Id", "Name") VALUES ('1c382dd8-d768-4085-9712-423e3d6d9791', 'история');


--
-- TOC entry 3118 (class 0 OID 17159)
-- Dependencies: 211
-- Data for Name: Teachings; Type: TABLE DATA; Schema: public; Owner: pupa
--

INSERT INTO public."Teachings" ("Id", "SubjectId", "GroupId", "AttestationTypeId", "Term", "TermProject", "LessonFormId") VALUES ('64e29027-f03f-47b9-b7f7-a2efc1fa97dd', '1128edb1-baa5-4116-8f22-d87f51b25876', '1e533562-7d84-4bc4-9301-a043e2f2e789', '8f9e31ec-f3cc-4b68-ac34-a78740b822d5', 1, false, '23e64553-b525-4788-a065-e72cddf4b07f');
INSERT INTO public."Teachings" ("Id", "SubjectId", "GroupId", "AttestationTypeId", "Term", "TermProject", "LessonFormId") VALUES ('09f22edd-01c7-4e77-8785-d0dca6b4f8ec', '1128edb1-baa5-4116-8f22-d87f51b25876', '1e533562-7d84-4bc4-9301-a043e2f2e789', '8f9e31ec-f3cc-4b68-ac34-a78740b822d5', 1, false, '094d6faf-4b11-47ea-9340-a1f47d036b65');
INSERT INTO public."Teachings" ("Id", "SubjectId", "GroupId", "AttestationTypeId", "Term", "TermProject", "LessonFormId") VALUES ('6866bd84-6a1a-4db0-9785-b436f0c3f803', '199684cb-2b47-4611-b337-06d0810ce5cd', '1e533562-7d84-4bc4-9301-a043e2f2e789', '8f9e31ec-f3cc-4b68-ac34-a78740b822d5', 1, false, '094d6faf-4b11-47ea-9340-a1f47d036b65');


--
-- TOC entry 3119 (class 0 OID 17184)
-- Dependencies: 212
-- Data for Name: Lessons; Type: TABLE DATA; Schema: public; Owner: pupa
--

INSERT INTO public."Lessons" ("Id", "Date", "ScheduleId", "Topic", "TeachingId") VALUES ('cd85f2e6-faec-4c5e-90b4-7edc521e5a42', '2023-09-01', '5afa3614-927a-441b-867d-bd8314909aa6', 'Комплексные числа', '64e29027-f03f-47b9-b7f7-a2efc1fa97dd');
INSERT INTO public."Lessons" ("Id", "Date", "ScheduleId", "Topic", "TeachingId") VALUES ('4bc8415b-5ad5-459b-8405-a19e0331a579', '2023-09-01', '115315bb-dd4c-4a01-a03a-0b1460884a3d', 'Комплексные числа', '09f22edd-01c7-4e77-8785-d0dca6b4f8ec');
INSERT INTO public."Lessons" ("Id", "Date", "ScheduleId", "Topic", "TeachingId") VALUES ('7b97379b-2598-42a3-b701-af1eae827006', '2023-09-03', '5afa3614-927a-441b-867d-bd8314909aa6', 'Предлоги', '6866bd84-6a1a-4db0-9785-b436f0c3f803');
INSERT INTO public."Lessons" ("Id", "Date", "ScheduleId", "Topic", "TeachingId") VALUES ('741face3-85f7-40ea-9bdd-240fa48f02a5', '2023-09-04', '5afa3614-927a-441b-867d-bd8314909aa6', 'Матрица', '64e29027-f03f-47b9-b7f7-a2efc1fa97dd');


--
-- TOC entry 3110 (class 0 OID 17076)
-- Dependencies: 203
-- Data for Name: Marks; Type: TABLE DATA; Schema: public; Owner: pupa
--

INSERT INTO public."Marks" ("Id", "Code", "Description") VALUES ('e2fb9cef-4b04-40f3-b251-56b5f3189ece', '+', 'присутствие (без оценки)');
INSERT INTO public."Marks" ("Id", "Code", "Description") VALUES ('ce98ef88-66d3-44af-b0a4-1213ea3628e2', 'Н', 'отсутствие');
INSERT INTO public."Marks" ("Id", "Code", "Description") VALUES ('2a95b81a-6cbb-4275-8f65-426b8549c0eb', '2', 'неудовлетворительно');
INSERT INTO public."Marks" ("Id", "Code", "Description") VALUES ('5efead35-7285-4c43-a4c3-eaa000b7e9a7', '3', 'удовлетворительно');
INSERT INTO public."Marks" ("Id", "Code", "Description") VALUES ('8bd69bf0-fffe-4706-bf19-7e1850dece3b', '4', 'хорошо');
INSERT INTO public."Marks" ("Id", "Code", "Description") VALUES ('9e77b05a-3341-4cc2-9978-9be9de280c54', '5', 'отлично');


--
-- TOC entry 3117 (class 0 OID 17146)
-- Dependencies: 210
-- Data for Name: Students; Type: TABLE DATA; Schema: public; Owner: pupa
--

INSERT INTO public."Students" ("Id", "FirstName", "LastName", "Patronymic", "BirthDate", "GroupId", "IdCard", "IsBoss") VALUES ('7f5c4eab-f0e2-40ae-997b-5e7fad7233e7', 'Максим', 'Клещенок', 'Сергеевич', '2000-07-01', '8c80c3dc-6b7c-4606-8be0-65dedfee0253', 100006, false);
INSERT INTO public."Students" ("Id", "FirstName", "LastName", "Patronymic", "BirthDate", "GroupId", "IdCard", "IsBoss") VALUES ('aa1af087-9baa-4345-abce-a210856b1e9d', 'Олег', 'Иванов', 'Петрович', '2000-06-01', '8c80c3dc-6b7c-4606-8be0-65dedfee0253', 100005, false);
INSERT INTO public."Students" ("Id", "FirstName", "LastName", "Patronymic", "BirthDate", "GroupId", "IdCard", "IsBoss") VALUES ('99a9e352-4ee4-4559-89b2-5bbe12de0be6', 'Тарас', 'Брус', 'Вадимович', '2000-05-01', '8c80c3dc-6b7c-4606-8be0-65dedfee0253', 100004, true);
INSERT INTO public."Students" ("Id", "FirstName", "LastName", "Patronymic", "BirthDate", "GroupId", "IdCard", "IsBoss") VALUES ('c80f1e72-da37-478c-b3ae-f720b00ff57c', 'Алена', 'Филиппова', 'Олеговна', '2000-04-01', '1e533562-7d84-4bc4-9301-a043e2f2e789', 100003, true);
INSERT INTO public."Students" ("Id", "FirstName", "LastName", "Patronymic", "BirthDate", "GroupId", "IdCard", "IsBoss") VALUES ('d41c3d85-0cce-4918-9980-85e4512d0430', 'Ксения', 'Соболева', 'Сергеевна', '2000-03-01', '1e533562-7d84-4bc4-9301-a043e2f2e789', 100002, false);
INSERT INTO public."Students" ("Id", "FirstName", "LastName", "Patronymic", "BirthDate", "GroupId", "IdCard", "IsBoss") VALUES ('9a2ea651-fb0f-4a56-8869-26a4c25e357d', 'Александр', 'Махоткин', 'Павлович', '2000-02-01', '1e533562-7d84-4bc4-9301-a043e2f2e789', 100001, false);
INSERT INTO public."Students" ("Id", "FirstName", "LastName", "Patronymic", "BirthDate", "GroupId", "IdCard", "IsBoss") VALUES ('0c5127a1-108c-4783-88d4-185f599a5a24', 'Екатерина', 'Иванова', 'Сергеевна', '2000-01-01', '1e533562-7d84-4bc4-9301-a043e2f2e789', 100000, false);


--
-- TOC entry 3120 (class 0 OID 17202)
-- Dependencies: 213
-- Data for Name: Attends; Type: TABLE DATA; Schema: public; Owner: pupa
--

INSERT INTO public."Attends" ("Id", "StudentId", "MarkId", "LessonId") VALUES ('50a83ef6-3a13-4b5d-8656-d3d6f3d0baa6', '9a2ea651-fb0f-4a56-8869-26a4c25e357d', 'e2fb9cef-4b04-40f3-b251-56b5f3189ece', 'cd85f2e6-faec-4c5e-90b4-7edc521e5a42');
INSERT INTO public."Attends" ("Id", "StudentId", "MarkId", "LessonId") VALUES ('6499e15f-ba9c-4605-b2f3-7c55637cb67c', '0c5127a1-108c-4783-88d4-185f599a5a24', 'e2fb9cef-4b04-40f3-b251-56b5f3189ece', '4bc8415b-5ad5-459b-8405-a19e0331a579');
INSERT INTO public."Attends" ("Id", "StudentId", "MarkId", "LessonId") VALUES ('83e66552-3bce-4d1a-af85-14aade7128c1', '9a2ea651-fb0f-4a56-8869-26a4c25e357d', 'e2fb9cef-4b04-40f3-b251-56b5f3189ece', '4bc8415b-5ad5-459b-8405-a19e0331a579');
INSERT INTO public."Attends" ("Id", "StudentId", "MarkId", "LessonId") VALUES ('c1131bd4-8b99-4b37-a99d-0dbce7ff5475', 'd41c3d85-0cce-4918-9980-85e4512d0430', 'e2fb9cef-4b04-40f3-b251-56b5f3189ece', 'cd85f2e6-faec-4c5e-90b4-7edc521e5a42');
INSERT INTO public."Attends" ("Id", "StudentId", "MarkId", "LessonId") VALUES ('c559b7cf-e396-44fe-8999-f9a06bf6f65a', 'd41c3d85-0cce-4918-9980-85e4512d0430', 'e2fb9cef-4b04-40f3-b251-56b5f3189ece', '4bc8415b-5ad5-459b-8405-a19e0331a579');
INSERT INTO public."Attends" ("Id", "StudentId", "MarkId", "LessonId") VALUES ('c7e3396a-f569-448f-b413-fad32b4e1a06', 'c80f1e72-da37-478c-b3ae-f720b00ff57c', 'e2fb9cef-4b04-40f3-b251-56b5f3189ece', 'cd85f2e6-faec-4c5e-90b4-7edc521e5a42');
INSERT INTO public."Attends" ("Id", "StudentId", "MarkId", "LessonId") VALUES ('d660eedc-e90e-47f2-b0d3-09fe825817a5', 'c80f1e72-da37-478c-b3ae-f720b00ff57c', 'e2fb9cef-4b04-40f3-b251-56b5f3189ece', '4bc8415b-5ad5-459b-8405-a19e0331a579');
INSERT INTO public."Attends" ("Id", "StudentId", "MarkId", "LessonId") VALUES ('f8055b1f-9114-4006-9eb4-492515d7b424', '0c5127a1-108c-4783-88d4-185f599a5a24', 'e2fb9cef-4b04-40f3-b251-56b5f3189ece', 'cd85f2e6-faec-4c5e-90b4-7edc521e5a42');
INSERT INTO public."Attends" ("Id", "StudentId", "MarkId", "LessonId") VALUES ('9907f551-6b01-40d6-bae8-0c0cbf53edc7', '9a2ea651-fb0f-4a56-8869-26a4c25e357d', 'e2fb9cef-4b04-40f3-b251-56b5f3189ece', '7b97379b-2598-42a3-b701-af1eae827006');
INSERT INTO public."Attends" ("Id", "StudentId", "MarkId", "LessonId") VALUES ('a1f5cab9-5712-4d7e-91f3-b300c634cfdb', 'd41c3d85-0cce-4918-9980-85e4512d0430', 'e2fb9cef-4b04-40f3-b251-56b5f3189ece', '7b97379b-2598-42a3-b701-af1eae827006');
INSERT INTO public."Attends" ("Id", "StudentId", "MarkId", "LessonId") VALUES ('bd1affe8-2706-4110-851a-6087580141da', 'c80f1e72-da37-478c-b3ae-f720b00ff57c', 'e2fb9cef-4b04-40f3-b251-56b5f3189ece', '7b97379b-2598-42a3-b701-af1eae827006');
INSERT INTO public."Attends" ("Id", "StudentId", "MarkId", "LessonId") VALUES ('e13111dd-a9e6-4c75-b58e-417ced64cc4d', '0c5127a1-108c-4783-88d4-185f599a5a24', 'e2fb9cef-4b04-40f3-b251-56b5f3189ece', '7b97379b-2598-42a3-b701-af1eae827006');
INSERT INTO public."Attends" ("Id", "StudentId", "MarkId", "LessonId") VALUES ('950456ec-8668-43d5-8d52-49d5cfd314a5', 'c80f1e72-da37-478c-b3ae-f720b00ff57c', 'e2fb9cef-4b04-40f3-b251-56b5f3189ece', '741face3-85f7-40ea-9bdd-240fa48f02a5');
INSERT INTO public."Attends" ("Id", "StudentId", "MarkId", "LessonId") VALUES ('a21e6b74-9144-4dc8-903b-99fa674f0c21', '9a2ea651-fb0f-4a56-8869-26a4c25e357d', 'e2fb9cef-4b04-40f3-b251-56b5f3189ece', '741face3-85f7-40ea-9bdd-240fa48f02a5');
INSERT INTO public."Attends" ("Id", "StudentId", "MarkId", "LessonId") VALUES ('c5aa02c0-bdfc-4587-808a-d45cb11909e9', '0c5127a1-108c-4783-88d4-185f599a5a24', 'e2fb9cef-4b04-40f3-b251-56b5f3189ece', '741face3-85f7-40ea-9bdd-240fa48f02a5');
INSERT INTO public."Attends" ("Id", "StudentId", "MarkId", "LessonId") VALUES ('dead605a-cabf-425b-bf7c-e75896b58bb1', 'd41c3d85-0cce-4918-9980-85e4512d0430', 'e2fb9cef-4b04-40f3-b251-56b5f3189ece', '741face3-85f7-40ea-9bdd-240fa48f02a5');


--
-- TOC entry 3121 (class 0 OID 17236)
-- Dependencies: 214
-- Data for Name: __EFMigrationsHistory; Type: TABLE DATA; Schema: public; Owner: pupa
--



-- Completed on 2023-12-10 20:39:06

--
-- PostgreSQL database dump complete
--

