-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/1u0yWF
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

-- Conceptual Model
CREATE TABLE [Departments] (
    [dept_no] VARCHAR(10)  NOT NULL ,
    [dept_name] VARCHAR(50)  NOT NULL 
)

CREATE TABLE [Department_Employees] (
    [emp_no] INT  NOT NULL ,
    [dept_no] VARCHAR(10)  NOT NULL ,
    CONSTRAINT [PK_Department_Employees] PRIMARY KEY CLUSTERED (
        [dept_no] ASC
    )
)

CREATE TABLE [Employees] (
    [emp_no] INT  NOT NULL ,
    [emp_title] VARCHAR(10)  NOT NULL ,
    [birth_date] DATE  NOT NULL ,
    [first_name] VARCHAR(50)  NOT NULL ,
    [last_name] VARCHAR(50)  NOT NULL ,
    [sex] VARCHAR(10)  NOT NULL ,
    [hire_date] DATE  NOT NULL ,
    CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED (
        [emp_no] ASC
    )
)

CREATE TABLE [Salaries] (
    [emp_no] INT  NOT NULL ,
    [salary] INT  NOT NULL 
)

CREATE TABLE [Titles] (
    [title_id] VARCHAR(10)  NOT NULL ,
    [title] VARCHAR(50)  NOT NULL ,
    CONSTRAINT [PK_Titles] PRIMARY KEY CLUSTERED (
        [title_id] ASC
    )
)

ALTER TABLE [Departments] 
	WITH CHECK ADD CONSTRAINT [FK_Departments_dept_no] 
	FOREIGN KEY([dept_no])
	REFERENCES [Department_Employees] ([dept_no])

ALTER TABLE [Departments] CHECK CONSTRAINT [FK_Departments_dept_no]

ALTER TABLE [Department_Employees] 
	WITH CHECK ADD CONSTRAINT [FK_Department_Employees_emp_no] 
	FOREIGN KEY([emp_no])
	REFERENCES [Employees] ([emp_no])

ALTER TABLE [Department_Employees] CHECK CONSTRAINT [FK_Department_Employees_emp_no]

ALTER TABLE [Employees] 
	WITH CHECK ADD CONSTRAINT [FK_Employees_emp_title] 
	FOREIGN KEY([emp_title])
	REFERENCES [Titles] ([title_id])

ALTER TABLE [Employees] CHECK CONSTRAINT [FK_Employees_emp_title]

ALTER TABLE [Salaries] 
	WITH CHECK ADD CONSTRAINT 
	[FK_Salaries_emp_no] 
	FOREIGN KEY([emp_no])
	REFERENCES [Employees] ([emp_no])

ALTER TABLE [Salaries] CHECK CONSTRAINT [FK_Salaries_emp_no]

COMMIT TRANSACTION QUICKDBD