# @ravij4057/capacitor-shake

A high-performance, battery-efficient shake gesture detection plugin for Capacitor 6+.

This plugin provides a reliable native bridge to detect physical shaking movements on iOS, Android, and Web platforms. It is optimized with **Smart Throttling** to ensure your app logic only triggers once per shake event.

[![Capacitor Hire](https://img.shields.io/badge/Capacitor-6+-blue.svg)](https://capacitorjs.com/)
[![Platform Support](https://img.shields.io/badge/platform-ios%20%7C%20android%20%7C%20web-lightgrey.svg)](#platform-support)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

---

## 🚀 Features

- **Native Precision**: Uses `CoreMotion` on iOS and `SensorManager` on Android for hardware-level accuracy.
- **Smart Throttling**: Built-in **2000ms cooldown** prevents multiple rapid triggers from a single continuous shake.
- **Battery Optimized**: Automatically manages hardware sensor listeners based on app lifecycle to preserve battery.
- **Web Ready**: Fully compatible with mobile browsers using the W3C `devicemotion` API.
- **Refresh Ready**: Perfect for implementing "Shake to Refresh" functionality.

---

## 📦 Installation

Install the plugin directly from GitHub:

```bash
npm install https://github.com/ravij4057/capacitor-shake
npx cap sync


---

### How to save this to your folder:

**Option 1: Manual**
1. Open your plugin folder.
2. Create a new file called `README.md`.
3. Paste the code above and save.

**Option 2: Terminal Command (Fastest)**
Run this command inside your plugin folder to generate the file automatically:

```bash
cat <<EOF > README.md
# @ravij4057/capacitor-shake

A high-performance, battery-efficient shake gesture detection plugin for Capacitor 6+.

This plugin provides a reliable native bridge to detect physical shaking movements on iOS, Android, and Web platforms. It is optimized with **Smart Throttling** to ensure your app logic only triggers once per shake event.

[![Capacitor Hire](https://img.shields.io/badge/Capacitor-6+-blue.svg)](https://capacitorjs.com/)
[![Platform Support](https://img.shields.io/badge/platform-ios%20%7C%20android%20%7C%20web-lightgrey.svg)](#platform-support)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

---

## 🚀 Features

- **Native Precision**: Uses CoreMotion on iOS and SensorManager on Android for hardware-level accuracy.
- **Smart Throttling**: Built-in 2000ms cooldown prevents multiple rapid triggers from a single continuous shake.
- **Battery Optimized**: Automatically manages hardware sensor listeners based on app lifecycle to preserve battery.
- **Web Ready**: Fully compatible with mobile browsers using the W3C devicemotion API.

---

## 📦 Installation

\`\`\`bash
npm install https://github.com/ravij4057/capacitor-shake
npx cap sync
\`\`\`

---

## 🛠 Usage

\`\`\`typescript
import { MyShake } from '@ravij4057/capacitor-shake';

const initShake = async () => {
  await MyShake.addListener('shake', () => {
    window.location.reload();
  });
};
\`\`\`

---

## 👨‍💻 Author
**Ravi** - [@ravij4057](https://github.com/ravij4057)

## 📄 License
MIT
EOF