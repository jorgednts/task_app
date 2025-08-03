import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'network_service.dart';

class NetworkServiceImpl implements NetworkService {
  NetworkServiceImpl()
    : _connectivity = Connectivity(),
      _connectionChecker = InternetConnectionChecker.createInstance();

  final Connectivity _connectivity;
  final InternetConnectionChecker _connectionChecker;

  @override
  Future<bool> checkInternetConnection() async {
    try {
      final connectivityResults = await _connectivity.checkConnectivity();

      if (connectivityResults.contains(ConnectivityResult.none) ||
          connectivityResults.isEmpty) {
        return false;
      }

      return await _connectionChecker.hasConnection;
    } catch (e) {
      return await _performManualConnectivityCheck();
    }
  }

  Future<bool> _performManualConnectivityCheck() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    } catch (e) {
      return false;
    }
  }
}
