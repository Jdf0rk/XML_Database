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
		</HEAD>
			<BODY><H1> matiereParMatiere.xml </H1>
			
				<TABLE border="1" cellspacing="0" cellpadding="2">
				
					<xsl:apply-templates select="resultat/matiere">
					<xsl:sort select="nom" />
					</xsl:apply-templates>
				
				</TABLE>
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
		<TD STYLE="font-size:14pt font-family:serif">
			<xsl:apply-templates />
		</TD>
	</xsl:template>

	
	<xsl:template match="resultat">
		<TD> 
			<xsl:for-each select="resultatS1">
				<li> moyenne:<xsl:value-of select="moyenne" /> </li>
			</xsl:for-each>
		</TD>	
		<TD>
			<xsl:for-each select="resultatS1">
				<li> min:<xsl:value-of select="min" /> </li>
			</xsl:for-each>
		</TD>		
		<TD> 
			<xsl:for-each select="resultatS1">
				<li> max:<xsl:value-of select="max" /> </li>
			</xsl:for-each>
		</TD>	
		<TD>
			<xsl:for-each select="resultatS1">
				<li> nbr_admis:<xsl:value-of select="nbr_admis" /> </li>
			</xsl:for-each>
		</TD>
		<TD> 
			<xsl:for-each select="resultatS1">
				<li> nbr_refus:<xsl:value-of select="nbr_refus" /> </li>
			</xsl:for-each>
		</TD>	
		<TD>
			<xsl:for-each select="resultatS1">
				<li> nbr_total:<xsl:value-of select="nbr_total" /> </li>
			</xsl:for-each>
		</TD>	
		<TD> 
			<xsl:for-each select="resultatS2">
				<li> nbr_admis:<xsl:value-of select="nbr_admis" /> </li>
			</xsl:for-each>
		</TD>	
		<TD>
			<xsl:for-each select="resultatS2">
				<li> nbr_refus:<xsl:value-of select="nbr_refus" /> </li>
			</xsl:for-each>
		</TD>					
	</xsl:template>
</xsl:stylesheet>
