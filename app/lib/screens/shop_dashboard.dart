import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hack_project/constants/colors.dart';
import 'package:hack_project/models/shopmodel.dart';
import 'package:hack_project/widgets/shop_dashboard_banner.dart';
import 'package:hack_project/widgets/star_rating.dart';
import 'package:url_launcher/url_launcher.dart';

class ShopDashboard extends StatefulWidget {
  final String shopId;
  ShopDashboard({@required this.shopId});
  @override
  _ShopDashboardState createState() => _ShopDashboardState();
}

class _ShopDashboardState extends State<ShopDashboard> {
  bool isFavourite = false;

  Future<void> launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        enableJavaScript: true,
      );
    } else {
      print("Can't launch $url");
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("shops")
              .doc(widget.shopId)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasData) {
              final DocumentSnapshot ds = snapshot.data;
              final Map<String, dynamic> map = ds.data();
              ShopModel shopModel = ShopModel(
                shopName: map["shopName"],
                address: map["address"],
                phoneNumber: map["phoneNumber"],
                priceRange: map["priceRange"],
                shopDescription: map["shopDescription"],
                shopImageUrls: map["shopImageUrls"],
                shopStars: map["shopStars"].toDouble(),
                shopWebsite: map["shopWebsite"],
                tags: map["tags"],
                lat: map["lat"],
                long: map["long"],
              );
              return bodyWidget(
                size: size,
                shopModel: shopModel,
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Error"),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  Widget bodyWidget({
    @required Size size,
    @required ShopModel shopModel,
  }) {
    return Stack(
      children: [
        shopDashboardBanner(
          size: size,
          imagepath: shopModel.shopImageUrls[0],
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
                titlePrice(
                  context: context,
                  title: shopModel.shopName,
                  priceRange: shopModel.priceRange,
                  initialRating: shopModel.shopStars,
                ),
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
                GestureDetector(
                  onTap: () {
                    launchUrl(
                        "https://unsplash.com/s/photos/indian-handicrafts");
                  },
                  child: Row(
                    children: [
                      customButton(
                        text: "Visit Website",
                        iconData: Icons.web,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  shopModel.shopDescription,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 17,
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    customButton(text: shopModel.tags[0]),
                    SizedBox(width: 10),
                    customButton(text: shopModel.tags[1]),
                    SizedBox(width: 10),
                    customButton(text: shopModel.tags[2]),
                  ],
                ),
              ],
            ),
          ),
        ),
        favouriteButton(),
      ],
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

  Widget titlePrice({
    @required BuildContext context,
    @required String title,
    @required String priceRange,
    @required double initialRating,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18,
              ),
            ),
            ratingBar(
              context: context,
              initialRating: initialRating,
            ),
          ],
        ),
        Text(
          "₹ $priceRange",
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
