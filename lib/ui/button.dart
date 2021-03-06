import 'package:auto_size_text/auto_size_text.dart';
import 'package:ekf_test_app/common/helper.dart';
import 'package:ekf_test_app/common/mycolors.dart';
import 'package:flutter/material.dart';

enum Type { clear, save }

class Button extends StatelessWidget {
  final Type type;
  final bool enabled;
  final AutoSizeGroup group;

  const Button({Key key, this.type, this.enabled: false, this.group})
      : assert(type != null);

  color() {
    switch (type) {
      case Type.clear:
        return MyColors.RED;
      case Type.save:
        return enabled ? MyColors.WHITE : MyColors.GREEN;
    }
  }

  decoration() {
    switch (type) {
      case Type.clear:
        return null;
      case Type.save:
        return ShapeDecoration(
            color: enabled ? MyColors.GREEN : null,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(width: enabled ? 0 : 2, color: color())));
    }
  }

  label() {
    switch (type) {
      case Type.clear:
        return "Очистить";
      case Type.save:
        return "Сохранить";
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: Helper.width(125, size),
      decoration: decoration(),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Helper.width(15, size),
            vertical: Helper.height(10, size)),
        child: Center(
          child: AutoSizeText(
            label(),
            style:
                Theme.of(context).textTheme.headline2.copyWith(color: color()),
            textAlign: TextAlign.center,
            maxLines: 1,
            minFontSize: 8,
            maxFontSize: 14,
            group: group,
          ),
        ),
      ),
    );
  }
}
