package ru.adler.manaka.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Table(name = "images")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Image {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Lob
    @Column(nullable = false)
    private byte[] bytes;

    @ManyToOne
    @JoinColumn(name = "room_id")
    private Room room;

}

