package com.spring.boot.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.HttpClientErrorException.BadRequest;

import com.spring.boot.dao.InfoDao;
import com.spring.boot.vo.Information;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class InfoService {
    @Autowired
    InfoDao lg;

    public boolean loginslist(Information login2)
    {

        boolean lgchek = false;

        Information login = new Information();
        List<Information> list = new ArrayList<Information>();
        list = lg.loginslist(login2);

        for (int i = 0; i < list.size(); i++) {
            
            if(login2.getId().equals(list.get(i).getId()) && login2.getPw().equals(list.get(i).getPw()))
            {
                lgchek =true;
                break;
            }else
            {
                lgchek =false;
            }

        }

    





        return lgchek;
    }
}
