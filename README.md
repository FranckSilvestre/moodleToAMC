### Xslt Transformation 

Use the moodleToAmc.xsl to process a first transformation from an Moodle quiz in xml format.

### Sed Transformation

Use the sed script to to transform residual xml contained in cdata.
Warning : the use of Gnu Sed is required to get '\n' support.
Exemple of use on Mac OS X with gsed command:
 gsed -f ../resources/html2latex.sed <source-inter.tex >source.tex

### Finally by hand...

You have to finish the job by hand as it appears difficult to definitely solve the conversion with this cheap approach (xslt + sed)
