package com.booknow.travelapp.common.payment.payapi;


import java.util.UUID;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;



@Component
public class PayRestApi {
    public static final String IMP_ID_CODE = "imp45240462";
    public static final String REST_API_KEY = "0174648007014261";
    public static final String REST_API_SECRET = "IA7VKyi3OHlLVTfvNAcO50jFZNxKrEcOYAGoFBFmFGMuyg5FRTuMRMaAZK2huy1vFk2lIlLi78so5nYr";
    //public static String TOKEN_TIME = "";

    // resttemplate
    private RestTemplate restTemplate;

    // 
    private ObjectMapper objectMapper;

    public PayRestApi() {
        this.restTemplate = new RestTemplate();
        this.objectMapper = new ObjectMapper();
    }

    // portone 인증 토큰 발급 받기
    public String getPortOneToken() {

        String url = "https://api.iamport.kr/users/getToken";

        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", MediaType.APPLICATION_JSON_VALUE + "; charset=UTF-8");

        MultiValueMap<String,String> params = new LinkedMultiValueMap<>();

        params.add("imp_key", REST_API_KEY);
        params.add("imp_secret", REST_API_SECRET);

        String response = restTemplate.postForObject(
            url,
            params,
            String.class
        );

        String token = null;

        try {
            JsonNode root = objectMapper.readTree(response);
            token = root.get("response").get("access_token").asText();
        } catch (JsonMappingException e) {
            System.out.println("[sys] JsonMappingException :"+e.getMessage());
        } catch (JsonProcessingException e) {
            System.out.println("[sys] JsonProcessingException :"+e.getMessage());
        }
        return token;
    } // getPortOneToken end

    
    // 금액 사전 등록
    public JsonNode registerPreAmount(String amount, String access_token) {
        String url = "https://api.iamport.kr/payments/prepare";

        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + "; charset=UTF-8"); // 공식문서랑 다름
        headers.add("Authorization", "Bearer "+access_token);
        
        String merchant_uid = UUID.randomUUID().toString();

        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();

        params.add("merchant_uid", merchant_uid);
        params.add("amount", amount);

        HttpEntity<MultiValueMap<String, String>> entity = 
        new HttpEntity<MultiValueMap<String,String>>(params, headers);

        String response = restTemplate.postForObject(
            url,
            entity,
            String.class
        );

        JsonNode root = null;

        try {
            root = objectMapper.readTree(response);
        } catch (JsonMappingException e) {
            System.out.println("[sys] JsonMappingException :"+e.getMessage());
        } catch (JsonProcessingException e) {
            System.out.println("[sys] JsonProcessingException :"+e.getMessage());
        }
        
        return root;
    } // registerPreAmount

    // 결제 단건 조회
    public JsonNode getPaymentOne(String merchant_uid,String access_token) {
        String url = "https://api.iamport.kr/payments/findAll/"+merchant_uid+"/?limit=20&sorting=paid&_token="+access_token;

        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + "; charset=UTF-8"); // 공식문서랑 다름

        String response = restTemplate.getForObject(
            url,
            String.class
        );

        JsonNode root = null;

        try {
            root = objectMapper.readTree(response);
        } catch (JsonMappingException e) {
            System.out.println("[sys] JsonMappingException :"+e.getMessage());
        } catch (JsonProcessingException e) {
            System.out.println("[sys] JsonProcessingException :"+e.getMessage());
        }
        
        return root;
    }// getPaymentOne
    
    // 결제 취소
    public JsonNode cancelPaymentOne(String merchant_uid, String access_token) {
        String url = "https://api.iamport.kr/payments/cancel?_token="+access_token;

        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + "; charset=UTF-8"); // 공식문서랑 다름

        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
        params.add("merchant_uid", merchant_uid);

        HttpEntity<MultiValueMap<String, String>> entity = 
        new HttpEntity<MultiValueMap<String,String>>(params, headers);


        String response = restTemplate.postForObject(
            url,
            entity,
            String.class
        );

        JsonNode root = null;

        try {
            root = objectMapper.readTree(response);
        } catch (JsonMappingException e) {
            System.out.println("[sys] JsonMappingException :"+e.getMessage());
        } catch (JsonProcessingException e) {
            System.out.println("[sys] JsonProcessingException :"+e.getMessage());
        }
        
        return root;
    }// getPaymentOne
    
}// PayRestApi end
