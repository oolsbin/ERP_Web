package com.hanul.berp;

import java.io.FileInputStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;

import com.google.firebase.messaging.FirebaseMessaging;

import com.google.firebase.messaging.Message;
import com.google.firebase.messaging.Notification;

import firebase.FireBaseDAO;


/**
 * Handles requests for the application home page.
 */
@Controller
public class FireBaseController {
	@Autowired private FireBaseDAO dao;
   
   @RequestMapping(value = "/list.hr2", method = RequestMethod.GET)
   public void home() {
        try {
           
           
           
            FileInputStream refreshToken = 
                  new FileInputStream("D:\\serviceAccountKey.json");
            
            FirebaseOptions options = FirebaseOptions.builder()
                   .setCredentials(GoogleCredentials.fromStream(refreshToken))
                   .build();
            
            //Firebase 처음 호출시에만 initializing 처리
            if(FirebaseApp.getApps().isEmpty()) {
               FirebaseApp.initializeApp(options);
            }
            
            //메세지 작성
            Notification noti = Notification.builder().setTitle("누군가").setBody("접속했습니다").build();
            Message msg = Message.builder()
                  .putData("title", "aaa")
                  .putData("name", "aaa")
                  .putData("body", "aaa")
                  .putData("color", "#f45342")
                  .setNotification(noti)
                  .setToken("eS_HXpHmSxW29UfCnO3VAp:APA91bHZKC_WuXMlSih3Aw8ylU7uZaETUSkOa4sxgk392z5cFy0PyST4Z6jFpbQXmjdM44hBpCyhXU3-RH4_b46RRjUqM30aJhNnlL972hnO5bjrJnxXCCvlEMaSToWdGson2Cnk8vJ4")
                  .build();
            
            //메세지를 FirebaseMessaging에 보내기
            String response = FirebaseMessaging.getInstance().send(msg);
            //결과출력
            System.out.println("Successfully: " + response);
            
         } catch (Exception e) {
            e.printStackTrace();
         }
      
         }
   
	
   @ResponseBody @RequestMapping(value = "/fireApproval.fi", method = RequestMethod.POST)
	   public String fireApproval(int employee_id, String name) {
	        try {
	           
	        	
	           int cnt = dao.fireSelectCnt(employee_id);
	           
	            FileInputStream refreshToken = 
	                  new FileInputStream("D:\\serviceAccountKey.json");
	            
	            FirebaseOptions options = FirebaseOptions.builder()
	                   .setCredentials(GoogleCredentials.fromStream(refreshToken))
	                   .build();
	            
	            //Firebase 처음 호출시에만 initializing 처리
	            if(FirebaseApp.getApps().isEmpty()) {
	               FirebaseApp.initializeApp(options);
	            }
	            
	            //메세지 작성
	            Notification noti = Notification.builder().setTitle(name+"님 반갑습니다.").setBody("금일 대기 서류 "+ cnt+"개 있습니다." ).build();
	            Message msg = Message.builder()
	                  .putData("title", "aaa")
	                  .putData("name", "aaa")
	                  .putData("body", "aaa")
	                  .putData("color", "#f45342")
	                  .setNotification(noti)
	                  .setToken("eLrxrqn7RNafZoMzRWHlYu:APA91bF5I9nFOESPpVbQOBlHp2oDjGfNYvxbXhiCxe-qGBuau1S_nwZkimqT9GOzHxyJOtqFWGE2pbfhu8aU34NlHz11ea_ABPFt1wrXbnii2tCJqthEA8CrKRAU_qo8hlRLncuarAre")
	                  .build();
	            
	            //메세지를 FirebaseMessaging에 보내기
	            String response = FirebaseMessaging.getInstance().send(msg);
	            //결과출력
	            System.out.println("Successfully: " + response);
	            
	         } catch (Exception e) {
	            e.printStackTrace();
	         }
	        return "zz";
	         }
    
   
   
}

