package util;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import jakarta.servlet.http.HttpServletRequest;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.Map;

public class XJson {

    private static final ObjectMapper objectMapper;

    static {
        objectMapper = new ObjectMapper();
        objectMapper.registerModule(new JavaTimeModule());
    }


    public static Map<String, Object> parseJsonToMap(HttpServletRequest req) throws IOException {
        StringBuilder sb = new StringBuilder();
        try (BufferedReader reader = new BufferedReader(req.getReader())) {
            reader.lines().forEach(sb::append);

        }
        String jsonData = sb.toString();
        System.out.println("Received JSON: " + jsonData);
        return objectMapper.readValue(sb.toString(), Map.class);
    }

    public static JsonNode parseJsonToNode(HttpServletRequest req) throws IOException {
        StringBuilder sb = new StringBuilder();
        try (BufferedReader reader = new BufferedReader(req.getReader())) {
            reader.lines().forEach(sb::append);
        }
        return objectMapper.readTree(sb.toString());
    }

    public static String toJson(Object oj) throws JsonProcessingException {
        return objectMapper.writeValueAsString(oj);
    }

    public static <T> T parseJsonOebjct(HttpServletRequest req, Class<T> clazz) throws IOException {
        StringBuilder sb = new StringBuilder();
        try (BufferedReader reader = new BufferedReader(req.getReader())) {
            reader.lines().forEach(sb::append);
        }
        return objectMapper.readValue(sb.toString(), clazz);


    }

}
