package tw.com.finalproject.shellyYang.EventForm.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import tw.com.finalproject.shellyYang.EventForm.EventForm;

public interface EventFormRepository extends JpaRepository<EventForm, Integer> {
	//透過活動ID撈出報名此活動的會員ID
	@Query(value="select id from eventform e inner join application_user a on e.user_id = a.id\n"
			+ "where event_id = ?1",nativeQuery=true)
	List<Integer> findUser_idByEvent_id(int event_id);
	
	List<EventForm> findByApplicationUserId(Long user_id);
	
	@Query(value="select gender from eventform where event_id = ?1 and gender like ?2",nativeQuery=true)
	List<String> findByEvent_idAndGenderContaining(int event_id, String gender);
	
	
	@Query(value="delete from eventform where event_id = ?1",nativeQuery=true)
	@Modifying
	void deleteByEvent_eventid(Integer eventId);
	List<EventForm> findByStatus(String status);
	
}