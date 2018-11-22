create database frontend_weekend
	with owner postgres
;

create table events
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

create table speakers
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

create table presentations
(
	presentation_id serial not null
		constraint presentations_pkey
			primary key,
	name text not null,
	description text,
	images text[],
	event_id integer not null
		constraint presentations_events_event_id_fk
			references events
)
;

alter table presentations owner to postgres
;

create table comments
(
	comment_id serial not null
		constraint comments_pkey
			primary key,
	comment_text text not null
)
;

alter table comments owner to postgres
;

create table ratings
(
	rating_id serial not null
		constraint ratings_pkey
			primary key,
	rating_value integer default 0 not null
)
;

alter table ratings owner to postgres
;

create table event_ratings
(
	event_id integer not null
		constraint event_ratings_events_event_id_fk
			references events,
	rating_id integer not null
		constraint event_ratings_ratings_rating_id_fk
			references ratings,
	constraint event_ratings_pk
		primary key (event_id, rating_id)
)
;

alter table event_ratings owner to postgres
;

create unique index event_ratings_rating_id_uindex
	on event_ratings (rating_id)
;

create table presentation_ratings
(
	rating_id integer not null
		constraint presentation_ratings_ratings_rating_id_fk
			references ratings,
	presentation_id integer not null
		constraint presentation_ratings_presentations_presentation_id_fk
			references presentations,
	constraint presentation_ratings_pk
		primary key (rating_id, presentation_id)
)
;

alter table presentation_ratings owner to postgres
;

create unique index presentation_ratings_rating_id_uindex
	on presentation_ratings (rating_id)
;

create table speaker_ratings
(
	rating_id integer not null
		constraint speaker_ratings_ratings_rating_id_fk
			references ratings,
	speaker_id integer not null
		constraint speaker_ratings_speakers_speaker_id_fk
			references speakers,
	constraint speaker_ratings_pk
		primary key (rating_id, speaker_id)
)
;

alter table speaker_ratings owner to postgres
;

create unique index speaker_ratings_rating_id_uindex
	on speaker_ratings (rating_id)
;

create table event_comments
(
	comment_id integer not null
		constraint event_comments_comments_comment_id_fk
			references comments,
	event_id integer not null
		constraint event_comments_events_event_id_fk
			references events,
	constraint event_comments_pk
		primary key (comment_id, event_id)
)
;

alter table event_comments owner to postgres
;

create unique index event_comments_comment_id_uindex
	on event_comments (comment_id)
;

create table presentation_comments
(
	comment_id integer not null
		constraint presentation_comments_comments_comment_id_fk
			references comments,
	presentation_id integer not null
		constraint presentation_comments_presentations_presentation_id_fk
			references presentations,
	constraint presentation_comments_pk
		primary key (comment_id, presentation_id)
)
;

alter table presentation_comments owner to postgres
;

create unique index presentation_comments_comment_id_uindex
	on presentation_comments (comment_id)
;

create table speaker_comments
(
	comment_id integer not null
		constraint speaker_comments_comments_comment_id_fk
			references comments,
	speaker_id integer not null
		constraint speaker_comments_speakers_speaker_id_fk
			references speakers,
	constraint speaker_comments_pk
		primary key (comment_id, speaker_id)
)
;

alter table speaker_comments owner to postgres
;

create unique index speaker_comments_comment_id_uindex
	on speaker_comments (comment_id)
;

create table presentation_speakers
(
	speaker_id integer not null
		constraint presentation_speakers_speakers_speaker_id_fk
			references speakers,
	presentation_id integer not null
		constraint presentation_speakers_presentations_presentation_id_fk
			references presentations,
	constraint presentation_speakers_pk
		primary key (speaker_id, presentation_id)
)
;

alter table presentation_speakers owner to postgres
;

