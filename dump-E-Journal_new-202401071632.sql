--
-- PostgreSQL database dump
--

-- Dumped from database version 13.13 (Debian 13.13-0+deb11u1)
-- Dumped by pg_dump version 15.2

-- Started on 2024-01-07 16:32:51

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
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- TOC entry 3120 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 213 (class 1259 OID 17392)
-- Name: Attends; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Attends" (
    "Id" uuid NOT NULL,
    "StudentId" uuid NOT NULL,
    "MarkId" uuid NOT NULL,
    "LessonId" uuid
);


--
-- TOC entry 200 (class 1259 OID 17242)
-- Name: AttestationTypes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."AttestationTypes" (
    "Id" uuid NOT NULL,
    "Name" text NOT NULL
);


--
-- TOC entry 201 (class 1259 OID 17250)
-- Name: EducationalForms; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."EducationalForms" (
    "Id" uuid NOT NULL,
    "Name" text NOT NULL
);


--
-- TOC entry 208 (class 1259 OID 17303)
-- Name: Groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Groups" (
    "Id" uuid NOT NULL,
    "Number" text NOT NULL,
    "SpecializationId" uuid NOT NULL,
    "EducationalFormId" uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 17321)
-- Name: LessonForms; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."LessonForms" (
    "Id" uuid NOT NULL,
    "LessonTypeId" uuid NOT NULL,
    "TeacherId" uuid NOT NULL,
    "Hours" integer NOT NULL
);


--
-- TOC entry 202 (class 1259 OID 17258)
-- Name: LessonTypes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."LessonTypes" (
    "Id" uuid NOT NULL,
    "Name" text NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 17374)
-- Name: Lessons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Lessons" (
    "Id" uuid NOT NULL,
    "Date" date NOT NULL,
    "ScheduleId" uuid NOT NULL,
    "Topic" text,
    "TeachingId" uuid NOT NULL
);


--
-- TOC entry 203 (class 1259 OID 17266)
-- Name: Marks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Marks" (
    "Id" uuid NOT NULL,
    "Code" character(1) NOT NULL,
    "Description" text NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 17274)
-- Name: Schedules; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Schedules" (
    "Id" uuid NOT NULL,
    "Number" integer NOT NULL,
    "StartTime" time without time zone NOT NULL,
    "EndTime" time without time zone NOT NULL
);


--
-- TOC entry 205 (class 1259 OID 17279)
-- Name: Specializations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Specializations" (
    "Id" uuid NOT NULL,
    "Code" text NOT NULL,
    "Name" text NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 17336)
-- Name: Students; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Students" (
    "Id" uuid NOT NULL,
    "FirstName" text NOT NULL,
    "LastName" text NOT NULL,
    "Patronymic" text,
    "BirthDate" date NOT NULL,
    "GroupId" uuid,
    "IdCard" integer NOT NULL,
    "IsBoss" boolean NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 17287)
-- Name: Subjects; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Subjects" (
    "Id" uuid NOT NULL,
    "Name" text NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 17295)
-- Name: Teachers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Teachers" (
    "Id" uuid NOT NULL,
    "FirstName" text NOT NULL,
    "LastName" text NOT NULL,
    "Patronymic" text,
    "Post" text NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 17349)
-- Name: Teachings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Teachings" (
    "Id" uuid NOT NULL,
    "SubjectId" uuid NOT NULL,
    "GroupId" uuid NOT NULL,
    "AttestationTypeId" uuid NOT NULL,
    "Term" integer NOT NULL,
    "TermProject" boolean NOT NULL,
    "LessonFormId" uuid NOT NULL
);


