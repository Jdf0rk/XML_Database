xquery version "1.0" encoding "utf-8";
<resultat>{
for $annee in distinct-values(//scolarite/etudiant/annee)
order by  ($annee)

return 
<annee> {$annee}
<ListeEtudiant>
{for $c in //scolarite/etudiant
  where $c/annee = $annee
return $c
}
</ListeEtudiant>
</annee>}
</resultat>