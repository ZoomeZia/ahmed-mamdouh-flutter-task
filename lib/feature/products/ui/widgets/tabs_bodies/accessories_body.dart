import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tasks/feature/products/ui/widgets/card/product_card.dart';
import 'package:flutter_tasks/feature/products/logic/products_cubit/products_cubit.dart';

class AccessoriesBody extends StatelessWidget {
  const AccessoriesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProductsError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  state.message,
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    context.read<ProductsCubit>().loadAllProducts();
                  },
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        } else if (state is ProductsLoaded) {
          if (state.accessoriesProducts.isEmpty) {
            return const Center(
              child: Text(
                'No accessories products available',
                style: TextStyle(fontSize: 16),
              ),
            );
          }

          return GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.50,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: state.accessoriesProducts.length,
            itemBuilder: (context, index) {
              return ProductCard(product: state.accessoriesProducts[index]);
            },
          );
        }

        return const Center(
          child: Text(
            'No accessories products available',
            style: TextStyle(fontSize: 16),
          ),
        );
      },
    );
  }
}
