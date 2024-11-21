package util;

import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;

public class XTime {


    public static String convertDateToDateNow(LocalDateTime date) {
        LocalDateTime now = LocalDateTime.now();
        long secondBetween = ChronoUnit.SECONDS.between(date, now);
        if (secondBetween < 60) {
            return "mới đây";
        }
        long minutesBetween = ChronoUnit.MINUTES.between(date, now);

        if (minutesBetween < 60) { // Dưới 1 giờ
            return minutesBetween + " phút trước";
        }

        long hoursBetween = ChronoUnit.HOURS.between(date, now);
        if (hoursBetween < 24) { // Dưới 1 ngày
            return hoursBetween + " giờ trước";
        }

        long daysBetween = ChronoUnit.DAYS.between(date, now);
        if (daysBetween < 7) { // Dưới 1 tuần
            return daysBetween + " ngày trước";
        }

        long weeksBetween = ChronoUnit.WEEKS.between(date, now);
        if (weeksBetween < 4) { // Dưới 1 tháng
            return weeksBetween + " tuần trước";
        }

        long monthsBetween = ChronoUnit.MONTHS.between(date, now);
        if (monthsBetween < 12) { // Dưới 1 năm
            return monthsBetween + " tháng trước";
        }

        long yearsBetween = ChronoUnit.YEARS.between(date, now);
        return yearsBetween + " năm trước";
    }
}
