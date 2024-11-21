package model;

import jakarta.persistence.*;
import lombok.*;


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

    @Temporal(TemporalType.DATE)
    private Date likeDate;
}
