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

    public void delete(String id) {
        videoRepository.delete(id);
    }

    public List<Video> listVideoFavorites(User user) {
        return videoRepository.getVideoFavoritesByUser(user);
    }

    public boolean updateViewCountVideo(String videoID) {

        return videoRepository.updateViewCount(videoID);
    }
}
