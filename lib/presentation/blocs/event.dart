abstract class GetDataEvent {}

class GetData extends GetDataEvent {}

class RemoveUser extends GetDataEvent {
  final int index;

  RemoveUser({required this.index});
}