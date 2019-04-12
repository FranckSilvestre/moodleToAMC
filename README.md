### Quizz Moodle to ACM text 


**Xslt Transformation** 

Use the moodleToAmcText.xsl to process a first transformation of a Moodle quiz formatted in xml.
 > Tested with SaxonHE9.

**Sed Transformation**

Use the sed  script "html2text.sed" to transform residual xml contained in cdata.
Warning : the use of Gnu Sed is required to get '\n' support.
Exemple of use on Mac OS X with gsed command:

`gsed -f html2text.sed <source-inter.txt >source.txt`

**Finally by hand...**

You have to finish the job by hand as it appears difficult to definitely solve the conversion with this cheap approach (xslt + sed).

### Quizz Moodle to ACM Latex 

This approach does not support verbatim text so it is not recommanded.

**Xslt Transformation** 

Use the moodleToAmcLatex.xsl to process a first transformation of a Moodle quiz formatted in xml.
 > Tested with SaxonHE9.

**Sed Transformation**

Use the sed script "html2latex.sed" to transform residual xml contained in cdata.
Warning : the use of Gnu Sed is required to get '\n' support.
Exemple of use on Mac OS X with gsed command:

`gsed -f html2latex.sed <source-inter.tex >source.tex`

**Finally by hand**

You have to finish the job by hand as it appears difficult to definitely solve the conversion with this cheap approach (xslt + sed)

### Not supported 

- question groups
- etc.
