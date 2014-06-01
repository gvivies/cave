package cave

 
import javax.servlet.http.HttpServletRequest

import org.codehaus.groovy.grails.web.sitemesh.GrailsLayoutDecoratorMapper

import com.opensymphony.module.sitemesh.*

class MobileDecoratorMapper extends GrailsLayoutDecoratorMapper {
	
	/* Dependency injection */
	def grailsApplication

    public Decorator getDecorator(HttpServletRequest request, Page page) {
        
		MobileService mobileService = new MobileService()
		String viewSuffix = (mobileService.isMobileUser(request)  || (grailsApplication.config.getProperty('mobileDebug'))) ? ".mobile" : ""
        //String viewSuffix = (withMobileDevice || (grailsApplication.config.getProperty('mobileDebug'))) ? ".mobile" : ""
		log.debug "-----------------> viewSuffix ----> "+viewSuffix
        Decorator decorator = super.getDecorator(request, page)
        if (null == decorator) {
			log.debug "-----------------> decorator is null --> "+"main"+viewSuffix
            decorator = getNamedDecorator(request, "main" + viewSuffix)
        }  else {
            String decoratorName = decorator.getName()
			log.debug "-----------------> decorator is NOT null --> "+decoratorName + viewSuffix
            decorator = getNamedDecorator(request, decoratorName + viewSuffix)
        }
        return decorator
    }
}
