

import 'package:catatan_app/models/dialog_info.dart';
import 'package:catatan_app/models/dialogs_action.dart';
import 'package:catatan_app/services/locator.dart';
import 'package:catatan_app/ui/common/diary_alert_dialog.dart';
import 'package:flutter/material.dart';

class AppManager extends StatefulWidget {
  final Widget child;

  const AppManager({Key key, this.child}) : super(key: key);

  @override
  _AppManagerState createState() => _AppManagerState();
}

class _AppManagerState extends State<AppManager> {
  DialogService _dialogService = locator<DialogService>();
  @override
  void initState() {
    super.initState();
    _dialogService.setOnshowListener(_onShow);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  _onShow(DialogInfo dialogInfo) {
    showDialog(
      context: context,
      barrierDismissible: dialogInfo.barrierDismissible ?? true,
      builder: (_) => DiaryAlertDialog(
        message: dialogInfo.message,
        onPressed: () {
          Navigator.of(context).pop();
          _dialogService.dialogComplete(DialogAction(confirmed: true));
        },
      ),
    );
  }
}