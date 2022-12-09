import 'package:dio/dio.dart';
import '../models/response_model/user_data_response_model.dart';
import 'Logging.dart';
import 'api_constants.dart';

class HttpService {
  final Dio _dio = Dio()..interceptors.add(Logging());

  Future<UserDataResponseModel> checkLogin(var data) async {
    try {
      var response = await _dio.post(ApiConstants.baseUrl + ApiConstants.login,
          data: data);
      return UserDataResponseModel.fromJson(response.data);
    } on DioError catch (e) {
      return UserDataResponseModel();
    }
  }
}
