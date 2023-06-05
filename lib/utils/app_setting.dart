import 'package:flutter/cupertino.dart';

class AppSettings extends ChangeNotifier{

  bool _isLoading = true;
  bool _isError = false;

  get isLoadingEnabled => _isLoading;
  get isErrorEnabled => _isError;

  void setLoadingNotifier(bool loading) { /// 4
    _isLoading = loading;
    notifyListeners();
  }

  void setErrorNotifier(bool error) { /// 4
    _isError = error;
    notifyListeners();
  }
}