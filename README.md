# AR Flutter - 3D Model Viewer

A modern Flutter application that brings 3D models to life through Augmented Reality (AR) technology. Experience immersive AR interactions with a curated collection of 3D models including characters, fashion items, electronics, and more.

![AR Flutter Demo](https://img.shields.io/badge/Platform-Flutter-blue.svg)
![AR Plugin](https://img.shields.io/badge/AR-ar__flutter__plugin-green.svg)
![License](https://img.shields.io/badge/License-MIT-yellow.svg)

## ✨ Features

- **🎯 AR Model Viewing**: Place and interact with 3D models in real-world environments
- **📱 Cross-Platform**: Works on both iOS and Android devices
- **🎨 Beautiful UI**: Modern gradient design with intuitive navigation
- **📦 Model Library**: Curated collection of 3D models in various categories
- **🔄 Real-time Interaction**: Tap to place models on detected planes
- **📸 Camera Integration**: Seamless camera permissions and AR camera view
- **🌐 Cloud Models**: Load 3D models from GitHub repositories
- **🎭 Category Organization**: Models organized by categories (Characters, Fashion, Electronics, etc.)

## 🚀 Screenshots

The app features a beautiful gradient interface with:
- **Home Screen**: Model gallery with category-based organization
- **AR Viewer**: Full-screen AR experience with 3D model placement
- **Interactive Controls**: Clear and close buttons for AR session management

## 🛠️ Technology Stack

- **Framework**: Flutter 3.9.2+
- **AR Plugin**: ar_flutter_plugin 0.7.3
- **3D Models**: GLB format support
- **Vector Math**: vector_math 2.1.4
- **HTTP Client**: http 1.1.0
- **Permissions**: permission_handler 11.3.0
- **File Management**: path_provider 2.0.12

## 📋 Prerequisites

Before running this project, make sure you have:

- **Flutter SDK**: Version 3.9.2 or higher
- **Dart SDK**: Included with Flutter
- **Android Studio** or **VS Code** with Flutter extensions
- **Physical Device**: AR features require a physical device with camera support
- **Camera Permissions**: The app will request camera access for AR functionality

### Device Requirements

- **iOS**: iOS 11.0+ with ARKit support
- **Android**: Android 7.0+ (API level 24+) with ARCore support

## 🚀 Installation & Setup

### 1. Clone the Repository

```bash
git clone https://github.com/your-username/AR-flutter.git
cd AR-flutter
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Configure Platform-Specific Settings

#### Android Configuration

Add the following permissions to `android/app/src/main/AndroidManifest.xml`:

```xml
<uses-permission android:name="android.permission.CAMERA" />
<uses-feature android:name="android.hardware.camera.ar" android:required="true" />
```

#### iOS Configuration

Add camera usage description to `ios/Runner/Info.plist`:

```xml
<key>NSCameraUsageDescription</key>
<string>This app needs camera access to display AR content</string>
```

### 4. Run the Application

```bash
# For Android
flutter run

# For iOS
flutter run -d ios

# For specific device
flutter run -d <device-id>
```

## 🏗️ Project Structure

```
lib/
├── main.dart                 # Application entry point
├── models/
│   └── model_info.dart      # Model data structure
├── screens/
│   ├── home_screen.dart     # Model gallery screen
│   └── ar_viewer_screen.dart # AR viewer screen
├── services/
│   └── model_service.dart   # Model management service
└── widgets/
    └── model_card.dart      # Model card widget
```

## 🎮 Usage

### 1. Model Gallery
- Browse available 3D models organized by categories
- Each model card shows name, description, and category
- Tap any model card to launch AR viewer

### 2. AR Experience
- Grant camera permissions when prompted
- Point your camera at a flat surface
- Wait for plane detection (horizontal/vertical surfaces)
- Tap on detected planes to place the 3D model
- Use control buttons to clear models or exit AR view

### 3. Model Interaction
- Models are automatically scaled for optimal viewing
- Tap anywhere on detected planes to place new instances
- Models respond to lighting and shadows in real environment

## 🔧 Configuration

### Adding New Models

To add new 3D models to the app:

1. **Upload GLB files** to your GitHub repository
2. **Update ModelService** in `lib/services/model_service.dart`:
   ```dart
   ModelInfo(
     name: 'Your Model Name',
     description: 'Model description',
     fileName: 'your_model.glb',
     githubUrl: 'https://raw.githubusercontent.com/username/repo/main/your_model.glb',
     thumbnailUrl: 'thumbnail_url',
     category: 'Your Category',
     scale: 0.5, // Adjust scale as needed
   )
   ```

### Customizing AR Settings

Modify AR configuration in `ar_viewer_screen.dart`:

```dart
arSessionManager.onInitialize(
  showFeaturePoints: true,    // Show AR feature points
  showPlanes: true,           // Show detected planes
  showWorldOrigin: true,      // Show world origin
  handlePans: true,           // Enable pan gestures
  handleRotation: true,       // Enable rotation gestures
);
```

## 🎨 Customization

### UI Theming

The app uses a modern gradient theme. Customize colors in the respective screen files:

```dart
// Home screen gradient
LinearGradient(
  colors: [
    Color(0xFF6366F1), // Indigo
    Color(0xFF8B5CF6), // Purple
    Color(0xFFEC4899), // Pink
  ],
)
```

### Model Categories

Add new categories in `model_card.dart`:

```dart
Color _getCategoryColor(String category) {
  switch (category.toLowerCase()) {
    case 'your_category':
      return Color(0xFF123456);
    // ... other cases
  }
}
```

## 🐛 Troubleshooting

### Common Issues

1. **AR not working on emulator**
   - AR requires physical device with camera
   - Use `flutter run` on connected device

2. **Models not loading**
   - Check internet connection
   - Verify GitHub URLs are accessible
   - Ensure GLB files are properly uploaded

3. **Camera permissions denied**
   - Go to device settings
   - Enable camera permissions for the app
   - Restart the application

4. **Build errors**
   - Run `flutter clean && flutter pub get`
   - Ensure Flutter SDK is up to date
   - Check platform-specific configurations

## 📚 Dependencies

| Package | Version | Purpose |
|---------|---------|---------|
| `ar_flutter_plugin` | 0.7.3 | AR functionality |
| `vector_math` | ^2.1.4 | 3D vector calculations |
| `http` | ^1.1.0 | Network requests |
| `permission_handler` | ^11.3.0 | Runtime permissions |
| `path_provider` | ^2.0.12 | File system access |

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.

### Development Guidelines

1. Follow Flutter/Dart coding conventions
2. Add comments for complex AR functionality
3. Test on both iOS and Android devices
4. Ensure AR features work on physical devices

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [ar_flutter_plugin](https://pub.dev/packages/ar_flutter_plugin) for AR capabilities
- [Flutter Team](https://flutter.dev/) for the amazing framework
- 3D model creators and contributors

## 📞 Support

If you encounter any issues or have questions:

1. Check the [Issues](https://github.com/your-username/AR-flutter/issues) page
2. Create a new issue with detailed description
3. Include device information and error logs

---

**Made with ❤️ using Flutter and AR technology**
