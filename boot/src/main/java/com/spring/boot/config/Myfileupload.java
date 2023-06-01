package com.spring.boot.config;

import java.io.File;
import java.util.UUID;
import org.springframework.util.FileCopyUtils;

public class Myfileupload {

	private String uploadPath; //업로드된 파일 저장 경로


    public String uploadFile(String originName, byte[] fileData)throws Exception{
	        
        //중복되지 않는 고유한 키 값을 가져옴
        UUID uid = UUID.randomUUID();
        
        //중복된 키 값을 이용해 파일명을 설정
        String savedName = uid.toString() + "_"+originName;
        
        //저장할 파일 객체 생성
        File target = new File(uploadPath,savedName);
        
        
        //파일을 복사(데이터, 경로)
        FileCopyUtils.copy(fileData, target);

    
        return savedName;
    }


}
