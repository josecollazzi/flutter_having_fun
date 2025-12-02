import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Whether the app should use local (dev) data sources.
final isDevelopment = Provider<bool>((ref) => false);