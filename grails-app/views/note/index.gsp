<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'note.js.label', default: 'Note')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-note" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="list-note" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
%{--            <f:table collection="${noteList}" />--}%

            <div class="card" style="width: 50rem;">
                <g:each var="note" in="${noteList}">
                    <ul class="list-group list-group-light list-group-small">
                        <li class="list-group-item px-3">${note.description}</li>
                    </ul>
                </g:each>
                <div class="card-footer bg-body-tertiary px-3">Card footer</div>
            </div>

            <div class="pagination">
                <g:paginate total="${noteCount ?: 0}" />
            </div>
        </div>
    </body>
</html>