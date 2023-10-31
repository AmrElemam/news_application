import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String? selectedItem;
  List<String> items = ['English', 'Arabic'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            "Language",
            style: TextStyle(
                color: Color(0xff303030),
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                  width: 2,
                  color: const Color(
                      0xff39A552)), // Green border color// Rectangle shape
            ),
            child: DropdownButton<String>(
              value: selectedItem,
              onChanged: (String? newValue) {
                setState(() {
                  selectedItem = newValue;
                });
              },
              items: items.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              style: const TextStyle(
                  color: Color(0xff39A552),
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
              icon: const Icon(Icons.keyboard_arrow_down),
              iconSize: 25,
              iconEnabledColor: const Color(0xff39A552),
              isExpanded: true,
            ),
          ),
        ],
      ),
    );
  }
}
