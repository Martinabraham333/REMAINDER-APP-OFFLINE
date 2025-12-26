import 'package:flutter/material.dart';
import 'package:remainder_app_offline/core/app_colors.dart';
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
            // showtest();
          },
          shape: CircleBorder(),
          child: Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }

  // showBottom(){
  //   return DraggableScrollabl
  // }
  showtest() {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.5,
          minChildSize: 0.3,
          maxChildSize: 0.5,
          builder: (context, scrollController) {
            return Column(
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
              ],
            );
          },
        );
      },
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
            ],
          ),
        );
      },
    );
  }
}
