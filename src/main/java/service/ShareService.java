package service;

import repository.ShareRepository;

import java.util.List;

public class ShareService {
    private ShareRepository shareRepository;

    public ShareService() {
        shareRepository = new ShareRepository();
    }


    public List<Object[]> getShareByVideoTitle(String title) {
        return shareRepository.getShareByVideoTitle(title);
    }
}
