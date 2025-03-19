package com.zohanubis.ecommerce_fashion_shop.model;

import jakarta.persistence.Column;
import jakarta.persistence.*;

import java.time.LocalDate;

//@Entity
@Embeddable
public class PaymentInformation {
//    @Id
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
//    private Long id;
//
//    @Column(name = "cardholder_name")
//    private String cardholderName;
//
//    @Column(name = "card_number")
//    private String cardNumber;
//
//    @Column(name = "expiration_date")
//    private LocalDate expirationDate;
//
//    @Column(name = "cvv")
//    private String cvv;
//
//    @ManyToOne
//    @JoinColumn(name = "user_id")
//    private User user;
//
//

    @Column(name = "cardholder_name")
    private String cardholderName;
    @Column(name = "card_number")
    private String cardNumber;
    @Column(name = "expiration_date")
    private LocalDate expirationDate;
    @Column(name = "cvv")
    private String cvv;

    public String getCardholderName() {
        return cardholderName;
    }

    public void setCardholderName(String cardholderName) {
        this.cardholderName = cardholderName;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    public LocalDate getExpirationDate() {
        return expirationDate;
    }

    public void setExpirationDate(LocalDate expirationDate) {
        this.expirationDate = expirationDate;
    }

    public String getCvv() {
        return cvv;
    }

    public void setCvv(String cvv) {
        this.cvv = cvv;
    }
}
