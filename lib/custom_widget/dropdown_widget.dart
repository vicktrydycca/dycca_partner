import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';

class DropdownWidget extends StatefulWidget {
  String? value;
  String hintText;
  List<String> dropdownList = [];
   DropdownWidget({Key? key,required this.value, required this.dropdownList,required this.hintText}) : super(key: key);

  @override
  State<DropdownWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: DropdownButton(

        onTap: (){
          if(widget.value.toString().isEmpty){
            // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            //     content: Text('Enter Occassion'),
            //     backgroundColor: Colors.red));
          }
        },
        alignment: Alignment.topRight,
        underline:  const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Divider(thickness: 1,color: neutral5Color,),
        ),
        isExpanded: true,
        hint: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Text(widget.hintText,style: fontStyle(neutral4Color, FontWeight.w400, 15),),
        ),
        value: widget.value,
        icon: const Icon(Icons.keyboard_arrow_down_rounded),
        onChanged: (newValue) {
          setState(() {
            widget.value = newValue as String;

          });
        },
        items: widget.dropdownList.map(
              (valueItem) {
            return
              DropdownMenuItem(
                  value: valueItem,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(valueItem),
                  ));
          },
        ).toList(),
      ),
    );
  }
}
