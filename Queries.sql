/*3) How many females and how many male passengers travelled for a minimum distance of 600 KM s?*/
select Gender, count(Gender) as no_of_males from passenger where Distance >=600 group by gender;

/*4) Find the minimum ticket price for Sleeper Bus. */
select min(price) from price where Bus_Type = 'Sleeper';

/*5) Select passenger names whose names start with character 'S'  */
select passenger_name from passenger where passenger_name like 'S%';

/*6) Calculate price charged for each passenger displaying 
Passenger name, Boarding City, Destination City, Bus_Type, Price in the output */

select p.passenger_name, p.boarding_city, p.destination_city, pr.bus_type, pr.Price from passenger as p
join
price as pr on p.Distance = pr.Distance and p.Bus_Type = pr.Bus_Type;   

/*7) What are the passenger name/s and his/her ticket price 
who travelled in the Sitting bus for a distance of 1000 KM s */

select p.passenger_name,pr.Price from passenger as p
join
price as pr on p.Distance = pr.Distance and p.Bus_Type = pr.Bus_Type
having p.distance >= 1000 and pr.bus_type = 'Sitting';

/*8) What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji? */

select p.Passenger_name,pr.Bus_Type,pr.Price from passenger as p
join
price as pr on p.Distance = pr.Distance
where p.Passenger_name = 'Pallavi';

/*9) List the distances from the "Passenger" table which are unique (non-repeated distances) in descending order. */

select distance from passenger group by distance having count(distance) = 1 ORDER BY distance DESC;

/*10) Display the passenger name and percentage of distance travelled by that passenger
 from the total distance travelled by all passengers without using user variables */
 select passenger_name, distance*100/(select sum(All distance) as total from passenger) as percentage_travelled from passenger;
 
/*11)	Display the distance, price in three categories in table Price
a)	Expensive if the cost is more than 1000
b)	Average Cost if the cost is less than 1000 and greater than 500
c)	Cheap otherwise
*/
 select distance, price,
 Case
 when price>1000 then "Expensive"
 when price<1000 and price>500 then "Average cost"
 else "cheap"
 end
 as Category from price;
 