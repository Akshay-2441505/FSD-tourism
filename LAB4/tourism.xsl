<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:t="http://example.com/tourism"
                version="1.0">
    <xsl:output method="html" indent="yes" />
    
    <xsl:template match="/t:tourism"> 
        <html>
            <head>
                <title>Booking.com</title>
            </head>
            <body>
                <h1>Booking.com</h1>
                <h2>Destinations</h2>
                <table border="1">
                    <tr>
                        <th>Name</th>
                        <th>Type</th>
                        <th>Entry Fee</th>
                    </tr>
                    <xsl:for-each select="t:destinations/t:destination">
                        <tr>
                            <td><xsl:value-of select="t:name" /></td>
                            <td><xsl:value-of select="t:type" /></td>
                            <td><xsl:value-of select="t:entryFee" /></td>
                        </tr>
                    </xsl:for-each>
                </table>
                <h2>Packages</h2>
                <table border="1">
                    <tr>
                        <th>Name</th>
                        <th>Duration (Days)</th>
                        <th>Price</th>
                        <th>Affordability</th>
                    </tr>
                    <xsl:for-each select="t:packages/t:package">
                        <xsl:sort select="t:price" data-type="number" order="ascending" />
                        <tr>
                            <td><xsl:value-of select="t:name" /></td>
                            <td><xsl:value-of select="t:duration" /></td>
                            <td><xsl:value-of select="t:price" /></td>
                            <td>
                                <xsl:choose>
                                    <xsl:when test="t:price &lt; 30000">Budget</xsl:when>
                                    <xsl:when test="t:price &lt;= 50000">Affordable</xsl:when>
                                    <xsl:otherwise>Premium</xsl:otherwise>
                                </xsl:choose>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
