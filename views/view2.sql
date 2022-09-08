#Oψη με τις μονοκατοικίες της Θεσσαλονίκης
USE `realestatedb`;
CREATE  OR REPLACE VIEW `μονοκατοικίες_θεσσαλονίκης` AS
SELECT ακίνητο.ΑκίνητοID
FROM realestatedb.μονοκατοικία JOIN realestatedb.ακίνητο ON μονοκατοικία.ΑκίνητοID = ακίνητο.ΑκίνητοID
WHERE πόλη = 'Θεσσαλονίκη';
