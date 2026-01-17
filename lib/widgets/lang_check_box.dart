
import 'package:flutter/material.dart';
import 'package:table/bloc/languageCubit/lang_cubit.dart';

class LangCheckBox extends StatelessWidget {
  const LangCheckBox({
    super.key,
    required this.lang,
  });

  final LangCubit lang;

  @override
  Widget build(BuildContext context) {

        return Row(
          children: [
            Checkbox(
              value: lang.state,
              onChanged: (bool? value) {
                lang.changeLang();
              },
            ),
            const Text("عرض كود المادة فقط ؟"),
            const SizedBox(width: 16),
          ],
        
      
    );
  }
}
