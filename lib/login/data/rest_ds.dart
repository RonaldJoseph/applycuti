import 'dart:async';
import 'package:flutter_app/login/utils/network_util.dart';
import 'package:flutter_app/login/models/user.dart';

class RestDatasource {
  NetworkUtil _netUtil = new NetworkUtil();
  static final BASE_URL = "http://upm-id-rnd.upm.edu.my/apiPVID/api/login";
//  static final LOGIN_URL = BASE_URL;
//  static final _API_KEY = "3eed0ad7c2e42d1e56a2e8dcbbe316d3ffc3821666b4ddd7ca7cfa622c1c0d8c";


  Future<User>login(String username, String password) {
//  Future<User>login(String username) async{
//    print(["userData"]);

//    return new Future.value(new User(username, password));
//    return new Future.value(new User(username));

//    return _netUtil.post(BASE_URL, body: {
////      "token": _API_KEY,
//      "username": username,
//      "password": password,
////
//    }).then((dynamic res) {
//      print(res.toString());
//      if(res["error"]!= null) throw new Exception(res["error_msg"]);
//       return new User.map(res["userData"]);
//    });



    return _netUtil.post(BASE_URL, body: {
      "username": username,
      "password": password,

    }).then((dynamic res) {
      print(res.toString());
      return new User.map(res["userData"]);
    })
        .catchError((Error error) {
      print(error.toString());
    });

  }
}

//181613 Maiman23


//  main() async {
//    String url =
//        'http://upm-id-rnd.upm.edu.my/apiPVID/api/login';
//    Map map = {
//      'data': {'apikey': '12345678901234567890'},
//    };
//
//    print(await login(url, map));
//  }
//
//  Future<String> login(String url, Map jsonMap) async {
//    HttpClient httpClient = new HttpClient();
//    HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
//    request.headers.set('content-type', 'application/json');
//    request.add(utf8.encode(json.encode(jsonMap)));
//    HttpClientResponse response = await request.close();
//    // todo - you should check the response.statusCode
//    String reply = await response.transform(utf8.decoder).join();
//    httpClient.close();
//    return reply;
//  }
//}