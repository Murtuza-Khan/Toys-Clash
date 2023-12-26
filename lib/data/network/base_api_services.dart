import '../../resources/exports/index.dart';

abstract class BaseApiServices {
  Future getApi(String url, {Map<String, dynamic>? quaryParameters});

  Future postApi(String url, Map<String, dynamic> body);
}
