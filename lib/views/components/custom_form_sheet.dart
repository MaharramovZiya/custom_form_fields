import 'package:custom_form_field/views/utils/padding_util.dart';
import 'package:flutter/material.dart';

class CustomFormSheet extends StatelessWidget {
  const CustomFormSheet({Key? key}) : super(key: key);

  static Future<bool?> show(BuildContext context) {
    return showModalBottomSheet<bool>(
      context: context,
      builder: (context) {
        return const CustomFormSheet();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: CustomPadding.pageWithPadding,
        child: Column(
          children: [
            Text('Please read this form ' * 20),
            IconButton(
                onPressed: () {
                  Navigator.pop(context,true);
                },
                icon: const Icon(Icons.read_more_sharp))
          ],
        ));
  }
}
