import 'package:flutter/material.dart';

class CustomPopupMenuButton extends StatelessWidget {
  final String? initialValue;
  final List<String> items;
  final ValueChanged<String> onSelected;
  final String buttonText;
  final Color selectedColor;

  const CustomPopupMenuButton({
    Key? key,
    required this.initialValue,
    required this.items,
    required this.onSelected,
    required this.buttonText,
    required this.selectedColor, required int itemWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        final RenderBox button = context.findRenderObject() as RenderBox;
        final RenderBox overlay = Overlay.of(context)!.context.findRenderObject() as RenderBox;
        final RelativeRect position = RelativeRect.fromRect(
          Rect.fromPoints(
            button.localToGlobal(button.size.bottomLeft(Offset.zero), ancestor: overlay),
            button.localToGlobal(button.size.bottomRight(Offset.zero), ancestor: overlay),
          ),
          Offset.zero & overlay.size,
        );

        showMenu(
          context: context,
          position: position,
          items: items.map((String item) {
            String label;
            switch (item) {
              case '지역':
                label = '지역 유형';
                break;
              case '인원':
                label = '인수 유형';
                break;
              case '유형':
                label = '기기';
                break;
              case '예약여부':
                label = '예약 가능 여부';
                break;
              case '4명 이상':
                label = item;
                break;
              default:
                label = item;
                break;
            }
            return PopupMenuItem<String>(
              value: item == '4명 이상' ? '4명+' : item,
              child: Center(
                child: SizedBox(
                  width: button.size.width,
                  child: Text(label, textAlign: TextAlign.center),
                ),
              ),
            );
          }).toList(),
        ).then((value) {
          if (value != null) {
            onSelected(value);
          }
        });
      },
      child: Text(
        buttonText,
        style: TextStyle(
          color: buttonText == initialValue ? Colors.white : null,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: buttonText == initialValue
            ? MaterialStateProperty.all<Color>(selectedColor)
            : null,
      ),
    );
  }
}
