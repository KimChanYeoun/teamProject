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

import com.tj.mac.dao.QnaDao;
import com.tj.mac.model.Qna;

@Service
public class QnaServiceImpl implements QnaService {

	@Autowired
	private QnaDao qnaDao;

	@Override
	public int qna_Cnt() {
		return qnaDao.qna_Cnt();
	}

	@Override
	public List<Qna> qna_ListAll(Qna qna) {
		return qnaDao.qna_ListAll(qna);
	}

	@Override
	public List<Qna> qna_HitList() {
		return qnaDao.qna_HitList();
	}

	@Override
	public List<Qna> qna_Paging(Qna qna) {
		return qnaDao.qna_Paging(qna);
	}

	@Override
	public int qna_Write(MultipartHttpServletRequest mRequest, Qna qna) {

		String uploadPath = mRequest.getRealPath("qna_Fileup/");
		String backupPath = "D:/mega_IT/source/teamProject/MAC/src/main/webapp/qna_Fileup/";

		Iterator<String> params = mRequest.getFileNames();
		String qna_img = "";
		while (params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param);
			qna_img = mFile.getOriginalFilename();
			if (qna_img != null && !qna_img.equals("")) {
				// 파일첨부했다
				if (new File(uploadPath + qna_img).exists()) {
					// 동일한 파일 이름이 있을경우. 다른이름으로 설정하여 저장.
					qna_img = System.currentTimeMillis() + "_" + qna_img;
				}
				try {
					mFile.transferTo(new File(uploadPath + qna_img)); // 서버에 저장 로직 ( 트라이캐취 추가해야함)
					System.out.println("서버저장 파일은 :" + uploadPath + qna_img);
					System.out.println("백업 파일 파일은 :" + backupPath + qna_img);
					int result = fileCopy(uploadPath + qna_img, backupPath + qna_img); // 파일 카피

				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			} else {
				// 파일첨부안했다
				qna_img = "";

			} // if
		} // while
		qna.setQnaFile(qna_img);
		qna.setQnaIp(mRequest.getRemoteAddr());

		return qnaDao.qna_Write(qna);

	}

	private int fileCopy(String serverFile, String backupFile) {
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
				if (nRead == -1)
					break;
				os.write(buff, 0, nRead);
			}
			isCopy = 1;

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (os != null)
					os.close();
				if (is != null)
					is.close();
			} catch (Exception e) {
			}
		}
		return isCopy;
	}

	@Override
	public int qna_Modify(MultipartHttpServletRequest mRequest, Qna qna) {
		String uploadPath = mRequest.getRealPath("bookImgFileUpload/");
		String backupPath = "D:/mega_IT/source/teamProject/MAC/src/main/webapp/qna_Fileup/";

		Iterator<String> params = mRequest.getFileNames();
		String qna_img = "";
		String param = params.next();
		MultipartFile mFile = mRequest.getFile(param);
		qna_img = mFile.getOriginalFilename();
		if (qna_img != null && !qna_img.equals("")) {
			// 파일첨부했다
			if (new File(uploadPath + qna_img).exists()) {
				// 동일한 파일 이름이 있을경우. 다른이름으로 설정하여 저장.
				qna_img = System.currentTimeMillis() + "_" + qna_img;
			}
			try {
				mFile.transferTo(new File(uploadPath + qna_img)); // 서버에 저장 로직 ( 트라이캐취 추가해야함)
				System.out.println("서버저장 파일은 :" + uploadPath + qna_img);
				System.out.println("백업 파일 파일은 :" + backupPath + qna_img);
				int result = fileCopy(uploadPath + qna_img, backupPath + qna_img); // 파일 카피

			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			// 파일첨부안했다
			qna_img = "";

		} // if
//		qna = new Qna();
		qna.setQnaTitle(mRequest.getParameter("qnaTitle"));
		qna.setQnaContent(mRequest.getParameter("qnaContent"));
		qna.setQnaIp(mRequest.getRemoteAddr());
		qna.setQnaIp(mRequest.getRemoteAddr()); // IP설정
		String qnanoPw = mRequest.getParameter("qnanoPw");

		if (qnanoPw == qna.getQnanoPw()) {
			qnanoPw = qna.getQnanoPw();
		}
		qna.setQnaNopw(mRequest.getParameter("qnanoPw"));

		qna.setQnaFile(qna_img);
		return qnaDao.qna_Modify(qna);
	}

	@Override
	public Qna qna_Content(int qnaNo) {

			
		return qnaDao.qna_Content(qnaNo);
	}

	@Override
	public int qna_Delete(int qnaNo) {
		return qnaDao.qna_Delete(qnaNo);
	}

	@Override
	public int qna_ReWrite(MultipartHttpServletRequest mRequest, Qna qna) {
		
		String uploadPath = mRequest.getRealPath("qna_Fileup/");
		String backupPath = "D:/mega_IT/source/teamProject/MAC/src/main/webapp/qna_Fileup/";

		System.out.println(qna.getQnaTitle() + "   : qna");
		System.out.println(mRequest.getParameter("qnaTitle") + "  : mRequst");

		Iterator<String> params = mRequest.getFileNames();
		String qna_img = "";
		//while (params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param);
			qna_img = mFile.getOriginalFilename();
			if (qna_img != null && !qna_img.equals("")) {
				// 파일첨부했다
				if (new File(uploadPath + qna_img).exists()) {
					// 동일한 파일 이름이 있을경우. 다른이름으로 설정하여 저장.
					qna_img = System.currentTimeMillis() + "_" + qna_img;
				}
				try {
					mFile.transferTo(new File(uploadPath + qna_img)); // 서버에 저장 로직 ( 트라이캐취 추가해야함)
					System.out.println("서버저장 파일은 :" + uploadPath + qna_img);
					System.out.println("백업 파일 파일은 :" + backupPath + qna_img);
					int result = fileCopy(uploadPath + qna_img, backupPath + qna_img); // 파일 카피

				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			} else {
				// 파일첨부안했다
				qna_img = "";

			} // if
		//} // while

		//qna.setQnaTitle(mRequest.getParameter("qnaTitle"));
		//qna.setQnaContent(mRequest.getParameter("qnaContent"));
		qna.setQnaFile(qna_img);
		qna.setQnaIp(mRequest.getRemoteAddr());
		
		if (mRequest.getParameter("qnanoPw") == null) {
			qna.setQnanoPw("");
		} else {
			qna.setQnanoPw(mRequest.getParameter("qnanoPw"));
		}
		//qna.setMemberId(mRequest.getParameter("memberId"));
		//qna.setAdminId(mRequest.getParameter("admainId"));
		return qnaDao.qna_ReWrite(qna);
	}

	@Override
	public int qna_Re(Qna qna) {
		return qnaDao.qna_Re(qna);
	}

	@Override
	public List<Qna> qna_Serch(Qna qna) {
		return qnaDao.qna_Serch(qna);
	}

	@Override
	public int qna_serTot(Qna qna) {
		return qnaDao.qna_serTot(qna);
	}

	@Override
	public int hit_up(int qnaNo) {
		return qnaDao.hit_up(qnaNo);
	}

	@Override
	public Qna qna_ContentNext(int qnaNo) {
		return qnaDao.qna_ContentPrevious(qnaNo);
	}

	@Override
	public Qna qna_ContentPrevious(int qnaNo) {
		return qnaDao.qna_ContentNext(qnaNo);
	}

}
