import '/backend/backend.dart';
import '/components/create_post_widget.dart';
import '/components/custom_appbar_widget.dart';
import '/components/nearby_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
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
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              SingleChildScrollView(
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
                      alignment: const AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(10.0, 7.0, 0.0, 7.0),
                        child: Text(
                          '걸어서 갈수 있는 업체 ',
                          style: FlutterFlowTheme.of(context).titleLarge,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 0.48,
                        decoration: const BoxDecoration(),
                        child: SizedBox(
                          width: double.infinity,
                          height: 500.0,
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 40.0),
                                child: PageView(
                                  controller: _model.pageViewController ??=
                                      PageController(initialPage: 0),
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    StreamBuilder<List<AdvertisementsRecord>>(
                                      stream: queryAdvertisementsRecord(
                                        limit: 5,
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: SpinKitChasingDots(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                size: 50.0,
                                              ),
                                            ),
                                          );
                                        }
                                        List<AdvertisementsRecord>
                                            columnAdvertisementsRecordList =
                                            snapshot.data!;
                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: List.generate(
                                              columnAdvertisementsRecordList
                                                  .length, (columnIndex) {
                                            final columnAdvertisementsRecord =
                                                columnAdvertisementsRecordList[
                                                    columnIndex];
                                            return Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.11,
                                              decoration: const BoxDecoration(),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'adDetailPage',
                                                    queryParameters: {
                                                      'adReference':
                                                          serializeParam(
                                                        columnAdvertisementsRecord
                                                            .reference,
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      kTransitionInfoKey:
                                                          const TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                            PageTransitionType
                                                                .rightToLeft,
                                                      ),
                                                    },
                                                  );
                                                },
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.network(
                                                        valueOrDefault<String>(
                                                          columnAdvertisementsRecord
                                                              .images.first,
                                                          'data:image/png;base64,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',
                                                        ),
                                                        width: 75.0,
                                                        height: 75.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  9.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        3.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    columnAdvertisementsRecord
                                                                        .title,
                                                                    '진공인중개사사무소  ·',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                      ),
                                                                ),
                                                                Text(
                                                                  ' • ',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .sub1,
                                                                        fontSize:
                                                                            11.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                                ),
                                                                Text(
                                                                  '332m',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .sub1,
                                                                        fontSize:
                                                                            11.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Text(
                                                            columnAdvertisementsRecord
                                                                .content,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily),
                                                                ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        3.0,
                                                                        0.0,
                                                                        3.0),
                                                            child: Text(
                                                              '${dateTimeFormat('Md', columnAdvertisementsRecord.uploadDate)}일전',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    fontSize:
                                                                        10.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                  ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 70.0,
                                                            height: 20.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: const Color(
                                                                  0xFF17ACD1),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          2.0),
                                                            ),
                                                            child: Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Text(
                                                                columnAdvertisementsRecord
                                                                    .howFar,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w300,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          }),
                                        );
                                      },
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        'https://picsum.photos/seed/342/600',
                                        width: 300.0,
                                        height: 200.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        'https://picsum.photos/seed/167/600',
                                        width: 300.0,
                                        height: 200.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.0, 1.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 0.0, 16.0),
                                  child:
                                      smooth_page_indicator.SmoothPageIndicator(
                                    controller: _model.pageViewController ??=
                                        PageController(initialPage: 0),
                                    count: 3,
                                    axisDirection: Axis.horizontal,
                                    onDotClicked: (i) async {
                                      await _model.pageViewController!
                                          .animateToPage(
                                        i,
                                        duration: const Duration(milliseconds: 500),
                                        curve: Curves.ease,
                                      );
                                    },
                                    effect: smooth_page_indicator
                                        .ExpandingDotsEffect(
                                      expansionFactor: 2.0,
                                      spacing: 8.0,
                                      radius: 8.0,
                                      dotWidth: 8.0,
                                      dotHeight: 8.0,
                                      dotColor: const Color(0xFF9B9494),
                                      activeDotColor:
                                          FlutterFlowTheme.of(context).sub1,
                                      paintStyle: PaintingStyle.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.88, 0.91),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onDoubleTap: () async {
                    Navigator.pop(context);
                  },
                  child: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 27.5,
                    borderWidth: 1.0,
                    buttonSize: 55.0,
                    fillColor: const Color(0xFFE15A19),
                    icon: Icon(
                      Icons.add,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: const Color(0x44000000),
                        enableDrag: false,
                        context: context,
                        builder: (context) {
                          return GestureDetector(
                            onTap: () => _model.unfocusNode.canRequestFocus
                                ? FocusScope.of(context)
                                    .requestFocus(_model.unfocusNode)
                                : FocusScope.of(context).unfocus(),
                            child: Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: SizedBox(
                                height: MediaQuery.sizeOf(context).height * 1.0,
                                child: const CreatePostWidget(),
                              ),
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
