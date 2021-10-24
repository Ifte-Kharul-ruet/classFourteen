import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int cartNumber = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'shoping Cart',
        ),
        actions: [
          TopCart(cart: cartNumber),
          SizedBox(
            width: 50.0,
          )
        ],
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              highlightColor: Colors.green,
              child: Icon(
                Icons.add,
                size: 50,
              ),
              onTap: () {
                print(cartNumber);
                setState(() {
                  cartNumber++;
                });
              },
            ),
            SizedBox(
              width: 20.0,
            ),
            InkWell(
              highlightColor: Colors.red,
              child: Icon(
                Icons.minimize,
                size: 50,
              ),
              onTap: () {
                setState(() {
                  cartNumber--;
                });
                print(cartNumber);
              },
            )
          ],
        ),
      ),
    );
  }
}

class TopCart extends StatefulWidget {
  const TopCart({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final int cart;

  @override
  _TopCartState createState() => _TopCartState();
}

class _TopCartState extends State<TopCart> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      //alignment: Alignment.center,
      children: [
        Icon(
          Icons.shopping_cart_outlined,
          size: 50,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.redAccent,
          ),
          child: Text('${widget.cart}'),
        )
      ],
    );
  }
}
