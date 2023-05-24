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
    InfoDao ido;

    public boolean loginslist(Information login)
    {

        boolean lgchek = false;

        Information info = new Information();
        List<Information> list = new ArrayList<Information>();
        list = ido.loginslist(login);

        for (int i = 0; i < list.size(); i++) {
            
            if(login.getId().equals(list.get(i).getId()) && login.getPw().equals(list.get(i).getPw()))
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



    public int joininsert(Information join)
    {
        int intI = ido.joininsert(join);
        return 0;
    }
}
