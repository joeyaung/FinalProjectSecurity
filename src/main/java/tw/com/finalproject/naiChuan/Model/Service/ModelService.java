package tw.com.finalproject.naiChuan.Model.Service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.finalproject.naiChuan.Model.Model;
import tw.com.finalproject.naiChuan.Model.Repository.ModelRepository;
import tw.com.finalproject.yumyu.Utils.ImgConverter;

@Service
@Transactional
public class ModelService {
	
	@Autowired
	private ModelRepository modelRepository;
	
	// 新增 create post
	public Model createModel(Model model) {
		Model result = modelRepository.save(model);
		return result;
	}

	// 查詢單一 find 1 get 1
	public Model findByIdModel(String modelType) {
		Optional<Model> result = modelRepository.findById(modelType);
		if (result.isEmpty()) {
			return null;
		}
		return result.get();
	}
	
	// 查詢全部 find All get All
	public List<Model> findAllModel() {
		List<Model> result = modelRepository.findAll();
		
		if (result.isEmpty()) {
			return null;
		}
		
		for (int i = 0; i < result.size(); i++) {
			try {
				String exBase64str = ImgConverter.ByteConvertToBase64(result.get(i).getExterior());
				result.get(i).setOuterBase64Image(exBase64str);
				String inBase64str = ImgConverter.ByteConvertToBase64(result.get(i).getInterior());
				result.get(i).setInnerBase64Image(inBase64str);
				
				String bgBase64str = ImgConverter.ByteConvertToBase64(result.get(i).getBackground());
				result.get(i).setBackgroundBase64Image(bgBase64str);
				
				String an1Base64str = ImgConverter.ByteConvertToBase64(result.get(i).getAngle1());
				result.get(i).setAngle1Base64Image(an1Base64str);
				
				String an4Base64str = ImgConverter.ByteConvertToBase64(result.get(i).getAngle4());
				result.get(i).setAngle4Base64Image(an4Base64str);
				
				String an7Base64str = ImgConverter.ByteConvertToBase64(result.get(i).getAngle7());
				result.get(i).setAngle7Base64Image(an7Base64str);
				
				String an10Base64str = ImgConverter.ByteConvertToBase64(result.get(i).getAngle10());
				result.get(i).setAngle10Base64Image(an10Base64str);
				
				String an13Base64str = ImgConverter.ByteConvertToBase64(result.get(i).getAngle13());
				result.get(i).setAngle13Base64Image(an13Base64str);
				
				String an16Base64str = ImgConverter.ByteConvertToBase64(result.get(i).getAngle16());
				result.get(i).setAngle16Base64Image(an16Base64str);
				
				String an19Base64str = ImgConverter.ByteConvertToBase64(result.get(i).getAngle19());
				result.get(i).setAngle19Base64Image(an19Base64str);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}

	// 刪除 delete
	public boolean deleteByIdModel(String modelType) {
		// 確認db有這筆資料
		Optional<Model> result = modelRepository.findById(modelType);
		if (result.isEmpty()) {
			return false;
		}
		// 執行刪除
		modelRepository.deleteById(modelType);
		// 同上
		// modelRepository.deleteById(result.get().getModelType());
		return true;
	}

	// 修改 update put
	public boolean updateModel(Model model) {
		// 確認db有這筆資料
		Optional<Model> result = modelRepository.findById(model.getModelType());
		if (result.isEmpty()) {
			return false;
		}
		// 執行修改
		Model newModel = result.get();
		newModel = model;
		try {
			modelRepository.saveAndFlush(newModel);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	
}