--
-- TOC entry 3114 (class 0 OID 17392)
-- Dependencies: 213
-- Data for Name: Attends; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Attends" VALUES ('50a83ef6-3a13-4b5d-8656-d3d6f3d0baa6', '9a2ea651-fb0f-4a56-8869-26a4c25e357d', 'e2fb9cef-4b04-40f3-b251-56b5f3189ece', 'cd85f2e6-faec-4c5e-90b4-7edc521e5a42');
INSERT INTO public."Attends" VALUES ('6499e15f-ba9c-4605-b2f3-7c55637cb67c', '0c5127a1-108c-4783-88d4-185f599a5a24', 'e2fb9cef-4b04-40f3-b251-56b5f3189ece', '4bc8415b-5ad5-459b-8405-a19e0331a579');
INSERT INTO public."Attends" VALUES ('83e66552-3bce-4d1a-af85-14aade7128c1', '9a2ea651-fb0f-4a56-8869-26a4c25e357d', 'e2fb9cef-4b04-40f3-b251-56b5f3189ece', '4bc8415b-5ad5-459b-8405-a19e0331a579');
INSERT INTO public."Attends" VALUES ('c1131bd4-8b99-4b37-a99d-0dbce7ff5475', 'd41c3d85-0cce-4918-9980-85e4512d0430', 'e2fb9cef-4b04-40f3-b251-56b5f3189ece', 'cd85f2e6-faec-4c5e-90b4-7edc521e5a42');
INSERT INTO public."Attends" VALUES ('c559b7cf-e396-44fe-8999-f9a06bf6f65a', 'd41c3d85-0cce-4918-9980-85e4512d0430', 'e2fb9cef-4b04-40f3-b251-56b5f3189ece', '4bc8415b-5ad5-459b-8405-a19e0331a579');
INSERT INTO public."Attends" VALUES ('c7e3396a-f569-448f-b413-fad32b4e1a06', 'c80f1e72-da37-478c-b3ae-f720b00ff57c', 'e2fb9cef-4b04-40f3-b251-56b5f3189ece', 'cd85f2e6-faec-4c5e-90b4-7edc521e5a42');
INSERT INTO public."Attends" VALUES ('d660eedc-e90e-47f2-b0d3-09fe825817a5', 'c80f1e72-da37-478c-b3ae-f720b00ff57c', 'e2fb9cef-4b04-40f3-b251-56b5f3189ece', '4bc8415b-5ad5-459b-8405-a19e0331a579');
INSERT INTO public."Attends" VALUES ('9907f551-6b01-40d6-bae8-0c0cbf53edc7', '9a2ea651-fb0f-4a56-8869-26a4c25e357d', 'e2fb9cef-4b04-40f3-b251-56b5f3189ece', '7b97379b-2598-42a3-b701-af1eae827006');
INSERT INTO public."Attends" VALUES ('bd1affe8-2706-4110-851a-6087580141da', 'c80f1e72-da37-478c-b3ae-f720b00ff57c', 'e2fb9cef-4b04-40f3-b251-56b5f3189ece', '7b97379b-2598-42a3-b701-af1eae827006');
INSERT INTO public."Attends" VALUES ('e13111dd-a9e6-4c75-b58e-417ced64cc4d', '0c5127a1-108c-4783-88d4-185f599a5a24', 'e2fb9cef-4b04-40f3-b251-56b5f3189ece', '7b97379b-2598-42a3-b701-af1eae827006');
INSERT INTO public."Attends" VALUES ('dead605a-cabf-425b-bf7c-e75896b58bb1', 'd41c3d85-0cce-4918-9980-85e4512d0430', 'e2fb9cef-4b04-40f3-b251-56b5f3189ece', '741face3-85f7-40ea-9bdd-240fa48f02a5');
INSERT INTO public."Attends" VALUES ('f8055b1f-9114-4006-9eb4-492515d7b424', '0c5127a1-108c-4783-88d4-185f599a5a24', 'ce98ef88-66d3-44af-b0a4-1213ea3628e2', 'cd85f2e6-faec-4c5e-90b4-7edc521e5a42');
INSERT INTO public."Attends" VALUES ('950456ec-8668-43d5-8d52-49d5cfd314a5', 'c80f1e72-da37-478c-b3ae-f720b00ff57c', 'ce98ef88-66d3-44af-b0a4-1213ea3628e2', '741face3-85f7-40ea-9bdd-240fa48f02a5');
INSERT INTO public."Attends" VALUES ('a21e6b74-9144-4dc8-903b-99fa674f0c21', '9a2ea651-fb0f-4a56-8869-26a4c25e357d', '9e77b05a-3341-4cc2-9978-9be9de280c54', '741face3-85f7-40ea-9bdd-240fa48f02a5');
INSERT INTO public."Attends" VALUES ('c5aa02c0-bdfc-4587-808a-d45cb11909e9', '0c5127a1-108c-4783-88d4-185f599a5a24', 'ce98ef88-66d3-44af-b0a4-1213ea3628e2', '741face3-85f7-40ea-9bdd-240fa48f02a5');
INSERT INTO public."Attends" VALUES ('43fcd126-01bc-4af4-9c5c-514768e9323b', '9a2ea651-fb0f-4a56-8869-26a4c25e357d', '9e77b05a-3341-4cc2-9978-9be9de280c54', '50a750c6-9d75-438e-9ab1-0b21b29d90ef');
INSERT INTO public."Attends" VALUES ('733a3b12-d926-4371-9830-678e14afce84', 'd41c3d85-0cce-4918-9980-85e4512d0430', '9e77b05a-3341-4cc2-9978-9be9de280c54', '50a750c6-9d75-438e-9ab1-0b21b29d90ef');
INSERT INTO public."Attends" VALUES ('b0a3dfeb-7f72-4224-a63c-eacbbabde021', 'c80f1e72-da37-478c-b3ae-f720b00ff57c', '9e77b05a-3341-4cc2-9978-9be9de280c54', '50a750c6-9d75-438e-9ab1-0b21b29d90ef');
INSERT INTO public."Attends" VALUES ('d99771ea-feda-4353-ab0f-47dd07911a58', '0c5127a1-108c-4783-88d4-185f599a5a24', '9e77b05a-3341-4cc2-9978-9be9de280c54', '50a750c6-9d75-438e-9ab1-0b21b29d90ef');
INSERT INTO public."Attends" VALUES ('04440443-735e-4c69-96dc-e558a99463ec', 'd41c3d85-0cce-4918-9980-85e4512d0430', '5efead35-7285-4c43-a4c3-eaa000b7e9a7', 'f9b0a734-e0ec-4f7f-8f90-02bc705b5310');
INSERT INTO public."Attends" VALUES ('671d8a1b-abee-4961-8584-3ca1cc7999c3', '0c5127a1-108c-4783-88d4-185f599a5a24', '5efead35-7285-4c43-a4c3-eaa000b7e9a7', 'f9b0a734-e0ec-4f7f-8f90-02bc705b5310');
INSERT INTO public."Attends" VALUES ('84882cba-2c95-4e18-8851-7bac491f8324', '9a2ea651-fb0f-4a56-8869-26a4c25e357d', '5efead35-7285-4c43-a4c3-eaa000b7e9a7', 'f9b0a734-e0ec-4f7f-8f90-02bc705b5310');
INSERT INTO public."Attends" VALUES ('a6e49fb2-774e-4d1c-8ada-3f5019192eb0', 'c80f1e72-da37-478c-b3ae-f720b00ff57c', '5efead35-7285-4c43-a4c3-eaa000b7e9a7', 'f9b0a734-e0ec-4f7f-8f90-02bc705b5310');
INSERT INTO public."Attends" VALUES ('0c6938a7-2d00-416d-b48f-54345b2048ef', 'c80f1e72-da37-478c-b3ae-f720b00ff57c', '8bd69bf0-fffe-4706-bf19-7e1850dece3b', 'ec21d9f7-e145-4fbc-b229-0ec0534e25d6');
INSERT INTO public."Attends" VALUES ('1bc7ab9b-9e1d-44eb-829d-44c4dec935c5', '0c5127a1-108c-4783-88d4-185f599a5a24', '8bd69bf0-fffe-4706-bf19-7e1850dece3b', 'ec21d9f7-e145-4fbc-b229-0ec0534e25d6');
INSERT INTO public."Attends" VALUES ('464fe727-5d43-401a-9f4b-a856f5616788', '9a2ea651-fb0f-4a56-8869-26a4c25e357d', '8bd69bf0-fffe-4706-bf19-7e1850dece3b', 'ec21d9f7-e145-4fbc-b229-0ec0534e25d6');
INSERT INTO public."Attends" VALUES ('924595f5-3552-471e-a69f-44dd2d7e717c', 'd41c3d85-0cce-4918-9980-85e4512d0430', '8bd69bf0-fffe-4706-bf19-7e1850dece3b', 'ec21d9f7-e145-4fbc-b229-0ec0534e25d6');
INSERT INTO public."Attends" VALUES ('a1f5cab9-5712-4d7e-91f3-b300c634cfdb', 'd41c3d85-0cce-4918-9980-85e4512d0430', '9e77b05a-3341-4cc2-9978-9be9de280c54', '7b97379b-2598-42a3-b701-af1eae827006');


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


