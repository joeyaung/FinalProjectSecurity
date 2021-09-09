package tw.com.finalproject.shellyYang.Event.Repository;

import java.util.List;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import tw.com.finalproject.shellyYang.Event.Event;

public interface EventRepository extends JpaRepository<Event, Integer> {

	@Query("select e from Event e order by e.event_id desc")
	List<Event> findAll();
	
	@Query("select reserved_people from Event e")
	List<Integer> findReserved_people();
	@Query("select attend_limit from Event e")
	List<Integer> findAttend_limit();
}
