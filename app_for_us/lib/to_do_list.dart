import 'package:app_for_us/HomePage.dart';
import 'package:app_for_us/SetEventPage.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  DateTime today = DateTime.now();
  DateTime? _selectedDay;
  final Map<DateTime, List<dynamic>> _events = {};
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 194, 199, 49),
        title: const Text('TO-DO LIST'),
      ),
      body: Column(
        children: [
          TableCalendar(
            calendarFormat: CalendarFormat.month,
            firstDay: DateTime.utc(2023, 12, 12),
            lastDay: DateTime.utc(2030, 12, 12),
            focusedDay: today,
            startingDayOfWeek: StartingDayOfWeek.monday,
            daysOfWeekVisible: true,
            rowHeight: 70,
            headerStyle: const HeaderStyle(
              titleTextStyle: TextStyle(
                color: Color.fromRGBO(6, 16, 24, 0.844),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              leftChevronIcon: Icon(
                Icons.arrow_back,
                color: Color.fromARGB(255, 38, 126, 197),
                size: 20,
              ),
              rightChevronIcon: Icon(
                Icons.arrow_forward,
                color: Color.fromARGB(255, 38, 126, 197),
                size: 20,
              ),
              formatButtonVisible: false,
              titleCentered: true,
            ),
            daysOfWeekStyle: const DaysOfWeekStyle(
              weekendStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 1, 67, 121),
              ),
              weekdayStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            calendarStyle: const CalendarStyle(
              weekendTextStyle: TextStyle(
                color: Color.fromARGB(255, 1, 67, 121),
              ),
              todayDecoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.lightGreen,
              ),
              selectedDecoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.lightBlue,
              ),
              outsideDaysVisible: true,
            ),
            eventLoader: (day) {
              return _events[day] ?? [];
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                focusedDay = focusedDay;
              });
            },
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            if (_currentIndex == 1) {
              // Navigate to the Set Event page when the "Set Event" icon is tapped
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SetEventPage()),
              );
            } else if (_currentIndex == 0) {
              // Navigate to the Home page when the "Home" icon is tapped
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            }
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Set Event',
          ),
        ],
      ),
    );
  }
}
