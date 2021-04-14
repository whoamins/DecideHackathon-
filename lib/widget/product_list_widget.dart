import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:decide_hackathon/provider/products.dart';
import 'package:decide_hackathon/widget/product_widget.dart';


class ProductListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context);
    final products = provider.products;


    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: products.isEmpty
          ? Center(
              child: Text(
                'Нет продуктов...',
                style: TextStyle(fontSize: 20),
              ),
      ) : ListView.separated(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(16),
            separatorBuilder: (context, index) => Container(height: 8),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];

              return ProductWidget(product: product);
            },
      ),
    );
  }
}