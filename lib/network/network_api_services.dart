import '../../resources/exports/index.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  Map<String, String> generateHeaders() {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'AppToken': FlutterConfig.get('appToken'),
      if (GetUtils.isNullOrBlank(
          AuthManager.instance.session.value!.user)!) ...{
        'UserID': "",
        'phoneNo': "",
        'Authorization': 'Bearer ',
      } else ...{
        'UserID': AuthManager.instance.session.value!.user!.userID!.toString(),
        'phoneNo': AuthManager.instance.session.value!.user!.phoneNo!,
        'Authorization':
            'Bearer ${AuthManager.instance.session.value!.user!.token!}',
      },
    };
    return headers;
  }

  @override
  Future postApi(String url, Map<String, dynamic> body) async {
    try {
      http.Response response = await http
          .post(
            Uri.https(FlutterConfig.get('baseUrl'), url),
            headers: generateHeaders(),
            body: jsonEncode(body),
          )
          .timeout(const Duration(seconds: 10));

      ApiResponse data = ApiResponse.fromJson(validateResponse(response));

      return data.successContents;
    } on SocketException {
      return CustomSnackBar.showSnackBar(
        message: 'You are offline. Please connect to internet first .',
        snackBarStyle: SnackBarStyle.info,
      );
    } catch (e) {
      log.e(e);
      return false;
    }
  }

  @override
  Future getApi(
    String url, {
    Map<String, dynamic>? quaryParameters,
  }) async {
    try {
      Uri uri;
      ApiResponse data;

      if (quaryParameters != null) {
        uri = Uri.https(FlutterConfig.get('baseUrl'), url, quaryParameters);
      } else {
        uri = Uri.https(FlutterConfig.get('baseUrl'), url);
      }

      http.Response response =
          await http.get(uri, headers: generateHeaders()).timeout(
                const Duration(seconds: 10),
              );

      data = ApiResponse.fromJson(validateResponse(response));

      return data.successContents;
    } on SocketException {
      return CustomSnackBar.showSnackBar(
        message: 'You are offline. Please connect to internet first .',
        snackBarStyle: SnackBarStyle.info,
      );
    } catch (_) {
      return false;
    }
  }

  dynamic validateResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        CustomSnackBar.showSnackBar(
          message: InvalidUrlException().message,
          snackBarStyle: SnackBarStyle.failure,
        );
        throw InvalidUrlException();
      case 403:
        CustomSnackBar.showSnackBar(
          message: RestrictedAccess().message,
          snackBarStyle: SnackBarStyle.failure,
        );
        throw RestrictedAccess();
      case 401:
        CustomSnackBar.showSnackBar(
          message: UnauthorizedException().message,
          snackBarStyle: SnackBarStyle.failure,
        );
        throw UnauthorizedException();
      case 305:
        CustomSnackBar.showSnackBar(
          message: InvalidTokenException().message,
          snackBarStyle: SnackBarStyle.failure,
        );
        throw InvalidTokenException();
      case 408:
        CustomSnackBar.showSnackBar(
          message: RequestTimeout().message,
          snackBarStyle: SnackBarStyle.failure,
        );
        throw RequestTimeout();
      case 500:
        CustomSnackBar.showSnackBar(
          message: ServerException().message,
          snackBarStyle: SnackBarStyle.failure,
        );
        throw ServerException();
      default:
        dynamic responseJson = jsonDecode(response.body);
        CustomSnackBar.showSnackBar(
          message: responseJson['failreason'],
          snackBarStyle: SnackBarStyle.failure,
        );
        throw UnknownError();
    }
  }
}
