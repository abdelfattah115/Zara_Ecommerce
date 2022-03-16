import 'package:e_commerce/logic/controller/auth_controller.dart';
import 'package:e_commerce/logic/controller/payment_controller.dart';
import 'package:e_commerce/routes/routes.dart';
import 'package:e_commerce/utils/themes.dart';
import 'package:e_commerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryContainerWidget extends StatefulWidget {
  const DeliveryContainerWidget({Key? key}) : super(key: key);

  @override
  _DeliveryContainerWidgetState createState() =>
      _DeliveryContainerWidgetState();
}

class _DeliveryContainerWidgetState extends State<DeliveryContainerWidget> {
  int groupRadioIndex = 1;
  bool changeColors = false;

  final TextEditingController phoneController = TextEditingController();
  final controller = Get.find<PaymentController>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          buildRadioContainer(
            color: changeColors ? Colors.white : Colors.grey.shade400,
            title: 'Zara Shop',
            phone: '056-285-998',
            name: 'zara store',
            value: 1,
            address: 'Egypt, Cairo',
            onChange: (int? value) {
              setState(() {
                groupRadioIndex = value!;
                changeColors = !changeColors;
              });
            },
            icon: Container(),
          ),
          const SizedBox(
            height: 10,
          ),
          Obx(
            () => buildRadioContainer(
              color: changeColors ? Colors.grey.shade400 : Colors.white,
              title: 'Delivery',
              phone: controller.phoneNumber.value,
              name: authController.displayUserName.value,
              value: 2,
              address: controller.address.value,
              onChange: (int? value) {
                setState(() {
                  groupRadioIndex = value!;
                  changeColors = !changeColors;
                });
                controller.updatePosition();
              },
              icon: InkWell(
                onTap: () {
                  Get.defaultDialog(
                    backgroundColor: Colors.white,
                    title: '',
                    textCancel: ' cancel ',
                    cancelTextColor: Colors.black,
                    textConfirm: ' save ',
                    confirmTextColor: Colors.black,
                    onCancel: () {
                      Get.toNamed(Routes.paymentScreen);
                    },
                    onConfirm: () {
                      Get.back();
                      controller.phoneNumber.value = phoneController.text;
                    },
                    buttonColor: Get.isDarkMode ? pinkClr : mainColor,
                    radius: 10,
                    content: Padding(
                      padding: const EdgeInsets.all(15),
                      child: TextField(
                        controller: phoneController,
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.text,
                        maxLength: 11,
                        onSubmitted: (value) {
                          phoneController.text = value;
                        },
                        decoration: InputDecoration(
                          fillColor: Get.isDarkMode
                              ? pinkClr.withOpacity(0.1)
                              : mainColor.withOpacity(0.2),
                          focusColor: Colors.red,
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Get.isDarkMode ? pinkClr : mainColor,
                          ),
                          suffixIcon: InkWell(
                            onTap: () {
                              phoneController.clear();
                            },
                            child: const Icon(
                              Icons.close,
                              color: Colors.black,
                            ),
                          ),
                          hintText: 'Enter your Phone Number',
                          hintStyle: const TextStyle(
                            color: Colors.black45,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                child: Icon(
                  Icons.contact_phone_outlined,
                  size: 20,
                  color: Get.isDarkMode ? pinkClr : mainColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRadioContainer({
    required Color color,
    required int value,
    required Function onChange,
    required String title,
    required String name,
    required String phone,
    required String address,
    required Widget icon,
  }) =>
      Container(
        height: 120,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 5.0,
              spreadRadius: 3.0,
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Radio(
              value: value,
              groupValue: groupRadioIndex,
              fillColor: MaterialStateColor.resolveWith(
                (states) => Colors.red,
              ),
              onChanged: (int? value) {
                onChange(value);
              },
            ),
            const SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextUtils(
                    text: title,
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    underLine: TextDecoration.none,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextUtils(
                    text: name,
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    underLine: TextDecoration.none,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextUtils(
                        text: '🇪🇬+02 $phone',
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        underLine: TextDecoration.none,
                      ),
                      const SizedBox(
                        width: 100,
                      ),
                      SizedBox(
                        child: icon,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextUtils(
                    text: address,
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    underLine: TextDecoration.none,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
