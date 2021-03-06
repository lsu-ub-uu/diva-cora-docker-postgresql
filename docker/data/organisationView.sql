CREATE OR REPLACE VIEW public.divaOrganisation 
as select CAST(o.organisation_id as varchar) as id, o.domain, o.organisation_name as defaultname, 
o.organisation_name_locale, o.closed_date, o.organisation_code, o.orgnumber, o.organisation_homepage, 
o.not_eligible, o.show_in_portal, o.show_in_defence, o.top_level, 
ot.organisation_type_code as type_code, alt.organisation_name_id, 
coalesce(alt.organisation_name,'') as alternative_name,
a.address_id, a.city, a.street, a.postbox, a.postnumber, a.country_code 
from public.organisation o 
left join organisation_type ot on o.organisation_type_id = ot.organisation_type_id 
left join organisation_name alt on o.organisation_id = alt.organisation_id 
left join organisation_address a on o.address_id = a.address_id; 

CREATE OR REPLACE VIEW public.divaOrganisationPredecessor 
as 
select op.organisation_id, op.organisation_predecessor_id, opd.organisation_predecessor_id 
as predecessorDescriptionId, opd.description,
CASE
    WHEN o.organisation_type_id = 49 THEN 'rootOrganisation'
    WHEN o.top_level THEN 'topOrganisation'
    ELSE 'subOrganisation'
END AS coraOrganisationType
from organisation_predecessor op 
left join organisation_predecessor_description opd on op.organisation_id = opd.organisation_id 
AND op.organisation_predecessor_id = opd.predecessor_id 
left join organisation o on op.organisation_predecessor_id = o.organisation_id;


CREATE OR REPLACE view public.divaOrganisationParent 
as
select op.organisation_id, op.organisation_parent_id,
CASE
    WHEN organisation_type_id = 49 THEN 'rootOrganisation'
    WHEN top_level THEN 'topOrganisation'
    ELSE 'subOrganisation'
END AS coraOrganisationType
from organisation_parent op left join organisation o on op.organisation_parent_id = o.organisation_id;



CREATE OR REPLACE VIEW public.suborganisationview 
as select o.organisation_id as id, o.domain, o.organisation_name as defaultname, 
o.organisation_name_locale, o.closed_date, o.organisation_code, o.orgnumber, o.organisation_homepage, 
o.not_eligible, o.show_in_portal, o.show_in_defence, o.top_level, 
ot.organisation_type_code as type_code, alt.organisation_name_id, 
coalesce(alt.organisation_name,'') as alternative_name,
a.address_id, a.city, a.street, a.postbox, a.postnumber, a.country_code 
from public.organisation o 
left join organisation_type ot on o.organisation_type_id = ot.organisation_type_id 
left join organisation_name alt on o.organisation_id = alt.organisation_id 
left join organisation_address a on o.address_id = a.address_id where o.organisation_type_id <> 49 and not top_level; 

CREATE OR REPLACE VIEW public.toporganisationview 
as select o.organisation_id as id, o.domain, o.organisation_name as defaultname, 
o.organisation_name_locale, o.closed_date, o.organisation_code, o.orgnumber, o.organisation_homepage, 
o.not_eligible, o.show_in_portal, o.show_in_defence, o.top_level, 
ot.organisation_type_code as type_code, alt.organisation_name_id, 
coalesce(alt.organisation_name,'') as alternative_name,
a.address_id, a.city, a.street, a.postbox, a.postnumber, a.country_code 
from public.organisation o 
left join organisation_type ot on o.organisation_type_id = ot.organisation_type_id 
left join organisation_name alt on o.organisation_id = alt.organisation_id 
left join organisation_address a on o.address_id = a.address_id where o.organisation_type_id <> 49 and top_level; 


CREATE OR REPLACE VIEW public.rootorganisationview 
as select o.organisation_id as id, o.domain, o.organisation_name as defaultname, 
o.organisation_name_locale, o.closed_date, o.organisation_code, o.orgnumber, o.organisation_homepage, 
o.not_eligible, o.show_in_portal, o.show_in_defence, o.top_level, 
ot.organisation_type_code as type_code, alt.organisation_name_id, 
coalesce(alt.organisation_name,'') as alternative_name,
a.address_id, a.city, a.street, a.postbox, a.postnumber, a.country_code 
from public.organisation o 
left join organisation_type ot on o.organisation_type_id = ot.organisation_type_id 
left join organisation_name alt on o.organisation_id = alt.organisation_id 
left join organisation_address a on o.address_id = a.address_id where o.organisation_type_id = 49; 

CREATE OR REPLACE VIEW public.organisationview 
as select o.organisation_id as id, o.domain, o.organisation_name as defaultname, 
o.organisation_name_locale, o.closed_date, o.organisation_code, o.orgnumber, o.organisation_homepage, 
o.not_eligible, o.show_in_portal, o.show_in_defence, o.top_level, 
ot.organisation_type_code as type_code, alt.organisation_name_id, 
coalesce(alt.organisation_name,'') as alternative_name,
a.address_id, a.city, a.street, a.postbox, a.postnumber, a.country_code 
from public.organisation o 
left join organisation_type ot on o.organisation_type_id = ot.organisation_type_id 
left join organisation_name alt on o.organisation_id = alt.organisation_id 
left join organisation_address a on o.address_id = a.address_id; 


CREATE OR REPLACE VIEW public.organisationrelations
as select distinct op.organisation_id, op.organisation_predecessor_id as relation from organisation_predecessor op
union all
select oparent.organisation_id, oparent.organisation_parent_id from organisation_parent oparent;

