package tw.com.finalproject.shellyYang.News.Service;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.finalproject.shellyYang.News.News;
import tw.com.finalproject.shellyYang.News.Repository.NewsRepository;
import tw.com.finalproject.yumyu.Utils.ImgConverter;

@Service
public class NewsService {

	@Autowired
	NewsRepository newsRepository;

	public List<News> findAllByOrderByNewsIdDesc() {

		List<News> list = newsRepository.findAllByOrderByNewsIdDesc();
		for (int i = 0; i < list.size(); i++) {
			try {
				String base64str = ImgConverter.ByteConvertToBase64(list.get(i).getImage());
				list.get(i).setBase64Image(base64str);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;

	}

	/**
	 * 透過id查詢新聞
	 * 
	 * @param newsId
	 * @return
	 * @throws Exception
	 */
	public News findById(Integer newsId) throws Exception {

		Optional<News> result = newsRepository.findById(newsId);

		if (!result.isPresent()) {
			throw new Exception();
		}

		if (result.get().getImage() == null) {
			String filePath = "../../images/default.jpg";
			result.get().setFilepath("../../images/default.jpg");
		} else {
			byte[] bytes = result.get().getImage();
			String base64str = ImgConverter.ByteConvertToBase64(bytes);
			result.get().setBase64Image(base64str);

		}
		return result.get();

	}

	/**
	 * 
	 * @param newsId
	 * @return
	 */
	public Integer deleteById(Integer newsId) {

		newsRepository.deleteById(newsId);

		return newsId;

	}

	public News updateNews(News news) throws IOException {
		if (!news.getFile().isEmpty()) {
			byte[] bytes = ImgConverter.convertToBytesArrays(news.getFile());
			news.setImage(bytes);
			String base64 = ImgConverter.ByteConvertToBase64(bytes);
			news.setBase64Image(base64);

		} else {
			Optional<News> n1 = newsRepository.findById(news.getNewsId());
			news.setImage(n1.get().getImage());
			String base64Image = ImgConverter.ByteConvertToBase64(n1.get().getImage());
			news.setBase64Image(base64Image);

		}

		News result = newsRepository.save(news);
		return result;

	}

	public News addNews(News news) throws IOException {
		if (!news.getFile().isEmpty()) {
			news.setImage(ImgConverter.convertToBytesArrays(news.getFile()));
		}
		News result = newsRepository.save(news);

		return result;

	}

	public List<News> findAllByUploadDateBetween(String startDate, String endDate) {
		return newsRepository.findAllByUploadDateBetweenOrderByNewsIdDesc(startDate, endDate);

	}

	/**
	 * 透過關鍵字查詢
	 */

	public List<News> findByContentOrSubtitleOrTitleContaining(String keywords) {
		return newsRepository.findByContentOrSubtitleOrTitleContaining(keywords);

	}

	public void saveAll(List<News> asList) {
		try {
			newsRepository.saveAll(asList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
