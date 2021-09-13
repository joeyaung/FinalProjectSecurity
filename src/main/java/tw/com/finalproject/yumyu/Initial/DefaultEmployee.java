package tw.com.finalproject.yumyu.Initial;

import static tw.com.finalproject.yumyu.Enums.ApplicationRoles.ADMIN;
import static tw.com.finalproject.yumyu.Enums.ApplicationRoles.DELIVER;
import static tw.com.finalproject.yumyu.Enums.ApplicationRoles.SALES;
import static tw.com.finalproject.yumyu.Enums.ApplicationRoles.SERVICE;
import static tw.com.finalproject.yumyu.Enums.OfficeLocations.KAOSHIUNG;
import static tw.com.finalproject.yumyu.Enums.OfficeLocations.TAICHUNG;
import static tw.com.finalproject.yumyu.Enums.OfficeLocations.TAINAN;
import static tw.com.finalproject.yumyu.Enums.OfficeLocations.TAIPEI;
import static tw.com.finalproject.yumyu.Enums.OfficeLocations.TAOYUAN;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import tw.com.finalproject.yumyu.InternalUse.Employee;
import tw.com.finalproject.yumyu.InternalUse.Service.EmployeeService;

@Service
@Transactional
public class DefaultEmployee {
	private static String firstName = "趙錢孫李周吳鄭王馮陳褚衛蔣沈韓楊朱秦尤許何呂施張孔曹嚴華金魏陶姜戚謝鄒喻柏水竇章雲蘇潘葛奚範彭郎魯韋昌馬苗鳳花方俞任袁柳酆鮑史唐費廉岑薛雷賀倪湯滕殷羅畢郝鄔安常樂於時傅皮卞齊康伍餘元卜顧孟平黃和穆蕭尹姚邵湛汪祁毛禹狄米貝明臧計伏成戴談宋茅龐熊紀舒屈項祝董樑杜阮藍閔席季麻強賈路婁危江童顏郭梅盛林刁鍾徐邱駱高夏蔡田樊胡凌霍虞萬支柯咎管盧莫經房裘繆幹解應宗宣丁賁鄧鬱單杭洪包諸左石崔吉鈕龔程嵇邢滑裴陸榮翁荀羊於惠甄魏加封芮羿儲靳汲邴糜鬆井段富巫烏焦巴弓牧隗山谷車侯宓蓬全郗班仰秋仲伊宮寧仇欒暴甘鈄厲戎祖武符劉姜詹束龍葉幸司韶郜黎薊薄印宿白懷蒲臺從鄂索鹹籍賴卓藺屠蒙池喬陰鬱胥能蒼雙聞莘黨翟譚貢勞逄姬申扶堵冉宰酈雍卻璩桑桂濮牛壽通邊扈燕冀郟浦尚農溫別莊晏柴瞿閻充慕連茹習宦艾魚容向古易慎戈廖庚終暨居衡步都耿滿弘匡國文寇廣祿闕東毆殳沃利蔚越夔隆師鞏厙聶晁勾敖融冷訾辛闞那簡饒空曾毋沙乜養鞠須豐巢關蒯相查後江紅遊竺權逯蓋益桓公万俟司馬上官歐陽夏侯諸葛聞人東方赫連皇甫尉遲公羊澹臺公冶宗政濮陽淳于仲孫太叔申屠公孫樂正軒轅令狐鍾離閭丘長孫慕容鮮于宇文司徒司空亓官司寇仉督子車顓孫端木巫馬公西漆雕樂正壤駟公良拓拔夾谷宰父谷粱晉楚閻法汝鄢塗欽段幹百里東郭南門呼延歸海羊舌微生嶽帥緱亢況後有琴樑丘左丘東門西門商牟佘佴伯賞南宮墨哈譙笪年愛陽佟第五言福百家姓續";
	private static String girl = "秀娟英華慧巧美娜靜淑惠珠翠雅芝玉萍紅娥玲芬芳燕彩春菊蘭鳳潔梅琳素雲蓮真環雪榮愛妹霞香月鶯媛豔瑞凡佳嘉瓊勤珍貞莉桂娣葉璧璐婭琦晶妍茜秋珊莎錦黛青倩婷姣婉嫻瑾穎露瑤怡嬋雁蓓紈儀荷丹蓉眉君琴蕊薇菁夢嵐苑婕馨瑗琰韻融園藝詠卿聰瀾純毓悅昭冰爽琬茗羽希寧欣飄育瀅馥筠柔竹靄凝曉歡霄楓芸菲寒伊亞宜可姬舒影荔枝思麗 ";
	private static String boy = "偉剛勇毅俊峰強軍平保東文輝力明永健世廣志義興良海山仁波寧貴福生龍元全國勝學祥才發武新利清飛彬富順信子傑濤昌成康星光天達安巖中茂進林有堅和彪博誠先敬震振壯會思群豪心邦承樂紹功鬆善厚慶磊民友裕河哲江超浩亮政謙亨奇固之輪翰朗伯巨集言若鳴朋斌樑棟維啟克倫翔旭鵬澤晨辰士以建家致樹炎德行時泰盛雄琛鈞冠策騰楠榕風航弘";

	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private PasswordEncoder passwordEncoder;

