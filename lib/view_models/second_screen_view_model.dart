import 'package:error/providers/second_provider.dart';

import '../providers/first_provider.dart';

class SecondScreenViewModel extends SecondProvider {
  init() {
    getWords();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
