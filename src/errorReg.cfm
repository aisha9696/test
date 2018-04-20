<!---
  Created by Aisha on 11.04.2018.
--->
<!---server side validation--->

<cfset errorService = createObject("component", 'test.src.components.errorService')/>
<cfif structKeyExists(form,'add')>
    <cfset error_Service =  errorService.error_Reg(form.status, form.comment, form.short_descr, form.detailed_descr, form.urgency, form.criticality)/>
    <cfif error_Service EQ true>
        <script>
            alert("Успешно!");
        </script>
    </cfif>

</cfif>
<cf_head>
<cf_navbar>

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
<cf_footer>

</cf_head>