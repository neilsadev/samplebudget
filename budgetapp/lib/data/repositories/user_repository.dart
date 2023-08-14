import 'package:budgetapp/data/data%20provider/data_provider.dart';
import 'package:budgetapp/data/models/user_model.dart';
import 'package:budgetapp/data/network_constants.dart';
import 'package:dio/dio.dart';

class UserRepository {
  final DataProvider dataProvider = DataProvider();
  Future<bool> userRegistration(
      {required String email,
      required String name,
      required String password}) async {
    Map<String, dynamic> registrationPayload = <String, dynamic>{
      'name': name,
      'email': email,
      'password': password
    };
    print(registrationPayload);
    Response<dynamic>? apiResponse = await dataProvider.fetchData(
      "POST",
      API.signUp,
      data: registrationPayload,
    );
    print(apiResponse);
    if (apiResponse != null) {
      if (apiResponse.statusCode == 200) {
        return true;
      }
      return false;
    }
    return false;
  }

  Future<User> userLogin(
      {required String email, required String password}) async {
    Map<String, dynamic> loginPayload = <String, dynamic>{
      'email': email,
      'password': password
    };
    User user = User();
    Response<dynamic>? apiResponse = await dataProvider.fetchData(
      "POST",
      API.login,
      data: loginPayload,
    );
    if (apiResponse != null) {
      if (apiResponse.statusCode == 200) {
        user = User.fromJson(apiResponse.data);
      }
      user = User.withError("something went wrong");
    } else {
      user = User.withError("api down");
    }
    return user;
  }
}
