# Δημιουργία clientuser που μπορεί να προβάλει τα ακίνητα και τα στοιχεία των μεσιτών  
CREATE USER 'clientuser'@'%' IDENTIFIED BY 'mypassword';
GRANT SELECT ON realestatedb.ακίνητο TO 'clientuser'@'%';
GRANT SELECT ON realestatedb.μονοκατοικία TO 'clientuser'@'%';
GRANT SELECT ON realestatedb.διαμέρισμα TO 'clientuser'@'%';
GRANT SELECT ON realestatedb.μεσίτης TO 'clientuser'@'%';

# Δημιουργία agentuser που μπορεί να προβάλει τα ακίνητα,τα συμβόλαια, τους πελάτες και μπορεί να εισάγει, να ενημερώσει και να διαγράψει επισκέψεις                 
CREATE USER 'agentuser'@'%' IDENTIFIED BY 'agentpassword';
GRANT SELECT ON realestatedb.ακίνητο TO 'agentuser'@'%';
GRANT SELECT ON realestatedb.μονοκατοικία TO 'agentuser'@'%';
GRANT SELECT ON realestatedb.διαμέρισμα TO 'agentuser'@'%';
GRANT SELECT ON realestatedb.συμβόλαιο TO 'agentuser'@'%';
GRANT SELECT ON realestatedb.πελάτης TO 'agentuser'@'%';
GRANT SELECT,INSERT,UPDATE, DELETE ON  realestatedb.πελάτης_επισκέπτεται_ακίνητο TO 'agentuser'@'%';
                
# Δημιουργία admin που έχει πλήρη πρόσβαση στη βάση και δικαίωμα τροποποίησης σε όλους τους πίνακες              
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'adminpassword';
GRANT ALL PRIVILEGES ON realestatedb.* TO 'admin'@'localhost';

