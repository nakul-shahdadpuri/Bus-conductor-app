import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/ui/home.dart';
import 'package:flutterapp/ui/login_screen.dart';

class SigninScreen extends StatefulWidget {
  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen>
    with TickerProviderStateMixin {
  bool _rememberMe = false;
  var _formkeyfirst = GlobalKey<FormState>();
  var _formkeylast = GlobalKey<FormState>();
  var _formkeypohone = GlobalKey<FormState>();
  var _formkeyemail = GlobalKey<FormState>();
  DateTime pickdate = DateTime.now();
//  var text_style = kHintTextStyle;
  static final TextEditingController _firstname = TextEditingController();
  static final TextEditingController _lastname = TextEditingController();
  static final TextEditingController _mobilenumber = TextEditingController();
  static final TextEditingController _emailid = TextEditingController();
  static final TextEditingController _gender = TextEditingController();

  String get emailid => _emailid.text;

  String get mobilenumber => _mobilenumber.text;

  String get lastname => _lastname.text;

  String get firstname => _firstname.text;

  String get gender => _gender.text;
  List UpdatedData;
  AnimationController animationController;

//  Future getData() async {
//    var params = {
//      "first_name": firstname,
//      "last_name": lastname,
//      "dob": pickdate,
//      "phone": mobilenumber,
//      "email": emailid,
//      "gender": gender,
//    };
//
//    Uri uri = Uri.parse("http://54.195.185.17:8080/registerUser");
//    final newURI = uri.replace(queryParameters: params);
//    print(newURI);
//    var response = await http.get(
//      newURI,
//    );
//    setState(() {
//      UpdatedData = json.decode(response.body);
//    });
//
//    print(UpdatedData);
//  }


  Widget _buildFirstNameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'First Name',
//          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
//          decoration: kBoxDecorationStyle,
          height: 40.0,
          child: TextFormField(
            controller: _firstname,
            //key: _formkeyfirst,
            // ignore: missing_return
            validator: (String value) {
              if (value.isEmpty) {
                return 'Please enter Firstname';
              }
            },
            keyboardType: TextInputType.text,
            style: TextStyle(
              color: Colors.white,
//              fontFamily: AppTheme.body1.fontFamily,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 4.0),
              fillColor: Colors.transparent,
              prefixIcon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              hintText: 'Enter your First Name',
//              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLastNameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Last Name',
//          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
//          decoration: kBoxDecorationStyle,
          height: 40.0,
          child: TextFormField(
            controller: _lastname,

            //key: _formkeyfirst,
            validator: (String value) {
              if (value.isEmpty) {
                return 'Please enter Lastname';
              }
            },
            keyboardType: TextInputType.text,
            style: TextStyle(
              color: Colors.white,
//              fontFamily: AppTheme.body1.fontFamily,
            ),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.white12)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.white12),
              ),
              fillColor: Colors.white,
              prefixIcon: Icon(
                Icons.account_circle,
                color: Colors.white,
              ),
              labelStyle: TextStyle(
                color: Colors.white60,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
//                fontFamily: AppTheme.body1.fontFamily,
              ),
              hintText: 'Enter your Last Name',
//              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDOBTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Date of Birth',
//          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
//          decoration: kBoxDecorationStyle,
          height: 40.0,
          child: ListTile(
            title: Text(
              "${pickdate.day} / ${pickdate.month} / ${pickdate.year}",
//              style: text_style,
            ),
            leading: Icon(
                Icons.calendar_today,
                color: Colors.white),
            onTap: _pickDate,
          ),
//          TextField(
//            keyboardType: TextInputType.text,
//            style: TextStyle(
//              color: Colors.white,
//              fontFamily: AppTheme.body1.fontFamily,
//            ),
//            decoration: InputDecoration(
//              border: InputBorder.none,
//              contentPadding: EdgeInsets.only(top: 4.0),
//              fillColor: Colors.transparent,
//              prefixIcon: Icon(
//                Icons.person,
//                color: Colors.white,
//              ),
//              hintText: 'Enter your Last Name',
//              hintStyle: kHintTextStyle,
//            ),
//          ),
        ),
      ],
    );
  }

  _pickDate() async {
    DateTime date = await showDatePicker(
        context: context,
        initialDate: DateTime(DateTime
            .now()
            .year),
        firstDate: DateTime(DateTime
            .now()
            .year - 70),
        lastDate: pickdate);
    if (date != null)
      setState(() {
        pickdate = date;
      });
//    text_style = TextStyle(
//      color: Colors.white,
////      fontFamily: AppTheme.body1.fontFamily,
//    );
  }

  Widget _buildPhoneNoTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Mobile Number',
