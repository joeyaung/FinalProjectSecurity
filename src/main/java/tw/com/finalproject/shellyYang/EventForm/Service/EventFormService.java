package tw.com.finalproject.shellyYang.EventForm.Service;

import java.sql.SQLClientInfoException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.hibernate.engine.jdbc.spi.SqlExceptionHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.configurationprocessor.json.JSONArray;
import org.springframework.boot.configurationprocessor.json.JSONException;
import org.springframework.boot.configurationprocessor.json.JSONObject;
import org.springframework.stereotype.Service;

import tw.com.finalproject.shellyYang.Event.Event;
import tw.com.finalproject.shellyYang.Event.Repository.EventRepository;
import tw.com.finalproject.shellyYang.EventForm.EventForm;
import tw.com.finalproject.shellyYang.EventForm.Repository.EventFormRepository;
import tw.com.finalproject.yumyu.Member.ApplicationUser;
import tw.com.finalproject.yumyu.Member.Repository.ApplicationUserRepository;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class EventFormService {
	
	@Autowired
	EventFormRepository eFormRepository;
	
	@Autowired
	EventRepository eRepository;
	
	@Autowired
	ApplicationUserRepository appUserRepository;
	
	
	
	
	
	/**
	 * 查詢所有報名人資訊
	 * @return
	 */
	public List<EventForm> findAllEventForm() {

		List<EventForm> list = eFormRepository.findAll();
		
		if(list.isEmpty()) {
			return null;
		}
		return list;


	}
	
	/**
	 * 新增報名人資訊
	 * 判斷報名是否重複、報名人數已達上限
	 * @return
	 */
	public String createEventForm(String json) {
		
		
		EventForm eventForm = null;
		
		ObjectMapper objectMapper = new ObjectMapper();

		try {
			Map<String, String> map = objectMapper.readValue(json, new TypeReference<Map<String, String>>() {});
		
			long userId = Long.parseLong(map.get("user_id"));
			
			int eventId = Integer.parseInt(map.get("event_id"));
					
			String gender = map.get("user_gender");
			String idNumber = map.get("user_id_number");
			String message = map.get("user_message");
			
			eventForm = new EventForm();
			
			Event event = eRepository.findById(eventId).get();
			int attendLimit = event.getAttend_limit();
			
			int reservedPeople = event.getReserved_people();
			//此報名人資訊
			ApplicationUser appUser = appUserRepository.findById(userId).get();
			
			String limitWarning = "報名失敗，超過人數限制";
			String success = "報名成功！請至您的電子郵件查看報名信件";
			
			//從EventForm找報名過此event的user id
			List list = eFormRepository.findUser_idByEvent_id(eventId);
			
			//若報名人數已達上限，狀態設為失敗
			
			if(reservedPeople+1 > attendLimit) {	
				
				return limitWarning;
				
			}
			
			//若報名成功
			else {
				String creationTime = new SimpleDateFormat("yyyy/MM/dd H:mm:ss").format(Calendar.getInstance().getTime());
				
				//報名成功，目前已報名人數加1
				int newReservedPeople = reservedPeople+1;
				
				event.setReserved_people(newReservedPeople);
				
				eventForm.setCreation_time(creationTime);
				eventForm.setApplicationUser(appUser);
				eventForm.setEvent(event);
				eventForm.setGender(gender);
				eventForm.setId_number(idNumber);
				eventForm.setMessage(message);
				eventForm.setStatus("成功");
				
				eFormRepository.save(eventForm);
				
		
				
			}
			
			
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		

		return "報名成功！請至您的電子郵件查看報名信件";
		

	}
	
	
	/**
	 * 透過form_id找尋活動報名人資訊
	 * @param form_id
	 * @return
	 */
	public EventForm findEventFormById(Integer form_id) {
		Optional<EventForm> result = eFormRepository.findById(form_id);
		if(result.isEmpty()) {
			return null;
		}
		return result.get();
	}
	
	/**
	 * 更新活動報名人資訊
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
	 * @param form_id
	 * @return
	 */
	public boolean deleteEventFormById(Integer form_id) {
		Optional<EventForm> result = eFormRepository.findById(form_id);
		if(result.isPresent()) {
			eFormRepository.deleteById(form_id);
			return true;
		}
		return false;
	}

}
