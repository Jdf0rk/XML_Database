xquery version "1.0" encoding "utf-8";
<resultat>{
for $groupe in distinct-values(//scolarite/etudiant/groupe)
order by  ($groupe)

return 
<groupe> {$groupe}
<ListeEtudiant>
{for $c in //scolarite/etudiant
  where $c/groupe = $groupe
return $c
}
</ListeEtudiant>
</groupe>}
</resultat>