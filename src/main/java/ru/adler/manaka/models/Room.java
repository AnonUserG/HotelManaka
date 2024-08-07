package ru.adler.manaka.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "rooms")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Room {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(nullable = false, name = "name")
    private String name;

    @Column(nullable = false, name = "description")
    private String description;

    @Column(nullable = false, name = "price")
    private Double price;

    @OneToMany(mappedBy = "room", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Image> images;

    public String getImageUrl(Image image) {
        return "/image/" + image.getId();
    }

}
