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
</nav><br/><br/><br/><br/><br/><br/><H1 style="text-align:center;">Liste des moyennes par matière <small>moyenneParMatiere.xml</small> </H1>			
				<br/><br/><br/>
				<center><TABLE border="1" cellspacing="0" cellpadding="2" class="table-hover" style="text-align:center;">
				<tr><td>Matiere</td><td>Moyenne</td><td>Minimum</td><td>Maximum</td>
<td>Nombre Admis S1</td><td>Nombre Refus S1</td><td>Nombre total S1</td><td>Nombre Admis S2</td><td>Nombre Refus S2</td></tr>
					<xsl:apply-templates select="resultat/matiere">
					<xsl:sort select="nom" />
					</xsl:apply-templates>
				
				</TABLE></center>
			</BODY>
		</HTML>
	</xsl:template>


<!-- Template qui donne la structure de notre page-->
	<xsl:template match="matiere">
		<TR>
			<xsl:apply-templates select="nom"/>
			<xsl:apply-templates select="resultat"/>
		</TR>
	</xsl:template>
	
<!-- Les templates pour recuperer chaque champ -->
	<xsl:template match="nom">
		<TD STYLE="font-size:13pt; font-family:serif; text-align:center; font-weight:bold;">
			<xsl:apply-templates />
		</TD>
	</xsl:template>

	
	<xsl:template match="resultat">
		<TD> 
			<xsl:for-each select="resultatS1">
				<li style="list-style-type:none;"> moyenne:<xsl:choose>
					<xsl:when test="number(moyenne) &lt; 10"><span style="color:red"><xsl:value-of select="moyenne"/></span></xsl:when>
					<xsl:otherwise><span style="color:green"><xsl:value-of select="moyenne"/></span></xsl:otherwise></xsl:choose> </li>
			</xsl:for-each>
		</TD>	
		<TD>
			<xsl:for-each select="resultatS1">
				<li style="list-style-type:none;"> min:<xsl:choose>
					<xsl:when test="number(min) &lt; 10"><span style="color:red"><xsl:value-of select="min"/></span></xsl:when>
					<xsl:otherwise><span style="color:green"><xsl:value-of select="min"/></span></xsl:otherwise></xsl:choose> </li>
			</xsl:for-each>
		</TD>		
		<TD> 
			<xsl:for-each select="resultatS1">
				<li style="list-style-type:none;"> max:<xsl:choose>
					<xsl:when test="number(max) &lt; 10"><span style="color:red"><xsl:value-of select="max"/></span></xsl:when>
					<xsl:otherwise><span style="color:green"><xsl:value-of select="max"/></span></xsl:otherwise></xsl:choose> </li>
			</xsl:for-each>
		</TD>	
		<TD>
			<xsl:for-each select="resultatS1">
				<li style="list-style-type:none;"> nbr_admis:<xsl:choose>
					<xsl:when test="number(nbr_admis) &lt; 1"><span style="color:red"><xsl:value-of select="nbr_admis"/></span></xsl:when>
					<xsl:otherwise><span style="color:green"><xsl:value-of select="nbr_admis"/></span></xsl:otherwise></xsl:choose> </li>
			</xsl:for-each>
		</TD>
		<TD> 
			<xsl:for-each select="resultatS1">
				<li style="list-style-type:none;"> nbr_refus:<xsl:choose>
					<xsl:when test="number(nbr_refus) &gt; 0"><span style="color:red"><xsl:value-of select="nbr_refus"/></span></xsl:when>
					<xsl:otherwise><span style="color:green"><xsl:value-of select="nbr_refus"/></span></xsl:otherwise></xsl:choose>  </li>
			</xsl:for-each>
		</TD>	
		<TD>
			<xsl:for-each select="resultatS1">
				<li style="list-style-type:none;"> nbr_total:<xsl:value-of select="nbr_total" /> </li>
			</xsl:for-each>
		</TD>	
		<TD> 
			<xsl:for-each select="resultatS2">
				<li style="list-style-type:none;"> nbr_admis:<xsl:choose>
					<xsl:when test="number(nbr_admis) &lt; 1"><span style="color:red"><xsl:value-of select="nbr_admis"/></span></xsl:when>
					<xsl:otherwise><span style="color:green"><xsl:value-of select="nbr_admis"/></span></xsl:otherwise></xsl:choose> </li>
			</xsl:for-each>
		</TD>	
		<TD>
			<xsl:for-each select="resultatS2">
				<li style="list-style-type:none;"> nbr_refus:<xsl:choose>
					<xsl:when test="number(nbr_refus) &gt; 0"><span style="color:red"><xsl:value-of select="nbr_refus"/></span></xsl:when>
					<xsl:otherwise><span style="color:green"><xsl:value-of select="nbr_refus"/></span></xsl:otherwise></xsl:choose> </li>
			</xsl:for-each>
		</TD>					
	</xsl:template>
</xsl:stylesheet>
