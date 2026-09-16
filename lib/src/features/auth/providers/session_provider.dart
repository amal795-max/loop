import 'dart:async';
import 'package:loop/src/data/models/user_info_model.dart';
import 'package:loop/src/imports/imports.dart';
import 'package:loop/src/data/repositories/auth_repository.dart';

import 'package:loop/src/data/repositories/auth_repository_impl.dart';

/// Provides the AuthRepository instance
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl();
});

/// Provides a stream of auth state changes
final authStateStreamProvider = StreamProvider<UserInfoModel?>((ref) {
  final repo = ref.watch(authRepositoryProvider);
  return repo.onAuthStateChanged;
});

/// Provides the current session state
final sessionProvider = StateNotifierProvider<SessionNotifier, SessionState>((ref) {
  final repo = ref.read(authRepositoryProvider);
  return SessionNotifier(repo);
});

enum SessionStatus { unknown, authenticated, unauthenticated }

class SessionState {
  final SessionStatus status;
  final UserInfoModel? user;

  const SessionState({
    this.status = SessionStatus.unknown,
    this.user,
  });

  SessionState copyWith({
    SessionStatus? status,
    UserInfoModel? user,
  }) {
    return SessionState(
      status: status ?? this.status,
      user: user ?? this.user,
    );
  }
}

class SessionNotifier extends StateNotifier<SessionState> {
  final AuthRepository _repo;
  StreamSubscription<UserInfoModel?>? _sub;

  SessionNotifier(this._repo) : super(const SessionState()) {
    _init();
  }

  Future<void> _init() async {
    final result = await _repo.checkAuthState();

    result.fold(
          (_) => state = const SessionState(status: SessionStatus.unauthenticated),
          (user) {
        if (user != null) {
          state = SessionState(status: SessionStatus.authenticated, user: user);
        } else {
          state = const SessionState(status: SessionStatus.unauthenticated);
        }
      },
    );

    _sub = _repo.onAuthStateChanged.listen((user) {
      if (user != null) {
        state = SessionState(status: SessionStatus.authenticated, user: user);
      } else {
        state = const SessionState(status: SessionStatus.unauthenticated);
      }
    });
  }

  Future<void> logout() async {
    await _repo.logout();
    state = const SessionState(status: SessionStatus.unauthenticated);
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }
}
