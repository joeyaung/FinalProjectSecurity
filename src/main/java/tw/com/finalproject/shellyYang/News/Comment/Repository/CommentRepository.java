package tw.com.finalproject.shellyYang.News.Comment.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.finalproject.shellyYang.News.Comment.Comment;

public interface CommentRepository extends JpaRepository<Comment, String> {

}
