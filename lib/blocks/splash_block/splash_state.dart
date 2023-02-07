import 'package:equatable/equatable.dart';
import 'package:pamperbook/data/models/InitResponse.dart';

abstract class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object?> get props => [];
}

class SplashInitial extends SplashState {}

class SplashLoading extends SplashState {}

class InitLoaded extends SplashState {
  final InitResponse initResponse;
  const InitLoaded(this.initResponse);
}

class SplashError extends SplashState {
  final String? message;
  const SplashError(this.message);
}
