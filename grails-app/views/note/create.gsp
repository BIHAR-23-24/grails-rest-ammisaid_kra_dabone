<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'note.label', default: 'Note')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
    <asset:javascript src="note.js"/>
    <asset:stylesheet href="note_style.css"/>
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
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-7">
                <div class="card shadow-lg border-0 rounded-lg mt-5">
                    <div class="card-body">
                        <g:form resource="${this.note}" method="POST" enctype="multipart/form-data">
                            <!-- Doctor description -->
                            <br/>
                            <g:textArea value="fill description .. " name="description" id="description" rows="1" cols="50">

                            </g:textArea>

                            <!--Image-->
                            <div>
                                <div class="mb-4 d-flex justify-content-center">
                                    <img id="selectedImage" src="${resource(dir: 'images', file: 'upload_p_image.jpg')}"
                                         alt="example placeholder" style="width: 200px;" />
                                </div>
                                <div class="d-flex justify-content-center">
                                    <div class="btn btn-primary btn-rounded">
                                        <label class="form-label text-white m-1" for="customFile1">Upload Patient Images</label>
                                        <input name="CustomFile" type="file" class="form-control d-none btn-outline-primary" id="customFile1"
                                               onchange="displaySelectedImage(event, 'selectedImage')"
                                        />
                                    </div>
                                </div>
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
        </div>
    </div>

    </body>
</html>

