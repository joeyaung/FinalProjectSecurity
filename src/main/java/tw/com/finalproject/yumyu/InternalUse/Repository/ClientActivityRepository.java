package tw.com.finalproject.yumyu.InternalUse.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.finalproject.yumyu.InternalUse.Client;
import tw.com.finalproject.yumyu.InternalUse.ClientActivity;

public interface ClientActivityRepository extends JpaRepository<ClientActivity, Long> {
	public List<ClientActivity> findByClientOrderByCreatedDateDesc(Client client);
}
