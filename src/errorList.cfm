<!---
  Created by Aisha on 12.04.2018.
--->

<!---
  Created by Aisha on 11.04.2018.
--->

<cfquery datasource="error_register" name="error_select">
    SELECT `short_descr`, `full_descr`, eh.status as stat, eh.latestDate as lateDate, eh.whole_name as fullname, `urgency`, `criticality` FROM `error` as er
    JOIN
    (SELECT max(`data`) as latestDate, status, su.whole_name, error_id FROM errorhistory
        INNER JOIN(SELECT id, CONCAT_WS(" ", `firstname`, `lastname`)
        AS `whole_name` FROM `systemuser`)
    as su on su.id = user_id
    group by error_id )
    as eh on er.id = eh.error_id
</cfquery>

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
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">Номер </th>
                    <th scope="col">Дата ввода </th>
                    <th scope="col">Короткое описание</th>
                    <th scope="col">Подробное описание</th>
                    <th scope="col">Пользователь </th>
                    <th scope="col">Статус </th>
                    <th scope="col">Срочность </th>
                    <th scope="col">Критичность </th>
                    <th scope="col">Редактировать </th>
                    <th scope="col">Удалить </th>
                </tr>
                </thead>
                <tbody>
                <cfset count = 1/>
                <cfoutput query="error_select">
                    <tr>
                        <th scope="row">#count++#</th>
                        <td>#lateDate#</td>
                        <td>#short_descr#</td>
                        <td>#full_descr#</td>
                        <td>#fullname#</td>
                        <td>#stat#</td>
                        <td>#urgency#</td>
                        <td>#criticality#</td>
                        <td><button type="button" class="btn btn-primary">Редактировать</button></td>
                        <td><button type="button" class="btn btn-primary">Удалить</button></td>
                    </tr>
                </cfoutput>
                </tbody>
            </table>
        </div>
    </div>
</main>

<footer class="container">
    <p>© Company 2017-2018</p>
</footer>
</body></html>