package dev.evertonsavio.app;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class MainServiceApplication implements CommandLineRunner {

    private final AppConfigData appConfigData;

    public MainServiceApplication(AppConfigData appConfigData) {
        this.appConfigData = appConfigData;
    }

    public static void main(String[] args) {
        SpringApplication.run(MainServiceApplication.class, args);
    }

    @Override
    public void run(String... args) throws Exception {
        System.out.println("App starts" + ". " + appConfigData.getMyCommonVar());
    }
}
