<!---
  Created by Aisha on 12.04.2018.
--->

<!---
  Created by Aisha on 11.04.2018.
--->

<cfset errorService = createObject("component", 'test.src.components.errorService')/>
<cfset errorToDelete = false/>
<cfset errorList = errorService.errorList()/>
<cfif isDefined('url.error_id')>
    <cfset errorToDelete = errorService.deleteErrorWithHistory(url.error_id)/>
</cfif>
<cfif errorToDelete EQ true>
    <script>
        alert("Успешно удалено!");
    </script>
</cfif>

<cf_head>
<cf_navbar>

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
                <cfoutput query="errorList">
                    <tr>
                        <th scope="row">#count++#</th>
                        <td>#lateDate#</td>
                        <td>#short_descr#</td>
                        <td>#full_descr#</td>
                        <td>#fullname#</td>
                        <td>#stat#</td>
                        <td>#urgency#</td>
                        <td>#criticality#</td>
                        <td><a href="errorUpdate.cfm?error_id=#id#" class="btn btn-primary">Редактировать</a></td>
                        <td><a href="errorList.cfm?error_id=#id#" class="btn btn-primary">Удалить</a></td>
                    </tr>
                </cfoutput>
                </tbody>
            </table>
        </div>
    </div>
</main>

 <cf_footer>
</cf_head>