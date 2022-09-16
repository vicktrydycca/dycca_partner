import 'dart:async';

import 'package:dycca_partner/api_helper/api_widgets/api_loader.dart';
import 'package:dycca_partner/api_helper/get_response/get_data.dart';
import 'package:dycca_partner/modal_class/partner_sponser_judges.dart';
import 'package:dycca_partner/utils/bloc_base.dart';

class Judges_Sponsers_Partner_Bloc extends BlocBase{

  final StreamController<List<Judge>> _judgesSponserPartnerListController = StreamController.broadcast();


  StreamSink<List<Judge>> get _judgesSponserPartnerListSink  => _judgesSponserPartnerListController.sink;
  Stream<List<Judge>> get judgesSponserPartnerListStream  => _judgesSponserPartnerListController.stream;


  getJudgesList(){

    GetData().get_Judges_Api(onSuccess: (data){
      _judgesSponserPartnerListSink.add(data);
    }, onError: (data){
      DialogHelper.showErroDialog(description:data);


    });
  }
  getVenusPartnerList(){

    GetData().get_VenusPartner_Api(onSuccess: (data){
      _judgesSponserPartnerListSink.add(data);
    }, onError: (data){
      DialogHelper.showErroDialog(description:data);


    });
  }
  getSponsorsList(){

    GetData().get_Sponsers_Api(onSuccess: (data){
      _judgesSponserPartnerListSink.add(data);
    }, onError: (data){
      DialogHelper.showErroDialog(description:data);


    });
  }

  @override
  dispose() {
    // TODO: implement
    _judgesSponserPartnerListSink.close();
  }
}