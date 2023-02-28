<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs" expand-text="true" xmlns:oscal="http://csrc.nist.gov/ns/oscal/1.0"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">

    <xsl:mode on-no-match="shallow-copy" />

    <xsl:template match="metadata/last-modified">

        <xsl:copy>
            <xsl:value-of select="adjust-dateTime-to-timezone(current-dateTime(), xs:dayTimeDuration('PT0H'))" />
        </xsl:copy>

    </xsl:template>

</xsl:stylesheet>
