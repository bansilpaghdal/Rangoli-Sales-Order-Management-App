import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rangoli/screens/registering_user/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:fluttertoast/fluttertoast.dart';

class MainDrawer extends StatefulWidget {
  final Animation<Offset>? slideanimation;
  Animation<double>? slidescaleanimation;
  MainDrawer({this.slideanimation, this.slidescaleanimation});
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  final _auth = FirebaseAuth.instance;
  late double width, height;
  TextEditingController _textController = TextEditingController();
  bool isShowToast = false;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Material(
      child: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xFFCCFFDC)!, Color(0xFFCCFFDC)!],
                    begin: Alignment.bottomRight,
                    end: Alignment.centerLeft)),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: ScaleTransition(
                  scale: widget.slidescaleanimation!,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(25, 30, width / 2.2, 20),
                    child: Text(
                      'Voila !',
                      style: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'dancing'),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: ScaleTransition(
                  scale: widget.slidescaleanimation!,
                  child: SlideTransition(
                    position: widget.slideanimation!,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: width / 1.7,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            // mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                child: AutoSizeText(
                                  'Contact Us',
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 35, fontFamily: 'dancing'),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              GestureDetector(
                                onTap: () async {
                                  await launch(
                                      'https://goo.gl/maps/hvTwdpWv4UFsEVCs6');
                                },
                                child: Container(
                                  width: width / 2,
                                  child: AutoSizeText(
                                    '6, Ambika Niketan, Bhaiyanagar, Punagam, Surat - 395010',
                                    textAlign: TextAlign.center,
                                    maxLines: 3,
                                    style: TextStyle(
                                        fontFamily: 'dancing', fontSize: 15),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Material(
                                  borderRadius: BorderRadius.circular(10),
                                  elevation: 8,
                                  color: Colors.lightBlueAccent,
                                  child: Container(
                                    // height: 35,
                                    width: width / 2,
                                    child: InkWell(
                                      onTap: () async {
                                        await Clipboard.setData(ClipboardData(
                                            text: 'ANKPP6671M1ZB'));
                                        // if (!isShowToast) {
                                        //   isShowToast = true;
                                        //   Fluttertoast.showToast(
                                        //           msg:
                                        //               "ANKPP6671M copied to your clipboard",
                                        //           toastLength:
                                        //               Toast.LENGTH_SHORT,
                                        //           gravity: ToastGravity.BOTTOM,
                                        //           timeInSecForIosWeb: 1,
                                        //           backgroundColor: Colors.black,
                                        //           textColor: Colors.white,
                                        //           fontSize: 13.0)
                                        //       .then((value) {
                                        //     isShowToast = false;
                                        //   });
                                        // }
                                      },
                                      child: ListTile(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 12),
                                        minLeadingWidth: 0,
                                        title: AutoSizeText.rich(
                                          TextSpan(
                                            children: [
                                              TextSpan(
                                                  text: 'GST\n',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontFamily: 'button')),
                                              TextSpan(
                                                text: '24ANKPP6671M1ZB',
                                              )
                                            ],
                                          ),
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                          maxFontSize: 60,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Material(
                                  borderRadius: BorderRadius.circular(10),
                                  elevation: 8,
                                  color: Colors.tealAccent,
                                  child: Container(
                                    width: width / 2,
                                    child: InkWell(
                                      onTap: () async {
                                        await launch('tel:+919909917644');
                                      },
                                      child: ListTile(
                                        minLeadingWidth: 0,
                                        leading: Icon(
                                          Icons.call,
                                        ),
                                        title: Align(
                                          alignment: Alignment(-1, 0),
                                          child: AutoSizeText(
                                            '9909917644',
                                            maxLines: 1,
                                            maxFontSize: 50,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.blue,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                    onTap: () async {
                                      await launch(
                                          'https://goo.gl/maps/hvTwdpWv4UFsEVCs6');
                                    },
                                    child: CircleAvatar(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image(
                                          image: AssetImage(
                                            'assets/maps.png',
                                          ),
                                        ),
                                      ),
                                      radius: width / 16,
                                      backgroundColor: Colors.transparent,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      var whatsapp = "+919909917644";
                                      var whatsappURl_android =
                                          "whatsapp://send?phone=" + whatsapp;
                                      if (await canLaunch(
                                          whatsappURl_android)) {
                                        await launch(whatsappURl_android);
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                duration: Duration(
                                                    milliseconds: 1500),
                                                content: new Text(
                                                    "Whatsapp not installed")));
                                      }
                                    },
                                    child: CircleAvatar(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(30),
                                        child: Image(
                                          image: AssetImage(
                                            'assets/whatsapp.png',
                                          ),
                                        ),
                                      ),
                                      radius: width / 13,
                                      backgroundColor: Colors.transparent,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      await launch(
                                          'https://open.spotify.com/playlist/1aQTD7eVzSStwqaZPZ5OCc?si=f7da74be4f474550');
                                    },
                                    child: CircleAvatar(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image(
                                          image: AssetImage(
                                            'assets/spotify.png',
                                          ),
                                        ),
                                      ),
                                      radius: width / 16,
                                      backgroundColor: Colors.transparent,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        GestureDetector(
                          child: GestureDetector(
                            onTap: () async {
                              await _auth.signOut();
                              Navigator.popAndPushNamed(
                                  context, WelcomeScreen.id);
                            },
                            child: Container(
                              width: width / 2,
                              child: ListTile(
                                enableFeedback: true,
                                // minLeadingWidth: 30,
                                // dense: true,
                                leading: Icon(Icons.logout),
                                subtitle: AutoSizeText(
                                  'click here to logout',
                                  minFontSize: 8,
                                  maxLines: 1,
                                  style: TextStyle(fontSize: 25),
                                ),
                                title: AutoSizeText(
                                  'Sign Out',
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 55, color: Colors.black45),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
