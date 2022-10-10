import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';

class FeedEventsTabScreen extends StatefulWidget {
  const FeedEventsTabScreen({Key? key}) : super(key: key);

  @override
  State<FeedEventsTabScreen> createState() => _FeedEventsTabScreenState();
}

class _FeedEventsTabScreenState extends State<FeedEventsTabScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        itemCount: 5,
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal:5,vertical: 5),
          child: Column(
            children: [

              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/feedBookingDetailRoutes');
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/profile.jpg",height: 50,),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Text(
                              "Alexa",
                              style: fontStyle(neutral6Color, FontWeight.w500, 18),
                            ),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(Icons.inventory_2,size: 15,color: primaryColor,),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0,top: 2),
                                child: Text(
                                  "Product",
                                  style: fontStyle(neutral6Color, FontWeight.w400, 14),
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Expanded(
                                flex: 1,
                                child: Icon(Icons.calendar_month,size: 20,color: primaryColor,)),
                            Expanded(
                              flex: 2,
                              child: Text(
                                "Date",
                                style: fontStyle(neutral6Color, FontWeight.w500, 14),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Text(
                                "22 FEB 2020",
                                style: fontStyle(neutral5Color, FontWeight.w400, 14),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Row(
                            children: [
                              const Expanded(
                                  flex: 1,
                                  child: Icon(Icons.event_available,size: 20,color: primaryColor,)),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  "Event name",
                                  style: fontStyle(neutral6Color, FontWeight.w500, 14),
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: Text(
                                  "Dance dilse 2021",
                                  style: fontStyle(neutral5Color, FontWeight.w400, 14),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Row(
                            children: [
                              const Expanded(
                                  flex: 1,
                                  child: Icon(Icons.article,size: 20,color: primaryColor,)),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  "Event type",
                                  style: fontStyle(neutral6Color, FontWeight.w500, 14),
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: Text(
                                  "competiton, dance battle",
                                  style: fontStyle(neutral5Color, FontWeight.w400, 14),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            const Expanded(
                                flex: 1,
                                child: Icon(Icons.attach_money,size: 20,color: primaryColor,)),
                            Expanded(
                              flex: 2,
                              child: Text(
                                "Paid",
                                style: fontStyle(neutral6Color, FontWeight.w500, 14),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Text(
                                "INR 500",
                                style: fontStyle(neutral5Color, FontWeight.w400, 14),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 7,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: const Divider(thickness: 1,),
              )
            ],
          ),
        );
      },),
    );
  }
}
