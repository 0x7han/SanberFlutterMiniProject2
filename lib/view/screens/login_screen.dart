import 'package:flutter/material.dart';
import 'package:sanber_flutter_mini_project_2/view/screens/products/product_screen.dart';
import 'package:sanber_flutter_mini_project_2/view/widgets/custom_text_field_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Sanber Mini Project 2'),
              Text(
                'Raihan Rabbani',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          content: const Column(
            children: [
              SizedBox(
                height: 32,
              ),
              Text(
                'Requirements : ',
                style: TextStyle(fontWeight: FontWeight.bold, height: 2),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('1. Splash screen animated before login'),
                  Text(
                      '2. Login rules username raihan_rabbani, password superbootcamp otherwise show snackbar'),
                  Text('3. Local notification on product screen'),
                  Text(
                      '4. Searchbox filtering by product name on product screen'),
                  Text('5. API testing user repository (profile)'),
                ],
              ),
              Text(
                'Additional : ',
                style: TextStyle(fontWeight: FontWeight.bold, height: 2),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('1. Showing cart count with badge by newest userId 1'),
                  Text('2. Filtering by category products'),
                  Text('3. Sorting by name, price, rating etc. products'),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            FilledButton(
                onPressed: () => Navigator.pop(context), child: const Text('Ok')),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    Future.delayed(Duration.zero, () => _dialogBuilder(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;

    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: colorScheme.primaryContainer.withOpacity(0.4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.shopping_bag,
                  color: colorScheme.primary.withOpacity(0.5),
                  size: 64,
                ),
                Text(
                  'Rpedia',
                  style: textTheme.displayMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: colorScheme.primary.withOpacity(0.5),
                  ),
                ),
                const SizedBox(
                  height: 64,
                ),
              ],
            ),
            CustomTextFieldWidget(
                prefixIcon: const Icon(Icons.person),
                textEditingController: usernameController,
                hintText: 'Username'),
            CustomTextFieldWidget(
                isPassword: true,
                prefixIcon: const Icon(Icons.key),
                textEditingController: passwordController,
                hintText: 'Password'),
            GestureDetector(
              onTap: () {
                if (usernameController.text == "raihan_rabbani" &&
                    passwordController.text == "superbootcamp") {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const ProductScreen()));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Username dan Password tidak sesuai'),
                    ),
                  );
                }
              },
              child: Container(
                width: 340,
                height: 60,
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(vertical: 32),
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                decoration: BoxDecoration(
                  color: colorScheme.primary,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  'Login',
                  style: textTheme.bodyLarge!.copyWith(
                      color: colorScheme.onPrimary,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
