package util;

import model.Video;
import service.VideoService;

public class test {
    public static void main(String[] args) {

        System.out.println(new VideoService().getAllVideo());
    }
}
