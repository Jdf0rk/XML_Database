<!-- Prologue -->
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
			<H1> enseignantParMatiere.xml </H1>
			<BODY>
				<TABLE border="1" cellspacing="0" cellpadding="2">
				
					<xsl:apply-templates select="resultat/matiere">
					<xsl:sort select="." />
					</xsl:apply-templates>
				
				</TABLE>
			</BODY>
		</HTML>
	</xsl:template>


<!-- Template qui donne la structure de notre page-->
	<xsl:template match="enseignant">
		<TR>
			<xsl:apply-templates select="nom"/>
			<xsl:apply-templates select="prenom"/>
			<xsl:apply-templates select="datenaissance"/>
			<xsl:apply-templates select="grade"/>
			<xsl:apply-templates select="matieres"/>
		</TR>
	</xsl:template>
	
<!-- Les templates pour recuperer chaque champ -->
	<xsl:template match="nom">
		<TD STYLE="font-size:14pt font-family:serif">
			<xsl:apply-templates />
		</TD>
	</xsl:template>
	
	<xsl:template match="prenom">
		<TD> <xsl:apply-templates /> </TD>
	</xsl:template>

	<xsl:template match="datenaissance">
		<TD> <xsl:apply-templates /> </TD>
	</xsl:template>

	<xsl:template match="grade">
		<TD> <xsl:apply-templates /> </TD>
	</xsl:template>
	
	<xsl:template match="matieres">
		<TD> 
			<xsl:for-each select="matiere">
				<li> <xsl:value-of select="@id" /> </li>
			</xsl:for-each>
		</TD>
	
	</xsl:template>

</xsl:stylesheet>
