import 'package:flutter/material.dart';
import 'package:flutter_ecom/db/auth.dart';

class Login extends StatefulWidget {
  final Function toggleView;
  Login({this.toggleView});
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

  final Auth auth = Auth();
  String _error = null;
  bool loading = false;

  Future handleSignIn() async {
    try {
      dynamic result = await auth.signInWithEmailAndPassword(
          _emailTextController.text.trim(),
          _passwordTextController.text.trim());
      if (result == null) {
        if (this.mounted) {
          setState(() {
            loading = false;
            _error = "ERROR SIGNING IN!";
            print(_error);
          });
        }
      } else if (result == "ERROR_USER_NOT_FOUND") {
        if (this.mounted) {
          setState(() {
            loading = false;
            _error = "USER NOT FOUND!";
            print(_error);
          });
        }
      } else if (result == "ERROR_WRONG_PASSWORD") {
        if (this.mounted) {
          setState(() {
            loading = false;
            _error = "Wrong Password";
            print(_error);
          });
        }
      } else {
        print("SIGNED IN");
      }
    } catch (e) {
      print("Error in HandleSignIn: ${e.toString()}");
    }
  }

  Widget showAlert() {
    if (_error != null) {
      return Container(
        color: Colors.amberAccent,
        width: double.infinity,
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(8.0), child: Icon(Icons.error_outline)),
            Expanded(
              child: Text(_error),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  if (this.mounted) {
                    setState(() {
                      _error = null;
                    });
                  }
                },
              ),
            )
          ],
        ),
      );
    }
    return SizedBox(
      height: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 3;
    return loading
        ? Loading()
        : Scaffold(
            body: Stack(
              children: <Widget>[
                Image.asset(
                  'images/back.jpeg',
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: double.infinity,
                ),

                // Container(
                //   color: Colors.black.withOpacity(0.8),
                //   width: double.infinity,
                //   height: double.infinity,
                // ),
                // Container(
                //     alignment: Alignment.topCenter,
                //     child: Image.asset(
                //       'images/lg.png',
                //       width: 280.0,
                //       height: 240.0,
                //     )),
                showAlert(),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 200.0),
                    child: Center(
                      child: Form(
                          key: _formKey,
                          child: ListView(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    14.0, 8.0, 14.0, 8.0),
                                child: Material(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.white.withOpacity(0.4),
                                  elevation: 0.0,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 12.0),
                                    child: TextFormField(
                                      controller: _emailTextController,
                                      decoration: InputDecoration(
                                        hintText: "Email",
                                        icon: Icon(Icons.alternate_email),
                                      ),
                                      // ignore: missing_return
                                      validator: (value) {
                                        if (value.trim().isEmpty) {
                                          Pattern pattern =
                                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                          RegExp regex = new RegExp(pattern);
                                          if (!regex.hasMatch(value.trim()))
                                            return 'Please make sure your email address is valid';
                                          else
                                            return null;
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    14.0, 8.0, 14.0, 8.0),
                                child: Material(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.white.withOpacity(0.4),
                                  elevation: 0.0,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 12.0),
                                    child: TextFormField(
                                      controller: _passwordTextController,
                                      decoration: InputDecoration(
                                        hintText: "Password",
                                        icon: Icon(Icons.lock_outline),
                                      ),
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "The password field cannot be empty";
                                        } else if (value.length < 6) {
                                          return "the password has to be at least 6 characters long";
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    14.0, 8.0, 14.0, 8.0),
                                child: Material(
                                    borderRadius: BorderRadius.circular(20.0),
                                    color: Colors.red.shade700,
                                    elevation: 0.0,
                                    child: MaterialButton(
                                      onPressed: () {
                                        if (this.mounted) {
                                          setState(() => loading = true);
                                        }
                                        handleSignIn();
                                        FocusScope.of(context)
                                            .requestFocus(FocusNode());
                                      },
                                      minWidth:
                                          MediaQuery.of(context).size.width,
                                      child: Text(
                                        "Login",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.0),
                                      ),
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Forgot password",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
//                          Expanded(child: Container()),

                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                      onTap: () {
                                        widget.toggleView();
                                      },
                                      child: Text(
                                        "Sign up",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.red, fontSize: 15.0),
                                      ))),
                            ],
                          )),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white70.withOpacity(0.8),
      child: Center(
        child: CircularProgressIndicator(
          color: Colors.red,
        ),
      ),
    );
  }
}
