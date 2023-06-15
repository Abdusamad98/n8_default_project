import 'package:flutter/material.dart';
import 'package:n8_default_project/utils/utility_functions.dart';

import '../../../models/profile_model.dart';

class UniversalInputView extends StatefulWidget {
  const UniversalInputView({
    Key? key,
    required this.caption,
    required this.hintText,
    required this.inputType,
    this.isStudentId = false,
    required this.onChanged,
    required this.initialValue,
    required this.format,
  }) : super(key: key);

  final String caption;
  final InputFormatType format;

  final String hintText;
  final bool isStudentId;
  final String initialValue;
  final TextInputType inputType;
  final ValueChanged<String> onChanged;

  @override
  State<UniversalInputView> createState() => _UniversalInputViewState();
}

class _UniversalInputViewState extends State<UniversalInputView> {
  final TextEditingController textController = TextEditingController();

  @override
  void initState() {
    textController.text = widget.initialValue;
    textController.addListener(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.caption,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            inputFormatters: [
              if (widget.format == InputFormatType.phone)
                UtilityFunctions.maskFormatterPhone,
              if (widget.format == InputFormatType.id)
                UtilityFunctions.maskFormatterId,
              if (widget.format == InputFormatType.date)
                UtilityFunctions.maskFormatterDate,
            ],
            controller: textController,
            onChanged: widget.onChanged,
            keyboardType: widget.inputType,
            textInputAction: TextInputAction.next,
            cursorHeight: 25,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 16,
              ),
              hintText: widget.hintText,
              hintStyle: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
              fillColor: widget.isStudentId
                  ? const Color(0xFFCBD5E1).withOpacity(0.5)
                  : const Color(0xFFCBD5E1).withOpacity(0.2),
              filled: true,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      const BorderSide(width: 1, color: Color(0xFFCBD5E1))),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      const BorderSide(width: 1, color: Color(0xFFCBD5E1))),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      const BorderSide(width: 1, color: Color(0xFFCBD5E1))),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      const BorderSide(width: 1, color: Color(0xFFCBD5E1))),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      const BorderSide(width: 1, color: Color(0xFFCBD5E1))),
            ),
          )
        ],
      ),
    );
  }
}
