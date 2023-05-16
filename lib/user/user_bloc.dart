import 'package:bloc_practice/model/user_model.dart';
import 'package:bloc_practice/service/api_service.dart';
import 'package:bloc_practice/user/user_event.dart';
import 'package:bloc_practice/user/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  List<UserModel> userModelList = [];

  UserBloc() : super(UserInit()) {
    ApiService _apiService = ApiService();

    on<GetAllUserList>((event, emit) async {
      try {
        emit(UserLoading());
        userModelList = await _apiService.getData();
        emit(UserDataLoaded(userModelList));
      } catch (e) {
        emit(UserError(e.toString()));
      }
    });
  }
}
