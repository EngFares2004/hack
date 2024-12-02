abstract class AppEvent{}
class ClickEvent extends AppEvent{}
class AddEvent extends AppEvent{
  final dynamic data;
  AddEvent(this.data);
}
class RemoveEvent extends AppEvent{
  final dynamic data;
  RemoveEvent(this.data);
}
class SearchEvent extends AppEvent{}
class GetDataEvent extends AppEvent{}
