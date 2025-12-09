import 'package:zodart/zodart.dart';

part 'reel.zodart.dart';
part 'reel.zodart.type.dart';

@ZodArt.generateNewClass(outputClassName: 'Reel')
abstract class ReelSchema {
  static final schema = (
    id: ZString().trim().min(0).max(200),
    imageId: ZString().trim().min(1).max(100),
    title: ZString().trim().min(0).max(100),
    // color: ZString().trim().min(0).max(100),
    description: ZString().min(0).max(500),
  );

  // Access to generated helper methods like props list etc.
  static const z = _ReelSchemaUtils();
  static final ZObject<Reel> zObject = z.zObject;
}