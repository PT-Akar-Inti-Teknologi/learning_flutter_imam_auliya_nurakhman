// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

// ============== WIDGET LIFESTYLE EVENT ==============

class Product {
  const Product({required this.name});

  final String name;
}

typedef CartChangedCallback = Function(Product product, bool inCart);

class ShoppingListItem extends StatelessWidget {
  ShoppingListItem(
      {required this.product,
      required this.inCart,
      required this.onCartChanged})
      : super(key: ObjectKey(product));

  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChanged;

  Color _getColor(BuildContext context) {
    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle? _getTextStyle(BuildContext context) {
    if (!inCart) return null;
    return const TextStyle(
        color: Colors.black54, decoration: TextDecoration.lineThrough);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onCartChanged(product, inCart);
      },
      leading: CircleAvatar(
        backgroundColor: _getColor(context),
        child: Text(product.name[0]),
      ),
      title: Text(
        product.name,
        style: _getTextStyle(context),
      ),
    );
  }
}

class ShoppingList extends StatefulWidget {
  const ShoppingList({required this.products, super.key});

  final List<Product> products;

  @override
  State<ShoppingList> createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  final _shopingCart = <Product>{};

  void _handleStateChanged(Product product, bool inCart) {
    setState(() {
      if (!inCart) {
        _shopingCart.add(product);
      } else {
        _shopingCart.remove(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping List'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: widget.products.map((product) {
          return ShoppingListItem(
              product: product,
              inCart: _shopingCart.contains(product),
              onCartChanged: _handleStateChanged);
        }).toList(),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
      title: 'Shopping App',
      home: ShoppingList(
        products: [
          Product(name: 'Eggs'),
          Product(name: 'Flour'),
          Product(name: 'Chocochips'),
        ],
      )));
}





























// ============== CART ================================

// class Product {
//   const Product({required this.name});

//   final String name;
// }

// typedef CartChangedCallback = Function(Product product, bool inCart);

// class ShoppingListItem extends StatelessWidget {
//   // const ShoppingListItem({super.key});
//   ShoppingListItem({
//     required this.product,
//     required this.inCart,
//     required this.onCartChanged,
//   }) : super(key: ObjectKey(product));

//   final Product product;
//   final bool inCart;
//   final CartChangedCallback onCartChanged;

//   Color _getColor(BuildContext context) {
//     return inCart ? Colors.black54 : Theme.of(context).primaryColor;
//   }

//   TextStyle? _getTextStyle(BuildContext context) {
//     if (!inCart) return null;

//     return const TextStyle(
//       color: Colors.black54,
//       decoration: TextDecoration.lineThrough,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       onTap: () {
//         onCartChanged(product, inCart);
//       },
//       leading: CircleAvatar(backgroundColor: _getColor(context)),
//       title: Text(
//         product.name,
//         style: _getTextStyle(context),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(
//     MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: ShoppingListItem(
//             product: const Product(name: 'Chips'),
//             inCart: true,
//             onCartChanged: (product, inCart) {},
//           ),
//         ),
//       ),
//     ),
//   );
// }



// =======CHANGING WIDGETS IN RESPONSE TO INPUT=========

// class Counter extends StatefulWidget {
//   const Counter({super.key});

//   @override
//   State<Counter> createState() => _CounterState();
// }

// class _CounterState extends State<Counter> {
//   int _counter = 0;

//   void _increment() {
//     setState(() {
//       ++_counter;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         CounterIncrementor(onPress: _increment),
//         const SizedBox(
//           width: 46,
//         ),
//         CounterDisplay(count: _counter)
//       ],
//     );
//   }
// }

// class CounterDisplay extends StatelessWidget {
//   const CounterDisplay({required this.count, super.key});
//   final int count;

//   @override
//   Widget build(BuildContext context) {
//     return Text('Count: $count');
//   }
// }

// class CounterIncrementor extends StatelessWidget {
//   const CounterIncrementor({required this.onPress, super.key});

//   final VoidCallback onPress;

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(onPressed: onPress, child: const Text('Increment'));
//   }
// }

// void main() {
//   runApp(const MaterialApp(
//     home: Scaffold(
//       body: Center(
//         child: Counter(),
//       ),
//     ),
//   ));
// }



// =============HANDLING GESTURES==============

// class MyButton extends StatelessWidget {
//   const MyButton({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         print('ON TAP');
//       },
//       onLongPress: () {
//         print('ON LONG PRESS');
//       },
//       child: Container(
//         height: 50,
//         padding: const EdgeInsets.all(8),
//         margin: const EdgeInsets.symmetric(horizontal: 8),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(5),
//           color: Colors.lightGreen[500],
//         ),
//         child: const Center(
//           child: Text('Engage'),
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(const MaterialApp(
//     home: Scaffold(
//       body: Center(
//         child: MyButton(),
//       ),
//     ),
//   ));
// }
