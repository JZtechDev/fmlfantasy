import 'dart:typed_data';
import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

/// Capture a widget and generate PDF from it, saving it to the device's documents directory.
///
/// [key] should be a GlobalKey assigned to a RepaintBoundary wrapping the widget.
/// [fileName] is the name of the PDF file (defaults to 'document.pdf').
/// Returns the path where the PDF is saved.
Future<String> generatePdfFromWidget(GlobalKey key, {String? fileName}) async {
  try {
    // Ensure the widget is rendered
    await Future.delayed(const Duration(milliseconds: 300));

    // Find the render object
    final boundary =
        key.currentContext?.findRenderObject() as RenderRepaintBoundary?;
    if (boundary == null) {
      throw Exception(
          "Could not find render object. Ensure GlobalKey is attached to a RepaintBoundary.");
    }

    // Capture image from boundary
    final ui.Image image = await boundary.toImage(pixelRatio: 3.0);
    final ByteData? byteData =
        await image.toByteData(format: ui.ImageByteFormat.png);
    if (byteData == null) {
      throw Exception("Failed to convert widget to image.");
    }
    final Uint8List pngBytes = byteData.buffer.asUint8List();

    // Create PDF document
    final pdf = pw.Document();
    final imageProvider = pw.MemoryImage(pngBytes);

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) =>
            pw.Center(child: pw.Image(imageProvider)),
      ),
    );

    // Save PDF to device
    final pdfBytes = await pdf.save();
    debugPrint(
        "PDF generated successfully, size: ${pdfBytes.lengthInBytes} bytes");
    final directory =
        await getApplicationDocumentsDirectory(); // Persistent storage
    final file = File('${directory.path}/${fileName ?? 'document.pdf'}');
    await file.writeAsBytes(pdfBytes);
    debugPrint('PDF saved to ${file.path}');
    Get.snackbar('Success', 'PDF saved to ${file.path}');

    return file.path; // Return the file path for further use
  } catch (e, stackTrace) {
    debugPrint("Error generating PDF: $e");
    debugPrint("Stack trace: $stackTrace");
    rethrow;
  }
}
