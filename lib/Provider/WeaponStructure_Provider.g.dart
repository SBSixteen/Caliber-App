// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'WeaponStructure_Provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getWeaponAttachmentPositionsHash() =>
    r'f1a71cf2a3a03452f5324efce1d5d5df2fed5bf8';

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

/// See also [getWeaponAttachmentPositions].
@ProviderFor(getWeaponAttachmentPositions)
const getWeaponAttachmentPositionsProvider =
    GetWeaponAttachmentPositionsFamily();

/// See also [getWeaponAttachmentPositions].
class GetWeaponAttachmentPositionsFamily
    extends Family<AsyncValue<List<String>>> {
  /// See also [getWeaponAttachmentPositions].
  const GetWeaponAttachmentPositionsFamily();

  /// See also [getWeaponAttachmentPositions].
  GetWeaponAttachmentPositionsProvider call(
    String weaponName,
  ) {
    return GetWeaponAttachmentPositionsProvider(
      weaponName,
    );
  }

  @override
  GetWeaponAttachmentPositionsProvider getProviderOverride(
    covariant GetWeaponAttachmentPositionsProvider provider,
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
  String? get name => r'getWeaponAttachmentPositionsProvider';
}

/// See also [getWeaponAttachmentPositions].
class GetWeaponAttachmentPositionsProvider
    extends AutoDisposeFutureProvider<List<String>> {
  /// See also [getWeaponAttachmentPositions].
  GetWeaponAttachmentPositionsProvider(
    String weaponName,
  ) : this._internal(
          (ref) => getWeaponAttachmentPositions(
            ref as GetWeaponAttachmentPositionsRef,
            weaponName,
          ),
          from: getWeaponAttachmentPositionsProvider,
          name: r'getWeaponAttachmentPositionsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getWeaponAttachmentPositionsHash,
          dependencies: GetWeaponAttachmentPositionsFamily._dependencies,
          allTransitiveDependencies:
              GetWeaponAttachmentPositionsFamily._allTransitiveDependencies,
          weaponName: weaponName,
        );

  GetWeaponAttachmentPositionsProvider._internal(
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
    FutureOr<List<String>> Function(GetWeaponAttachmentPositionsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetWeaponAttachmentPositionsProvider._internal(
        (ref) => create(ref as GetWeaponAttachmentPositionsRef),
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
  AutoDisposeFutureProviderElement<List<String>> createElement() {
    return _GetWeaponAttachmentPositionsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetWeaponAttachmentPositionsProvider &&
        other.weaponName == weaponName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, weaponName.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetWeaponAttachmentPositionsRef
    on AutoDisposeFutureProviderRef<List<String>> {
  /// The parameter `weaponName` of this provider.
  String get weaponName;
}

class _GetWeaponAttachmentPositionsProviderElement
    extends AutoDisposeFutureProviderElement<List<String>>
    with GetWeaponAttachmentPositionsRef {
  _GetWeaponAttachmentPositionsProviderElement(super.provider);

  @override
  String get weaponName =>
      (origin as GetWeaponAttachmentPositionsProvider).weaponName;
}

String _$getDefaultWeaponStructureOfHash() =>
    r'9c5a09dd1129f9b8ee05d6813c65f168db97f128';

/// See also [getDefaultWeaponStructureOf].
@ProviderFor(getDefaultWeaponStructureOf)
const getDefaultWeaponStructureOfProvider = GetDefaultWeaponStructureOfFamily();

/// See also [getDefaultWeaponStructureOf].
class GetDefaultWeaponStructureOfFamily
    extends Family<AsyncValue<WeaponStructure>> {
  /// See also [getDefaultWeaponStructureOf].
  const GetDefaultWeaponStructureOfFamily();

  /// See also [getDefaultWeaponStructureOf].
  GetDefaultWeaponStructureOfProvider call(
    String weaponName,
  ) {
    return GetDefaultWeaponStructureOfProvider(
      weaponName,
    );
  }

  @override
  GetDefaultWeaponStructureOfProvider getProviderOverride(
    covariant GetDefaultWeaponStructureOfProvider provider,
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
  String? get name => r'getDefaultWeaponStructureOfProvider';
}

/// See also [getDefaultWeaponStructureOf].
class GetDefaultWeaponStructureOfProvider
    extends AutoDisposeFutureProvider<WeaponStructure> {
  /// See also [getDefaultWeaponStructureOf].
  GetDefaultWeaponStructureOfProvider(
    String weaponName,
  ) : this._internal(
          (ref) => getDefaultWeaponStructureOf(
            ref as GetDefaultWeaponStructureOfRef,
            weaponName,
          ),
          from: getDefaultWeaponStructureOfProvider,
          name: r'getDefaultWeaponStructureOfProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getDefaultWeaponStructureOfHash,
          dependencies: GetDefaultWeaponStructureOfFamily._dependencies,
          allTransitiveDependencies:
              GetDefaultWeaponStructureOfFamily._allTransitiveDependencies,
          weaponName: weaponName,
        );

  GetDefaultWeaponStructureOfProvider._internal(
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
    FutureOr<WeaponStructure> Function(GetDefaultWeaponStructureOfRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetDefaultWeaponStructureOfProvider._internal(
        (ref) => create(ref as GetDefaultWeaponStructureOfRef),
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
  AutoDisposeFutureProviderElement<WeaponStructure> createElement() {
    return _GetDefaultWeaponStructureOfProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetDefaultWeaponStructureOfProvider &&
        other.weaponName == weaponName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, weaponName.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetDefaultWeaponStructureOfRef
    on AutoDisposeFutureProviderRef<WeaponStructure> {
  /// The parameter `weaponName` of this provider.
  String get weaponName;
}

class _GetDefaultWeaponStructureOfProviderElement
    extends AutoDisposeFutureProviderElement<WeaponStructure>
    with GetDefaultWeaponStructureOfRef {
  _GetDefaultWeaponStructureOfProviderElement(super.provider);

  @override
  String get weaponName =>
      (origin as GetDefaultWeaponStructureOfProvider).weaponName;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
