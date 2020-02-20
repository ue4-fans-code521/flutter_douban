import 'package:dio/dio.dart';
import 'httpconfig.dart';

///我们需要重新包装dio包中的request方法
class HttpRequest {
  static BaseOptions bs =
      BaseOptions(baseUrl: BASEURL, connectTimeout: TIMEOUT, method: METHOD);

  //定义dio实例
  static Dio dio = Dio(bs);

  //1.返回值：Future
  //2.使用async进行修饰
  //3.声明为全局静态方法static
  static Future requestresources(String url,
      {String method = "get", Map<String, dynamic> params}) async {
    //下面我们就可以调用dio中的request方法了.其返回值是相当于es6中promise
    try {
      final res = await dio.request(url);
      return res;
    } on DioError catch (err) {
      throw err;
    }
  }
}
