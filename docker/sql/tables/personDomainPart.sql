CREATE TABLE record_personDomainPart (
	id character varying(255) NOT NULL PRIMARY KEY,
	record jsonb NOT NULL
);


ALTER TABLE record_personDomainPart OWNER TO diva;
