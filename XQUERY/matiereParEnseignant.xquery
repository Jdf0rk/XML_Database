xquery version "1.0" encoding "utf-8";
<resultat>{
for $enseignant in //scolarite/enseignant
order by  ($enseignant)

return
<enseignant>{$enseignant/nom} {$enseignant/prenom}
<matieres>
{for $c in $enseignant/matieres/matiere, $d in //matiere_uf
    where $c/@id = $d/@id
return $d
}
</matieres>
</enseignant>}
</resultat>