--
-- TOC entry 2956 (class 2606 OID 17396)
-- Name: Attends PK_Attends; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Attends"
    ADD CONSTRAINT "PK_Attends" PRIMARY KEY ("Id");


--
-- TOC entry 2916 (class 2606 OID 17249)
-- Name: AttestationTypes PK_AttestationTypes; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."AttestationTypes"
    ADD CONSTRAINT "PK_AttestationTypes" PRIMARY KEY ("Id");


--
-- TOC entry 2918 (class 2606 OID 17257)
-- Name: EducationalForms PK_EducationalForms; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."EducationalForms"
    ADD CONSTRAINT "PK_EducationalForms" PRIMARY KEY ("Id");


--
-- TOC entry 2934 (class 2606 OID 17310)
-- Name: Groups PK_Groups; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Groups"
    ADD CONSTRAINT "PK_Groups" PRIMARY KEY ("Id");


--
-- TOC entry 2938 (class 2606 OID 17325)
-- Name: LessonForms PK_LessonForms; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."LessonForms"
    ADD CONSTRAINT "PK_LessonForms" PRIMARY KEY ("Id");


--
-- TOC entry 2920 (class 2606 OID 17265)
-- Name: LessonTypes PK_LessonTypes; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."LessonTypes"
    ADD CONSTRAINT "PK_LessonTypes" PRIMARY KEY ("Id");


