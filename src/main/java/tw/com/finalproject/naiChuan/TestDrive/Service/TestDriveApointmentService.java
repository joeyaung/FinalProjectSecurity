package tw.com.finalproject.naiChuan.TestDrive.Service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.finalproject.naiChuan.TestDrive.TestDriveApointment;
import tw.com.finalproject.naiChuan.TestDrive.Repository.TestDriveApointRepository;

@Service
@Transactional
public class TestDriveApointmentService {

	@Autowired
	private TestDriveApointRepository testDriveApointRepository;

	// 新增 create post
	public TestDriveApointment createTestdrive(TestDriveApointment testdrive) {
		TestDriveApointment result = testDriveApointRepository.save(testdrive);
		return result;
	}

	// 查詢單一 find 1 get 1
	public TestDriveApointment findByIdTestdrive(String formId) {
		Optional<TestDriveApointment> result = testDriveApointRepository.findById(formId);
		if (result.isEmpty()) {
			return null;
		}
		return result.get();
	}

	// 查詢全部 find All get All
	public List<TestDriveApointment> findAllTestdrive() {
		List<TestDriveApointment> result = testDriveApointRepository.findAll();
		if (result.isEmpty()) {
			return null;
		}
		return result;
	}

	// 刪除 delete
	public boolean deleteByIdTestdrive(String formId) {
		// 確認db有這筆資料
		Optional<TestDriveApointment> result = testDriveApointRepository.findById(formId);
		if (result.isEmpty()) {
			return false;
		}
		// 執行刪除
		testDriveApointRepository.deleteById(formId);
		// 同上
		// tdriveRepository.deleteById(result.get().getFormId());
		return true;
	}

	// 修改 update put
	public boolean updateTestdrive(TestDriveApointment testdrive) {
		// 確認db有這筆資料
		Optional<TestDriveApointment> result = testDriveApointRepository.findById(testdrive.getFormId());
		if (result.isEmpty()) {
			return false;
		}
		// 執行修改
		TestDriveApointment newTestdrive = result.get();
		newTestdrive = testdrive;
		try {
			testDriveApointRepository.saveAndFlush(newTestdrive);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
}
