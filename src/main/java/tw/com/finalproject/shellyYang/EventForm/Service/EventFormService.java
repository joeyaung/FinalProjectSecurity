package tw.com.finalproject.shellyYang.EventForm.Service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.finalproject.shellyYang.EventForm.EventForm;
import tw.com.finalproject.shellyYang.EventForm.Repository.EventFormRepository;

@Service
public class EventFormService {
	
	@Autowired
	EventFormRepository eFormRepository;
	
	@Autowired
	EventFormRepository eRepository;
	
	
	
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
	public String createEventForm(EventForm eventForm) {
		
		int attendLimit = eventForm.getEvent().getAttend_limit();
		int reservedPeople = eventForm.getEvent().getReserved_people();
		//此報名人ID
		long memberId = eventForm.getApplicationUser().getId();
		
		
		String limitWarning = "報名失敗，超過人數限制";
		String registerTwice = "報名失敗，重複報名";
		String success = "報名成功！請至您的電子郵件查看報名信件";
		
		//找報名過此event的user id
		List list = eFormRepository.findUser_idByEvent_id(eventForm.getEvent().getEvent_id());
		
		//若報名人數已達上限，狀態設為失敗
		if(reservedPeople-1<0) {
			eventForm.setStatus(limitWarning);
			return limitWarning;

			//透過活動ID撈出MemberId，重複報名狀態設為失敗
		}else if(list.contains(memberId)) {
			eventForm.setStatus(registerTwice);
			return registerTwice;
		}
		
		//若報名成功，則目前已報名人數加1
		else {
			String creationTime = new SimpleDateFormat("yyyy/MM/dd H:mm:ss").format(Calendar.getInstance().getTime());
			eventForm.setCreation_time(creationTime);
			int newReservedPeople = reservedPeople+1;
			eventForm.getEvent().setReserved_people(newReservedPeople);
			eFormRepository.save(eventForm);
			return success;
			
		}
		

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
