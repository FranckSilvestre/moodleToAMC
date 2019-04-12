<xsl:stylesheet version="1.0" xmlns:fn="http://www.w3.org/2005/xpath-functions"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text"/>
    <xsl:template match="quiz">
# AMC-TXT source
PaperSize: A4
Lang: FR
Title: Test Titre
Code: 8
CompleteMulti: 0
ManualDuplex: 1
Columns: 1
SeparateAnswerSheet: 0
AnswerSheetTitle: Feuille de réponses
AnswerSheetPresentation: Les réponses doivent être fournies uniquement sur cette feuille. Aucune autre réponse
ne sera prise en compte dans la notation. Les cases doivent être entèrement coloriées en noires pour être prises
en compte dans la notation. Pour modifier une réponse, vous pouvez utiliser un correcteur blanc, sans
re-dessiner la case à cocher.
AnswerSheetColumns: 1
AutoMarks: 1
L-OpenReserved: Ne rien inscrire dans ces cases.

Presentation: Durée : 1h15. Aucun dispositif électronique n'est autorisé. Aucun document n'est autorisé.
Les questions demandant une justification rapporteront 0 point si aucune justification n'est fournie.
Le symbole "trèfle" sur une question indique qu'il peut être attendu plus d'une réponse correcte.
        <xsl:apply-templates select="question[@type='multichoice' or @type='truefalse']"/>
    </xsl:template>

    <xsl:template match="question[@type='multichoice' or @type='truefalse']">
        <xsl:text>&#xa;&#xa;</xsl:text>
        <xsl:variable name="questionType">*<xsl:if test="single/text()='false'">*</xsl:if>
        </xsl:variable>
        <xsl:value-of select="$questionType"/>
        <xsl:value-of select="questiontext/text"/>
        <xsl:apply-templates select="answer"/>

    </xsl:template>

    <xsl:template match="answer[starts-with(@fraction,'-') or @fraction='0']">
        - <xsl:value-of select="text/text()"/>
    </xsl:template>

    <xsl:template match="answer">
        + <xsl:value-of select="text/text()"/>
    </xsl:template>

</xsl:stylesheet>
