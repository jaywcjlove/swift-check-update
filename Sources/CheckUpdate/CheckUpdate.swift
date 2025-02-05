// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

public enum CheckUpdate {
    public static func checkVersion(bundleId: String? = nil, completion: @escaping @Sendable (Bool, String?, String?) -> Void) {
        // Get the current application's Bundle Identifier
        guard let bundleId = bundleId ?? Bundle.main.bundleIdentifier else {
            completion(false, nil, nil)
            return
        }
        
        // Construct the request URL
        let urlString = "https://itunes.apple.com/lookup?bundleId=\(bundleId)"
        guard let url = URL(string: urlString) else {
            completion(false, nil, nil)
            return
        }

        // Create the request
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                completion(false, nil, nil)
                return
            }
            
            // Parse the returned JSON data
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let results = json["results"] as? [[String: Any]],
                   let appInfo = results.first,
                   let appStoreVersion = appInfo["version"] as? String {
                    
                    // Get the current application version
                    //let currentVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
                    let currentVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
                    
                    // Compare version numbers
                    let isUpdateNeeded = isUpdateAvailable(currentVersion: currentVersion, appStoreVersion: appStoreVersion)
                    
                    // Call the completion callback
                    DispatchQueue.main.async {
                        completion(isUpdateNeeded, appStoreVersion, currentVersion)
                    }
                } else {
                    completion(false, nil, nil)
                }
            } catch {
                completion(false, nil, nil)
            }
        }
        
        task.resume()
    }
    
    // MARK: - Compare version numbers
    // Compare version numbers
    private static func isUpdateAvailable(currentVersion: String?, appStoreVersion: String) -> Bool {
        guard let currentVersion = currentVersion else {
            return false
        }
        
        return compareVersion(currentVersion: currentVersion, appStoreVersion: appStoreVersion)
    }
    
    // MARK: - Version number comparison
    // Version number comparison
    internal static func compareVersion(currentVersion: String, appStoreVersion: String) -> Bool {
        guard isValidVersion(currentVersion), isValidVersion(appStoreVersion) else {
            return false
        }

        let currentVersionComponents = currentVersion.split(separator: ".").map { Int($0) ?? 0 }
        let appStoreVersionComponents = appStoreVersion.split(separator: ".").map { Int($0) ?? 0 }
        
        let maxCount = max(currentVersionComponents.count, appStoreVersionComponents.count)
        
        for i in 0..<maxCount {
            let currentComponent = i < currentVersionComponents.count ? currentVersionComponents[i] : 0
            let appStoreComponent = i < appStoreVersionComponents.count ? appStoreVersionComponents[i] : 0
            
            if currentComponent < appStoreComponent {
                return true
            } else if currentComponent > appStoreComponent {
                return false
            }
        }
        
        return false
    }

    private static func isValidVersion(_ version: String) -> Bool {
        let versionRegex = "^[0-9]+(\\.[0-9]+)*$"
        let versionTest = NSPredicate(format: "SELF MATCHES %@", versionRegex)
        return versionTest.evaluate(with: version)
    }
}
