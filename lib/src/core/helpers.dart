/// Get enum value name
String enumName(Object o) => o.toString().split('.').last;

/// Type helper class
Type typeOf<T>() => T;

const _epochTicks = 621355968000000000;
final _unixEpoc = DateTime(1970, 1, 1, 0, 0, 0, 0, 0);

extension TicksOnDateTime on DateTime {
  int get ticks => microsecondsSinceEpoch * 10 + _epochTicks;
}

DateTime fromTicksSinceEpoch(int value) {
  return DateTime.fromMicrosecondsSinceEpoch(
    _unixEpoc.ticks + value,
    isUtc: true,
  );
}

extension MapX<K, V> on Map<K, V> {
  T? mapAt<T>(K key, T? Function(V) map, [T? defaultValue]) {
    final value = this[key];
    return value == null ? defaultValue : map(value);
  }
}
