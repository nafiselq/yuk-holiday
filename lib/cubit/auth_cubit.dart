import 'package:airplane/models/user_model.dart';
import 'package:airplane/services/auth_service.dart';
import 'package:airplane/services/user_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void signIn({required String email, required String password}) async {
    try {
      emit(AuthLoading());
      UserModel user =
          await AuthServices().signIn(email: email, password: password);
      emit(AuthSucess(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void signUp(
      {required String email,
      required String password,
      required String name,
      String hobby = ''}) async {
    try {
      emit(AuthLoading());

      UserModel user = await AuthServices()
          .signUp(email: email, password: password, name: name, hobby: hobby);

      emit(AuthSucess(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void signOut() async {
    try {
      emit(AuthLoading());
      AuthServices().signOut();
      emit(AuthInitial());
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void getCurrentUer(String id) async {
    try {
      UserModel user = await UserServeice().getUserById(id);
      emit(AuthSucess(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }
}
