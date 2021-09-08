
--
-- Name: country; Type: TABLE; Schema: public; Owner: diva
--

CREATE TABLE public.person (
	id character varying(255) NOT NULL PRIMARY KEY,
	data json NOT NULL
);


ALTER TABLE person OWNER TO diva;
