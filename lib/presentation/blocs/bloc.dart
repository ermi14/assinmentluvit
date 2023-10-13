import 'package:assignmentluvit/data/data_sources/remote_data_source.dart';
import 'package:assignmentluvit/data/models/single_user.dart';
import 'package:assignmentluvit/data/repositories/repository.dart';
import 'package:bloc/bloc.dart';

import 'event.dart';
import 'state.dart';

class GetDataBloc extends Bloc<GetDataEvent, GetDataState> {
  static final RemoteDataSource remoteDataSource = RemoteDataSource();
  static final Repository repository = Repository(
    remoteDataSource: remoteDataSource,
  );

  List<SingleUser> users = [];

  GetDataBloc() : super(GetDataInit()) {
    on<GetDataEvent>((event, emit) async {
      if (event is GetData) {
        emit(GetDataLoading());
        try {
          final result = await repository.readData();

          if (result != null && result.isNotEmpty) {
            users = result;
            emit(GetDataSuccess(singleUsers: users));
          } else {
            emit(GetDataError(message: 'Data is empty'));
          }
        } catch (e) {
          emit(GetDataError(message: e.toString()));
        }
      } else if(event is RemoveUser) {
        users.removeAt(event.index);
        emit(GetDataSuccess(singleUsers: users));
      }
    });
  }
}
