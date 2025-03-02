package com.backend.backendFashion;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class BackendFashionApplication {

	public static void main(String[] args) {
        // Si deseas, puedes imprimir alguna variable para verificar la carga:
		String appName = System.getenv("SPRING_APPLICATION_NAME");
        String dbName  = System.getenv("POSTGRES_DB");

        System.out.println("Nombre de la aplicación: " + appName);
        System.out.println("Postgres DB: " + dbName);
		SpringApplication.run(BackendFashionApplication.class, args);
	}

}
