package fr.bihar.esante

import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*


@Secured('ADMIN')
class UserController {

    UserService userService
    def springSecurityService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond userService.list(params), model:[userCount: userService.count()]
    }

    def show(Long id) {
        respond userService.get(id)
    }

    def create() {
        respond new User(params)
    }

    def save(User user) {
        println params
        if (user == null) {
            notFound()
            return
        }

        try {
            def role = Role.get(params.role)
            if (role == Role.findByAuthority('PATIENT'))
            {
                user.carnet = new Carnet()
                user.carnet.fname = "A renseigner"
                user.carnet.lname = "A renseigner"
                user.carnet.dob = new Date(70, 0, 1)
                user.carnet.weight = 0
                user.carnet.height = 0
                user.carnet.bloodType = "N/A"
            }
            userService.save(user)
            UserRole.create(user, role, true)
        } catch (ValidationException e) {
            respond user.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), user.id])
                redirect user
            }
            '*' { respond user, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond userService.get(id)
    }

    def update(User user) {
        if (user == null) {
            notFound()
            return
        }

        try {
            userService.save(user)
        } catch (ValidationException e) {
            respond user.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), user.id])
                redirect user
            }
            '*'{ respond user, [status: OK] }
        }
    }

    def delete(Long id) {
        User user
        def user_role
        if (id == null) {
            notFound()
            return
        }
        user =  userService.get(id) // get the user to be delete
        println (user.authorities)
        user_role = user.authorities // get its roles
        user_role.each {
            UserRole.remove(user,it) // for each role we delete both role_id and the user_id from join table
        }
        userService.delete(id) // try to delete safly knowing that constraint in UserRole join will be not voilated
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
