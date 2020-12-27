<cfcomponent displayname="AddressSVC" 
		output="false" 
		hint="I am the AddressSVC Class used to 
			interact with the Address package."
		extends="oop.com.packtApp.oop.utils.coreUtils">

	<!--- Pseudo-constructor --->
	<cfset variables.instance = {
		addressDAO	= '',
		addressGW	= ''
	} />
	
	<cffunction name="init" 
			access="public" 
			output="false" 
			returntype="any" 
			hint="I am the constructor method for 
					the AddressSVC Class.">
			
		<cfargument name="datasource" 
				required="true" 
				type="com.packtApp.oop.beans.Datasource" 
				hint="I am the datasource object." />
				
			<!--- Set the initial values of the Bean --->
			<cfscript>
				// instantiate the Data Access Object
				variables.instance.addressDAO 
					= createObject(
						'component', 
						'AddressDAO'
						)
						.init(arguments.datasource);
						
				// instantiate the Gateway
				variables.instance.addressGW 
					= createObject(
						'component', 
						'AddressGateway'
						)
						.init(arguments.datasource);
			</cfscript>
			
		<cfreturn this />
		
	</cffunction>
	
	<!--- CRUD METHODS --->
	<cffunction name="save" access="public" output="false" hint="I save or update an Address into the database.">
		<cfargument name="address" required="true" type="com.packtApp.oop.beans.Address" hint="I am the Address bean." />
		<cfreturn variables.instance.addressDAO.saveAddress(arguments.address) />
	</cffunction>
	
	<cffunction name="read" access="public" output="false" hint="I obtain details for a specific address from the database.">
		<cfargument name="ID" required="true" type="numeric" hint="I am the ID of the address you wish to search for." />
		<cfreturn variables.instance.addressDAO.getAddressByID(arguments.ID) />
	</cffunction>
	
	<cffunction name="delete" access="public" output="false" hint="I delete a specific Address the database.">
		<cfargument name="ID" required="true" type="String" hint="I am the ID of the address you wish to delete." />
		<cfreturn variables.instance.addressDAO.deleteAddressByID(arguments.ID) />
	</cffunction>
	
	<!--- GATEWAY METHODS --->	
	<cffunction name="getAllAddresses" 
			access="public" 
			output="false" 
			hint="I run a query of all users 
					within the database table.">
		<!--- 
			Call the query method 
			and return the query object. 
		--->	
		<cfreturn variables.instance.addressGW.getAllAddresses() />
		
	</cffunction>
	
	<cffunction name="filterByUserID"
			access="public"
			output="false" 
			hint="I run a query of all addresses within the database 
					table based upon a required filter.">
					
        <cfargument name="userID" 
				required="true" 
				type="string" 
				hint="I am the userID to filter." />
			<!---
				Create and populate a structure object
				containing the filter to pass through.
			--->	
        	<cfset var stuFilter = {
				userID = arguments.userID
			} />
		<!--- 
			Send the structure into the query method 
			and return the query object. 
		--->
        <cfreturn variables.instance.addressGW.filterAllAddresses(stuFilter) />
		
    </cffunction>	
	
</cfcomponent>