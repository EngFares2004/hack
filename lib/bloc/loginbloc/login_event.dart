abstract class AppEvent{}
class LoginEvent extends AppEvent{
  final String username;
  final String password;


  LoginEvent({required this.username, required this.password,});
}
class ClickEvent extends AppEvent{}
class SaveEvent extends AppEvent{}