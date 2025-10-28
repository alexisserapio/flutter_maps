// android/app/build.gradle.kts (Kotlin Script)

import java.util.Base64

// 1. CAPTURA DE VARIABLES DE ENTORNO (KOTLIN)
val dartEnvironmentVariables = if (project.hasProperty("dart-defines")) {
    project.property("dart-defines")
        .toString()
        .split(',')
        .mapNotNull {
            val decodedBytes = Base64.getDecoder().decode(it)
            val decodedString = String(decodedBytes, Charsets.UTF_8)
            val parts = decodedString.split('=', limit = 2)
            if (parts.size == 2) {
                parts[0] to parts[1]
            } else {
                null
            }
        }
        .toMap()
} else {
    mapOf<String, String>()
}

plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.flutter_maps"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.example.flutter_maps"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName

        // 2. USO DE VARIABLES (KOTLIN)
        val apiKey = dartEnvironmentVariables["API_KEY"] ?: "DEFAULT_API_KEY"
        
        manifestPlaceholders["MapsApiKey"] = apiKey 
        // Nota: En Kotlin Script, 'manifestPlaceholders' es un mapa y se usa '[]' para asignar.
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}