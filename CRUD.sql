/* ES */
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

SELECT
  *
FROM
  EDUCATIONAL_STRUCTURE
WHERE
  pulpit_flg;

UPDATE
  EDUCATIONAL_STRUCTURE
SET
  structure_nm = 'Душегубка'
WHERE
  structure_id = 4;

DELETE FROM
  EDUCATIONAL_STRUCTURE
WHERE
  foundation_dt = CURRENT_DATE

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


SELECT
  phone_no
FROM
  "USER"
WHERE
  EXTRACT(DOY birdth_dt) = EXTRACT(DOY CURRENT_DATE)
  AND
  city_nm = 'Москва';

UPDATE
  "USER"
SET
  gender_code = 'G'
WHERE
  (SELECT "GROUP".department_id
   FROM
     "GROUP"
     INNER JOIN DEPARTMENT
       ON "GROUP".department_id = department.department_id
   WHERE
     "GROUP".department_id = 1
  ) = 1 AND gender_code = 'М';

DELETE FROM
  "USER"
WHERE
  NOT city_nm = 'Москва'

