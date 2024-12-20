package model;

import jakarta.persistence.*;
import lombok.*;


import java.time.LocalDateTime;
import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@Builder
@Entity
@Table(name = "Favorites",
        uniqueConstraints = {@UniqueConstraint(columnNames = {"userID", "videoID"})}
)
public class Favorite {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "userId", nullable = false)
    private User user;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "videoId", nullable = false)
    private Video video;

    @Temporal(TemporalType.TIMESTAMP)
    private LocalDateTime likeDate;
    @PrePersist
    protected void positiveNumber() {

        if (likeDate == null) likeDate = LocalDateTime.now();
    }
}
