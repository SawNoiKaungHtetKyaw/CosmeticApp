// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';

// import '../controllers/product_controller.dart';
// import '../helpers/my_colors.dart';
// import '../helpers/my_text.dart';
// import '../models/product.dart';

// class MyWidget extends StatefulWidget {
//   const MyWidget({Key? key}) : super(key: key);

//   @override
//   State<MyWidget> createState() => _MyWidgetState();
// }
  

// class _MyWidgetState extends State<MyWidget> {
//   _loadProducts() async {
//     await context.read<ProductController>().getProduct();
//   }

//   @override
//   void initState() {
//     super.initState();
//     _loadProducts();
//   }

//   @override
//   Widget build(BuildContext context) {
    
//     return Scaffold(
//       appBar: AppBar(),
//       body: Selector<ProductController,List<Product>>(
//         selector: (context,bloc)=>bloc.products,
//         builder: (context, prod, child) => (prod!=null)?
//         Column(
//           children: [
//             TextFormField(
//               decoration: InputDecoration(
//                   fillColor: MyColors.normal,
//                   filled: true,
//                   hintText: MyText.search,
//                   hintStyle: TextStyle(
//                       fontWeight: FontWeight.w500,
//                       fontSize: 14.sp,
//                       color: MyColors.hint),
//                   prefixIcon: Icon(
//                     Icons.search,
//                     color: MyColors.hint,
//                   ),
//                   contentPadding: EdgeInsets.zero,
//                   enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(width: 1.w, color: MyColors.primary),
//                       borderRadius: BorderRadius.all(Radius.circular(30.r))),
//                   focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(width: 1.w, color: MyColors.primary),
//                       borderRadius: BorderRadius.all(Radius.circular(30.r)))),
//               onChanged: (value) {
//                 context.read<ProductController>().searchProduct(value);
//               },
//             ),
//             Text(prod.length.toString())
//           ],
//         )
//       : Center(child: CircularProgressIndicator(),)
//       ),
//     );
//   }

// //   void _searchProduct(String query, List<Product> products) {
// //     List<Product> suggestions = products.where((product) {
// //       String poductName = product.name!.toLowerCase();
// //       String input = query.toLowerCase();

// //       return poductName.contains(input);
// //     }).toList();
// //     setState(() => products = suggestions);
// //     print("sug => ${suggestions.length}");
// //     print("prod => ${products.length}");
// //   }
// }

import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'Returning Data',
      home: HomeScreen(),
    ),
  );
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Returning Data Demo'),
      ),
      body: const Center(
        child: SelectionButton(),
      ),
    );
  }
}

class SelectionButton extends StatefulWidget {
  const SelectionButton({super.key});

  @override
  State<SelectionButton> createState() => _SelectionButtonState();
}

class _SelectionButtonState extends State<SelectionButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _navigateAndDisplaySelection(context);
      },
      child: const Text('Pick an option, any option!'),
    );
  }

  // A method that launches the SelectionScreen and awaits the result from
  // Navigator.pop.
  Future<void> _navigateAndDisplaySelection(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SelectionScreen()),
    );

    // When a BuildContext is used from a StatefulWidget, the mounted property
    // must be checked after an asynchronous gap.
    if (!mounted) return;

    // After the Selection Screen returns a result, hide any previous snackbars
    // and show the new result.
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text('$result')));
  }
}

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick an option'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  // Close the screen and return "Yep!" as the result.
                  Navigator.pop(context, 'Yep!');
                },
                child: const Text('Yep!'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  // Close the screen and return "Nope." as the result.
                  Navigator.pop(context, 'Nope.');
                },
                child: const Text('Nope.'),
              ),
            )
          ],
        ),
      ),
    );
  }
}