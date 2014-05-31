package com.gvivies.cave



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class DealerController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Dealer.list(params), model:[dealerInstanceCount: Dealer.count()]
    }

    def show(Dealer dealerInstance) {
        respond dealerInstance
    }

    def create() {
        respond new Dealer(params)
    }

    @Transactional
    def save(Dealer dealerInstance) {
        if (dealerInstance == null) {
            notFound()
            return
        }

        if (dealerInstance.hasErrors()) {
            respond dealerInstance.errors, view:'create'
            return
        }

        dealerInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'dealerInstance.label', default: 'Dealer'), dealerInstance.id])
                redirect dealerInstance
            }
            '*' { respond dealerInstance, [status: CREATED] }
        }
    }

    def edit(Dealer dealerInstance) {
        respond dealerInstance
    }

    @Transactional
    def update(Dealer dealerInstance) {
        if (dealerInstance == null) {
            notFound()
            return
        }

        if (dealerInstance.hasErrors()) {
            respond dealerInstance.errors, view:'edit'
            return
        }

        dealerInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Dealer.label', default: 'Dealer'), dealerInstance.id])
                redirect dealerInstance
            }
            '*'{ respond dealerInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Dealer dealerInstance) {

        if (dealerInstance == null) {
            notFound()
            return
        }

        dealerInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Dealer.label', default: 'Dealer'), dealerInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'dealerInstance.label', default: 'Dealer'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
