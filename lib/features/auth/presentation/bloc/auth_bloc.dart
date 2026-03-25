import 'package:bloc_app/core/storage/shared_prefs/shared_prefs_service.dart';
import 'package:bloc_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:bloc_app/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final SharedPrefsService prefs;

  AuthBloc(this.loginUseCase, this.prefs) : super(const AuthState.initial()) {
    on<_Login>(_onLogin);
  }

  Future<void> _onLogin(_Login event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    try {
      final res = await loginUseCase(event.username, event.password);
      await prefs.setAccessToken(res.accessToken);
      emit(const AuthState.success());
    } catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }
}
