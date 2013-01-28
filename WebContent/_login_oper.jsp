<%@ page import="org.meerkat.config.UserInfo"%>
<%
	String username = request.getParameter("name");
	String key = request.getParameter("key");
	String wsdlURL = request.getParameter("wsdlurl");

	if (username == null || key == null || wsdlURL == null) {
		session.invalidate();
		out.print("");
	} else {
		UserInfo user = new UserInfo(username, key, wsdlURL);
		session = request.getSession(true);
		if (user.isValid()) {
			session.setAttribute("currentSessionUser", user);
			session.setAttribute("currentSessionKey", key);
			session.setAttribute("currentSessionWSDL", wsdlURL);
			session.setMaxInactiveInterval(120);
			session.setAttribute("active", "true");
			out.print("OK");
		} else {
			session.invalidate();
			out.print(user.getErrorString());
		}
	}
%>
