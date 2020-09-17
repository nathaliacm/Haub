import 'package:flutter/material.dart';
import 'package:haub/models/appBar.dart';
import 'package:haub/models/raisedButton.dart';

class DropDownPage extends StatefulWidget {
  final List<String> dropDownList;
  final String textBeforeBox;
  final Function onPressedFunction;
  final String buttomText;
  final Function onChangedDropDown;

  DropDownPage(this.dropDownList, this.textBeforeBox, this.onPressedFunction,
      this.buttomText,this.onChangedDropDown);
  
  @override
  _DropDownState createState() => _DropDownState();
}
class _DropDownState extends State<DropDownPage> {
  String currentValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CircularAppBar(" ", 120, true, 20),
      body: criaDropDownButton(),
    );
  }

  criaDropDownButton() {
    return Container(
      padding: EdgeInsets.only(top: 110),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              widget.textBeforeBox,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.grey[300],
                ),
                width: 310,
                child: SingleChildScrollView(
                  child: DropdownButton<String>(
                      value: currentValue,
                      isExpanded: true,
                      items:
                          widget.dropDownList.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(dropDownStringItem),
                          ),
                        );
                      }).toList(),
                      onChanged: (novoItemSelecionado) {
                        this.widget.onChangedDropDown(novoItemSelecionado);
                        setState(() => currentValue = novoItemSelecionado);
                      },
                    ),
                ),
              ),
            ],
          ),
          Container(
              width: 200,
              padding: EdgeInsets.only(top: 40),
              child:
                  MyRaisedButton(widget.onPressedFunction, widget.buttomText)),
        ],
      ),
    );
  }
}
