import 'dart:async';

import 'package:catatan_app/models/dialog_info.dart';
import 'package:catatan_app/models/dialogs_action.dart';



class DialogService {
  late Function _onShowListener;
  late Completer _dialogCompleter;

  setOnshowListener(Function(DialogInfo) onShowListener) {
    _onShowListener = onShowListener;
  }

  showAlertDialog(String message, {required bool barrierDismissible}) {
    _dialogCompleter = Completer<DialogAction>();
    _onShowListener(
        DialogInfo(message: message, barrierDismissible: barrierDismissible));
    return _dialogCompleter.future;
  }

  dialogComplete(DialogAction dialogAction) {
    _dialogCompleter.complete(dialogAction);
    var __dialogCompleter = null;
    _dialogCompleter = __dialogCompleter;
  }
}