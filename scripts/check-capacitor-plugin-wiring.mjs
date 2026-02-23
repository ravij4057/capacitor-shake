import fs from 'fs';
import path from 'path';

// Plugin registration name dhoondne ke liye logic
const definitionsPath = path.resolve('src/index.ts');
const definitionsContent = fs.readFileSync(definitionsPath, 'utf8');
const pluginNameMatch = definitionsContent.match(/registerPlugin<.*?>\('(.+?)'/);

if (!pluginNameMatch) {
  console.error('❌ Could not find plugin name in src/index.ts');
  process.exit(1);
}

const pluginName = pluginNameMatch[1];
console.log(`🔎 Checking wiring for plugin: ${pluginName}`);

// 1. iOS Check
const iosPath = path.resolve('ios/Sources/MyShakePlugin/MyShakePlugin.m');
if (fs.existsSync(iosPath)) {
  const iosContent = fs.readFileSync(iosPath, 'utf8');
  if (!iosContent.includes(`"${pluginName}"`)) {
    console.error(`❌ iOS wiring mismatch: ios/Sources/MyShakePlugin/MyShakePlugin.m should contain "${pluginName}"`);
    process.exit(1);
  }
}

// 2. Android Check
const androidPath = path.resolve('android/src/main/java/com/ravij4057/plugins/shake/MyShakePlugin.java');
if (fs.existsSync(androidPath)) {
  const androidContent = fs.readFileSync(androidPath, 'utf8');
  if (!androidContent.includes(`name = "${pluginName}"`)) {
    console.error(`❌ Android wiring mismatch: Android file should have @CapacitorPlugin(name = "${pluginName}")`);
    process.exit(1);
  }
}

console.log('✅ Plugin wiring looks correct!');