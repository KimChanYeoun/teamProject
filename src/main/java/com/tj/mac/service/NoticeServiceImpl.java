package com.tj.mac.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.mac.dao.NoticeDao;
import com.tj.mac.model.Notice;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeDao noticeDao;

	@Override
	public List<Notice> noticeList(Notice notice) {
		return noticeDao.noticeList(notice);
	}

	@Override
	public Notice noticeDetail(int noticeNo) {
		return noticeDao.noticeDetail(noticeNo);
	}

	@Override
	public int writerNotice(MultipartHttpServletRequest mRequest, Notice notice) {
		String uploadPath = mRequest.getRealPath("noticeImg/");
		String backupPath = "D:/mega_IT/source/teamProject/MAC/src/main/webapp/noticeImg/";
		Iterator<String> params = mRequest.getFileNames();
		String NoticeImg = "";
		String param = params.next();
		MultipartFile mFile = mRequest.getFile(param);
		NoticeImg = mFile.getOriginalFilename();
		if (NoticeImg != null && !NoticeImg.equals("")) {
			if (new File(uploadPath + NoticeImg).exists()) {
				NoticeImg = System.currentTimeMillis() + "_" + NoticeImg;
			}
			try {
				mFile.transferTo(new File(uploadPath + NoticeImg));
				System.out.println("서버파일 :" + uploadPath + NoticeImg);
				System.out.println("백업파일 :" + backupPath + NoticeImg);
				int result = filecopy(uploadPath + NoticeImg, backupPath + NoticeImg);
				System.out.println(result == 1 ? "복사성공" : "복사실패");
			} catch (Exception e) {
				// TODO: handle exception
			}
		} else {
			NoticeImg = "";
		}
		notice.setNoticeFile(NoticeImg);
		return noticeDao.writerNotice(notice);
	}

	private int filecopy(String serverFile, String backupFile) {
		int isCopy = 0;
		FileInputStream is = null;
		FileOutputStream os = null;
		try {
			is = new FileInputStream(serverFile);
			os = new FileOutputStream(backupFile);
			File sFile = new File(serverFile);
			byte[] buff = new byte[(int) sFile.length()];
			while (true) {
				int nRead = is.read(buff);
				if (nRead == -1) {
					break;
				}
				os.write(buff, 0, nRead);
			}
			isCopy = 1;
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			try {
				if (os != null) {
					os.close();
				}
				if (is != null) {
					is.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return isCopy;
	}

	@Override
	public int modifyNotice(MultipartHttpServletRequest mRequest) {
		String uploadPath = mRequest.getRealPath("noticeImg/");
		String backupPath = "D:/mega_IT/source/teamProject/MAC/src/main/webapp/noticeImg/";
		Iterator<String> params = mRequest.getFileNames();
		String noticeImg = "";
		String param = params.next();
		MultipartFile mFile = mRequest.getFile(param);
		noticeImg = mFile.getOriginalFilename();
		if (noticeImg != null && !noticeImg.equals("")) {
			if (new File(uploadPath + noticeImg).exists()) {
				noticeImg = System.currentTimeMillis() + "_" + noticeImg;
			}
			try {
				mFile.transferTo(new File(uploadPath + noticeImg));
				System.out.println("서버파일 :" + uploadPath + noticeImg);
				System.out.println("백업파일 :" + backupPath + noticeImg);
				int result = filecopy(uploadPath + noticeImg, backupPath + noticeImg);
				System.out.println(result == 1 ? "복사성공" : "복사실패");
			} catch (Exception e) {
				// TODO: handle exception
			}
		} else {
			noticeImg = "";
		}
		Notice notice = new Notice();
		notice.setNoticeNo(Integer.parseInt(mRequest.getParameter("noticeNo")));
		notice.setNoticeTitle(mRequest.getParameter("noticeTitle"));
		notice.setNoticeContent(mRequest.getParameter("noticeContent"));
		notice.setNoticeFile(noticeImg);
		return noticeDao.modifyNotice(notice);
	}

	@Override
	public int readCountNotice(int noticeNo) {
		return noticeDao.readCountNotice(noticeNo);
	}

	@Override
	public int deleteNotice(int noticeNo) {
		return noticeDao.deleteNotice(noticeNo);
	}

	@Override
	public int noticeCount() {
		return noticeDao.noticeCount();
	}

	@Override
	public Notice noticeNext(int noticeNo) {
		return noticeDao.noticeNext(noticeNo);
	}

	@Override
	public Notice noticeBefore(int noticeNo) {
		return noticeDao.noticeBefore(noticeNo);
	}

}
