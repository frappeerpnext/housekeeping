import 'package:flutter/material.dart';
import 'package:housekeeping/constants/constant.dart';
import 'package:housekeeping/widgets/text/text_widget.dart';

class ListTileWidget extends StatelessWidget {
  final bool enabled;
  final bool isDisabled;
  final bool isVisibled;
  final IconData? icon;
  final String? text;
  final bool selected;
  final VoidCallback? onPressed;
  final Color? iconColor;
  final Color? color;
  const ListTileWidget({
    Key? key,
    this.enabled = true,
    this.isDisabled = false,
    this.isVisibled = true,
    this.icon,
    this.selected = false,
    this.text,
    this.onPressed,
    this.iconColor,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisibled,
      child: ListTile(
        enabled: enabled,
        leading: Icon(
          icon,
          color: color ??
              (isDisabled ? Colors.grey[400] : (iconColor ?? textColor)),
        ),
        title: TextWidget(
          text: text ?? "",
          color: color ?? (isDisabled ? Colors.grey[400] : textColor),
        ),
        selected: selected,
        onTap: isDisabled ? null : onPressed,
      ),
    );
  }
}
