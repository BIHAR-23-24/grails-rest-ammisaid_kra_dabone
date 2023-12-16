<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'carnet.label', default: 'Carnet')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
    <!-- Link to Bootstrap CSS -->
    <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
    <!-- Link to your specific stylesheet -->
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'assets/stylesheets', file: 'carnet_style.css')}" />

</head>
<body>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div id="create-carnet" class="content scaffold-create" role="main">
                <g:if test="${flash.message}">
                    <div class="alert alert-success" role="alert">${flash.message}</div>
                </g:if>
                <g:hasErrors bean="${this.carnet}">
                    <div class="alert alert-danger" role="alert">
                        <ul class="errors">
                            <g:eachError bean="${this.carnet}" var="error">
                                <li>${error}</li>
                            </g:eachError>
                        </ul>
                    </div>
                </g:hasErrors>
                <div class="card">
                    <div class="card-body">
                        <h2 class="card-title mb-4">Create Carnet</h2>
                        <g:form resource="${this.carnet}" method="POST">
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="fname">First Name *</label>
                                        <input type="text" name="fname" class="form-control" required />
                                    </div>
                                    <div class="col-md-6">
                                        <label for="lname">Last Name *</label>
                                        <input type="text" name="lname" class="form-control" required />
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="dob">Day of birth *</label>
                                <input type="date" name="dob" class="form-control" required />
                            </div>

                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="weight">Weight *</label>
                                        <input type="number" name="weight" class="form-control" required />
                                    </div>
                                    <div class="col-md-6">
                                        <label for="height">Height *</label>
                                        <input type="number" name="height" class="form-control" required />
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="bloodType">Blood Type</label>
                                <select name="bloodType" class="form-control">
                                    <option value="A+">A+</option>
                                    <option value="A-">A-</option>
                                    <option value="B+">B+</option>
                                    <option value="B-">B-</option>
                                    <option value="O+">O+</option>
                                    <option value="O-">O-</option>
                                    <option value="AB+">AB+</option>
                                    <option value="AB-">AB-</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <input class="btn btn-success" type="button" id="submitForm"
                                       value="${message(code: 'default.button.create.label', default: 'Create')}" />
                            </div>

                            <!-- ... (unchanged content) ... -->

                        </g:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
