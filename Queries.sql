/* Группы, в которых изучают матан */
SELECT
  group_id
FROM
  (SELECT
    group_id
    ,subject_id
  FROM
    USER_X_SUBJECT
  INNER JOIN
    "USER"
      ON user_x_subject.user_id = "USER".user_id
  ) AS t
INNER JOIN
  SUBJECT
    ON t.subject_id = subject.subject_id
WHERE
  subject_nm = 'Матан'
  AND group_id NOTNULL;


/* Какой преподаватель преподаёт больше всего предметов */
SELECT
  first_nm
  ,last_nm
FROM
  (SELECT
    first_nm
    ,last_nm
    ,COUNT("USER".user_id) as cnt
  FROM
    "USER"
  INNER JOIN
    USER_X_SUBJECT
      ON "USER".user_id = user_x_subject.user_id
  WHERE
    teacher_flg
  GROUP BY
    first_nm
    ,last_nm) AS tmp
WHERE
  cnt = (SELECT MAX(cnt) FROM
    (SELECT
      first_nm
      ,last_nm
      ,COUNT("USER".user_id) as cnt
    FROM
      "USER"
    INNER JOIN
      USER_X_SUBJECT
        ON "USER".user_id = user_x_subject.user_id
    WHERE
      teacher_flg
    GROUP BY
      first_nm
      ,last_nm) as t
  );


/* Все специализации ФИВТ */
SELECT
  specialization_nm
FROM
  (SELECT
    department_id
    ,specialization_nm
  FROM
    SPECIALIZATION AS S
  INNER JOIN
    "GROUP" AS G
      ON S.specialization_id = G.specialization_id
  ) AS t
INNER JOIN
  DEPARTMENT
    ON t.department_id = DEPARTMENT.department_id
WHERE
  department_nm = 'ФИВТ'
GROUP BY
  specialization_nm;


/* Взять пользователей работающих/учащихся на кафедре вышмата */
SELECT
  first_nm
  ,last_nm
FROM
  "USER" AS U
INNER JOIN
  EDUCATIONAL_STRUCTURE AS ES
    ON U.pulpit_structure_id = ES.structure_id
WHERE
  structure_nm = 'Вышмат'
GROUP BY
  first_nm
  ,last_nm;

/* Количество людей, у которых преподают люди из ФПМИ */
SELECT
  COUNT(student_user_id)
FROM
  (SELECT
    user_id
  FROM
    "USER"
  INNER JOIN
    educational_structure AS es
      ON "USER".pulpit_structure_id = es.structure_id
  WHERE
    structure_nm = 'ФПМИ'
  ) as t
INNER JOIN
  TEACHER_X_STUDENT AS TXS
    ON t.user_id = TXS.teacher_user_id