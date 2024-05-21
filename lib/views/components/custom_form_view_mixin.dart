import 'package:custom_form_field/views/form_field_view.dart';
import 'package:flutter/material.dart';

mixin CustomFormViewMixin on State<FormFieldView> {
  //form key
  GlobalKey<FormState> customFormKey = GlobalKey<FormState>();

  //form validation notifier
  final ValueNotifier<bool> formValidateNotifier = ValueNotifier<bool>(false);


  //Form change notifer to validate the form
  void onFormChange() {
    formValidateNotifier.value =
        customFormKey.currentState?.validate() ?? false;
  }
}
