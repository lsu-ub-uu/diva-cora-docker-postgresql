
--
-- Name: country; Type: TABLE; Schema: public; Owner: diva
--

CREATE TABLE public.person (
	id character varying(255) NOT NULL PRIMARY KEY,
	record jsonb NOT NULL
);


ALTER TABLE person OWNER TO diva;
