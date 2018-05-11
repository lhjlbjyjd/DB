CREATE OR REPLACE FUNCTION kick_user()
  RETURNS TRIGGER AS
$BODY$
BEGIN
  DELETE FROM
    "teacher_x_student"
  WHERE
    teacher_user_id = OLD.user_id
    OR student_user_id = OLD.user_id;

  DELETE FROM
    "user_x_subject"
  WHERE
    user_id = OLD.user_id;
  RETURN NULL;
END;
$BODY$
LANGUAGE plpgsql;

CREATE TRIGGER KICK_OUT BEFORE DELETE ON "USER"
  FOR EACH ROW EXECUTE PROCEDURE kick_user();





CREATE OR REPLACE FUNCTION remove_es()
  RETURNS TRIGGER AS
$BODY$
BEGIN
  UPDATE
    "USER"
  SET
    pulpit_structure_id = NULL
  WHERE
    pulpit_structure_id = OLD.structure_id;

  UPDATE
    SUBJECT
  SET
    pulpit_structure_id = NULL
  WHERE
    pulpit_structure_id = OLD.structure_id;

  UPDATE
    DEPARTMENT
  SET
    school_structure_id = NULL
  WHERE
    school_structure_id = OLD.structure_id;

  DELETE FROM
    pulpit_x_department
  WHERE
    pulpit_structure_id = OLD.structure_id;
  RETURN NULL;
END;
$BODY$
LANGUAGE plpgsql;

CREATE TRIGGER structure_destruction BEFORE DELETE ON "educational_structure"
  FOR EACH ROW EXECUTE PROCEDURE remove_es();


/*
[2018-05-11 13:34:18] Connected to test
sql> CREATE OR REPLACE FUNCTION kick_user()
  RETURNS TRIGGER AS
$BODY$
BEGIN
  DELETE FROM
    "teacher_x_student"
  WHERE
    teacher_user_id = OLD.user_id
    OR student_user_id = OLD.user_id;

  DELETE FROM
    "user_x_subject"
  WHERE
    user_id = OLD.user_id;
  RETURN NULL;
END;
$BODY$
LANGUAGE plpgsql
[2018-05-11 13:34:21] completed in 2 s 464 ms
sql> CREATE TRIGGER KICK_OUT BEFORE DELETE ON "USER"
  FOR EACH ROW EXECUTE PROCEDURE kick_user()
[2018-05-11 13:34:22] completed in 519 ms
sql> CREATE OR REPLACE FUNCTION remove_es()
  RETURNS TRIGGER AS
$BODY$
BEGIN
  UPDATE
    "USER"
  SET
    pulpit_structure_id = NULL
  WHERE
    pulpit_structure_id = OLD.structure_id;

  UPDATE
    SUBJECT
  SET
    pulpit_structure_id = NULL
  WHERE
    pulpit_structure_id = OLD.structure_id;

  UPDATE
    DEPARTMENT
  SET
    school_structure_id = NULL
  WHERE
    school_structure_id = OLD.structure_id;

  DELETE FROM
    pulpit_x_department
  WHERE
    pulpit_structure_id = OLD.structure_id;
  RETURN NULL;
END;
$BODY$
LANGUAGE plpgsql
[2018-05-11 13:34:22] completed in 71 ms
sql> CREATE TRIGGER structure_destruction BEFORE DELETE ON "educational_structure"
  FOR EACH ROW EXECUTE PROCEDURE remove_es()
[2018-05-11 13:34:23] completed in 854 ms
 */