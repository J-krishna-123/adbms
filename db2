1.A.CREATE THE FOLLOWING TABLE:
create table students(std_id int primary key,name varchar(20),class varchar(20),city varchar(20),total_marks int,percentage float,deptid int references department(deptid));
create table staff(staff_id int primary key,name varchar(20),deptid int refers department(deptid),designation varchar(20),salary int,city varchar(20));
create table department(deptid int primary key,name varchar(20));
create table company(comp_id int primary key,name varchar(20) NOT NULL,city varchar(20),no_of_emp int);
create table employe(emp_id int primary key,name varchar(20),comp_id int references company(comp_id),designation varchar(20),salary int,city varchar(20));
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
2.a. Insert deatils
insert into students values(1,'revathy','s2','tvpm',89,89.00,101);
insert into students values(2,'meenu','s1','tvpm',99,99.00,102);
insert into students values(3,'paru','s1','tvpm',88,88.00,102);
insert into students values(4,'kripa','s2','tvpm',45,45.00,101);
insert into students values(5,'thrisha','s2','tvpm',57,57.00,102);

insert into staff values(1,'ratheesh',101,'CLERK',250000,'ernakulam');
insert into staff values(2,'priya',102,'TEACHER',20000,'tvpm');
insert into staff values(3,'praveena',102,'TEACHER',34000,'tvpm');
insert into staff values(4,'murthy',101,'CLERK',20000,'kollam');
insert into staff values(5,'deepa',101,'associated professor',500000,'idukki');

insert into department values(101,'mca');
insert into department values(102,'bca'); 

insert into company values(200,'technopark','kollam',102);
insert into company values(201,'infosys','tvpm',105);
insert into company values(203,'rm','tvpm',500);
insert into company values(204,'tcs','ernakulam',410);
insert into company values(205,'wipro','kollam',100);

insert into employe values(2,'vijay',200,'gm',50000,'kollam');
insert into employe values(1,'varun',201,'pa',25000,'tvpm');
insert into employe values(3,'maya',203,'eng',20000,'pathanamthitta');
insert into employe values(4,'priya',204,'eng',20000,'tvpm');
insert into employe values(5,'sanal',205,'pa',25000,'tvpm');
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
B.DISPLAY ALL EMPLOYEE

QUERY:select * from employe;
OUTPUT:

    EMP_ID     NAME            COMP_ID  DESIGNATION              SALARY          CITY
----------        -------------------         ----------       --------------------                  ------------        ------------------
    2                vijay                       200         gm                        50000           kollam


    1                varun                       201        pa                        25000            tvpm


    3                maya                        203        eng                       20000           pathanamthitta

    4                 priya                       204 eng                       20000                    tvpm

     5                sanal                       205 pa                        25000                    tvpm
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
C.DISPLAY ALL STUDENT DETAILS SORTED ON DEPARTMENT WISE

QUERY:select * from students order by deptid;

OUTPUT:
    STD_ID  NAME                 CLASS                CITY   TOTAL_MARKS PERCENTAGE     DEPTID
---------- ------ -------------- -------------------- -------------------          ----------- ---------- ----------

         4   kripa                s2                   tvpm                 45                        45                  101
        

         1   revathy              s2                   tvpm                89                        89                 101
         

         5   thrisha              s2                   tvpm               57                         57                  102
      
         2    meenu                s1                   tvpm               99                         99                  102

         3    paru                 s1                   tvpm                  88                         88                  102
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
D.DISLPAY ALL STAFF DETAILS WHOSE SALARY > 20000.
 
QUERY:Select * from staff where salary>20000;
 
OUTPUT:
  STAFF_ID    NAME                 DEPTID         DESIGNATION        SALARY           CITY
------------------   ------------          --------------------        --------------------          --------------------  --------------------
1                    ratheesh              101                CLERK                    250000        ernakulam


 3                    praveena            102              TEACHER                   34000           tvpm


 5                    deepa                  101         associated professor     500000       idukki
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
E.DISLPAY STUDENT DETAILS WHOSE PRECENTAGE >80 AND <90.

QUERY:select name,percentage from students where percentage between 80 and 90;

OUTPUT:
NAME                 PERCENTAGE
-----------                  -------------------
revathy                      89
paru                           88
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
3.A.DISPLAY STUDENTS WHO BELONGS TO'MCA' DEPARTMENT
 
QUERY:select * from students,department where students.deptid=department.deptid and department.name='mca'; 
OUTPUT:
    STD_ID          NAME                 CLASS                CITY            TOTAL_MARKS PERCENTAGE     DEPTID             DEPTID    NAME
