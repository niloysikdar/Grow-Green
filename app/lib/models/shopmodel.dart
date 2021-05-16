class ShopModel {
  final String shopName;
  final String address;
  final String phoneNumber;
  final String priceRange;
  final String shopDescription;
  final List shopImageUrls;
  final double shopStars;
  final String shopWebsite;
  final List tags;
  final String lat;
  final String long;

  ShopModel({
    this.shopName,
    this.address,
    this.phoneNumber,
    this.priceRange,
    this.shopDescription,
    this.shopImageUrls,
    this.shopStars,
    this.shopWebsite,
    this.tags,
    this.lat,
    this.long,
  });

  Map<String, dynamic> toMap() {
    return {
      "shopName": shopName,
      "address": address,
      "phoneNumber": phoneNumber,
      "priceRange": priceRange,
      "shopDescription": shopDescription,
      "shopImageUrls": shopImageUrls,
      "shopStars": shopStars,
      "shopWebsite": shopWebsite,
      "tags": tags,
      "lat": lat,
      "long": long,
    };
  }
}
