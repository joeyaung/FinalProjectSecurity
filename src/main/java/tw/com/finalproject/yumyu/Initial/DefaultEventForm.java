package tw.com.finalproject.yumyu.Initial;

import java.sql.Time;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.concurrent.ThreadLocalRandom;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.finalproject.shellyYang.Event.Event;
import tw.com.finalproject.shellyYang.Event.Service.EventService;
import tw.com.finalproject.shellyYang.EventForm.EventForm;
import tw.com.finalproject.shellyYang.EventForm.Repository.EventFormRepository;
import tw.com.finalproject.yumyu.Enums.ApplicationRoles;
import tw.com.finalproject.yumyu.Member.ApplicationUser;
import tw.com.finalproject.yumyu.Member.Service.ApplicationUserService;

@Service
@Transactional
public class DefaultEventForm {
	
	@Autowired
	private ApplicationUserService applicationUserService;
	@Autowired
	private EventService eventService;
	@Autowired
	private EventFormRepository eFormRepository;
	
	
	// Use loop to create 30 application user (for event form chart.js統計)
		public void createDefaultApplicationUser() {

			List<ApplicationUser> users = new ArrayList<ApplicationUser>();

			List<String> city = new ArrayList<String>();
			city.add("台北市");
			city.add("新北市");
			city.add("高雄市");
			city.add("新竹市");
			
			List<String> name = new ArrayList<String>();
			name.add("劉美華");
			name.add("陳明華");
			name.add("吳鳳麟");
			name.add("楊曉慧");
			name.add("陳大華");
			name.add("屋重亮");
			name.add("李芳芳");
			name.add("劉婌方");
			name.add("方美珠");
			name.add("張美麗");
			name.add("陳之華");

			for (int i = 0; i < 200; i++) {
				int random = new Random().nextInt(city.size());
				ApplicationUser user = new ApplicationUser();
				user.setUsername("eeit2905_" + i + "@gmail.com");
				if(i<10) {
					user.setPhone("091792217" + i);		
				}else if(i>10 && i<100){
					user.setPhone("09179221" + i);
				}else
					user.setPhone("0917922" + i);
				int randomName = new Random().nextInt(name.size());
				user.setFullName(name.get(randomName));
				user.setRoles(ApplicationRoles.MEMBER.name());
				user.setZipCode("105");
				user.setPassword("asd");
				user.setCity(city.get(random));
				user.setFullAddress("寶清街105巷13號");
				user.setTown("松山區");
				users.add(user);
			}
			applicationUserService.saveAll(users);
		}
		
	
	public void createDefaultEventFormData() {

		List<EventForm> forms = new ArrayList<EventForm>();

		String[] gender = new String[] { "先生", "小姐" };

		for (long i = 2; i < 201; i++) {
			
			

			// 隨機取得一活動
			Random random1 = new Random(); // instance of random class
			List<Event> list = eventService.findAllEvent();
			int eventCount = list.size();
			
			int min = 1;
			int max = eventCount;
			int random_int = (int) Math.floor(Math.random() * (max - min + 1) + min);

			// 取得此活動報名開始＋結束日期
			Event event;
			try {
				event = eventService.findById(random_int);
				String startDate = event.getReserve_start_date();
				String endDate = event.getReserve_end_date();

				int startYear = Integer.parseInt(startDate.substring(0, 4));
				int startMonth = Integer.parseInt(startDate.substring(5, 7));
				int startDay = Integer.parseInt(startDate.substring(8, 10));

				int endYear = Integer.parseInt(endDate.substring(0, 4));
				int endMonth = Integer.parseInt(endDate.substring(5, 7));
				int endDay = Integer.parseInt(endDate.substring(8, 10));

				LocalDate start_date = LocalDate.of(startYear, startMonth, startDay); // start date
				long start = start_date.toEpochDay();

				LocalDate end_date = LocalDate.of(endYear, endMonth, endDay); // end date
				long end = end_date.toEpochDay();

				long randomEpochDay = ThreadLocalRandom.current().longs(start, end).findAny().getAsLong();

				DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
				String formattedRandomDate = LocalDate.ofEpochDay(randomEpochDay).format(formatter);

				// 取得隨機時間（時分秒）
				// 取得此活動報名之間隨機日期＋時間
				Random timeRandom = new Random();
				int millisInDay = 24 * 60 * 60 * 1000;
				Time time = new Time((long) timeRandom.nextInt(millisInDay));
				String randomDateTime = formattedRandomDate + " " + time.toString();

				// 取得隨機性別
				Random genderRandom = new Random();
				int n = genderRandom.nextInt(gender.length);
				String randomGender = gender[n];
				

				// 取得隨機身分證字號
				Random r = new Random();
				String s = "";
				// 產生前9碼的同時計算產生驗證碼
				int checknum = 0;
				String checkHead = "ABCDEFGHJKLMNPQRSTUVWXYZIO";

				// 產生第一個英文字母
				int t = (r.nextInt(26) + 65);
				s += (char) t;
				t = checkHead.indexOf((char) t) + 10;
				checknum += t / 10;
				checknum += t % 10 * 9;

				// 產生第2個數字 (1~2)
				s += Integer.toString(t = r.nextInt(2) + 1);
				checknum += t * 8;

				// 產生後8碼
				for (int j = 2; j < 9; j++) {
					s += Integer.toString(t = r.nextInt(10));
					checknum += t * (9 - j);
				}

				// 完成驗證碼計算
				checknum = (10 - ((checknum) % 10)) % 10;
				s += Integer.toString(checknum);

				// set eventform

				EventForm eventForm = new EventForm();
				if(i!=101) {
					ApplicationUser appUser = applicationUserService.findById(i);
					
					eventForm.setApplicationUser(appUser);
					eventForm.setCreation_time(randomDateTime);
					eventForm.setEvent(event);
					eventForm.setGender(randomGender);
					eventForm.setId_number(s);
					eventForm.setStatus("成功");
					
					forms.add(eventForm);
					
				}else {
					System.out.println("skip 王小明");
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// Default EvnentForm data Demo專用user_id=101 王小明
		Event event = null;
		ApplicationUser appUser = null;
		try {
			event = eventService.findById(1);
			appUser = applicationUserService.findByUsername("member@demo.com");

		} catch (Exception e) {
			e.printStackTrace();
		}
		EventForm defaultEventForm1 = EventForm.builder().event(event).creation_time("2021/09/01 13:57:53").gender("先生")
				.id_number("Z122338754").message("我吃素").status("成功").applicationUser(appUser).build();

		eFormRepository.saveAll(forms);
		eFormRepository.save(defaultEventForm1);

	}
	
	


}
