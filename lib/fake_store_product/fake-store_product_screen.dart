import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_api_app/fake_store_product/fake_store_product_bloc.dart';
import 'package:login_api_app/fake_store_product/fake_store_product_state.dart';
import 'package:login_api_app/fake_store_product/widget/fake_store_product_model.dart';

class FakeStoreProductScreen extends StatelessWidget {
  const FakeStoreProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FakeStoreProductBloc(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Fake Store Products'),
        ),
        body: BlocBuilder<FakeStoreProductBloc, FakeStoreProductState>(
          builder: (context, state) {
            if (state.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.errorMessage != null &&
                state.errorMessage!.isNotEmpty) {
              return Center(
                child: Text(
                  state.errorMessage!,
                  style: const TextStyle(
                    color: Colors.red,
                  ),
                ),
              );
            } else if (state.fakeStoreProductModel.isNotEmpty) {
              return ListView.builder(
                itemCount: state.fakeStoreProductModel.length,
                itemBuilder: (context, index) {
                  FakeStoreProductModel product =
                      state.fakeStoreProductModel[index];
                  return ListTile(
                    leading: Image.network(product.image),
                    title: Text(product.title),
                    subtitle: Text('${product.price.toStringAsFixed(2)} \$'),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            'Rating: ${product.rating.rate} (${product.rating.count} reviews)'),
                      ],
                    ),
                  );
                },
              );
            } else {
              return const Center(child: Text('No products available.'));
            }
          },
        ),
      ),
    );
  }
}
