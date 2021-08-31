package tw.com.finalproject.shellyYang.EventForm.Service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.finalproject.shellyYang.EventForm.EventForm;
import tw.com.finalproject.shellyYang.EventForm.Repository.EventFormDao;

@Service
public class EventFormService {
	
	@Autowired
	EventFormDao eDao;
	
	/**
	 * 查詢所有報名人資訊
	 * @return
	 */
	public List<EventForm> findAllEventForm() {

		List<EventForm> list = eDao.findAll();
		
		if(list.isEmpty()) {
			return null;
		}
		return list;


	}
	
	/**
	 * 新增報名人資訊
	 * @return
	 */
	public EventForm createEventForm(EventForm EventForm) {
		
		String creationTime = new SimpleDateFormat("yyyy/MM/dd H:mm:ss").format(Calendar.getInstance().getTime());
		EventForm.setCreation_time(creationTime);
		return eDao.save(EventForm);
	}
	
	/**
	 * 透過form_id找尋活動報名人資訊
	 * @param form_id
	 * @return
	 */
	public EventForm findEventFormById(Integer form_id) {
		Optional<EventForm> result = eDao.findById(form_id);
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
		Optional<EventForm> result = eDao.findById(eventRegistration.getForm_id());
		if (result.isPresent()) {
			eDao.save(eventRegistration);
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
		Optional<EventForm> result = eDao.findById(form_id);
		if(result.isPresent()) {
			eDao.deleteById(form_id);
			return true;
		}
		return false;
	}

}
