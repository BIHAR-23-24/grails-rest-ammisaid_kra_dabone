<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'pathology.label', default: 'Pathology')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#create-pathology" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="create-pathology" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.pathology}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.pathology}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.pathology}" method="POST">
                <fieldset class="form">
                    <f:all bean="pathology"/>
                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>


<%@ page import="fr.bihar.esante.Role" %>

<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'pathology.label', default: 'Pathology')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

</head>
<body>
<div id="edit-user" class="content scaffold-edit" role="main">
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${this.pathology}">
        <ul class="errors" role="alert">
            <g:eachError bean="${this.pathology}" var="error">
                <li <g:if test="${pathology in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <main>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-7">
                    <div class="card shadow-lg border-0 rounded-lg mt-5">
                        <div class="card-header" style="text-align: center;">
                            <h3>Create pathology</h3>
                        </div>
                        <div class="card-body">
                            <g:if test="${flash.message}">
                                <div class="message" role="status">${flash.message}</div>
                            </g:if>
                            <g:hasErrors bean="${this.pathology}">
                                <ul class="errors" role="alert">
                                    <g:eachError bean="${this.pathology}" var="error">
                                        <li <g:if test="${error in org.springframework.validation.FieldError}">
                                            data-field-id="${error.field}"</g:if>>
                                            <g:message error="${error}" />
                                        </li>
                                    </g:eachError>
                                </ul>
                            </g:hasErrors>
                            <g:form resource="${this.pathology}" method="POST">
                                <g:hiddenField name="version" value="${this.pathology?.version}" />
                                <div class="row">
                                        <div class="form-floating mb-3">
                                            <g:textField class="form-control" id="name" type="text" placeholder="name" name="name" />
                                <label for="name">Name of pathology</label>
                                </div>

                                <div class="form-floating mb-3" style="width:400px; margin-top: 25px; margin-left: auto; margin-right: auto;">
                                    <input class="save btn btn-outline-success mx-auto d-block" type="submit" value="${message(code: 'default.button.create.label', default: 'Create')}"/>
                                </div>
                            </g:form>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
    </main>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            crossorigin="anonymous"></script>
</div>
</body>
</html>












