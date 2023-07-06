import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;
import 'package:societyadminapp/Module/Events/Model/Event.dart';
import '../../../Constants/api_routes.dart';
import '../../../Routes/set_routes.dart';
import '../../HomeScreen/Controller/home_screen_controller.dart';
import '../../../Model/User.dart';

class UpdateEventScreenController extends GetxController {
  final formKey = new GlobalKey<FormState>();

  late final User user;
  var arguments = Get.arguments;

  Data? eventData;

  TextEditingController eventTitleController = TextEditingController();
  TextEditingController eventDescriptionController = TextEditingController();
  TextEditingController eventStartDateController = TextEditingController();
  TextEditingController eventEndDateController = TextEditingController();
  int eventActive = 0;
  bool isCheckBox = false;
  bool isLoading = false;
  isEventActiveOrNot(newVal) {
    isCheckBox = newVal;
    if (isCheckBox == true) {
      eventActive = 1;
    } else if (isCheckBox != true) {
      eventActive = 0;
    }
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    user = arguments[0];

    eventData = arguments[1];
    eventTitleController.text = eventData!.title!;
    eventDescriptionController.text = eventData!.description!;
    eventStartDateController.text = eventData!.startdate!;
    eventEndDateController.text = eventData!.enddate!;
    eventActive = eventData!.active!;

    if (eventData!.active == 0) {
      isCheckBox = false;
    } else if (eventData!.active == 1) {
      isCheckBox = true;
    }
    update();
    // print(eventdata.id);
    // print(eventdata.title);
    // print(eventdata.description);
    // print(eventdata.startdate);
    // print(eventdata.enddate);
    // print(eventdata.active);
  }

  File? imageFile;

  Future StartDate(context) async {
    DateTime? picked = await showDatePicker(
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2020),
        lastDate: new DateTime(2030),
        context: context);
    if (picked != null) picked.toString();
    eventStartDateController.text = picked.toString().split(' ')[0];
    update();
  }

  Future EndDate(context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2020),
        lastDate: new DateTime(2030));
    if (picked != null) {
      picked.toString();

      eventEndDateController.text = picked.toString().split(' ')[0];
      update();
    }
  }

  Future updateEventApi(
      {required String token,
      required String eventTitle,
      required String eventDescription,
      required String eventStartDate,
      required String eventEndDate,
      required int eventActive,
      required int id}) async {
    print(id);

    isLoading = true;
    update();
    final response = await Http.post(
      Uri.parse(Api.updateEvent),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
      body: jsonEncode(<String, dynamic>{
        "title": eventTitle,
        "description": eventDescription,
        "startdate": eventStartDate,
        "enddate": eventEndDate,
        "active": eventActive,
        'id': id
      }),
    );

    if (response.statusCode == 200) {
      isLoading = false;
      update();
      var data = jsonDecode(response.body);
      print(data);
      print(response.statusCode);

      Get.offNamed(eventsscreen, arguments: user);

      Get.snackbar("Event Update Successfully", "");
    } else {
      Get.snackbar("Failed to Update Event", "");
    }
  }
}
