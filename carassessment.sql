SELECT * FROM car_data;
/* question 1 */
select count(*) from car_data;
use car;
/*question 2*/
select count(*) from car_data where year=2023;
/*question 3*/
select count(*) from car_data where year in (2020,2021,2022);
/*question 4*/
select year, count(*) from car_data group by year;
/*question 5*/
select count(fuel) from car_data where fuel="diesel" and year=2020;
select count(fuel) as diesel , year from car_data where fuel="diesel" and year=2020;
/*question 6*/
select count(fuel) from car_data where fuel="petrol" and year=2020;
/*question 7*/
select year ,count(*) as diesel from car_data where fuel="diesel" group by year;
select year ,count(*) as petrol from car_data where fuel="petrol" group by year;
select year ,count(*) as CNG from car_data where fuel="CNG" group by year;
/*question 8*/
select year, count(*) from car_data group by year having count(*)>100;
/*question 9*/
select count(*) from car_data where year between 2015 and 2023;
/*question 10*/
select * from car_data where year between 2015 and 2023;
