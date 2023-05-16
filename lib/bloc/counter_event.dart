import 'package:equatable/equatable.dart';

abstract class CounterEvent extends Equatable {}

class CounterIncrese extends CounterEvent {
  @override
  List<Object?> get props => [];
}

class CounterDecrese extends CounterEvent{
  @override
  List<Object?> get props => [];
}
