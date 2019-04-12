<xsl:stylesheet version="1.0" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text"/>
<xsl:template match="quiz">
\documentclass[a4paper]{article}

\usepackage[utf8x]{inputenc}
\usepackage[T1]{fontenc}

\usepackage[francais,bloc,completemulti]{automultiplechoice}
\begin{document}

%%% fabrication des copies

\exemplaire{5}{

%%% debut de l'en-tête des copies :

\noindent{\bf QCM \hfill Information}

\vspace*{.5cm}
\begin{minipage}{.4\linewidth}
\centering\large\bf XML \\ Examen du 27/03/2019
\end{minipage}
\champnom{\fbox{\begin{minipage}{.5\linewidth}
Nom et prénom :

\vspace*{.5cm}\dotfill
\vspace*{1mm}
\end{minipage}}}

\begin{center}
\em
Durée : 40 minutes.

Aucun document n'est autorisé.
Aucun dispositif électronique n'est autorisé.

Les questions faisant apparaître le symbole \multiSymbole{} peuvent
présenter zéro, une ou plusieurs bonnes réponses. Les autres ont
une unique bonne réponse.

Des points négatifs pourront être affectés à de \emph{très mauvaises} réponses.
\end{center}
\vspace{1ex}

%%% fin de l'en-tête

<xsl:apply-templates select="question[@type='multichoice' or @type='truefalse']"/>

\AMCcleardoublepage
}

\end{document}
</xsl:template>


<xsl:template match="question[@type='multichoice' or @type='truefalse']">
<xsl:variable name="questionType">question<xsl:if test="single/text()='false'">mult</xsl:if></xsl:variable>
\begin{<xsl:value-of select="$questionType"/>}{Question<xsl:value-of select="position()"/>}
<xsl:value-of select="questiontext/text"/>
\begin{reponses}<xsl:apply-templates select="answer"/>
\end{reponses}
\end{<xsl:value-of select="$questionType"/>}
</xsl:template>

<xsl:template match="answer[starts-with(@fraction,'-') or @fraction='0']">
\mauvaise{<xsl:value-of select="text/text()"/>}</xsl:template>

<xsl:template match="answer">
\bonne{<xsl:value-of select="text/text()"/>}</xsl:template>


</xsl:stylesheet>
