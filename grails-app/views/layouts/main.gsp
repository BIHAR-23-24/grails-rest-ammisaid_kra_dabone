<%@ page import="fr.bihar.esante.User" %>
<!-- grails-app/views/layouts/main.gsp -->

<%@ page import="grails.plugin.springsecurity.SpringSecurityService" %>
<%
    def springSecurityService = applicationContext.getBean('springSecurityService')
    def loggedInUser = springSecurityService?.principal
    def roles = springSecurityService.getPrincipal().getAuthorities()

%>

<sec:ifLoggedIn>

    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Dashboard - SB Admin</title>
        <asset:stylesheet src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"/>
        <asset:stylesheet src="styles.css"/>
        <asset:javascript src="script2Ad.js"/>
        <g:layoutHead/>
        <style>
    #layoutSidenav_content {
        position: relative;
        overflow: hidden;
        background-image: url('${resource(dir: 'images', file: 'medical-4510408_1920.png')}');
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;

        width: 100%;
        height: 100%; /* Adjust the height as needed */
    }
        </style>

    </head>
    <body class="sb-nav-fixed">
    <nav class="sb-topnav navbar navbar-expand navbar-primary bg-primary-light shadow">
        <!-- Navbar Brand-->

        <a class="navbar-brand ps-3" href="#">eHealth</a>
        <!-- Sidebar Toggle-->
        <div style="color:dodgerblue;font-weight: bold;margin-left: 100px " id="userInfo">
            <i>Hello ${loggedInUser?.username} !</i>
        </div>
        <g:link controller="logout" action="index"> <button type="button" class="btn btn-outline-danger" style="margin-left:950px">Logout</button></g:link>

    </nav>

    <div id="layoutSidenav">
        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-navbar-light" id="sidenavAccordion" style="background-color: #A0E9FF;">
                <div class="sb-sidenav-menu">
                    <div class="nav">
                        <div class="sb-sidenav-menu-heading">Home</div>
                        <a class="nav-link" href="">
                            <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                            Home
                        </a>

                        <sec:ifLoggedIn>
                            <g:if test="${roles.any { it.authority == 'ROLE_ADMIN' }}">
                                <div class="sb-sidenav-menu-heading">Menu</div>
                                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                    <div class="sb-nav-link-icon">
                                        <i class="fas fa-book-open"></i>
                                    </div>
                                    Users
                                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                </a>
                            </g:if>
                            <g:if test="${roles.any { it.authority in ['ROLE_ADMIN', 'ROLE_DOC'] }}">
                                <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                    <nav class="sb-sidenav-menu-nested nav">

                                        <g:link controller="user" action="create" class="nav-link">Add User</g:link>
                                        <g:link controller="user" action="index" class="nav-link">All Users</g:link>
                                    </nav>
                                </div>
                                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                    <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                    Consultations
                                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                </a>
                                <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                    <nav class="sb-sidenav-menu-nested nav">

                                        <g:link controller="consultation" action="create" class="nav-link">Create Consultations </g:link>
                                        <g:link controller="consultation" action="index" class="nav-link">All Consultations </g:link>
                                    </nav>
                                </div>
                                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePagess" aria-expanded="false" aria-controls="collapsePages">
                                    <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                    Carnet
                                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                </a>
                                <div class="collapse" id="collapsePagess" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                    <nav class="sb-sidenav-menu-nested nav">
                                        <g:link controller="carnet" action="create" class="nav-link">Create Notebook</g:link>
                                        <g:link controller="carnet" action="index" class="nav-link">All Notebooks</g:link>
                                    </nav>
                                </div>
                                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePagesss" aria-expanded="false" aria-controls="collapsePages">
                                    <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                    Pathologie
                                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                </a>
                                <div class="collapse" id="collapsePagesss" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                    <nav class="sb-sidenav-menu-nested nav">
                                        <g:link controller="pathology" action="create" class="nav-link">Create Pathology </g:link>
                                        <g:link controller="pathology" action="index" class="nav-link">All Pathologies </g:link>
                                    </nav>
                                </div>
                            </g:if>

                        </sec:ifLoggedIn>


                    %{--                        we check the current user role if it is not an admin or doc we hide the Users dropdown--}%


                    </div>
                </div>

                <div class="sb-sidenav-footer">
                    <div class="small">Vous êtes connecté(e)s</div>
                    E-santé
                </div>
            </nav>
        </div>
        <div id="layoutSidenav_content">
            <main>
                <g:layoutBody/>
            </main>

            <footer class="py-4 bg-light mt-auto">
                <div class="container-fluid px-4">
                    <div class="d-flex align-items-center justify-content-between small">
                        <div class="text-muted">Copyright & copie SantePourTous 2023</div>
                        <div>
                            <a href="#">Politique de confidentialité</a>
                            &middot;
                            <a href="#">Termes et conditions Conditions</a>
                        </div>
                    </div>
                </div>
            </footer>
        </div>
    </div>

    <asset:javascript src="scriptss.js"/>
    </body>
    </html>



</sec:ifLoggedIn>