--------------------- -------------------- ------------------------------    --------------------    --------------------      -----------------------  -----------------       ----------------   -------------- 

    1                revathy                   s2                      tvpm             89                           89                   101                    101         mca
        

     4               kripa                     s2                        tvpm              45                         45                     101                    101           mca
 ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------        
B.UPDATE SALARY OF ALL STAFF BY 10% WHOSE DESIGNATION IS   'PROFESSOR'

QUERY:UPDATE staff SET Salary = Salary + (Salary *10/100) where designation='associated professor';
 
OUTPUT: 1 row updated.
BEFORE:  STAFF_ID           NAME          DEPTID  DESIGNATION                  SALARY       CITY
                  ----------          --------------------      ----------      --------------------                   ---------------    ---------------
                  5                       deepa         101           associated professor     500000    idukki

AFTER: STAFF_ID           NAME          DEPTID  DESIGNATION                  SALARY       CITY
                  ----------          --------------------      ----------      --------------------                   ---------------    ---------------
                  5                       deepa         101           associated professor     550000    idukki
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
C.DISPLAY ALL EMPLOYEE WHOSE CITY IS SAME AS THEIR COMPANY THEY WORK

QUERY:select * from employe,company where employe.city =company.city  and company.comp_id=employe.comp_id;

OUTPUT:
    EMP_ID       NAME             COMP_ID     DESIGNATION             SALARY        CITY              COMP_ID      NAME                 CITY         NO_OF_EMP
    --------------       -----------          -------------------    -------------------------         -----------------   ----------------    ----------------------  ------------------   -------------------- -------------------------

        2               vijay                200                    gm                        50000        kollam             200           technopark         kollam     102

         1              varun              201                    pa                         25000         tvpm               201            infosys                tvpm       105

    EMP_ID NAME                    COMP_ID DESIGNATION              SALARY
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
D.DISPLAY THE COUNT OF STAFF DEPARTMENT WISE

QUERY:select count(staff_id) from staff,department where staff.deptid = department.deptid group by department.deptid;

OUTPUT:
COUNT(STAFF_ID)
-----------------------------
              2
              3
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
E.DELETE THE EMPLOYEE WHO ARE WORKING INN THE COMPANY WHOSE NO:OF EMPLOYEE IS <105

QUERY:delete from employe where comp_id in  (select employe.comp_id from company,employe where  employe.comp_id = company.comp_id and company.no_of_emp<105);

OUTPUT :
2 rows deleted.
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
4.A.DISPLAY NAME OF STAFF AND STUDENT DETAILS THAT BELONG TO SAME DEPARTMENT.

QUERY: select staff.deptid as sde,students.deptid as stdep,staff.name,students.name from staff,students where staff.deptid= students.deptid ;
OUTPUT:
       SDE      STDEP          NAME              NAME
------------------ --------------------  ---------------        ---------------
       101        101            deepa               revathy
       101        101            murthy              revathy
       101        101            ratheesh           revathy
       102        102            praveena          meenu
       102        102            priya                  meenu
       102        102            praveena          paru
       102        102            priya                  paru
       101        101            deepa                kripa
       101        101            murthy               kripa
       101        101            ratheesh            kripa
       102        102            praveena           thrisha
       102        102            priya                   thrisha
 -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
B.DISPLAY THE STAFF WHO EARN MAXIMUM SALARY FROM EACH DEPARTMENT

QUERY:select deptid,max(salary) from staff group by deptid;
OUTPUT:
    DEPTID     MAX(SALARY)
   ----------------   --------------------------
       102         34000
       101         550000
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
C.DISPLAY STAFF WHOSE SALARY > 25000  AND CITY SAME AS HIS/HER STUDENT.

QUERY:select staff.name from staff,students where staff.salary>25000 and staff.city = students.city and staff.deptid = students.deptid;

OUTPUT:
NAME
---------------
praveena
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
D.DISPLAY ALL EMPLOYEE DETAILS THAT BELONG TO THAT COMPANY HAVING NO:OF EMPLOYEE IS MAXIMUM.

QUERY:select employe.name from employe,company where employe.comp_id = company.comp_id and company.no_of_emp = (select max(no_of_emp) from company);
OUTPUT:
NAME
---------------
maya
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
E:UPDATE THE EMPLOYEE SALARY BY 8% WHO BELONGS TO 'TRIVANDRAM' WHOSE DESIGNATION IS 'PA' AND CITY AS SAME AS WHERE HE WORKS.

QUERY:UPDATE employe SET Salary = Salary + (Salary *8/100) where city='tvpm' and designation = 'pa' and city = (select employe.city from company,employe where company.comp_id = employe.comp_id and company.city=employe.city);
 
OUTPUT:
1 row updated.
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
