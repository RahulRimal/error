import '../providers/first_provider.dart';

class FirstScreenViewModel extends FirstProvider {
  init() {
    getAlphabets();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
