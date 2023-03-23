import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../helpers/my_colors.dart';
import '../helpers/my_text.dart';

class AddAdderess extends StatefulWidget {
  const AddAdderess({Key? key}) : super(key: key);

  @override
  State<AddAdderess> createState() => _AddAdderessState();
}

class _AddAdderessState extends State<AddAdderess> {
  @override
  Widget build(BuildContext context) {
    final _fromKey = GlobalKey<FormState>();
    TextEditingController _nameController = TextEditingController();
    TextEditingController _phoneController = TextEditingController();
    TextEditingController _emailController = TextEditingController();
    TextEditingController _addressController = TextEditingController();

    return Scaffold(
      backgroundColor: MyColors.primary,
      appBar: AppBar(
        elevation: 0,
        title: Text(MyText.add_address),
        backgroundColor: MyColors.primary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 5.h,
              ),
              Form(
                  key: _fromKey,
                  child: Column(
                    children: [
                      _textField(_nameController, "Customer's name", (value) {
                        if (value == null || value.isEmpty) {
                          return "No Name";
                        }
                      },TextInputType.text),
                      _textField(_phoneController, "Customer's phone number",
                          (value) {
                        if (value == null || value.isEmpty) {
                          return "No Phone Number";
                        }else if(value.length < 8){
                          return "Phone Number must be greater than 7 char";
                        }
                      },TextInputType.number),
                      _textField(_emailController, "Customer's email", (value) {
                        if (value == null || value.isEmpty) {
                          return "No Email";
                        }else if(!value.contains("@")){
                          return "Email invalid";
                        }
                      },TextInputType.emailAddress),
                      TextFormField(
                          controller: _addressController,
                          cursorColor: MyColors.normal,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "No Address";
                            }
                          },
                          style: TextStyle(
                              color: MyColors.normal,
                              fontWeight: FontWeight.w500),
                          maxLines: 5,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15.w, vertical: 5.w),
                            hintText: "Customer's address",
                            hintStyle: TextStyle(color: MyColors.hint),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: MyColors.normal),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: MyColors.normal),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 1.5.w),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 1.5.w),
                            ),
                          ))
                    ],
                  )),
              SizedBox(
                height: 30.h,
              ),
              ElevatedButton(
                  onPressed: () {
                    String name = _nameController.text;
                    String phone = _phoneController.text;
                    String email = _emailController.text;
                    String address = _addressController.text;

                    if (_fromKey.currentState!.validate()) {
                      Get.back(result: [name,phone,email,address]);
                    }

                    
                  },
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      primary: MyColors.accent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.r))),
                  child: Text(
                    MyText.add_address,
                    style: TextStyle(
                        color: MyColors.normal,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textField(
      TextEditingController controller, String hint_text, validate,keyType) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: TextFormField(
          controller: controller,
          keyboardType: keyType,
          cursorColor: MyColors.normal,
          validator: validate,
          style: TextStyle(color: MyColors.normal, fontWeight: FontWeight.w500),
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.w),
            hintText: hint_text,
            hintStyle: TextStyle(color: MyColors.hint),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyColors.normal),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyColors.normal),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1.5.w),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1.5.w),
            ),
          )),
    );
  }
}
