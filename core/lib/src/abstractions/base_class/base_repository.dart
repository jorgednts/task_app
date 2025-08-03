import '../../exceptions/exceptions.dart';
import '../../service/network/network_service.dart';

class BaseRepository {
  BaseRepository({required NetworkService networkService})
    : _networkService = networkService;

  final NetworkService _networkService;

  Future<bool> checkInternetConnection() async {
    return await _networkService.checkInternetConnection();
  }

  Future<OutputType> checkInternetConnectionAndExecute<InputType, OutputType>({
    required Future<OutputType> Function(InputType) execute,
    required InputType input,
  }) async {
    if (await checkInternetConnection()) {
      return await execute(input);
    } else {
      throw const NetworkException(message: 'No internet connection');
    }
  }
}
