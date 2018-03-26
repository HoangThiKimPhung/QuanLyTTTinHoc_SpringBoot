package com.example.demo.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.security.GeneralSecurityException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;

import com.example.demo.service.DangNhapService;
import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeTokenRequest;
import com.google.api.client.googleapis.auth.oauth2.GoogleClientSecrets;
import com.google.api.client.googleapis.auth.oauth2.GoogleTokenResponse;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.client.util.store.FileDataStoreFactory;
import com.google.api.services.drive.Drive;
import com.google.api.services.drive.DriveScopes;
import com.google.api.services.drive.model.About;

@Controller
public class DangNhapController {
	@Autowired
	private DangNhapService dangNhapService;
	
	public static String codeDrive = null;
	public static String redirectURL = "http://localhost:8080/nhanvien";
	//public static String redirectURL = "https://8080-dot-3647416-dot-devshell.appspot.com/nhanvien";
	public static Drive service = null;
	public static GoogleAuthorizationCodeFlow flow = null;
	public static GoogleClientSecrets clientSecrets = null;
	
	private static final String APPLICATION_NAME = "Drive API";
    private static final java.io.File DATA_STORE_DIR = new java.io.File(
        System.getProperty("user.home"), ".credentials/2/drive-java-quickstart");
    private static FileDataStoreFactory DATA_STORE_FACTORY;
    private static final JsonFactory JSON_FACTORY = JacksonFactory.getDefaultInstance();
    private static HttpTransport HTTP_TRANSPORT;
    private static final List<String> SCOPES = Arrays.asList(DriveScopes.DRIVE);
    
    static {
        try {
            HTTP_TRANSPORT = GoogleNetHttpTransport.newTrustedTransport();
            DATA_STORE_FACTORY = new FileDataStoreFactory(DATA_STORE_DIR);
        } catch (Throwable t) {
            t.printStackTrace();
            System.exit(1);
        }
    }
    @PostMapping("/dangnhap")
	public RedirectView localRedirect() throws IOException, GeneralSecurityException  {
	    
        InputStream in =
                DangNhapController.class.getResourceAsStream("/client_secret.json");
        clientSecrets =
            GoogleClientSecrets.load(JSON_FACTORY, new InputStreamReader(in));
        
        flow = new GoogleAuthorizationCodeFlow
                .Builder(HTTP_TRANSPORT, JSON_FACTORY, clientSecrets, SCOPES)
                .setDataStoreFactory(DATA_STORE_FACTORY)
                .setAccessType("offline")
                .build();
        
        
        String authorizeUrl = flow.newAuthorizationUrl()
                .setRedirectUri(redirectURL).build();
        
    	RedirectView redirectView = new RedirectView();
		redirectView.setUrl(authorizeUrl);
			
	    return redirectView;
        
	}
	
	@GetMapping("/nhanvien")
	public String LoginGoogle(@RequestParam(value="code",required = false) String code,HttpServletRequest request) throws Exception {
		codeDrive = code;
		if(request.getSession().getAttribute("maNV") != null)
			return "nhanvien";
		
		if(codeDrive != null) {
			GoogleAuthorizationCodeTokenRequest tokenRequest = flow.newTokenRequest(codeDrive);
		    tokenRequest.setRedirectUri(redirectURL);
		    GoogleTokenResponse tokenResponse = tokenRequest.execute();
		    
		    Credential credential = flow.createAndStoreCredential(tokenResponse, clientSecrets.getDetails().getClientId());
		    
		    service = new Drive.Builder(
	                HTTP_TRANSPORT, JSON_FACTORY, credential)
	                .setApplicationName(APPLICATION_NAME)
	                .build();
		    try {
		        About about = service.about().get().execute();
		        String maNV = dangNhapService.LayThongTinNV(about.getUser().getEmailAddress());
		        if(maNV == null) {
		        	return "login";
		        }
		        else {
		        	request.getSession().setAttribute("maNV", maNV);
		        	request.getSession().setAttribute("service", service);
		        	
		        	return "nhanvien";
		        }
		      } catch (IOException e) {
		        System.out.println("An error occurred: " + e);
		      }
		    			
		}
		return "redirect:/login";
	}
	
	
	
}
