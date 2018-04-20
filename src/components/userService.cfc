<!---
  Created by Aisha on 20.04.2018.
--->
<cfcomponent  output="false">
   <!--- Place your content here --->
    <cffunction name="userValidation" access="public" output="false" returntype="array">
        <cfargument name="userLogin" type="string" required="true"/>
        <cfargument name="firstname" type="string" required="true"/>
        <cfargument name="lastname" type="string" required="true"/>
        <cfargument name="userPassword" type="string" required="true"/>
        <cfset aErrorMessage = arrayNew(1)/>
        <cfquery name="login_validation">
            SELECT COUNT(*) as count FROM `systemuser` WHERE login = "#arguments.userLogin#"
        </cfquery>
        <cfif #login_validation.count# NEQ 0>
            <cfset arrayAppend(aErrorMessage,"Такой логин существует!")/>
        </cfif>
        <cfif arguments.firstname EQ "">
            <cfset arrayAppend(aErrorMessage,"Пожалуйста введите имя!")/>
        </cfif>
        <cfif arguments.lastname EQ "">
            <cfset arrayAppend(aErrorMessage,"Пожалуйста введите фамилию!")/>
        </cfif>
        <cfif arguments.userLogin EQ "">
            <cfset arrayAppend(aErrorMessage,"Пожалуйста введите логин!")/>
        </cfif>
        <cfif arguments.userPassword EQ "">
            <cfset arrayAppend(aErrorMessage,"Пожалуйста введите пароль!")/>
        </cfif>
        <cfreturn aErrorMessage/>
    </cffunction>

    <cffunction name="UserSignUp" access="public" output="false" returntype="boolean">
        <cfargument name="userLogin" type="string" required="true"/>
        <cfargument name="firstname" type="string" required="true"/>
        <cfargument name="lastname" type="string" required="true"/>
        <cfargument name="userPassword" type="string" required="true"/>
        <cfset isUserSignUp =false/>
            <cfquery >
               INSERT INTO `systemuser`(`login`, `firstname`, `lastname`, `password`)
               VALUES ('#arguments.userLogin#','#arguments.firstname#','#arguments.lastname#','#arguments.userPassword#')
            </cfquery>
        <cfset isUserSignUp =true/>
        <cfreturn isUserSignUp/>
    </cffunction>

    <cffunction name="selectUserToUpdate" access="public" output="false" returntype="query">
        <cfquery  name="userToUpdate">
           SELECT `login`, `firstname`, `lastname`, `password` FROM `systemuser` WHERE id ="#session.stLoggedInUser.userID#"
        </cfquery>
        <cfreturn userToUpdate>
    </cffunction>

    <cffunction name="updateUser" access="public" output="false" returntype="boolean">
        <cfargument name="userLogin" type="string" required="true"/>
        <cfargument name="firstname" type="string" required="true"/>
        <cfargument name="lastname" type="string" required="true"/>
        <cfargument name="userPassword" type="string" required="true"/>
        <cfset isUserUpdated =false/>
        <cfquery >
            UPDATE `systemuser`
            SET `login`='#arguments.userLogin#',`firstname`='#arguments.firstname#',`lastname`='#arguments.lastname#',`password`= '#arguments.userPassword#'
            WHERE id = "#session.stLoggedInUser.userID#"
        </cfquery>
        <cfset isUserUpdated =true/>
        <cfreturn isUserUpdated>
    </cffunction>
</cfcomponent>
