import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class ScreenshotThumbnailGrid extends StatefulWidget {
  final List<PlatformFile> files;
  final int column;
  const ScreenshotThumbnailGrid({
    super.key,
    required this.files,
    this.column = 4,
  });

  @override
  State<ScreenshotThumbnailGrid> createState() =>
      _ScreenshotThumbnailGridState();
}

class _ScreenshotThumbnailGridState extends State<ScreenshotThumbnailGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.files.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: widget.column,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, i) {
        return Stack(
          children: [
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: Image.memory(widget.files[i].bytes!),
            ),
            Positioned(
              top: 4,
              right: 4,
              child: GestureDetector(
                onTap: () => setState(() => widget.files.removeAt(i)),
                child: Container(
                  width: 18,
                  height: 18,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Colors.black87,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.close, size: 12, color: Colors.white),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