	public boolean create(int total) {
		List<Employee> resultList = new ArrayList<>();

//		Default ADMIN ROLE
		Employee defaultAdmin = Employee.builder().username("admin@demo.com").password(passwordEncoder.encode("asd"))
				.roles(ADMIN.name()).fullName("Joe Yu").phone("09179220177").title("CEO").department("Admin Office")
				.location(TAIPEI.name()).salary(1).build();

//		Default SALES ROLE
		Employee defaultSales = Employee.builder().username("sales@demo.com").password(passwordEncoder.encode("asd"))
				.roles(SALES.name()).fullName("Andy Chen").phone("0987987987").title("CES").department("Sales")
				.location(TAICHUNG.name()).salary(50000).manager(defaultAdmin).build();
		resultList.add(defaultAdmin);
		resultList.add(defaultSales);

		for (int i = 0; i < total; i++) {
			String role = generateRandomROLE();
			Employee newEmployee = Employee.builder().username(generateRandomUserName())
					.password(passwordEncoder.encode("asd")).roles(role).fullName(generateRandomFullName())
					.phone(generateRandomPhone()).title(generateTitle(role)).department(generateDepartment(role))
					.location(generateRandomLocation()).salary(generateRandomSalary()).build();
			resultList.add(newEmployee);
		}
		boolean result = employeeService.saveAll(resultList);
		if (result) {
			return true;
		} else {
			return false;
		}
	}

	private String generateRandomUserName() {
		String SALTCHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890abcdefghijklmnopqrstuvwxyz";
		StringBuilder salt = new StringBuilder();
		Random rnd = new Random();
		while (salt.length() < 10) { // length of the random string.
			int index = (int) (rnd.nextFloat() * SALTCHARS.length());
			salt.append(SALTCHARS.charAt(index));
		}
		String saltStr = salt.toString();
		return saltStr + "@gmail.com";
	}

	private String generateRandomROLE() {
		String base[] = { SALES.name(), SALES.name(), SALES.name(), SALES.name(), SALES.name(), DELIVER.name(),
				SERVICE.name() };
		int index = getNum(0, base.length - 1);
		return base[index];
	}

	@SuppressWarnings("unused")
	private String generateRandomFullName() {
		String name_sex = "";
		int index = getNum(0, firstName.length() - 1);
		String first = firstName.substring(index, index + 1);
		int sex = getNum(0, 1);
		String str = boy;
		int length = boy.length();
		if (sex == 0) {
			str = girl;
			length = girl.length();
			name_sex = "女";
		} else {
			name_sex = "男";
		}
		index = getNum(0, length - 1);
		String second = str.substring(index, index + 1);
		int hasThird = getNum(0, 1);
		String third = "";
		if (hasThird == 1) {
			index = getNum(0, length - 1);
			third = str.substring(index, index + 1);
		}
		return first + second + third;
	}

	public String generateRandomPhone() {
		String prefix = "09";
		String base = "0123456789";
		StringBuilder sb = new StringBuilder();
		sb.append(prefix);
		for (int i = 0; i < 8; i++) {
			int index = getNum(0, 9);
			String curNumber = base.substring(index, index + 1);
			sb.append(curNumber);
		}
		return sb.toString();
	}

	private String generateTitle(String employeeRole) {

		if (employeeRole.equals(SALES.name())) {
			return "Customer Experience Specialist";
		} else if (employeeRole.equals(ADMIN.name())) {
			return "Administrator";
		} else if (employeeRole.equals(DELIVER.name())) {
			return "Delivery Experience Specialist";
		} else {
			return "Customer Support";
		}
	}

	private String generateDepartment(String employeeRole) {
		if (employeeRole.equals(SALES.name())) {
			return "Sales Team";
		} else if (employeeRole.equals(ADMIN.name())) {
			return "Admin Office";
		} else if (employeeRole.equals(DELIVER.name())) {
			return "Delivery Team";
		} else {
			return "Customer Support Team";
		}
	}

	private String generateRandomLocation() {
		String base[] = { TAIPEI.name(), TAOYUAN.name(), TAICHUNG.name(), TAINAN.name(), KAOSHIUNG.name() };
		int index = getNum(0, base.length - 1);
		return base[index];
	}

	private int generateRandomSalary() {
		return getNum(30000, 80000);
	}

	private int getNum(int start, int end) {
		return (int) ((Math.random() * (end - start + 1)) + start);
	}
}
