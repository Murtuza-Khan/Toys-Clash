import '../../../resources/exports/index.dart';

class AuthManager extends GetxController with CacheManager {
  static AuthManager instance = Get.find();

  late Rx<Session?> session = Rxn<Session>();

  bool rememberCredentials = false;

  final RxBool _isLoggedIn = false.obs;

  bool get isLoggedIn => _isLoggedIn.value;

  String get token => session.value!.tokenID!;

  User? get user => session.value?.user;

  DateTime get lastSignInTime => session.value?.lastSignIn ?? DateTime.now();

  // To avoid multiple Kick out messages
  int? lastResponseStatusCode;

  bool get authenticateByBiometrics =>
      (_getEmail()?.isNotEmpty ?? false) &&
      (_getPassword()?.isNotEmpty ?? false);

  bool get canAuthenticate => authenticateByBiometrics && rememberCredentials;

  Map<String, dynamic> get loginCredentials => {
        'EmailAddress': _getEmail(),
        'password': _getPassword(),
      };

  Future<void> login({Session? session, String? email, String? pass}) async {
    _isLoggedIn.value = true;

    if ((email?.isNotEmpty ?? false) && (pass?.isNotEmpty ?? false)) {
      if (rememberCredentials) {
        await _saveCredentials(email: email!, pass: pass!);
      }
    }

    await updateSession(session: session);
  }

  // Update Session from Here
  Future<void> updateSession({
    Object? id,
    User? user,
    Session? session,
  }) async {
    if (session != null) this.session.value = session;

    this.session.update((session) {
      if (user != null) session!.user = user;
    });

    if (id is List) {
      update((id as List<Object>?) ?? [Strings.UPDATE_AUTH_SESSION]);
    } else {
      update([id ?? Strings.UPDATE_AUTH_SESSION]);
    }
  }

  // Add new store and change default store
  Future<void> addNewStore({
    Object? id,
    Session? session,
  }) async {
    if (session != null) this.session.value = session;

    if (id is List) {
      update((id as List<Object>?) ?? [Strings.UPDATE_AUTH_SESSION]);
    } else {
      update([id ?? Strings.UPDATE_AUTH_SESSION]);
    }
  }

  Future<void> clearCacheImages({String? url}) async {
    imageCache.clear();
    imageCache.clearLiveImages();
    await CachedNetworkImage.evictFromCache(
      url ?? AuthManager.instance.user?.photo ?? '',
    );
  }
}

mixin CacheManager {
  static const key = 'AUXSJD029SKJS10293LATXAU';
  static const iv = 'ZXeU36GNM+y57MBS1M+NUA==';

  Future<void> _saveCredentials({
    required String email,
    required String pass,
  }) async {
    final box = GetStorage(Strings.CACHE_BOX_KEY);

    await box.write(
      CacheManagerKeys.email.toString(),
      email.encrypt(key: key, iv: iv),
    );
    await box.write(
      CacheManagerKeys.pass.toString(),
      pass.encrypt(key: key, iv: iv),
    );
  }

  String? _getEmail() {
    try {
      final box = GetStorage(Strings.CACHE_BOX_KEY);
      return box
          .read<String>(CacheManagerKeys.email.toString())
          .decrypt(key: key, iv: iv);
    } catch (e) {
      _removeCredentials();
      return null;
    }
  }

  String? _getPassword() {
    try {
      final box = GetStorage(Strings.CACHE_BOX_KEY);
      return box
          .read<String>(CacheManagerKeys.pass.toString())
          .decrypt(key: key, iv: iv);
    } catch (e) {
      _removeCredentials();
      return null;
    }
  }

  Future<void> _removeCredentials() async {
    final box = GetStorage(Strings.CACHE_BOX_KEY);
    await box.erase();
  }
}

enum CacheManagerKeys { token, email, pass }
