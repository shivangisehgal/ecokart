import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/services/formatter.dart';
import '/models/product.dart';
import '/utils/app_theme.dart';
import '/logic/cart_cubit.dart';
import '/logic/cart_state.dart';
import '/widgets/primary_button.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductModel productModel;
  const ProductDetailsScreen({super.key, required this.productModel});

  static const routeName = "product_details";

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.productModel.title}"),
      ),
      body: SafeArea(
        child: ListView(
          children: [

            SizedBox(
              height: MediaQuery.of(context).size.width,
              child: CarouselSlider.builder(
                itemCount: widget.productModel.title?.length ?? 0,
                slideBuilder: (index) {

                  //String url = widget.productModel.images![index];

                  return CachedNetworkImage(
                    imageUrl: "https://content.jdmagicbox.com/comp/coimbatore/w9/0422px422.x422.230416193657.w1w9/catalogue/unique-pet-peelamedu-coimbatore-pet-juice-bottle-wholesalers-zkxhv28xad.jpg",
                  );

                },
              ),
            ),

            SizedBox(
              height: 20,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${widget.productModel.title}", style: TextStyles.heading3,),
                  Text(Formatter.formatPrice(widget.productModel.price!), style: TextStyles.heading2,),

                  SizedBox(
                    height: 30,
                  ),

                  BlocBuilder<CartCubit, CartState>(
                      builder: (context, state) {
                        bool isInCart = BlocProvider.of<CartCubit>(context).cartContains(widget.productModel);

                        return PrimaryButton(
                            onPressed: () {
                              if(isInCart) {
                                return;
                              }

                              BlocProvider.of<CartCubit>(context).addToCart(widget.productModel, 1);
                            },
                            color: (isInCart) ? AppColors.grey : AppColors.darkGreen,
                            text: (isInCart) ? "Product added to cart" : "Add to Cart"
                        );
                      }
                  ),

                  SizedBox(
                      height: 30
                  ),

                  Text("Description", style: TextStyles.body2.copyWith(fontWeight: FontWeight.bold),),
                  Text("${widget.productModel.description}", style: TextStyles.body1,),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
