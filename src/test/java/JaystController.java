import com.ulisesbocchio.jasyptspringboot.annotation.EnableEncryptableProperties;
import org.jasypt.encryption.StringEncryptor;
import org.jasypt.util.text.BasicTextEncryptor;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes=JaystController.class)
@WebAppConfiguration
@EnableEncryptableProperties
public class JaystController {

    @Test
    public void testEncode() {
        BasicTextEncryptor encryptor = new BasicTextEncryptor();
        encryptor.setPassword("LC!xfBgz0R7rMXg1vgT2sO8rGqCQJX");
        System.out.println(encryptor.encrypt("sa"));
        System.out.println(encryptor.encrypt("JdQxJ123"));
    }
}
