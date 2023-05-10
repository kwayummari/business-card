import 'package:business_card/routes/route-names.dart';
import 'package:business_card/src/provider/login-provider.dart';
import 'package:business_card/src/service/business-service.dart';
import 'package:business_card/src/utils/app_const.dart';
import 'package:business_card/src/widgets/app_base_screen.dart';
import 'package:business_card/src/widgets/app_button.dart';
import 'package:business_card/src/widgets/app_input_text.dart';
import 'package:business_card/src/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  @override
  void initState() {
    super.initState();
  }

  TextEditingController name = TextEditingController();
  TextEditingController job = TextEditingController();
  TextEditingController company = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController url = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final myProvider = Provider.of<MyProvider>(context);
    return AppBaseScreen(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppConst.primary,
          centerTitle: true,
          title: AppText(
            txt: 'Business Card Generation',
            size: 15,
            color: AppConst.white,
          ),
        ),
        isvisible: false,
        backgroundImage: false,
        backgroundAuth: false,
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            AppText(
              txt:
                  'Congratulations on taking the first step to creating your professional business card! In order to generate your card, we need your information. Don\'t worry, it\'s quick and easy. Simply fill in the fields below with your name, job title, company name, phone number, and email address. This information will help you to make a great first impression and showcase your skills and expertise. Don\'t miss out on this opportunity to create your personalized business card. Fill in your details now and let\'s get started',
              size: 15,
              color: AppConst.white,
              weight: FontWeight.bold,
            ),
            AppInputText(
                textfieldcontroller: name,
                ispassword: false,
                isemail: false,
                fillcolor: AppConst.primary,
                label: 'Name',
                obscure: false),
            AppInputText(
                textfieldcontroller: job,
                ispassword: false,
                isemail: false,
                fillcolor: AppConst.primary,
                label: 'Job Title',
                obscure: false),
            AppInputText(
                textfieldcontroller: company,
                ispassword: false,
                isemail: false,
                fillcolor: AppConst.primary,
                label: 'Company Name',
                obscure: false),
            AppInputText(
                textfieldcontroller: phone,
                ispassword: false,
                isemail: false,
                fillcolor: AppConst.primary,
                label: 'Phone Number',
                obscure: false),
            AppInputText(
                textfieldcontroller: email,
                ispassword: false,
                isemail: true,
                fillcolor: AppConst.primary,
                label: 'Email Address',
                obscure: false),
            AppInputText(
                textfieldcontroller: url,
                ispassword: false,
                isemail: false,
                fillcolor: AppConst.primary,
                label: 'Website Url',
                obscure: false),
            SizedBox(
              height: 20,
            ),
            myProvider.myLoging == true
                ? SpinKitCircle(
                    color: AppConst.primary,
                  )
                : Container(
                    width: 350,
                    height: 55,
                    child: AppButton(
                      onPress: () => Navigator.pushNamed(context, RouteNames.myImagePage),
                      // BusinessService()
                      //     .Business(context, email.text, name.text),
                      label: 'Submit to generate card',
                      borderRadius: 20,
                      textColor: AppConst.white,
                      bcolor: AppConst.primary,
                    ),
                  ),
            SizedBox(
              height: 100,
            )
          ],
        ));
  }
}
