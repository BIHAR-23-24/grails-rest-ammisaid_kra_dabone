<%@ page import="fr.bihar.esante.Pathology; fr.bihar.esante.Consultation" %>
<%@ page import="fr.bihar.esante.Pathology; fr.bihar.esante.Carnet" %>

<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'consultation.label', default: 'Consultation')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

</head>
<body>
    <div id="edit-user" class="content scaffold-edit" role="main">
        <main>
        <div class="container">

            <div class="row justify-content-center">
                <div class="col-lg-7">
                    <div class="card shadow-lg border-0 rounded-lg mt-5">
                        <div class="card-body">
                            <h1 class="text-center mb-4">Create a consultation</h1>

                            <div class="mx-auto"> <!-- Centering the form -->
                                <g:form resource="${this.consultation}" controller="consultation" action="save" method="POST" enctype="multipart/form-data">

                                    <div class="form-group">
                                        <!-- Select Patient Carnet -->
                                        <label for="carnet">Select the patient carnet:</label>
                                        <g:select name="carnet.id" from="${Carnet.list()}" optionKey="id" optionValue="fname" class="form-control mb-3" />
                                    </div>

                                    <div class="form-group">
                                        <!-- Observation -->
                                        <label for="description">Comments:</label>
                                        <g:textArea name="description" id="description" class="form-control mb-3"></g:textArea>
                                    </div>

                                    <div class="form-group">
                                        <!-- File upload input -->
                                        <label for="files">Choose files:</label>
                                        <input type="file" id="files" name="files" accept=".pdf, .doc, .docx, .png, .jpg, .jpeg" class="form-control mb-3" multiple>
                                    </div>

                                    <div class="form-group">
                                        <!-- Search Pathologies -->
                                        <label for="pathologySearch">Search for pathologies:</label>
                                        <input type="text" id="pathologySearch" class="form-control mb-3" placeholder="Search Pathologies">
                                        <ul id="pathologyList" class="list-group"></ul>
                                    </div>

                                    <div id="selectedPathologies" class="alert alert-info mt-3">
                                        <!-- Bootstrap alert styling, you can customize this further -->
                                        The selected pathologies will be displayed here:
                                    </div>

                                    <input type="hidden" name="pathologies" id="pathologies" />

                                    <!-- Fields for pathologies, if needed -->

                                    <div class="mt-3">
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                        <button type="reset" class="btn btn-secondary">Reset</button>
                                    </div>

                                </g:form>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        console.log('OK');

        // Get the list of pathologies from the server-side variable
        let pathologyDictionary = {};
        <g:each in="${Pathology.list()}" var="pathology">
        // Add each pathology's name and id to the dictionary
        pathologyDictionary[${pathology.id}] = '${pathology.name}';
        </g:each>

        // Set to store selected pathologies
        let selectedPathologies = new Set();

        // Function to filter and display pathologies based on search input
        function filterPathologies() {
            // Get the search input value
            const searchInput = document.getElementById('pathologySearch').value.trim().toLowerCase();

            // Get the pathology list container
            const pathologyList = document.getElementById('pathologyList');

            // Clear the current list
            pathologyList.innerHTML = '';

            // Check if the search input is not empty
            if (searchInput) {
                // Iterate through the pathologyDictionary
                for (const id in pathologyDictionary) {
                    const pathologyName = pathologyDictionary[id].toLowerCase();

                    // Check if the search input matches the pathology name and not already selected
                    if (pathologyName.includes(searchInput) && !selectedPathologies.has(id)) {
                        // Create a new list item for the matched pathology
                        const listItem = document.createElement('li');
                        listItem.textContent = pathologyDictionary[id];
                        listItem.setAttribute('data-id', id);

                        // Add click event to select the pathology
                        listItem.addEventListener('click', function () {
                            // Set the selected pathology in the input field
                            document.getElementById('pathologySearch').value = pathologyDictionary[id];

                            // Add the selected pathology to the set
                            selectedPathologies.add(id);

                            // Display the selected pathology in a separate div
                            displaySelectedPathology(id);



                            // Clear the pathology list after selection
                            pathologyList.innerHTML = '';
                        });

                        // Append the list item to the pathology list container
                        pathologyList.appendChild(listItem);
                    }
                }
            }
        }


        // Function to display selected pathology in a separate div and return selected keys
        function displaySelectedPathology(id) {
            const selectedPathologyDiv = document.getElementById('selectedPathologies');

            // Create a new div for the selected pathology
            const pathologyDiv = document.createElement('div');
            pathologyDiv.textContent = pathologyDictionary[id];

            // Append the div to the container
            selectedPathologyDiv.appendChild(pathologyDiv);

            // Set the value of the hidden input with the selected pathology IDs
            document.getElementById('pathologies').value = Array.from(selectedPathologies).join(',');

            // Return the selected keys as an array
            // return Array.from(selectedPathologies);
        }
        // Attach the filterPathologies function to the input event
        document.getElementById('pathologySearch').addEventListener('input', filterPathologies);
    </script>



</body>
</html>
