<%@ page import="fr.bihar.esante.Role" %>

<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title>
            <g:message code="default.edit.label" args="[entityName]" />
        </title>
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

    </head>
    <body>
        <div id="edit-user" class="content scaffold-edit" role="main">
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.user}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.user}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <main>
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-7">
                            <div class="card shadow-lg border-0 rounded-lg mt-5">
                                <div class="card-header">
                                    <h3>Edit ${this.user.username}'s Account</h3>
                                </div>
                                <div class="card-body">
                                    <g:if test="${flash.message}">
                                        <div class="message" role="status">${flash.message}</div>
                                    </g:if>
                                    <g:hasErrors bean="${this.user}">
                                        <ul class="errors" role="alert">
                                            <g:eachError bean="${this.user}" var="error">
                                                <li <g:if test="${error in org.springframework.validation.FieldError}">
                                                    data-field-id="${error.field}"</g:if>>
                                                    <g:message error="${error}" />
                                                </li>
                                            </g:eachError>
                                        </ul>
                                    </g:hasErrors>
                                    <g:form resource="${this.user}" method="PUT">
                                        <g:hiddenField name="version" value="${this.user?.version}" />

                                        <div class="form-floating mb-3">
                                            <g:textField class="form-control" id="username" type="text"
                                                         placeholder="Username" name="username" />
                                            <label for="username">Username</label>
                                        </div>

                                        <div class="form-floating mb-3">
                                            <g:textField class="form-control" id="email" type="email" placeholder="Email"
                                                         name="email" />
                                            <label for="username">Email</label>
                                        </div>

                                        <div class="form-floating mb-3">
                                            <g:passwordField class="form-control" id="password" type="password"
                                                             placeholder="Password" name="password" />
                                            <label for="username">Password</label>
                                        </div>

                                            <div class="form-floating mb-3" style="width:400px;margin-top: 25px">
                                                <input class="save btn btn-outline-success"
                                                       type="submit"
                                                       value="${message(code: 'default.button.update.label', default: 'Update')}"
                                                />
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
