<!---
  Created by Aisha on 12.04.2018.
--->

<!---
  Created by Aisha on 12.04.2018.
--->

<!---
  Created by Aisha on 11.04.2018.
--->

<cfquery datasource="error_register" name="userToUpdate">
   SELECT `login`, `firstname`, `lastname`, `password` FROM `systemuser` WHERE login ="123"
</cfquery>
<cfset aErrorMessage = arrayNew(1)/>
<cfif structKeyExists(form,'update')>
    <cfquery datasource="error_register" name="login_validation">
        SELECT COUNT(*) as count FROM `systemuser` WHERE login = "#form.login#"
    </cfquery>
    <cfif #login_validation.count# NEQ 0 AND #form.login# NEQ "123">
        <cfset arrayAppend(aErrorMessage,"Такой логин существует!")/>
    </cfif>
    <cfif #form.password# NEQ #form.chPassword# >
        <cfset arrayAppend(aErrorMessage,"Повторите пароль!")/>
    </cfif>
    <cfif arrayIsEmpty(aErrorMessage)>
        <cfquery datasource="error_register">
            UPDATE `systemuser` SET `login`='#form.login#',`firstname`='#form.firstname#',`lastname`='#form.lastname#',`password`= '#form.password#' WHERE login = "123"
        </cfquery>
        <script>
            alert("Успешно!");
        </script>
    </cfif>
</cfif>

<!DOCTYPE html>
<!-- saved from url=(0053)https://getbootstrap.com/docs/4.0/examples/jumbotron/ -->
<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="https://getbootstrap.com/favicon.ico">

    <title>Jumbotron Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <!-- Custom styles for this template -->
    <link href="https://getbootstrap.com/docs/4.0/examples/jumbotron/jumbotron.css" rel="stylesheet">
</head>

<body>

<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
    <a class="navbar-brand" href="">ER</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarsExampleDefault">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item ">
                <a class="nav-link " href="errorList.cfm">Список ошибок</a>
            </li>
            <li class="nav-item ">
                <a class="nav-link" href="errorReg.cfm">Добавить ошибки</a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" href="userUpdate.cfm">Редактирование пользователя<span class="sr-only">(current)</span></a>
            </li>


        </ul>
        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
    </div>
</nav>

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

<footer class="container">
    <p>© Company 2017-2018</p>
</footer>
</body></html>