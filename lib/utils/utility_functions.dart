import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class UtilityFunctions {
  static MaskTextInputFormatter maskFormatterPhone = MaskTextInputFormatter(
    mask: '+998 (##) ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  static MaskTextInputFormatter maskFormatterDate = MaskTextInputFormatter(
    mask: '##/##/####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  static MaskTextInputFormatter maskFormatterPassword = MaskTextInputFormatter(
    mask: '\#### ## ##',
    type: MaskAutoCompletionType.lazy,
  );
}