--
-- TOC entry 2951 (class 2606 OID 17381)
-- Name: Lessons PK_Lessons; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Lessons"
    ADD CONSTRAINT "PK_Lessons" PRIMARY KEY ("Id");


--
-- TOC entry 2922 (class 2606 OID 17273)
-- Name: Marks PK_Marks; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Marks"
    ADD CONSTRAINT "PK_Marks" PRIMARY KEY ("Id");


--
-- TOC entry 2924 (class 2606 OID 17278)
-- Name: Schedules PK_Schedules; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Schedules"
    ADD CONSTRAINT "PK_Schedules" PRIMARY KEY ("Id");


--
-- TOC entry 2926 (class 2606 OID 17286)
-- Name: Specializations PK_Specializations; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Specializations"
    ADD CONSTRAINT "PK_Specializations" PRIMARY KEY ("Id");


--
-- TOC entry 2941 (class 2606 OID 17343)
-- Name: Students PK_Students; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "PK_Students" PRIMARY KEY ("Id");


--
-- TOC entry 2928 (class 2606 OID 17294)
-- Name: Subjects PK_Subjects; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Subjects"
    ADD CONSTRAINT "PK_Subjects" PRIMARY KEY ("Id");


--
-- TOC entry 2930 (class 2606 OID 17302)
-- Name: Teachers PK_Teachers; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "PK_Teachers" PRIMARY KEY ("Id");


