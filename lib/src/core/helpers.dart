import 'dart:math';

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

extension ListX<T> on List<T> {
  void sortBy(Object Function(T) map, {bool ascending = true}) {
    sort(
      ascending
          ? (e1, e2) => (map(e1) as Comparable<Object?>).compareTo(map(e2))
          : (e1, e2) => (map(e2) as Comparable<Object?>).compareTo(map(e1)),
    );
  }

  void shiftUp(bool Function(T) test) {
    shiftBy(test, up: true);
  }

  void shiftDown(bool Function(T) test) {
    shiftBy(test, up: false);
  }

  /// Shift values [up] or down if [test] is true
  void shiftBy(bool Function(T) test, {bool up = true}) {
    sortBy(
      (v) => up ? (test(v) ? 1 : 0) : (test(v) ? 0 : 1),
    );
  }

  void shuffleEnds(int lower, int upper, [Random? random]) {
    replaceRange(0, lower, sublist(0, lower)..shuffle(random));
    replaceRange(upper, length, sublist(upper, length)..shuffle(random));
  }

  void shuffleUp(bool Function(T) test, [Random? random]) {
    shuffleShift(test, up: true, random: random);
  }

  void shuffleDown(bool Function(T) test, [Random? random]) {
    shuffleShift(test, up: false, random: random);
  }

  void shuffleShift(bool Function(T) test, {bool up = true, Random? random}) {
    shiftBy(test, up: up);
    final found = where(test).length;
    final start = up ? length - found : 0;
    final end = up ? length : found;
    replaceRange(
      start,
      end,
      sublist(start, end)..shuffle(random),
    );
  }
}

extension MapX<K, V> on Map<K, V> {
  T? mapAt<T>(K key, T? Function(V) map, [T? defaultValue]) {
    final value = this[key];
    return value == null ? defaultValue : map(value);
  }
}
