<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
            <head>
                <style type="text/css">
                    table.tfmt {
                    background : #86c4cc;
                    border: 1px ;
                    }

                    td.colfmt {
                    border: 1px ;

                    color: black;
                    text-align:right;
                    vertical-align:middle;
                    }

                    th {
                    background-color: #2b2b2b;
                    color: white;
                    }

                </style>
            </head>
            <body>
                <table class="tfmt">
                    <tr>
                        <th style="width:250px">#</th>
                        <th style="width:250px">Name</th>
                        <th style="width:350px">Origin</th>
                        <th style="width:250px">Price</th>
                        <th style="width:250px">Peripheral</th>
                        <th style="width:250px">Cooler</th>
                        <th style="width:250px">Power, WAT</th>
                        <th style="width:250px">Accessory</th>
                        <th style="width:250px">Ports</th>
                        <th style="width:250px">Critical update</th>

                    </tr>

                    <xsl:for-each select="devices/device">

                        <tr>
                            <td class="colfmt">
                                <xsl:value-of select="@devNO"/>
                            </td>

                            <td class="colfmt">
                                <xsl:value-of select="name" />
                            </td>

                            <td class="colfmt">
                                <xsl:value-of select="origin" />
                            </td>

                            <td class="colfmt">
                                <xsl:value-of select="price" />
                            </td>

                            <td class="colfmt">
                                   <xsl:value-of select="types/peripheral" />
                            </td>

                            <td class="colfmt">
                                <xsl:value-of select="types/cooler" />
                            </td>

                            <td class="colfmt">
                                <xsl:value-of select="types/powerWAT" />
                            </td>

                            <xsl:for-each select="types/accessoriesGroup/accessory">
                            <tr>
                                <td class="colfmt">
                                    <xsl:value-of select="." />
                                </td>
                            </tr>
                            </xsl:for-each>

                            <td>
                            <xsl:for-each select="types/ports/port">
                                <tr>
                                <td class="colfmt">
                                    <xsl:value-of select="." />
                                </td>
                                </tr>
                            </xsl:for-each>
                            </td>
                            <td class="colfmt">
                                <xsl:value-of select="critical" />
                            </td>

                        </tr>

                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>