<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'note.label', default: 'Note')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>

    <!-- Link to your specific stylesheet -->
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'assets/stylesheets', file: 'styles.css')}" />

</head>
<body>
<a href="#create-note" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
    </ul>
</div>
<div id="create-note" class="content scaffold-create" role="main">
    <h1><g:message code="default.create.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${this.note}">
        <ul class="errors" role="alert">
            <g:eachError bean="${this.note}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <div class="card">
        <div class="card-body">
            <h2 class="card-title mb-4">Notes</h2>
            <g:form resource="${this.note}" method="POST">
                <div class="form-group">
                    <label for="patientName">Patient Name</label>
                    <input type="text" name="patientName" class="form-control" />
                </div>
                <!-- Add other input fields as needed -->

                <!-- Your existing rich-text-editor contenteditable div -->
                <div class="rich-text-editor" contenteditable>
                    <!-- Your existing content -->
                </div>

                <div class="form-floating mb-3">
                    <input class="save btn btn-outline-success"
                           type="submit"
                           value="${message(code: 'default.button.create.label', default: 'Create')}"
                    />
                </div>
            </g:form>
        </div>
    </div>
</div>
</body>
</html>
