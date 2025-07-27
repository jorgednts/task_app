import 'package:connectivity_plus/connectivity_plus.dart';

import '../../utils/result.dart';
import 'network_info_service.dart';

class NetworkInfoServiceImpl implements NetworkInfoService {
  NetworkInfoServiceImpl() : connectivity = Connectivity();

  final Connectivity connectivity;

  @override
  AsyncResult<bool> get isConnected async {
    try {
      final result = await connectivity.checkConnectivity();
      return Result.ok(!result.contains(ConnectivityResult.none));
    } catch (e) {
      return const Result.ok(false);
    }
  }
}
