package com.zohanubis.ecommerce_fashion_shop.service;

import com.zohanubis.ecommerce_fashion_shop.exception.ProductException;
import com.zohanubis.ecommerce_fashion_shop.model.Product;
import com.zohanubis.ecommerce_fashion_shop.request.CreateProductRequest;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import java.util.List;


public interface ProductService {
    public Product createProduct(CreateProductRequest request) ;

    public String deleteProduct(Long productId) throws ProductException;

    public Product updateProduct(Long productId, Product request) throws ProductException;

    public Product findProductById(Long productId) throws ProductException ;

    public List<Product> findProductByCategory(String category);

    public Page<Product> getAllProducts(String category, List<String>colors, List<String>sizes,Integer minPrice, Integer maxPrice, Integer minDiscount, String sort, String stock, Integer pageNumber, Integer pageSize);

    void deleteProductById(Long productId);
}
