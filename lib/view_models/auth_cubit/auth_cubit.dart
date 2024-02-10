import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_ecommerce_app/services/auth_services.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  
  final AuthServices _authServices=AuthServicesImpl();

  Future<void> login(String email, String password) async{
     emit(AuthLoading());
     try{
      final result=await _authServices.login(email, password);
      if(result){
        final user=await _authServices.getUser();
        emit(AuthSuccess(user!));
      }else{
         emit(AuthError('Login failed'));
      }
     } on FirebaseAuthException catch(e){
        emit(AuthError(e.message!));
     }
  }

    Future<void> register(String email, String password) async{
     emit(AuthLoading());
     try{
      final result=await _authServices.register(email, password);
      if(result){
        final user=await _authServices.getUser();
        emit(AuthSuccess(user!));
      }else{
         emit(AuthError('Register failed'));
      }
     } on FirebaseAuthException catch(e){
        emit(AuthError(e.message!));
     }
  }

   Future<void> logout() async{
     emit(AuthLoading());
     try{
      await _authServices.logout();
     } on FirebaseAuthException catch(e){
        emit(AuthError(e.message!));
     }
  }

  Future<void> getUser() async{
     User? usereData=await _authServices.getUser();
     try{
      if(usereData!=null){
        emit(AuthSuccess(usereData));
      }else{
        emit(AuthError('User not found'));
      }
     } on FirebaseAuthException catch(e){
        emit(AuthError(e.message!));
     }
  }

}