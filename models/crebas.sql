/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     2019/6/8 13:09:50                            */
/*==============================================================*/


alter table "Class"
   drop constraint FK_CLASS_TEACHERMA_TEACHER;

alter table "ClassRoom"
   drop constraint FK_CLASSROO_COURETAKE_COURSEPR;

alter table "Course"
   drop constraint FK_COURSE_COURSEOPE_SEMESTER;

alter table "Course"
   drop constraint FK_COURSE_LEADINGTE_TEACHER;

alter table "CourseProgram"
   drop constraint FK_COURSEPR_COURETAKE_CLASSROO;

alter table "CourseProgram"
   drop constraint FK_COURSEPR_COURSEHAS_COURSE;

alter table "Semester"
   drop constraint FK_SEMESTER_ACADEMICY_ACADEMIC;

alter table "Student"
   drop constraint FK_STUDENT_HUMANINHE_HUMAN;

alter table "Student"
   drop constraint FK_STUDENT_STUDENTBE_CLASS;

alter table "Student"
   drop constraint FK_STUDENT_STUDENTBE_ACADEMY;

alter table "Student"
   drop constraint FK_STUDENT_STUDENTHA_PROFESSI;

alter table "StudentAttendCourse"
   drop constraint FK_STUDENTA_STUDENTAT_COURSE;

alter table "StudentAttendCourse"
   drop constraint FK_STUDENTA_STUDENTAT_STUDENT;

alter table "Teacher"
   drop constraint FK_TEACHER_HUMANINHE_HUMAN;

alter table "Teacher"
   drop constraint FK_TEACHER_TEACHERBE_ACADEMY;

alter table "Teacher"
   drop constraint FK_TEACHER_TEACHERHA_PROFESSI;

alter table "TeacherTeachCourse"
   drop constraint FK_TEACHERT_TEACHERTE_TEACHER;

alter table "TeacherTeachCourse"
   drop constraint FK_TEACHERT_TEACHERTE_COURSE;

drop table "AcademicYear" cascade constraints;

drop table "Academy" cascade constraints;

drop index "TeacherMangeClass_FK";

drop table "Class" cascade constraints;

drop index "CoureTakesPlaceInClassroom2_FK";

drop table "ClassRoom" cascade constraints;

drop index "CourseOpensAtSemester_FK";

drop index "LeadingTeacherLeadsACourse_FK";

drop table "Course" cascade constraints;

drop index "CoureTakesPlaceInClassroom_FK";

drop index "CourseHasCourseProgram_FK";

drop table "CourseProgram" cascade constraints;

drop table "Human" cascade constraints;

drop table "Professional" cascade constraints;

drop index "AcademicYearHasSemestes_FK";

drop table "Semester" cascade constraints;

drop index "StudentBelongsToClass_FK";

drop index "StudentHasProfessional_FK";

drop index "StudentBelongsToCollege_FK";

drop table "Student" cascade constraints;

drop index "StudentAttendCourse2_FK";

drop index "StudentAttendCourse_FK";

drop table "StudentAttendCourse" cascade constraints;

drop index "TeacherHasProfessional_FK";

drop index "TeacherBelongsToAcademy_FK";

drop table "Teacher" cascade constraints;

drop index "TeacherTeachCourse2_FK";

drop index "TeacherTeachCourse_FK";

drop table "TeacherTeachCourse" cascade constraints;

/*==============================================================*/
/* Table: "AcademicYear"                                        */
/*==============================================================*/
create table "AcademicYear" 
(
   "AcademicYear"       INTEGER              not null,
   constraint PK_ACADEMICYEAR primary key ("AcademicYear")
);

/*==============================================================*/
/* Table: "Academy"                                             */
/*==============================================================*/
create table "Academy" 
(
   "AcademyID"          INTEGER              not null,
   "CName"              VARCHAR2(32),
   constraint PK_ACADEMY primary key ("AcademyID")
);

/*==============================================================*/
/* Table: "Class"                                               */
/*==============================================================*/
create table "Class" 
(
   "ClassID"            INTEGER              not null,
   "HeadTeacherNumber"  INTEGER,
   constraint PK_CLASS primary key ("ClassID")
);

/*==============================================================*/
/* Index: "TeacherMangeClass_FK"                                */
/*==============================================================*/
create index "TeacherMangeClass_FK" on "Class" (
   "HeadTeacherNumber" ASC
);

/*==============================================================*/
/* Table: "ClassRoom"                                           */
/*==============================================================*/
create table "ClassRoom" 
(
   "ClasroomID"         INTEGER              not null,
   "CourseProgramID"    INTEGER,
   "Location"           VARCHAR2(64)         not null,
   "Capacity"           INTEGER,
   constraint PK_CLASSROOM primary key ("ClasroomID"),
   constraint AK_LOCATION_CLASSROO unique ("Location")
);

/*==============================================================*/
/* Index: "CoureTakesPlaceInClassroom2_FK"                      */
/*==============================================================*/
create index "CoureTakesPlaceInClassroom2_FK" on "ClassRoom" (
   "CourseProgramID" ASC
);

