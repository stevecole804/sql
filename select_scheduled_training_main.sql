SELECT smt.ID as ID, smt.title as title, smt.description as description, smt.created as created, 
smt.updated as updated, tr_agency.role as agency_id, smt.completed as completed, 
smt.transferred_to_claroline as transferred, tr_agency.code as prefix, 
smt.claroline_code as suffix, tr_agency.agency as agency
 FROM sch_mandatory_training smt INNER JOIN sch_training_agency_rel 
ON (sch_training_agency_rel.mandatory_training_id = smt.ID) 
INNER JOIN tr_agency ON (tr_agency.role = smt.rid)  
 ORDER BY tr_agency.agency, created, updated, transferred