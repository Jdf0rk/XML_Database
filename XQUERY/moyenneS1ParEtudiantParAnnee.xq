xquery version "1.0" encoding "utf-8";
<resultat>{
for $etudiant in //etudiant
order by  ($etudiant)

return
<etudiant>{$etudiant/nom}{$etudiant/prenom}
<moyenne_S1>
{for $annee in (1,2,3,4,5)
return 
<annee>{$annee}<moyenne>{
for $c in $etudiant/notes/matiere_noteS1,$e in //matiere_uf
where $e/xs:integer(annee) = $annee and $c/@id_matiere = $e/@id
group by $d := $annee
return let $res := distinct-values($c/@noteS1) 
return avg(for $value in $res return $value)}
</moyenne></annee>
}
</moyenne_S1>
</etudiant>}
</resultat>