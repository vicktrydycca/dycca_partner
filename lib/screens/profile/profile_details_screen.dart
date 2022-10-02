import 'package:dycca_partner/custom_widget/button_widget.dart';
import 'package:dycca_partner/custom_widget/dropdown_widget.dart';
import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';

class ProfileDetailsScreen extends StatefulWidget {
  const ProfileDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ProfileDetailsScreen> createState() => _ProfileDetailsScreenState();
}

class _ProfileDetailsScreenState extends State<ProfileDetailsScreen> {
  String? currency;
  List<String> currencyList = ['INR','BTC'];
  TextEditingController price = TextEditingController();
  int index = 0;
  var pageViewController;
  List<String> images = ['assets/images/notification_image.png'];
  List<String> equipments = ['Music System','Mirror Wall','Wooden Floor'];
  List<String> rating = ['Accuracy','Communication','Cleanliness','Interior','Value'];
  var amenities = [

    {
      'icon': 'assets/images/air_conditioner.png',
      'name': "Air Conditioner",
      'path': ''
    },
    {
      'icon': 'assets/images/door.png',
      'name': "Trial Room",
      'path': ''
    },
    {
      'icon': 'assets/images/wifi.png',
      'name': "Free Wifi",
      'path': ''
    },
    {
      'icon': 'assets/images/parking.png',
      'name': "Parking Facility",
      'path': ''
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset('assets/images/profile_details.png'),
                  ),
                  Container(
                    height: 40,
                    color: Colors.transparent.withOpacity(0.1),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children:  [
                          InkWell(
                         onTap: (){
                           Navigator.pop(context);
                         },
                            child: const Icon(
                              Icons.arrow_back_ios,
                              color: whiteColour,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.share,
                            color: whiteColour,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 155,
                    bottom: 15,
                    child: Container(
                      height: 25,
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: primaryColor.withOpacity(1),
                            borderRadius: BorderRadius.circular(3.0),
                          ),
                          height: 25,
                          width: 100,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                "Dance Studio",
                                style: appFontStyle(
                                  color: Colors.white.withOpacity(0.9),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 80,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: neutral2Color.withOpacity(0.9),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 3.0,
                      ),
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Rockvick Studio",
                          style: fontStyle(neutral6Color, FontWeight.w500, 21),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: primaryColor,
                                size: 20,
                              ),
                              Text(
                                " 4.5  ",
                                style: fontStyle(
                                    primaryColor, FontWeight.w500, 16),
                              ),
                              Text(
                                "|",
                                style: fontStyle(
                                    neutral4Color, FontWeight.w500, 16),
                              ),
                              Text(
                                " 36 Booking  ",
                                style: fontStyle(
                                    primaryColor, FontWeight.w200, 14),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 20.0, left: 20, right: 20, bottom: 10),
                child: Row(
                  children: [
                    const Icon(
                      Icons.access_time,
                      color: primaryColor,
                      size: 20,
                    ),
                    Text(
                      "   Opens",
                      style: fontStyle(neutral5Color, FontWeight.w500, 16),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Mon - Sat",
                            style:
                                fontStyle(neutral5Color, FontWeight.w500, 16),
                          ),
                          Text(
                            "9AM - 8 PM",
                            style:
                                fontStyle(neutral5Color, FontWeight.w500, 16),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "   |",
                      style: fontStyle(neutral5Color, FontWeight.w400, 30),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Mon - Sat",
                            style:
                                fontStyle(neutral5Color, FontWeight.w500, 16),
                          ),
                          Text(
                            "9AM - 8 PM",
                            style:
                                fontStyle(neutral5Color, FontWeight.w500, 16),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Image.asset('assets/images/location.png'),
                    Expanded(
                      flex: 5,
                      child: Text(
                        "    Plot No. 73, 2nd Floor UttamNagar",
                        style: fontStyle(neutral5Color, FontWeight.w500, 16),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          const Icon(
                            Icons.directions_sharp,
                            color: primaryColor,
                            size: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              "View on Map",
                              style:
                                  fontStyle(neutral5Color, FontWeight.w500, 14),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const Divider(
                thickness: 1,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 5.0, left: 20, right: 20, bottom: 10),
                child: Text(
                  "About Us",
                  style: fontStyle(neutral6Color, FontWeight.w500, 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: Text(
                  "You can contact us any way that is convenient for you . We are available 24/7 on WhatsApp, skype or E-mail. You can use a ...",
                  style: fontStyle(neutral8Color, FontWeight.w500, 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: Text(
                  "Read More",
                  style: fontStyle(primaryColor, FontWeight.w500, 14),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, left: 20, right: 20, bottom: 10),
                child: Row(
                  children: [
                    Text(
                      "Project Hosted    ",
                      style: fontStyle(neutral6Color, FontWeight.w500, 16),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: CircleAvatar(
                        radius: 4,
                        backgroundColor: neutral4Color,
                      ),
                    ),
                    const Icon(
                      Icons.star,
                      color: primaryColor,
                      size: 17,
                    ),
                    Text(
                      " 4.5",
                      style: fontStyle(neutral6Color, FontWeight.w500, 16),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: CircleAvatar(
                        radius: 4,
                        backgroundColor: neutral4Color,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                      child: Text(
                        "25 Times",
                        style: fontStyle(primaryColor, FontWeight.w500, 16),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, left: 20, right: 20, bottom: 5),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        "Dance Video",
                        style: fontStyle(neutral8Color, FontWeight.w500, 16),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                        child: ratingStars()),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          "10",
                          style: fontStyle(primaryColor, FontWeight.w500, 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        "Dance Video",
                        style: fontStyle(neutral8Color, FontWeight.w500, 16),
                      ),
                    ),
                    Expanded(
                        flex: 4,
                        child: ratingStars()),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          "10",
                          style: fontStyle(primaryColor, FontWeight.w500, 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        "Dance ",
                        style: fontStyle(neutral8Color, FontWeight.w500, 16),
                      ),
                    ),
                    Expanded(
                        flex: 4,
                        child: ratingStars()),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          "10",
                          style: fontStyle(primaryColor, FontWeight.w500, 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: Text(
                  "Show all Projects",
                  style: fontStyle(primaryColor, FontWeight.w500, 14),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 10.0, left: 20, right: 20, bottom: 10),
                child: Text(
                  "Charges",
                  style: fontStyle(neutral6Color, FontWeight.w500, 18),
                ),
              ),
      Padding(
        padding: const EdgeInsets.only(
            top: 5.0, left: 70, right: 30, bottom: 10),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                "Per Hour",
                style: fontStyle(neutral6Color, FontWeight.w500, 18),
              ),
            ),
             Expanded(
              flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(right: 30.0),
                  child: Column(
                    children: [
                      DropdownWidget(value: currency,dropdownList: currencyList,hintText: 'INR',),
                      Text(
                        "Currency",
                        style: fontStyle(neutral6Color, FontWeight.w500, 14),
                      ),
                    ],
                  ),

                )),

            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: price,
                    decoration:  InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 100),
                      hintText: '300',
                      hintStyle: fontStyle(neutral4Color, FontWeight.w400, 14)
                    ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 6.0),
                      child: Text(
                        "Price",
                        style: fontStyle(neutral6Color, FontWeight.w500, 14),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),

              Padding(
                padding: const EdgeInsets.only(
                    top: 5.0, left: 70, right: 30, bottom: 10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child:  Text(
                        "Per Day",
                        style: fontStyle(neutral6Color, FontWeight.w500, 18),
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 30.0),
                          child: Column(
                            children: [
                              DropdownWidget(value: currency,dropdownList: currencyList,hintText: 'INR',),
                              Text(
                                "Currency",
                                style: fontStyle(neutral6Color, FontWeight.w500, 14),
                              ),
                            ],
                          ),

                        )),

                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: price,
                              decoration:  InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 100),
                                  hintText: '300',
                                  hintStyle: fontStyle(neutral4Color, FontWeight.w400, 14)
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 6.0),
                              child: Text(
                                "Price",
                                style: fontStyle(neutral6Color, FontWeight.w500, 14),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 10.0, left: 20, right: 20, bottom: 10),
                child: Text(
                  "Amenities",
                  style: fontStyle(neutral6Color, FontWeight.w500, 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3/1
                  ),

                  itemCount: amenities.length,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(child: Image.asset(amenities[index]['icon'] ?? '',height: 30,)),

                        Expanded(
                          child: Text (
                            amenities[index]['name'] ?? '',
                            style: fontStyle(neutral6Color, FontWeight.w500, 16),
                          ),
                        ),

                      ],
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: Text(
                  "Show all Amenities",
                  style: fontStyle(primaryColor, FontWeight.w500, 14),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 10.0, left: 20, right: 20, bottom: 10),
                child: Text(
                  "Equipments",
                  style: fontStyle(neutral6Color, FontWeight.w500, 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 4/1
                  ),

                  itemCount: equipments.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        CircleAvatar(
                          radius: 5,
                          backgroundColor: semantic1Color.withOpacity(0.6),
                        ),
                        const SizedBox(width: 15,),
                        Text(
                          equipments[index],
                          style: fontStyle(neutral6Color, FontWeight.w500, 18),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: Text(
                  "Show all Euipments",
                  style: fontStyle(primaryColor, FontWeight.w500, 14),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 10.0, left: 20, right: 20, bottom: 10),
                child: Text(
                  "Studio Rules",
                  style: fontStyle(neutral6Color, FontWeight.w500, 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 10/1
                  ),

                  itemCount: equipments.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        CircleAvatar(
                          radius: 5,
                          backgroundColor: semantic1Color.withOpacity(0.6),
                        ),
                        const SizedBox(width: 15,),
                        Text(
                          "No Smoking",
                          style: fontStyle(neutral6Color, FontWeight.w500, 18),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 10.0, left: 20, right: 20, bottom: 10),
                child: Text(
                  "Ratings",
                  style: fontStyle(neutral6Color, FontWeight.w500, 18),
                ),
              ),
             ListView.builder(
               itemCount: 5,
               physics: const NeverScrollableScrollPhysics(),
               shrinkWrap: true,
               itemBuilder: (context, index) {
               return  Padding(
                 padding: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
                 child: Row(
                   children: [
                     Expanded(
                       flex: 2,
                       child: Text(
                         rating[index],
                         style: fontStyle(neutral8Color, FontWeight.w500, 16),
                       ),
                     ),
                     Expanded(
                         flex: 4,
                         child: ratingStars()),

                   ],
                 ),
               );
             },),
              Padding(
                padding: const EdgeInsets.only(
                    top: 10.0, left: 20, right: 20, bottom: 10),
                child: Text(
                  "Reviews",
                  style: fontStyle(neutral6Color, FontWeight.w500, 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 10.0, left: 20, right: 20, bottom: 10),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.blue,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Olivia",
                            style: fontStyle(neutral6Color, FontWeight.w500, 16),
                          ),
                          Text(
                            "Dec,2019",
                            style: fontStyle(neutral6Color, FontWeight.w500, 14),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                     left: 20, right: 20, bottom: 10),
                child: Text(
                  "You can contact us any way that is convenient for you . We are available 24/7 on WhatsApp, skype or E-mail. You can use a",
                  style: fontStyle(neutral4Color, FontWeight.w500, 15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: Text(
                  "Read More",
                  style: fontStyle(primaryColor, FontWeight.w500, 14),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 30),
                child: ButtonWidget(placeholder: 'Save', disabled: false, buttonClickCallback: (){}),
              )
            ],
          ),
        ),
      ),
    );
  }
Widget charges(){
    return Padding(
      padding: const EdgeInsets.only(
          top: 5.0, left: 30, right: 30, bottom: 10),
      child: Row(
        children: [
          Text(
            "Per Hour",
            style: fontStyle(neutral6Color, FontWeight.w500, 18),
          ),
          const SizedBox(width: 30,),
          const Icon(Icons.currency_rupee,size: 14,color: primaryColor,),
          Text(
            "500",
            style: fontStyle(primaryColor, FontWeight.w500, 14),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Text(
              "|",
              style: fontStyle(neutral4Color, FontWeight.w500, 16),
            ),
          ),
          Text(
            "Per Day",
            style: fontStyle(neutral6Color, FontWeight.w500, 18),
          ),
          const SizedBox(width: 30,),
          const Icon(Icons.currency_rupee,size: 14,color: primaryColor,),
          Text(
            "5000",
            style: fontStyle(primaryColor, FontWeight.w500, 14),
          ),
        ],
      ),
    );
}
  Widget ratingStars() {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Icon(
            Icons.star,
            color: primaryColor,
            size: 17,
          ),
        ),
        const Icon(
          Icons.star,
          color: primaryColor,
          size: 17,
        ),
        const Icon(
          Icons.star,
          color: primaryColor,
          size: 17,
        ),
        const Icon(
          Icons.star,
          color: primaryColor,
          size: 17,
        ),
        const Icon(
          Icons.star,
          color: primaryColor,
          size: 17,
        ),
        Text(
          " 4.5",
          style: fontStyle(neutral8Color, FontWeight.w400, 16),
        ),
      ],
    );
  }
}
// AnimatedSmoothIndicator(
//   activeIndex: index,
//   count: images.length,
//   effect: ExpandingDotsEffect(
//     radius: 30,
//     dotWidth: 10,
//     dotHeight: 10,
//     activeDotColor: Colors.green,
//     expansionFactor: 4,
//     dotColor: Colors.green.withOpacity(0.17),
//   ), // your preferred effect
//   onDotClicked: (index) {
//     pageViewController.animateToPage(
//       index,
//       duration: const Duration(milliseconds: 500),
//       curve: Curves.ease,
//     );
//   },
// )
