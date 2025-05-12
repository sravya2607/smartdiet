package emailcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.klef.jfsd.springboot.service.UserServiceImpl;

@RestController
@RequestMapping("/email")
public class emailc {
	
	@Autowired
	UserServiceImpl usi;
	 @GetMapping("/send")
		public String send()
		{
			return usi.sendEmail("2200030133cseh@gmail.com", "Registration successful", "Welcome to fitplate");

		}
}
