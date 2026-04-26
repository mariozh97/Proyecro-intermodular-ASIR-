<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:output method="html" indent="yes"/>

<xsl:template match="/">

<html>

<head>
    <title>Incidencias</title>
    <link rel="stylesheet" type="text/css" href="../css/estilo.css"/>
</head>

<body>

<h1>Listado de Incidencias</h1>

<table>
<tr>
    <th>ID</th>
    <th>Descripción</th>
    <th>Estado</th>
    <th>Prioridad</th>
    <th>Fecha</th>
    <th>Técnico</th>
</tr>

<xsl:for-each select="empresa/incidencias/incidencia">
<tr>
    <td><xsl:value-of select="@id"/></td>
    <td><xsl:value-of select="descripcion"/></td>
    <td><xsl:value-of select="@estado"/></td>
    <td><xsl:value-of select="prioridad"/></td>
    <td><xsl:value-of select="fecha"/></td>
    <td><xsl:value-of select="tecnico"/></td>
</tr>
</xsl:for-each>

</table>

</body>
</html>

</xsl:template>

</xsl:stylesheet>
