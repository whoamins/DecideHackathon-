import 'package:decide_hackathon/widget/add_product_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


class ProductFormWidget extends StatelessWidget {
  final String title;
  final int quantity;
  final DateTime expirationDate;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedQuantity;
  final ValueChanged<String> onChangedExpirationDate;
  final VoidCallback onSavedProduct;

  static DateTime now = DateTime.now();
  static final DateFormat formattedDate = DateFormat('MMM dd, yyyy');
  static DateTime _selectedDate;
  static TextEditingController _textEditingController = TextEditingController();


  const ProductFormWidget({
    Key key,
    this.title = '',
    this.quantity = 1,
    this.expirationDate,
    @required this.onChangedTitle,
    @required this.onChangedQuantity,
    @required this.onChangedExpirationDate,
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
        buildCalendar(context),
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

  Widget buildCalendar(BuildContext context) => TextFormField(
    keyboardType: TextInputType.phone,
    controller: _textEditingController,
    onChanged: onChangedExpirationDate,
    onTap: () {
      _selectDate(context);
      },
    readOnly: true,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      ),
      labelText: 'Срок годности',
    ),
  );
    /*
    maxLines: 1,
    initialValue: DateTime.now(),
    onChanged: onChangedExpirationDate(),
    decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
      labelText: 'Тут должен быть календарь...'

     */

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

  _selectDate(BuildContext context) async {
    DateTime newSelectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2040),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.dark(
                primary: Colors.deepPurple,
                onPrimary: Colors.black,
                surface: Color(0xff7f00ff),
                onSurface: Colors.black,
              ),
              dialogBackgroundColor: Colors.white,
            ),
            child: child,
          );
        });

    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;
      _textEditingController
        ..text = DateFormat.yMMMd().format(_selectedDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: _textEditingController.text.length,
            affinity: TextAffinity.upstream));
    }
  }
}