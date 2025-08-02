import 'package:flutter/material.dart';

import '../../../design_system.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.label,
    this.validator,
    this.controller,
    this.decoration,
    this.obscureText = false,
    this.expands = false,
    this.autocorrect = false,
    this.enabled = true,
    this.minLines,
    this.maxLines,
    this.constraints,
    this.keyboardType,
  });

  final TextEditingController? controller;
  final String label;
  final String? Function(String?)? validator;
  final InputDecoration? decoration;
  final bool obscureText;
  final bool expands;
  final bool autocorrect;
  final bool enabled;
  final BoxConstraints? constraints;
  final int? minLines;
  final int? maxLines;
  final TextInputType? keyboardType;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool obscureText = false;

  @override
  void initState() {
    super.initState();
    obscureText = widget.obscureText;
  }

  void toggleObscureText() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: Spacing.small,
      children: [
        StyledText.b3(
          widget.label,
          isBold: true,
        ),
        TextFormField(
          controller: widget.controller,
          expands: widget.expands,
          autocorrect: widget.autocorrect,
          maxLines: widget.maxLines,
          minLines: widget.minLines,
          readOnly: !widget.enabled,
          keyboardType: widget.keyboardType,
          textAlignVertical: widget.expands ? TextAlignVertical.top : null,
          onTapOutside: (_) =>  FocusScope.of(context).unfocus(),
          decoration:
              widget.decoration ??
              InputDecoration(
                constraints: widget.constraints,
                hint: StyledText.l3(widget.label),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(RadiusSize.large),
                ),
                suffixIcon: widget.obscureText
                    ? InkWell(
                        onTap: toggleObscureText,
                        overlayColor: WidgetStateColor.transparent,
                        child: Icon(
                          obscureText ? Icons.visibility : Icons.visibility_off,
                        ),
                      )
                    : null,
              ),
          validator: widget.validator,
          obscureText: obscureText,
        ),
      ],
    );
  }
}
