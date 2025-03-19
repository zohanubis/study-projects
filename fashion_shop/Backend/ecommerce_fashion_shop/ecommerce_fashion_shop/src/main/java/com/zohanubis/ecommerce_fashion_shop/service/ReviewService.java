package com.zohanubis.ecommerce_fashion_shop.service;

import com.zohanubis.ecommerce_fashion_shop.exception.ProductException;
import com.zohanubis.ecommerce_fashion_shop.model.Review;
import com.zohanubis.ecommerce_fashion_shop.model.User;
import com.zohanubis.ecommerce_fashion_shop.request.ReviewRequest;

import java.util.List;

public interface ReviewService {
    public Review CreateReview(ReviewRequest request, User user) throws ProductException;
    public List<Review> getAllReviews(Long productId);

}
