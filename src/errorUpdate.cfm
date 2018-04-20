<!---
  Created by Aisha on 16.04.2018.
--->

<!---
  Created by Aisha on 11.04.2018.
--->
<!---server side validation--->
<cfset errorService = createObject("component", 'test.src.components.errorService')/>
<cfif isDefined('url.error_id')>
    <cfset errorToUpdate =  errorService.selectErrorToUpdate(url.error_id)/>
    <cfset historyList =  errorService.selectHistory(url.error_id)/>

    <cfif structKeyExists(form,'update')>
        <cfset error_update =  errorService.error_Update(url.error_id, form.status, form.comment, form.short_descr, form.detailed_descr, form.urgency, form.criticality)/>
        <cfif error_update EQ true>
            <script>
                alert("Успешно!");
            </script>
        </cfif>
    </cfif>

    <cfset historyToDelete = false/>
    <cfif isDefined('url.history_id')>
        <cfset historyToDelete = errorService.deleteHistory(url.history_id)/>
    </cfif>
    <cfif historyToDelete EQ true>
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
    <h1>Введите параметры ошибки для изменения</h1>
<cfform>
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text" id="basic-addon1">Короткое описание</span>
        </div>
    <cfinput name="short_descr" type="text" class="form-control" value="#errorToUpdate.short_descr#" placeholder="Короткое описание" required="true" >
    </div>
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text" id="basic-addon1">Подробное описание</span>
        </div>
    <cfinput name="detailed_descr" type="text" class="form-control" value="#errorToUpdate.full_descr#" placeholder="Подробное описание"  required="true">
    </div>
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <label class="input-group-text" for="inputGroupSelect01">Статус</label>
        </div>
    <cfselect name="status" class="custom-select" id="inputGroupSelect01" selected="#errorToUpdate.stat#" required="true">
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
    <cfselect name="urgency" class="custom-select" selected="#errorToUpdate.urgency#" id="inputGroupSelect01" required="true">
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
    <cfselect name="criticality" class="custom-select" selected="#errorToUpdate.criticality#" id="inputGroupSelect01" required="true">
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
    <cfinput name="comment" type="text" class="form-control" value="#errorToUpdate.comment#" placeholder="Комментарии"  required="true">
    </div>
    <a><cfinput  type="submit" class="btn btn-primary" name="update" value="Изметить"></a>
</cfform>
    <div class="container-fluid">
        <div class="panel panel-default">
            <div class="panel-body">
                    <h3>История ошибок</h3>
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">Номер </th>
                            <th scope="col">Дата ввода </th>
                            <th scope="col">Пользователь </th>
                            <th scope="col">Статус </th>
                            <th scope="col">Комментарии </th>
                            <th scope="col">Удалить </th>
                        </tr>
                    </thead>
                    <tbody>
                        <cfset count = 1/>
                        <cfoutput query="historyList">
                            <tr>
                            <th scope="row">#count++#</th>
                            <td>#data#</td>
                            <td>#fullname#</td>
                            <td>#status#</td>
                            <td>#comment#</td>
                            <td><a href="errorUpdate.cfm?error_id=#url.error_id#&history_id=#id#" class="btn btn-primary">Удалить</a></td>
                        </tr>
                        </cfoutput>
                    </tbody>
                </table>
            </div>
        </div>

    </div>


</div>
</div>



</main>

<cf_footer>

</cf_head>
</cfif>