
/**
 * MobileDecoratorMapper
 * Copyright 2011 Graham Daley
 * Released under the terms of the
 * GNU General Public License version 2 (GPLv2)
 */
package cave
 
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpSession
import org.apache.commons.lang.StringUtils
import org.codehaus.groovy.grails.web.context.ServletContextHolder
import org.springframework.web.context.support.WebApplicationContextUtils
import org.springframework.context.ApplicationContext
 
/**
 * MobileDecoratorMapper
 *
 * @author gdaley
 */
class MobileService {
	//def wurflManager
 
	def isMobileUser(HttpServletRequest request) {
		boolean isMobile = false
		HttpSession session = request.session
 
		// Is the preference already set?
		if (request.getParameter("mobile") != null) {
			// Did the user explicitly request a mobile / non-mobile format
			// in the request parameters?
			if (request.getParameter("mobile").equals("y")) {
				session.isMobile = "y"
				isMobile = true
			}
			else {
				session.isMobile = "n"
			}
		}
		else if (session.isMobile != null) {
			// Did we decide this one in an earlier request?
			if (session.isMobile.equals("y")) {
				isMobile = true
			}
		}
		else {
			// If not, detect the browser type
			if (isMobileBrowser(request)) {
				session.isMobile = "y"
				isMobile = true
			}
			else {
				session.isMobile = "n"
			}
		}
 
		return isMobile
	}
 
	def isMobileBrowser(HttpServletRequest request) {
		return false
		/*
		if (wurflManager == null) {
			def ctx = WebApplicationContextUtils.getWebApplicationContext(ServletContextHolder.servletContext)
			wurflManager = ctx.getBean("wurflManager")
		}
 
		def Device device = wurflManager.getDeviceForRequest(request)
		def String capability = device.getCapability("mobile_browser")
		return StringUtils.isNotBlank(capability)
		*/
	}
}
