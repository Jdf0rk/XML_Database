#!/bin/sh

fichiers=`ls XSLT/*.xsl`

for fichier in $fichiers
do
	fic=${fichier#XSL/}
	nom=${fic%%.*}
	echo "xsltproc -output HTML/$nom.html XSLT/$nom.xsl XQUERY_Results/$nom.xml"
	xsltproc -output HTML/$nom.html XSLT/$nom.xsl XQUERY_Results/$nom.xml
done
sleep 15
#xsltproc -output HTML/etudiantsAyantAuMoinsDeuxDettes.html XSL/etudiantsParticuliers.xsl XML/Resultats/etudiantsAyantAuMoinsDeuxDettes.xml
#xsltproc -output HTML/etudiantsAyantDesDettesDesAnneesPrecedentes.html XSL/etudiantsParticuliers.xsl XML/Resultats/etudiantsAyantDesDettesDesAnneesPrecedentes.xml
#xsltproc -output HTML/etudiantsNayantAucuneDetteEtAyantAuMoinsUneUFNonValidee.html XSL/etudiantsParticuliers.xsl XML/Resultats/etudiantsNayantAucuneDetteEtAyantAuMoinsUneUFNonValidee.xml
#xsltproc -output HTML/etudiantsNayantAucuneUFNonValideeEtDeuxDettes.html XSL/etudiantsParticuliers.xsl XML/Resultats/etudiantsNayantAucuneUFNonValideeEtDeuxDettes.xml
#xsltproc -output HTML/etudiantsNayantAucuneUFNonValideeEtUneDette.html XSL/etudiantsParticuliers.xsl XML/Resultats/etudiantsNayantAucuneUFNonValideeEtUneDette.xml