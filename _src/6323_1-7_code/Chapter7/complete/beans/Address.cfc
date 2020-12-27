<cfcomponent displayname="Address" output="false" hint="I am the Address Class.">

	<cfproperty name="ID" 		type="numeric" 	default="0" />
	<cfproperty name="userID" 	type="numeric" 	default="0" />
	<cfproperty name="house" 	type="string" 	default="" />
	<cfproperty name="street" 	type="string" 	default="" />
	<cfproperty name="town" 	type="string" 	default="" />
	<cfproperty name="county" 	type="string" 	default="" />
	<cfproperty name="zip" 		type="string" 	default="" />
	<cfproperty name="country" 	type="string" 	default="" />

	<!--- Pseudo-constructor --->
	<cfset variables.instance = {
		ID			= 0,
		userID 		= 0,
		house		= '',
		street		= '',
		town		= '',
		county		= '',
		zip			= '',
		country		= ''	
	} />
	
	<cffunction name="init" access="public" output="false" returntype="any" hint="I am the constructor method for the Address Class.">
		<cfargument name="ID" 		required="true" type="Numeric" default="0" 	hint="I am the ID for the address." />
		<cfargument name="userID" 	required="true" type="Numeric" default="0" 	hint="I am the ID for the user." />
		<cfargument name="house" 	required="true" type="String" 				hint="I am the house name or number." />
		<cfargument name="street" 	required="true" type="String" 				hint="I am the street." />
		<cfargument name="town" 	required="true" type="String" 				hint="I am the town." />
		<cfargument name="county" 	required="true" type="String" 				hint="I am the county." />
		<cfargument name="zip" 		required="true" type="String" 				hint="I am the ZIP / postal code." />
		<cfargument name="country" 	required="true" type="String" 				hint="I am country." />
			<!--- Set the initial values of the Bean --->
			<cfscript>
				variables.instance.ID		= arguments.ID;
				variables.instance.userID 	= arguments.userID;
				variables.instance.house 	= arguments.house;
				variables.instance.street 	= arguments.street;
				variables.instance.town 	= arguments.town;
				variables.instance.county 	= arguments.county;
				variables.instance.zip 		= arguments.zip;
				variables.instance.country 	= arguments.country;
			</cfscript>
		<cfreturn this />
	</cffunction>
	
	<!--- getters / accessors --->
	<cffunction name="getID" access="public" output="false" hint="I return the ID assigned to the address.">
		<cfreturn variables.instance.ID />
	</cffunction>
	
	<cffunction name="getUserID" access="public" output="false" hint="I return the UserID assigned to the address.">
		<cfreturn variables.instance.userID />
	</cffunction>
	
	<cffunction name="getHouse" access="public" output="false" hint="I get the house / flat number.">
		<cfreturn variables.instance.house />
	</cffunction>
	
	<cffunction name="getStreet" access="public" output="false" hint="I return the street details.">
		<cfreturn variables.instance.street />
	</cffunction>
	
	<cffunction name="getTown" access="public" output="false" hint="I return the town details.">
		<cfreturn variables.instance.town />
	</cffunction>
	
	<cffunction name="getCounty" access="public" output="false" hint="I return the county details.">
		<cfreturn variables.instance.county />
	</cffunction>
	
	<cffunction name="getZIP" access="public" output="false" hint="I return the zip / postalcode details.">
		<cfreturn variables.instance.zip />
	</cffunction>
	
	<cffunction name="getCountry" access="public" output="false" hint="I return the country details.">
		<cfreturn variables.instance.country />
	</cffunction>
	
	<!--- setters /mutators --->
	<cffunction name="setID" access="public" output="false" hint="I set the ID value.">
		<cfargument name="ID" required="true" type="Numeric" hint="I am the ID for the address." />
			<cfset variables.instance.ID = arguments.ID />
	</cffunction>
	
	<cffunction name="setUserID" access="public" output="false" hint="I set the userID value.">
		<cfargument name="userID" required="true" type="Numeric" hint="I am the ID for the user." />
			<cfset variables.instance.userID = arguments.userID />
	</cffunction>
	
	<cffunction name="setHouse" access="public" output="false" hint="I set the house value.">
		<cfargument name="house" required="true" type="String" hint="I am the house / flat number." />
			<cfset variables.instance.house = arguments.house />
	</cffunction>
	
	<cffunction name="setStreet" access="public" output="false" hint="I set the street value.">
		<cfargument name="street" required="true" type="String" hint="I am the street value." />
			<cfset variables.instance.street = arguments.street />
	</cffunction>

	<cffunction name="setTown" access="public" output="false" hint="I set the town value.">
		<cfargument name="town" required="true" type="String" hint="I am the town value." />
			<cfset variables.instance.town = arguments.town />
	</cffunction>
	
	<cffunction name="setCounty" access="public" output="false" hint="I set the county value.">
		<cfargument name="county" required="true" type="String" hint="I am the county value." />
			<cfset variables.instance.county = arguments.county />
	</cffunction>
	
	<cffunction name="setZIP" access="public" output="false" hint="I set the zip / postalcode value.">
		<cfargument name="zip" required="true" type="String" hint="I am the zip / postalcode value." />
			<cfset variables.instance.zip = arguments.zip />
	</cffunction>
	
	<cffunction name="setCountry" access="public" output="false" hint="I set the country value.">
		<cfargument name="country" required="true" type="String" hint="I am the country value." />
			<cfset variables.instance.country = arguments.country />
	</cffunction>
	
</cfcomponent>
