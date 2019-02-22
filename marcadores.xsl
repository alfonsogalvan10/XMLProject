<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="/marcadores">
  <html>
  <head>
    <link rel="stylesheet" type="text/css" href="css/estilos-XSL.css"/>
  </head>
  <body>
  <header>
  <h1>Marcadores de <xsl:value-of select="creador"/></h1>
  <p>Compartido con <xsl:for-each select="compartido/usuario"> - <xsl:value-of select="."/></xsl:for-each></p>
  </header>
  <table>
  <tr>
  <th>Código</th>
  <th>Logo</th>
  <th>Puntos</th>
  <th>Nombre y enlace</th>
  <th>Categorías</th>
  <th>Descripción</th>  
  </tr>
  <xsl:for-each select="pagina">
  <xsl:sort select="puntuacion" data-type="number" order="descending"/>
  <tr>
  <th scope="row"><xsl:value-of select="./@codigo"/></th> 
  <td><img src="figuras/{logo}"/></td>
  <td><xsl:value-of select="puntuacion"/></td>
  <td><a href="{url}"><xsl:value-of select="nombre"/></a></td>
  <td><ul><xsl:for-each select="categorias/etiqueta"><xsl:sort select="." data-type="text" order="ascending"/><li><xsl:value-of select="."/></li></xsl:for-each></ul></td>
  <xsl:if test="descripcion/@idioma = 'en'">
  <td class="en"><xsl:value-of select="descripcion"/></td>
  </xsl:if>
  <xsl:if test="descripcion/@idioma='es'">
  <td><xsl:value-of select="descripcion"/></td>
  </xsl:if>
  </tr>
  </xsl:for-each>  
  </table>
  </body>
  </html>
  </xsl:template>
</xsl:stylesheet>
