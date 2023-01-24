import 'dart:async';

import 'package:dycca_partner/api_helper/api_widgets/api_loader.dart';
import 'package:dycca_partner/api_helper/get_response/get_data.dart';
import 'package:dycca_partner/api_helper/send_reponse/send_reponse.dart';
import 'package:dycca_partner/modal_class/workflow_assignlist_modelclass.dart';
import 'package:dycca_partner/modal_class/workflow_modelclass.dart';
import 'package:flutter/cupertino.dart';

class ManageAuditionWorkFlowBloc{
  final StreamController<List<Workflow>> _EventTypeListController = StreamController.broadcast();
  final StreamController<List<String>> _judgesListController = StreamController.broadcast();
  final StreamController<List<Assignworkflow>?> customiseListStream = StreamController.broadcast();


  List<String> auditionList = [];
  StreamSink<List<Assignworkflow>?> get auditionCustomiseList  => customiseListStream.sink;
  List<String> auditionIDList = [];

  StreamSink<List<Workflow>> get _EventTypeListSink  => _EventTypeListController.sink;
  Stream<List<Workflow>> get EventTypeListStream  => _EventTypeListController.stream;
  Stream<List<String>> get judgesList  => _judgesListController.stream;
  StreamSink<List<String>> get judgesListSink  => _judgesListController.sink;
  getEventCategoryList(){

    GetData().getManageAuditionHomepage(onSuccess: (data){
      _EventTypeListSink.add(data);
    }, onError: (data){
      DialogHelper.showErroDialog(description:data);


    });
  }

 Future<void> getManageAuditionList({required roundId}) async{
    debugPrint("This is round ID $roundId");

    await SendData().eventDetailsView(roundId: roundId,onSuccess: (data){

      // _EventTypeListSink.add(data);
      // auditionCustomiseList.add(data);
    },workFlowTitle: (data){

      debugPrint("This is round ID $data");

      auditionList.add(data);
    },
        workFlowID: (data){

          debugPrint("This is round ID $data");

          auditionIDList.add(data.toString());
        },

        onError: (data){
      DialogHelper.showErroDialog(description:data);


    });
  }

  @override
  dispose() {
    // TODO: implement
    _EventTypeListSink.close();
  }
}