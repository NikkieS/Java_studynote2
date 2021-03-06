<%@page import="java.io.File"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. multipart/form-data 여부 확인
	boolean isMultipart = ServletFileUpload.isMultipartContent(request);
	if (isMultipart){
		// 2. 메모리나 파일로 업로드 파일 보관하는 FileItem의 Factory 설정
		DiskFileItemFactory factory = new DiskFileItemFactory();
		// 3. 업로드 요청을 처리하는 ServletFileUpload 생성
		ServletFileUpload upload = new ServletFileUpload(factory);
		// 4. 업로드 요청 파싱해서 FileItem 목록 구함
		List<FileItem> items = upload.parseRequest(request);
		Iterator<FileItem> iter = items.iterator();
		while(iter.hasNext()){
			FileItem item = iter.next();
			// 5. FileItem이 폼 입력 항목인지 여부에 따라 알맞은 처리
			if(item.isFormField()){ // 텍스트 입력인 경우
				String name = item.getFieldName();
				String value = item.getString("utf-8");
				System.out.println(name + " = "+value);
			} else{ // 파일 업로드인 경우
				// 파라미터 이름
				String name = item.getFieldName();
				// 파일이름
				String filename = item.getName();
				// 파일의 타입
				String contentType = item.getContentType();
				// 임시 메모리에 저장 여부
				boolean isInMemory = item.isInMemory();
				// 파일의 사이즈
				long sizeInBytes = item.getSize();
				System.out.println("필드 이름: "+ name);
				System.out.println("파일 이름: "+ filename);
				System.out.println("파일 타입: "+ contentType);
				System.out.println("파일 사이즈: "+ sizeInBytes);
				
				// 서버 내부의 경로
				// String uri = "/file";
			
				// 시스템의 실제 경로
				// String realPath = request.getSession().getServletContext().getRealPath(uri);
				// System.out.println(realPath);
				
				// alternative solution
				String uri = request.getSession().getServletContext().getInitParameter("uploadPath");
				String realPath = request.getSession().getServletContext().getRealPath(uri);
				String newFileName= System.nanoTime()+"_"+filename;
				
				// 서버의 저장소에 실제 저장
				// File saveFile = new File(realPath, filename); // 파일 이름이 같기 때문에 중복업로드 시 덮어쓰게 된다 -> 파일 이름을 특별하게 지정하기
				File saveFile = new File(realPath, newFileName);
				item.write(saveFile);
				System.out.println("저장 완료");
			}
		}
		
		
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>