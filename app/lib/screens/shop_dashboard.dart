import 'package:flutter/material.dart';
import 'package:hack_project/widgets/shop_dashboard_banner.dart';

class ShopDashboard extends StatelessWidget {
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
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            Text("Local Pottery shop"),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
