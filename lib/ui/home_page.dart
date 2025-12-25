import 'package:flutter/material.dart';
import 'package:remainder_app_offline/core/constants/app_colors.dart';
import 'package:remainder_app_offline/core/widgets/custom_buttom.dart';
import 'package:remainder_app_offline/core/widgets/custom_text.dart';
import 'package:remainder_app_offline/core/widgets/custom_textfield.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _remainderTitleController = TextEditingController();
  TextEditingController _remainderDescriptionController =
      TextEditingController();
  TextEditingController _sheduleDateAndTimeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: CustomText(
            text: 'Home',
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        body: Column(),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showAddRemainderBottomSheet();
          
          },
          shape: CircleBorder(),
          child: Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }

 

  showAddRemainderBottomSheet() {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: CustomText(
                      text: 'Add Remainder',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  CustomTextField(
                    controller: _remainderTitleController,
                    hintText: 'Enter Title',
                    title: 'Remainder Title',
                  ),
                  CustomTextField(
                    controller: _remainderDescriptionController,
                    hintText: 'Enter Description',
                    title: 'Remainder Description',
                  ),
                  CustomTextField(
                    controller: _sheduleDateAndTimeController,
                    hintText: 'Selete Date and Time',
                    title: 'Remainder Date and Time',
                    icon: Icons.calendar_month,
                  ),
                  CustomButton(title: 'Submit', ontap: (){})
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
