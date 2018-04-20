<!---
  Created by Aisha on 12.04.2018.
--->

<!---
  Created by Aisha on 12.04.2018.
--->

<!---
  Created by Aisha on 11.04.2018.
--->
<cfset userService = createObject("component", 'test.src.components.userService')/>
<cfset isUserUpdated = false/>
<cfset aErrorMessage = arrayNew(1)/>
<cfif NOT isuserloggedin()>
    <cflocation url="/test/src/main.cfm?noaccess"/>
</cfif>
<cfset userToUpdate =  userService.selectUserToUpdate()/>
<cfif structKeyExists(form,'update')>
    <cfset aErrorMessage =  userService.userValidation(form.login,form.firstname,form.lastname, form.password)/>
    <cfif #form.password# NEQ #form.chPassword# >
        <cfset arrayAppend(aErrorMessage,"Повторите пароль!")/>
    </cfif>
    <cfif arrayIsEmpty(aErrorMessage)>
        <cfset isUserUpdated =  userService.updateUser(form.login,form.firstname,form.lastname, form.password)/>
    </cfif>
    <cfif isUserUpdated EQ true >
        <script>
            alert("Успешно изменено!");
        </script>
    </cfif>
</cfif>

<cf_head>
<cf_navbar>

<main role="main">

    <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="jumbotron">
        <div class="container">
            <cfif isDefined('aErrorMessage') AND NOT arrayIsEmpty(aErrorMessage) >
                <cfoutput>
                    <cfloop array="#aErrorMessage#" index="message">
                            <script>
                                alert("#MESSAGE#");
                            </script>
                    </cfloop>
                </cfoutput>
            </cfif>
            <cfform class="form-signin"  >
                    <h1 class="h3 mb-3 font-weight-normal">Изменить параметры пользователя</h1>
                    <label for="inputfirstname" class="sr-only">Имя</label>
                <cfinput type="text" id="inputfirstname"  class="form-control" name="firstname" value="#userToUpdate.firstname#" placeholder="Имя" required="true" message="Введите имя!">
                    <label for="inputlastname" class="sr-only">Фамилия</label>
                <cfinput type="text" id="inputlastname" class="form-control" name="lastname" value="#userToUpdate.lastname#" placeholder="Фамилия" required="true" message="Введите фамилию!">
                    <label for="inputlogin" class="sr-only">Введите логин</label>
                <cfinput type="text" id="inputlogin"  class="form-control" name="login" value="#userToUpdate.login#"  placeholder="Логин" required="true" message="Введите логин!">
                    <label for="inputpassword" class="sr-only">Введите пароль</label>
                <cfinput type="password" id="inputpassword" class="form-control" name="password" placeholder="Пароль" required="true" message="Введите пароль!">
                    <label for="Chinputpassword" class="sr-only">Потвердите пароль</label>
                <cfinput type="password" id="Chinputpassword" class="form-control" name="chPassword" placeholder="Повторите пароль" required="true" message="Повторите пароль!">
                    <a><cfinput  type="submit" class="btn btn-primary" name="update" value="Изменить"/></a>
            </cfform>


        </div>
    </div>



</main>

<cf_footer>
</cf_head>