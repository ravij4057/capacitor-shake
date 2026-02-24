# @ravij4057/capacitor-shake

A high-performance, battery-efficient shake gesture detection plugin for Capacitor 6+.

Detect physical shaking movements across iOS, Android, and Web platforms with native precision. Optimized with **Smart Throttling** to ensure smooth performance and reliable event triggering.

[![Capacitor Hire](https://img.shields.io/badge/Capacitor-6+-blue.svg)](https://capacitorjs.com/)
[![Platform Support](https://img.shields.io/badge/platform-ios%20%7C%20android%20%7C%20web-lightgrey.svg)](#platform-support)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

---

## 🚀 Features

- **Native Precision**: Uses `CoreMotion` on iOS and `SensorManager` on Android for hardware-level accuracy.
- **Smart Throttling**: Built-in **2000ms cooldown** prevents multiple rapid triggers from a single continuous shake event.
- **Battery Optimized**: Automatically manages hardware sensor listeners based on app lifecycle to preserve battery life.
- **Web Ready**: Fully compatible with modern mobile browsers using the `devicemotion` API.
- **Refresh Ready**: Ideal for implementing "Shake to Refresh" or bug reporting features.

---

## 📦 Installation

Install the plugin directly from GitHub:

```bash
npm install https://github.com/ravij4057/capacitor-shake
npx cap sync