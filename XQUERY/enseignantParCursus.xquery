xquery version "1.0" encoding "utf-8";
<resultat>{
for $cursus in distinct-values(//scolarite/matiere_uf/cursus)
order by  ($cursus)

return
<annee>{$cursus}
<liste_enseignants>
{for $c in //enseignant, $d in //matiere_uf
    where $c/matieres/matiere/@id = $d/@id and $d/cursus = $cursus
return $c
}
</liste_enseignants>
</annee>}
</resultat>