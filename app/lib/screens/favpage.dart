import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hack_project/models/shopmodel.dart';
import 'package:hack_project/screens/shop_dashboard.dart';

class FavShops extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Available Shops"),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("shops").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                ShopModel shopModel = ShopModel(
                  shopName: snapshot.data.docs[index]["shopName"],
                  address: snapshot.data.docs[index]["address"],
                  phoneNumber: snapshot.data.docs[index]["phoneNumber"],
                  priceRange: snapshot.data.docs[index]["priceRange"],
                  shopDescription: snapshot.data.docs[index]["shopDescription"],
                  shopImageUrls: snapshot.data.docs[index]["shopImageUrls"],
                  shopStars: snapshot.data.docs[index]["shopStars"].toDouble(),
                  shopWebsite: snapshot.data.docs[index]["shopWebsite"],
                  tags: snapshot.data.docs[index]["tags"],
                  lat: snapshot.data.docs[index]["lat"],
                  long: snapshot.data.docs[index]["long"],
                );
                return shopCard(
                  size: size,
                  shopModel: shopModel,
                  context: context,
                );
              },
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
    );
  }

  Widget shopCard({
    @required Size size,
    @required ShopModel shopModel,
    @required BuildContext context,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ShopDashboard(shopId: shopModel.shopName),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CachedNetworkImage(
                imageUrl: shopModel.shopImageUrls[0],
                height: size.height * 0.25,
                width: size.width,
                fit: BoxFit.cover,
                placeholder: (context, url) => Center(child: Text("Loading")),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Text(
              shopModel.shopName + "\n" + shopModel.address,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
