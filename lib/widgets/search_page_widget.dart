import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
// Import the object detector package
import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';
import 'package:image_picker/image_picker.dart';

class SearchPageWidget extends StatefulWidget {
  const SearchPageWidget({super.key});

  @override
  State<SearchPageWidget> createState() => _SearchPageWidgetState();
}

class _SearchPageWidgetState extends State<SearchPageWidget> {
  // Use the ObjectDetector with a pre-configured options instance
  final ObjectDetector objectDetector = GoogleMlKit.vision.objectDetector(
    options: ObjectDetectorOptions(
      classifyObjects: true,
      mode: DetectionMode.single,
      multipleObjects: true,
    ),
  );
  List<DetectedObject> detectedObjects = []; // Stores detected objects

  // Define a list of jewellery-related labels (adjust as needed)
  final List<String> jewelleryLabels = ["ring", "bracelet", "necklace", "earring", "jewelry"];

  Future<void> _pickImage() async {
    final imagePicker = ImagePicker();

    final source = await showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text('Select Image Source'),
        children: [
          SimpleDialogOption(
            onPressed: () => Navigator.pop(context, ImageSource.camera),
            child: const Text('Camera'),
          ),
          SimpleDialogOption(
            onPressed: () => Navigator.pop(context, ImageSource.gallery),
            child: const Text('Gallery'),
          ),
        ],
      ),
    );

    if (source == null) return;

    final pickedFile = await imagePicker.pickImage(source: source);
    if (pickedFile != null) {
      await _processImage(pickedFile as PickedFile);
    }
  }

  Future<void> _processImage(PickedFile image) async {
    if (image == null) return;

    final inputImage = InputImage.fromFilePath(image.path);

    try {
      final List<DetectedObject> objects = await objectDetector.processImage(inputImage);

      if (objects.isNotEmpty) {
        final allObjectNames = objects.map((object) => object.labels.first.text).join(', ');
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Detected Objects'),
            content: Text(allObjectNames),
          ),
        );
      } else {
        showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text('No Objects Detected'),
            content: Text('The image does not contain any objects.'),
          ),
        );
      }
    } catch (e) {
      print('Error detecting objects: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Search using Object Detection'),
            ElevatedButton(
              onPressed: _pickImage,
              child: const Text('Choose Image'),
            ),
            if (detectedObjects.isNotEmpty)
              Text(
                'Detected Objects: ${detectedObjects.map((object) => object.labels.first.text).join(', ')}',
              ),
          ],
        ),
      ),
    );
  }
}
