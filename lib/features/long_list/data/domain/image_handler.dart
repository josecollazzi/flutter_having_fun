import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class ImageHandler {
  final BaseCacheManager cacheManager;
  ImageHandler(this.cacheManager);

  // only keep this method if you need to keep control of when to load the image from server
  Future<File?> fetchImageFromCache(String key) async {
    FileInfo? fileInfo = await cacheManager.getFileFromMemory(key);
    if (fileInfo != null) {
      return fileInfo.file;
    }

    fileInfo = await cacheManager.getFileFromCache(key);

    if (fileInfo != null) {
      return fileInfo.file;
    }

    return null;
  }

  Future<File> fetchImage(String url, String key, Map<String, String> headers) async {
    FileInfo? fileInfo = await cacheManager.getFileFromMemory(key);
    if (fileInfo != null) {
      return fileInfo.file;
    }

    fileInfo = await cacheManager.getFileFromCache(key);

    if (fileInfo != null) {
      return fileInfo.file;
    }


    // all this if fake, in real applications you can use a service to download the image
    final ByteData byteData = await rootBundle.load('images/code_guru.png');
    await Future.delayed(Duration(seconds: 2));
    final Uint8List bytes = byteData.buffer.asUint8List();
    final file = await cacheManager.putFile(key, bytes);

    return file;
  }
}