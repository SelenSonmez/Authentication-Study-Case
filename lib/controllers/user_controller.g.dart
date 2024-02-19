// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userModelHash() => r'14f3eb8d85fd4db41990615b4a6b5e13a087c784';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [userModel].
@ProviderFor(userModel)
const userModelProvider = UserModelFamily();

/// See also [userModel].
class UserModelFamily extends Family<AsyncValue<UserModel>> {
  /// See also [userModel].
  const UserModelFamily();

  /// See also [userModel].
  UserModelProvider call(
    Map<String, dynamic> credentials,
  ) {
    return UserModelProvider(
      credentials,
    );
  }

  @override
  UserModelProvider getProviderOverride(
    covariant UserModelProvider provider,
  ) {
    return call(
      provider.credentials,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'userModelProvider';
}

/// See also [userModel].
class UserModelProvider extends AutoDisposeFutureProvider<UserModel> {
  /// See also [userModel].
  UserModelProvider(
    Map<String, dynamic> credentials,
  ) : this._internal(
          (ref) => userModel(
            ref as UserModelRef,
            credentials,
          ),
          from: userModelProvider,
          name: r'userModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$userModelHash,
          dependencies: UserModelFamily._dependencies,
          allTransitiveDependencies: UserModelFamily._allTransitiveDependencies,
          credentials: credentials,
        );

  UserModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.credentials,
  }) : super.internal();

  final Map<String, dynamic> credentials;

  @override
  Override overrideWith(
    FutureOr<UserModel> Function(UserModelRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UserModelProvider._internal(
        (ref) => create(ref as UserModelRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        credentials: credentials,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<UserModel> createElement() {
    return _UserModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserModelProvider && other.credentials == credentials;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, credentials.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UserModelRef on AutoDisposeFutureProviderRef<UserModel> {
  /// The parameter `credentials` of this provider.
  Map<String, dynamic> get credentials;
}

class _UserModelProviderElement
    extends AutoDisposeFutureProviderElement<UserModel> with UserModelRef {
  _UserModelProviderElement(super.provider);

  @override
  Map<String, dynamic> get credentials =>
      (origin as UserModelProvider).credentials;
}

String _$attendeeModelHash() => r'5709ff0d945bc5e9c29a97d44c71173ba8ddde1b';

/// See also [attendeeModel].
@ProviderFor(attendeeModel)
final attendeeModelProvider =
    AutoDisposeFutureProvider<List<AtendeeModel>>.internal(
  attendeeModel,
  name: r'attendeeModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$attendeeModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AttendeeModelRef = AutoDisposeFutureProviderRef<List<AtendeeModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
