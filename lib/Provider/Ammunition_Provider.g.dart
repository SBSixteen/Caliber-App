// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Ammunition_Provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getAmmunitionByCaliberHash() =>
    r'013f4c9e75b79c708b9f0d219f9c5836c57bea62';

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

/// See also [getAmmunitionByCaliber].
@ProviderFor(getAmmunitionByCaliber)
const getAmmunitionByCaliberProvider = GetAmmunitionByCaliberFamily();

/// See also [getAmmunitionByCaliber].
class GetAmmunitionByCaliberFamily
    extends Family<AsyncValue<List<Ammunition>>> {
  /// See also [getAmmunitionByCaliber].
  const GetAmmunitionByCaliberFamily();

  /// See also [getAmmunitionByCaliber].
  GetAmmunitionByCaliberProvider call(
    String caliber,
  ) {
    return GetAmmunitionByCaliberProvider(
      caliber,
    );
  }

  @override
  GetAmmunitionByCaliberProvider getProviderOverride(
    covariant GetAmmunitionByCaliberProvider provider,
  ) {
    return call(
      provider.caliber,
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
  String? get name => r'getAmmunitionByCaliberProvider';
}

/// See also [getAmmunitionByCaliber].
class GetAmmunitionByCaliberProvider
    extends AutoDisposeFutureProvider<List<Ammunition>> {
  /// See also [getAmmunitionByCaliber].
  GetAmmunitionByCaliberProvider(
    String caliber,
  ) : this._internal(
          (ref) => getAmmunitionByCaliber(
            ref as GetAmmunitionByCaliberRef,
            caliber,
          ),
          from: getAmmunitionByCaliberProvider,
          name: r'getAmmunitionByCaliberProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getAmmunitionByCaliberHash,
          dependencies: GetAmmunitionByCaliberFamily._dependencies,
          allTransitiveDependencies:
              GetAmmunitionByCaliberFamily._allTransitiveDependencies,
          caliber: caliber,
        );

  GetAmmunitionByCaliberProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.caliber,
  }) : super.internal();

  final String caliber;

  @override
  Override overrideWith(
    FutureOr<List<Ammunition>> Function(GetAmmunitionByCaliberRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetAmmunitionByCaliberProvider._internal(
        (ref) => create(ref as GetAmmunitionByCaliberRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        caliber: caliber,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Ammunition>> createElement() {
    return _GetAmmunitionByCaliberProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetAmmunitionByCaliberProvider && other.caliber == caliber;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, caliber.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetAmmunitionByCaliberRef
    on AutoDisposeFutureProviderRef<List<Ammunition>> {
  /// The parameter `caliber` of this provider.
  String get caliber;
}

class _GetAmmunitionByCaliberProviderElement
    extends AutoDisposeFutureProviderElement<List<Ammunition>>
    with GetAmmunitionByCaliberRef {
  _GetAmmunitionByCaliberProviderElement(super.provider);

  @override
  String get caliber => (origin as GetAmmunitionByCaliberProvider).caliber;
}

String _$getCalibersHash() => r'f9403b1056697b6086f1dccb871ff6c0c820ea97';

/// See also [getCalibers].
@ProviderFor(getCalibers)
final getCalibersProvider = AutoDisposeFutureProvider<List<String>>.internal(
  getCalibers,
  name: r'getCalibersProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getCalibersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetCalibersRef = AutoDisposeFutureProviderRef<List<String>>;
String _$getAmmunitionHash() => r'b6f542ddd06e5b689b9e2939792bb2521442939a';

/// See also [getAmmunition].
@ProviderFor(getAmmunition)
const getAmmunitionProvider = GetAmmunitionFamily();

/// See also [getAmmunition].
class GetAmmunitionFamily extends Family<AsyncValue<Ammunition>> {
  /// See also [getAmmunition].
  const GetAmmunitionFamily();

  /// See also [getAmmunition].
  GetAmmunitionProvider call(
    String caliber,
    String variant,
  ) {
    return GetAmmunitionProvider(
      caliber,
      variant,
    );
  }

  @override
  GetAmmunitionProvider getProviderOverride(
    covariant GetAmmunitionProvider provider,
  ) {
    return call(
      provider.caliber,
      provider.variant,
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
  String? get name => r'getAmmunitionProvider';
}

/// See also [getAmmunition].
class GetAmmunitionProvider extends AutoDisposeFutureProvider<Ammunition> {
  /// See also [getAmmunition].
  GetAmmunitionProvider(
    String caliber,
    String variant,
  ) : this._internal(
          (ref) => getAmmunition(
            ref as GetAmmunitionRef,
            caliber,
            variant,
          ),
          from: getAmmunitionProvider,
          name: r'getAmmunitionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getAmmunitionHash,
          dependencies: GetAmmunitionFamily._dependencies,
          allTransitiveDependencies:
              GetAmmunitionFamily._allTransitiveDependencies,
          caliber: caliber,
          variant: variant,
        );

  GetAmmunitionProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.caliber,
    required this.variant,
  }) : super.internal();

  final String caliber;
  final String variant;

  @override
  Override overrideWith(
    FutureOr<Ammunition> Function(GetAmmunitionRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetAmmunitionProvider._internal(
        (ref) => create(ref as GetAmmunitionRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        caliber: caliber,
        variant: variant,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Ammunition> createElement() {
    return _GetAmmunitionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetAmmunitionProvider &&
        other.caliber == caliber &&
        other.variant == variant;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, caliber.hashCode);
    hash = _SystemHash.combine(hash, variant.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetAmmunitionRef on AutoDisposeFutureProviderRef<Ammunition> {
  /// The parameter `caliber` of this provider.
  String get caliber;

  /// The parameter `variant` of this provider.
  String get variant;
}

class _GetAmmunitionProviderElement
    extends AutoDisposeFutureProviderElement<Ammunition> with GetAmmunitionRef {
  _GetAmmunitionProviderElement(super.provider);

  @override
  String get caliber => (origin as GetAmmunitionProvider).caliber;
  @override
  String get variant => (origin as GetAmmunitionProvider).variant;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
