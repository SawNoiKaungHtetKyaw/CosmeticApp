import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                  child: Column(
                children: [
                  _textField(_nameController, "Customer's name"),
                  _textField(_phoneController, "Customer's phone number"),
                  _textField(_emailController, "Customer's email"),
                  TextFormField(
                      controller: _addressController,
                      cursorColor: MyColors.normal,
                      style: TextStyle(
                          color: MyColors.normal, fontWeight: FontWeight.w500),
                      maxLines: 5,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.w),
                        hintText: "Customer's address",
                        hintStyle: TextStyle(color: MyColors.hint),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: MyColors.normal),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: MyColors.normal),
                        ),
                      ))
                ],
              )),

              
               SizedBox(height: 30.h,),

              ElevatedButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                primary: MyColors.accent,
                shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.r)
                )
              ),
               child: Text(
                MyText.add_address,
               
               style: TextStyle(
              color: MyColors.normal,
              fontSize : 14.sp,
              fontWeight: FontWeight.bold
               ),)
               ),

            ],
          ),
        ),
      ),
    );
  }

  Widget _textField(TextEditingController controller, String hint_text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: TextFormField(
          controller: controller,
          cursorColor: MyColors.normal,
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
          )),
    );
  }
}
