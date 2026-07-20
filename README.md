# Meat Grill Backend

Backend desarrollado con **Spring Boot**, **Hibernate/JPA** y **PostgreSQL 18** para la gestión de la aplicación Meat Grill.

El proyecto está preparado para ejecutarse mediante Docker y cuenta con integración continua usando GitHub Actions.

---

## Tecnologías utilizadas

* Java 25
* Spring Boot 4.1.0
* Spring Data JPA / Hibernate
* PostgreSQL 18
* Maven
* Docker
* Docker Compose
* GitHub Actions

---

## Estructura del proyecto

```text
meat-and-grill-project
│
├── src
│   ├── main
│   │   ├── java
│   │   └── resources
│   │       └── application.properties
│   │
│   └── test
│
├── Dockerfile
├── docker-compose.yml
├── pom.xml
│
└── .github
    └── workflows
        └── backend-ci.yml
```

---

# Configuración de base de datos

La aplicación utiliza PostgreSQL con la siguiente configuración:

```
Base de datos: meatandgrill
Usuario: postgres
Puerto: 5432
```

La conexión se configura mediante variables de entorno:

```properties
DB_URL
DB_USERNAME
DB_PASSWORD
```

Si no existen variables de entorno, la aplicación utiliza valores locales por defecto.

---

# Ejecución local con Docker

## Requisitos

Tener instalado:

* Docker
* Docker Compose

---

## Levantar la aplicación

Desde la raíz del proyecto:

```bash
docker compose up --build
```

Esto iniciará:

* PostgreSQL 18
* Backend Spring Boot

Servicios disponibles:

```
Backend:
http://localhost:8080

PostgreSQL:
localhost:5432
```

---

## Detener servicios

```bash
docker compose down
```

---

## Eliminar datos persistidos

Para eliminar también la información almacenada en PostgreSQL:

```bash
docker compose down -v
```

---

# Ejecución sin Docker

También es posible ejecutar el backend directamente desde el entorno local.

Requisitos:

* Java 25
* PostgreSQL 18

Crear una base de datos:

```sql
CREATE DATABASE meatandgrill;
```

Configurar las credenciales en:

```
src/main/resources/application.properties
```

Ejecutar:

```bash
mvn spring-boot:run
```

---

# Pruebas

Ejecutar pruebas del proyecto:

```bash
mvn clean verify
```

---

# Integración Continua (CI)

El proyecto utiliza GitHub Actions.

El workflow se encuentra en:

```
.github/workflows/backend-ci.yml
```

El CI se ejecuta cuando se realiza un push a:

```
feature/backend
```

El proceso realiza:

1. Descarga del código.
2. Configuración de Java 25.
3. Inicio de PostgreSQL 18 como servicio.
4. Ejecución de pruebas Maven.

---

# Docker

El backend utiliza un Dockerfile con dos etapas:

## Etapa de compilación

Utiliza:

```
maven:3.9.11-eclipse-temurin-25
```

para compilar el proyecto y generar el archivo `.jar`.

## Etapa de ejecución

Utiliza:

```
eclipse-temurin:25-jre
```

para ejecutar únicamente la aplicación.

Esto permite una imagen final más ligera.

---

# Variables de entorno

Variables utilizadas por Spring Boot:

| Variable    | Descripción                |
| ----------- | -------------------------- |
| DB_URL      | URL de conexión PostgreSQL |
| DB_USERNAME | Usuario PostgreSQL         |
| DB_PASSWORD | Contraseña PostgreSQL      |

Ejemplo:

```env
DB_URL=jdbc:postgresql://localhost:5432/meatandgrill
DB_USERNAME=postgres
DB_PASSWORD=postgres
```

---

# Rama de desarrollo

La rama utilizada para el backend es:

```
feature/backend
```

Los cambios deben realizarse mediante commits y pushes hacia dicha rama para ejecutar el pipeline de integración continua.