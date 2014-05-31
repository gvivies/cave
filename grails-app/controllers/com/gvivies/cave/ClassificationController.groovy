package com.gvivies.cave



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ClassificationController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Classification.list(params), model:[classificationInstanceCount: Classification.count()]
    }

    def show(Classification classificationInstance) {
        respond classificationInstance
    }

    def create() {
        respond new Classification(params)
    }

    @Transactional
    def save(Classification classificationInstance) {
        if (classificationInstance == null) {
            notFound()
            return
        }

        if (classificationInstance.hasErrors()) {
            respond classificationInstance.errors, view:'create'
            return
        }

        classificationInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'classificationInstance.label', default: 'Classification'), classificationInstance.id])
                redirect classificationInstance
            }
            '*' { respond classificationInstance, [status: CREATED] }
        }
    }

    def edit(Classification classificationInstance) {
        respond classificationInstance
    }

    @Transactional
    def update(Classification classificationInstance) {
        if (classificationInstance == null) {
            notFound()
            return
        }

        if (classificationInstance.hasErrors()) {
            respond classificationInstance.errors, view:'edit'
            return
        }

        classificationInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Classification.label', default: 'Classification'), classificationInstance.id])
                redirect classificationInstance
            }
            '*'{ respond classificationInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Classification classificationInstance) {

        if (classificationInstance == null) {
            notFound()
            return
        }

        classificationInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Classification.label', default: 'Classification'), classificationInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'classificationInstance.label', default: 'Classification'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
