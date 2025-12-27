import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remainder_app_offline/controllers/remainder_controllers.dart';
import 'package:remainder_app_offline/core/constants/app_colors.dart';
import 'package:remainder_app_offline/core/helper/date_time_convertor.dart';
import 'package:remainder_app_offline/core/helper/date_time_selection.dart';
import 'package:remainder_app_offline/core/widgets/custom_buttom.dart';
import 'package:remainder_app_offline/core/widgets/custom_icon.dart';
import 'package:remainder_app_offline/core/widgets/custom_text.dart';
import 'package:remainder_app_offline/core/widgets/custom_textfield.dart';
import 'package:remainder_app_offline/data/models/remainder_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _remainderTitleController = TextEditingController();
  TextEditingController _remainderDescriptionController =
      TextEditingController();
  TextEditingController _remainderDateAndTimeController =
      TextEditingController();

  DateTime? _remaindeDateTime;
  bool isUpdate=false;
  final RemainderControllers remainderController = Get.find();

  clearAllFields() {
    _remainderTitleController.clear();
    _remainderDescriptionController.clear();
    _remainderDateAndTimeController.clear();
  }

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
        body: Column(
          children: [
            Obx(() {
              if (remainderController.remainders.isEmpty) {
                return Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Center(child: CustomText(text: 'No Remainders found')),
                );
              } else {
                return Expanded(
                  child: ListView.builder(
                    itemCount: remainderController.remainders.length,
                    itemBuilder: (context, index) {
                      final data = remainderController.remainders[index];
                      return Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                          left: 10,
                          right: 10,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 300,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          text: data.title,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            bottom: 10,
                                          ),
                                          child: CustomText(
                                            text: data.description,
                                          ),
                                        ),
                                        CustomText(
                                          text: dateTimeConvertor(
                                            data.dateTime,
                                          ),
                                          color:
                                              DateTime.now().isBefore(
                                                data.dateTime,
                                              )
                                              ? Colors.green
                                              : Colors.red,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                Column(
                                  children: [
                                    CustomIcon(icon: Icons.edit, onTap: () {
                                      isUpdate=true;
                                      showAddRemainderBottomSheet(remainderModel:data );
                                      _remainderTitleController.text=data.title;
                                      _remainderDescriptionController.text=data.description;
                                      _remainderDateAndTimeController.text=dateTimeConvertor(data.dateTime);
                                    }),
                                    SizedBox(height: 20),
                                    CustomIcon(
                                      icon: Icons.delete,
                                      onTap: () {
                                        remainderController.deleteRemainders(
                                          data.key,
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            }),
          ],
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            isUpdate=false;
            showAddRemainderBottomSheet();
          },
          shape: CircleBorder(),
          child: Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }

  showAddRemainderBottomSheet({RemainderModel? remainderModel}) {
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
                    readonly: true,
                    controller: _remainderDateAndTimeController,
                    hintText: 'Selete Date and Time',
                    title: 'Remainder Date and Time',
                    icon: Icons.calendar_month,
                    ontap: () async {
                      _remaindeDateTime = await selectDateTime(context);

                      _remainderDateAndTimeController.text = dateTimeConvertor(
                        _remaindeDateTime!,
                      );
                    },
                  ),
                  CustomButton(
                    title: 'Submit',
                    ontap: () async {
                      if (isUpdate) {
                        await remainderController.updateRemainders(remainderModel!.key, RemainderModel(
                          title: _remainderTitleController.text,
                          description: _remainderDescriptionController.text,
                          dateTime: _remaindeDateTime!,
                        ),);
                      } else {
                           await remainderController.addRemainders(
                        RemainderModel(
                          title: _remainderTitleController.text,
                          description: _remainderDescriptionController.text,
                          dateTime: _remaindeDateTime!,
                        ),
                      );
                      }
                   
                      Get.back();
                      clearAllFields();
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
