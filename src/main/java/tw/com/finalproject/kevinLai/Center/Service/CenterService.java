package tw.com.finalproject.kevinLai.Center.Service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.com.finalproject.kevinLai.Center.Center;
import tw.com.finalproject.kevinLai.Center.Repository.CenterRepository;
import tw.com.finalproject.naiChuan.Retailer.Retailer;

@Service
@Transactional
public class CenterService {
	
	@Autowired
	private CenterRepository centerRepository;
	
	//尋找全部
	public List<Center> queryCenterAll(){
		List<Center> result = centerRepository.findAll();
		if(result.isEmpty()) {
			return null;
		}
		return result;

		
		
	}
	
	
	//用id尋找資料
	public Center findCenterById(Integer centerId) {
		Optional<Center> result = centerRepository.findById(centerId);
		if(result.isEmpty()) {
			return null;
		}

		return result.get();
	}
	
	//新增
	public Center addCenter(Center center) {
		Center result = centerRepository.save(center);
		return result;
	}
	
	//刪除
	public boolean deleteCenterById(Integer centerId) {
		// 確認db有這筆資料
		Optional<Center> result = centerRepository.findById(centerId);
		if (result.isEmpty()) {
			return false;
		}
		// 執行刪除
		centerRepository.deleteById(centerId);
		return true;
	}
//	public String deleteCenterById(String CenterId) {
//		centerRepository.deleteById(CenterId);
//		return CenterId;
//	}
	
	
	
	//修改

	
	public Center updateCenter(Center center) {
		Center result = centerRepository.save(center);
		return result;
	}
	
	
//	public boolean updateCenter(Center center) {
//		Optional<Center> result = centerRepository.findById(center.getCenterId());
//		if(result.isEmpty()) {
//			return false;
//		}
//		
//		Center originalCenter = result.get();
//		
//		originalCenter=center;
//		
//		try {
//			centerRepository.saveAndFlush(originalCenter);
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//			return false;
//		}
//		return true;
//	}
	
	

}
