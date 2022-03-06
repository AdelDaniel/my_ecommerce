import 'dart:developer';
import 'dart:io';

class CheckConnectionUsingUrl {
  final CustomInterNetAddress customInterNetAddress;
  const CheckConnectionUsingUrl({required this.customInterNetAddress});
  Future<bool> get checkConnectionUsingUrl => _checkConnectionUsingUrl();
  Future<bool> _checkConnectionUsingUrl() async {
    try {
      final result = await customInterNetAddress.lookup;
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        log('_checkConnectionUsingUrl :: connected');
        return true;
      }
    } on SocketException catch (_) {
      log('_checkConnectionUsingUrl :: not connected');
      return false;
    }
    return false;
  }
}

class CustomInterNetAddress {
  const CustomInterNetAddress();
  Future<List<InternetAddress>> get lookup =>
      InternetAddress.lookup('google.com');
}
