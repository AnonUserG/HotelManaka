package ru.adler.manaka.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

import javax.persistence.*;

@Entity
@Table(name = "hotel")
@Data
@NoArgsConstructor
public class Hotel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "nameHotel")
    private String nameHotel;

    @Column(name = "descriptionHotel")
    private String descriptionHotel;


    public Hotel(String grand_hotel, String s) {
    }
}
