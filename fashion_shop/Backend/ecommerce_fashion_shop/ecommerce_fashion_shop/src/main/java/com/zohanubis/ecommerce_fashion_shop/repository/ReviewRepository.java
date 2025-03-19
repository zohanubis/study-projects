package com.zohanubis.ecommerce_fashion_shop.repository;

import com.zohanubis.ecommerce_fashion_shop.model.Review;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ReviewRepository extends JpaRepository<Review, Long> {

    @Query("SELECT r FROM Review r WHERE r.product.id =:productId")

    public List<Review> getAllProductReviews(@Param("productId") Long productId);
}
