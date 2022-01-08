### Microservices Multi Modules  
1. Create a clean spring boot project without dependencies
2. delete src & target folders
3. change pom.xml file, include packaging as pom for use as base configuration:
```
<packaging>pom</packaging>
```
4. add dependencyManagement and put all dependencies inside it, this is allow manage all dependecies inside this pom.xml
```
	<dependencyManagement>
		<dependencies>
			<dependency>
				<groupId>org.springframework.boot</groupId>
				<artifactId>spring-boot-starter</artifactId>
			</dependency>

			<dependency>
				<groupId>org.springframework.boot</groupId>
				<artifactId>spring-boot-starter-test</artifactId>
				<scope>test</scope>
			</dependency>
		</dependencies>
	</dependencyManagement>
```

5. add version of spring boot, to manage all version in a single place
```
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
	<modelVersion>4.0.0</modelVersion>
	<parent>
		<groupId>org.springframework.boot</groupId>
		<artifactId>spring-boot-starter-parent</artifactId>
		<version>2.3.3.RELEASE</version>
		<relativePath/> <!-- lookup parent from repository -->
	</parent>
	<groupId>dev.evertonsavio.app</groupId>
	<artifactId>Microservices-Multi-Modules</artifactId>
	<version>0.0.1-SNAPSHOT</version>
	<name>microservices-multi-modules</name>
	<description>Microservices multi modules</description>

	<packaging>pom</packaging>

	<properties>
		<java.version>11</java.version>
		<spring-boot.version>2.3.3.RELEASE</spring-boot.version>
	</properties>

	<dependencyManagement>
		<dependencies>
			<dependency>
				<groupId>org.springframework.boot</groupId>
				<artifactId>spring-boot-starter</artifactId>
				<version>${spring-boot.version}}</version>
			</dependency>

			<dependency>
				<groupId>org.springframework.boot</groupId>
				<artifactId>spring-boot-starter-test</artifactId>
				<version>${spring-boot.version}}</version>
				<scope>test</scope>
			</dependency>
		</dependencies>
	</dependencyManagement>

</project>
```

6. add pluginManagement and version
```
	<build>
		<pluginManagement>
			<plugins>
				<plugin>
					<groupId>org.springframework.boot</groupId>
					<artifactId>spring-boot-maven-plugin</artifactId>
					<version>${spring-boot.version}}</version>
				</plugin>
			</plugins>
		</pluginManagement>
	</build>
```
7. set maven plugin compiler
8. ```
   		<plugins>
			<plugin>
				<groupId>org.apache.maven.plugins</groupId>
				<artifactId>maven-compiler-plugin</artifactId>
				<version>${maven-compiler-plugin.version}</version>
				<configuration>
					<release>11</release>
				</configuration>
			</plugin>
		</plugins>
   ```