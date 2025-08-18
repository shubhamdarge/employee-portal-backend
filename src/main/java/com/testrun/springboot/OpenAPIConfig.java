package com.testrun.springboot;

import org.springframework.context.annotation.Configuration;

import io.swagger.v3.oas.annotations.OpenAPIDefinition;
import io.swagger.v3.oas.annotations.info.Info;

@Configuration
@OpenAPIDefinition(
		info = @Info(
				title = "My Demo API",
				version = "1.0",
				description = "My First Swagger implementation"
				)
		)
public class OpenAPIConfig {

}
