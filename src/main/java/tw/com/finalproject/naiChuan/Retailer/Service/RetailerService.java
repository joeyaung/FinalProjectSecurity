package tw.com.finalproject.naiChuan.Retailer.Service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.com.finalproject.naiChuan.Retailer.Retailer;
import tw.com.finalproject.naiChuan.Retailer.Repository.RetailerRepository;

@Service
@Transactional
public class RetailerService {

	@Autowired
	private RetailerRepository retailerRepository;

	// 新增 create post
	public Retailer createRetailer(Retailer retailer) {
		Retailer result = retailerRepository.save(retailer);
		return result;
	}

	// 查詢單一 By Id
	public Retailer findByIdRetailer(String retailerId) {
		Optional<Retailer> result = retailerRepository.findById(retailerId);
		if (result.isEmpty()) {
			return null;
		}
		return result.get();
	}

	// 查詢全部 find All get All
	public List<Retailer> findAllRetailer() {
		List<Retailer> result = retailerRepository.findAll();
		if (result.isEmpty()) {
			return null;
		}
		return result;
	}

	// 刪除 delete
	public boolean deleteByIdRetailer(String retailerId) {
		// 確認db有這筆資料
		Optional<Retailer> result = retailerRepository.findById(retailerId);
		if (result.isEmpty()) {
			return false;
		}
		// 執行刪除
		retailerRepository.deleteById(retailerId);
		return true;
	}

	// 修改 update put
	public boolean updateRetailer(Retailer retailer) {

		// 確認db有這筆資料
		Optional<Retailer> result = retailerRepository.findById(retailer.getRetailerId());
		if (result.isEmpty()) {
			return false;
		}
		// 執行修改
		// 取得 原Retailer
		Retailer originRetailer = result.get();
		// 將 原Retailer以 新Retailer 取代
		originRetailer = retailer;
		try {
			retailerRepository.saveAndFlush(originRetailer);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

}
