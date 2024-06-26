<%@ page import="fr.bihar.esante.Role" %>

<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
    <title>
    <g:message code="default.edit.label" args="[entityName]" />
    </title>
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
                            <h3>Fill form to Create Account</h3>
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
                            <g:form resource="${this.user}" method="POST">
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

                                <div class="col-md-6">
                                    <div class="form-floating mb-3">
                                        <div class="form-group" >
                                            <label style="margin-top: 20px;margin-bottom: 20px;" for="role">Choose a Role</label>
                                            <div class="btn-group" role="group" aria-label="Role"  >
                                                <g:each in="${Role.list()}" var="role" status="i">
                                                    <input  type="radio" id="role${role.id}" name="role" class="btn-check" autocomplete="off" value="${role.id}" <g:if test="${i == 0}">checked</g:if>>
                                                    <label  class="btn btn-outline-primary" style="padding: 10px;margin: 10px" for="role${role.id}">${role.authority}</label>
                                                </g:each>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-floating mb-3" style="width:400px;margin-top: 25px">
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
    </main>
</div>
</body>
</html>
