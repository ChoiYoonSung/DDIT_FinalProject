package com.spring.api;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.io.UnsupportedEncodingException;
 
public class JSONParse {
    
    public static String jsonCall(String searchall) throws IOException{
    	
		String target = "se";
		String key = "519846bda4500d41d1d8b1cac79424b7";
        StringBuilder urlBuilder = new StringBuilder("https://api.dbpia.co.kr/v2/search/search.json"); /*URL*/
        urlBuilder.append("?" + "key" + "=" + key); /*Service Key*/
        urlBuilder.append("&" + "target" + "=" + target ); /*한 페이지 결과 수*/
        urlBuilder.append("&" + "searchall" + "=" + searchall); /*페이지 번호*/
        URL url = new URL(urlBuilder.toString());
        System.out.println(url);
        
        HttpURLConnection conn = (HttpURLConnection) url.openConnection(); 
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        System.out.println("결과 = " +  sb.toString());
        byte[] bytes = sb.toString().getBytes("UTF-8");
        String stringResult = new String(bytes);
        return stringResult;
    }
    
    public static String jsonCall(String searchall, int pagenumber) throws IOException{
    	
    	String target = "se";
    	String key = "519846bda4500d41d1d8b1cac79424b7";
    	StringBuilder urlBuilder = new StringBuilder("https://api.dbpia.co.kr/v2/search/search.json"); /*URL*/
    	urlBuilder.append("?" + "key" + "=" + key); /*Service Key*/
    	urlBuilder.append("&" + "searchall" + "=" + searchall); /*검색어*/
    	urlBuilder.append("&" + "target" + "=" + target ); /*요청구분*/
    	urlBuilder.append("&" + "pagenumber" + "=" + pagenumber); /*페이지 번호*/
    	URL url = new URL(urlBuilder.toString());
    	System.out.println(url);
    	
    	HttpURLConnection conn = (HttpURLConnection) url.openConnection(); 
    	conn.setRequestMethod("GET");
    	conn.setRequestProperty("Content-type", "application/json");
    	System.out.println("Response code: " + conn.getResponseCode());
    	BufferedReader rd;
    	if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
    		rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
    	} else {
    		rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
    	}
    	StringBuilder sb = new StringBuilder();
    	String line;
    	while ((line = rd.readLine()) != null) {
    		sb.append(line);
    	}
    	rd.close();
    	conn.disconnect();
    	System.out.println("결과 = " +  sb.toString());
    	byte[] bytes = sb.toString().getBytes("UTF-8");
    	String stringResult = new String(bytes);
    	return stringResult;
    }
    
    public static String jsonCall(String searchall, String sorttype) throws IOException{
    	
    	String target = "se";
    	String key = "519846bda4500d41d1d8b1cac79424b7";
    	StringBuilder urlBuilder = new StringBuilder("https://api.dbpia.co.kr/v2/search/search.json"); /*URL*/
    	urlBuilder.append("?" + "key" + "=" + key); /*Service Key*/
    	urlBuilder.append("&" + "searchall" + "=" + searchall); /*검색어*/
    	urlBuilder.append("&" + "target" + "=" + target ); /*요청구분*/
    	urlBuilder.append("&" + "sorttype" + "=" + sorttype); /*정렬 방식*/
    	URL url = new URL(urlBuilder.toString());
    	System.out.println(url);
    	
    	HttpURLConnection conn = (HttpURLConnection) url.openConnection(); 
    	conn.setRequestMethod("GET");
    	conn.setRequestProperty("Content-type", "application/json");
    	System.out.println("Response code: " + conn.getResponseCode());
    	BufferedReader rd;
    	if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
    		rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
    	} else {
    		rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
    	}
    	StringBuilder sb = new StringBuilder();
    	String line;
    	while ((line = rd.readLine()) != null) {
    		sb.append(line);
    	}
    	rd.close();
    	conn.disconnect();
    	System.out.println("결과 = " +  sb.toString());
    	byte[] bytes = sb.toString().getBytes("UTF-8");
    	String stringResult = new String(bytes);
    	return stringResult;
    }
}


