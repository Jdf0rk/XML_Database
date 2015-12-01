xquery version "1.0" encoding "utf-8";
<resultat>{
for $etud in //scolarite/etudiant
where count(for $c in $etud/notes/matiere_noteS2 where $c/@noteS2 <10 return $c) > 1
return
<etudiant>{$etud/nom} {$etud/prenom}
<nbr_dettes>{count(for $c in $etud/notes/matiere_noteS2 where $c/@noteS2 <10 return $c)}</nbr_dettes>
<dettes>
{for $c in $etud/notes/matiere_noteS2 where xs:integer($c/@noteS2) <10 return $c}
</dettes>
</etudiant>}
</resultat>