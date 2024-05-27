// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Weapon_Provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getWeaponFromNameHash() => r'f8452c31e781756dc8822b9a126f7bcc2e333726';

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

/// See also [getWeaponFromName].
@ProviderFor(getWeaponFromName)
const getWeaponFromNameProvider = GetWeaponFromNameFamily();

/// See also [getWeaponFromName].
class GetWeaponFromNameFamily extends Family<AsyncValue<Weapon>> {
  /// See also [getWeaponFromName].
  const GetWeaponFromNameFamily();

  /// See also [getWeaponFromName].
  GetWeaponFromNameProvider call(
    String weaponName,
  ) {
    return GetWeaponFromNameProvider(
      weaponName,
    );
  }

  @override
  GetWeaponFromNameProvider getProviderOverride(
    covariant GetWeaponFromNameProvider provider,
  ) {
    return call(
      provider.weaponName,
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
  String? get name => r'getWeaponFromNameProvider';
}

/// See also [getWeaponFromName].
class GetWeaponFromNameProvider extends AutoDisposeFutureProvider<Weapon> {
  /// See also [getWeaponFromName].
  GetWeaponFromNameProvider(
    String weaponName,
  ) : this._internal(
          (ref) => getWeaponFromName(
            ref as GetWeaponFromNameRef,
            weaponName,
          ),
          from: getWeaponFromNameProvider,
          name: r'getWeaponFromNameProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getWeaponFromNameHash,
          dependencies: GetWeaponFromNameFamily._dependencies,
          allTransitiveDependencies:
              GetWeaponFromNameFamily._allTransitiveDependencies,
          weaponName: weaponName,
        );

  GetWeaponFromNameProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.weaponName,
  }) : super.internal();

  final String weaponName;

  @override
  Override overrideWith(
    FutureOr<Weapon> Function(GetWeaponFromNameRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetWeaponFromNameProvider._internal(
        (ref) => create(ref as GetWeaponFromNameRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        weaponName: weaponName,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Weapon> createElement() {
    return _GetWeaponFromNameProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetWeaponFromNameProvider && other.weaponName == weaponName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, weaponName.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetWeaponFromNameRef on AutoDisposeFutureProviderRef<Weapon> {
  /// The parameter `weaponName` of this provider.
  String get weaponName;
}

class _GetWeaponFromNameProviderElement
    extends AutoDisposeFutureProviderElement<Weapon> with GetWeaponFromNameRef {
  _GetWeaponFromNameProviderElement(super.provider);

  @override
  String get weaponName => (origin as GetWeaponFromNameProvider).weaponName;
}

String _$getWeaponsHash() => r'ad5a0cf70735b9d8cf9efc02d801ebca044c77f9';

/// See also [getWeapons].
@ProviderFor(getWeapons)
final getWeaponsProvider = AutoDisposeFutureProvider<List<Weapon>>.internal(
  getWeapons,
  name: r'getWeaponsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getWeaponsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetWeaponsRef = AutoDisposeFutureProviderRef<List<Weapon>>;
String _$getWeaponsByTypeHash() => r'99339a113bfcf5ddde64c2a2c56d124c4739de23';

/// See also [getWeaponsByType].
@ProviderFor(getWeaponsByType)
const getWeaponsByTypeProvider = GetWeaponsByTypeFamily();

/// See also [getWeaponsByType].
class GetWeaponsByTypeFamily extends Family<AsyncValue<List<Weapon>>> {
  /// See also [getWeaponsByType].
  const GetWeaponsByTypeFamily();

  /// See also [getWeaponsByType].
  GetWeaponsByTypeProvider call(
    String type,
  ) {
    return GetWeaponsByTypeProvider(
      type,
    );
  }

  @override
  GetWeaponsByTypeProvider getProviderOverride(
    covariant GetWeaponsByTypeProvider provider,
  ) {
    return call(
      provider.type,
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
  String? get name => r'getWeaponsByTypeProvider';
}

/// See also [getWeaponsByType].
class GetWeaponsByTypeProvider extends AutoDisposeFutureProvider<List<Weapon>> {
  /// See also [getWeaponsByType].
  GetWeaponsByTypeProvider(
    String type,
  ) : this._internal(
          (ref) => getWeaponsByType(
            ref as GetWeaponsByTypeRef,
            type,
          ),
          from: getWeaponsByTypeProvider,
          name: r'getWeaponsByTypeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getWeaponsByTypeHash,
          dependencies: GetWeaponsByTypeFamily._dependencies,
          allTransitiveDependencies:
              GetWeaponsByTypeFamily._allTransitiveDependencies,
          type: type,
        );

  GetWeaponsByTypeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.type,
  }) : super.internal();

  final String type;

  @override
  Override overrideWith(
    FutureOr<List<Weapon>> Function(GetWeaponsByTypeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetWeaponsByTypeProvider._internal(
        (ref) => create(ref as GetWeaponsByTypeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        type: type,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Weapon>> createElement() {
    return _GetWeaponsByTypeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetWeaponsByTypeProvider && other.type == type;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetWeaponsByTypeRef on AutoDisposeFutureProviderRef<List<Weapon>> {
  /// The parameter `type` of this provider.
  String get type;
}

class _GetWeaponsByTypeProviderElement
    extends AutoDisposeFutureProviderElement<List<Weapon>>
    with GetWeaponsByTypeRef {
  _GetWeaponsByTypeProviderElement(super.provider);

  @override
  String get type => (origin as GetWeaponsByTypeProvider).type;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
