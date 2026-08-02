# My Portfolio

A personal portfolio web application built with Flutter, showcasing projects, work experience, skills, blog posts, and a contact form 

## Live Demo
[https://atikurzamanpallob.github.io](https://atikurzamanpallob.github.io)

## Features

- **Home** — Landing page with an introduction, "what I do" section, and highlights.
- **Career** — Work experience timeline, education, and certifications.
- **Skills** — Technical and soft skills overview.
- **Projects** — Project listing with filtering, and detailed project pages (overview, challenges & solutions, tech stack, screenshots, key features).
- **Blogs** — Blog listing with category filters and full blog detail pages.
- **Contact** — Contact form with availability and trust-badge info.


## Tech Stack

- **Flutter (Web)** — UI framework, using `go_router` for navigation and `MaterialApp.router`.
- **flutter_bloc** — State management (BLoC pattern) per feature.
- **get_it** — Dependency injection / service locator.
- **Supabase** — Backend-as-a-service for remote data (auth, database).
- **Hive** — Local storage/caching (`hive_flutter`) for offline/local data sources.
- **flutter_screenutil** — Responsive sizing across screen breakpoints.
- **flutter_dotenv** — Environment variable management (Supabase URL/keys, etc.).

## Architecture

The project follows a **feature-first, clean architecture** style. Each feature under `lib/features/` is organized into three layers:

```
feature_name/
├── data/
│   ├── datasource/       # Remote (Supabase) and local (Hive) data sources
│   ├── models/           # Data models (serialization)
│   └── repository/       # Repository implementations
├── domain/
│   ├── entity/            # Core business entities
│   ├── repository/       # Repository contracts (interfaces)
│   └── usecase/          # Use cases / business logic
└── presentation/
    ├── bloc/             # BLoC state management
    ├── pages/            # Screens
    └── widgets/          # Feature-specific UI components
```

### Project Structure

```
lib/
├── core/
│   ├── app_resources/    # Constants, fonts, icons, images
│   ├── common/           # Shared widgets (nav bar, footer, form fields, routes, etc.)
│   ├── constants/        # Breakpoints for responsive design
│   ├── di/                # Dependency injection setup (injection.dart)
│   ├── errors/            # Failure/error handling
│   ├── supabase/          # Supabase client initialization
│   ├── themes/            # App colors, text themes, responsive sizing
│   └── utils/              # Utility helpers (formatting, toast, responsive)
├── features/
│   ├── home/
│   ├── career/
│   ├── skills/
│   ├── projects/
│   ├── blogs/
│   ├── contact/
│   └── dashboard/
└── main.dart
```

Each feature (except Skills, which is currently static/local-only) follows a **remote-first with local fallback/cache** data strategy — a remote data source (Supabase) is used for live data, with a local data source (Hive) providing caching or offline support.

## Routing

Navigation is handled with `go_router`. Routes are defined in `lib/core/common/routes.dart`:

| Route | Page |
|---|---|
| Home | `HomePage` |
| Career | `CareerPage` |
| Skills | `SkillsPage` |
| Projects | `ProjectsPage` |
| Project Details | `ProjectDetailsPage` (`/:id`) |
| Blogs | `BlogsPage` |
| Blog Details | `BlogDetailsPage` (`/:id`) |
| Contact | `ContactPage` |
| Dashboard | `DashboardPage` (login-gated) |

## Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (with web support enabled)
- A [Supabase](https://supabase.com/) project (URL + public/anon key)

### Setup

1. **Clone the repository**
   ```bash
   git clone <your-repo-url>
   cd myportfolioapp
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure environment variables**

   Create a `.env` file in the project root with your Supabase credentials:
   ```env
   URL=your_supabase_project_url
   PUBLIC_KEY=your_supabase_publishable_key
   ```

4. **Run the app (web)**
   ```bash
   flutter run -d web-server --web-port=8080
   ```

   Or run on Chrome directly:
   ```bash
   flutter run -d chrome
   ```

### Build for production

```bash
flutter build web
```

The output will be in `build/web/`, ready to deploy to any static hosting provider.



