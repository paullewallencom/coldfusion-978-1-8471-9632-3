<cfoutput>

<h2>Welcome</h2>

<p>This is the assistant microsite to accompany your book, Object-Oriented Programming in ColdFusion.</p>

<p>From here, you have quick easy access to the code snippets used within the publication, and the SQL Script required to build the example database used throughout the book.</p>

<ul>
	<cfloop from="1" to="7" index="i">
	<li><a href="#buildURL(action='main.code', queryString='chapter=#i#')#" title="Chapter #i#">Chapter #i#</a></li>
	</cfloop>
	<li><a href="#buildURL(action='main.sql')#" title="SQL Script">SQL Script</a></li>
</ul>

<h3>Note</h3>

<p>Chapter 7 uses code within the example that isn't written out explicitly within the book. 
This code is included within the Chapter 7 code files for you to include and use when required.</p>

<p>You can download either browse to the folder location within the directory, or you can <a href="#variables.framework.base#Code/Chapter7/complete/Chapter7_Address_Bean_Code.zip">download the ZIP file</a> containing the extra code.</p>

</cfoutput>