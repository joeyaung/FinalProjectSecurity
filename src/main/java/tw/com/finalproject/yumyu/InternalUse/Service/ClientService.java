package tw.com.finalproject.yumyu.InternalUse.Service;

import java.util.List;
import java.util.Optional;

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

	public Client findById(Long id) {
		Optional<Client> result = clientRepository.findById(id);
		if (result.isEmpty()) {
			return null;
		}
		return result.get();
	}

	public Client findByEmail(String email) {
		Optional<Client> findByEmail = clientRepository.findByEmail(email);
		if (findByEmail.isEmpty()) {
			return null;
		}
		return findByEmail.get();
	}
	
	public boolean update(Client client) {
		
		try {
			clientRepository.saveAndFlush(client);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
}
