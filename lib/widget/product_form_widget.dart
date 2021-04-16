import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


class ProductFormWidget extends StatelessWidget {
  final String title;
  final int quantity;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedQuantity;
  final VoidCallback onSavedProduct;

  static DateTime now = DateTime.now();
  static final DateFormat formattedDate = DateFormat('MMM dd, yyyy');

  const ProductFormWidget({
    Key key,
    this.title = '',
    this.quantity = 1,
    @required this.onChangedTitle,
    @required this.onChangedQuantity,
    @required this.onSavedProduct
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildTitle(),
        SizedBox(height: 25),
        buildQuantity(),
        SizedBox(height: 25),
        buildCalendar(),
        SizedBox(height: 16),
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
        return 'Название не может быть пустым';
      }
      return null;
    },
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      ),
      labelText: 'Название',
    ),
  );

    Widget buildQuantity() => TextFormField(
    maxLines: 1,
    initialValue: "",
      onChanged: onChangedQuantity,
      keyboardType: TextInputType.number,
    validator: (quantity) {
      if(quantity.isEmpty) {
        return 'Количество не может быть пустым';
      }

      return null;
    },
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      ),
      labelText: 'Количество'
    ),
  );

  Widget buildCalendar() => TextFormField(
    decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
      labelText: 'Тут должен быть календарь...'
    ),
  );

  Widget buildButton() => SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Color(0xff7f00ff)),
      ),
      onPressed: onSavedProduct,
      child: Text('Добавить'),
    ),
  );
}