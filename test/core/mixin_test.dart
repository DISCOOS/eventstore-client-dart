import 'package:test/test.dart';

void main() {
  test('The method in last mixin takes precedence ', () {
    // Arrange
    final base = BaseClass();
    final class1 = Class1();
    final class2 = Class2();
    final mixinClass1 = MixinClass1();
    final mixinClass2 = MixinClass2();

    // Assert
    expect(base.toInt(), 0);

    expect(class1.toInt(), 1);
    expect(class1.toBaseInt(), 1);

    expect(class2.toInt(), 2);
    expect(class2.toBaseInt(), 2);

    expect(mixinClass1.toInt(), 1);
    expect(mixinClass1.toBaseInt(), 1);

    expect(mixinClass2.toInt(), 2);
    expect(mixinClass2.toBaseInt(), 2);
  });
}

class BaseClass {
  int toInt() => 0;
  int toBaseInt() => toInt();
}

class Class1 extends BaseClass {
  @override
  int toInt() => 1;
}

class Class2 extends BaseClass {
  @override
  int toInt() => 2;
}

mixin Mixin1 on BaseClass {
  @override
  int toInt() => 1;
}

mixin Mixin2 on BaseClass {
  @override
  int toInt() => 2;
}

class MixinClass1 extends BaseClass with Mixin2, Mixin1 {}

class MixinClass2 extends BaseClass with Mixin1, Mixin2 {}
