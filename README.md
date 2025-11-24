# weather_app

A professional Flutter weather application.

## Overview

The **Weather App** is a mobile application built with the latest stable version of **Flutter**.  
It provides weather information for **Today**, **Hourly**, and **Monthly** views, displays key
weather metrics, and allows users to configure **custom weather alerts**.

The project follows a clean, maintainable structure and uses **Provider + ChangeNotifier**
for state management.

---

## Features

### Weather Forecast

- Today summary with condition and temperature.
- Hourly forecast presented as horizontal cards.
- Monthly overview with simplified daily indicators.
- Weather conditions mapped via a `WeatherStatus` enum.

### Weather Metrics

- Wind speed
- Humidity
- Rain chance
- Modern card-based UI components.

### Weather Alerts

- Create alerts for:
  - Rain chance (%)
  - Temperature (°C)
  - Wind speed (m/s)
- Trigger options:
  - Above threshold
  - Below threshold
- Bottom-sheet UI for creating alerts.
- Alerts stored and managed via `HomeProvider`.

---

## Architecture

### State Management

- **Provider** with **ChangeNotifier**
- `HomeProvider` is responsible for:
  - Current user name
  - Selected section (Today / Hourly / Monthly)
  - Hourly data lists
  - Weather alerts

### Core Models

- `HourData` – hourly forecast item (time, temperature, status)
- `WeatherStatus` – enum for weather types (sunny, cloudy, rainy, storm, etc.)
- `WeatherAlert` – configuration for a user-defined alert

---

## Folder Structure

```text
lib/
  core/
    widgets/
    utils/
    constants/

  features/
    home/
      provider/
        home_provider.dart
      models/
        hour_data.dart
        weather_alert.dart
        weather_status.dart
      widgets/
        weather_card.dart
        weather_metrics_card.dart
        hourly_weather_card.dart
        forecast_switcher.dart
        weather_alerts_section.dart
      pages/
        home_page.dart

  main.dart
```
