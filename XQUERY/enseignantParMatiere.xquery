xquery version "1.0" encoding "utf-8";
<resultat>{
for $matiere_uf in //scolarite/matiere_uf
order by  ($matiere_uf)

return
<matiere>{$matiere_uf/nom}
<enseignants>
{for $c in //enseignant
    where $c/matieres/matiere/@id = $matiere_uf/@id
return $c
}
</enseignants>
</matiere>}
</resultat>