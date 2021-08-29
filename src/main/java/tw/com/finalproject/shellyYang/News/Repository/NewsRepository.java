package tw.com.finalproject.shellyYang.News.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import tw.com.finalproject.shellyYang.News.News;

public interface NewsRepository extends JpaRepository<News, Integer> {

	List<News> findAllByOrderByNewsIdDesc();

	List<News> findAllByUploadDateBetweenOrderByNewsIdDesc(String startDate, String endDate);

	@Query("select n from News n where n.title like %?1% or n.subtitle like %?1% or n.content like %?1% order by newsId desc")
	List<News> findByContentOrSubtitleOrTitleContaining(String keywords);
}
