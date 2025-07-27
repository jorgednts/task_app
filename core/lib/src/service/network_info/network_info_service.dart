import '../../utils/result.dart';

abstract class NetworkInfoService {
  AsyncResult<bool> get isConnected;
}
