import '/backend/backend.dart';
import '/components/custom_app_bar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'iconOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        ScaleEffect(
          curve: Curves.elasticOut,
          delay: 0.ms,
          duration: 750.ms,
          begin: Offset(0.0, 0.0),
          end: Offset(1.0, 1.0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 430.ms,
          duration: 440.ms,
          begin: Offset(1.0, 1.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.02, -0.39),
                child: Icon(
                  key: ValueKey('animate'),
                  Icons.favorite_sharp,
                  color: FlutterFlowTheme.of(context).alternate,
                  size: 70.0,
                ).animateOnActionTrigger(
                  animationsMap['iconOnActionTriggerAnimation']!,
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  wrapWithModel(
                    model: _model.customAppBarModel,
                    updateCallback: () => setState(() {}),
                    child: CustomAppBarWidget(),
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: StreamBuilder<List<PostRecord>>(
                        stream: queryPostRecord(
                          queryBuilder: (postRecord) => postRecord
                              .orderBy('uploadTime', descending: true),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: SpinKitChasingDots(
                                  color: FlutterFlowTheme.of(context).info,
                                  size: 50.0,
                                ),
                              ),
                            );
                          }
                          List<PostRecord> listViewPostRecordList =
                              snapshot.data!;
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewPostRecordList.length,
                            itemBuilder: (context, listViewIndex) {
                              final listViewPostRecord =
                                  listViewPostRecordList[listViewIndex];
                              return Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 140.0,
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          'postDetailPage',
                                          queryParameters: {
                                            'postRef': serializeParam(
                                              listViewPostRecord.reference,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 0.0, 0.0, 0.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                              child: Image.network(
                                                listViewPostRecord
                                                    .uploadedImages.first,
                                                width: 110.0,
                                                height: 110.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 0.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 10.0),
                                                  child: Text(
                                                    listViewPostRecord.title,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 10.0),
                                                  child: Text(
                                                    listViewPostRecord.category,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 10.0),
                                                  child: Text(
                                                    dateTimeFormat(
                                                        'jm',
                                                        listViewPostRecord
                                                            .uploadTime!),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                ),
                                                Text(
                                                  listViewPostRecord.like
                                                      .toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      thickness: 1.0,
                                      color: Color(0xFFE0DCDC),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: AlignmentDirectional(0.73, 0.86),
                child: FlutterFlowIconButton(
                  borderRadius: 27.5,
                  borderWidth: 1.0,
                  buttonSize: 55.0,
                  fillColor: FlutterFlowTheme.of(context).main2,
                  icon: Icon(
                    Icons.add,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    context.pushNamed(
                      'uploadPost',
                      extra: <String, dynamic>{
                        kTransitionInfoKey: TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.bottomToTop,
                          duration: Duration(milliseconds: 300),
                        ),
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
