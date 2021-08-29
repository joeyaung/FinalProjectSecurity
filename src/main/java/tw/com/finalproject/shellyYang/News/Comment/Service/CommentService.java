package tw.com.finalproject.shellyYang.News.Comment.Service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.finalproject.shellyYang.News.Comment.Comment;
import tw.com.finalproject.shellyYang.News.Comment.Repository.CommentRepository;

@Service
public class CommentService {

	@Autowired
	private CommentRepository commentRepository;

	public List<Comment> findAllComment() {
		List<Comment> list = commentRepository.findAll();
		System.out.println(list);
		return list;

	}

	/**
	 * 透過id查詢comment
	 * 
	 * @throws Exception
	 */

	public Comment findById(String comment_id) throws Exception {
		Optional<Comment> result = commentRepository.findById(comment_id);
		if (!result.isPresent()) {
			throw new Exception();
		}
		return result.get();

	}

	public String deleteById(String comment_id) {
		if (comment_id != null) {
			return "Cannot find this comment.";
		}
		commentRepository.deleteById(comment_id);
		return "The comment has been deleted.";
	}

	/**
	 * 更新comment
	 */
	public Comment updateComment(Comment comment) {

		Comment result = commentRepository.save(comment);
		return result;

	}

	/**
	 * 新增comment
	 */

	public Comment addComment(Comment comment) {
		Comment result = commentRepository.save(comment);
		return result;
	}
}
