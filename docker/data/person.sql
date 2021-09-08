
--
-- Name: country; Type: TABLE; Schema: public; Owner: diva
--

CREATE TABLE public.person (
	id serial NOT NULL PRIMARY KEY,
	info json NOT NULL
);


ALTER TABLE person OWNER TO diva;
