package tw.com.finalproject.yumyu.PayPal.Config;

import org.springframework.stereotype.Component;

import com.paypal.core.PayPalEnvironment;
import com.paypal.core.PayPalHttpClient;

@Component
public class Credentials {
	static String clientId = "AcdT7DRp0_suFQ0Ox_P_-YFZwTobRJk4_k2Vy_Ikl1bxD5dBVhHInCEL-PGTVjDuFI7M7arTCHbwfe_p";
    static String secret = "EFIJIjdMTg5wwCeRUvCP0OxZgWIOAlf9-yAYfm5Bp2HhYO0tV7WVSdshGp5ngQ0NR12eyhfqAmsWlD_L";
    
    // Creating a sandbox environment
    private static PayPalEnvironment environment = new PayPalEnvironment.Sandbox(clientId, secret);
    
    // Creating a client for the environment
    public static PayPalHttpClient client = new PayPalHttpClient(environment);

}
