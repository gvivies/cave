import com.gvivies.cave.DataController

class BootStrap {

    def init = { servletContext ->
		DataController.initSecurity()
    }
    def destroy = {
    }
}
