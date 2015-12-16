#!/bin/sh

fichiers=`ls XSLT/*.xsl`

for fichier in $fichiers
do
	fic=${fichier#XSLT/}
	nom=${fic%%.*}
	echo "xsltproc -output HTML/$nom.html XSLT/$nom.xsl XQUERY_Results/$nom.xml"
	xsltproc -output HTML/$nom.html XSLT/$nom.xsl XQUERY_Results/$nom.xml
done
sleep 15