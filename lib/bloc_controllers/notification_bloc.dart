import 'dart:async';

import 'package:dycca_partner/api_helper/api_widgets/api_loader.dart';
import 'package:dycca_partner/api_helper/get_response/get_data.dart';
import 'package:dycca_partner/modal_class/notification_modalclass.dart';
import 'package:dycca_partner/utils/bloc_base.dart';

class NoticationBloc extends BlocBase{


  final StreamController<List<NotificationList>> _notificationListController = StreamController.broadcast();


  StreamSink<List<NotificationList>> get _notificationListSink  => _notificationListController.sink;
  Stream<List<NotificationList>> get notificationListStream  => _notificationListController.stream;


  getNotificationList(){

    GetData().getNotificationApi(onSuccess: (data){
      _notificationListSink.add(data);
    }, onError: (data){
      DialogHelper.showErroDialog(description:data);


    });
  }


  @override
  dispose() {
    // TODO: implement dispose
    _notificationListSink.close();
    // throw UnimplementedError();
  }


}