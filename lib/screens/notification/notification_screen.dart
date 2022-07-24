import 'package:dycca_partner/bloc_controllers/notification_bloc.dart';
import 'package:dycca_partner/custom_widget/stream_loader.dart';
import 'package:dycca_partner/modal_class/notification_modalclass.dart';
import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final notificationController = NoticationBloc();
  @override
  void initState() {
    // TODO: implement initState
    notificationController.getNotificationList();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    notificationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat.EEEE('en_US').format(now) +
        " " +
        DateFormat.yMMMMd('en_US').format(now);
    return Scaffold(
      backgroundColor: whiteColour,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: whiteColour,
        leading: const Icon(
          Icons.arrow_back_ios,
          color: neutral6Color,
        ),
        title: const Text("Notification", style: appbarConstFont),
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    Text(
                      formattedDate,
                      style: fontStyle(neutral6Color, FontWeight.w400, 16),
                    ),
                    const Spacer(),
                    Text(
                      " Clear All",
                      style: fontStyle(primaryColor, FontWeight.w400, 13),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              StreamBuilder<List<NotificationList>>(
                  stream: notificationController.notificationListStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Container(
                              color: neutral2Color,
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: ListTile(dense: true,
                                    contentPadding: EdgeInsets.all(1),
                                    leading: Image.asset(
                                      'assets/images/notification_image.png',
                                      scale: 2,
                                    ),
                                    title: Text(
                                      snapshot.data![index].description
                                          .toString(),
                                      style: fontStyle(
                                          neutral6Color, FontWeight.w400, 16),
                                    ),
                                    subtitle: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 20),
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              border: Border.all(
                                                  color: primaryColor)),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 7.0, horizontal: 30),
                                            child: Text(
                                              "View profile",
                                              style: fontStyle(primaryColor,
                                                  FontWeight.w400, 13),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    trailing: Text(
                                      snapshot.data![index].createdAt!
                                          .toString()
                                          .split(" ")
                                          .last
                                          .split(".")
                                          .first,
                                      style: fontStyle(
                                          neutral6Color, FontWeight.w500, 13),
                                    )),
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return streamLoader();
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
