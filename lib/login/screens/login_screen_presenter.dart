import 'package:flutter_app/login/data/rest_ds.dart';
import 'package:flutter_app/login/models/user.dart';

abstract class LoginScreenContract {
  void onLoginSuccess(User userData);
  void onLoginError(String errorTxt);
}

class LoginScreenPresenter {
  LoginScreenContract _view;
  RestDatasource api = new RestDatasource();
  LoginScreenPresenter(this._view);


  doLogin(String username, String password) {
//  doLogin(String username) {
    api
        .login(username, password)
//        .login(username)
        .then((User userData) => _view.onLoginSuccess(userData))
        .catchError((onError) => _view.onLoginError(onError));
  }
}