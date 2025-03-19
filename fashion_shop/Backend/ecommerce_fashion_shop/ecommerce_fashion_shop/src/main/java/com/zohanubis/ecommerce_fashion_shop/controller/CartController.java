package com.zohanubis.ecommerce_fashion_shop.controller;

import com.zohanubis.ecommerce_fashion_shop.exception.CartItemException;
import com.zohanubis.ecommerce_fashion_shop.exception.ProductException;
import com.zohanubis.ecommerce_fashion_shop.exception.UserException;
import com.zohanubis.ecommerce_fashion_shop.model.Cart;
import com.zohanubis.ecommerce_fashion_shop.model.CartItem;
import com.zohanubis.ecommerce_fashion_shop.model.User;
import com.zohanubis.ecommerce_fashion_shop.request.AddItemRequest;
import com.zohanubis.ecommerce_fashion_shop.service.CartService;
import com.zohanubis.ecommerce_fashion_shop.service.UserService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("api")
@Tag(name = "Cart Management", description = "Find user cart, add item to cart")
public class CartController {
    
    @Autowired
    private CartService cartService;
    
    @Autowired
    private UserService userService;

    @GetMapping("/")
    @Operation(description = "Find cart by user id")
    public ResponseEntity<Cart> findUserCart(@RequestHeader("Authorization") String jwt) throws UserException {
        User user = userService.findUserProfileByJwt(jwt);
        Cart cart = cartService.findUserCart(user.getId());

        return new ResponseEntity<>(cart, HttpStatus.OK);
    }
    @PostMapping("/add-to-cart")
    public ResponseEntity<String> addItemToCart(@RequestBody AddItemRequest request,
                                                @RequestHeader("Authorization") String jwt) throws ProductException, UserException, ProductException {
        User user = userService.findUserProfileByJwt(jwt);
        String responseMessage = cartService.addCartItem(user.getId(), request);
        return new ResponseEntity<>(responseMessage, HttpStatus.CREATED);
    }
    @PutMapping("/update-cart")
    public ResponseEntity<Cart> updateCartItem(@RequestBody CartItem cartItem,
                                               @RequestHeader("Authorization") String jwt) throws CartItemException, UserException {
        User user = userService.findUserProfileByJwt(jwt);
        Cart updatedCart = cartService.updateCartItem(user.getId(), cartItem);
        return new ResponseEntity<>(updatedCart, HttpStatus.OK);
    }
    @DeleteMapping("/remove-from-cart/{cartItemId}")
    public ResponseEntity<Void> removeItemFromCart(@PathVariable Long cartItemId,
                                                   @RequestHeader("Authorization") String jwt) throws CartItemException, UserException {
        User user = userService.findUserProfileByJwt(jwt);
        cartService.removeCartItem(user.getId(), cartItemId);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }

}
