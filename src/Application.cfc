<!---
  Created by Aisha on 19.04.2018.
--->
<cfcomponent output="false">
   <!--- Place your content here --->
    <cfset this.name = 'errorRegisterWebSite' />
    <cfset this.applicationTimeout = createtimespan(0,2,0,0) />
    <cfset this.datasource = 'error_register' />
    <cfset this.sessionManagement = true />
    <cfset this.sessionTimeout = createTimespan(0,0,30,0) />
    <cfset this.customTagPaths = expandPath('/test/src/customTag') />

    <!-----cffunction name="onApplicationStart" returntype="boolean" >
        <cfset application.errorService = createObject("component", 'test.src.components.errorService') />
        <cfreturn true />
    </cffunction>

    <cffunction name="onRequestStart" returntype="boolean" >
        <cfargument name="targetPage" type="string" required="true" />
        <!---handle some special URL parameters--->
        <cfif isDefined('url.restartApp')>
            <cfset this.onApplicationStart() />
        </cfif>
        <cfreturn true />
    </cffunction-------->
</cfcomponent>
