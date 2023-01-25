package approval;

import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileUtility {
	
	public String fileUpload(String category, MultipartFile file
			, HttpServletRequest request) {
		
		String path 
			= "d://app" + request.getContextPath();
		System.out.println("request.getContextPath()=" + request.getContextPath());
		//					request.getContextPath()=/berp
		
		String upload = "/upload/" + category 
				+ new SimpleDateFormat("/yyyy/MM/dd").format(new Date());
		
		path += upload; 
		
		File folder = new File( path );
		if( ! folder.exists() ) folder.mkdirs();
		
		String filename 
		= UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
		
		try {
			file.transferTo( new File(path, filename) );
		} catch (Exception e) {	}
		System.out.println("request.getRequestURL()="+request.getRequestURL()); 
		//					request.getRequestURL()=http://localhost/berp/insertPost.ap
		System.out.println("request.getServletPath()="+request.getServletPath());
		//					request.getServletPath()=/insertPost.ap
		System.out.println(  "request.getRequestURL().toString().replace(request.getServletPath(), '')="
					+request.getRequestURL().toString().replace(request.getServletPath(), "")  );
		//					request.getRequestURL().toString().replace(request.getServletPath(), '')=
		//					http://localhost/berp	
		
		return request.getRequestURL().toString().replace(request.getServletPath(), "")
				+ upload + "/" + filename;
	}

	
	public boolean fileDownload(String filename, String filepath
			, HttpServletRequest request
			, HttpServletResponse response) throws Exception{
		
		filepath = filepath.replace(
				request.getRequestURL().toString().replace(request.getServletPath(), ""),
				"d://app/" + request.getContextPath() );
		
		System.out.println("request.getRequestURL().toString().replace(request.getServletPath(), \"\")="
				+request.getRequestURL().toString().replace(request.getServletPath(), ""));
		System.out.println("filepath="+filepath);
		
		File file = new File( filepath );
		if( ! file.exists() ) return false;
		
		String mime 
		= request.getSession().getServletContext().getMimeType(filepath);
		  response.setContentType(mime);
		  
		  System.out.println("request.getSession()="+request.getSession());
		  System.out.println("request.getSession().getServletContext()="+request.getSession().getServletContext());
		  System.out.println("request.getSession().getServletContext().getMimeType(filepath)="
				  +request.getSession().getServletContext().getMimeType(filepath));
		  System.out.println("String mine="+mime);
		  
		  filename = URLEncoder.encode( filename, "utf-8" );
		  filename = filename.replaceAll("\\+", "%20");//.replaceAll("?", "%36");
		  
		  response.setHeader("content-disposition"
					, "attachment; filename="+ filename);

		  ServletOutputStream out = response.getOutputStream();
		  FileCopyUtils.copy( new FileInputStream(file), out );
		  out.flush();
		  return true;
	}
	
	public void deleteFile(String filepath, HttpServletRequest request) {
		if( filepath != null ) {
			//DB: http://localhost/smart/upload/notice/2022/10/21/80984d3_kakao_login.zip
			//실제: D:\\app\\smart\\upload\\notice\\2022\\10\\21\\abc.txt
			filepath = filepath.replace( request.getRequestURL().toString().replace(request.getServletPath(), "")
										, "d://app/" + request.getContextPath() );
			System.out.println(filepath);
			File file = new File( filepath );
			if( file.exists() ) file.delete();
		}
	}
	
	
}
