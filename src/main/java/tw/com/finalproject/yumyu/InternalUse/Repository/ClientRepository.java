package tw.com.finalproject.yumyu.InternalUse.Repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

import tw.com.finalproject.yumyu.InternalUse.Client;
import tw.com.finalproject.yumyu.InternalUse.Employee;

@Service
public interface ClientRepository extends JpaRepository<Client, Long> {
	public List<Client> findByFullNameLike(String queryName);
	List<Client> findByFullNameContains(String queryName);
	public List<Client> findByInchargedEmployee(Employee employee);
	public Optional<Client> findByEmail(String email);
}
