import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';


class MainHomePage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<MainHomePage> {
  late final ValueNotifier<List<DateTime>> _selectedEvents;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    _selectedEvents = ValueNotifier([]);
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  // 특정 날짜에 대한 이벤트를 가져오는 함수
  List<DateTime> _getEventsForDay2(DateTime day) {
    // 예시로, 선택한 날짜에 이벤트를 추가할 수 있습니다.
    return [day]; // 선택한 날짜를 이벤트로 추가
  }

  final Map<DateTime, List<DateTime>> kEvents = {
    DateTime(2024, 11, 15): [DateTime(2024, 11, 15)],
    DateTime(2024, 11, 20): [DateTime(2024, 11, 20)],
    // 다른 날짜에 대한 이벤트 추가 가능
  };

  // 날짜 비교 함수
  bool isSameDate(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  List<DateTime> _getEventsForDay(DateTime day) {
    // kEvents에서 해당 날짜와 같은 날짜의 이벤트를 가져옴
    return kEvents.entries
        .where((entry) => isSameDate(entry.key, day))
        .expand((entry) => entry.value)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MCD'),
      ),
      body: Column(
        children: [
          TableCalendar<DateTime>(
            // 언어를 한글로 설정 (포스팅 아래 내용 확인 -> intl 라이브러리 )
            locale: 'ko_KR',
            // 최소 년도
            firstDay: DateTime(1800),
            // 최대 년도
            lastDay: DateTime(3000),
            // 포커싱 날짜 (오늘 날짜를 기준으로 함)
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
                _selectedEvents.value = _getEventsForDay(selectedDay);
              });
            },
            eventLoader: (day) {
              return _getEventsForDay(day);  // 특정 날짜에 대한 이벤트만 로드
            },
            headerStyle: HeaderStyle(
              // default로 설정 돼 있는 2 weeks 버튼을 없애줌 (2주단위로 보기 버튼)
              formatButtonVisible: false,
              // 달력 타이틀을 센터로
              titleCentered: true,
              //타이틀 텍스트 스타일링
              titleTextStyle: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16.0,
              ),
            ),


          ),
          const SizedBox(height: 8.0),
          Expanded(
            child: ValueListenableBuilder<List<DateTime>>(
              valueListenable: _selectedEvents,
              builder: (context, value, _) {
                return ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('선택한 날짜: ${value[index]}'),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}




