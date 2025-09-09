# Employee Portal – Backend (Spring Boot)

![Backend CI](https://github.com/shubhamdarge/employee-portal-backend/actions/workflows/backend-ci.yml/badge.svg)

Spring Boot REST API to manage employees (create, read, update, delete).  
Runs on **Render**, stores data in **Postgres (Supabase)**, and is built/published via **GitHub Actions** and a Dockerfile.

> Frontend lives in `employee-portal-frontend` (Angular on Netlify).

---

## Features
- Add a new employee
- Get all employees or fetch by ID
- Update employee details
- Delete employee by ID
- API docs via Swagger (springdoc-openapi) if enabled

---

## Tech Stack
- **Java 8 (SE 1.8)**
- **Spring Boot 2.4.x**
- **Spring Data JPA + Hibernate**
- **PostgreSQL (Supabase)**
- **Maven**
- **Docker** (multi-stage build)
- **Actuator** for health checks
- **Logback** (JSON logging optional)

---

## Prerequisites
- JDK 8 (SE 1.8)
- Maven 3.8+
- A Supabase Postgres project (running)
