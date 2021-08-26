package tw.com.finalproject.yumyu.InternalUse.Service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.finalproject.yumyu.InternalUse.Client;
import tw.com.finalproject.yumyu.InternalUse.Employee;
import tw.com.finalproject.yumyu.InternalUse.Repository.ClientRepository;

@Service
@Transactional
public class ClientService {

	@Autowired
	private ClientRepository clientRepository;


	public List<Client> queryClientsByfullName(String queryName) {
		List<Client> result = clientRepository.findByFullNameLike(queryName);
		return result;
	}


	public boolean save(Client client) {
		try {
			clientRepository.save(client);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}


	public List<Client> findByEmployee(Employee employee) {
		List<Client> result = clientRepository.findByInchargedEmployee(employee);
		return result;
	}
}
