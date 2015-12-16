#!/bin/sh

fichiers=`ls XML/*.xml`

#for fichier in $fichiers
#do
#	fic=${fichier#XML/}
#	nom=${fic%%.*}
xmllint --noout --schema bd_schema.xsd bd.xml

#done
