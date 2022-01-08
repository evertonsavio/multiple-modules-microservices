package dev.evertonsavio.app;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

@Configuration
@ConfigurationProperties(prefix = "main-service")
public class AppConfigData {

    private String myCommonVar;

    public AppConfigData() {
    }

    public String getMyCommonVar() {
        return myCommonVar;
    }

    public void setMyCommonVar(String myCommonVar) {
        this.myCommonVar = myCommonVar;
    }
}
