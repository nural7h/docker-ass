package viadoc.docass;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.net.InetAddress;
import java.net.UnknownHostException;

@SpringBootApplication
public class DocAssApplication {

	public static void main(String[] args) {
		try {
			InetAddress localhost = InetAddress.getLocalHost();
			System.out.println("IP Address of localhost: " + localhost.getHostAddress());
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}

        SpringApplication.run(DocAssApplication.class, args);
	}

}
