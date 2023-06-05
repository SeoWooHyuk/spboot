package com.spring.boot.config;

import java.io.File;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class Myfileupload {

    @Value("${resource}")
	private String upload; //업로드된 파일 저장 경로

    public String uploadFile(MultipartFile file)throws Exception{
	        

        File uploadFile = new File(upload);
        if(!uploadFile.exists()) {
            // 리소스 폴더 생성
            uploadFile.mkdirs();
        }

        //중복되지 않는 고유한 키 값을 가져옴
        UUID uid = UUID.randomUUID();
        
        //중복된 키 값을 이용해 파일명을 설정
        String savedName = uid.toString() + "_"+file.getOriginalFilename();
        
        //저장할 파일 객체 생성
        File target = new File(upload,savedName);
        target.createNewFile();
        
        //파일을 복사(데이터, 경로)
        FileCopyUtils.copy(file.getBytes(), target);
        log.info(""+ File.separator +"이미지경로");
    
        return savedName;
    }


}
