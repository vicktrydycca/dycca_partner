import 'package:dycca_partner/custom_widget/appbar_backbutton.dart';
import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';

class ParticipantsDetailScreen extends StatefulWidget {
  const ParticipantsDetailScreen({Key? key}) : super(key: key);

  @override
  State<ParticipantsDetailScreen> createState() => _ParticipantsDetailScreenState();
}

class _ParticipantsDetailScreenState extends State<ParticipantsDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColour,
      appBar: AppbarBackButton().AppbarBack(context, "Participants"),
    );
  }
}
