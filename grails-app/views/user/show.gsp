<%@ page import="fr.bihar.esante.User" %>

<!DOCTYPE html>
<html>

<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
    <title>
    <g:message code="default.create.label" args="[entityName]" />
    </title>
    <asset:stylesheet href="users_styles.css"></asset:stylesheet>
</head>

<body>

    <div id="edit-user" class="content scaffold-edit" role="main">
            <div class="container">
                <div class="row">
                    <div id="user_card" class="card mb-3">
                        <div class="row g-0">
                            <div class="col-md-4">
                                <img
                                        src="https://bootdey.com/img/Content/avatar/avatar6.png"
                                        alt="Trendy Pants and Shoes"
                                        class="img-fluid rounded-start"
                                />
                            </div>
                            <div class="col-md-8">
                                <div class="card-body">
                                    <h5 class="card-title">${user.username}</h5>
                                <p class="card-text">
                                <!-- Your existing content goes here -->
                                    <g:if test="${user.getAuthorities()*.authority.contains('ROLE_PATIENT')}">
                                        <small class="text-muted">First Name</small>
                                        <h6>${user.carnet.fname} </h6>
                                        <small class="text-muted">Last Name</small>
                                        <h6>${user.carnet.lname} </h6>
                                        <small class="text-muted">User Email</small>
                                        <h6>${user.email} </h6>
                                        <small class="text-muted">Date of Birth</small>
                                        <h6>
                                            <g:formatDate date="${user.carnet.dob}" type="date" style="SHORT" />
                                        </h6>
                                        <small class="text-muted p-t-30 db">User Phone Number</small>
                                        <h6>${user.carnet.tel}</h6>
                                        <small class="text-muted p-t-30 db">Weight</small>
                                        <h6>${user.carnet.weight}</h6>
                                        <small class="text-muted p-t-30 db">Height</small>
                                        <h6>${user.carnet.height}</h6>
                                        <small class="text-muted p-t-30 db">Blood Type</small>
                                        <h6>${user.carnet.bloodType}</h6>
                                        <br>
                                    </g:if>
                                    <div class="delete_edit_form">
                                        <g:form resource="${this.user}" method="DELETE">
                                            <div class="row mb-3" style="margin: 40px">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <g:link class="btn btn-outline-secondary" action="edit" resource="${this.user}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="btn btn-outline-danger" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                                                    </div>
                                                </div>
                                            </div>
                                        </g:form>
                                    </div>
                                </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

    </div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
</html>
