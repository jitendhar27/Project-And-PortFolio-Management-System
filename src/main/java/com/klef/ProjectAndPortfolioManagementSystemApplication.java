package com.klef;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@ComponentScan(basePackages = "com.klef")
@EntityScan(basePackages = "com.klef.model")
@EnableJpaRepositories(basePackages = "com.klef.repository")
public class ProjectAndPortfolioManagementSystemApplication {

	public static void main(String[] args) {
		SpringApplication.run(ProjectAndPortfolioManagementSystemApplication.class, args);
		System.out.println("Project is running...");
	}

}
