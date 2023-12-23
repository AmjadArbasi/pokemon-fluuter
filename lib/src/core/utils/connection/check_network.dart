import 'dart:io';

abstract class NetworkInfo {
  Future<bool>? get isConnected;
}

class NetworkInfoImp implements NetworkInfo {
  Future<bool> hasNetwork() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } catch (e) {
      return false;
    }
    return false;
  }

  NetworkInfoImp();

  @override
  Future<bool>? get isConnected => hasNetwork();
}
