import 'package:flutter/material.dart';
import 'package:learning_flutter/theme/color.dart';
import 'package:learning_flutter/united_pharmacy/model/response/home/HomePageFirstResponse.dart';
import 'package:learning_flutter/united_pharmacy/model/response/home/HomePageSecondResponse.dart';

class BestSellingProductsList extends StatefulWidget {
  const BestSellingProductsList({super.key});

  @override
  State<BestSellingProductsList> createState() => _BestSellingProductsListState();
}

class _BestSellingProductsListState extends State<BestSellingProductsList> {
  List<ProductList> mList = <ProductList>[
    ProductList(
        templateBaseurl: "",
        isOfferApplicable: false,
        shippingType: 2,
        shippingTypeImg:
            "https://unitedpharmacy.sa/media/shipping_types/image/default/express_3_1.webp",
        configurableData: {},
        typeId: "simple",
        entityId: "1004",
        isAvailable: true,
        price: 389.85,
        finalPrice: 389.85,
        formattedPrice: "SAR 389.85",
        formattedFinalPrice: "SAR 389.85",
        name: "Foltene Hair Ampoule For Men",
        hasRequiredOptions: false,
        thumbNail:
            "https://unitedpharmacy.sa/media/catalog/product/cache/5014d7217d112efc83310fc026a13fef/a/p/ap-ci-051.png",
        dominantColor: "",
        isNew: false,
        isInRange: false,
        isInWishlist: false,
        wishlistItemId: 0,
        productUrl:
            "https://unitedpharmacy.sa/en/foltene-hair-ampoule-for-men.html",
        brand: "Default",
        sku: "AP-CI-051",
        categories: [
          "فولتين",
          "فولتين للعناية بالشعر",
          "تساقط الشعر",
          "معالجة الشعر",
          " العناية بالشعر",
          "احصل علي خصم اضافي 15%"
        ],
        rating: 5,
        tierPrice: "",
        formattedTierPrice: "",
        availability: "In stock"),
    ProductList(
        templateBaseurl: "",
        isOfferApplicable: false,
        shippingType: 2,
        shippingTypeImg:
            "https://unitedpharmacy.sa/media/shipping_types/image/default/express_3_1.webp",
        configurableData: {},
        typeId: "simple",
        entityId: "1004",
        isAvailable: true,
        price: 389.85,
        finalPrice: 389.85,
        formattedPrice: "SAR 389.85",
        formattedFinalPrice: "SAR 389.85",
        name: "Foltene Hair Ampoule For Men",
        hasRequiredOptions: false,
        thumbNail:
            "https://unitedpharmacy.sa/media/catalog/product/cache/5014d7217d112efc83310fc026a13fef/a/p/ap-ci-051.png",
        dominantColor: "",
        isNew: false,
        isInRange: false,
        isInWishlist: false,
        wishlistItemId: 0,
        productUrl:
            "https://unitedpharmacy.sa/en/foltene-hair-ampoule-for-men.html",
        brand: "Default",
        sku: "AP-CI-051",
        categories: [
          "فولتين",
          "فولتين للعناية بالشعر",
          "تساقط الشعر",
          "معالجة الشعر",
          " العناية بالشعر",
          "احصل علي خصم اضافي 15%"
        ],
        rating: 5,
        tierPrice: "",
        formattedTierPrice: "",
        availability: "In stock"),
    ProductList(
        templateBaseurl: "",
        isOfferApplicable: false,
        shippingType: 2,
        shippingTypeImg:
            "https://unitedpharmacy.sa/media/shipping_types/image/default/express_3_1.webp",
        configurableData: {},
        typeId: "simple",
        entityId: "1004",
        isAvailable: true,
        price: 389.85,
        finalPrice: 389.85,
        formattedPrice: "SAR 389.85",
        formattedFinalPrice: "SAR 389.85",
        name: "Foltene Hair Ampoule For Men",
        hasRequiredOptions: false,
        thumbNail:
            "https://unitedpharmacy.sa/media/catalog/product/cache/5014d7217d112efc83310fc026a13fef/a/p/ap-ci-051.png",
        dominantColor: "",
        isNew: false,
        isInRange: false,
        isInWishlist: false,
        wishlistItemId: 0,
        productUrl:
            "https://unitedpharmacy.sa/en/foltene-hair-ampoule-for-men.html",
        brand: "Default",
        sku: "AP-CI-051",
        categories: [
          "فولتين",
          "فولتين للعناية بالشعر",
          "تساقط الشعر",
          "معالجة الشعر",
          " العناية بالشعر",
          "احصل علي خصم اضافي 15%"
        ],
        rating: 5,
        tierPrice: "",
        formattedTierPrice: "",
        availability: "In stock"),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(width: 8);
        },
        itemCount: mList.length, // Number of items in your list
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          var model = mList[index];

          return DiscountBannerItem(
            model: model,
          );
        },
      ),
    );
  }
}

class DiscountBannerItem extends StatelessWidget {
  const DiscountBannerItem({super.key, required this.model});

  final ProductList model;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          width: 180,
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Free Shipping + Heart Icons Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 5, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      'FREE SHIPPING',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 10),
                    ),
                  ),
                  Icon(
                    Icons.favorite_border,
                    color: Colors.grey,
                  )
                ],
              ),
              SizedBox(height: 5),
              // Product Image
              Image.network(
                'https://via.placeholder.com/100', // Replace with the product image URL
                height: 100,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10),
              // Online Exclusive Tag
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  'ONLINE EXCLUSIVE 20% OFF',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 10),
                ),
              ),
              SizedBox(height: 5),
              // Rating
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 15,
                  ),
                  Text(
                    '4.5',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              // Pricing
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '999.99 SAR  ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        fontSize: 16,
                      ),
                    ),
                    TextSpan(
                      text: '799.00 SAR',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              // Product Description
              Text(
                'Aloedent Toothpaste Sensitive Aloevera 50',
                style: TextStyle(fontSize: 12),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 10),
              // Add to Cart Button
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: Icon(Icons.shopping_cart),
                  color: Colors.blue,
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
