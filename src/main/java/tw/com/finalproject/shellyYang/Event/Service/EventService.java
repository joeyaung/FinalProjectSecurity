package tw.com.finalproject.shellyYang.Event.Service;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.com.finalproject.shellyYang.Event.Event;
import tw.com.finalproject.shellyYang.Event.Repositoty.EventRepository;
import tw.com.finalproject.yumyu.Utils.ImgConverter;

@Service
@Transactional
public class EventService {

	@Autowired
	private EventRepository eventRepository;

	public List<Event> findAllEvent() {

		List<Event> list = eventRepository.findAll();

		for (int i = 0; i < list.size(); i++) {
			try {
				String base64str = ImgConverter.ByteConvertToBase64(list.get(i).getEvent_img());
				list.get(i).setBase64Image(base64str);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;

	}

	/**
	 * 透過id查詢活動
	 * 
	 * @param event_id
	 * @return
	 * @throws Exception
	 */
	public Event findById(Integer event_id) throws Exception {

		Optional<Event> result = eventRepository.findById(event_id);

		if (!result.isPresent()) {
			throw new Exception();
		}

		if (result.get().getEvent_img() == null) {
			String filePath = "../../images/default.jpg";
			result.get().setFilepath("../../images/default.jpg");
		} else {
			byte[] bytes = result.get().getEvent_img();
			String base64str = ImgConverter.ByteConvertToBase64(bytes);
			result.get().setBase64Image(base64str);

		}
		return result.get();
	}

	/**
	 * 
	 * @param event_id
	 * @return
	 */
	public Integer deleteById(Integer event_id) {

		eventRepository.deleteById(event_id);

		return event_id;

	}

	public Event updateEvent(Event event) throws IOException {
		if (!event.getFile().isEmpty()) {
			byte[] bytes = ImgConverter.convertToBytesArrays(event.getFile());
			event.setEvent_img(bytes);
			String base64 = ImgConverter.ByteConvertToBase64(bytes);
			event.setBase64Image(base64);

		} else {
			Optional<Event> e1 = eventRepository.findById(event.getEvent_id());
			event.setEvent_img(e1.get().getEvent_img());
			String base64Image = ImgConverter.ByteConvertToBase64(e1.get().getEvent_img());
			event.setBase64Image(base64Image);

		}

		Event result = eventRepository.save(event);
		return result;

	}

	public Event addEvent(Event event) throws IOException {
		if (!event.getFile().isEmpty()) {
			event.setEvent_img(ImgConverter.convertToBytesArrays(event.getFile()));
		}

		Event result = eventRepository.save(event);

		return result;

	}

	public void saveAll(List<Event> asList) {
		try {
			eventRepository.saveAll(asList);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
