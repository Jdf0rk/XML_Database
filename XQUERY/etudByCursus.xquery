xquery version "1.0" encoding "utf-8";
<resultat>{
for $cursus in distinct-values(//scolarite/etudiant/cursus)
order by  ($cursus)

return 
<groupe> {$cursus}
<ListeEtudiant>
{for $c in //scolarite/etudiant
  where $c/cursus = $cursus
return $c
}
</ListeEtudiant>
</groupe>}
</resultat>