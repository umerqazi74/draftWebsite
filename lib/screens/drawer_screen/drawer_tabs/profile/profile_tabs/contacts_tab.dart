import 'package:draft_website/core/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactsTab extends StatefulWidget {
  const ContactsTab({super.key});

  @override
  State<ContactsTab> createState() => _ContactsTabState();
}

class _ContactsTabState extends State<ContactsTab> {
  TextEditingController myMobileController = TextEditingController();
  TextEditingController myEmailController = TextEditingController();

  @override
  void initState() {
    myMobileController.text = "+1 123 3698 789";
    myEmailController.text = "support@fintech.com";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(left: 20),
        padding: const EdgeInsets.only(left: 20),
        decoration: const BoxDecoration(
          border: Border(
            left: BorderSide(
              color: Color(0xFFD7DCE4),
              width: 1,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              "Contacts",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Color(0xFF23303B),
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Call Us",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Color(0xFF23303B),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              width: 330,
              child: IgnorePointer(
                child: TextFormFieldWidget(
                  myController: myMobileController,
                  prefixWidget:
                      SvgPicture.asset("assets/web_icons/call.svg"),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Email",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Color(0xFF23303B),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              width: 330,
              child: IgnorePointer(
                child: TextFormFieldWidget(
                  myController: myEmailController,
                  prefixWidget:
                      SvgPicture.asset("assets/web_icons/mail.svg"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
