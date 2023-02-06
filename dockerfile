FROM eclipse-temurin:17-alpine as build
COPY .mvn .mvn                                               
COPY mvnw .                                                  
COPY pom.xml .                                               
COPY src src                                                 
RUN ./mvnw package                                        


FROM eclipse-temurin:17-alpine                            
COPY --from=build target/kotlin-api-0.0.1-SNAPSHOT.jar .         
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "kotlin-api-0.0.1-SNAPSHOT.jar"] 
