-- mySQL week 3 project

-- You have been asked to create a database for a new social media application that your company is
-- developing.

-- The database must store user data such as username, email, password, etc…

create database if not exists website;

-- creates a database named website if it does not exist

use website;

-- select website

drop table if exists comment;
drop table if exists post;
drop table if exists user;

-- clears tables as we run script.  Comment is dropped first as it depends on post, then post as it depends 
-- on user, then finally user.

create table user ( 

-- creates user table to store individual data for a user. Contains ID, email, password and username.

	id int(11) not null auto_increment,

-- id can be up to 11 integers long, and will auto fill as needed. Cannot be null as this will be a primary 
-- key.

	email varchar(254) not null,

-- email can be up to 254 characters long, which the max length for an email address.

	password varchar(20) not null,

-- system accepts passwords up to 20 characters long.

	username varchar(20) not null,

-- system accepts usernames up to 20 characters long.

	primary key (id)

-- primary key is set to id.

);



create table post (

-- creates post table to store individual data for a post. Uses a foreign key of user_id to reference the user table. 
-- Contains ID, user_id, post_text, time_created

id int(11) not null auto_increment,
user_id int(11) not null,
post_text text(65535),

-- allows posts to be up to 65535 characters long, in this example.

time_created datetime default current_timestamp,

-- sets date the post was created to current time if nothing is specified.

	primary key (id),
	foreign key (user_id) references user(id)

-- sets primary key to id, and foreign key to user_id for the table user.

);



create table comment (

-- creates comment table to store individual data for a comment similar to the post table. Uses a foreign key of user_id to 
-- reference the user table, and a foreign key of post_id to reference the post table. Contains ID, user_id, post_id, 
-- comment_text and time_created.

id int(11) not null auto_increment,
user_id int(11) not null,
post_id int(15) not null,
comment_text text(65535),
time_created datetime default current_timestamp,

	primary key (id),
	foreign key (user_id) references user(id),

-- sets a foreign key user_id to reference the user table.

	foreign key (post_id) references post(id)

-- sets a foreign key post_id to reference the post table.

);




