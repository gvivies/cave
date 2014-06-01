package mycompany

import grails.test.*

class RegionControllerTests extends ControllerUnitTestCase {
    
	protected void setUp() {
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testIndex() {
		def rController = new RegionController()
		rController.index()
		//assertEquals "/list", rController.response.redirectedUrl
    }
}
