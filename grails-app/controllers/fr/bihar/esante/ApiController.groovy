package fr.bihar.esante

import grails.converters.JSON
import grails.converters.XML
import grails.plugin.springsecurity.annotation.Secured

@Secured('ROLE_ADMIN')
class ApiController {

    UserService userService
    ConsultationService consultationService
    def req_check_get_user(params) {
        if (!params.id) //check if the params has an id
            return response.status = 400 //case no id 400 code is sent
        User userInstance = User.get(params.id) // else we retrive the user with the id sended in params
        if (!userInstance) // check if the user with id exists
            return response.status = 404 // 404 not found code sent
        else return userInstance
    }

    def req_check_get_consultation(params) {
        if (!params.id) //check if the params has an id
            return response.status = 400 //case no id 400 code is sent
        Consultation consultInstance = Consultation.get(params.id) // else we retrive the user with the id sended in params
        if (!consultInstance) // check if the user with id exists
            return response.status = 404 // 404 not found code sent
        else return consultInstance
    }

    def messing_params_check(params) {
        if (!params)
            return render(status: 400, text: [status: 400, message: "Missing parameters in body"] as JSON)
        else false
    } //400 messing params code as json sent if user didnt sent params if

    def check_req_content_type(request,paramz) {
        if (request.getHeader('Content-Type')) {
            if (request.getHeader('Content-Type').contains("json")) paramz = request.getJSON()
            else if (request.getHeader('Content-Type').contains("xml")) paramz = request.getXML()
        }
        return paramz
    }
    /**
     * Répondra à l'appel sur /api/user/{id}
     * Devra gérer les requête de type GET, PUT, PATCH, DELETE
     */
    def user() {
        switch (request.getMethod()) // switch case based on the methode type
        {
            case "GET":
                def userInstance
                def params = check_req_content_type(request,params)
                userInstance = req_check_get_user(params) //encapsulate the params check in this request_check
                renderThis(userInstance, request.getHeader("Accept")) // rendering the user founded instance
                break

            case "PUT":
                User userInstance
                userInstance = req_check_get_user(params) //getting user and check on the params
                def put_params //declare null post_params
                put_params = check_req_content_type(request,put_params) //check recived params from client content type
                if(!messing_params_check(put_params)) {
                    userInstance.properties = put_params
                    userService.save(userInstance)
                    renderThis(userInstance, request.getHeader("Accept"))
                }
                break

            case "PATCH": //TO BE EXPLAINED
                User userInstance
                userInstance = req_check_get_user(params) //getting user and check on the params
                def put_params //declare null post_params
                put_params = check_req_content_type(request,put_params) //check recived params from client content type
                if(!messing_params_check(put_params)) {
                    userInstance.properties = put_params
                    userService.save(userInstance)
                    renderThis(userInstance, request.getHeader("Accept"))
                }
                break

            case "DELETE":
                User userDelete
                userDelete = req_check_get_user(params) //encapsulate the params check in this request_check
                def user_role = userDelete.authorities // get its roles
                user_role.each {
                    UserRole.remove(userDelete,it) // for each role we delete both role_id and the user_id from join table
                }
                def id = userDelete.id
                userService.delete(id) // try to delete safly knowing that constraint in UserRole join will be not voilated
                renderThis(userDelete, request.getHeader("Accept")) // rendering the user founded instance
                break

            default:
                return response.status = 405
                break
        }
    }

    /**
     * Répondra à l'appel sur /api/users
     * Devra gérer les requête de type GET, POST
     */
    def users() {

        switch (request.getMethod()) // switch case based on the methode type
        {
            case "GET":
                def users = User.getAll()
                println(users)
                renderThis(users, request.getHeader("Accept")) // rendering the user founded instance
                break

            case "POST":
                def post_params //declare null post_params
                // request.getJSON() contiendra les paramètres contenu dans le body si la requête est formatée en JSON
                post_params = check_req_content_type(request,post_params)
                if(!messing_params_check(post_params)){
                    User user_toCreate = new User()
                    user_toCreate.properties = post_params

                    def role = Role.get(post_params.role)
                    if (role == Role.findByAuthority('ROLE_PATIENT')) {
                        user_toCreate.carnet = new Carnet()
                        user_toCreate.carnet.fname = "A renseigner"
                        user_toCreate.carnet.lname = "A renseigner"
                        user_toCreate.carnet.dob = new Date(70, 0, 1)
                        user_toCreate.carnet.weight = 0
                        user_toCreate.carnet.height = 0
                        user_toCreate.carnet.bloodType = "N/A"
                    }
                    userService.save(user_toCreate)
                    UserRole.create(user_toCreate, role, true)
                    renderThis(user_toCreate, request.getHeader("Accept"))
                }
                break
        }
    }


    /**
     * Répondra à l'appel sur /api/consultation/{id}
     * Devra gérer les requête de type GET, PUT, PATCH, DELETE
     */

    def consultation() {
        switch (request.getMethod()) // switch case based on the methode type
        {
            case "GET":
                def consultInstance
                def params = check_req_content_type(request,params)
                consultInstance = req_check_get_consultation(params)
                renderThis(consultInstance, request.getHeader("Accept")) // rendering the user founded instance
                break

            case "PUT":
                Consultation consultInstance
                consultInstance = req_check_get_consultation(params)
                def put_params //declare null post_params
                put_params = check_req_content_type(request,put_params) //check recived params from client content type
                if(!messing_params_check(put_params)) {
                    consultInstance.properties["dateCreated"] = put_params.properties["dateCreated"]
                    println consultInstance.dateCreated
                    consultationService.save(consultInstance)
                    renderThis(consultInstance, request.getHeader("Accept"))
                }
                break

            case "PATCH": //TO BE EXPLAINED
                Consultation consultInstance
                consultInstance = req_check_get_consultation(params) //getting user and check on the params
                def patch_params //declare null post_params
                patch_params = check_req_content_type(request,patch_params) //check recived params from client content type
                if(!messing_params_check(patch_params)) {
                    consultInstance.properties = patch_params.properties.get("description")
                    consultationService.save(consultInstance)
                    renderThis(consultInstance, request.getHeader("Accept"))
                }
                break

            case "DELETE":
                Consultation consultInstance
                consultInstance = req_check_get_consultation(params) //encapsulate the params check in this request_check
                consultationService.delete(consultInstance.id)
                renderThis(consultInstance, request.getHeader("Accept")) // rendering the user founded instance
                break

            default:
                return response.status = 405
                break
        }

    }


    /**
     * Répondra à l'appel sur /api/consultations
     * Devra gérer les requête de type GET, POST
     */
    def consultations() {
        switch (request.getMethod()) // switch case based on the methode type
        {
            case "GET":
                def consult = Consultation.getAll()
                println(consult)
                renderThis(consult, request.getHeader("Accept")) // rendering the user founded instance
                break

            case "POST":
                def post_params //declare null post_params
                // request.getJSON() contiendra les paramètres contenu dans le body si la requête est formatée en JSON
                post_params = check_req_content_type(request,post_params)
                if(!messing_params_check(post_params)){
                    Consultation consult_toCreate = new Consultation()
                    consult_toCreate.properties = post_params


                    userService.save(user_toCreate)
                    UserRole.create(user_toCreate, role, true)
                    renderThis(user_toCreate, request.getHeader("Accept"))
                }
                break
        }

    }


    def renderThis(Object instance, String accept) {
        switch (accept) {
            case "xml":
            case "application/xml":
            case "text/xml":
                render instance as XML
                break
            case "json":
            case "application/json":
            case "text/json":
                render instance as JSON
                break
            default:
                return response.status = 406
                break
        }
    }
}