package mycompany

import grails.test.*

import org.junit.Ignore

class UserControllerTests extends GroovyTestCase {
    protected void setUp() {
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testIndex() {
		def ctrl = new UserController()
		ctrl.params.max = '10'
		ctrl.index()
		assertEquals "/user/list?max=10", ctrl.response.redirectedUrl
	}
	
	@Ignore
	void testList() {
		def users = [new User(realname:'realname1', username:'username1'), new User(realname:'realname2', username:'username2')]
		def errors = new HashMap()
		def mocker = MockUtils.mockDomain(User, errors, users)
		
		def ctrl = MockUtils.mockController(UserController)
		ctrl.params.max = '10'
		ctrl.demand.list() { -> returns mocker.list}
		def model = ctrl.modelAndView.model
		assertNotNull(model.userInstanceList)
		assertNotNull(model.userInstance)
	}
	
}
