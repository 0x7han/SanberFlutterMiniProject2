import 'package:flutter/material.dart';
import 'package:sanber_flutter_mini_project_2/model/cart.dart';
import 'package:sanber_flutter_mini_project_2/model/product.dart';
import 'package:sanber_flutter_mini_project_2/repositories/product_repository.dart';

class CartScreen extends StatelessWidget {
  final Cart cart;
  const CartScreen({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    ColorScheme colorScheme = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Cart'),
      ),
      body: ListView.builder(
          itemCount: cart.products.length,
          itemBuilder: (_, index) {
            return FutureBuilder(
                future: ProductRepository()
                    .getById(cart.products[index]['productId']),
                builder: (_, snapshot) {
                  final Product? product = snapshot.data;
                  if(snapshot.hasData) {
                    return Container(
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                    margin: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: colorScheme.primaryContainer.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 100,
                          width: 120,
                          child: Image.network(product!.image,fit: BoxFit.fitHeight,),),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(product.title, style: textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w400), maxLines: 1, overflow: TextOverflow.ellipsis,),
                              Text('\$ ${product.price}', style: textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w500),),
                                Text('qty : ${cart.products[index]['quantity']}'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                  } else {return const SizedBox();}
                });
          }),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.shopping_cart_checkout),
                label: const Text('Checkout')),
          ],
        ),
      ),
    );
  }
}
