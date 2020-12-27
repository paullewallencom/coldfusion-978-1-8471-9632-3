<cfparam name="strHeader" type="string" default="Chapter Listing" />

<cfoutput>

<cfif structKeyExists(rc, 'chapter')>

	<cfset strHeader = 'Chapter #rc.chapter#' />

	<cfif structKeyExists(rc, 'listing')>
	
		<cfset strHeader = strHeader & ' listing #rc.listing#' />
	
		<h2>#strHeader#</h2>
		
		<cfset strFile = getDirectoryFromPath(expandPath('./')) & 'Code/Chapter#rc.chapter#/#rc.listing#.htm' />
		
		<cffile action="read" file="#strFile#" variable="listingCode" />
		
		<cfset listingCode = replaceNoCase(listingCode, '<', '&lt;', 'all') />
		<cfset listingCode = replaceNoCase(listingCode, '>', '&gt;', 'all') />
		<cfset listingCode = replaceNoCase(listingCode, "'", "&quot;", "all") />
		<cfset listingCode = replaceNoCase(listingCode, '"', '&quot;', 'all') />

		<pre>#listingCode#</pre>
		
	<cfelse>
	
		<h2>#strHeader#</h2>
		
		<p>Please select a specific code listing from below to view the code snippet.</p>
	
		<cfset strDirectory = getDirectoryFromPath(expandPath('./')) & 'Code/Chapter#rc.chapter#/' />
		<cfdirectory action="list" directory="#strDirectory#" name="dirList" filter="*.htm" />
		<ul>
		<cfloop query="dirList">
			<cfset strListingNumber = left(dirList.name, findNoCase('.', dirList.name)-1) />
			<li><a href="#buildURL(
							action='main.code', 
							queryString='chapter=#rc.chapter#&listing=#strListingNumber#')#">#strListingNumber#</a>
			</li>
		</cfloop>
		</ul>	
	</cfif>

<cfelse>

<h2>#strHeader#</h2>

<p>Please select a chapter from below to view the code snippets.</p>

<ul>
	<cfloop from="1" to="7" index="i">
	<li><a href="#buildURL(action='main.code', queryString='chapter=#i#')#">Chapter #i#</a></li>
	</cfloop>
</ul>

</cfif>

</cfoutput>