import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_tata_neu_assignment/core/enums/connection_status.dart';

class ConnectivityService {
  ///Connection status controller....
  StreamController<ConnectionStatus> connectivityController =
      StreamController<ConnectionStatus>();

  ///Fetch the Connection Status...
  ConnectivityService() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult status) {
      var conStatus = _networkStatus(status);

      ///Emit the status via Stream...
      connectivityController.add(conStatus);
    });
  }

  //Converts the connectivity result into our enums
  //Currently the output id mobile, wifi,none.....
  ConnectionStatus _networkStatus(ConnectivityResult status) {
    switch (status) {
      case ConnectivityResult.mobile:
        return ConnectionStatus.mobileData;

      case ConnectivityResult.wifi:
        return ConnectionStatus.wifi;

      case ConnectivityResult.none:
        return ConnectionStatus.offline;

      default:
        return ConnectionStatus.offline;
    }
  }
}
