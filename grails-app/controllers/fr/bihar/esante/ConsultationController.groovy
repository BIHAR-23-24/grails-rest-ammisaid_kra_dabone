package fr.bihar.esante

import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*
import org.springframework.web.multipart.commons.CommonsMultipartFile
import org.springframework.web.multipart.MultipartFile

@Secured('ROLE_ADMIN')
class ConsultationController {

    ConsultationService consultationService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    @Secured(['ROLE_ADMIN','ROLE_AUX'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond consultationService.list(params), model:[consultationCount: consultationService.count()]
    }

    @Secured(['ROLE_ADMIN','ROLE_AUX'])
    def show(Long id) {
        respond consultationService.get(id)
    }

    def create() {
        respond new Consultation(params)
    }


    def save(Consultation consultation) {
        if (consultation == null) {
            notFound()
            return
        }

        try {
            // Handle pathologies
            String[] pathologyIds = params.pathologies as String[]
            List<Pathology> pathologies = Pathology.findAll {
                id in pathologyIds.collect { it as Long }
            }
            consultation.pathologies = pathologies

            // Initialize note if null
            consultation.note = consultation.note ?: new Note()

            // Handle description
            consultation.note.description = params.description

            // Handle files
            MultipartFile[] files = request.getFileMap().values().toArray(new MultipartFile[0])

            // Initialize consultation.note.files if null
            consultation.note.files = consultation.note.files ?: []

            files.each { file ->
                // Save file details in CustomFile without storing the content in the database
                CustomFile customFile = new CustomFile(name: file.originalFilename)
                consultation.note.files.add(customFile)
                // You can choose to save the file to the filesystem or storage here if needed
                // You may want to implement this logic based on your requirements
            }

            // Set the Carnet
            Long carnetId = params.carnet?.id as Long
            Carnet carnet = Carnet.get(carnetId)
            consultation.carnet = carnet

            consultationService.save(consultation)
        } catch (ValidationException e) {
            respond consultation.errors, view: 'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'consultation.label', default: 'Consultation'), consultation.id])
                redirect consultation
            }
            '*' { respond consultation, [status: CREATED] }
        }
    }



    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        consultationService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'consultation.label', default: 'Consultation'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'consultation.label', default: 'Consultation'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
