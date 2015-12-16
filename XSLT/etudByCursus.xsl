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
			<H1> etudByCursus.xml </H1>
			<BODY>
				<TABLE border="1" cellspacing="0" cellpadding="2">
				
					<xsl:apply-templates select="resultat/groupe">
					<xsl:sort select="." />
					</xsl:apply-templates>
				
				</TABLE>
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

	<xsl:template match="annee">
		<TD> <xsl:apply-templates /> </TD>
	</xsl:template>
	
	<xsl:template match="cursus">
		<TD> <xsl:apply-templates /> </TD>
	</xsl:template>
	
	<xsl:template match="groupe">
		<TD> <xsl:apply-templates /> </TD>
	</xsl:template>
	
	<xsl:template match="matieres">
		<TD> 
			<xsl:for-each select="matiere">
				<li> <xsl:value-of select="@id" /> </li>
			</xsl:for-each>
		</TD>
	</xsl:template>
	
	<xsl:template match="notes">
		<TD> 
			<xsl:for-each select="matiere_noteS1">
				<li> id:<xsl:value-of select="@id_matiere" /> </li>
			</xsl:for-each>
		</TD>	
		<TD>
			<xsl:for-each select="matiere_noteS1">
				<li> noteS1:<xsl:value-of select="@noteS1" /> </li>
			</xsl:for-each>
		</TD>	
		<TD> 
			<xsl:for-each select="matiere_noteS2">
				<li> id:<xsl:value-of select="@id_matiere" /> </li>
			</xsl:for-each>
		</TD>	
		<TD>
			<xsl:for-each select="matiere_noteS2">
				<li> noteS2:<xsl:value-of select="@noteS2" /> </li>
			</xsl:for-each>
		</TD>	
			
	</xsl:template>
</xsl:stylesheet>
