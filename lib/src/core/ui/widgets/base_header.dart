// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../styles/text_styles.dart';

class BaseHeader extends StatelessWidget {
  final String title;
  final ValueChanged<String>? searchChange;
  final String buttonLabel;
  final VoidCallback? buttonPressed;
  final bool addButon;
  final Widget? filterWidget;

  const BaseHeader({
    Key? key,
    required this.title,
    this.searchChange,
    required this.buttonLabel,
    this.buttonPressed,
    this.addButon = true,
    this.filterWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constrains) {
        return Wrap(
          children: [
            Visibility(
              visible: filterWidget == null,
              replacement: filterWidget ?? const SizedBox.shrink(),
              child: SizedBox(
                width: constrains.maxWidth * .15,
                child: TextFormField(
                  onChanged: searchChange,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    prefixIcon: Icon(
                      Icons.search,
                      size: constrains.maxWidth * 0.02,
                    ),
                    label: Text(
                      'Buscar',
                      style: context.textStyles.textRegular.copyWith(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: constrains.maxWidth * .65,
              padding: const EdgeInsets.all(8),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: context.textStyles.textTitle.copyWith(
                  decoration: TextDecoration.underline,
                  decorationThickness: 2,
                ),
              ),
            ),
            Visibility(
              visible: addButon,
              child: SizedBox(
                height: 48,
                width: constrains.maxWidth * .15,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add,
                    size: constrains.maxWidth * 0.02,
                  ),
                  label: Text(
                    buttonLabel,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
