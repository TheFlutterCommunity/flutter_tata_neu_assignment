import 'package:flutter/foundation.dart';
import 'package:flutter_tata_neu_assignment/core/enums/view_state.dart';

class BaseModel with ChangeNotifier {
  String? error;

  ViewState _state = ViewState.idle;

  ViewState get state => _state;

  set state(ViewState viewState) {
    if (kDebugMode) {
      print('State:$viewState');
    }
    _state = viewState;
    notifyListeners();
  }

  set stateWithoutUpdate(ViewState viewState) {
    if (kDebugMode) {
      print('State:$viewState');
    }
    _state = viewState;
  }

  void updateUI() {
    notifyListeners();
  }
}
