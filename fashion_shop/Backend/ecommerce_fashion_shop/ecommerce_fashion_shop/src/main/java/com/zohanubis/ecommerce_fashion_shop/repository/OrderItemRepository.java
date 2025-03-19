package com.zohanubis.ecommerce_fashion_shop.repository;

import com.zohanubis.ecommerce_fashion_shop.model.OrderItem;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderItemRepository extends JpaRepository<OrderItem, Long> {
}
