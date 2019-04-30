package com.tj.mac.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.mac.dao.ItemDao;
import com.tj.mac.model.Item;
import com.tj.mac.model.Purchase;
@Service
public class ItemServiceImpl implements ItemService {
	@Autowired
	private ItemDao itemDao;
	@Override
	public List<Item> listItem() {
		return itemDao.listItem();
	}
	@Override
	public List<Item> listItemPaging(Item item) {
		return itemDao.listItemPaging(item);
	}

	@Override
	public int writeItem(MultipartHttpServletRequest mRequest, Item item) {
		String uploadPath = mRequest.getRealPath("itemImgFileUpload/");
		String backupPath = "D:/mega_IT/source/teamProject/MAC/src/main/webapp/itemImgFileUpload/";
		Iterator<String> params = mRequest.getFileNames();
		String iimg = "";
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param); // 파라미터에 연결된 파일 객체
			iimg = mFile.getOriginalFilename();
			if(iimg!=null && !iimg.equals("")) {
				// 파일첨부했음!			
				if(new File(uploadPath+iimg).exists()) {
					// 서버에 같은 파일이름이 있을 때 첨부한 파일이름을 변경!
					iimg = System.currentTimeMillis()+"_"+iimg;
				} // if
				try {
					mFile.transferTo(new File(uploadPath+iimg)); // 서버에 저장!
					System.out.println("서버파일 : "+uploadPath+iimg);
					System.out.println("백업파일 : "+backupPath+iimg);
					int result = 
						fileCopy(uploadPath+iimg, backupPath+iimg); // 파일카피!
					System.out.println(result == 1? "복사성공" : "복사 실패");
				} catch(IllegalStateException e) {
					System.out.println(e.getMessage());
				} catch(IOException e) {
					System.out.println(e.getMessage());
				}
			} else {
				// 파일첨부 안함!
				iimg = "";
			}// if
		item.setItemImage(iimg); // 첨부한 이미지파일
		return itemDao.writeItem(item);
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
	public Item detailItem(int itemNo) {
		return itemDao.detailItem(itemNo);
	}
	
	@Override
	public int modifyItem(MultipartHttpServletRequest mRequest) {
		String uploadPath = mRequest.getRealPath("itemImgFileUpload/");
		String backupPath = "D:/mega_IT/source/teamProject/MAC/src/main/webapp/itemImgFileUpload/";
		Iterator<String> params = mRequest.getFileNames();
		String iimg = "";
		while(params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param); // 파라미터에 연결된 파일 객체
			iimg = mFile.getOriginalFilename();
			if(iimg!=null && !iimg.equals("")) {
				// 파일첨부했음!			
				if(new File(uploadPath+iimg).exists()) {
					// 서버에 같은 파일이름이 있을 때 첨부한 파일이름을 변경!
					iimg = System.currentTimeMillis()+"_"+iimg;
				} // if
				try {
					mFile.transferTo(new File(uploadPath+iimg)); // 서버에 저장!
					System.out.println("서버파일 : "+uploadPath+iimg);
					System.out.println("백업파일 : "+backupPath+iimg);
					int result = 
						fileCopy(uploadPath+iimg, backupPath+iimg); // 파일카피!
					System.out.println(result == 1? "복사성공" : "복사 실패");
				} catch(IllegalStateException e) {
					System.out.println(e.getMessage());
				} catch(IOException e) {
					System.out.println(e.getMessage());
				}
			} else {
				// 파일첨부 안함!
				iimg = "";
			}// if
		} //while
		Item item = new Item();
		item.setItemNo(Integer.parseInt(mRequest.getParameter("itemNo")));
		item.setItemName(mRequest.getParameter("itemName"));
		item.setItemImage(iimg); // 첨부한 이미지파일
		item.setItemPrice(Integer.parseInt(mRequest.getParameter("itemPrice")));
		return itemDao.modifyItem(item);
	}

	@Override
	public int deleteItem(int itemNo) {
		return itemDao.deleteItem(itemNo);
	}

	@Override
	public int countItem() {
		return itemDao.countItem();
	}
	@Override
	public List<Purchase> listPurchase() {
		return itemDao.listPurchase();
	}
	@Override
	public Item getItem(int itemNo) {
		return itemDao.getItem(itemNo);
	}
}
