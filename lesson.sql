
/*  Salamn Müəllim home Task
Salam , hərvaxtınız xeyir. Tasklarınız
task1)
İlk olaraq satışı reallaşmış məhsullar üçün bir cədvəl (tabel) 
yaradırıq və bu cədvəlimizin sütun olaraq məhsul idsi, sayı və
dəyəri (1 dənəsinin)  olacaq. Biz isə hər məhsul 
üçün ümumi olan qazancı gətirib sıralamaq lazımdır

task2)
işçilər adında cədvəlimiz olacaq. Sütun olaraq ad,maaş,
departament olacaq. Siz isə departamentinin adı satış olan 
və maaşı 600-dən çox olan şəxslərin maaşını azalan sıra ilə 
sıralıyın

task3)
kitablar cədvəlimiz olacaq. Sütunları: adı, janrı, nəşr ili
.2015-dən sonra nəşr olunmuş kitbaabları janrına görə artan
sıra ilə sıralıyın

task4)
filmlər adlı cədvəlimiz olacaq. Sütunları : ad, çıxış tarixi,
ratinq. Çıxış tarixi 2000-dən kiçik olanları artan sıra və 
ratingi 7-dən böyük olanları azalan sıra ilə sıralıyın
*/


/*
/*
SQL >> Structered query language >> SQL bir sorgu dilidir. Sirf databaza ile, datalar ile islemek ucundur. 
Arasdirmaq istesez (PL/SQL, SQL / NOSQL)
* DDL - data tanitmaq, elave etmek, yaratmaq ucundur
* DML - Data sorgular ile yoxlanilmasi, conf edilmesi
* DCL - Datalarin yoxlanilmasi.

DDL: CREATE, ALTER, DROP
DML: SELECT, INSERT, UPDATE, DELETE
DCL: GRANT, DENY, REVOKE

SQL sintaksis >> ister boyuk, ister kicik herflerle. Ister yan-yana ister alt alta kodlar yaza bilersiz. (Meslehetim boyuk herflerle yan yana yazmaginizdir)
    
SELECT: Databazada datalari secmek, isarelemek ucundur.
Ex: SELECT * FROM HR.EMPLOYEES;     /     select * from hr.employees;
SELECT 
* 
FROM 
HR.EMPLOYEES;

*/
-- * Butun datalari isaret edir.
-- HR.EMPLOYEES bizim databazamizin, table-mizin adidir.
-- SELECT * FROM HR.EMPLOYEES;
-- select * from hr.employees;
-- SELECT 
-- * 
-- FROM 
-- HR.EMPLOYEES;


-- SELECT * FROM HR.EMPLOYEES;
-- SELECT FIRST_NAME, LAST_NAME FROM HR.EMPLOYEES;

/*
SELECT-de ne kimi datalari filtirlemek ucun ozellikler, kodlar movcuddur:
WHERE - Table-da hansi datani secmek isteyirsen, is gormek isteyirsense onu isaret edirsen
ORDER BY - Secilen datani siralamaq ucundur(SORT)
GROUP BY - Datalarin gruplasdirilmasinda rol oynayir.
*/

-- ORDER BY:
-- SELECT * FROM HR.EMPLOYEES;
-- SELECT * FROM HR.EMPLOYEES ORDER BY SALARY; >> maasi kicikden boyuye dogru siralayir
-- SELECT * FROM HR.EMPLOYEES ORDER BY SALARY DESC; >> maasi boyukden kiciye dogru siralayir

-- WHERE:
-- SELECT * FROM HR.EMPLOYEES;
-- SELECT FIRST_NAME, SALARY FROM HR.EMPLOYEES WHERE SALARY BETWEEN 10000 AND 24000; >> Maasi [10min-24min] araliginda olan userleri goster
-- SELECT FIRST_NAME, SALARY FROM HR.EMPLOYEES WHERE SALARY BETWEEN 10000 AND 24000 ORDER BY SALARY;
-- SELECT * FROM HR.EMPLOYEES WHERE JOB_ID='IT_PROG' AND SALARY BETWEEN 5000 AND 10000 ORDER BY SALARY;
-- SELECT FIRST_NAME, SALARY FROM HR.EMPLOYEES WHERE SALARY BETWEEN 24000 AND 10000; >> reqem kicikden boyuye dogru irellemelidir

-- SELECT * FROM HR.EMPLOYEES WHERE FIRST_NAME LIKE '%xan%' >> Like operatoru include kimi fikirlese bilerik.
-- % onde olduqda sonlugu, sonda olduqda on hissede axtaris edir. Hem son hem evvelde olduqda datanin icerisinde axtaris edir.


