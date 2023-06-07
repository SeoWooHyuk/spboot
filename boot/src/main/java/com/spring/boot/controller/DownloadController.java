package com.spring.boot.controller;


import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Value;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletResponse;



@Controller
public class DownloadController  {
    
@Value("${resource}")
private String upload; //업로드된 파일 저장 경로

@GetMapping("/download")
  public void download(HttpServletResponse response, @RequestParam String filename) throws IOException {

    String path = upload+filename;
    
    byte[] fileByte = FileUtils.readFileToByteArray(new File(path));

    response.setContentType("application/octet-stream");
    response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(filename, "UTF-8")+"\";");
    response.setHeader("Content-Transfer-Encoding", "binary");

    response.getOutputStream().write(fileByte);
    response.getOutputStream().flush();
    response.getOutputStream().close();
  }
    
}