//          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
//          decoration: kBoxDecorationStyle,
          height: 40.0,
          child: TextFormField(
            controller: _mobilenumber,
            //key: _formkeyfirst,
            validator: (String value) {
              if (value.isEmpty) {
                return 'Please enter Mobile Number';
              }
            },
            keyboardType: TextInputType.phone,
            style: TextStyle(
              color: Colors.white,
//              fontFamily: AppTheme.body1.fontFamily,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 4.0),
              fillColor: Colors.transparent,
              prefixIcon: Icon(
                Icons.phone,
                color: Colors.white,
              ),
              hintText: 'Enter your Mobile Number',
//              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
//          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
//          decoration: kBoxDecorationStyle,
          height: 40.0,
          child: TextFormField(
            controller: _emailid,
            //key: _formkeyfirst,
            validator: (String value) {
              if (value.isEmpty) {
                return 'Please enter Email';
              }
            },
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
//              fontFamily: AppTheme.body1.fontFamily,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 4.0),
              fillColor: Colors.transparent,
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'Enter your Email',
//              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGenderTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Gender',
//          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
//          decoration: kBoxDecorationStyle,
          height: 40.0,
          child: TextFormField(
            controller: _gender,
            //key: _formkeyfirst,
            validator: (String value) {
              if (value.isEmpty) {
                return 'Please enter Email';
              }
            },
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
//              fontFamily: AppTheme.body1.fontFamily,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 4.0),
              fillColor: Colors.transparent,
              prefixIcon: Icon(
                Icons.perm_identity,
                color: Colors.white,
              ),
              hintText: 'Enter your Gender',
//              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNextBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
//        if (_formkeyfirst.currentState.validate()) {
//          print('Login Button Pressed');
//          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> password_page(),));
//        }
          //Navigator.of(context).push(MaterialPageRoute(builder: (context)=> password_page(),));
//          if(UpdatedData[0]["status"]=="SUCCESS"){
//            _BottomPopupMessage(context);
//          }
          _BottomPopupMessage(context);
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: Colors.white,
        child: Text(
          'Next',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
//            fontFamily: AppTheme.body1.fontFamily,
          ),
        ),
      ),
    );
  }

  Widget _buildSignInWithText() {
    return Column(
      children: <Widget>[
        Text(
          '- OR -',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          'Sign in with',
//          style: kLabelStyle,
        ),
      ],
    );
  }

  Widget _buildSocialBtn(Function onTap, AssetImage logo) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(
            image: logo,
          ),
        ),
      ),
    );
  }

  Widget _buildSocialBtnRow() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildSocialBtn(
                () => print('Login with Facebook'),
            AssetImage(
              'assets/logos/facebook.jpg',
            ),
          ),
          _buildSocialBtn(
                () => print('Login with Google'),
            AssetImage(
              'assets/logos/google.jpg',
            ),
          ),
//          _buildSocialBtn(
//            () => print('Login with Twitter'),
//            AssetImage(
//              'assets/logos/twitter.png',
//            ),
//          ),
        ],
      ),
    );
  }

  Widget _buildSignupBtn() {
    return GestureDetector(
      onTap: () =>
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => LoginScreen(),)),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Have an Account? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: ' Login',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initstate() {
    super.initState();
    pickdate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      //key:_formkeyfirst,
      child: Scaffold(
//        appBar: AppBar(
//          leading: IconButton(
//            icon: Icon(Icons.arrow_back_ios),
//            onPressed: () {
//              Navigator.pop(context);
//            },
//          ),
//          actions: <Widget>[
//            IconButton(
//              icon: Icon(
//                Icons.home,
//                color: Colors.white,
//              ),
//              onPressed: () {
//                Navigator.pop(context);
//              },
//            )
//          ],
//          title: Text("Marg Darsi"),
        backgroundColor: Colors.indigo,
//          //toolbarOpacity: 0.7,
//          //bottomOpacity: 0.2,
//        ),
        body: Container(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Stack(
              children: <Widget>[
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(

                    color: Colors.blueGrey.shade800,
//                    image: DecorationImage(
//                      image: AssetImage("assets/logos/index69.jpg"),
//                      fit: BoxFit.cover,
//                    ),
                  ),
//                decoration: BoxDecoration(
//                  gradient: LinearGradient(
//                    begin: Alignment.topCenter,
//                    end: Alignment.bottomCenter,
//                    colors: [
//                      Color(0xFF73AEF5),
//                      Color(0xFF61A4F1),
//                      Color(0xFF478DE0),
//                      Color(0xFF398AE5),
//                    ],
//                    stops: [0.1, 0.4, 0.7, 0.9],
//                  ),
//                ),
                ),
                Container(
                  height: double.infinity,
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal: 40.0,
                      vertical: 50.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white,
//                            fontFamily: AppTheme.body1.fontFamily,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 18.0),
                        _buildFirstNameTF(),
                        SizedBox(height: 18.0),
                        _buildLastNameTF(),
                        SizedBox(height: 18.0),
                        _buildDOBTF(),
                        SizedBox(height: 18.0),
                        _buildGenderTF(),
                        SizedBox(height: 18.0),
                        _buildPhoneNoTF(),
                        SizedBox(height: 18.0),
                        _buildEmailTF(),
                        //_buildRememberMeCheckbox(),
                        _buildNextBtn(),
//                        _buildSignInWithText(),
//                        _buildSocialBtnRow(),
//                        _buildSignupBtn(),
                        SizedBox(height: 50.0),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


  void _BottomPopupMessage(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
//        decoration: BoxDecoration(
//          color: AppTheme.background,
//        ),
          height: MediaQuery
              .of(context)
              .size
              .height ,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
//                    color: AppTheme.white,
                  ),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Password",
//                        style: AppTheme.headline,
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(
                          Icons.cancel,
//                      color: Colors.red,
                          size: 25,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                          //Navigator.of(context).push(MaterialPageRoute(builder: (context)=> LoginScreen(),));
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                              LoginScreen()
                            ,));
                        },
                      )
                    ],
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(top: 0),
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * .30,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/GIF/email.gif"),
                          fit: BoxFit.contain,
                        ))),

                Container(

                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * .10),
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * .80,
                  child: Text(
                    "Verify your account. Check your email.",
//                    style: AppTheme.title,
                  ),),

                /*Row(
                children: [
                  Container(padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * .10, top: 10 ),
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * .80,
                    child:  Text("An email has been sent to your Email ID. Create a password and try logging again.",
                      style: AppTheme.title,
                    ),
                  )],
                ),*/
              ],
            ),
          ),
        );
      },
    );
  }
}