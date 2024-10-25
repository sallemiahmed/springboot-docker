
# Spring Boot Docker Microservice Example

This project demonstrates a simple microservices architecture using **Spring Boot** and **MySQL** in two separate Docker containers. Each service runs in its own container, showcasing the benefit of using microservices with containerization.

## Project Structure

1. **Spring Boot Application**: This container runs the Spring Boot service responsible for interacting with the MySQL database to fetch user details.
2. **MySQL Database**: This container runs the MySQL database where user data is stored.

The communication between the two services happens through a network, as the services are decoupled and run independently in separate containers.

## Benefits of Microservices Architecture

- **Independence**: Each microservice (Spring Boot and MySQL in this case) is isolated, allowing independent development, deployment, and scaling. This decoupling enhances the flexibility of the system.
  
- **Scalability**: Individual components can be scaled as needed. For example, if the Spring Boot application needs more resources, we can spin up more instances of the application container without impacting the database service.

- **Resilience**: Since the services are independent, if one service fails (e.g., the MySQL container), the rest of the application can continue running, and only the failed service needs to be restored.

- **Continuous Deployment**: Changes can be made to one microservice without affecting others. This means you can push updates to the Spring Boot service or the MySQL database without requiring a complete system redeployment.

## Prerequisites

- Docker
- Docker Compose

## Instructions

1. **Clone the repository**:

   ```bash
   git clone https://github.com/sallemiahmed/springboot-docker.git
   cd springboot-docker
   ```

2. **Build and Run the Containers**:

   Use Docker Compose to build and start the containers:

   ```bash
   docker-compose up --build
   ```

   This command will:
   - Build the Spring Boot application and create a Docker image.
   - Spin up the MySQL database in a separate container.
   - Connect the two services through a Docker network.

3. **Access the Application**:

   After the containers are up and running, you can access the Spring Boot application at:

   ```
   http://localhost:8080/users
   ```

   This endpoint will return a list of users fetched from the MySQL database.

## How It Works

1. The Spring Boot application communicates with the MySQL container using the `jdbc:mysql://mysql-db:3306/userdb` connection string.
2. The database is pre-populated with some user data, which the Spring Boot application fetches and returns through its API.

## Example User Data

```json
[
    {
        "id": 1,
        "name": "Jane Smith",
        "email": "jane@example.com"
    },
    {
        "id": 2,
        "name": "John Doe",
        "email": "john@example.com"
    }
]
```

## Conclusion

This project demonstrates the benefits of a microservice architecture where the services are isolated in separate containers. This provides flexibility, scalability, and ease of maintenance, which are key advantages in modern software development.
