import 'package:flutter/material.dart';

// void main() {
//   runApp(GenderSelectionApp());
// }

class GenderSelectionScreen extends StatefulWidget {
  @override
  _GenderSelectionScreenState createState() => _GenderSelectionScreenState();
}

class _GenderSelectionScreenState extends State<GenderSelectionScreen> {
  String selectedGender = "Select Gender"; // Tanlangan gender uchun o'zgaruvchi

  void _showGenderBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        String tempGender = selectedGender;
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              padding: EdgeInsets.all(16),
              height: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Select Gender",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  ListTile(
                    title: Text("Male"),
                    leading: Radio<String>(
                      value: "Male",
                      groupValue: tempGender,
                      onChanged: (value) {
                        setState(() {
                          tempGender = value!;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: Text("Female"),
                    leading: Radio<String>(
                      value: "Female",
                      groupValue: tempGender,
                      onChanged: (value) {
                        setState(() {
                          tempGender = value!;
                        });
                      },
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedGender = tempGender;
                        });
                        Navigator.pop(context);
                      },
                      child: Text("OK"),
                    ),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Gender Selection")),
      body: Center(
        child: GestureDetector(
          onTap: _showGenderBottomSheet,
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              selectedGender,
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
