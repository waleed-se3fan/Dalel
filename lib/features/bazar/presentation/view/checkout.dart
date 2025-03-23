import 'package:dalel/core/widgets/custom_header.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Checkout Screen',
          style: TextStyle(color: Colors.brown, fontSize: 22),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.brown),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.dialpad_sharp, color: Colors.brown),
          )
        ],
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomHeaderText(text: 'Delivery Address'),
            DeliveryAddressWidget(),
            CustomHeaderText(text: 'Selected Product'),
            SizedBox(height: 16),
            SelectedProductWidget(),
            CustomHeaderText(text: 'Payment Method'),
            SizedBox(height: 16),
            PaymentMethodWidget(),
            SizedBox(height: 16),
            TotalPaymentWidget(),
          ],
        ),
      ),
    );
  }
}

class DeliveryAddressWidget extends StatelessWidget {
  const DeliveryAddressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.home, color: Colors.brown),
                const SizedBox(width: 8),
                Text(
                  'Home',
                  style: TextStyle(color: Colors.brown.shade300),
                ),
                const Spacer(),
                Text(
                  'Change',
                  style: TextStyle(color: Colors.grey.shade400),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              'Alexander Michael',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              'Pangandaran Brick Street No. 690\n445434 Yogya, Central Java',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectedProductWidget extends StatelessWidget {
  const SelectedProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.brown.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(width: 16),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Orlando Watch',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text('Size: 12', style: TextStyle(color: Colors.grey)),
                  Text('\$120.00', style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            const Text(
              '1 items',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentMethodWidget extends StatelessWidget {
  const PaymentMethodWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildPaymentMethod('My Credit Card', true),
        _buildPaymentMethod('My Electric Cash', false),
      ],
    );
  }

  Widget _buildPaymentMethod(String title, bool isSelected) {
    return Card(
      child: ListTile(
        leading: Container(
          width: 50,
          height: 30,
          decoration: BoxDecoration(
            color: Colors.brown.shade200,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        title: Text(title),
        subtitle: const Text('1231 3212 2221 0910'),
        trailing: Radio(
          value: isSelected,
          groupValue: true,
          onChanged: (value) {},
        ),
      ),
    );
  }
}

class TotalPaymentWidget extends StatelessWidget {
  const TotalPaymentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total Payment',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text('\$250.00', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.brown.shade300,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {},
            child: const Text(
              'Confirm Payment',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
