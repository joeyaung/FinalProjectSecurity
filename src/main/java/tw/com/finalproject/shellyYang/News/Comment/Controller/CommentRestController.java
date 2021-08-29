package tw.com.finalproject.shellyYang.News.Comment.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import tw.com.finalproject.shellyYang.News.Comment.Comment;
import tw.com.finalproject.shellyYang.News.Comment.Service.CommentService;

@RestController
public class CommentRestController {

	@Autowired
	private CommentService commentService;

	@GetMapping("/getAllComment")
	public List<Comment> getAllComment() {
		return commentService.findAllComment();
	}

	@GetMapping("/findCommentById/{comment_id}")
	public Comment findCommentById(@PathVariable String comment_id) {
		Comment result = null;
		try {
			result = commentService.findById(comment_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;

	}

	@PostMapping("/addComment")
	public Comment addComment(Comment comment) {
		return commentService.addComment(comment);
	}

	@GetMapping("/deleteComment/{comment_id}")
	public Map<String, String> deleteCommentById(@PathVariable String coomment_id) {

		Map<String, String> map = new HashMap<String, String>();

		String result = commentService.deleteById(coomment_id);
		map.put("Your comment id:" + coomment_id, result);
		return map;
	}

	@PostMapping("/updateComment")
	public String updateComment(Comment comment) {
		commentService.updateComment(comment);
		return "success";
	}

}
