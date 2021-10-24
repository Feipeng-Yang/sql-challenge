-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "departments" (
    "department_number" VARCHAR(255)   NOT NULL,
    "department_name" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "department_number"
     )
);

CREATE TABLE "titles" (
    "title_id" VARCHAR(255)   NOT NULL,
    "title" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "employees" (
    "employee_number" INT   NOT NULL,
    "title_id" VARCHAR(255)   NOT NULL,
    "birth_date" VARCHAR(255)   NOT NULL,
    "first_name" VARCHAR(255)   NOT NULL,
    "last_name" VARCHAR(255)   NOT NULL,
    "sex" VARCHAR(255)   NOT NULL,
    "hire_date" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "employee_number"
     )
);

CREATE TABLE "department_manager_junction" (
    "department_number" VARCHAR(255)   NOT NULL,
    "employee_number" INT   NOT NULL
);

CREATE TABLE "department_employee_junction" (
    "employee_number" INT   NOT NULL,
    "department_number" VARCHAR(255)   NOT NULL
);

CREATE TABLE "salaries" (
    "employee_number" INT   NOT NULL,
    "salary" INT   NOT NULL
);

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_title_id" FOREIGN KEY("title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "department_manager_junction" ADD CONSTRAINT "fk_department_manager_junction_department_number" FOREIGN KEY("department_number")
REFERENCES "departments" ("department_number");

ALTER TABLE "department_manager_junction" ADD CONSTRAINT "fk_department_manager_junction_employee_number" FOREIGN KEY("employee_number")
REFERENCES "employees" ("employee_number");

ALTER TABLE "department_employee_junction" ADD CONSTRAINT "fk_department_employee_junction_employee_number" FOREIGN KEY("employee_number")
REFERENCES "employees" ("employee_number");

ALTER TABLE "department_employee_junction" ADD CONSTRAINT "fk_department_employee_junction_department_number" FOREIGN KEY("department_number")
REFERENCES "departments" ("department_number");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_employee_number" FOREIGN KEY("employee_number")
REFERENCES "employees" ("employee_number");

