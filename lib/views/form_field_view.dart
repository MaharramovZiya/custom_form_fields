import 'package:custom_form_field/views/components/custom_form_view_mixin.dart';
import 'package:custom_form_field/views/components/custom_validator.dart';
import 'package:custom_form_field/views/components/form_field/check_box_form_field.dart';
import 'package:custom_form_field/views/components/form_field/sheet_form_field.dart';
import 'package:custom_form_field/views/utils/constant_strings.dart';
import 'package:custom_form_field/views/utils/custom_sizes.dart';
import 'package:custom_form_field/views/utils/padding_util.dart';
import 'package:flutter/material.dart';

class FormFieldView extends StatefulWidget {
  const FormFieldView({super.key});

  @override
  State<FormFieldView> createState() => _FormFieldViewState();
}

class _FormFieldViewState extends State<FormFieldView>
    with CustomFormViewMixin {
  @override
  Widget build(BuildContext context) {
    CustomAppSized.init(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(FormStringKeys.appTitle),
        ),
        body: Padding(
          padding: CustomPadding.pageWithPadding,
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Form(
              onChanged: onFormChange,
              key: customFormKey,
              child: Column(
                children: [
                  const _FirstNameController(),
                  const _LastNameController(),
                  SheetFormField(),
                  CheckBoxFormField(title: FormStringKeys.checkAgree),
                  SubmitButton(formValidateNotifier: formValidateNotifier),
                  const  SizedBox(
                    height: 500,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

class _LastNameController extends StatelessWidget {
  const _LastNameController({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => CustomValidator(value: value).emptyCheck,
      decoration: const InputDecoration(labelText: FormStringKeys.lastName),
    );
  }
}

class _FirstNameController extends StatelessWidget {
  const _FirstNameController({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => CustomValidator(value: value).emptyCheck,
      decoration: const InputDecoration(labelText: FormStringKeys.firstName),
    );
  }
}

//to will widget
final class SubmitButton extends StatelessWidget {
  const SubmitButton({
    required this.formValidateNotifier,
  });

  final ValueNotifier<bool> formValidateNotifier;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: CustomAppSized.customWidth,
      child: ValueListenableBuilder(
          valueListenable: formValidateNotifier,
          builder: (context, value, child) {
            return ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: !value
                    ? null
                    : () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(FormStringKeys.formValidtxt)));
                      },
                child: const Text(
                  FormStringKeys.buttonText,
                  style: TextStyle(color: Colors.white),
                ));
          }),
    );
  }
}
