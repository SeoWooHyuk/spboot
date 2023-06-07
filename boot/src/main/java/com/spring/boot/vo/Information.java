package com.spring.boot.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

@Data
@Schema(description = "회원정보 관련 VO")
public class Information {
    @Schema(description = "회원 아이디")
    private String id;
    @Schema(description = "회원 비번")
    private String pw;
    @Schema(description = "회원 권한")
    private String roles;
}
