/* Группы, в которых изучают матан */
SELECT
  group_id
FROM
  "USER" INNER JOIN USER_X_SUBJECT
    ON "USER".user_id = user_x_subject.user_id
WHERE
  teacher_flg AND subject_id = 2;

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
    INNER JOIN USER_X_SUBJECT
      ON "USER".user_id = user_x_subject.user_id
  WHERE
    teacher_flg
  GROUP BY
    first_nm
    , last_nm
    , "USER".user_id
  HAVING
    COUNT("USER".user_id) = MAX("USER".user_id)
  ) AS tmp
WHERE
  cnt = (SELECT MAX(cnt) FROM
    (SELECT
      first_nm
      ,last_nm
      ,COUNT("USER".user_id) as cnt
    FROM
      "USER"
      INNER JOIN USER_X_SUBJECT
        ON "USER".user_id = user_x_subject.user_id
    WHERE
      teacher_flg
    GROUP BY
      first_nm
      , last_nm
      , "USER".user_id
    HAVING
      COUNT("USER".user_id) = MAX("USER".user_id)
    ) as t
  );


/* Все специализации ФИВТ */
SELECT
  specialization_nm
FROM
  SPECIALIZATION AS S INNER JOIN "GROUP" AS G
    ON S.specialization_id = G.specialization_id
WHERE
  department_id = 1
GROUP BY
  specialization_nm;


/* Взять пользователей работающих/учащихся на кафедре вышмата */
SELECT
  first_nm
  ,last_nm
FROM
  "USER" AS U INNER JOIN EDUCATIONAL_STRUCTURE AS ES
    ON U.pulpit_structure_id = ES.structure_id
WHERE
  structure_id = 4
GROUP BY
  first_nm
  ,last_nm;

/* Количество людей, у которых преподают люди из ФПМИ */
SELECT
  student_user_id
FROM
  (SELECT
    user_id
  FROM
    "USER" INNER JOIN educational_structure AS es ON
      "USER".pulpit_structure_id = es.structure_id
    WHERE
      structure_id = 1
  ) as t INNER JOIN TEACHER_X_STUDENT AS TXS
    ON t.user_id = TXS.teacher_user_id
GROUP BY
  student_user_id