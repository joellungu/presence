import 'package:flutter/material.dart';

class Admin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Admin();
  }
}

class _Admin extends State<Admin> {
  List<bool> isSelected = [true, false, false];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 40,
          alignment: Alignment.center,
          child: ToggleButtons(
            children: <Widget>[
              t("Icons.ac_unit"),
              t("Icons.call"),
              t("Icons.cake"),
            ],
            onPressed: (int index) {
              setState(() {
                isSelected.forEach((element) {
                  element = false;
                });
                isSelected[index] = !isSelected[index];
              });
            },
            isSelected: isSelected,
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.blue,
          ),
        )
      ],
    );
  }

  Widget t(String t) {
    return Container(
      width: 150,
      child: Text(t),
      alignment: Alignment.center,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
    );
  }
}
