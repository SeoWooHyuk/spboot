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

//"/status"는 그냥 상태확인용으로 호출이 성공만하면 200 ok를 리턴해주는 간단한 API 입니다. 
//일반적으로 클라우드에 로드밸런서를 구성할 시 상태확인용 API를 제공해야 해당 인스턴스가 정상인지 판단 가능합니다. 
//또한 별도로 확인하는 로직을 구성하고 싶을 때도 이런 API가 필요합니다. 