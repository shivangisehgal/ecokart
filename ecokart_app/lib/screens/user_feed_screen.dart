import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/logic/product_cubit.dart';
import '/logic/product_state.dart';
import '/widgets/product_list.dart';

class UserFeedScreeen extends StatefulWidget {
  const UserFeedScreeen({super.key});

  @override
  State<UserFeedScreeen> createState() => _UserFeedScreeenState();
}

class _UserFeedScreeenState extends State<UserFeedScreeen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {

          if(state is ProductLoadingState && state.products.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if(state is ProductErrorState && state.products.isEmpty) {
            return Center(
              child: Text(state.message),
            );
          }

          return ProductListView(products: state.products);
        }
    );
  }
}
