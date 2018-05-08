/* Существующие физтех - школы */
CREATE OR REPLACE VIEW VIEW_SCHOOLS AS
  (SELECT
    structure_nm
    ,foundation_dt
  FROM
    educational_structure
  WHERE
    NOT pulpit_flg
  );

/* У кого сегодня ДР */
CREATE OR REPLACE VIEW VIEW_USER_BIRTHDAY AS
  (SELECT
    first_nm
    ,last_nm
    ,(CASE WHEN NOT city_nm = 'Москва' THEN NULL ELSE phone_no END) AS phone_no
  FROM
    "USER"
  WHERE
    EXTRACT(DOY FROM birdth_dt) = EXTRACT(DOY FROM CURRENT_DATE)
  );

/* Вышматовские предметы */
CREATE OR REPLACE VIEW VIEW_SUBJECT_VISHMAT AS
  (SELECT
  subject_nm
  FROM
    SUBJECT
  WHERE
    pulpit_structure_id = 4
  );

/* Какие сейчас есть специализации */
CREATE OR REPLACE VIEW VIEW_SPECIALIZATIONS_ALL AS
  (SELECT
  specialization_nm
  FROM
    SPECIALIZATION
  );

/* Все группы ФИВТа */
CREATE OR REPLACE VIEW VIEW_GROUP_DIHT AS
  (SELECT
    group_id
  FROM
    "GROUP"
  WHERE
    department_id = 1
  );

/* Факультеты, созданные сегодня */
CREATE OR REPLACE VIEW VIEW_DEPARTMENT_BIRTHDAY AS
  (SELECT
    department_nm
  FROM
    DEPARTMENT
  WHERE
    EXTRACT(DOY FROM foundation_dt) = EXTRACT(DOY FROM CURRENT_DATE)
  );

/* -------------------------- НА 2 БАЛЛА -------------------------------*/

/* Специализации, по которым кто то учится */
CREATE OR REPLACE VIEW VIEW_SPECIALIZATIONS AS
  (SELECT
    specialization_nm
  FROM
    "GROUP" INNER JOIN specialization ON
      "GROUP".specialization_id = SPECIALIZATION.specialization_id
  GROUP BY
    SPECIALIZATION.specialization_id
  );

/* Физтех-Школы с директорами */
CREATE OR REPLACE VIEW VIEW_SCHOOLS AS
  (SELECT
    structure_nm
    ,foundation_dt
    ,first_nm
    ,last_nm
  FROM
    EDUCATIONAL_STRUCTURE INNER JOIN "USER" U ON
      EDUCATIONAL_STRUCTURE.structure_id = U.pulpit_structure_id
  WHERE
    NOT pulpit_flg
  );
