import 'package:bloc_app/core/storage/shared_prefs/shared_prefs_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'splash_event.dart';
import 'splash_state.dart';

@injectable
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final SharedPrefsService prefs;

  SplashBloc(this.prefs) : super(const SplashState.initial()) {
    on<SplashStarted>(_onStarted);
  }

  Future<void> _onStarted(
    SplashStarted event,
    Emitter<SplashState> emit,
  ) async {
    emit(const SplashState.loading());
    // Optional UX delay (avoid flicker)
    await Future.delayed(const Duration(seconds: 2));
    final token = prefs.getAccessToken();
    if (token != null && token.isNotEmpty) {
      emit(const SplashState.authenticated());
    } else {
      emit(const SplashState.unauthenticated());
    }
  }
}
