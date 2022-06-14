package com.aza.web.lesson;

import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.aza.common.Search;
import com.aza.service.book.BookService;
import com.aza.service.domain.Lesson;
import com.aza.service.domain.User;
import com.aza.service.lesson.LessonService;

@RestController
@RequestMapping("/lesson/rest/")
public class LessonRestController {

	@Autowired
	@Qualifier("lessonServiceImpl")
	private LessonService lessonService;
	
	@Value("${pageUnit}")
	int pageUnit;
	
	@Value("${pageSize}")
	int pageSize;
	
	public LessonRestController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="addLessonBook")
	public ModelAndView addLessonBook(@RequestBody  Lesson lesson) throws Exception{
		ModelAndView model = new ModelAndView();
		try {
			BookService crawler = new BookService();
			String url = URLEncoder.encode("9788994492032", "UTF-8");
			String response = crawler.search(url);
			
			String[] fields = {"title","link","description","image","author","price","isbn"};
			Map<String, Object> result = crawler.getResult(response, fields);
			
			if(result.size() >0)
				System.out.println("total->"+result.get("total"));
			
			List<Map<String,Object>> items = (List<Map<String, Object>>) result.get("result");
			
			for(Map<String,Object> item : items) {
				System.out.println("===============================");
				for(String field : fields) {
					System.out.println(field+"->"+item.get(field));
					if(field.equals("title")) {
						lesson.setBookTitle(item.get(field));
					}
					if(field.equals("author")) {
						lesson.setAuthor(item.get(field));
					}
					if(field.equals("price")) {
						lesson.setBookPrice(item.get(field));
					}
					if(field.equals("isbn")) {
						lesson.setIsbn(item.get(field));
					}
					if(field.equals("pubdate")) {
						lesson.setBookYear(item.get(field));
					}
					if(field.equals("image")) {
						lesson.setBookImg(item.get(field));
	 				}
				}
			}			
//			System.out.println(response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		lessonService.addLessonBook(lesson);
		model.setViewName("redirect:/lesson/manageLessonBook");
		return model;
	}
	
	@RequestMapping("/manageLessonBook")
	public Map<String, Object> manageLessonBook(HttpSession session) throws Exception{
		User user = (User)session.getAttribute("user");
		String teacherId = user.getUserId();
		Search search = new Search();
		
		int totalCount = (int)lessonService.listLessonBook(search, teacherId).get("totalCount");
		search.setCurrentPage(1);
		search.setPageSize(totalCount);
		return lessonService.listLessonBook(search, teacherId);
	}
	
	@RequestMapping("/deleteLessonBook")
	public void deleteLessonBook(@PathVariable String isbn) throws Exception{
		lessonService.deleteLessonBook(isbn);
	}
	
}