<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:uuid="java.util.UUID"
    exclude-result-prefixes="xs uuid" xmlns:oscal="http://csrc.nist.gov/ns/oscal/1.0" xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0"
    expand-text="true">

    <xsl:param name="method" as="xs:string" required="false" select="'dummy'" />

    <xsl:mode on-no-match="shallow-copy" />

    <xsl:template match="metadata/last-modified">

        <xsl:copy>
            <xsl:value-of select="adjust-dateTime-to-timezone(current-dateTime(), xs:dayTimeDuration('PT0H'))" />
        </xsl:copy>

    </xsl:template>

    <xsl:template match="attribute::uuid">

        <xsl:choose>

            <xsl:when test="$method eq 'random-v4'">
                <xsl:attribute name="uuid" select="uuid:randomUUID()" />
            </xsl:when>

            <xsl:when test="$method eq 'dummy'">
                <xsl:attribute name="uuid">
                    <xsl:text>00000000-0000-4000-8000-000000000000</xsl:text>
                </xsl:attribute>
            </xsl:when>

            <xsl:when test="$method eq 'zeroes'">
                <xsl:attribute name="uuid">
                    <xsl:text>00000000-0000-0000-0000-000000000000</xsl:text>
                </xsl:attribute>
            </xsl:when>

            <xsl:when test="$method eq 'remove'">
                <xsl:attribute name="uuid" />
            </xsl:when>

            <xsl:otherwise>
                <xsl:copy-of select="current()" />
            </xsl:otherwise>

        </xsl:choose>

    </xsl:template>

    <xsl:template match="processing-instruction()">
        <xsl:copy-of select="current()" />
        <xsl:text>&#x0a;&#x0a;</xsl:text>
    </xsl:template>

</xsl:stylesheet>
