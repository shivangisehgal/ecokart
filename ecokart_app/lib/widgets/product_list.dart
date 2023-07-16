import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '/utils/app_theme.dart';
import '/models/product.dart';
import '/services/formatter.dart';
import '/screens/product_details_screen.dart';

class ProductListView extends StatelessWidget {
  final List<ProductModel> products;

  const ProductListView({
    super.key,
    required this.products
  });

  @override
  Widget build(BuildContext context) {
    print(products.length);
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {

        final product = products[index];

        return CupertinoButton(
          onPressed: () {
            Navigator.pushNamed(context, ProductDetailsScreen.routeName, arguments: product);
          },
          padding: EdgeInsets.zero,
          child: Row(
            children: [

              CachedNetworkImage(
                width: MediaQuery.of(context).size.width / 3,
                imageUrl: "https://content.jdmagicbox.com/comp/coimbatore/w9/0422px422.x422.230416193657.w1w9/catalogue/unique-pet-peelamedu-coimbatore-pet-juice-bottle-wholesalers-zkxhv28xad.jpg",
              ),

              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${product.title}", style: TextStyles.body1.copyWith(fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis,),
                    Text("${product.description}", style: TextStyles.body2, maxLines: 2, overflow: TextOverflow.ellipsis,),
                    SizedBox(
                      height: 10,
                    ),
                    Text(Formatter.formatPrice(product.price!), style: TextStyles.heading3,)
                  ],
                ),
              ),

            ],
          ),
        );

      },
    );
  }
}
