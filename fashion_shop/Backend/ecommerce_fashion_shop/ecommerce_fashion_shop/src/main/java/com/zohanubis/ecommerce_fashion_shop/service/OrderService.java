package com.zohanubis.ecommerce_fashion_shop.service;

import com.zohanubis.ecommerce_fashion_shop.exception.OrderException;
import com.zohanubis.ecommerce_fashion_shop.model.Address;
import com.zohanubis.ecommerce_fashion_shop.model.Order;
import com.zohanubis.ecommerce_fashion_shop.model.User;

import java.util.List;

public interface OrderService {
    public Order createOrder(User user, Address shippingAddress);

    public Order findOrderById(Long orderId) throws OrderException;

    public List<Order> usersOrderHistory(Long userId);

    public Order placeOrder(Long orderId) throws OrderException;

    public Order updateOrder(Order orderId);

    public Order deliveredOrder(Long orderId) throws OrderException;

    public Order shippedOrder(Long orderId) throws OrderException;

    public Order cancledOrder(Long orderId) throws OrderException;

    public List<Order> getAllOrder();

    public void deleteOrder(Long orderId) throws OrderException;

    public Order confirmedOrder(Long orderId) throws OrderException;
}
