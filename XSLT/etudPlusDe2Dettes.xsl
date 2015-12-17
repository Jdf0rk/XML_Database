<?xml version="1.0" encoding="UTF-8" ?>

<!-- Root element -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<!-- Output element -->
	<xsl:output 
    	method="html"
    	encoding="UTF-8"
    	doctype-public="-//W3C//DTD HTML 5//EN"
    	doctype-system="http://www.w3.org/TR/html5/strict.dtd"
    	indent="yes" />

<!-- Le reste du document sera un ensemble de template -->

<!-- Le template central pour la mise en forme général.-->
	<xsl:template match="/">
		<HTML>
		<HEAD>
				<!-- Latest compiled and minified CSS -->
			<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous"/>

			<!-- Optional theme -->
			<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous"/>

			<!-- Latest compiled and minified JavaScript -->
			<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
<style type="text/css">
   body { background: #F3E2A9 !important; }
</style>
		</HEAD>
			<BODY><nav class="navbar navbar-default navbar-fixed-top"><div class="container">
    <ul class="nav navbar-nav">
		<li><a href="../HTML/enseignantParAnnee.html">Ens Ann</a></li>
		<li><a href="../HTML/enseignantParCursus.html">Ens Cur</a></li>
		<li><a href="../HTML/enseignantParMatiere.html">Ens Mat</a></li>
		<li><a href="../HTML/etudByAnnee.html">Etud Ann</a></li>
		<li><a href="../HTML/etudByCursus.html">Etud Cur</a></li>
		<li><a href="../HTML/etudByGroup.html">Etud Group</a></li>
		<li><a href="../HTML/etudDettes.html">Etud Dette</a></li>
		<li><a href="../HTML/etudPlusDe2Dettes.html">Etud +2 Dettes</a></li>
		<li><a href="../HTML/matiereParEnseignant.html">Mat par Ens</a></li>
		<li><a href="../HTML/moyenneParMatiere.html">Moy Mat</a></li>
		<li><a href="../HTML/moyenneS1ParEtudiantParAnnee.html">Moy S1 etud</a></li>
	</ul>
  </div>
</nav><br/><br/><br/><br/><br/><br/><H1 style="text-align:center;">Liste des étudiants qui ont plus de 2 dettes <small>etud2Dettes.xml</small> </H1>
			<br/><br/><br/><br/><br/><br/>
				 <center><TABLE border="1" cellspacing="0" cellpadding="2" class="table-hover">
				<span style="font-size:14pt; font-family:serif;"><td>Nom</td><td>Prenom</td><td>Nombre de dettes</td><td>Matières</td><td>Note S1</td><td>Note S2</td></span>
					<xsl:apply-templates select="resultat/etudiant">
					<xsl:sort select="nom" />
					</xsl:apply-templates>
				
				</TABLE> </center>
			</BODY>
		</HTML>
	</xsl:template>


<!-- Template qui donne la structure de notre page-->
	<xsl:template match="etudiant">
		<TR>
			<xsl:apply-templates select="nom"/>
			<xsl:apply-templates select="prenom"/>
			<xsl:apply-templates select="nbr_dettes"/>
			<xsl:apply-templates select="dettes"/>
		</TR>
	</xsl:template>
	
<!-- Les templates pour recuperer chaque champ -->
	<xsl:template match="nom">
		<TD STYLE="font-size:12pt;">
			<xsl:apply-templates />
		</TD>
	</xsl:template>
	
	<xsl:template match="prenom">
		<TD> <xsl:apply-templates /> </TD>
	</xsl:template>

	<xsl:template match="nbr_dettes">
		<TD style="text-align:center;"> <xsl:apply-templates /> </TD>
	</xsl:template>

	
	<xsl:template match="dettes">
		<TD> 
			<xsl:for-each select="matiere_noteS2">
				<li style="list-style-type:none;">  id:<xsl:value-of select="@id_matiere" /> </li>
			</xsl:for-each>
		</TD>	
		<TD>
			<xsl:for-each select="matiere_noteS2">
				<li style="list-style-type:none;">  noteS1:<span style="color:red"><xsl:value-of select="@noteS1" /> </span></li>
			</xsl:for-each>
		</TD>		
		<TD>
			<xsl:for-each select="matiere_noteS2">
				<li style="list-style-type:none;">  noteS2:<span style="color:red"><xsl:value-of select="@noteS2" /> </span></li>
			</xsl:for-each>
		</TD>	
			
	</xsl:template>
</xsl:stylesheet>
