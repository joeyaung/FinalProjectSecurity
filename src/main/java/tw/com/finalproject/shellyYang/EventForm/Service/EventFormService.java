package tw.com.finalproject.shellyYang.EventForm.Service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import tw.com.finalproject.Mail.MailService;
import tw.com.finalproject.shellyYang.Event.Event;
import tw.com.finalproject.shellyYang.Event.Repository.EventRepository;
import tw.com.finalproject.shellyYang.EventForm.EventForm;
import tw.com.finalproject.shellyYang.EventForm.Repository.EventFormRepository;
import tw.com.finalproject.yumyu.Member.ApplicationUser;
import tw.com.finalproject.yumyu.Member.Repository.ApplicationUserRepository;

@Service
public class EventFormService {

	@Autowired
	private EventFormRepository eFormRepository;

	@Autowired
	private EventRepository eRepository;

	@Autowired
	private ApplicationUserRepository appUserRepository;
	
	@Autowired
	private MailService mailService;

	/**
	 * 查詢所有報名人資訊
	 * 
	 * @return
	 */
	public List<EventForm> findAllEventForm() {

		List<EventForm> list = eFormRepository.findAll();

		if (list.isEmpty()) {
			return null;
		}
		return list;

	}

	/**
	 * 新增報名人資訊 判斷報名是否重複、報名人數已達上限
	 * 
	 * @return
	 */
	public String createEventForm(String json) {

		EventForm eventForm = null;

		ObjectMapper objectMapper = new ObjectMapper();

		try {
			Map<String, String> map = objectMapper.readValue(json, new TypeReference<Map<String, String>>() {
			});
			
			long userId = Long.parseLong(map.get("user_id"));

			int eventId = Integer.parseInt(map.get("event_id"));

			String gender = map.get("user_gender");
			String idNumber = map.get("user_id_number");
			String message = map.get("user_message");
			System.out.println("message=" + message);

			eventForm = new EventForm();

			Event event = eRepository.findById(eventId).get();
			int attendLimit = event.getAttend_limit();

			int reservedPeople = event.getReserved_people();
			// 此報名人資訊
			ApplicationUser appUser = appUserRepository.findById(userId).get();

			String limitWarning = "報名失敗，超過人數限制";
			String success = "報名成功！請至您的電子郵件查看報名信件";

			// 從EventForm找報名過此event的user id
			List list = eFormRepository.findUser_idByEvent_id(eventId);

			// 若報名人數已達上限，狀態設為失敗

			if (reservedPeople + 1 > attendLimit) {

				return limitWarning;

			}

			// 若報名成功
			else {
				String creationTime = new SimpleDateFormat("yyyy/MM/dd H:mm:ss")
						.format(Calendar.getInstance().getTime());

				// 報名成功，目前已報名人數加1
				int newReservedPeople = reservedPeople + 1;

				event.setReserved_people(newReservedPeople);

				eventForm.setCreation_time(creationTime);
				eventForm.setApplicationUser(appUser);
				eventForm.setEvent(event);
				eventForm.setGender(gender);
				eventForm.setId_number(idNumber);
				if (message == null || message.isEmpty() || message.trim().isEmpty()) {
					eventForm.setMessage("無");
				} else {
					eventForm.setMessage(message);

				}
				eventForm.setStatus("待審核");

				eFormRepository.save(eventForm);

			}

		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		return "報名資料已送出！審核通過會寄送電子郵件通知，近日請留意您的Email";

	}

	/**
	 * 透過form_id找尋活動報名人資訊
	 * 
	 * @param form_id
	 * @return
	 */
	public EventForm findEventFormById(Integer form_id) {
		Optional<EventForm> result = eFormRepository.findById(form_id);
		if (result.isEmpty()) {
			return null;
		}
		return result.get();
	}

	/**
	 * 更新活動報名人資訊
	 * 
	 * @param eventRegistration
	 * @return
	 */
	public boolean updateEventForm(EventForm eventRegistration) {
		Optional<EventForm> result = eFormRepository.findById(eventRegistration.getForm_id());
		if (result.isPresent()) {
			eFormRepository.save(eventRegistration);
			return true;
		}
		return false;
	}

	/**
	 * 透過form_id刪除活動報名人資訊
	 * 
	 * @param form_id
	 * @return
	 */
	public boolean deleteEventFormById(Integer form_id) {
		Optional<EventForm> result = eFormRepository.findById(form_id);
		if (result.isPresent()) {
			eFormRepository.deleteById(form_id);
			return true;
		}
		return false;
	}
    /**
     * 透過會員id找此會員報名過的活動
     * @param user_id
     * @return
     */
	public List<EventForm> findEventByUserid(Long user_id) {
		return eFormRepository.findByApplicationUserId(user_id);
	}
	
	/**
	 * 審核通過則寄送email給會員
	 * @param eventForm
	 * @return
	 */
	public boolean approveEventForm(String jsonString) {
		
		//須取得Event id 、 User Id、Form Id
		
		EventForm eventForm = null;
		ObjectMapper objectMapper = new ObjectMapper();
		
		try {
			Map<String, String> map = objectMapper.readValue(jsonString, new TypeReference<Map<String, String>>() {
			});
			
			int formId = Integer.parseInt(map.get("form_id"));
			int eventId = Integer.parseInt(map.get("event_id"));
			long userId = Long.parseLong(map.get("user_id"));
			
			eventForm = this.findEventFormById(formId);

		} catch (JsonMappingException e1) {
			e1.printStackTrace();
		} catch (JsonProcessingException e1) {
			e1.printStackTrace();
		}
		
		
		String fullName = eventForm.getApplicationUser().getFullName();
		String gender = eventForm.getGender();
		int form_id = eventForm.getForm_id();
		String event_title = eventForm.getEvent().getEvent_title();
		String event_date = eventForm.getEvent().getEvent_date();
		String event_loc = eventForm.getEvent().getLocation();
		String email = eventForm.getApplicationUser().getUsername();
		
		try {
			String textString = "<h2>親愛的貴賓 " + fullName + "  " + gender + "您好:</h2>"
					+ "本公司已審核通過您的活動報名申請"
					+ "<br/>您的 表單ID 是: <span style='font:bold 18px sans-serif; color:red'>" + form_id
					+ "</span><br/>您的活動報名資訊如下:<br/>"
					+ "<br/><div style='text-align: center'><table width=550 ; style='font-size:18px; border-collapse:collapse;border:2px solid #7DCEA0'>"
					+ "<tr style='background-color:#D4EFDF'><td>活動名稱</td><td>活動日期</td><td>活動地點</td></tr>"
					+ "<tr style='background-color:#EBF5FB;padding:12px;'><td>" + event_title + "</td><td>" + event_date
					+ "</td><td>" + event_loc + "</td></tr></table></div>"
					+ "您可以以您的表單ID，至以下網址查詢或修改您的完整表單資訊"
					+ "<br/><a style='font-size:20px' href=\'http://localhost:8080/FinalProject/account/event'>Audi AG 於此檢查活動報名詳情</a>"
					+ "<br/>期待您的蒞臨~";
			mailService.prepareAndSendImg(email, "[奧迪車業]活動報名 成功 通知", textString);
			
			
		} catch (Exception e) {
			System.out.println("Send Mail Failed.");
			e.printStackTrace();
			return false;
		}
		
		eventForm.setStatus("成功");
		eFormRepository.save(eventForm);
		return true;
	}
	
	/**
	 * 使用者端取消活動報名
	 * @param form_id
	 * @return
	 */
	public boolean cancelEventRegistration(String formId) {
		int form_id = Integer.parseInt(formId);
		
		Optional<EventForm> eForm = eFormRepository.findById(form_id);
		if(eForm.isPresent()) {
			EventForm eventForm = eForm.get();
			
			eventForm.setStatus("報名取消");
			int reservedPeople = eventForm.getEvent().getReserved_people();
			//報名若取消，目前已報名人數+1
			int newReservedPeople = reservedPeople-1;
			
			eventForm.getEvent().setReserved_people(newReservedPeople);
			
			eFormRepository.save(eventForm);
			return true;
		}else {
			System.out.println("查無此筆報名資料");
			return false;
		}
		
	}

}
