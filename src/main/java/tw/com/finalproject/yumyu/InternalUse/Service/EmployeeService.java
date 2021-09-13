package tw.com.finalproject.yumyu.InternalUse.Service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import tw.com.finalproject.yumyu.InternalUse.Employee;
import tw.com.finalproject.yumyu.InternalUse.Repository.EmployeeRepository;

@Service
@Transactional
public class EmployeeService implements UserDetailsService {

	@Autowired
	private EmployeeRepository employeeRepository;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Optional<Employee> findByUsername = employeeRepository.findByUsername(username);
		if (findByUsername.isEmpty()) {
			throw new UsernameNotFoundException(String.format("%s is not found!", username));
		}
		Employee result = findByUsername.get();
		UserDetails buildUser = User.builder().username(result.getUsername()).password(result.getPassword())
				.roles(result.getRoles()).build();
		return buildUser;
	}

	public boolean save(Employee employee) {
		try {
			employeeRepository.save(employee);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public Employee findById(long id) {
		Optional<Employee> findById = employeeRepository.findById(id);
		if (findById.isEmpty()) {
			return null;
		}
		return findById.get();
	}

	public Employee findbyUsername(String username) {
		Optional<Employee> result = employeeRepository.findByUsername(username);
		if (result.isEmpty()) {
			return null;
		}
		return result.get();
	}

	public boolean isUsernameExits(String username) {
		Optional<Employee> result = employeeRepository.findByUsername(username);
		if (result.isEmpty()) {
			return false;
		}
		return true;
	}

	public List<Employee> getQueryEmpName(String queryString) {
		List<Employee> resultList = employeeRepository.findByFullNameContains(queryString);
		return resultList;
	}

	public List<Employee> findbyRole(String name) {
		List<Employee> result = employeeRepository.findByRoles(name);
		return result;
	}

	public boolean saveAll(List<Employee> employees) {
		try {
			employeeRepository.saveAll(employees);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

}
