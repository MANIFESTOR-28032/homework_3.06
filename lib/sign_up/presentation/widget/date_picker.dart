import 'package:categorylogin/Login/data/repository/LogInRepository.dart';
import 'package:categorylogin/core/client.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../utils.dart';
import '../../data/repository/SignUpRepository.dart';
import '../view/SignUpViewModel.dart';

class DatePicker extends StatelessWidget {
  const DatePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DatePickerTextField(
        title: "salom",
        vm: SignUpViewModel(
          authRepo: SignUpRepository(
            client: ApiClient(),
          ),
        ),
      ),
    );
  }
}

class DatePickerTextField extends StatefulWidget {
  final String title;
  final SignUpViewModel vm;

  const DatePickerTextField({Key? key, required this.title, required this.vm})
      : super(key: key);

  @override
  _DatePickerTextFieldState createState() => _DatePickerTextFieldState();
}

class _DatePickerTextFieldState extends State<DatePickerTextField> {
  late TextEditingController _dateController;

  @override
  void initState() {
    super.initState();
    _dateController = TextEditingController(
      text: widget.vm.selectedData != null
          ? DateFormat('dd/MM/yyyy').format(widget.vm.selectedData!)
          : '',
    );
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: widget.vm.selectedData ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);

      setState(() {
        _dateController.text = formattedDate;
      });

      widget.vm.selectedData = pickedDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Date of birth",
          style: TextStyle(color: Colors.white),
        ),
        TextFormField(
          controller: _dateController,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.redpink,
            hintText: widget.title,
            hintStyle: TextStyle(
              fontSize: 16,
              color: Colors.black.withOpacity(0.45),
              fontWeight: FontWeight.w500,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 36),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),
          readOnly: true,
          onTap: () => _selectDate(context),
        ),
      ],
    );
  }
}
