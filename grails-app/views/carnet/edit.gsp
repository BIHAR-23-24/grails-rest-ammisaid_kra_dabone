<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'carnet.label', default: 'Carnet')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
    <div id="edit-user" class="content scaffold-edit" role="main">
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${this.carnet}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.carnet}" var="error">
                    <li <g:if test="${carnet in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
        </g:hasErrors>
         <main>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-7">
                    <div class="card shadow-lg border-0 rounded-lg mt-5">
                        <div class="card-header" style="text-align: center;">
                            <h3>Update carnet</h3>
                        </div>
                        <div class="card-body">
                            <g:if test="${flash.message}">
                                <div class="message" role="status">${flash.message}</div>
                            </g:if>
                            <g:hasErrors bean="${this.carnet}">
                                <ul class="errors" role="alert">
                                    <g:eachError bean="${this.carnet}" var="error">
                                        <li <g:if test="${error in org.springframework.validation.FieldError}">
                                            data-field-id="${error.field}"</g:if>>
                                            <g:message error="${error}" />
                                        </li>
                                    </g:eachError>
                                </ul>
                            </g:hasErrors>
                            <g:form resource="${this.carnet}" method="PUT">
                                <g:hiddenField name="version" value="${this.carnet?.version}" />

                                <div class="row">
                                    <div class="col-md-6" >
                                        <div class="form-floating mb-3">
                                <input class="form-control" id="fname" type="text"
                                             placeholder="fname" name="fname" value="${carnet.fname}" required/>
                                <label for="fname">First name</label>
                                </div>
                            </div>
                                <div class="col-md-6" >
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="lname" type="text"
                                               placeholder="lname" name="lname" value="${carnet.lname}"  required/>
                                        <label for="lname">Last name</label>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6" >
                                        <div class="form-floating mb-3">
                                            <label for="dob">dob</label>

                                            <g:datePicker name="dob" class="form-control" id="dob" type="date" placeholder="dob" value="${carnet.dob}" default="${new Date().plus(7)}"/>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-floating mb-3">
                                    <input class="form-control" id="tel" type="text"
                                           placeholder="tel" name="tel" value="${carnet.tel}"  required/>
                                    <label for="tel">telephone</label>
                                </div>


                                <div class="row">
                                    <div class="col-md-6" >
                                        <div class="form-floating mb-3">
                                            <input class="form-control" id="weight" type="number"
                                                   placeholder="weight" name="weight" format="0.00" value="${carnet.weight}" />
                                            <label for="weight">weight</label>
                                        </div>
                                    </div>

                                    <div class="col-md-6" >
                                        <div class="form-floating mb-3">
                                            <input class="form-control" id="height" type="number"
                                                   placeholder="height" name="height" value="${carnet.height}" />
                                            <label for="height">height</label>
                                        </div>
                                    </div>

                                </div>



                                <label for="bloodType">Blood Type</label>
                                <div class="form-floating mb-3">
                                    <select  name="bloodType" id="bloodType" class="form-control" required>
                                        <option value="${carnet.bloodType}">${carnet.bloodType}</option>
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


                                <div class="form-floating mb-3" style="width:400px; margin-top: 25px; margin-left: auto; margin-right: auto;">
                                    <input class="save btn btn-outline-success mx-auto d-block" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}"/>

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












