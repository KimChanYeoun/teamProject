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

import com.tj.mac.dao.MovieDao;
import com.tj.mac.model.Movie;
@Service
public class MovieServiceImpl implements MovieService {
	@Autowired
	private MovieDao movieDao;
	@Override
	public int insertMovie(MultipartHttpServletRequest mRequest, Movie movie) {
		String uploadPath = mRequest.getRealPath("movieImgUp/");
		String backupPath = "D:/mega_IT/source/teamProject/MAC/src/main/webapp/movieImgUp/";
		Iterator<String> params = mRequest.getFileNames();
		String movieImg = "";
		String param = params.next();
		MultipartFile mFile = mRequest.getFile(param);
		movieImg = mFile.getOriginalFilename();
		if(movieImg!=null && !movieImg.equals("")) {
			// 파일첨부 했을경우
			if(new File(uploadPath+movieImg).exists()) {
				// 서버에 같은 파일이름이 있을 경우 파일이름을 변경
				movieImg = System.currentTimeMillis()+"_"+movieImg;
			}
			try {
				mFile.transferTo(new File(uploadPath+movieImg));
				filecopy(uploadPath+movieImg, backupPath+movieImg);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		} else {
			// 파일첨부 안 했을경우
			movieImg = "noimg.jpg";
		}
		movie.setMovieImage(movieImg);
		return movieDao.insertMovie(movie);
	}
	@Override
	public int modifyMovie(MultipartHttpServletRequest mRequest, Movie movie) {
		String uploadPath = mRequest.getRealPath("movieImgUp/");
		String backupPath = "D:/mega_IT/source/teamProject/MAC/src/main/webapp/movieImgUp/";
		Iterator<String> params = mRequest.getFileNames();
		String movieImg = "";
		String param = params.next();
		MultipartFile mFile = mRequest.getFile(param);
		movieImg = mFile.getOriginalFilename();
		if(movieImg!=null && !movieImg.equals("")) {
			// 파일첨부 했을경우
			if(new File(uploadPath+movieImg).exists()) {
				// 서버에 같은 파일이름이 있을 경우 파일이름을 변경
				movieImg = System.currentTimeMillis()+"_"+movieImg;
			}
			try {
				mFile.transferTo(new File(uploadPath+movieImg));
				filecopy(uploadPath+movieImg, backupPath+movieImg);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		} else {
			// 파일첨부 안 했을경우
			movieImg = mRequest.getParameter("movieImage");
		}
		movie.setMovieImage(movieImg);
		return movieDao.modifyMovie(movie);
	}
	@Override
	public Movie getMovie(int movieNo) {
		return movieDao.getMovie(movieNo);
	}
	@Override
	public int totCntMovie() {
		return movieDao.totCntMovie();
	}
	@Override
	public List<Movie> listMovie(Movie movie) {
		return movieDao.listMovie(movie);
	}
	@Override
	public int searchCntMovie(Movie movie) {
		return movieDao.searchCntMovie(movie);
	}
	@Override
	public List<Movie> searchMovie(Movie movie) {
		return movieDao.searchMovie(movie);
	}
	private void filecopy(String serverFile, String backupFile) throws IOException {
		FileInputStream is = null;
		FileOutputStream os = null;
		try {
			is = new FileInputStream(serverFile);
			os = new FileOutputStream(backupFile);
			File sFile = new File(serverFile);
			byte[] buff = new byte[(int)sFile.length()];
			while(true) {
				int nReadByte = is.read(buff);
				if(nReadByte == -1) {
					break;
				}
				os.write(buff, 0, nReadByte);
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} finally {
			try {
				if(is!=null) {
					is.close();
				}
				if(os!=null) {
					os.close();
				}
			} catch (Exception e) {
				
			}
		}
	}
	@Override
	public List<Movie> beforeReleaseMovie() {
		return movieDao.beforeReleaseMovie();
	}
	@Override
	public List<Movie> nowMovie() {
		return movieDao.nowMovie();
	}
	@Override
	public List<Movie> scheduleMovie() {
		return movieDao.scheduleMovie();
	}
	@Override
	public List<Movie> selectMovie() {
		return movieDao.selectMovie();
	}
	@Override
	public boolean activeBooking(int movieNo) {
		boolean result = false;
		if(movieDao.activeBooking(movieNo)>0) {
			result = true;
		}
		return result;
	}
	@Override
	public List<Movie> movieSelection() {
		return movieDao.movieSelection();
	}
	
}
