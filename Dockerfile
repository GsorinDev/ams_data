# Utiliser une image OpenJDK 17 officielle comme image parent
FROM maven:3.9.6-sapmachine-17

# Définir le répertoire de travail à l'intérieur du conteneur
WORKDIR /app

# Copier tout le projet dans le conteneur
COPY . /app

RUN mvn --version

# Construire le projet avec Maven
RUN mvn clean package -DskipTests

# Exécuter l'application lorsque le conteneur démarre
CMD ["java", "-jar", "/app/target/ams_data-0.0.1-SNAPSHOT.jar"]

# Rendre le port 8081 disponible pour le monde extérieur à ce conteneur
EXPOSE 8081