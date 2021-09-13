package tw.com.finalproject.yumyu.InternalUse.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.finalproject.yumyu.InternalUse.Client;
import tw.com.finalproject.yumyu.InternalUse.ClientActivity;
import tw.com.finalproject.yumyu.InternalUse.Repository.ClientActivityRepository;

@Service
public class ClientActivityService {

	@Autowired
	private ClientActivityRepository clientActivityRepository;
	
	public List<ClientActivity> queryActivitiesByClient(Client client){
		List<ClientActivity> result = clientActivityRepository.findByClientOrderByCreatedDateDesc(client);
		return result;
	}
	
	public boolean save(ClientActivity clientActivity) {
		try {
			clientActivityRepository.save(clientActivity);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean saveAll(List<ClientActivity> activities) {
		try {
			clientActivityRepository.saveAll(activities);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
}
