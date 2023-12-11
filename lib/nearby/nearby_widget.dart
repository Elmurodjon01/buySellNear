import '/components/custom_appbar_widget.dart';
import '/components/nearby_card_widget.dart';
import '/components/nearby_post_box_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'nearby_model.dart';
export 'nearby_model.dart';

class NearbyWidget extends StatefulWidget {
  const NearbyWidget({super.key});

  @override
  _NearbyWidgetState createState() => _NearbyWidgetState();
}

class _NearbyWidgetState extends State<NearbyWidget> {
  late NearbyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NearbyModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              wrapWithModel(
                model: _model.customAppbarModel,
                updateCallback: () => setState(() {}),
                child: const CustomAppbarWidget(),
              ),
              wrapWithModel(
                model: _model.nearbyCardModel,
                updateCallback: () => setState(() {}),
                child: const NearbyCardWidget(),
              ),
              Align(
                alignment: const AlignmentDirectional(-1.00, 0.00),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10.0, 7.0, 0.0, 7.0),
                  child: Text(
                    '걸어서 갈수 있는 업체 ',
                    style: FlutterFlowTheme.of(context).titleLarge,
                  ),
                ),
              ),
              wrapWithModel(
                model: _model.nearbyPostBoxModel,
                updateCallback: () => setState(() {}),
                child: const NearbyPostBoxWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
