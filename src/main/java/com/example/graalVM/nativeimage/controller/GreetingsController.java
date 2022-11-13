package com.example.graalVM.nativeimage.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class GreetingsController {

    @GetMapping(path = "/greetings")
    public String getMessage() {
        return "You have landed.....at right place!!!";
    }
}