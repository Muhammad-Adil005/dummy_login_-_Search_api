import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CustomTextField extends StatelessWidget {
  final String formControlName;
  final String labelText;
  final String validationMessage;

  const CustomTextField({
    super.key,
    required this.formControlName,
    required this.labelText,
    required this.validationMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: ReactiveTextField(
        formControlName: formControlName,
        decoration: InputDecoration(
          enabled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400, width: 1.0),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xff0B7D05), width: 1.0),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xff0B7D05), width: 1.0),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            gapPadding: 100,
            borderSide: const BorderSide(color: Color(0xff0B7D05), width: 1.0),
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
          labelText: labelText,
        ),
        validationMessages: {
          ValidationMessage.required: (error) => validationMessage,
        },
      ),
    );
  }
}
