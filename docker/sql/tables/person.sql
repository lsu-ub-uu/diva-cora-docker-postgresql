CREATE TABLE record_person (
	id character varying(255) NOT NULL PRIMARY KEY,
	datadivider character varying(255) NOT NULL,
	record jsonb NOT NULL
);


ALTER TABLE record_person OWNER TO diva;
