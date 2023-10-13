import 'package:assignmentluvit/data/data_sources/remote_data_source.dart';
import 'package:assignmentluvit/data/models/single_user.dart';

class Repository {
  final RemoteDataSource remoteDataSource;

  Repository({required this.remoteDataSource});

  Future<List<SingleUser>?> readData() async {
    final snapshot = await remoteDataSource.readData();
    if (snapshot?.exists == true) {
      final List<SingleUser> list = [];
      for (var element in snapshot!.children) {
        list.add(SingleUser.fromSnapshot(element));
      }
      return list;
    } else {
      return null;
    }
  }
}
