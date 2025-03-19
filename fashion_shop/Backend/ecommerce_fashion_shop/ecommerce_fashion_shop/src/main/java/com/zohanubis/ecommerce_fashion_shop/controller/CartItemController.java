package com.zohanubis.ecommerce_fashion_shop.controller;

import com.zohanubis.ecommerce_fashion_shop.exception.CartItemException;
import com.zohanubis.ecommerce_fashion_shop.exception.UserException;
import com.zohanubis.ecommerce_fashion_shop.model.Cart;
import com.zohanubis.ecommerce_fashion_shop.model.CartItem;
import com.zohanubis.ecommerce_fashion_shop.model.User;
import com.zohanubis.ecommerce_fashion_shop.service.CartItemService;
import com.zohanubis.ecommerce_fashion_shop.service.UserService;
import io.swagger.v3.oas.annotations.Operation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/")
public class CartItemController {

    @Autowired
    private CartItemService cartItemService;
    ;
    @Autowired
    private UserService userService;


    @GetMapping("/cardId")
    @Operation(description = "Find cart item by cart Id")
    public ResponseEntity<CartItem> findUserCartItem(@RequestHeader ("Authorization")String jwt) throws UserException {
        User user = userService.findUserProfileByJwt(jwt);
        CartItem cartItem = new CartItem();

        return new ResponseEntity<>(cartItem, HttpStatus.OK);
    }
    @GetMapping("/cart-item/{id}")
    public ResponseEntity<CartItem> getCartItemById(@PathVariable Long id) throws CartItemException {
        CartItem cartItem = cartItemService.findCartItemById(id);
        return new ResponseEntity<>(cartItem, HttpStatus.OK);
    }
    @PostMapping("/cart-item")
    public ResponseEntity<CartItem> addCartItem(@RequestBody CartItem cartItem, @RequestHeader("Authorization") String jwt) throws UserException {
        User user = userService.findUserProfileByJwt(jwt);
        cartItem.setUserId(user.getId());
        CartItem createdItem = cartItemService.createCartItem(cartItem);
        return new ResponseEntity<>(createdItem, HttpStatus.CREATED);
    }
    @PutMapping("/cart-item/{id}")
    public ResponseEntity<CartItem> updateCartItem(@PathVariable Long id, @RequestBody CartItem cartItem, @RequestHeader("Authorization") String jwt) throws UserException, CartItemException, CartItemException {
        User user = userService.findUserProfileByJwt(jwt);
        cartItem.setUserId(user.getId());
        CartItem updatedItem = cartItemService.updateCartItem(id, cartItem);
        return new ResponseEntity<>(updatedItem, HttpStatus.OK);
    }
    @DeleteMapping("/cart-item/{id}")
    public ResponseEntity<Void> deleteCartItem(@PathVariable Long id, @RequestHeader("Authorization") String jwt) throws UserException, CartItemException {
        User user = userService.findUserProfileByJwt(jwt);
        cartItemService.RemoveCartItem(user.getId(), id);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }

}
