<%@ page import="fr.bihar.esante.Role" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <asset:javascript src="template_scripts.js"/>
    <asset:stylesheet href="styles.css"></asset:stylesheet>
</head>
<body class="bg-primary">
        <main>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-7">
                        <div class="card shadow-lg border-0 rounded-lg mt-5">
                            <div class="card-header"><h3 class="text-center font-weight-light my-4">Create Account</h3></div>
                            <div class="card-body">
                                <g:form controller="user" action="save" method="POST">
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="username" type="text" placeholder="Username" style="width:663px" />
                                                <label for="inputLastName">Username</label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="email" type="email" placeholder="name@example.com" />
                                        <label for="inputEmail">Email address</label>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <input class="form-control" id="inputPassword" type="password" placeholder="Create a password" />
                                                <label for="inputPassword">Password</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <input class="form-control" id="inputPasswordConfirm" type="password" placeholder="Confirm password" />
                                                <label for="inputPasswordConfirm">Confirm Password</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-floating mb-3">
                                                <div class="form-group">
                                                    <label style="margin-top: 20px;margin-bottom: 20px;" for="role">Choose a Role</label>
                                                    <div class="btn-group" role="group" aria-label="Role">
                                                        <g:each in="${Role.list()}" var="role" status="i">
                                                            <input type="radio" id="role${role.id}" name="role" class="btn-check" autocomplete="off" value="${role.id}" <g:if test="${i == 0}">checked</g:if>>
                                                            <label class="btn btn-outline-success" style="padding: 10px" for="role${role.id}">${role.authority}</label>
                                                        </g:each>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>


                                    </div>
                                    <div class="row mb-3" style="width: 300px;margin-left: 155px;">

                                            <g:submitButton name="create" class="btn btn-primary btn-block"
                                                            value="${message(code: 'default.button.create.label',
                                                                    default: 'Create')}"/>
                                       </div>
                                </g:form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>
