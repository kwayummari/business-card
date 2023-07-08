import 'package:business_card/src/utils/app_const.dart';
import 'package:flutter/material.dart';
import 'package:business_card/routes/route-names.dart';
import 'package:business_card/src/service/registration-services.dart';
import 'package:business_card/src/widgets/app_base_screen.dart';
import 'package:business_card/src/widgets/app_button.dart';
import 'package:business_card/src/widgets/app_input_text.dart';
import 'package:business_card/src/widgets/app_text.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final registrationService _apiService = registrationService();
  TextEditingController fullname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController rpassword = TextEditingController();
  TextEditingController phone = TextEditingController();
  bool dont_show_password = true;
  bool obscure = true;
  bool obscure1 = true;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return AppBaseScreen(
      bgcolor: AppConst.black,
      isvisible: false,
      backgroundImage: false,
      backgroundAuth: false,
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: AppText(
                  txt: 'Create your Account',
                  size: 30,
                  weight: FontWeight.w900,
                  color: AppConst.white,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(color: AppConst.black),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    children: [
                      AppInputText(
                        isemail: false,
                        textfieldcontroller: fullname,
                        ispassword: false,
                        fillcolor: AppConst.primary,
                        label: 'Fullname',
                        obscure: false,
                        icon: Icon(
                          Icons.person,
                          color: AppConst.white,
                        ),
                      ),
                      AppInputText(
                        isemail: false,
                        isPhone: true,
                        textfieldcontroller: phone,
                        ispassword: false,
                        fillcolor: AppConst.primary,
                        label: 'Phone number',
                        obscure: false,
                        icon: Icon(
                          Icons.phone,
                          color: AppConst.white,
                        ),
                      ),
                      AppInputText(
                          isemail: true,
                          textfieldcontroller: email,
                          ispassword: false,
                          fillcolor: AppConst.primary,
                          label: 'Email',
                          obscure: false),
                      AppInputText(
                        isemail: false,
                        suffixicon: IconButton(
                            onPressed: () {
                              setState(() {
                                obscure = !obscure;
                              });
                            },
                            icon: obscure == true
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility)),
                        textfieldcontroller: password,
                        ispassword: true,
                        fillcolor: AppConst.primary,
                        label: 'Password',
                        obscure: obscure,
                        icon: Icon(
                          Icons.lock,
                          color: AppConst.white,
                        ),
                      ),
                      AppInputText(
                        isemail: false,
                        suffixicon: IconButton(
                            onPressed: () {
                              setState(() {
                                obscure1 = !obscure1;
                              });
                            },
                            icon: obscure1 == true
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility)),
                        textfieldcontroller: rpassword,
                        ispassword: false,
                        fillcolor: AppConst.primary,
                        label: 'Password',
                        obscure: obscure1,
                        icon: Icon(
                          Icons.lock,
                          color: AppConst.white,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: 350,
                        height: 55,
                        child: AppButton(
                          onPress: () {
                            if (!_formKey.currentState!.validate()) {
                              return;
                            }
                            registrationService().registration(
                                context,
                                email.text,
                                password.text,
                                rpassword.text,
                                fullname.text,
                                phone.text);
                          },
                          label: 'SIGN UP',
                          borderRadius: 20,
                          textColor: AppConst.white,
                          bcolor: AppConst.primary,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 12, right: 8, top: 8, bottom: 8),
                        child: GestureDetector(
                          onTap: () =>
                              Navigator.pushNamed(context, RouteNames.login),
                          child: Row(
                            children: [
                              AppText(
                                txt: 'Already have an account?',
                                size: 15,
                                color: AppConst.white,
                                weight: FontWeight.w400,
                              ),
                              AppText(
                                txt: 'Sign In',
                                size: 15,
                                color: AppConst.primary,
                                weight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
