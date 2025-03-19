package com.zohanubis.ecommerce_fashion_shop;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
//@ComponentScan(basePackages = {"com.zohanubis.ecommerce_fashion_shop.repository",
//        "com.zohanubis.ecommerce_fashion_shop.service"})
public class EcommerceFashionShopApplication {

    public static void main(String[] args) {
        SpringApplication.run(EcommerceFashionShopApplication.class, args);
    }

}
