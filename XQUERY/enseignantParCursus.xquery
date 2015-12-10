xquery version "1.0" encoding "utf-8";
<resultat>{
for $cursus in distinct-values(//scolarite/matiere_uf/cursus)
order by  ($cursus)

return
<cursus>{$cursus}
<liste_enseignants>
{
  for $c in //enseignant, $d in //matiere_uf
    where $c/matieres/matiere/@id = $d/@id and $d/cursus = $cursus
    group by $d := $c/@id
  return 
    for $a in //enseignant
    where $a/@id = $d
    return $a
}
</liste_enseignants>
</cursus>}
</resultat>