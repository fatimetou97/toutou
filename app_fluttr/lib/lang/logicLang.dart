import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {'hello': 'Hello World', "welcomeText": " welcomme "},
        'fr': {
          'hello': 'Hallo Welt',
          "welcomeText": " Salut  bienvenue ",
          "message": "Vous avez appuyé sur le bouton plusieurs fois "
        },
        'ar': {"welcomeText": " اهلا وسهلا "},
        // 'hi': {'hello': 'Hello World', "welcomeText": " स्वागत है "},
      };
}
