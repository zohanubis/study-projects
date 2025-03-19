package com.zohanubis.ecommerce_fashion_shop.service;

import com.zohanubis.ecommerce_fashion_shop.exception.CartItemException;
import com.zohanubis.ecommerce_fashion_shop.exception.UserException;
import com.zohanubis.ecommerce_fashion_shop.model.Cart;
import com.zohanubis.ecommerce_fashion_shop.model.CartItem;
import com.zohanubis.ecommerce_fashion_shop.model.Product;
import com.zohanubis.ecommerce_fashion_shop.model.User;
import com.zohanubis.ecommerce_fashion_shop.repository.CartItemRepository;
import com.zohanubis.ecommerce_fashion_shop.repository.CartRepository;
import com.zohanubis.ecommerce_fashion_shop.repository.CategoryRepository;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class CartItemServiceImplementation implements CartItemService {
    private CartItemRepository cartItemRepository;
    private UserService userService;
    private CartRepository cartRepository;
    private final CategoryRepository categoryRepository;

    public CartItemServiceImplementation(CartItemRepository cartItemRepository, UserService userService, CartRepository cartRepository,
                                         CategoryRepository categoryRepository) {
        this.cartItemRepository = cartItemRepository;
        this.userService = userService;
        this.cartRepository = cartRepository;
        this.categoryRepository = categoryRepository;
    }

    @Override
    public CartItem createCartItem(CartItem cartItem) {
        cartItem.setQuantity(1);
        cartItem.setPrice(cartItem.getProduct().getPrice() * cartItem.getQuantity());
        cartItem.setDiscountedPrice(cartItem.getProduct().getDiscountedPrice() * cartItem.getQuantity());

        CartItem createCartItem = cartItemRepository.save(cartItem);
        return createCartItem;
    }

    @Override
    public CartItem updateCartItem(Long userId, CartItem cartItem) throws CartItemException, UserException {
        CartItem item = findCartItemById(userId);
        User user = userService.findUserById(item.getUserId());

        if (user.getId().equals(userId)) {
            item.setQuantity(cartItem.getQuantity());
            item.setPrice(item.getQuantity() * item.getProduct().getPrice());
            item.setDiscountedPrice(item.getProduct().getDiscountedPrice() * item.getQuantity());

        }
        return cartItemRepository.save(item);
    }

    @Override
    public CartItem isCartItemExist(Cart cart, Product product, String size, Long userId) {
        CartItem cartItem = cartItemRepository.isCartItemExist(cart, product, size, userId);
        return cartItem;
    }

    @Override
    public void RemoveCartItem(Long userId, Long cartItemId) throws CartItemException, UserException {
        CartItem cartItem = findCartItemById(cartItemId);
        User user = userService.findUserById(cartItem.getUserId());

        User requsetUser = userService.findUserById(userId);

        if(user.getId().equals(requsetUser.getId())){
            cartItemRepository.deleteById(cartItemId);
        }else {
            throw new UserException("You can't remove");
        }
    }

    @Override
    public CartItem findCartItemById(Long cartItemId) throws CartItemException {
        Optional<CartItem> opt = cartItemRepository.findById(cartItemId);
        if (opt.isPresent()){
            return opt.get();
        }
        throw new CartItemException("Cart Item not found with id :" + cartItemId);
    }
}
