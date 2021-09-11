package tw.com.finalproject.naiChuan.TestDrive.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.finalproject.naiChuan.TestDrive.TestDriveApointment;

public interface TestDriveApointRepository extends JpaRepository<TestDriveApointment, String> {
	public List<TestDriveApointment> findByDriveDate(String driveDate);
}
