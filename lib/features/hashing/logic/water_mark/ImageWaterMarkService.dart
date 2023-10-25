import 'dart:io';

import 'package:decentproof/features/hashing/interfaces/IWaterMarkService.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as ui;

class ImageWaterMarkService implements IWaterMarkService {
  @override
  Future<String> addWaterMark(String filePath) async {
    File targeFile = File(filePath);
    Uint8List bytes = await targeFile.readAsBytes();
    ui.Image? image = ui.decodeImage(
        bytes); // Needs to be done this way, otherwise it won't be found
    if (image == null) {
      throw Exception("Image is null");
    }
    final waterMarkImageBytes = await rootBundle.load("assets/icon/icon.png");
    ui.Image waterMarkImage =
        ui.decodePng(waterMarkImageBytes.buffer.asUint8List())!;
    int offsetX = image.width - waterMarkImage.width;
    int offsetY = image.height - waterMarkImage.height;
    for (ui.Pixel pixel in waterMarkImage) {
      if (pixel.r == 0 && pixel.b == 0 && pixel.g == 0) {
        ui.drawPixel(image, offsetX + pixel.x, offsetY + pixel.y,
            ui.ColorRgb8(pixel.r.toInt(), pixel.g.toInt(), pixel.b.toInt()));
      }
    }
    await ui.encodeImageFile(filePath, image);
    return filePath;
  }
}
