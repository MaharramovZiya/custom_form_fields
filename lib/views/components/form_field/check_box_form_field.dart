import 'package:flutter/material.dart';

class CheckBoxFormField extends FormField<bool> {
  CheckBoxFormField({super.key, required String title})
      : super(
            initialValue: false,
            validator: (bool? value) => value ?? false ? null: '',
            builder: (FormFieldState<bool> state) {
              return Row(
                children:[
                  if(state.hasError) const Icon(Icons.error,color: Colors.red,),
                  
                   Expanded(
                     child: CheckboxListTile(
                                       title: Text(title),
                      value: state.value ?? false, onChanged: state.didChange),
                   ),
              ]);
            });
}
