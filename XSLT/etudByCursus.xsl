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
			<BODY><div class="container">
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
</nav><br/><br/><br/><br/><br/><br/><H1 style="text-align:center;">Liste des étudiants par Cursus <small>etudByCursus.xml</small> </H1>
			
				<br/><br/><br/><br/><br/><br/><br/>
				 <center><TABLE class="table-hover">
					<xsl:apply-templates select="resultat/groupe">
					<xsl:sort select="." />
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
			<xsl:apply-templates select="datenaissance"/>
			<xsl:apply-templates select="annee"/>
			<xsl:apply-templates select="cursus"/>
			<xsl:apply-templates select="groupe"/>
			<xsl:apply-templates select="matieres"/>
			<xsl:apply-templates select="notes"/>
		</TR>
	</xsl:template>
	<xsl:template match="resultat/groupe">
	<TR style="text-align:center;">
		<TABLE border="1" cellspacing="0" cellpadding="2" class="table-hover">
			
				<td>Nom</td><td>Prenom</td><td>Date de Naissance</td><td>Annee</td><td>Groupe</td><td>Matières</td><td>Matières notées S1</td><td>Notes S1</td><td>Matières notées S2</td><td colspan="2">Notes S2</td>
				<span style="font-size:14pt; font-weight:bold;">Promo <xsl:value-of select="text()"/></span><xsl:apply-templates/>
			
		</TABLE>
	</TR>
	</xsl:template>
<!-- Les templates pour recuperer chaque champ -->
	<xsl:template match="resultat/groupe/text()" />

	<xsl:template match="nom">
		<TD STYLE="font-size:13pt; font-family:serif; text-align:center; font-weight:bold;">
			<xsl:apply-templates />
		</TD>
	</xsl:template>
	
	<xsl:template match="prenom">
		<TD style="text-align: center; font-size:11pt; font-family:serif;"> <xsl:apply-templates /></TD>
	</xsl:template>

	<xsl:template match="datenaissance">
		<TD style="text-align: center;"> <xsl:apply-templates /> </TD>
	</xsl:template>
	
	<xsl:template match="cursus"/>
	
	<xsl:template match="groupe">
		<TD> <xsl:apply-templates /> </TD>
	</xsl:template>

	<xsl:template match="annee">
		<TD> <xsl:apply-templates /> </TD>
	</xsl:template>
	
	<xsl:template match="matieres">
		<TD> 
			<xsl:for-each select="matiere">
				<li style="list-style-type:none;"> <xsl:value-of select="@id" /> </li>
			</xsl:for-each>
		</TD>
	</xsl:template>
	
	<xsl:template match="notes">
		<TD> 
			<xsl:for-each select="matiere_noteS1">
				<li style="list-style-type:none;"> 
<xsl:value-of select="@id_matiere" /> 
				</li>
			</xsl:for-each>
		</TD>	
		<TD>
			<xsl:for-each select="matiere_noteS1">
				<li style="list-style-type:none;"> noteS1:<span style="color:green"><xsl:value-of select="@noteS1"/></span></li>
			</xsl:for-each>
		</TD>	
		<TD> 
			<xsl:for-each select="matiere_noteS2">
				<li style="list-style-type:none;"><xsl:value-of select="@id_matiere" /> </li>
			</xsl:for-each>
		</TD>	
		<TD>
			<xsl:for-each select="matiere_noteS2">
				<li style="list-style-type:none;"> noteS2:<span style="color:red"><xsl:value-of select="@noteS1"/></span></li>
			</xsl:for-each>
		</TD>	
		<TD>
			<xsl:for-each select="matiere_noteS2">
				<li style="list-style-type:none;"> noteS2:<xsl:choose>
			<xsl:when test="number(@noteS2) &lt; 10"><span style="color:red"><xsl:value-of select="@noteS2"/></span></xsl:when>
			<xsl:otherwise><span style="color:green"><xsl:value-of select="@noteS2"/></span></xsl:otherwise></xsl:choose></li>
			</xsl:for-each>
		</TD>	
	</xsl:template>
</xsl:stylesheet>
