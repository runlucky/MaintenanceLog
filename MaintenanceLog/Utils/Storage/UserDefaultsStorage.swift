import Foundation

/// UserDefaultsを使用したストレージです
public struct UserDefaultsStorage: IStorage {
    private let userDefaults: UserDefaults
    private let bundleIdentifier: String
    
    public init(_ userDefaults: UserDefaults, bundleIdentifier: String) {
        self.userDefaults = userDefaults
        self.bundleIdentifier = bundleIdentifier
    }
    
    public func get<T: Codable>(key: String, type: T.Type) throws -> T {
        guard let data = userDefaults.data(forKey: key) else { throw StorageError.notFound(key: key)  }
        return try JSONDecoder().decode(type, from: data)
    }
    
    public func upsert<T: Codable>(key: String, value: T) throws {
        let data = try JSONEncoder().encode(value)
        userDefaults.set(data, forKey: key)
    }

    public func delete(key: String) throws {
        userDefaults.removeObject(forKey: key)
    }
    
    public func deleteAll() throws {
        userDefaults.removePersistentDomain(forName: bundleIdentifier)
    }
}

public enum StorageError: LocalizedError {
    case notFound(key: String)
    
    public var errorDescription: String? {
        switch self {
        case .notFound(key: let key): return "key: \(key) が見つかりませんでした。"
        }
    }
}
