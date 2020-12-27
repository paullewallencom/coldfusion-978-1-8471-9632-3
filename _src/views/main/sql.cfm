<cfoutput>

	<h2>SQL Script</h2>

	<cfset strFile = getDirectoryFromPath(expandPath('./')) & 'Installation/6323_CF_OOP.sql' />
		
	<cffile action="read" file="#strFile#" variable="listingCode" />
	
	<p>The code below is a .sql file to help you create the database tables with dummy data to run the code examples used throughout the book.</p>
	<p><a href="#variables.framework.base#Installation/6323_CF_OOP.sql">Download the SQL Script</a></p>

	<pre>#listingCode#</pre>

</cfoutput>