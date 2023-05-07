import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';

import '../bloc/CommercantBloc/commercantEvents.dart';
import '../bloc/CommercantBloc/commercantState.dart';
import '../bloc/CommercantBloc/commercantbloc.dart';

class Calendar extends StatefulWidget {
  final PageController controller ;
   Calendar({super.key, required this.controller});

  @override
  State<Calendar> createState() => _CalendarState();
}
  CommercantProfileBloc searchbydate = CommercantProfileBloc(secondState());

class _CalendarState extends State<Calendar> {
  @override
  void initState() {
       searchbydate = BlocProvider.of<CommercantProfileBloc>(context);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    return Container(
      color: Colors.white10,
      child: Column(
        children: [
          Expanded(
            child: SizedBox(
              height: 500,
              width: 300,
              child: TableCalendar(
                calendarStyle: const CalendarStyle(
                  markerDecoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    shape: BoxShape.circle,
                  ),
                  weekNumberTextStyle: TextStyle(color: Colors.red),

                   defaultTextStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  todayTextStyle:
                      TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  weekendTextStyle:
                      TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  outsideDaysVisible: false,
                ),
                rowHeight: 30,
                shouldFillViewport: true,
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime(2030, 3, 14),
                focusedDay: today,
                onDaySelected: (selectedDay, focusedDay) {

                  searchbydate.add(searchBydate(selectedDay.toString()));
                  widget.controller.nextPage(duration: Duration(seconds: 1), curve: Curves.ease);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
