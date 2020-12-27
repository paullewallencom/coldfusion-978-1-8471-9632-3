<cfcomponent displayname="AddressGateway" output="false" hint="I am the AddressGateway Class.">

	<!--- Pseudo-constructor --->
	<cfset variables.instance = {
		datasource	= ''
	} />
	
	<cffunction name="init" access="public" output="false" returntype="any" hint="I am the constructor method for the AddressGateway Class.">
		<cfargument name="datasource" required="true" type="com.packtApp.oop.beans.Datasource" hint="I am the datasource object." />
			<!--- Set the initial values of the property --->
			<cfscript>
				variables.instance.datasource = arguments.datasource;
			</cfscript>
		<cfreturn this />
	</cffunction>
	
	<!--- PUBLIC METHODS --->
	<cffunction name="getAllAddresses" 
			access="public" 
			output="false" 
			hint="I run a query of all addresses 
					within the database table.">
					
		<cfreturn filterAllAddresses() />
		
	</cffunction>
	
	<!--- PRIVATE METHODS --->
	<cffunction name="filterAllAddresses" 
			access="package" 
			output="false" 
			hint="I run a query and will return all address records. 
					If a filter has been supplied, I will refine the search 
					using the filter information sent to me.">
					
		<cfargument name="filter" 
			required="false" 
			type="Struct" 
			default="#structNew()#" 
			hint="I am a structure used to filter the query." />
			
			<cfset var qSearch 		= '' />
			
				<cfquery name="qSearch"
					 	 datasource="#variables.instance.datasource.getDSName()#"
					 	 username="#variables.instance.datasource.getUsername()#"
					 	 password="#variables.instance.datasource.getPassword()#">
					SELECT
					 	ID,
						house,
						street,
						town,
						county,
						zip,
						country,
						userID
					FROM
						tbl_Address
					WHERE
						1 = 1
		<cfif NOT structIsEmpty(arguments.filter)>
			<!--- 
				A filter has been provided. 
				Let's find out which filter it is,
				and apply the necessary clause to the SQL.	
			--->
			<!---
				Perform a search for specific user addresses
			--->
			<cfif structKeyExists(arguments.filter, 'userID')>
				AND userID = 
					<cfqueryparam cfsqltype="cf_sql_varchar" 
							value="#arguments.filter.userID#" />
			</cfif>
			
		</cfif>
				</cfquery>
				
		<cfreturn qSearch />
		
	</cffunction>
	
</cfcomponent>