package tw.com.finalproject.yumyu.Initial;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Arrays;

import javax.transaction.Transactional;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.finalproject.shellyYang.Event.Event;
import tw.com.finalproject.shellyYang.Event.Service.EventService;

@Service
@Transactional
public class DefaultEvent {
	
	@Autowired
	private EventService eventService;
	
//	Default Events Data
	public void createDefaultEventData() throws IOException {

		File img1 = new File("src/main/resources/static/images/eventsphotos/event_img1.jpeg");

		FileInputStream is1 = new FileInputStream(img1);
		byte[] b1 = IOUtils.toByteArray(is1);

		Event defaultEvent1 = Event.builder().event_title("Touring Festival").event_subtitle("千名車友參加大展品牌風尚魅力")
				.event_uploaddate("2021-08-20").reserve_start_date("2021-08-31").reserve_end_date("2021-09-20")
				.event_date("2021-10-10").location("台中麗寶落羽松林大草皮").attend_limit(1500).reserved_people(1000)
				.event_content(
						"在Audi的理念中，豐富車主的日常是品牌持續追尋的目標。把握天氣微涼的暮春之際，Audi於10月25日在台中麗寶落羽松林大草皮舉辦「Touring Festival」，集結全台最懂生活的BMW車主們，在Touring車款的陪伴下，愜意徜徉在溫暖微風之中，大啖餐車美食、享受Live搖滾樂、體驗風格DIY手做課程，以車會友、相互交流，現場氣氛熱絡、笑聲不絕於耳，「Touring Festival」年度野遊盛典用風格玩出品味生活新高度。'\n")
				.event_img(b1).build();

		File img2 = new File("src/main/resources/static/images/eventsphotos/event_img2.jpg");

		FileInputStream is2 = new FileInputStream(img2);
		byte[] b2 = IOUtils.toByteArray(is2);

		Event defaultEvent2 = Event.builder().event_title("The Audi e-tron 55 ２天１夜【純電之旅】")
				.event_subtitle("敬邀試駕或線上賞車服務體驗，即有機會獲得 Audi e-tron 2 天 1 夜【純電之旅】。").event_uploaddate("2021-07-31")
				.reserve_start_date("2021-08-10").reserve_end_date("2021-10-01").event_date("2021-11-01")
				.location("台北晶華酒店").attend_limit(200).reserved_people(50)
				.event_content("完成展間試駕或線上賞車服務，即有機會獲得 Audi e-tron 2 天 1 夜豪華飯店【純電之旅】。邀您一起體驗純電生活的魅力！").event_img(b2)
				.build();

		File img3 = new File("src/main/resources/static/images/eventsphotos/event_img4.jpg");

		FileInputStream is3 = new FileInputStream(img3);
		byte[] b3 = IOUtils.toByteArray(is3);

		Event defaultEvent3 = Event.builder().event_title("2021 Audi quattro Cup Taiwan")
				.event_subtitle("台灣奧迪自 2005 年成立以來，連年舉辦 Audi quattro Cup 車主杯高爾夫球賽").event_uploaddate("2021-08-20")
				.reserve_start_date("2021-09-01").reserve_end_date("2021-10-03").event_date("2021-10-15")
				.location("士林高爾夫練習場").attend_limit(30).reserved_people(30)
				.event_content(
						"台灣奧迪自 2005 年成立以來，連年舉辦 Audi quattro Cup 車主杯高爾夫球賽，期望能提供優質的高爾夫球活動以增進 Audi 車主們對 Audi 品牌的喜愛與支持，\n"
								+ "並且以球會友，以服務 Audi 車主為職志。")
				.event_img(b3).build();

		File img4 = new File("src/main/resources/static/images/eventsphotos/event_img5.jpg");

		FileInputStream is4 = new FileInputStream(img4);
		byte[] b4 = IOUtils.toByteArray(is4);

		Event defaultEvent4 = Event.builder().event_title("悅動未來 Inspire the Future設計徵選")
				.event_subtitle("台灣奧迪自創立以來，始終秉持以人為本的設計理念，持續突破、創新，致力於打造人性化的未來移動空間。").event_uploaddate("2021-08-02")
				.reserve_start_date("2021-08-10").reserve_end_date("2021-09-30").event_date("2021-10-10")
				.location("線上活動").attend_limit(500).reserved_people(300)
				.event_content(
						"今年首度發起「Inspire the Future設計徵選」活動，為台灣年輕設計師打造一個嶄露頭角的絕佳舞台，並邀請到跨界國民主持 黃子佼、金曲獎視覺統籌暨設計師 顏伯駿、藝術策展人/演員 丁春誠、金馬獎指定官方造型師暨時尚部落客 不理姬關擔任評審，最終獲選者所創作出的聖誕禮盒將於「兒童福利聯盟文教基金會」平台進行募款，募得款項將全數捐予協會，用於兒童福利相關事務，為需要幫助的孩童創造一個更美好的世界。")
				.event_img(b4).build();

		File img5 = new File("src/main/resources/static/images/eventsphotos/event_img6.jpeg");

		FileInputStream is5 = new FileInputStream(img5);
		byte[] b5 = IOUtils.toByteArray(is5);

		Event defaultEvent5 = Event.builder().event_title("Inspire the Future 2021 Kids Campus")
				.event_subtitle(
						"長久以來致力於推廣兒童交通安全教育的Audi，不僅持續耕耘交通安全教育的推廣與知識傳播，更持續舉辦Audi Kids Campus超過10年以上，落實公益、實踐企業社會責任")
				.event_uploaddate("2021-08-11").reserve_start_date("2021-08-16").reserve_end_date("2021-09-20")
				.event_date("2021-09-30").location("線上活動").attend_limit(400).reserved_people(350)
				.event_content(
						"今年，為降低人群接觸保持最佳安全社交距離，Audi將實體活動轉化為線上形式，自2021年8月20日至8月29日於線上盛大舉辦「2021 Audi Kids Campus」，並自8月11日中午12:00開放網路報名，報名費用將全數捐贈兒童福利聯盟文教基金會，以實際行動展現Audi實踐企業社會責任的熱忱與理念，邀請更多人一同響應公益，讓愛與關懷無遠弗屆。2021 Audi Kids Campus報名網站 9月24日中午12:00正式上線")
				.event_img(b5).build();

		eventService.saveAll(Arrays.asList(defaultEvent1, defaultEvent2, defaultEvent3, defaultEvent4, defaultEvent5));

	}


}
