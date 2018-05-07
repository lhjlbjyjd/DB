/* EDUCATIONAL_STRUCTURE */
INSERT INTO "public"."educational_structure" ("structure_id", "structure_nm", "foundation_dt", "pulpit_flg")
VALUES (DEFAULT, 'ФПМИ', '2018-05-07', false)
  ,(DEFAULT, 'ФАКТ', '2018-05-07', false)
  ,(DEFAULT, 'ФРКТ', '2018-05-07', false)
  ,(DEFAULT, 'Вышмат', '2018-05-07', true)
  ,(DEFAULT, 'Теорфиз', '2018-05-07', true)
  ,(DEFAULT, 'Физкультура', '2018-05-07', true)
  ,(DEFAULT, 'АТП', '2018-05-07', true)
  ,(DEFAULT, 'ДМ', '2018-05-07', true)
  ,(DEFAULT, 'РТК', '2018-05-07', true)
  ,(DEFAULT, 'БМ', '2018-05-07', true)
  ,(DEFAULT, 'Экономика', '2018-05-07', true);

/* DEPARTMENT */
INSERT INTO "public"."department" ("department_id", school_structure_id, "department_nm", "foundation_dt")
VALUES (DEFAULT, 1, 'ФИВТ', '2018-05-07')
  ,(DEFAULT, 1, 'ФУПМ', '2018-05-07')
  ,(DEFAULT, 3, 'ФРТК', '2018-05-07')
  ,(DEFAULT, 2, 'ФАКИ', '2018-05-07')
  ,(DEFAULT, 2, 'ФАЛТ', '2018-05-07')
  ,(DEFAULT, NULL, 'ФБМФ', '2018-05-07');

/* SPECIALIZATION */
INSERT INTO "public"."specialization" ("specialization_id", "specialization_nm")
VALUES (1, 'ПМИ')
  ,(2, 'ПМФ')
  ,(3, 'ИВТ');

/* GROUP */
INSERT INTO "public"."GROUP" ("group_id", "department_id", "specialization_id")
VALUES (795, 1, 1)
  ,(793, 1, 2)
  ,(797, 1, 1)
  ,(792, 1, 2)
  ,(773, 2, 2);

/* USER */
INSERT INTO "public"."USER" ("user_id", "group_id", "first_nm", "middle_nm", "last_nm", "birdth_dt", "pulpit_structure_id", "city_nm", "phone_no", "gender_code", "income_amt", "teacher_flg")
VALUES (DEFAULT, NULL, 'Андрей', 'Михайлович', 'Райгородский', '1972-05-07', NULL, 'Москва', 'NULL', 'М', 100000000, true)
  ,(DEFAULT, NULL, 'Иван', 'Генрирхович', 'Эрлих', '1983-06-07', NULL, 'Москва', 'NULL', 'М', 1000000, true)
  ,(DEFAULT, 797, 'Дмитрий', 'Сергеевич', 'Родионов', '2000-08-12', NULL, 'Запорожье', '+79251296983', 'М', 4400, false)
  ,(DEFAULT, 797, 'Михаил', 'Владиславович', 'Цион', '1999-07-06', NULL, 'Черкассы', 'NULL', 'М', 1704214, false)
  ,(DEFAULT, NULL, 'Марк', 'Яковлевич', 'Шехтер', '1995-05-03', NULL, 'Воронеж', 'NULL', 'М', 0, true)
  ,(DEFAULT, 793, 'Екатерина', 'Сергеевна', 'Шайдурова', '2000-10-11', NULL, 'Ижевск', 'NULL', 'Ж', 0, false)
  ,(DEFAULT, 773, 'Доктор', 'NULL', 'Стрендж', '1978-08-17', 1, 'Нью-Йорк', 'NULL', 'М', 0, true)
  ,(DEFAULT, NULL, 'Капитан', 'NULL', 'Америка', '1927-12-14', 1, 'Нью-Йорк', 'NULL', 'М', 0, false)
  ,(DEFAULT, NULL, 'Капитан', 'NULL', 'Марвел', '1981-07-21', 4, 'Вашингтон', 'NULL', 'Ж', 10008, true);

/* SUBJECT */
INSERT INTO "public"."subject" ("subject_id", "pulpit_structure_id", "subject_nm")
VALUES (DEFAULT, 1, 'Матлог')
  ,(DEFAULT, 4, 'Матан')
  ,(DEFAULT, 4, 'Алгем')
  ,(DEFAULT, 5, 'Общефиз')
  ,(DEFAULT, 6, 'Физкультура');

/* PULPIT_X_DEPARTMENT */
INSERT INTO "public"."pulpit_x_department" ("pulpit_structure_id", "department_id")
VALUES (7, 1)
  ,(8, 1)
  ,(9, 3)
  ,(10, 6)
  ,(11, 2);

/* USER_X_SUBJECT */
INSERT INTO "public"."user_x_subject" ("user_id", "subject_id", "lection_flg")
VALUES (1, 1, true)
  ,(2, 2, false)
  ,(3, 3, true)
  ,(4, 4, DEFAULT)
  ,(5, 5, true)
  ,(6, 3, true)
  ,(2, 4, false);

/* TEACHER_X_STUDENT */
INSERT INTO "public"."teacher_x_student" ("teacher_user_id", "student_user_id", "lection_flg")
VALUES (1, 3, false)
  ,(2, 4, true)
  ,(5, 6, false)
  ,(7, 8, false)
  ,(9, 2, true);