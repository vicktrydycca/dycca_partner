import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';

class SelectTimeDropdownWidget extends StatefulWidget {
  String? value;
  String hintText;
  List<String> dropdownList = [];
  SelectTimeDropdownWidget({Key? key,required this.value, required this.dropdownList,required this.hintText}) : super(key: key);

  @override
  State<SelectTimeDropdownWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<SelectTimeDropdownWidget> {

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
        // alignment: Alignment.topRight,
        // underline:  Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
        //   child: Divider(thickness: 1,color: neutral5Color,),
        // ),
        isExpanded: true,
        hint: Padding(
          padding: const EdgeInsets.only(top: 0.0),
          child: Text("${widget.hintText}",style: fontStyle(neutral4Color, FontWeight.w100, 12),),
        ),
        value: widget.value,
        icon: const Icon(Icons.keyboard_arrow_down_rounded),
        onChanged: (newValue) {
          setState(() {
            widget.value = newValue as String;

            debugPrint(newValue);


          });
        },
        items: widget.dropdownList.map(
              (valueItem) {
            return
              DropdownMenuItem(
                  value: valueItem,
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Text(valueItem,style:  fontStyle(neutral8Color, FontWeight.w500, 12),),
                  ));
          },
        ).toList(),
      ),
    );
  }
}
