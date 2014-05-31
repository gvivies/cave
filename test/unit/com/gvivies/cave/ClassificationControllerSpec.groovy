package com.gvivies.cave



import grails.test.mixin.*
import spock.lang.*

@TestFor(ClassificationController)
@Mock(Classification)
class ClassificationControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.classificationInstanceList
            model.classificationInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.classificationInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def classification = new Classification()
            classification.validate()
            controller.save(classification)

        then:"The create view is rendered again with the correct model"
            model.classificationInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            classification = new Classification(params)

            controller.save(classification)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/classification/show/1'
            controller.flash.message != null
            Classification.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def classification = new Classification(params)
            controller.show(classification)

        then:"A model is populated containing the domain instance"
            model.classificationInstance == classification
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def classification = new Classification(params)
            controller.edit(classification)

        then:"A model is populated containing the domain instance"
            model.classificationInstance == classification
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/classification/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def classification = new Classification()
            classification.validate()
            controller.update(classification)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.classificationInstance == classification

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            classification = new Classification(params).save(flush: true)
            controller.update(classification)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/classification/show/$classification.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/classification/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def classification = new Classification(params).save(flush: true)

        then:"It exists"
            Classification.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(classification)

        then:"The instance is deleted"
            Classification.count() == 0
            response.redirectedUrl == '/classification/index'
            flash.message != null
    }
}
