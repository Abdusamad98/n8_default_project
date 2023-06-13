import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:n8_default_project/utils/icons.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String selectedLanguage = 'uz_UZ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Change langauge"),
      ),
      body: Column(
        children: [
          ListTile(
            leading: SvgPicture.asset(
              AppImages.russianFlag,
            ),
            title: Text("Russian"),
            onTap: () {
              context.setLocale(Locale("ru", "RU"));
            },
          ),
          ListTile(
            leading: SvgPicture.asset(
              AppImages.englishFlag,
            ),
            title: Text("English"),
            onTap: () {
              context.setLocale(Locale("en", "EN"));
            },
          ),
          ListTile(
            leading: SvgPicture.asset(
              AppImages.uzbekFlag,
            ),
            title: Text("Uzbek"),
            onTap: () {
              context.setLocale(Locale("uz", "UZ"));
            },
          ),
        ],
      ),
    );
  }
}
