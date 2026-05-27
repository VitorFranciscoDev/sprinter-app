/// Defines the contract for storage operations
abstract class AppStorage {
  /// Reads an string from the storage
  Future<String?> readString(String key);

  /// Reads a JSON from the storage
  Future<Map<String, dynamic>?> readJSON(String key);

  /// Writes an string in the storage
  Future<void> writeString({required String key, required String value});

  /// Writes a JSON in the storage
  Future<void> writeJSON<T>({required String key, required T value});

  /// Deletes a value from the storage
  Future<void> deleteString(String key);
}