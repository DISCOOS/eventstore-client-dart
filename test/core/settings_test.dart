import 'package:eventstore_client/eventstore_client.dart';
import 'package:test/test.dart';

void main() {
  test('ConnectionString with single ip-address parsed OK', () {
    // Arrange
    final connectionString = 'esdb://127.0.0.1:2113';

    // Act
    final settings = EventStoreClientSettings.parse(connectionString);

    // Assert
    expect(settings.isSingleNode, isTrue);
    expect(settings.address?.host, '127.0.0.1');
    expect(settings.address?.port, Defaults.GrpcPort);
    expect(settings.gossipSeeds.isEmpty, isTrue);
    expect(settings.useTls, isTrue);
  });

  test('ConnectionString with single host parsed OK', () {
    // Arrange
    final connectionString = 'esdb://some.dns:2113';

    // Act
    final settings = EventStoreClientSettings.parse(connectionString);

    // Assert
    expect(settings.isSingleNode, isTrue);
    expect(settings.address?.host, 'some.dns');
    expect(settings.address?.port, Defaults.GrpcPort);
    expect(settings.gossipSeeds.isEmpty, isTrue);
    expect(settings.useTls, isTrue);
  });

  test('ConnectionString with connectionName parsed OK', () {
    // Arrange
    final connectionString = 'esdb://127.0.0.1:2113?connectionName=test123';

    // Act
    final settings = EventStoreClientSettings.parse(connectionString);

    // Assert
    expect(settings.isSingleNode, isTrue);
    expect(settings.address?.host, '127.0.0.1');
    expect(settings.address?.port, Defaults.GrpcPort);
    expect(settings.gossipSeeds.isEmpty, isTrue);
    expect(settings.useTls, isTrue);
    expect(settings.connectionName, 'test123');
  });

  test('ConnectionString with all schema parts parsed OK', () {
    // Arrange
    final connectionString = 'esdb://username1:password1'
        '@127.0.0.1:2113'
        '?tls=false&keepAliveTimeout=5000&keepAliveInterval=10000';

    // Act
    final settings = EventStoreClientSettings.parse(connectionString);

    // Assert
    expect(settings.isSingleNode, isTrue);
    expect(settings.address?.host, '127.0.0.1');
    expect(settings.address?.port, Defaults.GrpcPort);
    expect(settings.gossipSeeds.isEmpty, isTrue);
    expect(settings.useTls, isFalse);
    expect(settings.defaultCredentials?.username, 'username1');
    expect(settings.defaultCredentials?.password, 'password1');
    expect(settings.keepAliveTimeout, Duration(milliseconds: 5000));
    expect(settings.keepAliveInterval, Duration(milliseconds: 10000));
  });

  test('ConnectionString with multiple hosts parsed OK', () {
    // Arrange
    final connectionString =
        'esdb://127.0.0.1:2113,127.0.0.2:2113,127.0.0.3:2113';

    // Act
    final settings = EventStoreClientSettings.parse(connectionString);

    // Assert
    expect(settings.isSingleNode, isFalse);
    expect(settings.gossipSeeds.length, 3);
    expect(settings.gossipSeeds[0].port, 2113);
    expect(settings.gossipSeeds[0].address, '127.0.0.1');
    expect(settings.gossipSeeds[1].port, 2113);
    expect(settings.gossipSeeds[1].address, '127.0.0.2');
    expect(settings.gossipSeeds[2].port, 2113);
    expect(settings.gossipSeeds[2].address, '127.0.0.3');
    expect(settings.useTls, isTrue);
  });

  test('ConnectionString with multiple hosts and all schema parts parsed OK',
      () {
    // Arrange
    final connectionString = 'esdb://username1:password1'
        '@127.0.0.1:2113,127.0.0.2:2113,127.0.0.3:2113'
        '?tls=false&keepAliveTimeout=5000&keepAliveInterval=10000';

    // Act
    final settings = EventStoreClientSettings.parse(connectionString);

    // Assert
    expect(settings.isSingleNode, isFalse);
    expect(settings.gossipSeeds.length, 3);
    expect(settings.gossipSeeds[0].port, 2113);
    expect(settings.gossipSeeds[0].address, '127.0.0.1');
    expect(settings.gossipSeeds[1].port, 2113);
    expect(settings.gossipSeeds[1].address, '127.0.0.2');
    expect(settings.gossipSeeds[2].port, 2113);
    expect(settings.gossipSeeds[2].address, '127.0.0.3');
    expect(settings.useTls, isFalse);
    expect(settings.defaultCredentials?.username, 'username1');
    expect(settings.defaultCredentials?.password, 'password1');
    expect(settings.keepAliveTimeout, Duration(milliseconds: 5000));
    expect(settings.keepAliveInterval, Duration(milliseconds: 10000));
  });

  test('ConnectionString with esdb+discover and single host parsed OK', () {
    // Arrange
    final connectionString = 'esdb+discover://username1:password1'
        '@127.0.0.1:2113'
        '?tls=false&keepAliveTimeout=5000&keepAliveInterval=10000';

    // Act
    final settings = EventStoreClientSettings.parse(connectionString);

    // Assert
    expect(settings.isSingleNode, isFalse);
    expect(settings.gossipSeeds.length, 1);
    expect(settings.gossipSeeds[0].port, 2113);
    expect(settings.gossipSeeds[0].address, '127.0.0.1');
    expect(settings.useTls, isFalse);
    expect(settings.defaultCredentials?.username, 'username1');
    expect(settings.defaultCredentials?.password, 'password1');
    expect(settings.keepAliveTimeout, Duration(milliseconds: 5000));
    expect(settings.keepAliveInterval, Duration(milliseconds: 10000));
  });

  test('ConnectionString with esdb+discover and multiple host parsed OK', () {
    // Arrange
    final connectionString = 'esdb+discover://username1:password1'
        '@127.0.0.1:2113,127.0.0.2:2113,127.0.0.3:2113'
        '?tls=false&keepAliveTimeout=5000&keepAliveInterval=10000';

    // Act
    final settings = EventStoreClientSettings.parse(connectionString);

    // Assert
    expect(settings.isSingleNode, isFalse);
    expect(settings.gossipSeeds.length, 3);
    expect(settings.gossipSeeds[0].port, 2113);
    expect(settings.gossipSeeds[0].address, '127.0.0.1');
    expect(settings.gossipSeeds[1].port, 2113);
    expect(settings.gossipSeeds[1].address, '127.0.0.2');
    expect(settings.gossipSeeds[2].port, 2113);
    expect(settings.gossipSeeds[2].address, '127.0.0.3');
    expect(settings.useTls, isFalse);
    expect(settings.defaultCredentials?.username, 'username1');
    expect(settings.defaultCredentials?.password, 'password1');
    expect(settings.keepAliveTimeout, Duration(milliseconds: 5000));
    expect(settings.keepAliveInterval, Duration(milliseconds: 10000));
  });
}
