
# Spring Boot Docker Application with MySQL

This project demonstrates a simple Spring Boot application running inside Docker containers, connected to a MySQL database. It includes a `/users` endpoint that returns a list of users.

## Prerequisites

Make sure you have the following installed on your system:

- **Docker**: [Install Docker](https://docs.docker.com/get-docker/)
- **Docker Compose**: [Install Docker Compose](https://docs.docker.com/compose/install/)

## Getting Started

### Step 1: Clone the repository

Clone this repository to your local machine:

```bash
git clone https://github.com/sallemiahmed/springboot-docker.git
cd springboot-docker
```

### Step 2: Build the Docker Images

First, ensure Docker is running on your system. Then, build the Docker images by running the following command:

```bash
docker-compose build
```

This will build the Docker images for both the Spring Boot application and MySQL.

### Step 3: Run the Application

To start the Spring Boot application and MySQL database, run the following command:

```bash
docker-compose up
```

Docker Compose will start two containers:
- `springboot-app`: The Spring Boot application.
- `mysql-db`: The MySQL database.

### Step 4: Access the Application

Once the containers are up, you can access the Spring Boot application by navigating to:

```bash
http://localhost:8080/users
```

You should see a JSON response with a list of users:

```json
["User 1", "User 2", "User 3"]
```

### Step 5: Stop the Application

To stop the application and shut down the containers, press `Ctrl+C` in the terminal where Docker Compose is running, or run:

```bash
docker-compose down
```

This will stop and remove the containers.

## Project Structure

```plaintext
springboot-docker/
│
├── src/
│   └── main/
│       ├── java/com/example/springbootdocker/
│       │   ├── SpringbootDockerApplication.java   # Spring Boot main application
│       │   └── UserController.java                # REST Controller returning user data
│       └── resources/
│           └── application.properties             # Application configuration (MySQL connection details)
├── Dockerfile                                      # Dockerfile for the Spring Boot app
├── docker-compose.yml                              # Docker Compose file to run both MySQL and the Spring Boot app
└── README.md                                       # Project documentation
```

## Environment Variables

The `docker-compose.yml` file defines the MySQL environment variables:

```yaml
MYSQL_ROOT_PASSWORD: rootpassword
MYSQL_DATABASE: testdb
MYSQL_USER: testuser
MYSQL_PASSWORD: testpassword
```

You can change these variables as needed.

## License

This project is open source and available under the [MIT License](LICENSE).
