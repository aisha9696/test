<!---
  Created by Aisha on 11.04.2018.
--->
<cfscript>
    login ="Aisha";
    password ="123";

</cfscript>
<!---server side validation--->
<cfset aErrorMessage = arrayNew(1)/>
<cfif structKeyExists(form,'signin')>
<!---validate login and password--->
    <cfquery datasource="error_register" name="login_validation">
        SELECT COUNT(*) as count FROM `systemuser` WHERE login = "#form.login#"
    </cfquery>
    <cfquery datasource="error_register" name="password_validation">
        SELECT login FROM systemuser WHERE password = "#form.password#"
    </cfquery>
    <cfif #login_validation.count# EQ 0>
        <cfset arrayAppend(aErrorMessage,"Такой логин не существует!")/>
        <cfif #password_validation.login# NEQ #form.login#>
            <cfset arrayAppend(aErrorMessage,"Не правильный пароль!")/>
        </cfif>
    </cfif>
    <cfif arrayIsEmpty(aErrorMessage)>
        <script>
            alert("Успешно!");
            
        </script>
    </cfif>
</cfif>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="https://getbootstrap.com/favicon.ico">

    <title>Document</title>
    <link href="./Signin Template for Bootstrap_files/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="https://getbootstrap.com/docs/4.0/examples/sign-in/signin.css" rel="stylesheet">
</head>


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
        <h1 class="h3 mb-3 font-weight-normal">Вход</h1>
        <label for="inputlogin" class="sr-only">Введите логин</label>
        <cfinput type="text" id="inputlogin"  class="form-control" name="login" placeholder="Введите логин" required="true" message="Введите логин!">
        <label for="inputPassword" class="sr-only">Введите пароль</label>
        <cfinput type="password" id="inputPassword" class="form-control" name="password" placeholder="Введите пароль" required="true" message="Введите пароль!">
            <div class="checkbox mb-3">
                <label>
                    <input type="checkbox" value="remember-me"> Запомнить меня
                </label>
            </div>
        <cfinput type="submit" class="btn btn-lg btn-primary btn-block" name="signin" value="Войти">
    </cfform>
    <form  class="form-signin" >
        <input type="submit" class="btn btn-lg btn-primary btn-block" formaction="signup.cfm" name="signup" value="Регистрация"/>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>