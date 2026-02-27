# Hope School – Local Development Setup

This guide explains how to run the Hope School Rails app locally using PostgreSQL in Docker.

---

## Prerequisites

Make sure you have the following installed:

* Ruby (via `asdf` or `rvm`) – version from `.tool-versions` or `.ruby-version`
* Node.js (for Rails assets)
* Docker & Docker Compose
* Bundler (`gem install bundler`)

---

## 1. Clone the Repository

```bash
git clone <your-repo-url>
cd hope_school
```

---

## 2. Create Environment File

Create a `.env` file (this is gitignored):

```bash
touch .env
```

Add:

```env
POSTGRES_USER=postgres
POSTGRES_PASSWORD=password
POSTGRES_DB=hope_school_development
RAILS_ENV=development
```

---

## 3. Start PostgreSQL (Docker)

```bash
docker compose up -d
```

Verify it's running:

```bash
docker ps
```

---

## 4. Install Ruby Gems

```bash
bundle install
```

---

## 5. Setup Database

```bash
bin/rails db:create
bin/rails db:migrate
bin/rails db:seed
```

---

## 6. Create Admin User (Dev Only)

```bash
bin/rails c
```

```ruby
admin = Admin.find_or_initialize_by(email: "admin@hopeschool.com")
admin.password = "password123"
admin.password_confirmation = "password123"
admin.save!
```

---

## 7. Start Rails Server

```bash
bin/dev
This command uses foreman to start both your Rails server and the Tailwind/JavaScript compilers simultaneously.
```

Visit:

* App: [http://localhost:3000](http://localhost:3000)
* Admin Login: [http://localhost:3000/admin](http://localhost:3000/admin)

Login:

* Email: [admin@hopeschool.com](mailto:admin@hopeschool.com)
* Password: password123

---

## Common Issues

### Database Auth Error

If you get:

```
password authentication failed for user "postgres"
```

Fix:

```bash
docker compose down -v
docker compose up -d
```

---

### Missing Gems / Ruby Version

```bash
asdf install
bundle install
```

---

## Test Suite

```bash
bin/rails test
```

---

## Notes

* `.env` and `.tool-versions` are not committed to Git
* Seeds are idempotent and safe to re-run

---
