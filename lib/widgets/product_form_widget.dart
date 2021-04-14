import 'dart:ui';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class ProductFormWidget extends StatelessWidget {
  final String title;
  final String expirationDate;
  final String quantity;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedExpirationDate;
  final ValueChanged<String> onChangedQuantity;
  final VoidCallback onSavedProduct;

  static DateTime now = DateTime.now();
  static String formattedDate = DateFormat('d MMM, yyyy').format(now);

  const ProductFormWidget({
    Key key,
    this.title = '',
    this.expirationDate = '',
    this.quantity = '',
    @required this.onChangedTitle,
    @required this.onChangedExpirationDate,
    @required this.onChangedQuantity,
    @required this.onSavedProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildTitle(),
        SizedBox(height: 8),
        buildExpirationDate(),
        SizedBox(height: 8),
        buildQuantity(),
        SizedBox(height: 8),
        buildButton(),
      ],
    ),
  );

  Widget buildTitle() => TextFormField(
    maxLines: 1,
    initialValue: title,
    onChanged: onChangedTitle,
    validator: (title) {
      if(title.isEmpty) {
        return 'Укажите название!';
      }

      return null;
    },

    decoration: InputDecoration(
      border: UnderlineInputBorder(),
      labelText: 'Название',
    ),
  );

  Widget buildExpirationDate() => TextFormField(
    maxLines: 1,
    initialValue: formattedDate,
    validator: (expirationDate) {
      if(expirationDate.isEmpty) {
        return 'Укажите срок годности';
      }
      return null;
    },
    decoration: InputDecoration(
      border: UnderlineInputBorder(),
      labelText: 'Срок годности',
    ),
  );

  Widget buildQuantity() => TextFormField(
    maxLines: 1,
    initialValue: "1",
    validator: (expirationDate) {
      if(expirationDate.isEmpty) {
        return 'Укажите количество';
      }
      return null;
    },
    decoration: InputDecoration(
      border: UnderlineInputBorder(),
      labelText: 'Количество',
    ),
  );

  Widget buildButton() => SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.black),
      ),
      onPressed: onSavedProduct,
      child: Text('Добавить'),
    ),
  );
}