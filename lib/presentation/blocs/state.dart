import 'package:assignmentluvit/data/models/single_user.dart';

class GetDataState {}

class GetDataInit extends GetDataState {}

class GetDataLoading extends GetDataState {}

class GetDataSuccess extends GetDataState {
  final List<SingleUser> singleUsers;

  GetDataSuccess({required this.singleUsers});
}

class GetDataError extends GetDataState {
  final String message;

  GetDataError({required this.message});
}
