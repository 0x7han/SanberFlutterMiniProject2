import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanber_flutter_mini_project_2/bloc/cart/cart_bloc.dart';
import 'package:sanber_flutter_mini_project_2/bloc/product/product_bloc.dart';
import 'package:sanber_flutter_mini_project_2/bloc/user/user_bloc.dart';
import 'package:sanber_flutter_mini_project_2/helper/notification_helper.dart';
import 'package:sanber_flutter_mini_project_2/model/product.dart';
import 'package:sanber_flutter_mini_project_2/model/user.dart';
import 'package:sanber_flutter_mini_project_2/view/screens/cart_screen.dart';
import 'package:sanber_flutter_mini_project_2/view/screens/products/product_detail_screen.dart';
import 'package:sanber_flutter_mini_project_2/view/screens/profile_screen.dart';
import 'package:sanber_flutter_mini_project_2/view/widgets/custom_text_field_widget.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  Widget buildCategory(BuildContext context, String value,
      List<Product> allProducts, List<Product> filteredProducts) {
    Size size = MediaQuery.of(context).size;

    ColorScheme colorScheme = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'By category',
                style: textTheme.titleLarge,
              ),
              Container(
                padding: const EdgeInsets.only(left: 16, right: 8),
                margin: const EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: colorScheme.surfaceVariant,
                    ),
                    borderRadius: BorderRadius.circular(32)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: value,
                    elevation: 1,
                    style: textTheme.labelLarge!.copyWith(
                        color: colorScheme.onSurface.withOpacity(0.6)),
                    borderRadius: BorderRadius.circular(16),
                    alignment: Alignment.centerLeft,
                    onChanged: (String? value) {
                      if (value != null) {
                        context
                            .read<ProductBloc>()
                            .add(LoadProductByCategory(value));
                      }
                    },
                    items: allProducts
                        .map((product) => product.category)
                        .toSet()
                        .map((category) {
                      return DropdownMenuItem<String>(
                        value: category,
                        child: Text(category),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          height: size.height / 8,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: filteredProducts.length,
            itemBuilder: (_, index) {
              return GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ProductDetailScreen(
                            product: filteredProducts[index]))),
                child: Container(
                  alignment: Alignment.center,
                  width: 300,
                  height: 50,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceVariant.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: SizedBox(
                        width: 64,
                        child: Image.network(
                          filteredProducts[index].image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        filteredProducts[index].title,
                        style: textTheme.titleMedium!.copyWith(
                            color: colorScheme.onSurface.withOpacity(0.7)),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '\$ ${filteredProducts[index].price}',
                            style: textTheme.titleMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star_rounded,
                                color: Colors.amber,
                              ),
                              Text(
                                filteredProducts[index]
                                    .rating['rate']
                                    .toString(),
                                style: textTheme.labelMedium!.copyWith(
                                    color:
                                        colorScheme.onSurface.withOpacity(0.5)),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                child: Icon(
                                  Icons.brightness_1,
                                  size: 4,
                                  color: colorScheme.onSurface.withOpacity(0.5),
                                ),
                              ),
                              Text(
                                '${filteredProducts[index].rating['count'].toString()} sold',
                                style: textTheme.labelMedium!.copyWith(
                                    color:
                                        colorScheme.onSurface.withOpacity(0.5)),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget buildProducts(BuildContext context, List<Product> products,
      {String? value}) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 32, bottom: 16),
                child: Text(
                  'All products',
                  style: textTheme.titleLarge,
                )),
            Container(
              padding: const EdgeInsets.only(left: 16, right: 8),
              margin: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: colorScheme.surfaceVariant,
                  ),
                  borderRadius: BorderRadius.circular(32)),
              child: value != null
                  ? DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                          value: value,
                          elevation: 1,
                          style: textTheme.labelLarge!.copyWith(
                              color: colorScheme.onSurface.withOpacity(0.6)),
                          borderRadius: BorderRadius.circular(16),
                          alignment: Alignment.centerLeft,
                          onChanged: (String? value) {
                            if (value != null) {
                              context
                                  .read<ProductBloc>()
                                  .add(LoadProductsBySort(value));
                            }
                          },
                          items: <String>[
                            'name',
                            'price',
                            'sold',
                            'rating',
                          ].map((sort) {
                            return DropdownMenuItem<String>(
                              value: sort,
                              child: Text(sort),
                            );
                          }).toList()),
                    )
                  : const SizedBox(),
            ),
          ],
        ),
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: products.length,
            itemBuilder: (_, index) {
              return GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) =>
                            ProductDetailScreen(product: products[index]))),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: SizedBox(
                        width: 100,
                        child: Image.network(
                          products[index].image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            products[index].category,
                            style: textTheme.labelMedium!.copyWith(
                                color: colorScheme.onSurface.withOpacity(0.5)),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            products[index].title,
                            style: textTheme.titleMedium!.copyWith(
                                color: colorScheme.onSurface.withOpacity(0.7)),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      subtitle: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '\$ ${products[index].price}',
                            style: textTheme.titleMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star_rounded,
                                color: Colors.amber,
                              ),
                              Text(
                                products[index].rating['rate'].toString(),
                                style: textTheme.labelMedium!.copyWith(
                                    color:
                                        colorScheme.onSurface.withOpacity(0.5)),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                child: Icon(
                                  Icons.brightness_1,
                                  size: 4,
                                  color: colorScheme.onSurface.withOpacity(0.5),
                                ),
                              ),
                              Text(
                                '${products[index].rating['count'].toString()} sold',
                                style: textTheme.labelMedium!.copyWith(
                                    color:
                                        colorScheme.onSurface.withOpacity(0.5)),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
      ],
    );
  }

  Future<void> sendLocalNotification() async {
    NotificationHelper.payload.value = '';

    await NotificationHelper.flutterLocalNotificationsPlugin.show(
        1,
        "Rpedia",
        "Halo Raihan, ada barang rekomend nihh.. Buruan checkout",
        NotificationHelper.notificationDetails);
  }

  @override
  void initState() {
    sendLocalNotification();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    ColorScheme colorScheme = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;

    TextEditingController searchController = TextEditingController();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(size.width, size.height / 9),
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserByIdLoaded) {
              final User user = state.user;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    AppBar(
                      automaticallyImplyLeading: false,
                      surfaceTintColor: Colors.transparent,
                      title: CustomTextFieldWidget(
                        isSearch: true,
                        textEditingController: searchController,
                        onChanged: (p0) {
                          context
                              .read<ProductBloc>()
                              .add(LoadProductBySearch(searchController.text));
                        },
                        hintText: 'Search here',
                        prefixIcon: const Icon(Icons.search),
                      ),
                      actions: [
                        BlocBuilder<CartBloc, CartState>(
                          builder: (context, cartRecentDateState) {
                            if (cartRecentDateState is CartRecentLoaded) {
                              return IconButton(
                                onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => CartScreen(
                                      cart: cartRecentDateState.recentCart,
                                    ),
                                  ),
                                ),
                                icon: Badge(
                                  label: Text(
                                      cartRecentDateState.count.toString()),
                                  child: const Icon(Icons.shopping_cart_outlined),
                                ),
                              );
                            } else {
                              return const CircularProgressIndicator();
                            }
                          },
                        ),
                        IconButton(
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => ProfileScreen(user: user))),
                          icon: const Icon(Icons.person_outline),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: colorScheme.primary,
                          ),
                          RichText(
                            text: TextSpan(
                              text: ' Send to ',
                              style: textTheme.labelLarge!.copyWith(
                                  color:
                                      colorScheme.onSurface.withOpacity(0.5)),
                              children: <TextSpan>[
                                TextSpan(
                                    text:
                                        '${user.address['street']}, ${user.address['city']}',
                                    style: textTheme.labelLarge!.copyWith()),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              
              Expanded(
                child: BlocBuilder<ProductBloc, ProductState>(
                  builder: (context, state) {
                    if (state is ProductLoaded) {
                      final List<Product> products = state.allProducts;
                      final List<Product> filteredProducts =
                          state.filteredProducts;
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            buildCategory(context, state.selectedCategory,
                                state.allProducts, filteredProducts),
                            buildProducts(context, products,
                                value: state.selectedSort),
                          ],
                        ),
                      );
                    } else if (state is ProductLoadedBySearch) {
                      return SingleChildScrollView(
                        child: buildProducts(
                          context,
                          state.filteredProducts,
                        ),
                      );
                    } else if (state is ProductError) {
                      return Center(child: Text(state.error.toString()));
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
