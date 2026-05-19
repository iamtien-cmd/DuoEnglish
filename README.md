# 🦉 DuoEnglish - English Learning Platform

A comprehensive English vocabulary learning platform inspired by Duolingo, built with React.js and Spring Boot.

## 📚 Documentation

- **[GETTING_STARTED.md](GETTING_STARTED.md)** - Complete setup guide for beginners
- **[QUICKSTART.md](QUICKSTART.md)** - Get running in 5 minutes
- **[FEATURES.md](FEATURES.md)** - Detailed feature documentation
- **[DEPLOYMENT.md](DEPLOYMENT.md)** - Cloud deployment guide
- **[PROJECT_STRUCTURE.md](PROJECT_STRUCTURE.md)** - Code organization
- **[ARCHITECTURE.md](ARCHITECTURE.md)** - System architecture diagrams
- **[SUMMARY.md](SUMMARY.md)** - Project summary
- **[INDEX.md](INDEX.md)** - Documentation index

## Features

### 📚 Learn Vocabulary
- Browse thousands of English words
- Filter by difficulty level (Beginner, Intermediate, Advanced)
- Search functionality
- Pronunciation guides and examples
- Cached with Redis for fast performance

### 🎯 Practice & Review
- Spaced repetition system
- Track correct/wrong answers
- Progress tracking with intelligent review scheduling
- Gamified learning experience

### ✍️ Sentence Builder
- Create your own sentences using learned vocabulary
- Add translations
- Build a personal sentence collection

### 📰 Read Articles
- English articles categorized by topic
- Difficulty levels for progressive learning
- Improve reading comprehension

### ☁️ Cloud Features
- Azure Blob Storage for media files
- Redis caching for performance
- Docker containerization
- Deployable to Azure and Vercel

## Tech Stack

### Frontend
- React.js 19
- React Router for navigation
- Axios for API calls
- CSS3 with Duolingo-inspired green/white theme

### Backend
- Spring Boot 4.0.6
- Spring Security with JWT
- JPA/Hibernate for ORM
- SQL Server database
- Redis for caching
- Azure Blob Storage integration

### DevOps
- Docker & Docker Compose
- Azure App Service
- Vercel for frontend hosting

## Project Structure

```
duoenglish/
├── src/main/java/vn/iotstar/
│   ├── entity/          # JPA entities
│   ├── repository/      # Data repositories
│   ├── service/         # Business logic
│   ├── controller/      # REST controllers
│   └── config/          # Configuration classes
├── duoenglish-ui/
│   ├── src/
│   │   ├── components/  # React components
│   │   ├── api/         # API integration
│   │   └── App.js       # Main app component
│   └── public/
├── docker-compose.yml   # Docker services
└── Dockerfile          # Backend container

```

## Quick Start

### Prerequisites
- Java 17+
- Node.js 18+
- Docker & Docker Compose
- SQL Server
- Redis

### 1. Clone and Setup

```bash
git clone <repository-url>
cd duoenglish
```

### 2. Start Backend Services

```bash
# Start SQL Server and Redis with Docker
docker-compose up -d

# Run Spring Boot application
./mvnw spring-boot:run
```

Backend runs on http://localhost:8080

### 3. Start Frontend

```bash
cd duoenglish-ui
npm install
npm start
```

Frontend runs on http://localhost:3000

### 4. Configure Environment

Create `duoenglish-ui/.env`:
```
REACT_APP_API_URL=http://localhost:8080/api
```

Update `src/main/resources/application.properties` with your database credentials.

## API Endpoints

### Vocabulary
- `GET /api/vocabularies` - Get all vocabularies
- `GET /api/vocabularies/{id}` - Get by ID
- `GET /api/vocabularies/level/{level}` - Filter by level
- `GET /api/vocabularies/search?keyword=` - Search
- `POST /api/vocabularies` - Create new
- `DELETE /api/vocabularies/{id}` - Delete

### Articles
- `GET /api/articles` - Get all articles
- `GET /api/articles/{id}` - Get by ID
- `GET /api/articles/category/{category}` - Filter by category

### Progress
- `POST /api/progress/update` - Update learning progress
- `GET /api/progress/my-progress` - Get user progress

### Sentences
- `GET /api/sentences/my-sentences` - Get user sentences
- `POST /api/sentences` - Create sentence
- `GET /api/sentences/vocabulary/{id}` - Get by vocabulary

## Deployment

See [DEPLOYMENT.md](DEPLOYMENT.md) for detailed deployment instructions.

### Quick Deploy

**Frontend to Vercel:**
```bash
cd duoenglish-ui
vercel --prod
```

**Backend to Azure:**
```bash
mvn clean package
az webapp deploy --resource-group <group> --name <app-name> --src-path target/*.war
```

## Features in Detail

### Redis Caching
- Vocabularies cached for 1 hour
- Automatic cache invalidation on updates
- Improves response time significantly

### Azure Integration
- Blob Storage for images and media
- SQL Database for production data
- Redis Cache for distributed caching

### Security
- JWT-based authentication
- Spring Security configuration
- CORS enabled for frontend

### Docker Support
- Multi-stage builds for optimization
- Docker Compose for local development
- Production-ready containers

## Contributing

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## License

This project is licensed under the MIT License.

## Contact

For questions or support, please open an issue on GitHub.
# DuoEnglish
