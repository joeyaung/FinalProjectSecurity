package tw.com.finalproject.shellyYang.EventForm.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import tw.com.finalproject.shellyYang.EventForm.EventForm;

public interface EventFormRepository extends JpaRepository<EventForm, Integer> {

	@Query(value="select id from eventform e inner join application_user a on e.user_id = a.id\n"
			+ "where event_id = ?1",nativeQuery=true)
	List<Integer> findUser_idByEvent_id(int event_id);
}
