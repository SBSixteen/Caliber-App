// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Attachment_Provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getAttachmentsByPositionHash() =>
    r'240a699aff2a7212777a5aa36e880454426154a6';

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

/// See also [getAttachmentsByPosition].
@ProviderFor(getAttachmentsByPosition)
const getAttachmentsByPositionProvider = GetAttachmentsByPositionFamily();

/// See also [getAttachmentsByPosition].
class GetAttachmentsByPositionFamily
    extends Family<AsyncValue<List<Attachment>>> {
  /// See also [getAttachmentsByPosition].
  const GetAttachmentsByPositionFamily();

  /// See also [getAttachmentsByPosition].
  GetAttachmentsByPositionProvider call(
    String position,
  ) {
    return GetAttachmentsByPositionProvider(
      position,
    );
  }

  @override
  GetAttachmentsByPositionProvider getProviderOverride(
    covariant GetAttachmentsByPositionProvider provider,
  ) {
    return call(
      provider.position,
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
  String? get name => r'getAttachmentsByPositionProvider';
}

/// See also [getAttachmentsByPosition].
class GetAttachmentsByPositionProvider
    extends AutoDisposeFutureProvider<List<Attachment>> {
  /// See also [getAttachmentsByPosition].
  GetAttachmentsByPositionProvider(
    String position,
  ) : this._internal(
          (ref) => getAttachmentsByPosition(
            ref as GetAttachmentsByPositionRef,
            position,
          ),
          from: getAttachmentsByPositionProvider,
          name: r'getAttachmentsByPositionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getAttachmentsByPositionHash,
          dependencies: GetAttachmentsByPositionFamily._dependencies,
          allTransitiveDependencies:
              GetAttachmentsByPositionFamily._allTransitiveDependencies,
          position: position,
        );

  GetAttachmentsByPositionProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.position,
  }) : super.internal();

  final String position;

  @override
  Override overrideWith(
    FutureOr<List<Attachment>> Function(GetAttachmentsByPositionRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetAttachmentsByPositionProvider._internal(
        (ref) => create(ref as GetAttachmentsByPositionRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        position: position,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Attachment>> createElement() {
    return _GetAttachmentsByPositionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetAttachmentsByPositionProvider &&
        other.position == position;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, position.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetAttachmentsByPositionRef
    on AutoDisposeFutureProviderRef<List<Attachment>> {
  /// The parameter `position` of this provider.
  String get position;
}

class _GetAttachmentsByPositionProviderElement
    extends AutoDisposeFutureProviderElement<List<Attachment>>
    with GetAttachmentsByPositionRef {
  _GetAttachmentsByPositionProviderElement(super.provider);

  @override
  String get position => (origin as GetAttachmentsByPositionProvider).position;
}

String _$getAllAttachmentsHash() => r'6cfd7dfaa38bb81f839862341b551a536153d027';

/// See also [getAllAttachments].
@ProviderFor(getAllAttachments)
const getAllAttachmentsProvider = GetAllAttachmentsFamily();

/// See also [getAllAttachments].
class GetAllAttachmentsFamily extends Family<AsyncValue<List<Attachment>>> {
  /// See also [getAllAttachments].
  const GetAllAttachmentsFamily();

  /// See also [getAllAttachments].
  GetAllAttachmentsProvider call(
    String position,
  ) {
    return GetAllAttachmentsProvider(
      position,
    );
  }

  @override
  GetAllAttachmentsProvider getProviderOverride(
    covariant GetAllAttachmentsProvider provider,
  ) {
    return call(
      provider.position,
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
  String? get name => r'getAllAttachmentsProvider';
}

/// See also [getAllAttachments].
class GetAllAttachmentsProvider
    extends AutoDisposeFutureProvider<List<Attachment>> {
  /// See also [getAllAttachments].
  GetAllAttachmentsProvider(
    String position,
  ) : this._internal(
          (ref) => getAllAttachments(
            ref as GetAllAttachmentsRef,
            position,
          ),
          from: getAllAttachmentsProvider,
          name: r'getAllAttachmentsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getAllAttachmentsHash,
          dependencies: GetAllAttachmentsFamily._dependencies,
          allTransitiveDependencies:
              GetAllAttachmentsFamily._allTransitiveDependencies,
          position: position,
        );

  GetAllAttachmentsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.position,
  }) : super.internal();

  final String position;

  @override
  Override overrideWith(
    FutureOr<List<Attachment>> Function(GetAllAttachmentsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetAllAttachmentsProvider._internal(
        (ref) => create(ref as GetAllAttachmentsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        position: position,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Attachment>> createElement() {
    return _GetAllAttachmentsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetAllAttachmentsProvider && other.position == position;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, position.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetAllAttachmentsRef on AutoDisposeFutureProviderRef<List<Attachment>> {
  /// The parameter `position` of this provider.
  String get position;
}

class _GetAllAttachmentsProviderElement
    extends AutoDisposeFutureProviderElement<List<Attachment>>
    with GetAllAttachmentsRef {
  _GetAllAttachmentsProviderElement(super.provider);

  @override
  String get position => (origin as GetAllAttachmentsProvider).position;
}

String _$getDefaultWeaponPartByPositionHash() =>
    r'a9f22cd9026bed87faf3283c997ede94c73b7b90';

/// See also [getDefaultWeaponPartByPosition].
@ProviderFor(getDefaultWeaponPartByPosition)
const getDefaultWeaponPartByPositionProvider =
    GetDefaultWeaponPartByPositionFamily();

/// See also [getDefaultWeaponPartByPosition].
class GetDefaultWeaponPartByPositionFamily
    extends Family<AsyncValue<Attachment>> {
  /// See also [getDefaultWeaponPartByPosition].
  const GetDefaultWeaponPartByPositionFamily();

  /// See also [getDefaultWeaponPartByPosition].
  GetDefaultWeaponPartByPositionProvider call(
    String weaponName,
    String position,
  ) {
    return GetDefaultWeaponPartByPositionProvider(
      weaponName,
      position,
    );
  }

  @override
  GetDefaultWeaponPartByPositionProvider getProviderOverride(
    covariant GetDefaultWeaponPartByPositionProvider provider,
  ) {
    return call(
      provider.weaponName,
      provider.position,
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
  String? get name => r'getDefaultWeaponPartByPositionProvider';
}

/// See also [getDefaultWeaponPartByPosition].
class GetDefaultWeaponPartByPositionProvider
    extends AutoDisposeFutureProvider<Attachment> {
  /// See also [getDefaultWeaponPartByPosition].
  GetDefaultWeaponPartByPositionProvider(
    String weaponName,
    String position,
  ) : this._internal(
          (ref) => getDefaultWeaponPartByPosition(
            ref as GetDefaultWeaponPartByPositionRef,
            weaponName,
            position,
          ),
          from: getDefaultWeaponPartByPositionProvider,
          name: r'getDefaultWeaponPartByPositionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getDefaultWeaponPartByPositionHash,
          dependencies: GetDefaultWeaponPartByPositionFamily._dependencies,
          allTransitiveDependencies:
              GetDefaultWeaponPartByPositionFamily._allTransitiveDependencies,
          weaponName: weaponName,
          position: position,
        );

  GetDefaultWeaponPartByPositionProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.weaponName,
    required this.position,
  }) : super.internal();

  final String weaponName;
  final String position;

  @override
  Override overrideWith(
    FutureOr<Attachment> Function(GetDefaultWeaponPartByPositionRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetDefaultWeaponPartByPositionProvider._internal(
        (ref) => create(ref as GetDefaultWeaponPartByPositionRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        weaponName: weaponName,
        position: position,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Attachment> createElement() {
    return _GetDefaultWeaponPartByPositionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetDefaultWeaponPartByPositionProvider &&
        other.weaponName == weaponName &&
        other.position == position;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, weaponName.hashCode);
    hash = _SystemHash.combine(hash, position.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetDefaultWeaponPartByPositionRef
    on AutoDisposeFutureProviderRef<Attachment> {
  /// The parameter `weaponName` of this provider.
  String get weaponName;

  /// The parameter `position` of this provider.
  String get position;
}

class _GetDefaultWeaponPartByPositionProviderElement
    extends AutoDisposeFutureProviderElement<Attachment>
    with GetDefaultWeaponPartByPositionRef {
  _GetDefaultWeaponPartByPositionProviderElement(super.provider);

  @override
  String get weaponName =>
      (origin as GetDefaultWeaponPartByPositionProvider).weaponName;
  @override
  String get position =>
      (origin as GetDefaultWeaponPartByPositionProvider).position;
}

String _$getDefaultWeaponPartsHash() =>
    r'793b4f700c42e4380cad9250813c612a0b599d1d';

/// See also [getDefaultWeaponParts].
@ProviderFor(getDefaultWeaponParts)
const getDefaultWeaponPartsProvider = GetDefaultWeaponPartsFamily();

/// See also [getDefaultWeaponParts].
class GetDefaultWeaponPartsFamily extends Family<AsyncValue<List<Attachment>>> {
  /// See also [getDefaultWeaponParts].
  const GetDefaultWeaponPartsFamily();

  /// See also [getDefaultWeaponParts].
  GetDefaultWeaponPartsProvider call(
    String weaponName,
  ) {
    return GetDefaultWeaponPartsProvider(
      weaponName,
    );
  }

  @override
  GetDefaultWeaponPartsProvider getProviderOverride(
    covariant GetDefaultWeaponPartsProvider provider,
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
  String? get name => r'getDefaultWeaponPartsProvider';
}

/// See also [getDefaultWeaponParts].
class GetDefaultWeaponPartsProvider
    extends AutoDisposeFutureProvider<List<Attachment>> {
  /// See also [getDefaultWeaponParts].
  GetDefaultWeaponPartsProvider(
    String weaponName,
  ) : this._internal(
          (ref) => getDefaultWeaponParts(
            ref as GetDefaultWeaponPartsRef,
            weaponName,
          ),
          from: getDefaultWeaponPartsProvider,
          name: r'getDefaultWeaponPartsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getDefaultWeaponPartsHash,
          dependencies: GetDefaultWeaponPartsFamily._dependencies,
          allTransitiveDependencies:
              GetDefaultWeaponPartsFamily._allTransitiveDependencies,
          weaponName: weaponName,
        );

  GetDefaultWeaponPartsProvider._internal(
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
    FutureOr<List<Attachment>> Function(GetDefaultWeaponPartsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetDefaultWeaponPartsProvider._internal(
        (ref) => create(ref as GetDefaultWeaponPartsRef),
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
  AutoDisposeFutureProviderElement<List<Attachment>> createElement() {
    return _GetDefaultWeaponPartsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetDefaultWeaponPartsProvider &&
        other.weaponName == weaponName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, weaponName.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetDefaultWeaponPartsRef
    on AutoDisposeFutureProviderRef<List<Attachment>> {
  /// The parameter `weaponName` of this provider.
  String get weaponName;
}

class _GetDefaultWeaponPartsProviderElement
    extends AutoDisposeFutureProviderElement<List<Attachment>>
    with GetDefaultWeaponPartsRef {
  _GetDefaultWeaponPartsProviderElement(super.provider);

  @override
  String get weaponName => (origin as GetDefaultWeaponPartsProvider).weaponName;
}

String _$getDovetailAttachmentsHash() =>
    r'48f9da49bb9405354a06be74ba1bdc5e688d989b';

/// See also [getDovetailAttachments].
@ProviderFor(getDovetailAttachments)
final getDovetailAttachmentsProvider =
    AutoDisposeFutureProvider<List<Attachment>>.internal(
  getDovetailAttachments,
  name: r'getDovetailAttachmentsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getDovetailAttachmentsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetDovetailAttachmentsRef
    = AutoDisposeFutureProviderRef<List<Attachment>>;
String _$getCountCompatibleWeaponPositionAttachmentsHash() =>
    r'98dd0311f6d096c1710e5952c6dff5ce5de5d7d2';

/// See also [getCountCompatibleWeaponPositionAttachments].
@ProviderFor(getCountCompatibleWeaponPositionAttachments)
const getCountCompatibleWeaponPositionAttachmentsProvider =
    GetCountCompatibleWeaponPositionAttachmentsFamily();

/// See also [getCountCompatibleWeaponPositionAttachments].
class GetCountCompatibleWeaponPositionAttachmentsFamily
    extends Family<AsyncValue<int>> {
  /// See also [getCountCompatibleWeaponPositionAttachments].
  const GetCountCompatibleWeaponPositionAttachmentsFamily();

  /// See also [getCountCompatibleWeaponPositionAttachments].
  GetCountCompatibleWeaponPositionAttachmentsProvider call(
    String gunname,
    String position,
  ) {
    return GetCountCompatibleWeaponPositionAttachmentsProvider(
      gunname,
      position,
    );
  }

  @override
  GetCountCompatibleWeaponPositionAttachmentsProvider getProviderOverride(
    covariant GetCountCompatibleWeaponPositionAttachmentsProvider provider,
  ) {
    return call(
      provider.gunname,
      provider.position,
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
  String? get name => r'getCountCompatibleWeaponPositionAttachmentsProvider';
}

/// See also [getCountCompatibleWeaponPositionAttachments].
class GetCountCompatibleWeaponPositionAttachmentsProvider
    extends AutoDisposeFutureProvider<int> {
  /// See also [getCountCompatibleWeaponPositionAttachments].
  GetCountCompatibleWeaponPositionAttachmentsProvider(
    String gunname,
    String position,
  ) : this._internal(
          (ref) => getCountCompatibleWeaponPositionAttachments(
            ref as GetCountCompatibleWeaponPositionAttachmentsRef,
            gunname,
            position,
          ),
          from: getCountCompatibleWeaponPositionAttachmentsProvider,
          name: r'getCountCompatibleWeaponPositionAttachmentsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getCountCompatibleWeaponPositionAttachmentsHash,
          dependencies:
              GetCountCompatibleWeaponPositionAttachmentsFamily._dependencies,
          allTransitiveDependencies:
              GetCountCompatibleWeaponPositionAttachmentsFamily
                  ._allTransitiveDependencies,
          gunname: gunname,
          position: position,
        );

  GetCountCompatibleWeaponPositionAttachmentsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.gunname,
    required this.position,
  }) : super.internal();

  final String gunname;
  final String position;

  @override
  Override overrideWith(
    FutureOr<int> Function(
            GetCountCompatibleWeaponPositionAttachmentsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetCountCompatibleWeaponPositionAttachmentsProvider._internal(
        (ref) => create(ref as GetCountCompatibleWeaponPositionAttachmentsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        gunname: gunname,
        position: position,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<int> createElement() {
    return _GetCountCompatibleWeaponPositionAttachmentsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetCountCompatibleWeaponPositionAttachmentsProvider &&
        other.gunname == gunname &&
        other.position == position;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, gunname.hashCode);
    hash = _SystemHash.combine(hash, position.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetCountCompatibleWeaponPositionAttachmentsRef
    on AutoDisposeFutureProviderRef<int> {
  /// The parameter `gunname` of this provider.
  String get gunname;

  /// The parameter `position` of this provider.
  String get position;
}

class _GetCountCompatibleWeaponPositionAttachmentsProviderElement
    extends AutoDisposeFutureProviderElement<int>
    with GetCountCompatibleWeaponPositionAttachmentsRef {
  _GetCountCompatibleWeaponPositionAttachmentsProviderElement(super.provider);

  @override
  String get gunname =>
      (origin as GetCountCompatibleWeaponPositionAttachmentsProvider).gunname;
  @override
  String get position =>
      (origin as GetCountCompatibleWeaponPositionAttachmentsProvider).position;
}

String _$getCompatibleWeaponPositionAttachmentsHash() =>
    r'e212f2283702ec6dbc9c73148304992c15e357f5';

/// See also [getCompatibleWeaponPositionAttachments].
@ProviderFor(getCompatibleWeaponPositionAttachments)
const getCompatibleWeaponPositionAttachmentsProvider =
    GetCompatibleWeaponPositionAttachmentsFamily();

/// See also [getCompatibleWeaponPositionAttachments].
class GetCompatibleWeaponPositionAttachmentsFamily
    extends Family<AsyncValue<List<Attachment>>> {
  /// See also [getCompatibleWeaponPositionAttachments].
  const GetCompatibleWeaponPositionAttachmentsFamily();

  /// See also [getCompatibleWeaponPositionAttachments].
  GetCompatibleWeaponPositionAttachmentsProvider call(
    String gunname,
    String position,
  ) {
    return GetCompatibleWeaponPositionAttachmentsProvider(
      gunname,
      position,
    );
  }

  @override
  GetCompatibleWeaponPositionAttachmentsProvider getProviderOverride(
    covariant GetCompatibleWeaponPositionAttachmentsProvider provider,
  ) {
    return call(
      provider.gunname,
      provider.position,
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
  String? get name => r'getCompatibleWeaponPositionAttachmentsProvider';
}

/// See also [getCompatibleWeaponPositionAttachments].
class GetCompatibleWeaponPositionAttachmentsProvider
    extends AutoDisposeFutureProvider<List<Attachment>> {
  /// See also [getCompatibleWeaponPositionAttachments].
  GetCompatibleWeaponPositionAttachmentsProvider(
    String gunname,
    String position,
  ) : this._internal(
          (ref) => getCompatibleWeaponPositionAttachments(
            ref as GetCompatibleWeaponPositionAttachmentsRef,
            gunname,
            position,
          ),
          from: getCompatibleWeaponPositionAttachmentsProvider,
          name: r'getCompatibleWeaponPositionAttachmentsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getCompatibleWeaponPositionAttachmentsHash,
          dependencies:
              GetCompatibleWeaponPositionAttachmentsFamily._dependencies,
          allTransitiveDependencies:
              GetCompatibleWeaponPositionAttachmentsFamily
                  ._allTransitiveDependencies,
          gunname: gunname,
          position: position,
        );

  GetCompatibleWeaponPositionAttachmentsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.gunname,
    required this.position,
  }) : super.internal();

  final String gunname;
  final String position;

  @override
  Override overrideWith(
    FutureOr<List<Attachment>> Function(
            GetCompatibleWeaponPositionAttachmentsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetCompatibleWeaponPositionAttachmentsProvider._internal(
        (ref) => create(ref as GetCompatibleWeaponPositionAttachmentsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        gunname: gunname,
        position: position,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Attachment>> createElement() {
    return _GetCompatibleWeaponPositionAttachmentsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetCompatibleWeaponPositionAttachmentsProvider &&
        other.gunname == gunname &&
        other.position == position;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, gunname.hashCode);
    hash = _SystemHash.combine(hash, position.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetCompatibleWeaponPositionAttachmentsRef
    on AutoDisposeFutureProviderRef<List<Attachment>> {
  /// The parameter `gunname` of this provider.
  String get gunname;

  /// The parameter `position` of this provider.
  String get position;
}

class _GetCompatibleWeaponPositionAttachmentsProviderElement
    extends AutoDisposeFutureProviderElement<List<Attachment>>
    with GetCompatibleWeaponPositionAttachmentsRef {
  _GetCompatibleWeaponPositionAttachmentsProviderElement(super.provider);

  @override
  String get gunname =>
      (origin as GetCompatibleWeaponPositionAttachmentsProvider).gunname;
  @override
  String get position =>
      (origin as GetCompatibleWeaponPositionAttachmentsProvider).position;
}

String _$getMountableAttachmentsHash() =>
    r'd54e93473292713e5804a49476a1506f4cc43f85';

/// See also [getMountableAttachments].
@ProviderFor(getMountableAttachments)
final getMountableAttachmentsProvider =
    AutoDisposeFutureProvider<List<Attachment>>.internal(
  getMountableAttachments,
  name: r'getMountableAttachmentsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getMountableAttachmentsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetMountableAttachmentsRef
    = AutoDisposeFutureProviderRef<List<Attachment>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
