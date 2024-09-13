void httpStatusValidation(int statusCode) {
  switch (statusCode) {
    case 200:
      break;
    case 400:
      throw Exception(
          'search order is http status error : Bad Request ($statusCode) リクエストが不正');
    case 401:
      throw Exception(
          'search order is http status error : Authorized Error ($statusCode) 認証に失敗');
    case 404:
      throw Exception(
          'search order is http status error : Not Found ($statusCode) Request-URI 不一致');
    case 405:
      throw Exception(
          'search order is http status error : Method Not Allowed ($statusCode) 許可されていないメソッド');
    case 500:
      throw Exception(
          'search order is http status error : Internal Server Error ($statusCode) サーバ内部にエラーが発生');
    case 503:
      throw Exception(
          'search order is http status error : Service Unavailable ($statusCode) サービスが一時的に過負荷やメンテナンスで使用不可能');
    default:
      throw Exception(
          'search order is http status error : Unknown Error ($statusCode) ');
  }
}
