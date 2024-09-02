import 'package:draft_website/core/button_widget.dart';
import 'package:draft_website/core/clickable_widget.dart';
import 'package:draft_website/core/consts.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class TrainingScreen extends StatefulWidget {
  final Function()? onBackTap;

  const TrainingScreen({
    super.key,
    this.onBackTap,
  });

  @override
  State<TrainingScreen> createState() => _TrainingScreenState();
}

class _TrainingScreenState extends State<TrainingScreen> {
  DateTime selectedDate = DateTime.now();

  bool isDateOpen = false;
  String selectedType = '';
  String selectedRecurring = '';

  final List<String> typeItems = [
    "Section Type",
  ];
  final List<String> recurringItems = [
    "Recurring Option",
  ];

  @override
  void initState() {
    selectedType = typeItems[0];
    selectedRecurring = recurringItems[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        InkWellWidget(
          onTap: widget.onBackTap,
          child: Row(
            children: <Widget>[
              SvgPicture.asset("assets/web_icons/left_side.svg"),
              const SizedBox(width: 10),
              const Text(
                "Back / Friendly Match",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Color(0xFF4F4F4F),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    "Friendly Match",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: textColorOne,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Schedule Training Session",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: textColorOne,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            ButtonWidget(
              height: 46,
              width: 150,
              text: "Send Invitation",
              borderRadius: 10,
              btnColor: const Color(0xFF1976D2),
              borderColor: const Color(0xFF1976D2),
              textColor: whiteColor,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              onPressed: () {},
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    "Opponent",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Color(0xFF23303B),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Container(
                    height: 55,
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 10, right: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: whiteColor,
                    ),
                    child: Theme(
                      data: ThemeData(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          isExpanded: true,
                          iconStyleData: IconStyleData(
                            icon: SvgPicture.asset(
                              "assets/web_icons/down_side.svg",
                            ),
                          ),
                          selectedItemBuilder: (BuildContext context) {
                            return typeItems.map<Widget>((String item) {
                              return Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Text(
                                    item,
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                      color: Color(0xFF8E949A),
                                      fontSize: 16,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w500,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              );
                            }).toList();
                          },
                          items: typeItems
                              .map(
                                (item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: item == selectedType
                                      ? Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: Text(
                                            item,
                                            style: const TextStyle(
                                              color: blackColor,
                                              fontSize: 16,
                                              fontFamily: "Poppins",
                                              fontWeight: FontWeight.w500,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: Text(
                                            item,
                                            style: const TextStyle(
                                              color: Color(0xFF8E949A),
                                              fontSize: 14,
                                              fontFamily: "Poppins",
                                              fontWeight: FontWeight.w400,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                ),
                              )
                              .toList(),
                          value: selectedType,
                          onChanged: (value) {
                            setState(() {
                              selectedType = value as String;
                            });
                          },
                          buttonStyleData: const ButtonStyleData(
                            height: 48,
                            width: double.infinity,
                            padding: EdgeInsets.only(
                              left: 10,
                              right: 10,
                            ),
                          ),
                          dropdownStyleData: DropdownStyleData(
                            maxHeight: 200,
                            elevation: 0,
                            offset: const Offset(0, -5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: whiteColor,
                            ),
                            scrollbarTheme: ScrollbarThemeData(
                              radius: const Radius.circular(40),
                              thickness: MaterialStateProperty.all(2),
                              thumbVisibility: MaterialStateProperty.all(true),
                            ),
                          ),
                          menuItemStyleData: const MenuItemStyleData(
                            height: 48,
                            padding: EdgeInsets.only(left: 10, right: 10),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Recurring",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Color(0xFF23303B),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Container(
                    height: 55,
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 10, right: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: whiteColor,
                    ),
                    child: Theme(
                      data: ThemeData(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          isExpanded: true,
                          iconStyleData: IconStyleData(
                            icon: SvgPicture.asset(
                              "assets/web_icons/down_side.svg",
                            ),
                          ),
                          selectedItemBuilder: (BuildContext context) {
                            return recurringItems.map<Widget>((String item) {
                              return Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Text(
                                    item,
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                      color: Color(0xFF8E949A),
                                      fontSize: 16,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w500,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              );
                            }).toList();
                          },
                          items: recurringItems
                              .map(
                                (item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: item == selectedRecurring
                                      ? Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: Text(
                                            item,
                                            style: const TextStyle(
                                              color: blackColor,
                                              fontSize: 16,
                                              fontFamily: "Poppins",
                                              fontWeight: FontWeight.w500,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: Text(
                                            item,
                                            style: const TextStyle(
                                              color: Color(0xFF8E949A),
                                              fontSize: 14,
                                              fontFamily: "Poppins",
                                              fontWeight: FontWeight.w400,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                ),
                              )
                              .toList(),
                          value: selectedRecurring,
                          onChanged: (value) {
                            setState(() {
                              selectedRecurring = value as String;
                            });
                          },
                          buttonStyleData: const ButtonStyleData(
                            height: 48,
                            width: double.infinity,
                            padding: EdgeInsets.only(
                              left: 10,
                              right: 10,
                            ),
                          ),
                          dropdownStyleData: DropdownStyleData(
                            maxHeight: 200,
                            elevation: 0,
                            offset: const Offset(0, -5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: whiteColor,
                            ),
                            scrollbarTheme: ScrollbarThemeData(
                              radius: const Radius.circular(40),
                              thickness: MaterialStateProperty.all(2),
                              thumbVisibility: MaterialStateProperty.all(true),
                            ),
                          ),
                          menuItemStyleData: const MenuItemStyleData(
                            height: 48,
                            padding: EdgeInsets.only(left: 10, right: 10),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    "Date Picker",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Color(0xFF23303B),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  InkWellWidget(
                    onTap: () {
                      setState(() {
                        isDateOpen = !isDateOpen;
                      });
                    },
                    child: Container(
                      height: 55,
                      width: double.infinity,
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: whiteColor,
                      ),
                      child: Center(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                DateFormat('yyyy-MM-dd H:m')
                                    .format(selectedDate),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Color(0xFF8E949A),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            RotatedBox(
                              quarterTurns: isDateOpen ? 2 : 0,
                              child: SvgPicture.asset(
                                  "assets/web_icons/down_side.svg"),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (isDateOpen)
                    Container(
                      margin: const EdgeInsets.only(top: 6),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          TableCalendar(
                            startingDayOfWeek: StartingDayOfWeek.monday,
                            headerStyle: const HeaderStyle(
                              formatButtonVisible: false,
                              headerPadding: EdgeInsets.symmetric(vertical: 20),
                              titleTextStyle: TextStyle(
                                color: Color(0xFF131A29),
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                              headerMargin: EdgeInsets.only(bottom: 20),
                              leftChevronMargin: EdgeInsets.zero,
                              leftChevronPadding: EdgeInsets.zero,
                              rightChevronMargin: EdgeInsets.zero,
                              rightChevronPadding: EdgeInsets.zero,
                              titleCentered: true,
                            ),
                            calendarStyle: CalendarStyle(
                              outsideDaysVisible: true,
                              outsideTextStyle: const TextStyle(
                                color: Color(0xFFC4C4C4),
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                              defaultTextStyle: const TextStyle(
                                color: Color(0xFF131A29),
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                              weekendTextStyle: const TextStyle(
                                color: Color(0xFF131A29),
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                              selectedTextStyle: const TextStyle(
                                color: whiteColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                              todayTextStyle: const TextStyle(
                                color: whiteColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                              weekNumberTextStyle: const TextStyle(
                                color: Color(0xFF131A29),
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                              defaultDecoration: BoxDecoration(
                                color: const Color(0xFFF5F5F5),
                                borderRadius: BorderRadius.circular(7),
                              ),
                              weekendDecoration: BoxDecoration(
                                color: const Color(0xFFF5F5F5),
                                borderRadius: BorderRadius.circular(7),
                              ),
                              selectedDecoration: BoxDecoration(
                                color: const Color(0xFF1F5EFF),
                                borderRadius: BorderRadius.circular(7),
                              ),
                              todayDecoration: BoxDecoration(
                                color: Colors.yellowAccent,
                                borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                            currentDay: selectedDate,
                            pageJumpingEnabled: true,
                            selectedDayPredicate: (day) {
                              return isSameDay(selectedDate, day);
                            },
                            onDaySelected: (selectedDay, focusedDay) {
                              setState(() {
                                selectedDate = selectedDay;
                              });
                            },
                            firstDay: DateTime.utc(2010, 10, 16),
                            lastDay: DateTime.utc(2030, 3, 14),
                            focusedDay: selectedDate,
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: ButtonWidget(
                                  text: "Cancel",
                                  height: 40,
                                  borderRadius: 7,
                                  btnColor: const Color(0xFFDDDDDD),
                                  borderColor: const Color(0xFFDDDDDD),
                                  textColor: const Color(0xFF888888),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                  onPressed: () {},
                                ),
                              ),
                              const SizedBox(width: 14),
                              Expanded(
                                child: ButtonWidget(
                                  text: "Choose Date",
                                  height: 40,
                                  borderRadius: 7,
                                  btnColor: const Color(0xFF1D5EFF),
                                  borderColor: const Color(0xFF1D5EFF),
                                  textColor: whiteColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                  onPressed: () {},
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
