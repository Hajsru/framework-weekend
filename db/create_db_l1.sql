create database frontend_weekend
	with owner postgres
;

create table if not exists events
(
	event_id serial not null
		constraint events_pkey
			primary key,
	name text not null,
	description text,
	event_date date not null,
	place_name text,
	place_picture text
)
;

alter table events owner to postgres
;

create table if not exists speakers
(
	speaker_id integer not null
		constraint speakers_pkey
			primary key,
	name text not null,
	photo text,
	description text
)
;

alter table speakers owner to postgres
;

create table if not exists presentations
(
	presentation_id serial not null
		constraint presentations_pkey
			primary key,
	name text not null,
	description text,
	images text[]
)
;

alter table presentations owner to postgres
;

create table if not exists event_presentations
(
	event_id integer
		constraint event_presentations_events_event_id_fk
			references events,
	presentation_id integer
		constraint event_presentations_presentations_presentation_id_fk
			references presentations,
	event_presentation_id serial not null
		constraint event_presentations_pkey
			primary key
)
;

alter table event_presentations owner to postgres
;

create table if not exists presentation_speakers
(
	presentation_speaker_id serial not null
		constraint presentation_speakers_pkey
			primary key
		constraint presentation_speakers_presentations_presentation_id_fk
			references presentations,
	presentation_id integer,
	speaker_id integer
		constraint presentation_speakers_speakers_speaker_id_fk
			references speakers
)
;

alter table presentation_speakers owner to postgres
;

create table if not exists comments
(
	comment_id serial not null
		constraint comments_pkey
			primary key,
	comment_text text not null
)
;

alter table comments owner to postgres
;

create table if not exists ratings
(
	rating_id serial not null
		constraint ratings_pkey
			primary key,
	rating_value integer default 0 not null
)
;

alter table ratings owner to postgres
;

create table if not exists event_ratings
(
	event_rating_id serial not null
		constraint event_ratings_pkey
			primary key,
	event_id integer not null
		constraint event_ratings_events_event_id_fk
			references events,
	rating_id integer not null
		constraint event_ratings_ratings_rating_id_fk
			references ratings
)
;

alter table event_ratings owner to postgres
;

create table if not exists presentation_ratings
(
	presentation_rating_id serial not null
		constraint presentation_ratings_pkey
			primary key,
	rating_id integer not null
		constraint presentation_ratings_ratings_rating_id_fk
			references ratings,
	presentation_id integer not null
		constraint presentation_ratings_presentations_presentation_id_fk
			references presentations
)
;

alter table presentation_ratings owner to postgres
;

create table if not exists speaker_ratings
(
	speaker_rating_id serial not null
		constraint speaker_ratings_pkey
			primary key,
	rating_id integer not null
		constraint speaker_ratings_ratings_rating_id_fk
			references ratings,
	speaker_id integer not null
		constraint speaker_ratings_speakers_speaker_id_fk
			references speakers
)
;

alter table speaker_ratings owner to postgres
;

create table if not exists event_comments
(
	event_comment_id serial not null
		constraint event_comments_pkey
			primary key,
	comment_id integer not null
		constraint event_comments_comments_comment_id_fk
			references comments,
	event_id integer not null
		constraint event_comments_events_event_id_fk
			references events
)
;

alter table event_comments owner to postgres
;

create table if not exists presentation_comments
(
	presentation_comment_id serial not null
		constraint presentation_comments_pkey
			primary key,
	comment_id integer not null
		constraint presentation_comments_comments_comment_id_fk
			references comments,
	presentation_id integer not null
		constraint presentation_comments_presentations_presentation_id_fk
			references presentations
)
;

alter table presentation_comments owner to postgres
;

create table if not exists speaker_comments
(
	speaker_comment_id serial not null
		constraint speaker_comments_pkey
			primary key,
	comment_id integer not null
		constraint speaker_comments_comments_comment_id_fk
			references comments,
	speaker_id integer not null
		constraint speaker_comments_speakers_speaker_id_fk
			references speakers
)
;

alter table speaker_comments owner to postgres
;

