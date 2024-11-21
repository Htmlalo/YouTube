package model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@Entity
@Table(name = "Shares"
        , uniqueConstraints = {@UniqueConstraint(columnNames = {"userID","videoID"})}
)
public class Share {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "userId", nullable = false)
    private User user;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "videoId", nullable = false)
    private Video video;

    @Column(length = 255)
    private String emails;

    @Temporal(TemporalType.DATE)
    private Date shareDate;

}
