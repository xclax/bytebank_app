import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

import 'interceptors/logging_interceptors.dart';

class Webclient {
  Client client = InterceptedClient.build(interceptors: [
    LoggingInterceptor(),
  ]);
}
