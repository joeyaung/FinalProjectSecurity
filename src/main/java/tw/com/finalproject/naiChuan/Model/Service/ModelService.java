package tw.com.finalproject.naiChuan.Model.Service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.remoting.soap.SoapFaultException;
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
		// 確認所有圖都存在，再寫入所有圖	
		
		if (model.getOuterFile() != null && model.getInnerFile() != null && model.getBackgroundFile() != null && 
			model.getAngle1File() != null && model.getAngle4File() != null && model.getAngle7File() != null && model.getAngle10File() != null
				&& model.getAngle13File() != null && model.getAngle16File() != null && model.getAngle19File() != null ) {
		
		if (!model.getOuterFile().isEmpty() && !model.getInnerFile().isEmpty() && !model.getBackgroundFile().isEmpty() && 
			!model.getAngle1File().isEmpty() && !model.getAngle4File().isEmpty() && !model.getAngle7File().isEmpty() && !model.getAngle10File().isEmpty()
			&& !model.getAngle13File().isEmpty() && !model.getAngle16File().isEmpty() && !model.getAngle19File().isEmpty() ) {
			model.setExterior(ImgConverter.convertToBytesArrays(model.getOuterFile()));
			model.setInterior(ImgConverter.convertToBytesArrays(model.getInnerFile()));
			model.setBackground(ImgConverter.convertToBytesArrays(model.getBackgroundFile()));
			model.setAngle1(ImgConverter.convertToBytesArrays(model.getAngle1File()));
			model.setAngle4(ImgConverter.convertToBytesArrays(model.getAngle4File()));
			model.setAngle7(ImgConverter.convertToBytesArrays(model.getAngle7File()));
			model.setAngle10(ImgConverter.convertToBytesArrays(model.getAngle10File()));
			model.setAngle13(ImgConverter.convertToBytesArrays(model.getAngle13File()));
			model.setAngle16(ImgConverter.convertToBytesArrays(model.getAngle16File()));
			model.setAngle19(ImgConverter.convertToBytesArrays(model.getAngle19File()));
		}
		}
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
		// 新資料有放圖就把新圖寫入，否則用原圖-outer
		if ( !model.getOuterFile().isEmpty() ) {
			byte[] byteOuter = ImgConverter.convertToBytesArrays(model.getOuterFile());
			model.setExterior(byteOuter);
			model.setOuterBase64Image(ImgConverter.ByteConvertToBase64(byteOuter));
		} else {
			model.setExterior(result.get().getExterior());
			model.setOuterBase64Image(ImgConverter.ByteConvertToBase64(result.get().getExterior()));
		}
		// 新資料有放圖就把新圖寫入，否則用原圖-inner
		if ( !model.getInnerFile().isEmpty() ) {
			byte[] byteInner = ImgConverter.convertToBytesArrays(model.getInnerFile());
			model.setInterior(byteInner);
			model.setInnerBase64Image(ImgConverter.ByteConvertToBase64(byteInner));
		} else {
			model.setInterior(result.get().getInterior());
			model.setInnerBase64Image(ImgConverter.ByteConvertToBase64(result.get().getInterior()));
		}		
		// 新資料有放圖就把新圖寫入，否則用原圖-bg
		if ( !model.getBackgroundFile().isEmpty() ) {
			byte[] byteBg = ImgConverter.convertToBytesArrays(model.getBackgroundFile());
			model.setBackground(byteBg);
			model.setBackgroundBase64Image(ImgConverter.ByteConvertToBase64(byteBg));
		} else {
			model.setBackground(result.get().getBackground());
			model.setBackgroundBase64Image(ImgConverter.ByteConvertToBase64(result.get().getBackground()));
		}		
		// angle
		if ( !model.getAngle1File().isEmpty() ) {
			byte[] byteAn1 = ImgConverter.convertToBytesArrays(model.getAngle1File());
			model.setAngle1(byteAn1);
			model.setAngle1Base64Image(ImgConverter.ByteConvertToBase64(byteAn1));
		} else {
			model.setAngle1(result.get().getAngle1());
			model.setAngle1Base64Image(ImgConverter.ByteConvertToBase64(result.get().getAngle1()));
		}
		if ( !model.getAngle4File().isEmpty() ) {
			byte[] byteAn4 = ImgConverter.convertToBytesArrays(model.getAngle4File());
			model.setAngle4(byteAn4);
			model.setAngle4Base64Image(ImgConverter.ByteConvertToBase64(byteAn4));
		} else {
			model.setAngle4(result.get().getAngle4());
			model.setAngle4Base64Image(ImgConverter.ByteConvertToBase64(result.get().getAngle4()));
		}
		if ( !model.getAngle7File().isEmpty() ) {
			byte[] byteAn7 = ImgConverter.convertToBytesArrays(model.getAngle7File());
			model.setAngle7(byteAn7);
			model.setAngle7Base64Image(ImgConverter.ByteConvertToBase64(byteAn7));
		} else {
			model.setAngle7(result.get().getAngle7());
			model.setAngle7Base64Image(ImgConverter.ByteConvertToBase64(result.get().getAngle7()));
		}
		if ( !model.getAngle10File().isEmpty() ) {
			byte[] byteAn10 = ImgConverter.convertToBytesArrays(model.getAngle10File());
			model.setAngle10(byteAn10);
			model.setAngle10Base64Image(ImgConverter.ByteConvertToBase64(byteAn10));
		} else {
			model.setAngle10(result.get().getAngle10());
			model.setAngle10Base64Image(ImgConverter.ByteConvertToBase64(result.get().getAngle10()));
		}
		if ( !model.getAngle13File().isEmpty() ) {
			byte[] byteAn13 = ImgConverter.convertToBytesArrays(model.getAngle13File());
			model.setAngle13(byteAn13);
			model.setAngle13Base64Image(ImgConverter.ByteConvertToBase64(byteAn13));
		} else {
			model.setAngle13(result.get().getAngle13());
			model.setAngle13Base64Image(ImgConverter.ByteConvertToBase64(result.get().getAngle13()));
		}
		if ( !model.getAngle16File().isEmpty() ) {
			byte[] byteAn16 = ImgConverter.convertToBytesArrays(model.getAngle16File());
			model.setAngle16(byteAn16);
			model.setAngle16Base64Image(ImgConverter.ByteConvertToBase64(byteAn16));
		} else {
			model.setAngle16(result.get().getAngle16());
			model.setAngle16Base64Image(ImgConverter.ByteConvertToBase64(result.get().getAngle16()));
		}
		if ( !model.getAngle19File().isEmpty() ) {
			byte[] byteAn19 = ImgConverter.convertToBytesArrays(model.getAngle19File());
			model.setAngle19(byteAn19);
			model.setAngle19Base64Image(ImgConverter.ByteConvertToBase64(byteAn19));
		} else {
			model.setAngle19(result.get().getAngle19());
			model.setAngle19Base64Image(ImgConverter.ByteConvertToBase64(result.get().getAngle19()));
		}
		
		
		// 執行修改
		try {
			modelRepository.saveAndFlush(model);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	
}
