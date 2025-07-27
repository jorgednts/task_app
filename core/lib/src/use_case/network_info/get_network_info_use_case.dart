import 'package:core/core.dart';

class GetNetworkInfoUseCase implements BaseUseCase<NoParam, bool> {
  GetNetworkInfoUseCase({
    required this.networkInfo,
  });

  final NetworkInfoService networkInfo;

  @override
  AsyncResult<bool> call(NoParam input) async {
    return await networkInfo.isConnected;
  }
}
