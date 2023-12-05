<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'note.label', default: 'Note')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <style>
        /* Style to hide the placeholder text by default */
        .form-control.placeholder-visible::placeholder {
            color: transparent;
        }
        </style>
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
                                <label for="description">Description</label>
                                <div class="rich-text-editor" contenteditable>
                                    <p >Patient Name : <span style="color: darkblue"></span> </p>
                                    <p>Diagnosis: Anxiety, back and neck pain, scoliosis, obesity</p>
                                    <p>Recommended Treatment: Gym membership, Massage, Vitamin D, Magnesium</p>
                                    <p>Duration of Treatment: 1 year</p>
                                    <p>Date: 2/22/2022</p>
                                    <p>Licensed Practitioner: William Shakespear MD</p>
                                    <p>Signature of Licensed Practitioner: William Shakespear M</p>
                                </div>
                            </div>

                            <button type="submit" class="btn btn-primary">Submit Note</button>
                        </g:form>
                    </div>
                </div>
         </div>
    </body>

</html>
