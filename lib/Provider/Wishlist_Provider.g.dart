// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Wishlist_Provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getWishlistOfHash() => r'87fff0431b76a8b681ff2859bfc57fc76110b0b7';

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

/// See also [getWishlistOf].
@ProviderFor(getWishlistOf)
const getWishlistOfProvider = GetWishlistOfFamily();

/// See also [getWishlistOf].
class GetWishlistOfFamily extends Family<AsyncValue<List<String>>> {
  /// See also [getWishlistOf].
  const GetWishlistOfFamily();

  /// See also [getWishlistOf].
  GetWishlistOfProvider call(
    String email,
  ) {
    return GetWishlistOfProvider(
      email,
    );
  }

  @override
  GetWishlistOfProvider getProviderOverride(
    covariant GetWishlistOfProvider provider,
  ) {
    return call(
      provider.email,
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
  String? get name => r'getWishlistOfProvider';
}

/// See also [getWishlistOf].
class GetWishlistOfProvider extends AutoDisposeFutureProvider<List<String>> {
  /// See also [getWishlistOf].
  GetWishlistOfProvider(
    String email,
  ) : this._internal(
          (ref) => getWishlistOf(
            ref as GetWishlistOfRef,
            email,
          ),
          from: getWishlistOfProvider,
          name: r'getWishlistOfProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getWishlistOfHash,
          dependencies: GetWishlistOfFamily._dependencies,
          allTransitiveDependencies:
              GetWishlistOfFamily._allTransitiveDependencies,
          email: email,
        );

  GetWishlistOfProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.email,
  }) : super.internal();

  final String email;

  @override
  Override overrideWith(
    FutureOr<List<String>> Function(GetWishlistOfRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetWishlistOfProvider._internal(
        (ref) => create(ref as GetWishlistOfRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        email: email,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<String>> createElement() {
    return _GetWishlistOfProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetWishlistOfProvider && other.email == email;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetWishlistOfRef on AutoDisposeFutureProviderRef<List<String>> {
  /// The parameter `email` of this provider.
  String get email;
}

class _GetWishlistOfProviderElement
    extends AutoDisposeFutureProviderElement<List<String>>
    with GetWishlistOfRef {
  _GetWishlistOfProviderElement(super.provider);

  @override
  String get email => (origin as GetWishlistOfProvider).email;
}

String _$postWishlistOfHash() => r'd0919acf52efd4e7a754f9fce387717ba25072a9';

/// See also [postWishlistOf].
@ProviderFor(postWishlistOf)
const postWishlistOfProvider = PostWishlistOfFamily();

/// See also [postWishlistOf].
class PostWishlistOfFamily extends Family<AsyncValue<void>> {
  /// See also [postWishlistOf].
  const PostWishlistOfFamily();

  /// See also [postWishlistOf].
  PostWishlistOfProvider call(
    String email,
    String wepname,
  ) {
    return PostWishlistOfProvider(
      email,
      wepname,
    );
  }

  @override
  PostWishlistOfProvider getProviderOverride(
    covariant PostWishlistOfProvider provider,
  ) {
    return call(
      provider.email,
      provider.wepname,
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
  String? get name => r'postWishlistOfProvider';
}

/// See also [postWishlistOf].
class PostWishlistOfProvider extends AutoDisposeFutureProvider<void> {
  /// See also [postWishlistOf].
  PostWishlistOfProvider(
    String email,
    String wepname,
  ) : this._internal(
          (ref) => postWishlistOf(
            ref as PostWishlistOfRef,
            email,
            wepname,
          ),
          from: postWishlistOfProvider,
          name: r'postWishlistOfProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$postWishlistOfHash,
          dependencies: PostWishlistOfFamily._dependencies,
          allTransitiveDependencies:
              PostWishlistOfFamily._allTransitiveDependencies,
          email: email,
          wepname: wepname,
        );

  PostWishlistOfProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.email,
    required this.wepname,
  }) : super.internal();

  final String email;
  final String wepname;

  @override
  Override overrideWith(
    FutureOr<void> Function(PostWishlistOfRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PostWishlistOfProvider._internal(
        (ref) => create(ref as PostWishlistOfRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        email: email,
        wepname: wepname,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _PostWishlistOfProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PostWishlistOfProvider &&
        other.email == email &&
        other.wepname == wepname;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);
    hash = _SystemHash.combine(hash, wepname.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PostWishlistOfRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `email` of this provider.
  String get email;

  /// The parameter `wepname` of this provider.
  String get wepname;
}

class _PostWishlistOfProviderElement
    extends AutoDisposeFutureProviderElement<void> with PostWishlistOfRef {
  _PostWishlistOfProviderElement(super.provider);

  @override
  String get email => (origin as PostWishlistOfProvider).email;
  @override
  String get wepname => (origin as PostWishlistOfProvider).wepname;
}

String _$getValueOfHash() => r'9279229ea49372fd1b300c6d98bed33add6599fd';

/// See also [getValueOf].
@ProviderFor(getValueOf)
const getValueOfProvider = GetValueOfFamily();

/// See also [getValueOf].
class GetValueOfFamily extends Family<AsyncValue<int>> {
  /// See also [getValueOf].
  const GetValueOfFamily();

  /// See also [getValueOf].
  GetValueOfProvider call(
    String email,
    String wepname,
  ) {
    return GetValueOfProvider(
      email,
      wepname,
    );
  }

  @override
  GetValueOfProvider getProviderOverride(
    covariant GetValueOfProvider provider,
  ) {
    return call(
      provider.email,
      provider.wepname,
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
  String? get name => r'getValueOfProvider';
}

/// See also [getValueOf].
class GetValueOfProvider extends AutoDisposeFutureProvider<int> {
  /// See also [getValueOf].
  GetValueOfProvider(
    String email,
    String wepname,
  ) : this._internal(
          (ref) => getValueOf(
            ref as GetValueOfRef,
            email,
            wepname,
          ),
          from: getValueOfProvider,
          name: r'getValueOfProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getValueOfHash,
          dependencies: GetValueOfFamily._dependencies,
          allTransitiveDependencies:
              GetValueOfFamily._allTransitiveDependencies,
          email: email,
          wepname: wepname,
        );

  GetValueOfProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.email,
    required this.wepname,
  }) : super.internal();

  final String email;
  final String wepname;

  @override
  Override overrideWith(
    FutureOr<int> Function(GetValueOfRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetValueOfProvider._internal(
        (ref) => create(ref as GetValueOfRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        email: email,
        wepname: wepname,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<int> createElement() {
    return _GetValueOfProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetValueOfProvider &&
        other.email == email &&
        other.wepname == wepname;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);
    hash = _SystemHash.combine(hash, wepname.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetValueOfRef on AutoDisposeFutureProviderRef<int> {
  /// The parameter `email` of this provider.
  String get email;

  /// The parameter `wepname` of this provider.
  String get wepname;
}

class _GetValueOfProviderElement extends AutoDisposeFutureProviderElement<int>
    with GetValueOfRef {
  _GetValueOfProviderElement(super.provider);

  @override
  String get email => (origin as GetValueOfProvider).email;
  @override
  String get wepname => (origin as GetValueOfProvider).wepname;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
