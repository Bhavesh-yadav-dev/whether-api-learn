# 🌤️ Weather App (Flutter)

A sleek, **location-based weather application** built with **Flutter**.  
This app provides **real-time weather updates** with a minimalist **“less is more”** design, powered by the **OpenWeatherMap API** and enhanced with **dynamic Lottie animations**.

---

## 🚀 Features

- 📡 **Real-time Data**  
  Live temperature and weather condition fetching.

- 📍 **Auto-Location**  
  Intelligent device location detection via GPS.

- 🎨 **Dynamic UI**  
  Background animations that adapt based on actual weather:
  - ☀️ Sunny  
  - ☁️ Cloudy  
  - 🌧️ Rainy  
  - ⛈️ Thunderstorm  

- 🧼 **Clean Design**  
  High-readability typography with a distraction-free interface.

---

## 🛠️ Tech Stack & Packages

| Category     | Technology / Package |
|-------------|----------------------|
| Framework   | Flutter              |
| API         | OpenWeatherMap       |
| Networking  | http                 |
| Location    | geolocator, geocoding|
| Animations  | lottie               |

---

## 🏗️ Project Structure

The app follows a **Modular Service-Oriented Architecture** for better maintainability:

```plaintext
lib/
├── models/      # Weather data models & JSON parsing
├── services/    # API handling & location permissions logic
├── pages/       # UI screens (Weather Page)
└── main.dart    # App entry point

## ⚙️ Setup & Installation

### 1️⃣ Get an API Key
- Sign up at **OpenWeatherMap**
- Generate your free API key

---

### 2️⃣ Configure Native Permissions

#### 🤖 Android  
**`android/app/src/main/AndroidManifest.xml`**

```xml
<uses-permission name="android.permission.ACCESS_FINE_LOCATION" />
<uses-permission name="android.permission.ACCESS_COARSE_LOCATION" />

#### 🤖 IOS
<key>NSLocationWhenInUseUsageDescription</key>
<string>We need your location to show local weather.</string>



