package tw.com.finalproject.yumyu.InternalUse.Repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

import tw.com.finalproject.yumyu.InternalUse.Employee;

@Service
public interface EmployeeRepository extends JpaRepository<Employee, Long> {
	public Optional<Employee> findByUsername(String username);
}
