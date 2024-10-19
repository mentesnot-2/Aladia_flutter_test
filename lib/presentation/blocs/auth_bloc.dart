import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/check_user_existence_usecase.dart';
import '../../domain/usecases/login_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final CheckUserExistenceUseCase checkUserExistenceUseCase;
  final LoginUseCase loginUseCase;

  AuthBloc(this.checkUserExistenceUseCase, this.loginUseCase) : super(AuthInitial()) {
    on<CheckUserEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await checkUserExistenceUseCase.call(event.email);
        if (user.exists && user.password && user.verified) {
          emit(AuthSuccess('')); // Placeholder, adjust as needed
        } else {
          emit(AuthFailure('User does not exist or is not verified.'));
        }
      } catch (error) {
        emit(AuthFailure('An error occurred. Please try again.'));
      }
    });

    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final token = await loginUseCase.call(event.email, event.password);
        emit(AuthSuccess(token)); // Emit success with token
      } catch (error) {
        emit(AuthFailure('Invalid email or password.'));
      }
    });
  }
}



