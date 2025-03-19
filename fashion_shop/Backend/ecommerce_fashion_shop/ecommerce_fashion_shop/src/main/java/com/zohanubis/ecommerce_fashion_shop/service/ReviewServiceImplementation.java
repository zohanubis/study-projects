package com.zohanubis.ecommerce_fashion_shop.service;

import com.zohanubis.ecommerce_fashion_shop.exception.ProductException;
import com.zohanubis.ecommerce_fashion_shop.model.Product;
import com.zohanubis.ecommerce_fashion_shop.model.Review;
import com.zohanubis.ecommerce_fashion_shop.model.User;
import com.zohanubis.ecommerce_fashion_shop.repository.ProductRepository;
import com.zohanubis.ecommerce_fashion_shop.repository.ReviewRepository;
import com.zohanubis.ecommerce_fashion_shop.request.ReviewRequest;

import java.time.LocalDateTime;
import java.util.List;

public class ReviewServiceImplementation implements ReviewService {

    private ReviewRepository reviewRepository;
    private ProductService productService;
    private ProductRepository productRepository;

    public ReviewServiceImplementation(ReviewRepository reviewRepository, ProductService productService, ProductRepository productRepository) {
        this.reviewRepository = reviewRepository;
        this.productService = productService;
        this.productRepository = productRepository;
    }

    @Override
    public Review CreateReview(ReviewRequest request, User user) throws ProductException {
        Product product = productService.findProductById(request.getProductId());
        Review review = new Review();

        review.setProduct(product);
        review.setUser(user);
        review.setReview(request.getReview());
        review.setCreateAt(LocalDateTime.now());

        return reviewRepository.save(review);
    }

    @Override
    public List<Review> getAllReviews(Long productId) {
        return reviewRepository.getAllProductReviews(productId);
    }
}
