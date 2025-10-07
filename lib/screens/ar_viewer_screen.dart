import 'package:flutter/material.dart';
import 'package:ar_flutter_plugin/ar_flutter_plugin.dart';
import 'package:ar_flutter_plugin/datatypes/config_planedetection.dart';
import 'package:ar_flutter_plugin/datatypes/node_types.dart';
import 'package:ar_flutter_plugin/managers/ar_location_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_session_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_object_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_anchor_manager.dart';
import 'package:ar_flutter_plugin/models/ar_hittest_result.dart';
import 'package:ar_flutter_plugin/models/ar_node.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class ARViewerScreen extends StatefulWidget {
  const ARViewerScreen({super.key});

  @override
  State<ARViewerScreen> createState() => _ARViewerScreenState();
}

class _ARViewerScreenState extends State<ARViewerScreen> {
  late ARSessionManager arSessionManager;
  late ARObjectManager arObjectManager;
  late ARAnchorManager arAnchorManager;
  late ARLocationManager arLocationManager;
  bool _isModelLoaded = false;

  @override
  void initState() {
    super.initState();
  }

  // ✅ This function now correctly receives AR managers
  void _onARViewCreated(
    ARSessionManager sessionManager,
    ARObjectManager objectManager,
    ARAnchorManager anchorManager,
    ARLocationManager locationManager,
  ) {
    arSessionManager = sessionManager;
    arObjectManager = objectManager;
    arAnchorManager = anchorManager;
    arLocationManager = locationManager;

    arSessionManager.onInitialize(
      showFeaturePoints: true,
      showPlanes: true,
      customPlaneTexturePath: null,
      showWorldOrigin: true,
      handlePans: true,
      handleRotation: true,
    );

    arObjectManager.onInitialize();

    arSessionManager.onPlaneOrPointTap = _onPlaneOrPointTapped;

    _loadModel();
  }

  Future<void> _loadModel() async {
    try {
      const modelUrl =
          'https://raw.githubusercontent.com/MohsenKashefi/model/main/Person.glb';

      final newNode = ARNode(
        type: NodeType.webGLB,
        uri: modelUrl,
        scale: vector.Vector3(0.2, 0.2, 0.2),
        position: vector.Vector3(0.0, 0.0, 0.0),
        rotation: vector.Vector4(1.0, 0.0, 0.0, 0.0),
      );

      await arObjectManager.addNode(newNode);

      setState(() {
        _isModelLoaded = true;
      });
    } catch (e) {
      print('Error loading model: $e');
    }
  }

  Future<void> _onPlaneOrPointTapped(List<ARHitTestResult> hitTestResults) async {
    if (hitTestResults.isNotEmpty) {
      const modelUrl =
          'https://raw.githubusercontent.com/MohsenKashefi/model/main/Person.glb';

      final newNode = ARNode(
        type: NodeType.webGLB,
        uri: modelUrl,
        scale: vector.Vector3(0.2, 0.2, 0.2),
        position: vector.Vector3(0.0, 0.0, 0.0),
        rotation: vector.Vector4(1.0, 0.0, 0.0, 0.0),
      );

      await arObjectManager.addNode(newNode);
    }
  }

  @override
  void dispose() {
    arSessionManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ARView(
            onARViewCreated: _onARViewCreated, // ✅ fixed here
            planeDetectionConfig: PlaneDetectionConfig.horizontalAndVertical,
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 20,
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'Simple AR App - Tap to place model',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          if (!_isModelLoaded)
            const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Loading model...',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          Positioned(
            bottom: MediaQuery.of(context).padding.bottom + 20,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    print('Clear button pressed');
                  },
                  backgroundColor: Colors.red.withOpacity(0.8),
                  child: const Icon(Icons.clear, color: Colors.white),
                ),
                FloatingActionButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  backgroundColor: Colors.blue.withOpacity(0.8),
                  child: const Icon(Icons.close, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
