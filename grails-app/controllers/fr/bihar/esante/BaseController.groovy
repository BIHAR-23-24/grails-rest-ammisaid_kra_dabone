package fr.bihar.esante

import grails.plugin.springsecurity.SpringSecurityService

class BaseController {

    SpringSecurityService springSecurityService

    def beforeInterceptor = {
        // Make logged-in user information available to all views
        def loggedInUser = springSecurityService.principal
        request.setAttribute("loggedInUser", loggedInUser)
    }
}