import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'locked_model.dart';
export 'locked_model.dart';

class LockedWidget extends StatefulWidget {
  const LockedWidget({super.key});

  @override
  State<LockedWidget> createState() => _LockedWidgetState();
}

class _LockedWidgetState extends State<LockedWidget> {
  late LockedModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LockedModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
