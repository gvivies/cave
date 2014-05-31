package com.gvivies.cave



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class BottleController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Bottle.list(params), model:[bottleInstanceCount: Bottle.count()]
    }

    def show(Bottle bottleInstance) {
        respond bottleInstance
    }

    def create() {
        respond new Bottle(params)
    }

    @Transactional
    def save(Bottle bottleInstance) {
        if (bottleInstance == null) {
            notFound()
            return
        }

        if (bottleInstance.hasErrors()) {
            respond bottleInstance.errors, view:'create'
            return
        }

        bottleInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'bottleInstance.label', default: 'Bottle'), bottleInstance.id])
                redirect bottleInstance
            }
            '*' { respond bottleInstance, [status: CREATED] }
        }
    }

    def edit(Bottle bottleInstance) {
        respond bottleInstance
    }

    @Transactional
    def update(Bottle bottleInstance) {
        if (bottleInstance == null) {
            notFound()
            return
        }

        if (bottleInstance.hasErrors()) {
            respond bottleInstance.errors, view:'edit'
            return
        }

        bottleInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Bottle.label', default: 'Bottle'), bottleInstance.id])
                redirect bottleInstance
            }
            '*'{ respond bottleInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Bottle bottleInstance) {

        if (bottleInstance == null) {
            notFound()
            return
        }

        bottleInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Bottle.label', default: 'Bottle'), bottleInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'bottleInstance.label', default: 'Bottle'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
