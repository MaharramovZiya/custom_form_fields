final class CustomValidator {
  final String? value;

  CustomValidator({required this.value});
  //value eger null ve ya bosdursa geriye please enter some text soze gelecek.
  String? get emptyCheck {
    if (value == null || value!.isEmpty) {
      return "Please enter some text";
    }
    return null;
  }
}
