package com.tj.mac.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Date;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.mac.dao.EventDao;
import com.tj.mac.model.Event;
@Service
public class EventServiceImpl implements EventService {
	@Autowired
	private EventDao eventDao;
	@Override
	public List<Event> eventListAll() {
		return eventDao.eventListAll();
	}

	@Override
	public List<Event> eventListPaging(Event event) {
		return eventDao.eventListPaging(event);
	}

	@Override
	public int writeEvent(MultipartHttpServletRequest mRequest, Event event) {
		String uploadPath = mRequest.getRealPath("eventImgFileUpload/");
		String backupPath = "D:/mega_IT/source/teamProject/MAC/src/main/webapp/eventImgFileUpload/";
		Iterator<String> params = mRequest.getFileNames();
		String eimg = "";
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param); // 파라미터에 연결된 파일 객체
			eimg = mFile.getOriginalFilename();
			if(eimg!=null && !eimg.equals("")) {
				// 파일첨부했음!			
				if(new File(uploadPath+eimg).exists()) {
					// 서버에 같은 파일이름이 있을 때 첨부한 파일이름을 변경!
					eimg = System.currentTimeMillis()+"_"+eimg;
				} // if
				try {
					mFile.transferTo(new File(uploadPath+eimg)); // 서버에 저장!
					System.out.println("서버파일 : "+uploadPath+eimg);
					System.out.println("백업파일 : "+backupPath+eimg);
					int result = 
						fileCopy(uploadPath+eimg, backupPath+eimg); // 파일카피!
					System.out.println(result == 1? "복사성공" : "복사 실패");
				} catch(IllegalStateException e) {
					System.out.println(e.getMessage());
				} catch(IOException e) {
					System.out.println(e.getMessage());
				}
			} else {
				// 파일첨부 안함!
				eimg = "";
			}// if
		event.setEventFile(eimg); // 첨부한 이미지파일
		return eventDao.writeEvent(event);
	}
	private int fileCopy(String serverFile, String backupFile) {
		int isCopy = 0;
		FileInputStream is = null;
		FileOutputStream os = null;
		try {
			is = new FileInputStream(serverFile);
			os = new FileOutputStream(backupFile);
			File sFile = new File(serverFile);
			byte[] buff = new byte[(int)sFile.length()];
			while(true) {
				int nRead = is.read(buff);
				if(nRead== -1) break;
				os.write(buff, 0, nRead);
			}
			isCopy = 1;
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if(os!=null) os.close();
				if(is!=null) is.close();
			} catch (Exception e) { }
		}
		return isCopy;
	}

	@Override
	public Event detailEvent(int eventNo) {
		return eventDao.detailEvent(eventNo);
	}

	@Override
	public int modifyEvent(MultipartHttpServletRequest mRequest) {
		String uploadPath = mRequest.getRealPath("eventImgFileUpload/");
		String backupPath = "D:/mega_IT/source/teamProject/MAC/src/main/webapp/eventImgFileUpload/";
		Iterator<String> params = mRequest.getFileNames();
		String eimg = "";
		while(params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param); // 파라미터에 연결된 파일 객체
			eimg = mFile.getOriginalFilename();
			if(eimg!=null && !eimg.equals("")) {
				// 파일첨부했음!
				if(new File(uploadPath+eimg).exists()) {
					// 서버에 같은 파일이름이 있을 때 첨부한 파일이름을 변경!
					eimg = System.currentTimeMillis()+"_"+eimg;
				} // if
				try {
					mFile.transferTo(new File(uploadPath+eimg)); // 서버에 저장!
					System.out.println("서버파일 : "+uploadPath+eimg);
					System.out.println("백업파일 : "+backupPath+eimg);
					int result = 
						fileCopy(uploadPath+eimg, backupPath+eimg); // 파일카피!
					System.out.println(result == 1? "복사성공" : "복사 실패");
				} catch(IllegalStateException e) {
					System.out.println(e.getMessage());
				} catch(IOException e) {
					System.out.println(e.getMessage());
				}
			} else {
				// 파일첨부 안함!
				eimg = "";
			}// if
		} // while
		Event event = new Event();
		event.setEventNo(Integer.parseInt(mRequest.getParameter("eventNo")));
		event.setEventTitle(mRequest.getParameter("eventTitle"));
		event.setEventFile(eimg);; // 첨부한 이미지파일	
		event.setEventDate(new Date(System.currentTimeMillis()));
		return eventDao.modifyEvent(event);
	}

	@Override
	public int ReadCountEvent(int eventNo) {
		return eventDao.ReadCountEvent(eventNo);
	}

	@Override
	public int deleteEvent(int eventNo) {
		return eventDao.deleteEvent(eventNo);
	}

	@Override
	public int countEvent() {
		return eventDao.countEvent();
	}
}