/*==============================================================*/
/* Table: "Course"                                              */
/*==============================================================*/
create table "Course" 
(
   "CourseID"           INTEGER              not null,
   "SmesterID"          INTEGER              not null,
   "LeadTeacherNumber"  INTEGER,
   "CourseName"         VARCHAR2(32),
   "Credits"            NUMBER(1,1),
   "CourseProperty"     INTEGER,
   constraint PK_COURSE primary key ("CourseID")
);

/*==============================================================*/
/* Index: "LeadingTeacherLeadsACourse_FK"                       */
/*==============================================================*/
create index "LeadingTeacherLeadsACourse_FK" on "Course" (
   "LeadTeacherNumber" ASC
);

/*==============================================================*/
/* Index: "CourseOpensAtSemester_FK"                            */
/*==============================================================*/
create index "CourseOpensAtSemester_FK" on "Course" (
   "SmesterID" ASC
);

/*==============================================================*/
/* Table: "CourseProgram"                                       */
/*==============================================================*/
create table "CourseProgram" 
(
   "CourseProgramID"    INTEGER              not null,
   "CourseID"           INTEGER,
   "ClasroomID"         INTEGER              not null,
   "Week"               INTEGER,
   "Weekfay"            INTEGER,
   "Section"            INTEGER,
   constraint PK_COURSEPROGRAM primary key ("CourseProgramID")
);

/*==============================================================*/
/* Index: "CourseHasCourseProgram_FK"                           */
/*==============================================================*/
create index "CourseHasCourseProgram_FK" on "CourseProgram" (
   "CourseID" ASC
);

/*==============================================================*/
/* Index: "CoureTakesPlaceInClassroom_FK"                       */
/*==============================================================*/
create index "CoureTakesPlaceInClassroom_FK" on "CourseProgram" (
   "ClasroomID" ASC
);

/*==============================================================*/
/* Table: "Human"                                               */
/*==============================================================*/
create table "Human" 
(
   "HumanID"            INTEGER              not null,
   "HName"              VARCHAR2(32)         not null,
   "HSex"               CHAR(1)              not null
      constraint CKC_HSEX_HUMAN check ("HSex" in ('男','女')),
   "HBirthday"          DATE,
   "HIdentity"          CHAR(18),
   "HNotes"             CLOB,
   constraint PK_HUMAN primary key ("HumanID")
);

/*==============================================================*/
/* Table: "Professional"                                        */
/*==============================================================*/
create table "Professional" 
(
   "ProfessionalID"     INTEGER              not null,
   "PName"              VARCHAR2(32),
   constraint PK_PROFESSIONAL primary key ("ProfessionalID")
);

/*==============================================================*/
/* Table: "Semester"                                            */
/*==============================================================*/
create table "Semester" 
(
   "SmesterID"          INTEGER              not null,
   "AcademicYear"       INTEGER              not null,
   "SmesterCode"        INTEGER,
   constraint PK_SEMESTER primary key ("SmesterID")
);

comment on column "Semester"."SmesterCode" is
'“1”代表春季学期，“2”代表秋季学期';

/*==============================================================*/
/* Index: "AcademicYearHasSemestes_FK"                          */
/*==============================================================*/
create index "AcademicYearHasSemestes_FK" on "Semester" (
   "AcademicYear" ASC
);

/*==============================================================*/
/* Table: "Student"                                             */
/*==============================================================*/
create table "Student" 
(
   "HumanID"            INTEGER              not null,
   "ClassID"            INTEGER              not null,
   "AcademyID"          INTEGER              not null,
   "ProfessionalID"     INTEGER              not null,
   "StudentNumber"      INTEGER              not null,
   constraint PK_STUDENT primary key ("HumanID"),
   constraint AK_STUDENTNUMBER_STUDENT unique ("StudentNumber")
);

/*==============================================================*/
/* Index: "StudentBelongsToCollege_FK"                          */
/*==============================================================*/
create index "StudentBelongsToCollege_FK" on "Student" (
   "AcademyID" ASC
);

/*==============================================================*/
/* Index: "StudentHasProfessional_FK"                           */
/*==============================================================*/
create index "StudentHasProfessional_FK" on "Student" (
   "ProfessionalID" ASC
);

/*==============================================================*/
/* Index: "StudentBelongsToClass_FK"                            */
/*==============================================================*/
create index "StudentBelongsToClass_FK" on "Student" (
   "ClassID" ASC
);

/*==============================================================*/
/* Table: "StudentAttendCourse"                                 */
/*==============================================================*/
create table "StudentAttendCourse" 
(
   "CourseID"           INTEGER              not null,
   "StudentNumber"      INTEGER              not null,
   "Score"              INTEGER,
   constraint PK_STUDENTATTENDCOURSE primary key ("StudentNumber", "CourseID")
);

/*==============================================================*/
/* Index: "StudentAttendCourse_FK"                              */
/*==============================================================*/
create index "StudentAttendCourse_FK" on "StudentAttendCourse" (
   "CourseID" ASC
);

