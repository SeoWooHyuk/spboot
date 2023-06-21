package com.spring.boot.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class EnvController {
	
	@Value("${java.file.test}") // 변수 파일에 등록된 java.file.test 값 가져오기
	String envValue;
	
	@GetMapping("/getEnvValue")
	public ResponseEntity<Object> getEnvValue() {
		return new ResponseEntity<Object>(envValue, HttpStatus.OK);
	}
}