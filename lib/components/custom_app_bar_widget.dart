import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'custom_app_bar_model.dart';
export 'custom_app_bar_model.dart';

class CustomAppBarWidget extends StatefulWidget {
  const CustomAppBarWidget({Key? key}) : super(key: key);

  @override
  _CustomAppBarWidgetState createState() => _CustomAppBarWidgetState();
}

class _CustomAppBarWidgetState extends State<CustomAppBarWidget> {
  late CustomAppBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomAppBarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: 80.0,
      decoration: BoxDecoration(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FlutterFlowIconButton(
            borderRadius: 20.0,
            borderWidth: 1.0,
            buttonSize: 40.0,
            icon: Icon(
              Icons.notifications,
              color: FlutterFlowTheme.of(context).sub1,
              size: 24.0,
            ),
            onPressed: () {
              print('IconButton pressed ...');
            },
          ),
          AuthUserStreamWidget(
            builder: (context) => Text(
              currentUserDisplayName,
              style: FlutterFlowTheme.of(context).headlineSmall,
            ),
          ),
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.pushNamed(
                'searchPage',
                extra: <String, dynamic>{
                  kTransitionInfoKey: TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.rightToLeft,
                    duration: Duration(milliseconds: 300),
                  ),
                },
              );
            },
            child: Icon(
              Icons.search,
              color: FlutterFlowTheme.of(context).sub1,
              size: 24.0,
            ),
          ),
        ],
      ),
    );
  }
}
