<cfcomponent name="Projects" 
	output="false" 
	displayname="A CFC called 'Projects'" 
	hint="Used to access project related functions" 
	Application="Project Tracker" 
	Developer="Matt James"> 
	 
	<!--- pseudo constructor code here ---> 
	<cfset This.dsn = "projectTracker" /> 
	Our datasource is #This.dsn# 
	
	<!--- function to get the current date ---> 
	<cffunction name="getCurrentDate" output="false" returnType="Date"> 
		<cfreturn dateFormat(Now(), "dd/mm/yyyy") /> 
	</cffunction>
	
	<!--- retrieve all projects within the database ---> 
	<cffunction name="getAllProjects" returnType="query" output="false" access="public">
		<cfargument name="userID" required="false" type="numeric" default="0" /> 
			<!--- var scope the query variable ---> 
			<cfset var rstProjects = "" /> 
				<!--- Wrap the query in try/catch ---> 
				<cftry> 
					<cfquery name="rstProjects" datasource="#This.dsn#"> 
					SELECT 
						ID, 
						name, 
						status, 
						createdByUserID, 
						dateCreated, 
						dateCompleted 
					FROM 
						projects 
					<cfif arguments.userID GT 0> 
					WHERE createdByUserID = <cfqueryparam cfsqltype="integer" value="#arguments.userID#" /> 
					</cfif> 
					</cfquery> 
					<!--- catch and display any errors ---> 
					<cfcatch> 
						<cfdump var="#cfcatch#" /> 
						<cfabort /> 
					</cfcatch> 
				</cftry> 
		<cfreturn rstProjects /> 
	</cffunction> 

</cfcomponent>