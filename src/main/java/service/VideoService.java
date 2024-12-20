package service;


import model.User;
import model.Video;
import repository.FavoritesRepository;
import repository.VideoRepository;

import java.util.List;
import java.util.Map;

public class VideoService {

    private final VideoRepository videoRepository;
    private final FavoritesRepository favoritesRepository;

    public VideoService() {
        videoRepository = new VideoRepository();
        favoritesRepository = new FavoritesRepository();
    }

    public boolean save(Video video) {
        try {
            videoRepository.save(video);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }


    public boolean update(Video video) {
        try {
            videoRepository.update(video);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }


    public List<Video> getAllVideo() {
        return videoRepository.findAll();
    }

    public Video getVideoByID(String ID) {
        return videoRepository.findById(ID);
    }

    public int getTotalVideoCount(int pageSize) {
        return (int) Math.ceil((double) videoRepository.getTotalVideoCount() / pageSize);
    }

    public Map<Integer, List<Video>> getVideoToPages(int pageNumber, int maxSize) {
        return videoRepository.fillAllVideoByPage(pageNumber, maxSize);
    }

    public boolean exists(String id) {
        return videoRepository.exists(id);
    }

    public boolean delete(String id) {
        try {
            videoRepository.delete(id);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<String> getAllVideoByTitle() {
        return videoRepository.getAllVideoByTitle();
    }

    public List<Video> listVideoFavorites(User user) {
        return videoRepository.getVideoFavoritesByUser(user);
    }

    public boolean updateViewCountVideo(String videoID) {

        return videoRepository.updateViewCount(videoID);
    }
}
