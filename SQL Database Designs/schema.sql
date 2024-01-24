
create database social_media_app;


create table user_profile(
	id SERIAL primary key ,
	email_address VARCHAR(255) unique not null,
	password VARCHAR(255) not null,
	country VARCHAR(255),
	date_of_birth date not null,
	given_name VARCHAR(255),
	surname VARCHAR(255) not null
);


create table friendship(
	id SERIAL primary key,
	profile_request INTEGER references user_profile(id) on delete cascade,
	profile_accept INTEGER references user_profile(id),
	status VARCHAR(50) DEFAULT 'Pending'
);


create table user_posts(
	id SERIAL primary key,
	profile_id INTEGER references user_profile(id) on delete cascade,
	written_text text,
	media_location VARCHAR(255),
	created_date TIMESTAMP default CURRENT_TIMESTAMP,
	updated_date TIMESTAMP default CURRENT_TIMESTAMP
)


create table post_like(
	id SERIAL primary key,
    post_id INTEGER references user_posts(id) on delete cascade, 
    profile_id INTEGER references user_profile(id),
    created_datetime TIMESTAMP default CURRENT_TIMESTAMP
);


create table post_comment(
	id SERIAL primary key,
    post_id INTEGER references user_posts(id) on delete cascade,
    profile_id INTEGER references user_profile(id),
    comment_text text,
    created_datetime TIMESTAMP default CURRENT_TIMESTAMP,
    updated_date TIMESTAMP default CURRENT_TIMESTAMP    
);

