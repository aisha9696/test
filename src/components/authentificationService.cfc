<!---
  Created by Aisha on 19.04.2018.
--->
<cfcomponent output="false">
<!--- Place your content here --->
<!---validateUser()--->
    <cffunction name="validateUser" access="public" output="false" returntype="array">
        <cfargument name="userLogin" type="string" required="true"/>
        <cfargument name="userPassword" type="string" required="true"/>
        <cfset var aErrorMessage = arrayNew(1)/>

<!---query for validation----->
        <cfquery name="login_validation">
            SELECT COUNT(*) as count FROM `systemuser` WHERE login = "#arguments.userLogin#"
        </cfquery>
        <cfquery name="password_validation">
            SELECT login FROM systemuser WHERE password = "#arguments.userPassword#"
        </cfquery>

<!---validation--->
        <cfif arguments.userLogin EQ "">
            <cfset arrayAppend(aErrorMessage,"Пожалуйста введите логин!")/>
        </cfif>
        <cfif arguments.userPassword EQ "">
            <cfset arrayAppend(aErrorMessage,"Пожалуйста введите пароль!")/>
        </cfif>
        <cfif #login_validation.count# EQ 0>
            <cfset arrayAppend(aErrorMessage,"Такой логин не существует!")/>
        </cfif>
        <cfif #password_validation.login# NEQ #arguments.userLogin#>
            <cfset arrayAppend(aErrorMessage,"Не правильный пароль!")/>
        </cfif>

        <cfreturn aErrorMessage/>
    </cffunction>
<!---doLogin()--->
    <cffunction name="doLogin" access="public" output="false" returntype="boolean">
        <cfargument name="userLogin" type="string" required="true"/>
        <cfargument name="userPassword" type="string" required="true"/>
        <cfset var isUserLogin = false/>

        <cfquery name="user_select">
            SELECT `id`, `login`, `firstname`, `lastname`, `password` FROM `systemuser`
            WHERE login = "#arguments.userLogin#" and password = "#arguments.userPassword#"
        </cfquery>

        <cfif user_select.recordcount EQ 1>
            <cflogin>
                <cfloginuser name="#user_select.firstname# #user_select.lastname#" password="#user_select.password#" roles="user">
            </cflogin>
            <cfset session.stLoggedInUser = {'userFirstName'= user_select.firstname, 'userLastaName'= user_select.lastname, 'userID' = user_select.id}/>
            <cfset var isUserLogin = true/>

        </cfif>
        <cfreturn isUserLogin/>
    </cffunction>

<!---doLogout()--->
    <cffunction name="doLogOut" access="public" output="false" returntype="void">
        <cfset structdelete(session, 'stLoggedInUser')/>
        <cflogout/>
    </cffunction>


</cfcomponent>
