xquery version "1.0" encoding "utf-8";
<resultat>{
for $matiere_uf in //scolarite/matiere_uf
order by  ($matiere_uf)
return
<matiere>
   {$matiere_uf/nom}{
  for $c in //etudiant/notes/matiere_noteS1, $e in //etudiant/notes/matiere_noteS2
    where $c/@id_matiere = $matiere_uf/@id and $e/@id_matiere = $matiere_uf/@id
    group by $d := $matiere_uf/@id
  return let $res := (distinct-values($c/@noteS1),distinct-values($e/@noteS1)) let $res2 := distinct-values($e/@noteS2) return
  <resultat>
  <resultatS1>
  <moyenne>{avg($res)}</moyenne>
  <min>{min($res)}</min>
  <max>{max($res)}</max>
   <nbr_admis>{
     count(for $value in $res
           where $value >=10
         return $value)
  }</nbr_admis>
  <nbr_refus>{
     count(for $value in $res
      where $value < 10
     return ($value))
 }</nbr_refus>
  <nbr_total>{count($res)}</nbr_total>
  </resultatS1>
<resultatS2>
<nbr_admis>{
     count(for $value in $res2
           where $value >=10
         return $value)
  }</nbr_admis>
  <nbr_refus>{
     count(for $value in $res2
      where $value < 10
     return ($value))
 }</nbr_refus>
</resultatS2></resultat>}
</matiere>
}</resultat>