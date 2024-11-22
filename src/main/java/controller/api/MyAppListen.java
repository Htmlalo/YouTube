package controller.api;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.HttpSessionEvent;
import jakarta.servlet.http.HttpSessionListener;

import java.io.*;
import java.util.concurrent.atomic.AtomicInteger;

@WebListener
public class MyAppListen implements ServletContextListener, HttpSessionListener {

    private static final String FILE_PATH = "/WEB-INF/visitor_count.txt";
    private static final AtomicInteger visitCount = new AtomicInteger(0);

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        sce.getServletContext().setAttribute("visitCount", getVisitCount(sce));
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        incrementVisitorCount(sce);
    }

    @Override
    public void sessionCreated(HttpSessionEvent se) {
        HttpSession session = se.getSession();

        ServletContext context = session.getServletContext();
        context.setAttribute("visitCount", visitCount.incrementAndGet());
        System.out.println(session.getId());
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        System.out.println(se.getSession().getId());
    }


    public void incrementVisitorCount(ServletContextEvent sce) {
        String path = sce.getServletContext().getRealPath(FILE_PATH);

        File file = new File(path);
        File parenDir = file.getParentFile();
        if (!parenDir.exists()) parenDir.mkdir();
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(sce.getServletContext().getRealPath(FILE_PATH)))) {

            writer.write(String.valueOf(visitCount.get()));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private static int getVisitCount(ServletContextEvent sce) {
        try (BufferedReader reader = new BufferedReader(new FileReader(sce.getServletContext().getRealPath(FILE_PATH)))) {
            String line = reader.readLine();
            if (line != null) {
                visitCount.set(Integer.parseInt(line));
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return visitCount.get();
    }

}
