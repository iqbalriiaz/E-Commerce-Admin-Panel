import 'package:ecommerce_api/providers/admin_profile_provider.dart';
import 'package:ecommerce_api/screen/authentication/splash_screen.dart';
import 'package:ecommerce_api/widget/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String profileImageUrl =
      'https://i2-prod.walesonline.co.uk/news/uk-news/article23927263.ece/ALTERNATES/s615/0_F038F02A-D11F-11EC-A042-0A2111BCB09D.jpg';

  logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove('token');
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => SplashScreen()),
        (route) => false);
  }

  @override
  void initState() {
    Provider.of<AdminProfileProvider>(context, listen: false)
        .getAdminProfileListData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final adminProfileList =
        Provider.of<AdminProfileProvider>(context).adminProfileList;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipOval(
                child: Image.network(
              profileImageUrl,
              fit: BoxFit.cover,
              height: 150,
              width: 150,
            )),
            SizedBox(
              height: 20,
            ),

            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: GestureDetector(
                onTap: () {
                  logout();
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade300,
                  ),
                  child: ListTile(
                    leading: Icon(Icons.logout),
                    title: Text(
                      "Logout",
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
