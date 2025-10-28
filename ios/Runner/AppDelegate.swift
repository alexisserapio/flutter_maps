import Flutter
import UIKit
import GoogleMaps

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // 1. Obtener los dart-defines codificados
        if let dartDefines = Bundle.main.infoDictionary?["DART_DEFINES"] as? String {
            // 2. Decodificar Base64
            if let decodedData = Data(base64Encoded: dartDefines),
               let decodedString = String(data: decodedData, encoding: .utf8) {
                
                // 3. Buscar tu clave (p. ej., GMAPS_API_KEY=VALOR_SECRETO)
                let defines = decodedString
                    .split(separator: ",")
                    .map { $0.split(separator: "=", maxSplits: 1) }
                    .reduce(into: [String: String]()) { result, pair in
                        if pair.count == 2 {
                            result[String(pair[0])] = String(pair[1])
                        }
                    }
                
                // 4. Usar tu clave
                if let apiKey = defines["GMAPS_API_KEY"] {
                    // Ejemplo: Inicialización de Google Maps
                    GMSServices.provideAPIKey(apiKey) 
                    print("Clave API obtenida: \(apiKey)")
                }
            }
        }
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
