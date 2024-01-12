import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:provider/provider.dart';
import 'mappage_copy_model.dart';
export 'mappage_copy_model.dart';

class MappageCopyWidget extends StatefulWidget {
  const MappageCopyWidget({
    super.key,
    String? category,
    required this.title,
    required this.price,
    required this.description,
    this.negoitable,
  })  : category = category ?? '';

  final String category;
  final String? title;
  final int? price;
  final String? description;
  final bool? negoitable;

  @override
  _MappageCopyWidgetState createState() => _MappageCopyWidgetState();
}

class _MappageCopyWidgetState extends State<MappageCopyWidget> {
  late MappageCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MappageCopyModel());

    getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
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
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: SpinKitChasingDots(
              color: FlutterFlowTheme.of(context).info,
              size: 50.0,
            ),
          ),
        ),
      );
    }

    return StreamBuilder<List<PostRecord>>(
      stream: queryPostRecord(
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitChasingDots(
                  color: FlutterFlowTheme.of(context).info,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        List<PostRecord> mappageCopyPostRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final mappageCopyPostRecord = mappageCopyPostRecordList.isNotEmpty
            ? mappageCopyPostRecordList.first
            : null;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.safePop();
                        },
                        child: Container(
                          width: 198.0,
                          height: 100.0,
                          decoration: const BoxDecoration(),
                          child: Icon(
                            Icons.chevron_left_sharp,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 0.6,
                      decoration: const BoxDecoration(),
                      child: Stack(
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: FlutterFlowGoogleMap(
                              controller: _model.googleMapsController,
                              onCameraIdle: (latLng) => setState(
                                  () => _model.googleMapsCenter = latLng),
                              initialLocation: _model.googleMapsCenter ??=
                                  currentUserLocationValue!,
                              markerColor: GoogleMarkerColor.violet,
                              mapType: MapType.normal,
                              style: GoogleMapStyle.standard,
                              initialZoom: 14.0,
                              allowInteraction: true,
                              allowZoom: true,
                              showZoomControls: true,
                              showLocation: true,
                              showCompass: true,
                              showMapToolbar: false,
                              showTraffic: false,
                              centerMapOnMarkerTap: true,
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: PointerInterceptor(
                              intercepting: isWeb,
                              child: Icon(
                                Icons.location_pin,
                                color: FlutterFlowTheme.of(context).error,
                                size: 50.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 0.08,
                    decoration: const BoxDecoration(),
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        context.pushNamed(
                          'uploadPost',
                          queryParameters: {
                            'location': serializeParam(
                              _model.googleMapsCenter,
                              ParamType.LatLng,
                            ),
                            'category': serializeParam(
                              widget.category,
                              ParamType.String,
                            ),
                            'title': serializeParam(
                              widget.title,
                              ParamType.String,
                            ),
                            'price': serializeParam(
                              widget.price,
                              ParamType.int,
                            ),
                            'desc': serializeParam(
                              widget.description,
                              ParamType.String,
                            ),
                          }.withoutNulls,
                        );
                      },
                      text: 'confirm',
                      options: FFButtonOptions(
                        width: 150.0,
                        height: 40.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).main1,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).titleSmallFamily,
                              color: Colors.white,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .titleSmallFamily),
                            ),
                        elevation: 3.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
