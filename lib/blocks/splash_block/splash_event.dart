import 'package:equatable/equatable.dart';
import 'package:pamperbook/data/models/InitRequest.dart';

abstract class SplashEvent extends Equatable {
  const SplashEvent();

  @override
  List<Object> get props => [];
}

class GetInitResponse extends SplashEvent {

  final InitRequest initRequest;

  const GetInitResponse(this.initRequest);

}


