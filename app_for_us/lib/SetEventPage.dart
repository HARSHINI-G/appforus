import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class SetEventPage extends StatefulWidget {
  const SetEventPage({super.key});

  @override
  _SetEventPageState createState() => _SetEventPageState();
}

class _SetEventPageState extends State<SetEventPage> {
  DateTime initialDisplayDate = DateTime.utc(2023, 12, 12);
  DateTime finalDisplayDate = DateTime.utc(2030, 12, 12);

  final TextEditingController _eventController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Set Event'),
        backgroundColor: const Color.fromARGB(255, 219, 138, 165),
      ),
      body: SizedBox(
        height: MediaQuery.of(context)
            .size
            .height, // Set height to full screen height
        child: Column(
          children: [
            Expanded(
              child: SfCalendar(
                view: CalendarView.week,
                showCurrentTimeIndicator: true,
                firstDayOfWeek: 7,
                initialDisplayDate: initialDisplayDate,
                dataSource: MeetingDataSource(getAppointments()),
                onTap: (CalendarTapDetails details) {
                  if (details.targetElement == CalendarElement.calendarCell) {
                    // User tapped on a date/time slot
                    showEventDetailsDialog(context, details.date!);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showEventDetailsDialog(BuildContext context, DateTime date) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter Event Details'),
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _eventController,
              decoration: const InputDecoration(labelText: 'Event/Work'),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Save event details here
                String eventDetails = _eventController.text;
                print('Event Details: $eventDetails');
                // Perform additional actions with the event details as needed
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}

List<Appointment> getAppointments() {
  List<Appointment> meetings = <Appointment>[];
  final DateTime today = DateTime.now();
  final DateTime startTime =
      DateTime(today.year, today.month, today.day, 9, 0, 0);
  final DateTime endTime = startTime.add(const Duration(hours: 2));

  meetings.add(Appointment(
    startTime: startTime,
    endTime: endTime,
    subject: 'conference',
    color: Colors.yellowAccent,
  ));
  return meetings;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}
