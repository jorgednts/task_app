# Easy Task App (`task_app`) – Tekna.Rocks Technical Challenge

A simple and functional task management mobile application built with Flutter and Supabase, featuring user authentication, CRUD operations for tasks and categories, and media attachments.

## 🚀 Features

### Authentication
- **User Registration**: Create account with email, password and name;
- **User Login**: Secure authentication using email and password;
- **Persistent Login**: Users remain authenticated when reopening the app;
- **Logout**: Secure user session termination.

### Task Management
- **Task CRUD Operations**: Create, read, update, and delete tasks
- **Task Properties**:
  - Title
  - Description
  - Due date
  - Category (user-defined)
  - Status (To do, In Progress, Done)
- **Media Attachments**: Add photos and videos to tasks
  - Choose from local files
  - Capture directly using camera
- **Task Filtering**: Search tasks by title, description, category, and status (toDo, inProgress, done)

### Category Management
- **Dynamic Categories**: Create, edit, and delete custom categories;
- **Category Selection**: Assign categories to tasks during creation/editing.

### User Experience
- **Loading States**: Visual feedback during operations
- **Error Handling**: Basic error messages and validation
- **Material Design**: Clean and intuitive interface
- **Responsive**: Adapts to different screen sizes

### Theme Switching
- **Light, Dark, and System** themes available

### Language Switching
- **English and Brazilian** languages available. Note that **ENGLISH** is the *default* language for the application

## 🛠 Tech Stack

This project was developed with:

- **Flutter**: 3.32.5
- **Dart**: 3.8.1
- **Melos**: Monorepo management
- **Supabase**: Backend as a Service (pre-configured)
  - Supabase Auth (Authentication)
  - Supabase Storage (Media files)
  - Supabase Postgres (Database)
- **State Management**: BLoC pattern
- **UI**: Material Design
- **Widgetbook**: Component documentation and testing

## 🎯 Target Platform

This application is optimized for **Android** devices.

## 📋 Prerequisites

Before running this application, make sure you have:

- Flutter SDK (^3.32.5) installed
- Dart SDK (^3.8.1) installed
- Android Studio or VS Code with Flutter extensions
- Android device or emulator for testing
- Melos CLI installed globally (`dart pub global activate melos`)

> 💡 Run the following command once to install Melos globally:
> ```bash
> dart pub global activate melos
> ```

## 🔧 Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/jorgednts/task_app.git
```

### 2. Activate Melos globally
In the root directory, run:
> ```
> dart pub global activate melos
> ```
This will install Melos globally

### 2. Edit melos.yaml device
- In the root directory, open `melos.yaml` and replace `<YOUR-DEVICE-ID>` in the `run` field of the `app` script with your device ID.

> 💡Note: If you don't know your device id, you can check by running `flutter devices`, this command will show a list of available devices.

> 💡Note: Remember, target platform is **Android**, choose a valid android device or emulator.

### 3. Run the app

In the root directory, run:

```bash
melos run app
```
This will:
- Clean and bootstrap the monorepo
- Navigate to `easy_task_app package`
- Launch the app on the selected device
- Automatically inject required environment variables via --dart-define

In order words, this will **make the app run with a single command**.

If you prefer to run it **manually**, follow these steps:

- Run `melos bootstrap` in the root directory to bootstrap the monorepo;
- Navigate to app's directory by runnning `cd easy_task_app`;
- flutter run -d <YOUR-DEVICE-ID> --dart-define=SUPABASE_URL=<SUPABASE_URL> --dart-define=SUPABASE_API_KEY=<SUPABASE_API_KEY>

>💡Note: Replace <SUPABASE_URL> and <SUPABASE_API_KEY> with the environment variables declared in `.env` file inside the `easy_task_app` directory.

## 🏗 Project Structure

This project follows a modular monorepo architecture managed by Melos:
```
├── melos.yaml                    # Melos configuration
├── packages/
│   ├── core/                    # Core utilities and shared logic
│   │   ├── lib/
│   │   ├── pubspec.yaml
│   │   └── README.md
│   ├── design_system/           # Design system with Widgetbook
│   │   ├── lib/
│   │   ├── easy_task_widgetbook/          # Widgetbook components
│   │   ├── pubspec.yaml
│   │   └── README.md
│   ├── easy_task_app/           # Main application
│   │   ├── lib/
│   │   │   ├── data/           # Data sources and repositories
│   │   │   ├── domain/         # Business logic and entities
│   │   │   ├── presentation/   # UI and state management
│   │   │   └── main.dart       # App entry point
│   │   ├── pubspec.yaml
│   │   └── README.md
│   └── internationalization/    # i18n support
│       ├── lib/
│       ├── pubspec.yaml
│       └── README.md
└── README.md
```

### Package Overview

- **Core**: Shared utilities, constants, and common functionality;
- **Design System**: Reusable UI components with Widgetbook integration for component documentation;
- **Easy Task App**: Main application containing the task management features;
- **Internationalization**: Localization support for multiple languages (EN and PT/BR);


## 📱 Usage
### Getting Started

- **Registration**: Create a new account using your email and password
- **Login**: Access your account with your credentials
- **Categories**: Create categories to organize your tasks
- **Tasks**: Start creating and managing your tasks

### Managing Tasks

- **Create Task**: Tap the "+" button to add a new task;
- **Edit Task**: Tap on any task on the list to edit its details;
- **Delete Task**: Tap the task and click on the delete option;
- **Filter Tasks**: Use the search bar to filter tasks by name, description, status (toDo, inProgress, done) and category;
- **Add Category**: Choose a category from the list you created;
- **Add Media**: Attach photos or videos when creating/editing tasks.

### Managing Categories

- **Create Category**: Tap the "+" button to add a new category;
- **Edit Category**: Tap the category and click on the delete option;
- **Delete Category**: Click the "Delete Category" button;

### Status Management
Tasks can have three statuses:

- **To do**: Newly created or pending tasks;
- **In Progress**: Tasks currently being worked on;
- **Done**: Completed tasks.

>💡 Note: When filtering by status, use the enum values exactly as defined: `toDo`, `inProgress`, `done`.

## 🔍 Code Quality
This project follows:

- **Clean Architecture**: Separation of concerns with clear layers
- **BLoC Pattern**: Predictable state management
- **SOLID Principles**: Object-oriented design principles
- **Error Handling**: Comprehensive error management
- **Clean Code**: Clear and maintainable code

## 🧑‍💻 Author
Developed by **Jorge Dantas**
- [@jorgednts](https://github.com/jorgednts) on Github
- [![LinkedIn](https://img.shields.io/badge/LinkedIn-%230077B5.svg?logo=linkedin&logoColor=white)](https://www.linkedin.com/in/jorge-dantas-57940b171/)
- [![email](https://img.shields.io/badge/Email-D14836?logo=gmail&logoColor=white)](mailto:engjorgedantas@gmail.com) 