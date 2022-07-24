import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';

class SelectTimeFormatWidget extends StatefulWidget {
  const SelectTimeFormatWidget({Key? key}) : super(key: key);

  @override
  State<SelectTimeFormatWidget> createState() => _SelectTimeFormatWidgetState();
}

class _SelectTimeFormatWidgetState extends State<SelectTimeFormatWidget> {
  DateTime startDate = DateTime.now().add(const Duration(days: 5));
  TimeOfDay startTime = TimeOfDay.now();
  DateTime endDate = DateTime.now().add(const Duration(days: 10));
  TimeOfDay endTime = TimeOfDay.now();
  DateTime enrollmentEndDate = DateTime.now();
  TimeOfDay enrollmentEndTime = TimeOfDay.now();
  Future<void> _selectTime(BuildContext context, type) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: type == 'StartDate'
          ? startTime
          : type == 'EndDate'
          ? endTime
          : enrollmentEndTime,
    );
    if (pickedTime != null) {
      if (type == 'StartDate') {
        startTime = pickedTime;
      }
      setState(() {});
    }
  }
  getformattedTime(TimeOfDay time) {
    return '${time.hour}:${time.minute} ${time.period.toString().split('.')[1]}';
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _selectTime(context, 'startDate');
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            getformattedTime(startTime),
            style: fontStyle(
                neutral4Color, FontWeight.w400, 16),
          ),
          const SizedBox(width: 10,),
          const Icon(Icons.keyboard_arrow_down_outlined)
        ],
      ),
    );
  }
}
