import 'dart:math';

import 'package:eventstore_client/src/core/helpers.dart';
import 'package:test/test.dart';

void main() {
  final RND = Random(10);
  const EVEN = [0, 2, 4, 6, 8];
  const ODD = <int>[1, 3, 5, 7, 9];
  const UnixEpochTicks = 621355968000000000;
  final UnixEpochInLocal = DateTime.fromMicrosecondsSinceEpoch(0);
  final UnixEpochInUtc = DateTime.fromMicrosecondsSinceEpoch(0, isUtc: true);

  test('DateTimeX converts ticks to unix epoch in utc', () {
    // Assert lower boundary == UnixEpoch
    final dt = fromTicksSinceEpoch(0, inUtc: true);
    expect(
      dt,
      UnixEpochInUtc,
      reason: 'should be UnixEpoch',
    );
  });

  test('DateTimeX converts ticks to unix epoch in local', () {
    // Assert lower boundary == UnixEpoch
    final dt = fromTicksSinceEpoch(0);
    expect(
      dt,
      UnixEpochInLocal,
      reason: 'should be UnixEpoch',
    );
  });

  test('DateTimeX converts now to ticks back to DateTime in utc', () {
    // Assert lower boundary == UnixEpoch
    final now = DateTime.now().toUtc();
    final ticks = now.ticks;
    final then = fromTicksSinceEpoch(ticks, inUtc: true);
    expect(
      then,
      now,
      reason: 'should be the same',
    );
  });

  test('DateTimeX converts now to ticks back to DateTime in local', () {
    // Assert lower boundary == UnixEpoch
    final now = DateTime.now();
    final ticks = now.ticks;
    final then = fromTicksSinceEpoch(ticks);
    expect(
      then,
      now,
      reason: 'should be the same',
    );
  });

  test('ListX sort elements ascending by given key', () {
    // Arrange
    final items = List<int>.generate(10, (index) => index);

    // Act
    final sorted = items.toList()
      ..sortBy(
        (value) => value.isEven ? 1 : 0,
      );

    // Assert
    expect(sorted.length, 10);
    expect(sorted, equals([...ODD, ...EVEN]));
  });

  test('ListX sort elements descending by given key', () {
    // Arrange
    final items = List<int>.generate(10, (index) => index);

    // Act
    final sorted = items.toList()
      ..sortBy(
        (value) => value.isEven ? 1 : 0,
        ascending: false,
      );

    // Assert
    expect(sorted.length, 10);
    expect(sorted, equals([...EVEN, ...ODD]));
  });

  test('ListX shift elements up by given key', () {
    // Arrange
    final items = List<int>.generate(10, (index) => index);

    // Act
    final sorted = items.toList()
      ..shiftUp(
        (value) => value.isEven,
      );

    // Assert
    expect(sorted.length, 10);
    expect(sorted, equals([...ODD, ...EVEN]));
  });

  test('ListX shift elements down by given key', () {
    // Arrange
    final items = List<int>.generate(10, (index) => index);

    // Act
    final sorted = items.toList()
      ..shiftDown(
        (value) => value.isEven,
      );

    // Assert
    expect(sorted.length, 10);
    expect(sorted, equals([...EVEN, ...ODD]));
  });

  test('ListX shifts elements up and shuffles them', () {
    // Arrange
    final items = List<int>.generate(10, (index) => index);

    // Act
    final sorted = items.toList()
      ..shuffleUp(
        (value) => value.isEven,
        RND,
      );

    // Assert
    expect(sorted.length, 10);
    expect(sorted, containsAll(items));
    expect(sorted.sublist(0, 5), equals(ODD));
    expect(sorted.sublist(5, 10), containsAll(EVEN));
    expect(sorted.sublist(5, 10), isNot(equals(EVEN)));
  });

  test('ListX shifts elements down and shuffles them', () {
    // Arrange
    final items = List<int>.generate(10, (index) => index);

    // Act
    final sorted = items.toList()
      ..shuffleDown(
        (value) => value.isEven,
        RND,
      );

    // Assert
    expect(sorted.length, 10);
    expect(sorted, containsAll(items));
    expect(sorted.sublist(0, 5), containsAll(EVEN));
    expect(sorted.sublist(0, 5), isNot(equals(EVEN)));
    expect(sorted.sublist(5, 10), equals(ODD));
  });

  test('ListX shuffles ends given by lower and upper bounds', () {
    // Arrange
    final items = List<int>.generate(10, (index) => index);

    // Act
    final sorted = items.toList()..shuffleEnds(3, 7, RND);

    // Assert
    expect(sorted.length, 10);
    expect(sorted, containsAll(items));
    expect(sorted.sublist(0, 3), containsAll(<int>[0, 1, 2]));
    expect(sorted.sublist(3, 7), containsAllInOrder(<int>[3, 4, 5, 6]));
    expect(sorted.sublist(7, 10), containsAll(<int>[7, 8, 9]));
  });
}
