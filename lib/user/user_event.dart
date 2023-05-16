import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable{

}

class GetAllUserList extends UserEvent{
  @override
  List<Object?> get props => [];
}