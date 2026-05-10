# Sprinter App (Frontend)

This repository contains the frontend application for the Sprinter project, built using Flutter.

The backend service is available at: [https://github.com/Gsdagustavo/sprinter-api](https://github.com/Gsdagustavo/sprinter-api)

---

## Overview

The Sprinter App is a cross-platform mobile application responsible for:

- Providing the user interface and user experience
- Communicating with the Sprinter API
- Handling client-side validation
- Managing application state
- Displaying and interacting with data from the backend

---

## Tech Stack and Main Libraries

- Flutter
- Dart
- OpenStreetMap
- HTTP

---

## Development Configuration

The application connects to the backend API using environment-specific configurations.

Make sure that:

- The API base URL is correctly set
- The backend service is running and accessible
- Network permissions are enabled (especially for Android/iOS emulators)

---

## Running the Project Locally

Follow the steps below to run the application in a local development environment.

### 1. Install Dependencies

Run the following command to install all required packages:

```bash
flutter pub get
```

### 2. Configure the Backend URL

Ensure the app is pointing to the correct API endpoint:

| Environment     | Platform        | URL                              |
|-----------------|-----------------|----------------------------------|
| Emulator        | Android         | `http://10.0.2.2:<PORT>`        |
| Emulator        | iOS             | `http://localhost:<PORT>`       |
| Physical Device | Android / iOS   | `http://192.168.x.x:<PORT>`    |

> Use your machine's local IP address when running on a physical device.

### 3. Run the Application

Start the app with:

```bash
flutter run
```

You can specify a device if needed:

```bash
flutter devices
flutter run -d <device_id>
```

---

## Recommended Execution Order

To ensure proper functionality, follow this sequence:

1. Start the database container (backend)
2. Run the Sprinter API
3. Verify the API is accessible
4. Run the Flutter application

---

## License

This project is intended for educational and development purposes.