/*==============================================================*/
/* Index: "StudentAttendCourse2_FK"                             */
/*==============================================================*/
create index "StudentAttendCourse2_FK" on "StudentAttendCourse" (
   "StudentNumber" ASC
);

/*==============================================================*/
/* Table: "Teacher"                                             */
/*==============================================================*/
create table "Teacher" 
(
   "HumanID"            INTEGER              not null,
   "ProfessionalID"     INTEGER,
   "AcademyID"          INTEGER              not null,
   "TeacherNumber"      INTEGER              not null,
   constraint PK_TEACHER primary key ("HumanID"),
   constraint AK_TEACHERNUMBER_TEACHER unique ("TeacherNumber")
);

/*==============================================================*/
/* Index: "TeacherBelongsToAcademy_FK"                          */
/*==============================================================*/
create index "TeacherBelongsToAcademy_FK" on "Teacher" (
   "AcademyID" ASC
);

/*==============================================================*/
/* Index: "TeacherHasProfessional_FK"                           */
/*==============================================================*/
create index "TeacherHasProfessional_FK" on "Teacher" (
   "ProfessionalID" ASC
);

/*==============================================================*/
/* Table: "TeacherTeachCourse"                                  */
/*==============================================================*/
create table "TeacherTeachCourse" 
(
   "CourseID"           INTEGER              not null,
   "TeacherNumber"      INTEGER              not null,
   constraint PK_TEACHERTEACHCOURSE primary key ("TeacherNumber", "CourseID")
);

/*==============================================================*/
/* Index: "TeacherTeachCourse_FK"                               */
/*==============================================================*/
create index "TeacherTeachCourse_FK" on "TeacherTeachCourse" (
   "TeacherNumber" ASC
);

/*==============================================================*/
/* Index: "TeacherTeachCourse2_FK"                              */
/*==============================================================*/
create index "TeacherTeachCourse2_FK" on "TeacherTeachCourse" (
   "CourseID" ASC
);

alter table "Class"
   add constraint FK_CLASS_TEACHERMA_TEACHER foreign key ("HeadTeacherNumber")
      references "Teacher" ("TeacherNumber");

alter table "ClassRoom"
   add constraint FK_CLASSROO_COURETAKE_COURSEPR foreign key ("CourseProgramID")
      references "CourseProgram" ("CourseProgramID");

alter table "Course"
   add constraint FK_COURSE_COURSEOPE_SEMESTER foreign key ("SmesterID")
      references "Semester" ("SmesterID");

alter table "Course"
   add constraint FK_COURSE_LEADINGTE_TEACHER foreign key ("LeadTeacherNumber")
      references "Teacher" ("TeacherNumber");

alter table "CourseProgram"
   add constraint FK_COURSEPR_COURETAKE_CLASSROO foreign key ("ClasroomID")
      references "ClassRoom" ("ClasroomID");

alter table "CourseProgram"
   add constraint FK_COURSEPR_COURSEHAS_COURSE foreign key ("CourseID")
      references "Course" ("CourseID");

alter table "Semester"
   add constraint FK_SEMESTER_ACADEMICY_ACADEMIC foreign key ("AcademicYear")
      references "AcademicYear" ("AcademicYear");

alter table "Student"
   add constraint FK_STUDENT_HUMANINHE_HUMAN foreign key ("HumanID")
      references "Human" ("HumanID");

alter table "Student"
   add constraint FK_STUDENT_STUDENTBE_CLASS foreign key ("ClassID")
      references "Class" ("ClassID");

alter table "Student"
   add constraint FK_STUDENT_STUDENTBE_ACADEMY foreign key ("AcademyID")
      references "Academy" ("AcademyID");

alter table "Student"
   add constraint FK_STUDENT_STUDENTHA_PROFESSI foreign key ("ProfessionalID")
      references "Professional" ("ProfessionalID");

alter table "StudentAttendCourse"
   add constraint FK_STUDENTA_STUDENTAT_COURSE foreign key ("CourseID")
      references "Course" ("CourseID");

alter table "StudentAttendCourse"
   add constraint FK_STUDENTA_STUDENTAT_STUDENT foreign key ("StudentNumber")
      references "Student" ("StudentNumber");

alter table "Teacher"
   add constraint FK_TEACHER_HUMANINHE_HUMAN foreign key ("HumanID")
      references "Human" ("HumanID");

alter table "Teacher"
   add constraint FK_TEACHER_TEACHERBE_ACADEMY foreign key ("AcademyID")
      references "Academy" ("AcademyID");

alter table "Teacher"
   add constraint FK_TEACHER_TEACHERHA_PROFESSI foreign key ("ProfessionalID")
      references "Professional" ("ProfessionalID");

alter table "TeacherTeachCourse"
   add constraint FK_TEACHERT_TEACHERTE_TEACHER foreign key ("TeacherNumber")
      references "Teacher" ("TeacherNumber");

alter table "TeacherTeachCourse"
   add constraint FK_TEACHERT_TEACHERTE_COURSE foreign key ("CourseID")
      references "Course" ("CourseID");

