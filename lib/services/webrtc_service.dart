import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:get/get.dart' hide navigator;

class WebRTCService extends GetxService {
  RTCPeerConnection? _peerConnection;
  MediaStream? _localStream;
  final RTCVideoRenderer localRenderer = RTCVideoRenderer();
  final RTCVideoRenderer remoteRenderer = RTCVideoRenderer();

  Future<void> initRenderers() async {
    await localRenderer.initialize();
    await remoteRenderer.initialize();
  }

  Future<void> makeCall() async {
    final Map<String, dynamic> configuration = {
      'iceServers': [
        {'url': 'stun:stun.l.google.com:19302'},
      ]
    };
    _peerConnection = await createPeerConnection(configuration);

    _localStream = await navigator.mediaDevices.getUserMedia({
      'audio': true,
      'video': true,
    });

    localRenderer.srcObject = _localStream;
  }

  @override
  void onClose() {
    localRenderer.dispose();
    remoteRenderer.dispose();
    _localStream?.dispose();
    _peerConnection?.dispose();
    super.onClose();
  }
}
