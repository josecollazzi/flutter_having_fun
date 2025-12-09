import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:layout2/features/long_list/data/domain/entities/reel.dart';
import 'package:layout2/features/long_list/data/domain/image_handler.dart';

class ReelWidget extends StatelessWidget {
  final Reel reel;

  const ReelWidget({
    super.key,
    required this.reel,
  });

  Future<File?> _loadImage(ImageHandler imageHandler) async {
    final cached = await imageHandler.fetchImageFromCache(reel.imageId);
    if (cached != null) return cached;

    return imageHandler.fetchImage(
      'https://images.com/${reel.imageId}',
      reel.imageId,
      const {},
    );
  }

  @override
  Widget build(BuildContext context) {
    final imageHandler = context.read<ImageHandler>();

    return ListTile(
      title: Text(reel.title),
      subtitle: Text(reel.description),
      leading: FutureBuilder<File?>(
        future: _loadImage(imageHandler),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SizedBox(
              width: 40,
              height: 40,
              child: Center(
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            );
          }

          if (snapshot.hasError) {
            return const Icon(Icons.broken_image);
          }

          final file = snapshot.data;
          if (file == null) {
            return const Icon(Icons.image_not_supported);
          }

          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.file(
              file,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
