package com.zohanubis.ecommerce_fashion_shop.service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import com.zohanubis.ecommerce_fashion_shop.model.*;
import com.zohanubis.ecommerce_fashion_shop.repository.*;
import org.springframework.stereotype.Service;

import com.zohanubis.ecommerce_fashion_shop.exception.OrderException;

@Service
public class OrderServiceImplementation implements OrderService {
    private OrderRepository orderRepostitory;
    private CartRepository cartRepository;
    private CartService cartService;
    private ProductService productService;
    private AddressRepository addressRepository;
    private OrderItemService orderItemService;
    private OrderItemRepository orderItemRepository;
    private final UserRepository userRepository;

    public OrderServiceImplementation(UserRepository userRepository, OrderItemRepository orderItemRepository, OrderItemService orderItemService, AddressRepository addressRepository, ProductService productService, CartService cartService, CartRepository cartRepository, OrderRepository orderRepostitory) {
        this.userRepository = userRepository;
        this.orderItemRepository = orderItemRepository;
        this.orderItemService = orderItemService;
        this.addressRepository = addressRepository;
        this.productService = productService;
        this.cartService = cartService;
        this.cartRepository = cartRepository;
        this.orderRepostitory = orderRepostitory;
    }

    @Override
    public Order createOrder(User user, Address shippingAddress) {
        shippingAddress.setUser(user);
        Address address = addressRepository.save(shippingAddress);
        user.getAddress().add(address);
        userRepository.save(user);

        Cart cart = cartService.findUserCart(user.getId());
        List<OrderItem> orderItems = new ArrayList<>();

        for (CartItem item : cart.getCartItems()) {
            OrderItem orderItem = new OrderItem();

            orderItem.setPrice(item.getPrice());
            orderItem.setProduct(item.getProduct());
            orderItem.setQuantity(item.getQuantity());
            orderItem.setSize(item.getSize());
            orderItem.setUserId(item.getUserId());
            orderItem.setDiscountedPrice(item.getDiscountedPrice());

            OrderItem createOrderItem = orderItemRepository.save(orderItem);
            orderItems.add(orderItem);
        }

        Order createOrder = new Order();
        createOrder.setUser(user);
        createOrder.setOrderItemList(orderItems);
        createOrder.setTotalPrice(cart.getTotalPrice());
        createOrder.setTotalDiscountedPrice(cart.getTotalDiscountedPrice());
        createOrder.setDiscount(cart.getDiscount());
        createOrder.setTotalItem(cart.getTotalItem());

        createOrder.setShippingAddress(address);
        createOrder.setOrderDate(LocalDateTime.now());
        createOrder.setOrderStatus("PENDING");
        createOrder.getPaymentDetails().setStatus("PENDING");
        createOrder.setCreatedAt(LocalDateTime.now());

        Order savedOrder = orderRepostitory.save(createOrder);

        for (OrderItem item : orderItems) {
            item.setOrder(savedOrder);
            orderItemRepository.save(item);
        }
        return savedOrder;
    }

    @Override
    public Order findOrderById(Long orderId) throws OrderException {
        Optional<Order> opt = orderRepostitory.findById(orderId);

        if(opt.isPresent()){return  opt.get();}
        throw new OrderException("Order not exist with id " + orderId);
    }

    @Override
    public List<Order> usersOrderHistory(Long userId) {
        List<Order> orders = orderRepostitory.getUsersOrders(userId);
        return orders;
    }

    @Override
    public Order placeOrder(Long orderId) throws OrderException {
        Order order = findOrderById(orderId);
        order.setOrderStatus("PLACED");
        order.getPaymentDetails().setStatus("COMPLETED");
        return order;
    }

    @Override
    public Order updateOrder(Order orderId) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public Order deliveredOrder(Long orderId) throws OrderException {
        Order order = findOrderById(orderId);
        order.setOrderStatus("DELIVERED");
        return orderRepostitory.save(order);
    }

    @Override
    public Order shippedOrder(Long orderId) throws OrderException {
        Order order = findOrderById(orderId);
        order.setOrderStatus("SHIPPED");
        return orderRepostitory.save(order);
    }

    @Override
    public Order cancledOrder(Long orderId) throws OrderException {
        Order order = findOrderById(orderId);
        order.setOrderStatus("CANCELLED");
        return orderRepostitory.save(order);
    }

    @Override
    public List<Order> getAllOrder() {

        return orderRepostitory.findAll();
    }

    @Override
    public void deleteOrder(Long orderId) throws OrderException {
        Order order = findOrderById(orderId);
        orderRepostitory.deleteById(orderId);

    }

    @Override
    public Order confirmedOrder(Long orderId) throws OrderException {
        Order order = findOrderById(orderId);
        order.setOrderStatus("CONFIRMED");
        return orderRepostitory.save(order);
    }

}
