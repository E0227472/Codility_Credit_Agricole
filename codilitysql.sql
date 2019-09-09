/*
select pond_id, count(select temp_limit from species where id = (select species_id from ducks where pond_id = 10)(select temperature from ponds where pond_id = 10)) as happy_ducks from ducks
where pond_id = 10;
*/


/*
select temp_limit from species where id = (select species_id from ducks where pond_id = 10)
*/

/*
select pond_id, count(id) as happy_ducks from ducks
where (select temp_limit from species where id = (select species_id from ducks where pond_id = 10))<(select temperature from ponds where pond_id = 10);
*/

/*
select pond_id, count(id) as happy_ducks from ducks
where (select temp_limit from species) > (select temperature from ponds); 
*/


select p.id as pond_id, count(d.id) as happy_ducks from 
ducks d
inner join 
ponds p on p.id = d.pond_id	
inner join
species s on s.id = d.species_id
where 
p.temperature >= s.temp_limit and s.temp_preferences = '+' 
or 
p.temperature <= s.temp_limit and s.temp_preferences = '-'
Order By d.pond_id;


/*
p.temperature >= s.temp_limit and s.temp_preferences = '+' or p.temperature <= s.temp_limit and s.temp_preferences = '-'
*/




