-- create schema mov_db;--csv_testcsv_testgamepurchase
-- use mov_db;--

create Table movie(
mov_id int not null,
mov_title char (50),
mov_year int not null,
mov_lang char(50),
mov_dt_rel date not null,
mov_rel_country char(5)not null,

constraint moviepk primary key (mov_id)
);

create Table actor(
act_id int not null,
act_fname char(20),
act_lname char(20),
act_gender char(1),

constraint actorpk primary key (act_id)
);

create Table movie_cast (
act_id int not null,
mov_id int not null,
role char (30),

constraint foreign key (act_id) references actor(act_id),
constraint foreign key (mov_id) references movie(mov_id)
);

create Table reviewer(
rev_id int not null,
rev_name char(30),
constraint reviewerpk primary key (rev_id)
); 

create Table rating(
mov_id int not null,
rev_id int not null,
rev_star int not null,
num_o_rating int not null,

constraint foreign key(mov_id) references movie(mov_id),
constraint foreign key(rev_id) references reviewer(rev_id)
);

create Table genres (
gen_id int not null,
gen_title char(20),

constraint genrespk primary key (gen_id)
);

create Table movie_genres(
mov_id int not null,
gen_id int not null,

constraint foreign key(mov_id) references movie(mov_id),
constraint foreign key(gen_id) references genres(gen_id)
);
 select * from rating;
