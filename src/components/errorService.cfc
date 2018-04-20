<!---
  Created by Aisha on 20.04.2018.
--->
<cfcomponent output="false">
    <cffunction name="deleteErrorWithHistory" access="public" output="false" returntype="boolean">
        <cfargument name="errorId" type="numeric" required="true"/>
        <cfset isErrorDeleted = false/>
        <cfquery>
           DELETE FROM `errorhistory` WHERE error_id = "#arguments.errorId#";
        </cfquery>
        <cfquery >
           DELETE FROM `error` WHERE id = "#arguments.errorId#";
        </cfquery>
        <cfset isErrorDeleted = true />
        <cfreturn isErrorDeleted>
    </cffunction>
    <cffunction name="errorList" access="public" output="false" returntype="query">
        <cfquery name="error_select">
            SELECT id,`short_descr`, `full_descr`, eh.status as stat, eh.latestDate as lateDate, eh.whole_name as fullname, `urgency`, `criticality` FROM `error` as er
            JOIN
            (SELECT max(`data`) as latestDate, status, su.whole_name, error_id FROM errorhistory
                INNER JOIN(SELECT id, CONCAT_WS(" ", `firstname`, `lastname`)
                AS `whole_name` FROM `systemuser`)
            as su on su.id = user_id
            group by error_id )
            as eh on er.id = eh.error_id
        </cfquery>
        <cfreturn error_select>
    </cffunction>

    <cffunction name="error_Reg" access="public" output="false" returntype="boolean">
        <cfargument name="status" type="string" required="true"/>
        <cfargument name="comment" type="string" required="true"/>
        <cfargument name="short_descr" type="string" required="true"/>
        <cfargument name="detailed_descr" type="string" required="true"/>
        <cfargument name="urgency" type="string" required="true"/>
        <cfargument name="criticality" type="string" required="true"/>
        <cfset isErrorRegistred = false/>


        <cfquery >
            DROP TRIGGER IF EXISTS `new_history`
        </cfquery>
        <cfquery >
           CREATE TRIGGER new_history AFTER INSERT ON error
           FOR EACH ROW
                BEGIN
                 INSERT INTO `errorhistory`(`data`, `status`, `comment`, `user_id`, `error_id`)
                 VALUES ('#DateFormat(Now(),"yyyy-mm-dd hh:mm:ss")#','#arguments.status#','#arguments.comment#','#session.stLoggedInUser.userID#',NEW.id);
                END
        </cfquery>
        <cfquery >
           INSERT INTO `error`(`short_descr`, `full_descr`, `urgency`, `criticality`)
           VALUES ('#arguments.short_descr#','#arguments.detailed_descr#','#arguments.urgency#','#arguments.criticality#')
        </cfquery>
        <cfset isErrorRegistred = true/>
        <cfreturn isErrorRegistred>
    </cffunction>


    <cffunction name="error_Update" access="public" output="false" returntype="boolean">
        <cfargument name="id" type="numeric" required="true"/>
        <cfargument name="status" type="string" required="true"/>
        <cfargument name="comment" type="string" required="true"/>
        <cfargument name="short_descr" type="string" required="true"/>
        <cfargument name="detailed_descr" type="string" required="true"/>
        <cfargument name="urgency" type="string" required="true"/>
        <cfargument name="criticality" type="string" required="true"/>
        <cfset isErrorUpdated = false/>
        <cfquery >
            DROP TRIGGER IF EXISTS `new_history`
        </cfquery>
        <cfquery >
           CREATE TRIGGER new_history AFTER UPDATE ON error
           FOR EACH ROW
                BEGIN
                 INSERT INTO `errorhistory`(`data`, `status`, `comment`, `user_id`, `error_id`)
                 VALUES ('#DateFormat(Now(),"yyyy-mm-dd hh:mm:ss")#','#arguments.status#','#arguments.comment#','#session.stLoggedInUser.userID#',NEW.id);
                END
        </cfquery>
        <cfquery >
           UPDATE `error` SET `short_descr`='#arguments.short_descr#',`full_descr`='#arguments.detailed_descr#',`urgency`='#arguments.urgency#',`criticality`='#arguments.criticality#'
            WHERE `id`=#arguments.id#
        </cfquery>
        <cfset isErrorUpdated = true/>
        <cfreturn isErrorUpdated>
    </cffunction>

    <cffunction name="selectHistory" access="public" output="false" returntype="query">
        <cfargument name="error_id" type="numeric" required="true"/>
        <cfquery name="historyList">
           SELECT his.`id`,`data`, `status`, `comment`, su.whole_name as fullname
           FROM `errorhistory`as his
           INNER JOIN
           (SELECT id, CONCAT_WS(" ", `firstname`, `lastname`)AS `whole_name` FROM `systemuser`)
           as su on su.id = user_id and error_id = #arguments.error_id#
        </cfquery>
        <cfreturn historyList>
    </cffunction>

    <cffunction name="selectErrorToUpdate" access="public" output="false" returntype="query">
        <cfargument name="error_id" type="numeric" required="true"/>
        <cfquery  name="errorToUpdate">
             SELECT `short_descr`, `full_descr`, eh.status as stat, `urgency`, `criticality`, eh.comment as comment
             FROM `error` as er
             JOIN
                (SELECT status, error_id,comment
                FROM errorhistory group by error_id )
             as eh on er.id = #arguments.error_id# and eh.error_id =#arguments.error_id#
        </cfquery>
        <cfreturn errorToUpdate>
    </cffunction>

    <cffunction name="deleteHistory" access="public" output="false" returntype="boolean">
        <cfargument name="historyId" type="numeric" required="true"/>
        <cfset isErrorDeleted = false/>
        <cfquery>
           DELETE FROM `errorhistory` WHERE id = "#arguments.historyId#";
        </cfquery>
        <cfset isErrorDeleted = true />
        <cfreturn isErrorDeleted>
    </cffunction>
</cfcomponent>
