extension StringExtension on String {
  /// Первая буква строчная
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }
}