-- GROUP BY
-- SELECT * FROM HR.EMPLOYEES;
SELECT JOB_ID, SUM(SALARY) AS TOTAL_SALARY FROM HR.EMPLOYEES HAVING SUM(SALARY) > 40000 GROUP BY JOB_ID ORDER BY TOTAL_SALARY;
*/




----------------------------------------------------------------------
/*
task1)
İlk olaraq satışı reallaşmış məhsullar üçün bir cədvəl (tabel) 
yaradırıq və bu cədvəlimizin sütun olaraq məhsul idsi, sayı və
dəyəri (1 dənəsinin)  olacaq. Biz isə hər məhsul 
üçün ümumi olan qazancı gətirib sıralamaq lazımdır
*/
/*

    CREATE TABLE sales (
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10, 2)
);
INSERT INTO sales (product_id, quantity, unit_price) VALUES
(1, 10, 5.00),
(2, 5, 7.50),
(1, 3, 5.00),
(3, 8, 12.00),
(2, 2, 7.50);

SELECT
    product_id,
    SUM(quantity * unit_price) AS total_revenue
FROM
    sales
GROUP BY
    product_id
ORDER BY
    total_revenue DESC;
*/
-- 


-------------------------------------------------------------------------------

/*
task2)
işçilər adında cədvəlimiz olacaq. Sütun olaraq ad,maaş,
departament olacaq. Siz isə departamentinin adı satış olan 
və maaşı 600-dən çox olan şəxslərin maaşını azalan sıra ilə 
sıralıyın
*/

/*
CREATE TABLE employees (
    name VARCHAR(100),
    salary DECIMAL(10, 2),
    department VARCHAR(50)
);

INSERT INTO employees (name, salary, department) VALUES

('Mirqafar', 800, 'Satış'),
('Farid', 500, 'Mühəndislik'),
('Günay', 900, 'Satış'),
('Ulvi', 650, 'Satış'),
('Aysel', 600, 'Satış'),
('Emin', 700, 'Maliyyə');


SELECT
    name,
    salary,
    department
FROM
    employees
WHERE
    department = 'Satış' AND
    salary > 600
ORDER BY
    salary DESC;


*/

--------------------------------------------------------

/*task3)
kitablar cədvəlimiz olacaq. Sütunları: adı, janrı, nəşr ili
.2015-dən sonra nəşr olunmuş kitbaabları janrına görə artan
sıra ilə sıralıyın
*/

/*

CREATE TABLE books (
    title VARCHAR(255),
    genre VARCHAR(100),
    publication_year INT
);

INSERT INTO books (title, genre, publication_year) VALUES
('Book1', 'Kurtlar vadisi', 2016),
('Book2', 'Legend', 2018),
('Book3', 'Prison Brake', 2014),
('Book4', 'Game of Thrones', 2019),
('Book5', 'Fiction', 2017),
('Book6', 'House of Dragon', 2021);

SELECT
    title,
    genre,
    publication_year
FROM
    books
WHERE
    publication_year > 2015
ORDER BY
    genre ASC;

*/




-----------------------------------------------------
/* task4)  
filmlər adlı cədvəlimiz olacaq. Sütunları : ad, çıxış tarixi,
ratinq. Çıxış tarixi 2000-dən kiçik olanları artan sıra və 
ratingi 7-dən böyük olanları azalan sıra ilə sıralıyın
*/

CREATE TABLE movies (
    title VARCHAR(255),
    release_date DATE,
    rating DECIMAL(3, 1)
);

INSERT INTO movies (title, release_date, rating) VALUES
('The Beatiful Mind', '1999-05-15', 8.2),
('The Legend', '2001-07-20', 6.9),
('Prison Break', '1998-12-25', 7.5),
('The Dark', '2003-03-14', 7.1),
('The Crown', '1995-11-22', 8.0),
('Good Will Hunting', '2004-06-30', 5.4);.


-- Çıxış tarixi 2000-dən kiçik olan filmləri artan sıraya görə sıralamaq
SELECT
    title,
    release_date,
    rating
FROM
    movies
WHERE
    release_date < '2000-01-01'
ORDER BY
    release_date ASC;



-- Ratinqi 7-dən böyük olan filmləri azalan sıraya görə sıralamaq

SELECT
    title,
    release_date,
    rating
FROM
    movies
WHERE
    rating > 7
ORDER BY
    rating DESC;

