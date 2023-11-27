<%@ page import="fr.bihar.esante.User" %>

<!DOCTYPE html>
<html>

<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
    <title>
    <g:message code="default.create.label" args="[entityName]" />
    </title>
</head>

<body>
    <div id="edit-user" class="content scaffold-edit" role="main">
        <main>
            <div class="container">
                <div class="row">
                    <!-- First Column -->
                    <div class="col-lg-4 col-xlg-3 col-md-5">
                        <div class="card" style="padding-bottom:115px ">
                            <div class="card-body">
                                <div class="m-t-30" style="text-align: center;margin-top: 50px">
                                    <img src="https://bootdey.com/img/Content/avatar/avatar6.png"
                                         class="img-circle" width="150">
                                    <h4 class="card-title m-t-10">${user.username}</h4>
                                    <div class="row text-center justify-content-md-center">
                                        <div class="col-6"><i class="fa fa-user"></i>
                                            <span class="font-medium">${user.getAuthorities()*.authority.join(', ')}</span>
                                        </div>
                                    </div>
                                </div>

                                <g:form resource="${this.user}" method="DELETE">
                                    <div class="row mb-3" style="margin: 60px">
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
                        </div>
                    </div>
                    <!-- Second Column -->
                    <div class="col-lg-8 col-xlg-9 col-md-7">
                        <div class="card h-100">
                            <div class="card-footer text-muted d-flex flex-column">
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
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
</html>
