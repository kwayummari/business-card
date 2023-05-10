import 'package:business_card/src/functions/splash.dart';
import 'package:business_card/src/service/profile-service.dart';
import 'package:business_card/src/utils/app_const.dart';
import 'package:business_card/src/widgets/app_base_screen.dart';
import 'package:business_card/src/widgets/app_text.dart';
import 'package:flutter/material.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  var email;
  var id;
  var role;
  var profileData;
  @override
  void initState() {
    super.initState();
    getHome();
  }

  Future<void> getHome() async {
    final SplashFunction _splashService = await SplashFunction();
    final profileService profile = await profileService();
    final String email = await _splashService.getEmail();
    final String id = await _splashService.getId();
    final String role = await _splashService.getRole();
    final profileData = await profile.profile(context, id);

    setState(() {
      // Update the state synchronously with the retrieved data
      this.email = email;
      this.id = id;
      this.role = role;
      this.profileData = profileData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBaseScreen(
        isvisible: false,
        backgroundImage: false,
        backgroundAuth: false,
        child: Container(
          width: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 0.2,
                color: Colors.grey,
              ),
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              ListTile(
                title: AppText(
                  txt: profileData != null
                      ? profileData[0]['fullname']
                      : 'loading...',
                  size: 25,
                  color: AppConst.white,
                  weight: FontWeight.w900,
                ),
                subtitle: Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: AppConst.primary,
                    ),
                    AppText(
                      txt: '5.0',
                      size: 15,
                      color: AppConst.grey,
                    )
                  ],
                ),
                trailing: CircleAvatar(
                  backgroundColor: AppConst.primary,
                  child: Icon(
                    Icons.person,
                    color: AppConst.white,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    height: 70,
                    width: 100,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppConst.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                        color: AppConst.white,
                        width: 2.0,
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Icon(
                          Icons.help,
                          size: 30,
                          color: AppConst.primary,
                        ),
                        AppText(
                          txt: 'Help',
                          size: 15,
                          color: AppConst.black,
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 70,
                    width: 100,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppConst.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                        color: AppConst.white,
                        width: 2.0,
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Icon(
                          Icons.settings,
                          size: 30,
                          color: AppConst.primary,
                        ),
                        AppText(
                          txt: 'Settings',
                          size: 15,
                          color: AppConst.black,
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 70,
                    width: 100,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppConst.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                        color: AppConst.white,
                        width: 2.0,
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Icon(
                          Icons.logout,
                          size: 30,
                          color: AppConst.primary,
                        ),
                        AppText(
                          txt: 'Sign Out',
                          size: 15,
                          color: AppConst.black,
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppConst.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                    color: AppConst.white,
                    width: 2.0,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: AppText(
                      txt: 'Safety check-up',
                      size: 15,
                      weight: FontWeight.w900,
                    ),
                    subtitle: AppText(
                        txt:
                            'From planning your route to tracking your bus, our daladala app does it all - download it now!',
                        size: 15),
                    trailing: CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage('assets/ads.jpg'),
                    ),
                  ),
                ),
              ),
              Divider(
                color: AppConst.grey,
                thickness: 3,
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                leading: Icon(
                  Icons.person,
                  color: AppConst.white,
                ),
                title: AppText(
                  txt: profileData != null
                      ? profileData[0]['fullname']
                      : 'loading...',
                  color: AppConst.white,
                  size: 15,
                  weight: FontWeight.w900,
                ),
                trailing: IconButton(
                    onPressed: () => null,
                    icon: Icon(
                      Icons.edit,
                      color: AppConst.grey,
                    )),
              ),
              ListTile(
                leading: Icon(
                  Icons.phone,
                  color: AppConst.white,
                ),
                title: AppText(
                  txt: profileData != null
                      ? profileData[0]['phone']
                      : 'loading...',
                  color: AppConst.white,
                  size: 15,
                  weight: FontWeight.w900,
                ),
                trailing: IconButton(
                    onPressed: () => null,
                    icon: Icon(
                      Icons.edit,
                      color: AppConst.grey,
                    )),
              ),
              ListTile(
                leading: Icon(
                  Icons.mail,
                  color: AppConst.white,
                ),
                title: AppText(
                  txt: email,
                  size: 15,
                  color: AppConst.white,
                  weight: FontWeight.w900,
                ),
                trailing: IconButton(
                    onPressed: () => null,
                    icon: Icon(
                      Icons.edit,
                      color: AppConst.grey,
                    )),
              ),
              ListTile(
                leading: Icon(
                  Icons.supervised_user_circle,
                  color: AppConst.white,
                ),
                title: AppText(
                  txt: role == '0' ? 'Client' : 'Driver',
                  color: AppConst.white,
                  size: 15,
                  weight: FontWeight.w900,
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.security,
                  color: AppConst.white,
                ),
                title: AppText(
                  txt: 'Legal',
                  color: AppConst.white,
                  size: 15,
                  weight: FontWeight.w900,
                ),
              )
            ],
          ),
        ));
  }
}
