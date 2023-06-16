import 'package:get/get.dart';

class LocalString extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {'hello': 'HELLO WORLD', 'message': 'WELCOME TO LIVEASY'},
        'hi_IN': {
          'hello': 'हेलो विश्व',
          'message': 'लिवेसी में आपका स्वागत है'
        },
        'fr_FR': {
          'hello': 'Bonjour le monde',
          'message': 'bienvenue chez liveasy'
        },
      };
}
