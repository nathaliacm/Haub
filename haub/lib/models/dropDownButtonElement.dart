import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropDownButtomOnly extends StatefulWidget {
  DropDownButtomOnly(this.dropdownSelected, this.selecionado,
      this.onChangedDropDown, this.enable, this.hintText);

  String selecionado;
  String hintText;
  final List<String> dropdownSelected;
  final Function onChangedDropDown;
  bool enable;

  @override
  _DropDownButtomOnlyState createState() => _DropDownButtomOnlyState();
}

class _DropDownButtomOnlyState extends State<DropDownButtomOnly> {
  String currentValue;

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Container(
        width: 350,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: DropdownButton<String>(
          value: currentValue,
          isExpanded: true,
          hint: Padding(
              padding: EdgeInsets.all(10),
              child: !widget.enable
                  ? Text(
                      widget.hintText,
                      style: TextStyle(color: Colors.black),
                    )
                  : Text(
                      widget.hintText,
                      style: TextStyle(color: Colors.grey),
                    )),
          items: widget.dropdownSelected.map((String dropDownStringItem) {
            return DropdownMenuItem<String>(
              value: dropDownStringItem,
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(dropDownStringItem),
              ),
            );
          }).toList(),
          onChanged: (novoItemSelecionado) {
            widget.onChangedDropDown(novoItemSelecionado);
            !widget.enable
                ? null
                : setState(() => currentValue = novoItemSelecionado);
          },
        ),
      ),
    );
  }
}
