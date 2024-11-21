package model;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.ColumnDefault;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.Set;


@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@Builder
@Entity

@Table(name = "Videos")
public class Video {
    @Id
    @Column(nullable = false, length = 50)
    private String id;

    @Column(nullable = false)
    private String url;

    @Column(nullable = false, columnDefinition = "NVARCHAR(225)")
    private String title;

    @Column(nullable = false, columnDefinition = "NVARCHAR(225)")
    private String poster;

    @Column(nullable = false)
    @ColumnDefault("0")
    private Integer viewCount;

    @Column(nullable = false, length = 3000, columnDefinition = "NVARCHAR(3000)")
    private String description;

    @Column(nullable = false)
    private boolean active;

    @Column(nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private LocalDateTime postedDate;

    @PrePersist
    protected void positiveNumber() {
        if (viewCount < 0) viewCount = 0;
        if (postedDate == null) postedDate = LocalDateTime.now();
    }

    @OneToMany(mappedBy = "video", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Set<Favorite> videoFavorites;

    @OneToMany(mappedBy = "video", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Set<Share> videoShares;


}
