
--
-- Name: country; Type: TABLE; Schema: public; Owner: diva
--

CREATE TABLE public.personDomainPart (
	id character varying(255) NOT NULL PRIMARY KEY,
	record jsonb NOT NULL
);


ALTER TABLE personDomainPart OWNER TO diva;
