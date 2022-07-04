import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:to_do_app/src/bloc/cubit/todos_cubit.dart';
import 'package:to_do_app/src/constants/colors.dart';
import 'package:to_do_app/src/constants/strings.dart';
import 'package:to_do_app/src/constants/text_styles.dart';
import 'package:to_do_app/src/widgets/button.dart';
import 'package:to_do_app/src/widgets/list_view.dart';
import 'package:intl/intl.dart';

class AddScheduleSheet extends StatefulWidget {
  const AddScheduleSheet({Key? key}) : super(key: key);

  @override
  State<AddScheduleSheet> createState() => _AddScheduleSheetState();
}

class _AddScheduleSheetState extends State<AddScheduleSheet> {
  final _formFieldKey = GlobalKey<FormFieldState>();
  final TextEditingController _nameController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String _endTime = "9:30 PM";
  String _startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();

  void fetchData() {
    BlocProvider.of<TodosCubit>(context).fetchTodos();
  }

  @override
  void initState() {
    //fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 28,
        ),
        child: ListView(
          shrinkWrap: true,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  Strings.addSchedule,
                  style: AppTextStyle.sheetHeadingStyle,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.close,
                    color: AppColors.darkCharcoalColor,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            const Text(
              Strings.name,
              style: AppTextStyle.formSubHeadingStyle,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 4.0,
                bottom: 20,
              ),
              child: TextFormField(
                key: _formFieldKey,
                validator: (value) {
                  if (value!.isEmpty) {
                    return Strings.pleaseEnterScheduleName;
                  }
                  return null;
                },
                controller: _nameController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.solitudeBlueColor,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ),
            ),
            const Text(
              Strings.dateTime,
              style: AppTextStyle.formSubHeadingStyle,
            ),
            const SizedBox(
              height: 4,
            ),
            AppListTile(
              label: Strings.startTime,
              value: _startTime,
              onTap: () {
                _getTimeFromUser(isStartTime: true);
              },
            ),
            const Divider(
              height: 0,
              indent: 18,
              color: AppColors.appBlackColor,
            ),
            AppListTile(
              label: Strings.endTime,
              value: _endTime,
              onTap: () {
                _getTimeFromUser(isStartTime: false);
              },
            ),
            const Divider(
              height: 0,
              indent: 18,
              color: AppColors.appBlackColor,
            ),
            AppListTile(
              label: Strings.date,
              value: DateFormat.yMd().format(_selectedDate),
              onTap: () {
                _getDateFromUser();
              },
            ),
            const SizedBox(
              height: 21,
            ),
            AppButton(
              label: Strings.addSchedule,
              onTap: () async {
                if (!_formFieldKey.currentState!.validate()) {
                  return;
                }
                String name = _nameController.text;
                String startTime = _startTime;
                String endTime = _endTime;
                String date = DateFormat.yMd().format(_selectedDate);

                bool status = await BlocProvider.of<TodosCubit>(context)
                    .addTodos(name, startTime, endTime, date);
                Navigator.pop(context);
                if (status) {
                  setState(() {
                    _nameController.clear();
                  });

                  Fluttertoast.showToast(msg: Strings.todoAddedSuccessfully);
                } else {
                  Fluttertoast.showToast(msg: Strings.failedToAddTodo);
                }
              },
            ),
            const SizedBox(
              height: 21,
            ),
          ],
        ),
      ),
    );
  }

  _getDateFromUser() async {
    DateTime? pickerDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(3020),
    );
    if (pickerDate != null) {
      setState(() {
        _selectedDate = pickerDate;
      });
    } else {
      return;
    }
  }

  _getTimeFromUser({required bool isStartTime}) async {
    var pickedTime = await _showTimePicker();
    String formattedTime = pickedTime.format(context);
    if (pickedTime == null) {
      return const Text(Strings.cancelled);
    } else if (isStartTime == true) {
      setState(() {
        _startTime = formattedTime;
      });
    } else if (isStartTime == false) {
      setState(() {
        _endTime = formattedTime;
      });
    }
  }

  _showTimePicker() {
    return showTimePicker(
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
      initialTime: TimeOfDay(
        hour: int.parse(_startTime.split(":")[0]),
        minute: int.parse(_startTime.split(":")[1].split(" ")[0]),
      ),
    );
  }
}
