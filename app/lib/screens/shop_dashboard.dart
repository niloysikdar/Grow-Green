import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hack_project/constants/colors.dart';
import 'package:hack_project/models/shopmodel.dart';
import 'package:hack_project/widgets/shop_dashboard_banner.dart';
import 'package:hack_project/widgets/star_rating.dart';

class ShopDashboard extends StatefulWidget {
  @override
  _ShopDashboardState createState() => _ShopDashboardState();
}

class _ShopDashboardState extends State<ShopDashboard> {
  bool isFavourite = false;
  ShopModel shopModel;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            shopDashboardBanner(
              size: size,
              imagepath:
                  "https://lp-cms-production.imgix.net/2020-11/shutterstock_551163163%20A%20rural%20craftswoman%20paints%20on%20colorful%20handicraft%20items.jpg",
            ),
            SingleChildScrollView(
              child: Container(
                constraints: BoxConstraints(
                  minHeight: size.height - (size.height * 0.33),
                ),
                width: size.width,
                margin: EdgeInsets.only(
                  top: size.height * 0.29,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 30,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    titlePrice(context: context),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        customButton(
                          text: "Address",
                          iconData: Icons.location_on_rounded,
                        ),
                        SizedBox(width: 25),
                        customButton(
                          text: "Call",
                          iconData: Icons.call,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        customButton(
                          text: "Visit Website",
                          iconData: Icons.web,
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Text(
                      "Small pottery shop based out of Jaipur\nSpecialities: Printed pots, matkas.",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        customButton(text: "Pottery"),
                        SizedBox(width: 10),
                        customButton(text: "Rajasthani"),
                        SizedBox(width: 10),
                        customButton(text: "Homemade"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            favouriteButton(),
          ],
        ),
      ),
    );
  }

  Widget favouriteButton() {
    return Positioned(
      top: 15,
      right: 15,
      child: InkWell(
        onTap: () {
          setState(() {
            isFavourite = !isFavourite;
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Icon(
              Icons.favorite_rounded,
              size: 30,
              color: (isFavourite) ? lightgreen : Colors.grey,
            ),
          ),
        ),
      ),
    );
  }

  Widget customButton({
    @required String text,
    IconData iconData,
  }) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        decoration: BoxDecoration(
          color: lightgreen,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                text,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                softWrap: false,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            (iconData != null)
                ? Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Icon(
                      iconData,
                      color: Colors.white,
                    ),
                  )
                : Container(height: 0, width: 0),
          ],
        ),
      ),
    );
  }

  Widget titlePrice({@required BuildContext context}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Local Pottery shop",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18,
              ),
            ),
            ratingBar(
              context: context,
              initialRating: 4,
            ),
          ],
        ),
        Text(
          "₹ 40-80",
          style: GoogleFonts.dmSans(
            color: Colors.black45,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
