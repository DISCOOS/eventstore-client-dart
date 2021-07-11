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
