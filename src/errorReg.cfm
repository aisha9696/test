<!---
  Created by Aisha on 11.04.2018.
--->
<!---server side validation--->
<cfset aErrorMessage = arrayNew(1)/>
<cfif structKeyExists(form,'add')>
    <cfset form.enter_date = DateFormat(Now(),"yyyy-mm-dd hh:mm:ss")/>
    <cfset form.user_id = "1"/>

    <cfif arrayIsEmpty(aErrorMessage)>
        <cfquery datasource="error_register">
            DROP TRIGGER IF EXISTS `new_history`
        </cfquery>
        <cfquery datasource="error_register">
           CREATE TRIGGER new_history AFTER INSERT ON error
           FOR EACH ROW
                BEGIN
                 INSERT INTO `errorhistory`(`data`, `status`, `comment`, `user_id`, `error_id`)
                 VALUES ('#form.enter_date#','#form.status#','#form.comment#','#form.user_id#',NEW.id);
                END
        </cfquery>
        <cfquery datasource="error_register">
           INSERT INTO `error`(`short_descr`, `full_descr`, `urgency`, `criticality`)
           VALUES ('#form.short_descr#','#form.detailed_descr#','#form.urgency#','#form.criticality#')
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
                <a class="nav-link" href="errorList.cfm">Список ошибок</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="errorReg.cfm">Добавить ошибки<span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="userUpdate.cfm ">Редактирование пользователя</a>
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
            <h1>Введите параметры ошибки</h1>
            <cfform>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon1">Короткое описание</span>
                        </div>
                        <cfinput name="short_descr" type="text" class="form-control" placeholder="Короткое описание" required="true" >
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon1">Подробное описание</span>
                        </div>
                        <cfinput name="detailed_descr" type="text" class="form-control" placeholder="Подробное описание"  required="true">
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <label class="input-group-text" for="inputGroupSelect01">Статус</label>
                        </div>
                        <cfselect name="status" class="custom-select" id="inputGroupSelect01" required="true">
                            <option selected>Choose...</option>
                            <option value="Новая">Новая</option>
                            <option value="Открытая">Открытая</option>
                            <option value="Решенная">Решенная</option>
                            <option value="Закрытая">Закрытая</option>
                        </cfselect>
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <label class="input-group-text" for="inputGroupSelect01">Срочность </label>
                        </div>
                        <cfselect name="urgency" class="custom-select" id="inputGroupSelect01" required="true">
                            <option selected>Choose...</option>
                            <option value="Очень Срочно">Очень Срочно</option>
                            <option value="Срочно">Срочно</option>
                            <option value="Несрочно">Несрочно</option>
                            <option value="Совсем несрочно">Совсем несрочно</option>
                        </cfselect>
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <label class="input-group-text" for="inputGroupSelect01">Критичность  </label>
                        </div>
                        <cfselect name="criticality" class="custom-select" id="inputGroupSelect01" required="true">
                            <option selected>Choose...</option>
                            <option value="Авария">Авария</option>
                            <option value="Критичная">Критичная</option>
                            <option value="Некритичная">Некритичная</option>
                            <option value="Запрос на изменение">Запрос на изменение</option>
                        </cfselect>
                    </div>
                    <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="basic-addon1">Комментарии</span>
                            </div>
                    <cfinput name="comment" type="text" class="form-control" placeholder="Комментарии"  required="true">
                    </div>
                    <a><cfinput  type="submit" class="btn btn-primary" name="add" value="Добавить"></a>
            </cfform>



        </div>
    </div>



</main>

<footer class="container">
    <p>© Company 2017-2018</p>
</footer>

</body></html>