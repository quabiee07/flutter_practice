import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:practice2/components/grocery_tile.dart';
import 'package:practice2/models/grocery_item.dart';
import 'package:practice2/screens/grocery_screen.dart';
import 'package:uuid/uuid.dart';

class GroceryItemScreen extends StatefulWidget {

  final Function(GroceryItem) onCreate;
  final Function(GroceryItem) onUpdate;
  final GroceryItem? originalItem;
  final bool isUpdating;

  const GroceryItemScreen({Key? key, required this.onCreate, required this.onUpdate, this.originalItem
     }): isUpdating = (originalItem != null),
        super(key: key);

  @override
  _GroceryItemScreenState createState() =>
      _GroceryItemScreenState();
}

class _GroceryItemScreenState extends State<GroceryItemScreen> {

  final _nameController = TextEditingController();
  String _name = "";
  Importance _importance = Importance.low;
  DateTime _dueDate = DateTime.now();
  TimeOfDay _timeOfDay = TimeOfDay.now();
  int _currentSliderValue = 0;
  Color _currentColor = Colors.green;

  @override
  void initState() {
    final originalItem =widget.originalItem;
    if(widget.originalItem != null) {
      _nameController.text = originalItem!.name;
      _name = originalItem.name;
      _currentSliderValue = originalItem.quantity;
      _importance = originalItem.importance;
      _currentColor = originalItem.color;
      final date = originalItem.date;
      _timeOfDay = TimeOfDay(hour: date.hour, minute: date.minute);
      _dueDate = date;
    }

    _nameController.addListener(() {
      setState(() {
        _name = _nameController.text;
      });
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
            IconButton(
                onPressed: (){
                  //TODO: Add callback handler
                  final groceryItem = GroceryItem(
                      id: widget.originalItem?.id ??  Uuid().v1(),
                      name: _nameController.text,
                      importance: _importance,
                      color: _currentColor,
                      quantity: _currentSliderValue,
                      date: DateTime(_dueDate.year, _dueDate.month, _dueDate.day,
                          _timeOfDay.hour, _timeOfDay.minute));
                  if(widget.isUpdating){
                    widget.onUpdate(groceryItem);
                  } else {
                    widget.onCreate(groceryItem);
                  }

                },
                icon: Icon(Icons.check))
          ],
          elevation: 0.0,
          title: Text('Grocery Item',
            style: GoogleFonts.lato(fontWeight: FontWeight.w600),)
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            //TODO:name field
            buildNameField(),
            //TODO:importance selection
            SizedBox(height: 10.0),
            buildImportanceField(),
            //TODO:date picker
            SizedBox(height: 10.0),
            buildDateField(context),
            //TODO: time picker
            buildTimeField(context),
            //TODO:color picker
            SizedBox(height: 10.0),
            buildColorPicker(context),
            //TODO:slider
            SizedBox(height: 10.0),
            buildQuantityField(),
            //TODO:grocery tile
            SizedBox(height: 10.0),
            GroceryTile(
              item: GroceryItem(
                id: "id",
                name: _name,
                importance: _importance,
                color: _currentColor,
                quantity: _currentSliderValue,
                date: DateTime(_dueDate.year, _dueDate.month, _dueDate.day, _timeOfDay.hour, _timeOfDay.minute
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget buildNameField(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Item Name', style: GoogleFonts.lato(fontSize: 28.0),),
        TextField(
          controller: _nameController,
          cursorColor: _currentColor,
          decoration:  InputDecoration(
            hintText: 'E.g. Oranges, Apples, 1 Bag of salt',
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: _currentColor),),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: _currentColor),),
          ),
        )
      ],
    );
  }

  Widget buildImportanceField(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Importance', style: GoogleFonts.lato(fontSize: 28.0),),
        Wrap(
          spacing: 10.0,
          children: [
            ChoiceChip(
              selectedColor: Colors.black,
              selected: _importance == Importance.low,
              label: Text('Low',style: TextStyle(color:Colors.white),),
              onSelected: (selected) {
                setState(() => _importance == Importance.low);
              },
            ),
            ChoiceChip(
              selectedColor: Colors.black,
              selected: _importance == Importance.medium,
              label: Text('Medium',style: TextStyle(color:Colors.white),),
              onSelected: (selected) {
                setState(() => _importance == Importance.medium);
              },
            ),
            ChoiceChip(
              selectedColor: Colors.black,
              selected: _importance == Importance.high,
              label: Text('High',style: TextStyle(color:Colors.white),),
              onSelected: (selected) {
                setState(() => _importance == Importance.high);
              },
            )
          ],
        ),
      ],
    );
  }

  Widget buildDateField(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Date', style: GoogleFonts.lato(fontSize: 28.0),),

            TextButton(
                onPressed: () async {
                  final currentDate = DateTime.now();
                  final selectedDate = await showDatePicker(
                      context: context,
                      initialDate: currentDate,
                      firstDate: currentDate,
                      lastDate: DateTime(currentDate.year + 5));
                  setState(() {
                    if(selectedDate != null){
                      _dueDate = selectedDate;
                    }
                  });
                },
                child: Text('Select'),)
          ],
        ),
        if(_dueDate != null)
          Text('${DateFormat('yyyy-MM-dd').format(_dueDate)}')
      ],
    );
  }

  Widget buildTimeField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Time', style: GoogleFonts.lato(fontSize: 28.0),),

            TextButton(
              onPressed: () async {
                final timeOfDay = await showTimePicker(
                    context: context,
                  initialTime: TimeOfDay.now(),
                );
                setState(() {
                  if(timeOfDay!=null){
                    _timeOfDay = timeOfDay;
                  }
                });
              },
              child: Text('Select'),)
          ],
        ),
        if(_dueDate != null)
          Text('${_timeOfDay.format(context)}'),
      ],
    );
  }

  Widget buildColorPicker(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(

          children: [
            Container(height:  50.0, width: 10.0, color: _currentColor,),
            SizedBox(width: 8.0),
            Text('Color', style: GoogleFonts.lato(fontSize: 28.0)),
            TextButton(
              onPressed: (){
                showDialog(context: context, builder: (context){
                  return AlertDialog(
                    content: BlockPicker(
                      pickerColor: Colors.white,
                      onColorChanged: (color) {
                        setState(() => _currentColor = color);
                        }),
                    actions: [
                      TextButton(onPressed: () => Navigator.of(context).pop,
                          child: Text('Save'))
                    ],
                  );
                });
              },
              child: Text('Select'),
            ),
          ],
        )
      ],
    );
  }

  Widget buildQuantityField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              'Quantity',
              style: GoogleFonts.lato(fontSize: 28.0),),
            const SizedBox(width: 16.0),
            Text(
              _currentSliderValue.toInt().toString(),
              style: GoogleFonts.lato(fontSize: 18.0),),
          ],
        ),

        Slider(
          inactiveColor: _currentColor.withOpacity(0.5),
          activeColor: _currentColor,
          value: _currentSliderValue.toDouble(),
          min: 0.0,
          max: 100.0,
          divisions: 100,
          label: _currentSliderValue.toInt().toString(),
          onChanged: (double value) {
            setState(() {
              _currentSliderValue = value.toInt();
            },);
          },
        ),
      ],);
  }
}
