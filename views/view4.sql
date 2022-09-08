#όψη που περιέχει τα συμβόλαια ενοικίασης του κάθε ιδιοκτήτη, το ακίνητο που ενοικιάζεται, και το ποσό
SELECT κωδικός_συμβολαίου,ημερομηνία_υπογραφής, ημερομηνία_εξόφλησης,συμβόλαιο.διάρκεια, ιδιοκτήτης.ονοματεπώνυμο AS ιδιοκτήτης, συμβόλαιο.Ακίνητο_ΑκίνητοID AS αριθμός_ακινήτου, ακίνητο.ποσό
FROM   συμβόλαιο JOIN ιδιοκτήτης ON συμβόλαιο.ΙδιοκτήτηςID = ιδιοκτήτης.ΙδιοκτήτηςID
       JOIN ακίνητο ON συμβόλαιο.ΑκίνητοID = ακίνητο.ΑκίνητοID
WHERE διάρκεια <> 'απεριόριστη'