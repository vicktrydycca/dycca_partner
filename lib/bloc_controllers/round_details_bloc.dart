import 'dart:async';
import 'dart:convert';

import 'package:dycca_partner/api_helper/api_widgets/api_loader.dart';
import 'package:dycca_partner/api_helper/get_response/get_data.dart';
import 'package:dycca_partner/api_helper/send_reponse/send_reponse.dart';
import 'package:dycca_partner/modal_class/partner_sponser_judges.dart';
import 'package:dycca_partner/modal_class/round_details_modelclass.dart';
import 'package:dycca_partner/utils/bloc_base.dart';

class ManegeAuditionRoundDetailsBloc extends BlocBase {
  final StreamController<Data> _judgesSponserPartnerListController = StreamController.broadcast();

  StreamSink<Data> get _judgesSponserPartnerListSink =>
      _judgesSponserPartnerListController.sink;
  Stream<Data> get judgesSponserPartnerListStream =>
      _judgesSponserPartnerListController.stream;

  getAudition(context) {
    SendData().ManageAuditionRoundDetails(onSuccess: (data) {
      _judgesSponserPartnerListSink.add(data);


    }, onError: (data) {
      DialogHelper.showErroDialog(description: data);
    });
  }

  @override
  dispose() {
    // TODO: implement
    _judgesSponserPartnerListSink.close();
  }
}