--
-- TOC entry 2947 (class 2606 OID 17353)
-- Name: Teachings PK_Teachings; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Teachings"
    ADD CONSTRAINT "PK_Teachings" PRIMARY KEY ("Id");


--
-- TOC entry 2952 (class 1259 OID 17412)
-- Name: IX_Attends_LessonId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Attends_LessonId" ON public."Attends" USING btree ("LessonId");


--
-- TOC entry 2953 (class 1259 OID 17413)
-- Name: IX_Attends_MarkId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Attends_MarkId" ON public."Attends" USING btree ("MarkId");


--
-- TOC entry 2954 (class 1259 OID 17414)
-- Name: IX_Attends_StudentId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Attends_StudentId" ON public."Attends" USING btree ("StudentId");


--
-- TOC entry 2931 (class 1259 OID 17415)
-- Name: IX_Groups_EducationalFormId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Groups_EducationalFormId" ON public."Groups" USING btree ("EducationalFormId");


--
-- TOC entry 2932 (class 1259 OID 17416)
-- Name: IX_Groups_SpecializationId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Groups_SpecializationId" ON public."Groups" USING btree ("SpecializationId");


--
-- TOC entry 2935 (class 1259 OID 17417)
-- Name: IX_LessonForms_LessonTypeId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_LessonForms_LessonTypeId" ON public."LessonForms" USING btree ("LessonTypeId");


--
-- TOC entry 2936 (class 1259 OID 17418)
-- Name: IX_LessonForms_TeacherId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_LessonForms_TeacherId" ON public."LessonForms" USING btree ("TeacherId");


--
-- TOC entry 2948 (class 1259 OID 17419)
-- Name: IX_Lessons_ScheduleId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Lessons_ScheduleId" ON public."Lessons" USING btree ("ScheduleId");


--
-- TOC entry 2949 (class 1259 OID 17420)
-- Name: IX_Lessons_TeachingId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Lessons_TeachingId" ON public."Lessons" USING btree ("TeachingId");


--
-- TOC entry 2939 (class 1259 OID 17421)
-- Name: IX_Students_GroupId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Students_GroupId" ON public."Students" USING btree ("GroupId");


--
-- TOC entry 2942 (class 1259 OID 17422)
-- Name: IX_Teachings_AttestationTypeId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Teachings_AttestationTypeId" ON public."Teachings" USING btree ("AttestationTypeId");


--
-- TOC entry 2943 (class 1259 OID 17423)
-- Name: IX_Teachings_GroupId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Teachings_GroupId" ON public."Teachings" USING btree ("GroupId");


--
-- TOC entry 2944 (class 1259 OID 17424)
-- Name: IX_Teachings_LessonFormId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Teachings_LessonFormId" ON public."Teachings" USING btree ("LessonFormId");


--
-- TOC entry 2945 (class 1259 OID 17425)
-- Name: IX_Teachings_SubjectId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Teachings_SubjectId" ON public."Teachings" USING btree ("SubjectId");


--
-- TOC entry 2968 (class 2606 OID 17397)
-- Name: Attends FK_Attends_Lessons_LessonId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Attends"
    ADD CONSTRAINT "FK_Attends_Lessons_LessonId" FOREIGN KEY ("LessonId") REFERENCES public."Lessons"("Id");


--
-- TOC entry 2969 (class 2606 OID 17402)
-- Name: Attends FK_Attends_Marks_MarkId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Attends"
    ADD CONSTRAINT "FK_Attends_Marks_MarkId" FOREIGN KEY ("MarkId") REFERENCES public."Marks"("Id") ON DELETE CASCADE;


--
-- TOC entry 2970 (class 2606 OID 17407)
-- Name: Attends FK_Attends_Students_StudentId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Attends"
    ADD CONSTRAINT "FK_Attends_Students_StudentId" FOREIGN KEY ("StudentId") REFERENCES public."Students"("Id") ON DELETE CASCADE;


