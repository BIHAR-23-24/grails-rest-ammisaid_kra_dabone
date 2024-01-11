<%@ page import="fr.bihar.esante.Carnet" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
    <asset:stylesheet href="styles.css"></asset:stylesheet>
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <asset:javascript src="datatables-simple-demo.js"/>
</head>
<body>


<div id="layoutSidenav_content" style="padding-left:20px;padding-right: 20px">
    <div class="card mb-5">
        <div class="card-header">
            <div class="row">
                <div class="col-6">
                    <g:link class="btn btn-outline-secondary" action="create" resource="${this.carnet}">
                        <i class="fas fa-table me-1"></i>
                        <g:message code="default.button.create.label" default="Create" />
                    </g:link>
                </div>


                <div class="col-6">
                    All Carnet
                </div>
            </div>
        </div>

        <div class="card-body">
            <table id="datatablesSimple">
                <thead>
                <tr>
                    <th>N</th>
                    <th>First name</th>
                    <th>Last name</th>
                    <th>Dob</th>
                    <th>Tel</th>
                    <th>Weight</th>
                    <th>Height</th>
                    <th>Blood Type</th>
                    <th>Action</th>


                </tr>
                </thead>
                <tbody>
                <g:each in="${Carnet.list()}" var="carnet">
                    <tr>
                        <th scope="row">${carnet.id}</th>
                        <td>
                            <g:link controller="carnet" action="show" id="${carnet.id}">
                            %{--${user.username}--}%
                                <g:fieldValue bean="${carnet}" field="fname" />
                            </g:link>
                        </td>
                        <td>
                            <g:fieldValue bean="${carnet}" field="lname" />
                        </td>


                        <td>
                            <g:fieldValue bean="${carnet}" field="dob" />
                        </td>


                        <td>
                            <g:fieldValue bean="${carnet}" field="tel" />
                        </td>


                        <td>
                            <g:fieldValue bean="${carnet}" field="weight" />
                        </td>


                        <td>
                            <g:fieldValue bean="${carnet}" field="height" />
                        </td>

                        <td>
                            <g:fieldValue bean="${carnet}" field="bloodType" />
                        </td>
                        <!--
                            <td>

                                <g:form resource="${this.carnet}" method="DELETE">
                            <fieldset class="buttons">
                            <g:link class="edit" action="edit" resource="${this.carnet}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                            <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                                    </fieldset>
                        </g:form>
                            </td>
-->
                        <td>

                            <fieldset class="buttons">
                                <!-- Edit Link


                                        <button type="button" class="btn btn-success" data-toggle="modal" data-target="#editModal">
                                            Edith
                                        </button>
-->
                                <button
                                        type="button"
                                        class="btn btn-success btn-edit"
                                        data-toggle="modal"
                                        data-target="#editModal"
                                        data-consultation-id="${carnet.id}"
                                >
                                    Edith
                                </button>

                                <!-- Delete Button (in a modal) -->
                                <button
                                        type="button"
                                        class="btn btn-danger btn-delete"
                                        data-toggle="modal"
                                        data-target="#deleteModal"
                                        data-consultation-id="${carnet.id}"
                                >
                                    Delete
                                </button>

                            </fieldset>

                        </td>

                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>
    </div>

    <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="deleteModalLabel">Delete the carnet</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                   Are you sure you want to delete this carnet ?
                </div>

                <div class="modal-footer">

                    <g:form resource="${this.carnet}" controller="carnet" action="delete" method="DELETE">
                        <input type="hidden" id="consultationId" name="id" value="" />
                        <button type="submit" class="btn btn-danger">Delete</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    </g:form>

                </div>
            </div>
        </div>

    </div>


    <!-- Edit Modal -->
    <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editModalLabel">Edit the carnet</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    Are you sure you want to modify this carnet ?
                </div>
                <div class="modal-footer">
                <!--
                <g:form resource="${this.carnet}"  method="DELETE">
                    <button type="button" class="btn btn-success" data-dismiss="modal">Edit</button>
                    <g:link class="btn btn-success" action="edit" resource="${this.carnet}">
                        <g:message code="default.button.edit.label" default="Edit" />
                    </g:link>

                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                </g:form>
Edit Modal -->
                    <g:form resource="${this.carnet}" controller="carnet" action="edit">
                        <input type="hidden" id="consultationIdEdit" name="id" value="" />
                        <button type="submit" class="btn btn-success">Modifier</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    </g:form>

                </div>

            </div>
        </div>
    </div>

</div>





<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>



<!-- Add this script at the end of your HTML body to handle modals -->
<script>
    // Function to open the Edit Modal
    function openEditModal() {
        $('#editModal').modal('show');
    }

    // Function to close the Edit Modal
    function closeEditModal() {
        $('#editModal').modal('hide');
    }

    // Function to open the Delete Modal
    function openDeleteModal() {
        $('#deleteModal').modal('show');
    }

    // Function to close the Delete Modal
    function closeDeleteModal() {
        $('#deleteModal').modal('hide');
    }

    // Attach click events to buttons to open/close modals
    $(document).ready(function () {
        // Edit Button Click Event
        $('.btn-success').on('click', function () {
            openEditModal();
        });

        // Close Edit Modal Click Event
        $('#editModal .btn-secondary').on('click', function () {
            closeEditModal();
        });

        // Delete Button Click Event
        $('.btn-danger').on('click', function () {
            openDeleteModal();
        });

        // Close Delete Modal Click Event
        $('#deleteModal .btn-secondary').on('click', function () {
            closeDeleteModal();
        });
    });
</script>

<script>
    $(document).ready(function () {
        $('.btn-delete').on('click', function () { <!-- Use '.btn-delete' as the selector -->
            var consultationId = $(this).attr('data-consultation-id');
            $('#consultationId').val(consultationId);
        });
    });
</script>

<script>
    $(document).ready(function () {
        $('.btn-edit').on('click', function () { <!-- Use '.btn-delete' as the selector -->
            var consultationId = $(this).attr('data-consultation-id');
            $('#consultationIdEdit').val(consultationId);
        });
    });
</script>





</body>
</html>
