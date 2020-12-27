<cfcomponent displayname="AddressDAO" output="false" hint="I am the AddressDAO Class.">

	<!--- Pseudo-constructor --->
	<cfset variables.instance = {
		datasource	= ''
	} />
	
	<cffunction name="init" access="public" output="false" returntype="any" hint="I am the constructor method for the AddressDAO Class.">
		<cfargument name="datasource" required="true" type="com.packtApp.oop.beans.Datasource" hint="I am the datasource object." />
			<!--- Set the initial values of the Bean --->
			<cfscript>
				variables.instance.datasource = arguments.datasource;
			</cfscript>
		<cfreturn this />
	</cffunction>
	
	<!--- PUBLIC METHODS --->
	
	<!--- CREATE --->
	<cffunction name="createNewAddress" access="public" output="false" returntype="Numeric" hint="I insert a new record into the database.">
		<cfargument name="address" required="true" type="com.packtApp.oop.beans.Address" hint="I am the Address bean." />
			<cfset var qInsert 		= '' />
			<cfset var insertResult = 0 />
				<cfquery name="qInsert"
						datasource="#variables.instance.datasource.getDSName()#"
					 	username="#variables.instance.datasource.getUsername()#"
					 	password="#variables.instance.datasource.getPassword()#"
						result="insertResult">
					INSERT INTO tbl_Address
						(
							house,
							street,
							town,
							county,
							zip,
							country,
							userID
						)
					VALUES
						(
							<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.address.getHouse()#" />,
							<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.address.getStreet()#" />,
							<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.address.getTown()#" />,
							<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.address.getCounty()#" />,
							<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.address.getZIP()#" />,
							<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.address.getCountry()#" />,
							<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.address.getUserID()#" />
						)
				</cfquery>
			<!---
				Here, we return the generatedKey value, 
				which is an auto-generated value from mySQL.
			--->
			<cfreturn insertResult.generatedKey />
	</cffunction>
	
	<!--- READ --->
	<cffunction name="getAddressByID" access="public" output="false" hint="I return an Address bean populated with details of a specific address.">
		<cfargument name="addressID" required="true" type="numeric" hint="I am the ID of the address you wish to search for." />
			<cfset var qSearch 		= '' />
			<cfset var objAddress 	= '' />
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
						ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.addressID#" />
				</cfquery>
			<cfif qSearch.RecordCount>
				<!---
					If a record has been returned for the userID, 
					create an instance of the User bean, and return it.
				--->
				<cfset objAddress = 
							createObject('component', 'com.packtApp.oop.beans.Address')
							.init(
								id			= qsearch.ID,
								house		= qSearch.house,
								street		= qSearch.street,
								town		= qSearch.town,
								county		= qSearch.county,
								zip			= qSearch.zip,
								country		= qSearch.country,
								userID		= qSearch.userID
							) />							
			</cfif>
		<cfreturn objAddress />
	</cffunction>
	
	<!--- UPDATE --->
	<cffunction name="updateAddress" access="public" output="false" hint="I update the values for a specific address.">
		<cfargument name="address" required="true" type="com.packtApp.oop.beans.Address" hint="I am the Address bean." />
			<cfset var qUpdate = '' />
			<cfset var boolSuccess	= true />
				<cftry>
					<cfquery name="qUpdate"
							datasource="#variables.instance.datasource.getDSName()#"
						 	username="#variables.instance.datasource.getUsername()#"
						 	password="#variables.instance.datasource.getPassword()#">
						UPDATE tbl_Address
						SET
							house 		= <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.address.getHouse()#" />,
							street		= <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.address.getStreet()#" />,
							town		= <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.address.getTown()#" />,
							county		= <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.address.getCounty()#" />,
							zip			= <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.address.getZip()#" />,
							country		= <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.address.getCountry()#" />,
							userID		= <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.address.getUserID()#" />
						WHERE
							ID	= <cfqueryparam 
										cfsqltype="cf_sql_integer" 
										value="#arguments.address.getID()#" />
					</cfquery>
					<cfcatch type="database">
						<cfset boolSuccess = false />
					</cfcatch>
				</cftry>
		<cfreturn boolSuccess  />
	</cffunction>
	
	<!--- DELETE --->
	<cffunction name="deleteAddressByID" access="public" output="false" returntype="boolean" hint="I delete an address from the database.">
		<cfargument name="ID" required="true" type="String" hint="I am the ID of the address you wish to delete." />
			<cfset var qDelete 		= '' />
			<cfset var boolSuccess	= true />
				<cftry>
					<cfquery name="qUpdate"
							datasource="#variables.instance.datasource.getDSName()#"
						 	username="#variables.instance.datasource.getUsername()#"
						 	password="#variables.instance.datasource.getPassword()#">
						DELETE FROM tbl_Address
						WHERE
							ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.ID#" />
					</cfquery>
					<cfcatch type="database">
						<cfset boolSuccess = false />
					</cfcatch>
				</cftry>
		<cfreturn boolSuccess  />
	</cffunction>
	
	<!--- SAVE --->
	<cffunction name="saveAddress" access="public" output="false" returntype="string" hint="I handle saving an Address, either by creating a new entry or updating an existing one.">
		<cfargument name="address" required="true" type="com.packtApp.oop.beans.Address" hint="I am the Address bean." />
	    	<cfset var success = '' />
	    		<cfif exists(arguments.address)>	
	        		<cfset success = updateAddress(arguments.address) />
	       		<cfelse>
	           		<cfset success = createNewAddress(arguments.address) />
	       		</cfif>
		<cfreturn success />
	</cffunction>
	
	<!--- EXISTS --->
	<cffunction name="exists" access="public" output="false" returntype="boolean" hint="I check to see if a specific Address exists within the database, using the ID as a check.">
		<cfargument name="address" required="true" type="com.packtApp.oop.beans.Address" hint="I am the Address bean." />
	    	<cfset var qExists = "">
		        <cfquery name="qExists"
					 	datasource="#variables.instance.datasource.getDSName()#"
					 	username="#variables.instance.datasource.getUsername()#"
					 	password="#variables.instance.datasource.getPassword()#"
						maxrows="1">
		       		SELECT count(1) as idexists
		       		FROM
						tbl_Address
		       		WHERE 
						ID = <cfqueryparam 
		               				value="#arguments.address.getID()#"
		               				CFSQLType="cf_sql_integer" />
		       	</cfquery>
		       <cfif qExists.idexists>
		           <cfreturn true />
		       <cfelse>
		           <cfreturn false />
		       </cfif>
	</cffunction>

</cfcomponent>