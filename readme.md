# e-Bitware Practical Exam Project

This repository contains solutions for the e-Bitware practical exam, including a Spring Boot REST API, a Node.js script for CSV processing, Kubernetes configurations, and PostgreSQL SQL scripts.

## Requirements

- Minikube
- Docker (optional, for local testing with Docker Compose)

Note: All other dependencies (Java, Node.js, PostgreSQL, MongoDB) are automatically installed when running `minikube kubectl -- apply -f .` in the kubernetes folder. Only Minikube is required to be installed.

## Project Structure

```
.
├── db/                    # SQL scripts for PostgreSQL
├── kubernetes/            # Kubernetes configuration files
├── scrapper/              # Node.js script for CSV processing
├── src/                   # Source code for Spring Boot REST API
├── docker-compose.yml     # Docker Compose configuration
└── README.md              # This file
```

## Kubernetes Deployment

To deploy services locally using Minikube, follow these steps:

1. Ensure Minikube is installed and running.
2. Navigate to the `kubernetes/` folder of the project.
3. Run the following command:

   ```
   minikube kubectl -- apply -f .
   ```

This command will deploy the following services:

- MongoDB
- PostgreSQL
- Spring Boot application

## Docker Compose Deployment

To test the application locally using Docker Compose:

1. Ensure Docker and Docker Compose are installed.
2. From the project root, run:

   ```
   docker-compose up
   ```

This will start all services defined in the `docker-compose.yml` file.

## API Docker Image

The Docker image for the Spring Boot API is available on Docker Hub:

[https://hub.docker.com/r/oscarcode/springboot-app-bitware](https://hub.docker.com/r/oscarcode/springboot-app-bitware)

You can use this image in your Kubernetes or Docker Compose deployments.

## CSV Processing

To run the script that processes the CSV file and saves data to MongoDB:

1. Navigate to the project root folder.
2. Run:

   ```
   node scrapper/index.js
   ```

## Database Exercises

SQL scripts for the database exercises are located in the `db/` folder. These include:

- Script to populate tables
- Queries for requested reports

## Additional Notes

- The Spring Boot REST API is located in the `src/` folder.
- To run the Spring Boot application locally, you can use the command `./mvnw spring-boot:run` from the project root.
- Ensure you have the necessary dependencies installed before running any part of the project outside of Kubernetes or Docker.

For more details on each component, please contact me [oscar.martinez.mtz.97@gmail.com](oscar.martinez.mtz.97@gmail.com) 
