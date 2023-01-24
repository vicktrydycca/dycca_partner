import 'dart:async';

import 'package:dycca_partner/api_helper/api_widgets/api_loader.dart';
import 'package:dycca_partner/api_helper/send_reponse/send_reponse.dart';
import 'package:dycca_partner/modal_class/event_list_roundwise_model.dart';
import 'package:dycca_partner/utils/bloc_base.dart';


class ViewParticipantListBloc extends BlocBase{

  final StreamController<EventListRoundwiseModelclass> _EventListController = StreamController.broadcast();


  StreamSink<EventListRoundwiseModelclass> get _EventListSink  => _EventListController.sink;
  Stream<EventListRoundwiseModelclass> get EventListStream  => _EventListController.stream;


  getEventCategoryList({roundID}){

    SendData().viewParticipantList(roundID: roundID,onSuccess: (data){
      _EventListSink.add(data);
    }, onError: (data){
      DialogHelper.showErroDialog(description:data);
    });
  }


  @override
  dispose() {
    // TODO: implement
    _EventListSink.close();
  }
}