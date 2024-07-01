import 'package:get/get.dart';
import 'package:islamic_app/app/languages/ban.dart';

import 'languages/eng.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': eng,
        'bn_BD': ban,
      };
}
