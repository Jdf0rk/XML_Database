xquery version "1.0" encoding "utf-8";
<resultat>{
for $annee in distinct-values(//scolarite/matiere_uf/annee)
order by  ($annee)

return
<annee>{$annee}
<liste_enseignants>
{for $c in //enseignant, $d in //matiere_uf
    where $c/matieres/matiere/@id = $d/@id and $d/annee = $annee
return $c
}
</liste_enseignants>
</annee>}
</resultat>