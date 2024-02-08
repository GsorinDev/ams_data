# Use an official OpenJDK 17 image as a parent image
FROM maven:3.8.5-openjdk-17

# Set the working directory inside the container
WORKDIR /app

# Copy the application JAR file into the container at /app
COPY ./ams_data-0.0.1-SNAPSHOT.jar /app/

# Run the application when the container launches
CMD ["java", "-jar", "ams_data-0.0.1-SNAPSHOT.jar"]   
                                                
# Make port 8081 available to the world outside this container
EXPOSE 8081