--
-- TOC entry 2957 (class 2606 OID 17311)
-- Name: Groups FK_Groups_EducationalForms_EducationalFormId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Groups"
    ADD CONSTRAINT "FK_Groups_EducationalForms_EducationalFormId" FOREIGN KEY ("EducationalFormId") REFERENCES public."EducationalForms"("Id") ON DELETE CASCADE;


--
-- TOC entry 2958 (class 2606 OID 17316)
-- Name: Groups FK_Groups_Specializations_SpecializationId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Groups"
    ADD CONSTRAINT "FK_Groups_Specializations_SpecializationId" FOREIGN KEY ("SpecializationId") REFERENCES public."Specializations"("Id") ON DELETE CASCADE;


--
-- TOC entry 2959 (class 2606 OID 17326)
-- Name: LessonForms FK_LessonForms_LessonTypes_LessonTypeId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."LessonForms"
    ADD CONSTRAINT "FK_LessonForms_LessonTypes_LessonTypeId" FOREIGN KEY ("LessonTypeId") REFERENCES public."LessonTypes"("Id") ON DELETE CASCADE;


--
-- TOC entry 2960 (class 2606 OID 17331)
-- Name: LessonForms FK_LessonForms_Teachers_TeacherId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."LessonForms"
    ADD CONSTRAINT "FK_LessonForms_Teachers_TeacherId" FOREIGN KEY ("TeacherId") REFERENCES public."Teachers"("Id") ON DELETE CASCADE;


--
-- TOC entry 2966 (class 2606 OID 17382)
-- Name: Lessons FK_Lessons_Schedules_ScheduleId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Lessons"
    ADD CONSTRAINT "FK_Lessons_Schedules_ScheduleId" FOREIGN KEY ("ScheduleId") REFERENCES public."Schedules"("Id") ON DELETE CASCADE;


--
-- TOC entry 2967 (class 2606 OID 17387)
-- Name: Lessons FK_Lessons_Teachings_TeachingId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Lessons"
    ADD CONSTRAINT "FK_Lessons_Teachings_TeachingId" FOREIGN KEY ("TeachingId") REFERENCES public."Teachings"("Id") ON DELETE CASCADE;


--
-- TOC entry 2961 (class 2606 OID 17344)
-- Name: Students FK_Students_Groups_GroupId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "FK_Students_Groups_GroupId" FOREIGN KEY ("GroupId") REFERENCES public."Groups"("Id");


--
-- TOC entry 2962 (class 2606 OID 17354)
-- Name: Teachings FK_Teachings_AttestationTypes_AttestationTypeId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Teachings"
    ADD CONSTRAINT "FK_Teachings_AttestationTypes_AttestationTypeId" FOREIGN KEY ("AttestationTypeId") REFERENCES public."AttestationTypes"("Id") ON DELETE CASCADE;


--
-- TOC entry 2963 (class 2606 OID 17359)
-- Name: Teachings FK_Teachings_Groups_GroupId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Teachings"
    ADD CONSTRAINT "FK_Teachings_Groups_GroupId" FOREIGN KEY ("GroupId") REFERENCES public."Groups"("Id") ON DELETE CASCADE;


--
-- TOC entry 2964 (class 2606 OID 17364)
-- Name: Teachings FK_Teachings_LessonForms_LessonFormId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Teachings"
    ADD CONSTRAINT "FK_Teachings_LessonForms_LessonFormId" FOREIGN KEY ("LessonFormId") REFERENCES public."LessonForms"("Id") ON DELETE CASCADE;


--
-- TOC entry 2965 (class 2606 OID 17369)
-- Name: Teachings FK_Teachings_Subjects_SubjectId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Teachings"
    ADD CONSTRAINT "FK_Teachings_Subjects_SubjectId" FOREIGN KEY ("SubjectId") REFERENCES public."Subjects"("Id") ON DELETE CASCADE;


-- Completed on 2024-01-07 16:33:01

--
-- PostgreSQL database dump complete
--

