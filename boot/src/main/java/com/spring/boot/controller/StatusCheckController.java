package com.spring.boot.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.v3.oas.annotations.tags.Tag;

@RestController
@RequestMapping("/status")
@Tag(name = "StatusCheckController", description = "serverStatusCheck API Document")
public class StatusCheckController {

    @GetMapping
    public ResponseEntity<String> serverStatusCheck() {
        return ResponseEntity.ok("ok");
    }
}