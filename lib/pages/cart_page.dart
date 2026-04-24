import 'package:flutter/material.dart';
import 'package:catalog_appzs/models/cart.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Cart"),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: _CartList(),
            ),
          ),
          const Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "\$${_cart.totalPrice}",
            style: const TextStyle(fontSize: 32, color: Colors.deepPurple),
          ),
          ElevatedButton(
            onPressed: () {
              if (_cart.items.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Cart is empty!"),
                ));
              } else {
                _showPaymentOptions(context);
              }
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
            child: const Text("Buy", style: TextStyle(color: Colors.white)),
          )
        ],
      ),
    );
  }

  void _showPaymentOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          height: 250,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Select Payment Method",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ListTile(
                leading: const Icon(Icons.account_balance_wallet, color: Colors.pink),
                title: const Text("bKash Payment"),
                onTap: () {
                  Navigator.pop(context);
                  _processPayment(context, "bKash");
                },
              ),
              ListTile(
                leading: const Icon(Icons.credit_card, color: Colors.blue),
                title: const Text("Dutch Bangla Bank (Card)"),
                onTap: () {
                  Navigator.pop(context);
                  _processPayment(context, "Dutch Bangla Card");
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _processPayment(BuildContext context, String method) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Pay with $method"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Total Amount: \$${_cart.totalPrice}"),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: method == "bKash" ? "Enter bKash Number" : "Enter Card Number",
                border: const OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Payment Successful via $method!"),
                backgroundColor: Colors.green,
              ));
              // Clear cart after successful payment simulation
              // _cart.clear(); // You might want to add a clear method to CartModel
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
            child: const Text("Confirm Payment", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

class _CartList extends StatefulWidget {
  @override
  State<_CartList> createState() => _CartListState();
}

class _CartListState extends State<_CartList> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return _cart.items.isEmpty
        ? const Center(child: Text("Nothing to show"))
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
              leading: const Icon(Icons.done),
              trailing: IconButton(
                icon: const Icon(Icons.remove_circle_outline),
                onPressed: () {
                  setState(() {
                    _cart.remove(_cart.items[index]);
                  });
                },
              ),
              title: Text(_cart.items[index].name),
            ),
          );
  }
}
