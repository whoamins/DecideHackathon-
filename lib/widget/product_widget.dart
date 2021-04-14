import 'package:decide_hackathon/page/edit_product_page.dart';
import 'package:decide_hackathon/provider/products.dart';
import 'package:decide_hackathon/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:decide_hackathon/model/product.dart';


class ProductWidget extends StatelessWidget {
  final Product product;

  const ProductWidget({
    @required this.product,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ClipRRect(
    borderRadius: BorderRadius.circular(16),
    child: Slidable(
      actionPane: SlidableDrawerActionPane(),
      key: Key(product.id),
      actions: [
        IconSlideAction(
          color: Colors.green,
          onTap: () => editProduct(context, product),
          caption: 'Edit',
          icon: Icons.edit,
        )
      ],
      secondaryActions: [
        IconSlideAction(
          color: Colors.red,
          caption: 'Delete',
          onTap: () => deleteProduct(context, product),
          icon: Icons.delete,
        )
      ],
      child: buildProduct(context),
    ),
  );

  Widget buildProduct(BuildContext context) => GestureDetector(
    onTap: () => editProduct(context, product),
    child: Container(
      color: Colors.white,
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Checkbox(
            activeColor: Theme.of(context).primaryColor,
            checkColor: Colors.white,
            value: product.isExpired,
            onChanged: (_) {
              final provider =
              Provider.of<ProductProvider>(context, listen: false);
              final isDone = provider.toggleProductStatus(product);

              Utils.showSnackBar(
                context,
                isDone ? 'Просроченно. Добавлено в список продуктов.' : 'А нет, не просроченный.',
              );
            },
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${product.title} | ${product.quantity}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );

  void deleteProduct(BuildContext context, Product product) {
    final provider = Provider.of<ProductProvider>(context, listen: false);
    provider.removeProduct(product);

    Utils.showSnackBar(context, 'Deleted the task');
  }

  void editProduct(BuildContext context, Product product) => Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => EditProductPage(product: product),
    ),
  );
}