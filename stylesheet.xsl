<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="../../xsl/text.justify.xsl"/>
	<xsl:output method="text"/>

	<xsl:template match="/">
		<xsl:apply-templates select="/RESULTS/Alloc/Rec"/>
		<xsl:call-template name="Trailer"/>
	</xsl:template>
<xsl:function name="functx:pad-string-to-length" as="xs:string"
				  xmlns:functx="http://www.functx.com">
	  <xsl:param name="stringToPad" as="xs:string?"/>
	  <xsl:param name="padChar" as="xs:string"/>
	  <xsl:param name="length" as="xs:integer"/>

	  <xsl:sequence select="
	   substring(
		 string-join (
		   ($stringToPad, for $i in (1 to $length) return $padChar)
		   ,'')
		,1,$length)
	 "/>

	</xsl:function>
	
	
	<xsl:template name="Trailer">
		<xsl:variable name="cnt" select="count(/RESULTS/Alloc/Rec)"/>
		<xsl:variable name="hash" select="sum(/RESULTS/Alloc/Rec/SBQTY)"/>
		<xsl:text>TR0005</xsl:text>
		<xsl:value-of select="concat(functx:pad-string-to-length($hash, '0', 25)" />
		<xsl:text> </xsl:text>
		<xsl:value-of select="concat(functx:pad-string-to-length($cnt, '0', 6)" />
	</xsl:template>


	<xsl:template match="/RESULTS/Alloc/Rec">
		<xsl:variable name="zeroes">000000000</xsl:variable>
		<xsl:value-of select="concat(substring($zeroes,1,4-string-length(SBISS)),SBISS)"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="concat(substring($zeroes,1,5-string-length(SBALC)),SBALC)"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="concat(substring($zeroes,1,4-string-length(SBDES)),SBDES)"/>
		<xsl:text> </xsl:text>
		<xsl:call-template name="justify">
			<xsl:with-param name="value" select="substring(SBUPC,1,12)"/>
			<xsl:with-param name="width" select="12"/>
		</xsl:call-template>
		<xsl:text> </xsl:text>
		<xsl:call-template name="justify">
			<xsl:with-param name="value" select="SBSTS"/>
			<xsl:with-param name="width" select="16"/>
		</xsl:call-template>		
		<xsl:text> </xsl:text>
		<xsl:value-of select="concat(substring($zeroes,1,7-string-length(SBQTY)),SBQTY)"/>
		<xsl:text> </xsl:text>	
		<xsl:call-template name="justify">
			<xsl:with-param name="value" select="SBORD"/>
			<xsl:with-param name="width" select="15"/>
		</xsl:call-template>		
		<xsl:text> </xsl:text>	
		<xsl:call-template name="justify">
			<xsl:with-param name="value" select="SBSHD"/>
			<xsl:with-param name="width" select="15"/>
		</xsl:call-template>
		<xsl:text> </xsl:text>
		<xsl:call-template name="justify">
			<xsl:with-param name="value" select="SBCLD"/>
			<xsl:with-param name="width" select="15"/>
		</xsl:call-template>		
		<xsl:text> </xsl:text>	
		<xsl:call-template name="justify">
			<xsl:with-param name="value" select="SBEXT"/>
			<xsl:with-param name="width" select="15"/>
		</xsl:call-template>		
		<xsl:text> </xsl:text>
		<xsl:value-of select="concat(substring($zeroes,1,7-string-length(SBOQT)),SBOQT)"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="concat(substring($zeroes,1,7-string-length(SBSQT)),SBSQT)"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="concat(substring($zeroes,1,7-string-length(SBCQT)),SBCQT)"/>
		<xsl:text>&#010;</xsl:text>
	</xsl:template>
</xsl:stylesheet>
