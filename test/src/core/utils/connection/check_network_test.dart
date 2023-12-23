import 'package:flutter_test/flutter_test.dart';
import 'package:pokdmon/src/core/utils/connection/check_network.dart';

void main() {
  testWidgets('check network ...', (tester) async {
    NetworkInfoImp networkInfoImp = NetworkInfoImp();
    bool? test = await networkInfoImp.isConnected;
    expect(test, true);
  });
}
