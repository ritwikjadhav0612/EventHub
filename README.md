# EventHub - College Event Registration System

EventHub is a modern college event registration web application featuring event browsing, category filtering, search, and student registrations.

## 🚀 Live Demo & Deployment on AWS Amplify

This application is pre-configured for **AWS Amplify**:
- **Automatic Deployment**: Configured via `amplify.yml`. Connect this repository to AWS Amplify Console for automatic continuous deployment on every push.
- **Manual 1-Click Deployment**: Drag and drop `amplify-deploy.zip` in AWS Amplify Hosting (Deploy without Git).

## 📁 Project Structure

```
├── amplify.yml                       # AWS Amplify build configuration
├── amplify-deploy.zip                # Ready-to-deploy static package for AWS Amplify
├── build-amplify.sh                  # Helper script to rebuild Amplify deployment zip
├── schema.sql                        # MySQL database schema and seed events
├── Dockerfile                        # Multi-stage Dockerfile (Tomcat 10.1 + Java 21)
├── pom.xml                           # Maven project configuration (Servlet 6.0 / Java 21)
└── src
    └── main
        ├── java/com/eventhub         # Backend Java Servlets & DB connection
        ├── resources                 # Application configuration
        └── webapp                    # Frontend web application (HTML, CSS, JS, JSON)
            ├── index.html            # Landing page
            ├── events.html           # Event catalogue with search and category filters
            ├── event-details.html    # Event details view
            ├── registration.html     # Registration form with dynamic dropdown
            ├── success.html          # Registration confirmation
            ├── login.html            # User login
            ├── style.css             # Unified styling
            └── events.json           # Event dataset for static cloud hosting
```

## 🛠️ Technology Stack
- **Frontend**: HTML5, CSS3, JavaScript (Fetch API, LocalStorage fallback)
- **Cloud Hosting**: AWS Amplify Hosting
- **Backend (Optional / Local)**: Jakarta EE Servlet 6.0, Apache Tomcat 10.1, Java 21
- **Database**: MySQL 8.x
