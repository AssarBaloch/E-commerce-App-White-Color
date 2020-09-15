import 'package:flutter/material.dart';

import 'package:flutter_material_pickers/flutter_material_pickers.dart';

class Test extends StatelessWidget {
  final  selectedUsState = "Connecticut";
 final List<String> usStates = <String>[
    'Alabama',
    'Alaska',
    'Arizona',
    'Arkansas',
    'California',
    'Colorado',
    'Connecticut',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Datetime Picker'),
      ),
      body: RaisedButton(
          onPressed: () => {
                showMaterialScrollPicker(
                  cancelText: 'sas',
                  confirmText: 'dsad',
           

                backgroundColor: Colors.white,

                  headerColor: Colors.blue,
                  showDivider: false,
                  context: context,
                  title: "Pick Your City",
                  items: usStates,
                  selectedItem: selectedUsState,
                )
              }),
    );
  }
}
