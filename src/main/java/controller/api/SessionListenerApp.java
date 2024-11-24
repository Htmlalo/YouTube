package controller.api;

import jakarta.servlet.ServletContext;
import jakarta.servlet.annotation.WebListener;
import jakarta.servlet.http.HttpSessionEvent;
import jakarta.servlet.http.HttpSessionListener;

@WebListener
public class SessionListenerApp implements HttpSessionListener {
    @Override
    public void sessionCreated(HttpSessionEvent se) {
        if (!ContextListenApp.sessionCreated) {
        ServletContext context = se.getSession().getServletContext();
        context.setAttribute("visitCount", ContextListenApp.visitCount.incrementAndGet());
        }else {
            ContextListenApp.sessionCreated =false;
        }
    }
    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        HttpSessionListener.super.sessionDestroyed(se);
    }
}
