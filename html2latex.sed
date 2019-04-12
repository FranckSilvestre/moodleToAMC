#
# Thanks to Alvin Alexander : https://alvinalexander.com/blog/post/latex/crazy-sed-script-convert-html-code-latex
#

s?&gt;?>?g
s?&lt;?<?g
s?&nbsp;? ?g

s?<html>??g
s?</html>??g

s?<head>??g
s?</head>??g

s?<title>\([^<]*\)</title>?\\section*{\1}?g

s?<body>?\\begin{document}?g
s?</body>?\\end{document}?g

# paragraph : requires the use of GNU Sed to support \n.
s?<p>\s*??g
s?</p>??g

s?<center>??g
s?</center>??g

#-------#
# TABLE #
#-------#
s?<table.*>?\\begin{tabular}{}{}?g
s?<\/table.*>?\\end{tabular}{}{}?g

#-----------#
# TABLE ROW #
#-----------#
# nothing at the beginning of a table row
s?<tr>??g
# two backslashes at the end of a table row
s?</tr>?\\\\?g

#--------------#
# TABLE COLUMN #
#--------------#
s?<td.*>?\&?g

#-------#
# FONTS #
#-------#
s?<b>\([^<]*\)</b>?\\textbf{{\1}}?g
s?<strong>\([^<]*\)</strong>?\\textbf{{\1}}?g
s?<em>\([^<]*\)</em>?\\textit{{\1}}?g
s?<font .*>??g
s?</font>??g
s?<br>?\n?g
s?<br/>?\n?g
s?<br />?\n?g

#--------#
# BUTTON #
#--------#
# guessing on button syntax here
s?<input type="button".*value="\([^<]*\)">?\\begin{fbox}\1\\end{fbox}?g

# need to do something here to handle multiline mode
s?<select.*<option.*selected>\([^<]*\)</option>?\\begin{fbox}{\1}\\end{fbox}?g

# delete all other option tags
#?<option.*</option>?d

# handle preformatted things : verbatim not compatible with amc package :-(
s?<pre>??g
s?<pre class="programlisting">??g
s?</pre>??g

s?<code>??g
s?</code>??g
 
# handle bulleted lists.
# todo: fix "itemize" vs. "enumerate"
s?<ol.*>?//begin{enumerate}?g
s?</ol.*>?//end{enumerate}?g
s?<ul.*>?//begin{enumerate}?g
s?</ul.*>?//end{enumerate}?g
s?<li>\([^<]*\)</li>?\\item {\1}?g
s?<li>\([^<]*\).*$?\\item {\1}?g
s?</li>??g

s?<!--\([^<]*\)-->?\\begin{comment}{\1}\\end{comment}?g

# other strange things

s?<span>\s*??g
s?</span>??g
s?\$?\\$?g
s?\_?\\_?g


