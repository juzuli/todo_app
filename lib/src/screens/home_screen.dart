import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:to_do_app/src/bloc/cubit/todos_cubit.dart';
import 'package:to_do_app/src/constants/colors.dart';
import 'package:to_do_app/src/constants/text_styles.dart';
import 'package:to_do_app/src/widgets/add_schedule_sheet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<TodosCubit>(context).fetchTodos();

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _currentDateBar(),
              _dateBar(),
              _scheduleView(),
            ],
          ),
        ),
        floatingActionButton: _floatingActionButton(),
      ),
    );
  }

  _scheduleView() {
    return Column(
      children: [
        BlocBuilder<TodosCubit, TodosState>(builder: (context, state) {
          if (state is TodosLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TodosError) {
            return const Center(
              child: Icon(Icons.close),
            );
          } else if (state is TodosLoaded) {
            final todo = state.todos;
            return Container(
              margin: const EdgeInsets.only(top: 20, bottom: 70),
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 27,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.whiteSmokeColor,
              ),
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: todo.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: 100,
                      height: 100,
                      child: TimelineTile(
                        isFirst: index == 0 ? true : false,
                        alignment: TimelineAlign.start,
                        indicatorStyle: IndicatorStyle(
                          width: 55,
                          height: 74,
                          indicator: Container(
                            width: 55,
                            height: 74,
                            decoration: BoxDecoration(
                              color: AppColors.columbiaBlueColor,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: SvgPicture.asset(
                              "assets/images/svg/calendar.svg",
                              height: 20,
                              width: 18,
                              fit: BoxFit.none,
                            ),
                          ),
                        ),
                        afterLineStyle: const LineStyle(
                          color: AppColors.columbiaBlueColor,
                        ),
                        beforeLineStyle: const LineStyle(
                          color: AppColors.columbiaBlueColor,
                        ),
                        endChild: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${todo[index].startTime} - ${todo[index].endTime}",
                                style: AppTextStyle.timelineSubStyle,
                              ),
                              Text(
                                todo[index].name,
                                style: AppTextStyle.timelineTitleStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            );
          }
          return Container();
        }),
      ],
    );
  }

  _floatingActionButton() {
    return FloatingActionButton(
      backgroundColor: AppColors.cyanBlueColor,
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
          builder: (context) => const AddScheduleSheet(),
        );
      },
      child: const Icon(
        Icons.add,
        color: AppColors.whiteSmokeColor,
      ),
    );
  }

  _dateBar() {
    return Container(
      margin: const EdgeInsets.only(
        left: 20,
      ),
      child: DatePicker(
        DateTime.now(),
        initialSelectedDate: DateTime.now(),
        selectionColor: AppColors.cyanBlueColor,
        selectedTextColor: AppColors.appWhiteColor,
        dateTextStyle: const TextStyle(
          color: AppColors.appBlackColor,
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
        dayTextStyle: const TextStyle(
          color: AppColors.appBlackColor,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        // onDateChange: (date) {
        //   _selectedDate = date;
        // },
      ),
    );
  }

  _currentDateBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 25),
      child: Text(
        DateFormat.yMMMM().format(DateTime.now()).toUpperCase(),
        style: AppTextStyle.headingStyle,
      ),
    );
  }
}
