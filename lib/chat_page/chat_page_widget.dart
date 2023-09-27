import '/backend/backend.dart';
import '/flutter_flow/chat/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chat_page_model.dart';
export 'chat_page_model.dart';

class ChatPageWidget extends StatefulWidget {
  const ChatPageWidget({
    Key? key,
    this.chatRef,
    required this.chatUser,
  }) : super(key: key);

  final DocumentReference? chatRef;
  final UserRecord? chatUser;

  @override
  _ChatPageWidgetState createState() => _ChatPageWidgetState();
}

class _ChatPageWidgetState extends State<ChatPageWidget> {
  late ChatPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  FFChatInfo? _chatInfo;
  bool isGroupChat() {
    if (widget.chatUser == null) {
      return true;
    }
    if (widget.chatRef == null) {
      return false;
    }
    return _chatInfo?.isGroupChat ?? false;
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatPageModel());

    FFChatManager.instance
        .getChatInfo(
      otherUserRecord: widget.chatUser,
      chatReference: widget.chatRef,
    )
        .listen((info) {
      if (mounted) {
        setState(() => _chatInfo = info);
      }
    });

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

    return StreamBuilder<UserRecord>(
      stream: UserRecord.getDocument(widget.chatUser!.reference),
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
        final chatPageUserRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              title: Stack(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.safePop();
                        },
                        child: Icon(
                          Icons.arrow_back_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            50.0, 0.0, 10.0, 0.0),
                        child: Container(
                          width: 40.0,
                          height: 40.0,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.network(
                            'https://picsum.photos/seed/779/600',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        chatPageUserRecord.displayName,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              color: FlutterFlowTheme.of(context).sub1,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                    ],
                  ),
                ],
              ),
              actions: [],
              centerTitle: true,
            ),
            body: SafeArea(
              top: true,
              child: StreamBuilder<FFChatInfo>(
                stream: FFChatManager.instance.getChatInfo(
                  otherUserRecord: widget.chatUser,
                  chatReference: widget.chatRef,
                ),
                builder: (context, snapshot) => snapshot.hasData
                    ? FFChatPage(
                        chatInfo: snapshot.data!,
                        allowImages: true,
                        backgroundColor: Color(0xFFF2F4F8),
                        timeDisplaySetting: TimeDisplaySetting.alwaysVisible,
                        currentUserBoxDecoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        otherUsersBoxDecoration: BoxDecoration(
                          color: Color(0xFF4B39EF),
                          border: Border.all(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        currentUserTextStyle: GoogleFonts.getFont(
                          'DM Sans',
                          color: Color(0xFF1E2429),
                          fontWeight: FontWeight.w500,
                          fontSize: 14.0,
                          fontStyle: FontStyle.normal,
                        ),
                        otherUsersTextStyle: GoogleFonts.getFont(
                          'DM Sans',
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.0,
                        ),
                        inputHintTextStyle: GoogleFonts.getFont(
                          'DM Sans',
                          color: Color(0xFF95A1AC),
                          fontWeight: FontWeight.normal,
                          fontSize: 14.0,
                        ),
                        inputTextStyle: GoogleFonts.getFont(
                          'DM Sans',
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 14.0,
                        ),
                        emptyChatWidget: Center(
                          child: Image.asset(
                            'assets/images/online_delivery_tracking.png',
                            width: MediaQuery.sizeOf(context).width * 0.76,
                          ),
                        ),
                      )
                    : Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: SpinKitChasingDots(
                            color: FlutterFlowTheme.of(context).info,
                            size: 50.0,
                          ),
                        ),
                      ),
              ),
            ),
          ),
        );
      },
    );
  }
}
