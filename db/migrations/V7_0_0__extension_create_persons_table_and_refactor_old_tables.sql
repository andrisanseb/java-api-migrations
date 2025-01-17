drop table films;
drop table directors;
drop table writers;
drop table stars;

create table people (id serial primary key, name text unique);

--create directors, stars, writers tables which have the people key as a unique identifier
create table directors 
(
people_id int unique, 
FOREIGN KEY (people_id) REFERENCES people(id),
country text
);

create table actors 
(
people_id int unique, 
FOREIGN KEY (people_id) REFERENCES people(id),
dob text
);

create table writers 
(
people_id int unique, 
FOREIGN KEY (people_id) REFERENCES people(id),
email text
);

create table films 
(
id serial primary key,
title text,
year int,
genre text,
score int,
director_id int,
star_id int,
writer_id int,
foreign key (director_id) references directors(people_id),
foreign key (star_id) references actors(people_id),
foreign key (writer_id) references writers(people_id)
);
