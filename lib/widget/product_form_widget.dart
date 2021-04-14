import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class ProductFormWidget extends StatelessWidget {
  final String title;
  final int quantity;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<int> onChangedQuantity;
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
        SizedBox(height: 8),
        buildQuantity(),
        SizedBox(height: 8),
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
      border: UnderlineInputBorder(),
      labelText: 'Название',
    ),
  );

  Widget buildQuantity() => TextFormField(
    maxLines: 1,
    initialValue: "",
    keyboardType: TextInputType.number,
    validator: (quantity) {
      if(quantity.isEmpty) {
        return 'Количество не может быть пустым';
      }

      return null;
    },
    decoration: InputDecoration(
      border: UnderlineInputBorder(),
      labelText: 'Количество'
    ),
  );

  Widget buildCalendar() => TextFormField(
    decoration: InputDecoration(
      border: UnderlineInputBorder(),
      labelText: 'Тут должен быть календарь...'
    ),
  );

  Widget buildButton() => SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.lightBlue),
      ),
      onPressed: onSavedProduct,
      child: Text('Добавить'),
    ),
  );
}