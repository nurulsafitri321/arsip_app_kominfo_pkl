import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  TimeOfDay _selectedTime = TimeOfDay.now();
  final TextEditingController _eventController = TextEditingController();

  // Contoh data hari-hari penting
  final Map<DateTime, List<Map<String, dynamic>>> _events = {
    DateTime.utc(2024, 1, 1): [
      {'event': 'Tahun Baru 2024 Masehi', 'time': TimeOfDay(hour: 0, minute: 0)}
    ],
    DateTime.utc(2024, 2, 8): [
      {'event': 'Isra\' Mikraj Nabi Muhammad SAW', 'time': TimeOfDay(hour: 0, minute: 0)}
    ],
    DateTime.utc(2024, 2, 10): [
      {'event': 'Tahun Baru Imlek 2575 Kongzili', 'time': TimeOfDay(hour: 0, minute: 0)}
    ],
    DateTime.utc(2024, 3, 11): [
      {'event': 'Hari Raya Nyepi Tahun Baru Saka 1946', 'time': TimeOfDay(hour: 0, minute: 0)}
    ],
    DateTime.utc(2024, 3, 29): [
      {'event': 'Wafat Isa Al Masih', 'time': TimeOfDay(hour: 0, minute: 0)}
    ],
    DateTime.utc(2024, 4, 10): [
      {'event': 'Hari Raya Idul Fitri 1445 Hijriyah', 'time': TimeOfDay(hour: 0, minute: 0)}
    ],
    DateTime.utc(2024, 4, 11): [
      {'event': 'Hari Raya Idul Fitri 1445 Hijriyah', 'time': TimeOfDay(hour: 0, minute: 0)}
    ],
    DateTime.utc(2024, 5, 1): [
      {'event': 'Labor Day', 'time': TimeOfDay(hour: 0, minute: 0)}
    ],
    DateTime.utc(2024, 5, 9): [
      {'event': 'Hari Buruh Internasional', 'time': TimeOfDay(hour: 0, minute: 0)}
    ],
    DateTime.utc(2024, 5, 16): [
      {'event': 'Kenaikan Isa Al masih', 'time': TimeOfDay(hour: 0, minute: 0)}
    ],
    DateTime.utc(2024, 5, 23): [
      {'event': 'Hari Raya Waisak 2568 BE', 'time': TimeOfDay(hour: 0, minute: 0)}
    ],
    DateTime.utc(2024, 6, 1): [
      {'event': 'Hari Lahir Pancasila', 'time': TimeOfDay(hour: 0, minute: 0)}
    ],
    DateTime.utc(2024, 6, 17): [
      {'event': 'Hari Raya Idul Adha 1445 Hijriyah', 'time': TimeOfDay(hour: 0, minute: 0)}
    ],
    DateTime.utc(2024, 8, 17): [
      {'event': 'Hari Kemerdekaan Republik Indonesia', 'time': TimeOfDay(hour: 0, minute: 0)}
    ],
    DateTime.utc(2024, 9, 16): [
      {'event': 'Maulid Nabi Muhammad', 'time': TimeOfDay(hour: 0, minute: 0)}
    ],
    DateTime.utc(2024, 12, 25): [
      {'event': 'Hari Raya Natal', 'time': TimeOfDay(hour: 0, minute: 0)}
    ],
  };

  List<Map<String, dynamic>> _getEventsForDay(DateTime day) {
    return _events[DateTime.utc(day.year, day.month, day.day)] ?? [];
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  Future<void> _addEvent(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Tambah Acara'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextField(
                  controller: _eventController,
                  decoration: const InputDecoration(
                    hintText: 'Masukkan acara',
                  ),
                ),
                const SizedBox(height: 8),
                ListTile(
                  leading: const Icon(Icons.access_time),
                  title: const Text('Pilih Waktu'),
                  subtitle: Text(_selectedTime.format(context)),
                  onTap: () => _selectTime(context),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Batal'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Simpan'),
              onPressed: () {
                if (_eventController.text.isNotEmpty) {
                  setState(() {
                    if (_events[_selectedDay] == null) {
                      _events[_selectedDay!] = [];
                    }
                    _events[_selectedDay]!.add({
                      'event': _eventController.text,
                      'time': _selectedTime,
                    });
                  });
                  _eventController.clear();
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calendar Page',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              margin: const EdgeInsets.all(8.0),
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: TableCalendar(
                firstDay: DateTime.utc(2010, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: _focusedDay,
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                  _addEvent(context);
                },
                calendarStyle: CalendarStyle(
                  isTodayHighlighted: true,
                  selectedDecoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  todayDecoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  markerDecoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  titleTextStyle: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                  leftChevronIcon: const Icon(
                    Icons.chevron_left,
                    color: Colors.black,
                  ),
                  rightChevronIcon: const Icon(
                    Icons.chevron_right,
                    color: Colors.black,
                  ),
                ),
                calendarBuilders: CalendarBuilders(
                  selectedBuilder: (context, date, events) => Container(
                    margin: const EdgeInsets.all(6.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      date.day.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  todayBuilder: (context, date, events) => Container(
                    margin: const EdgeInsets.all(6.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      date.day.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _getEventsForDay(_focusedDay).length,
                itemBuilder: (context, index) {
                  final event = _getEventsForDay(_focusedDay)[index];
                  return ListTile(
                    leading: const Icon(Icons.event),
                    title: Text(event['event']),
                    subtitle: Text('Waktu: ${event['time'].format(context)}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
