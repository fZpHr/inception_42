## Inception

Inception is a project at school 42 that focuses on virtualization and the use of Docker. The goal is to configure and manage Docker containers to simulate isolated environments. This project reinforces your understanding of virtualization, networks, and container management.

*For more information, please refer to the subject in the git.*

## Containers

The project includes the following services:

1. **WordPress && PHP**: A popular content management platform used for creating websites and blogs, and a server-side scripting language used for web development, necessary for running WordPress.

2. **Nginx**: A lightweight and high-performance web server that can be used as a reverse proxy to serve WordPress and manage web traffic.

3. **MariaDB**: An open-source relational database compatible with MySQL. MariaDB is used with WordPress to store site data.


## Installation

To install Inception, clone the project from the Git repository:

```bash
git clone git@github.com:fZpHr/inception_42.git
cd inception_42
```

## Usage

To use Inception, follow the configuration steps and execute the specified Docker commands. Here is a typical structure of the commands you will use:

1. **Build Docker images and start containers**:
    ```bash
    make
    ```

2. **Stop containers**:
    ```bash
    make stop
    ```
3. **Stop and delete containers**:
    ```bash
    make down
    ```

## Bonus containers

1. **Adminer**: A database management tool for interacting with SQL databases.

2. **FTP**: For file transfer related to WordPress.

3. **Static Website**: Custom static website.

5. **Redis Cache**: To add a caching layer to WordPress.

6. **Portainer**: A user-friendly Docker container manager that provides visual management and monitoring of containers.



