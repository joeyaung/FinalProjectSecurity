package tw.com.finalproject.kevinLai.Center.Service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.com.finalproject.kevinLai.Center.Center;
import tw.com.finalproject.kevinLai.Center.Repository.CenterRepository;
import tw.com.finalproject.naiChuan.Retailer.Retailer;
import tw.com.finalproject.yumyu.Utils.ImgConverter;


@Service
@Transactional
public class CenterService {
	
	@Autowired
	private CenterRepository centerRepository;
	
//	//尋找全部
//	public List<Center> queryCenterAll(){
//		List<Center> result = centerRepository.findAll();
//		if(result.isEmpty()) {
//			return null;
//		}
//		return result;
//	}
	
	//尋找全部 (有圖片)v
	public List<Center> queryCenterAll(){
		List<Center> result = centerRepository.findAll();
		for(int i=0; i<result.size();i++) {
			try {
				String base64str = ImgConverter.ByteConvertToBase64(result.get(i).getCenterImage());
				result.get(i).setCenterBase64Image(base64str);
				
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	
//	//用id尋找資料
//	public Center findCenterById(Integer centerId) {
//		Optional<Center> result = centerRepository.findById(centerId);
//		if(result.isEmpty()) {
//			return null;
//		}
//
//		return result.get();
//	}
	
	
	//用id尋找資料 (有圖片)v
	public Center findCenterById(Integer centerId) throws Exception {
		Optional<Center> result = centerRepository.findById(centerId);
		if(result.isEmpty()) {
			throw new Exception();
		}
		byte[] bytes = result.get().getCenterImage();
		String base64str = ImgConverter.ByteConvertToBase64(bytes);
		result.get().setCenterBase64Image(base64str);
		return result.get();
	}
	
	
//	//新增
//	public Center addCenter(Center center) {
//		Center result = centerRepository.save(center);
//		return result;
//	}
	
	//新增(有圖片)
	public Center addCenter(Center center) {
		if (!center.getCenterFile().isEmpty()) {
			center.setCenterImage(ImgConverter.convertToBytesArrays(center.getCenterFile()));
		}
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


	
	
//	//修改
//	public Center updateCenter(Center center) {
//		Center result = centerRepository.save(center);
//		return result;
//	}
	
	
	//修改(有圖片)
	public Center updateCenter(Center center)  {
		if (!center.getCenterFile().isEmpty()) {
			byte[] bytes = ImgConverter.convertToBytesArrays(center.getCenterFile());
			center.setCenterImage(bytes);
			String base64 = ImgConverter.ByteConvertToBase64(bytes);
			center.setCenterBase64Image(base64);
		}
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
