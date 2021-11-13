import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecom/db/auth.dart';
import 'package:flutter_ecom/pages/login.dart';

class SignUp extends StatefulWidget {
  final Function toggleView;
  SignUp({this.toggleView});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final Auth _auth = Auth();
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _firstnameTextController = TextEditingController();
  TextEditingController _lastnameTextController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();

  TextEditingController _dateOfBirth = TextEditingController();
  TextEditingController _monthOfBirth = TextEditingController();
  TextEditingController _yearOfBirth = TextEditingController();

  TextEditingController _dateOfMarriage = TextEditingController(text: "01");
  TextEditingController _monthOfMarriage = TextEditingController(text: "01");
  TextEditingController _yearOfMarriage = TextEditingController(text: "1901");

  String gender = "Male";
  String groupvalue = "Male";

  String married = "Married";
  String marriedvalue = "Married";

  bool hidePass = true;
  bool loading = false;

  String _error = null;

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
                              // ====================== First Name ======================
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
                                      controller: _firstnameTextController,
                                      decoration: InputDecoration(
                                        hintText: "First name",
                                        icon: Icon(Icons.person_outline),
                                      ),
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "The name field cannot be empty";
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              // ====================== Last Name ====================
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
                                      controller: _lastnameTextController,
                                      decoration: InputDecoration(
                                        hintText: "Last name",
                                        icon: Icon(Icons.person_outline),
                                      ),
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "The name field cannot be empty";
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              // ====================== Email ======================
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
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          Pattern pattern =
                                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                          RegExp regex = new RegExp(pattern);
                                          if (!regex.hasMatch(value))
                                            return 'Please make sure your email address is valid';
                                          else
                                            return null;
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              // ====================== Password ======================
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    14.0, 8.0, 14.0, 8.0),
                                child: Material(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.white.withOpacity(0.4),
                                  elevation: 0.0,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 12.0),
                                    child: ListTile(
                                      title: TextFormField(
                                        controller: _passwordTextController,
                                        obscureText: hidePass,
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
                                      trailing: IconButton(
                                          icon: Icon(Icons.remove_red_eye),
                                          onPressed: () {
                                            if (this.mounted) {
                                              setState(() {
                                                hidePass = false;
                                              });
                                            }
                                          }),
                                    ),
                                  ),
                                ),
                              ),

                              // ====================== Confirm Password ======================
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    14.0, 8.0, 14.0, 8.0),
                                child: Material(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.white.withOpacity(0.4),
                                  elevation: 0.0,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 12.0),
                                    child: ListTile(
                                      title: TextFormField(
                                        controller: _confirmPasswordController,
                                        obscureText: hidePass,
                                        decoration: InputDecoration(
                                            hintText: "Confirm password",
                                            icon: Icon(Icons.lock_outline),
                                            border: InputBorder.none),
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return "The password field cannot be empty";
                                          } else if (value.length < 6) {
                                            return "The password has to be at least 6 characters long";
                                          } else if (_passwordTextController
                                                  .text !=
                                              value) {
                                            return "The passwords do not match";
                                          }
                                          return null;
                                        },
                                      ),
                                      trailing: IconButton(
                                          icon: Icon(Icons.remove_red_eye),
                                          onPressed: () {
                                            if (this.mounted) {
                                              setState(() {
                                                hidePass = false;
                                              });
                                            }
                                          }),
                                    ),
                                  ),
                                ),
                              ),

                              // ====================== Gender ======================
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    14.0, 8.0, 14.0, 8.0),
                                child: new Container(
                                  color: Colors.white.withOpacity(0.4),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                          child: ListTile(
                                              title: Text(
                                                "Male",
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              trailing: Radio(
                                                value: "Male",
                                                groupValue: groupvalue,
                                                onChanged: (e) =>
                                                    valueChanged(e),
                                              ))),
                                      Expanded(
                                          child: ListTile(
                                              title: Text(
                                                "Female",
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              trailing: Radio(
                                                value: "Female",
                                                groupValue: groupvalue,
                                                onChanged: (e) =>
                                                    valueChanged(e),
                                              )))
                                    ],
                                  ),
                                ),
                              ),

                              // ====================== Phone Number ======================
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
                                      controller: _phoneNumberController,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: <TextInputFormatter>[
                                        WhitelistingTextInputFormatter
                                            .digitsOnly
                                      ],
                                      decoration: InputDecoration(
                                        hintText: "Phone number",
                                        icon: Icon(Icons.phone),
                                      ),
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "The Phone number field cannot be empty";
                                        } else if (value.length != 10) {
                                          return "Phone number should be of 10 digits";
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                              ),

                              // =================== DOB ===================
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    14.0, 8.0, 14.0, 8.0),
                                child: Text(
                                  "Date Of Birth",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),

                              Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      14.0, 8.0, 14.0, 8.0),
                                  child: Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(0.0),
                                        child: Container(
                                          width: 70.0,
                                          height: 45.0,
                                          child: Material(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            color:
                                                Colors.white.withOpacity(0.4),
                                            elevation: 0.0,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 12.0),
                                              child: TextFormField(
                                                controller: _dateOfBirth,
                                                keyboardType:
                                                    TextInputType.number,
                                                inputFormatters: <
                                                    TextInputFormatter>[
                                                  WhitelistingTextInputFormatter
                                                      .digitsOnly
                                                ],
                                                decoration: InputDecoration(
                                                  hintText: "Date",
                                                ),
                                                validator: (value) {
                                                  if (value.isEmpty) {
                                                    return "Invalid";
                                                  } else if (value.length > 2) {
                                                    return "Invalid";
                                                  } else if (int.parse(value) >
                                                      31) {
                                                    return "Invalid";
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            8.0, 0, 0, 0),
                                        child: Container(
                                          width: 70.0,
                                          height: 45.0,
                                          child: Material(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            color:
                                                Colors.white.withOpacity(0.4),
                                            elevation: 0.0,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 12.0),
                                              child: TextFormField(
                                                controller: _monthOfBirth,
                                                keyboardType:
                                                    TextInputType.number,
                                                inputFormatters: <
                                                    TextInputFormatter>[
                                                  WhitelistingTextInputFormatter
                                                      .digitsOnly
                                                ],
                                                decoration: InputDecoration(
                                                  hintText: "Month",
                                                ),
                                                validator: (value) {
                                                  if (value.isEmpty) {
                                                    return "Invalid";
                                                  } else if (value.length > 2) {
                                                    return "Invalid";
                                                  } else if (int.parse(value) >
                                                      12) {
                                                    return "Invalid";
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            8.0, 0, 0, 0),
                                        child: Container(
                                          width: 100.0,
                                          height: 45.0,
                                          child: Material(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            color:
                                                Colors.white.withOpacity(0.4),
                                            elevation: 0.0,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 12.0),
                                              child: TextFormField(
                                                controller: _yearOfBirth,
                                                keyboardType:
                                                    TextInputType.number,
                                                inputFormatters: <
                                                    TextInputFormatter>[
                                                  WhitelistingTextInputFormatter
                                                      .digitsOnly
                                                ],
                                                decoration: InputDecoration(
                                                  hintText: "Year",
                                                ),
                                                validator: (value) {
                                                  if (value.isEmpty) {
                                                    return "Invalid";
                                                  } else if (value.length > 4) {
                                                    return "Invalid";
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),

                              // ====================== Relationship Status ======================
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    14.0, 8.0, 14.0, 8.0),
                                child: new Container(
                                  color: Colors.white.withOpacity(0.4),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                          child: ListTile(
                                              title: Text(
                                                "Married",
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              trailing: Radio(
                                                value: "Married",
                                                groupValue: marriedvalue,
                                                onChanged: (e) =>
                                                    marriedvalueChanged(e),
                                              ))),
                                      Expanded(
                                          child: ListTile(
                                              title: Text(
                                                "Single",
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              trailing: Radio(
                                                value: "Single",
                                                groupValue: marriedvalue,
                                                onChanged: (e) =>
                                                    marriedvalueChanged(e),
                                              )))
                                    ],
                                  ),
                                ),
                              ),

                              // =================== Anniversary ===================
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    14.0, 8.0, 14.0, 8.0),
                                child: Text(
                                  "Marriage Anniversary (Optional)",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),

                              Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      14.0, 8.0, 14.0, 8.0),
                                  child: Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(0.0),
                                        child: Container(
                                          width: 70.0,
                                          height: 45.0,
                                          child: Material(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            color:
                                                Colors.white.withOpacity(0.4),
                                            elevation: 0.0,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 12.0),
                                              child: TextFormField(
                                                controller: _dateOfMarriage,
                                                keyboardType:
                                                    TextInputType.number,
                                                inputFormatters: <
                                                    TextInputFormatter>[
                                                  WhitelistingTextInputFormatter
                                                      .digitsOnly
                                                ],
                                                decoration: InputDecoration(
                                                  hintText: "Date",
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            8.0, 0, 0, 0),
                                        child: Container(
                                          width: 70.0,
                                          height: 45.0,
                                          child: Material(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            color:
                                                Colors.white.withOpacity(0.4),
                                            elevation: 0.0,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 12.0),
                                              child: TextFormField(
                                                controller: _monthOfMarriage,
                                                keyboardType:
                                                    TextInputType.number,
                                                inputFormatters: <
                                                    TextInputFormatter>[
                                                  WhitelistingTextInputFormatter
                                                      .digitsOnly
                                                ],
                                                decoration: InputDecoration(
                                                  hintText: "Month",
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            8.0, 0, 0, 0),
                                        child: Container(
                                          width: 100.0,
                                          height: 45.0,
                                          child: Material(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            color:
                                                Colors.white.withOpacity(0.4),
                                            elevation: 0.0,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 12.0),
                                              child: TextFormField(
                                                controller: _yearOfMarriage,
                                                keyboardType:
                                                    TextInputType.number,
                                                inputFormatters: <
                                                    TextInputFormatter>[
                                                  WhitelistingTextInputFormatter
                                                      .digitsOnly
                                                ],
                                                decoration: InputDecoration(
                                                  hintText: "Year",
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),

                              // ====================== REGISTRATION BUTTON ======================
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    14.0, 8.0, 14.0, 8.0),
                                child: Material(
                                    borderRadius: BorderRadius.circular(20.0),
                                    color: Colors.blue.shade700,
                                    elevation: 0.0,
                                    child: MaterialButton(
                                      onPressed: () async {
                                        if (this.mounted) {
                                          setState(() {
                                            loading = true;
                                          });
                                        }
                                        validateForm();
                                        FocusScope.of(context)
                                            .requestFocus(FocusNode());
                                      },
                                      minWidth:
                                          MediaQuery.of(context).size.width,
                                      child: Text(
                                        "Register",
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
                                  child: InkWell(
                                      onTap: () {
                                        widget.toggleView();
                                      },
                                      child: Text(
                                        "Login",
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

  valueChanged(e) {
    if (this.mounted) {
      setState(() {
        if (e == "Male") {
          groupvalue = e;
          gender = e;
        } else if (e == "Female") {
          groupvalue = e;
          gender = e;
        }
      });
    }
  }

  marriedvalueChanged(e) {
    if (this.mounted) {
      setState(() {
        if (e == "Married") {
          marriedvalue = e;
          married = e;
        } else if (e == "Single") {
          marriedvalue = e;
          married = e;
        }
      });
    }
  }

  Future validateForm() async {
    FormState formState = _formKey.currentState;

    if (formState.validate()) {
      var data_map;
      if (married == "Married") {
        data_map = {
          "firstName": _firstnameTextController.text,
          "lastName": _lastnameTextController.text,
          "email": _emailTextController.text,
          "phone": int.parse(_phoneNumberController.text),
          "gender": gender,
          "username": "${_firstnameTextController.text}" +
              " " +
              "${_lastnameTextController.text}",
          "dateOfBirth": DateTime.parse("${_yearOfBirth.text}" +
              "-" +
              "${_monthOfBirth.text}" +
              "-" +
              "${_dateOfBirth.text}"),
          "married": married,
          "anniversary": DateTime.parse("${_yearOfMarriage.text}" +
              "-" +
              "${_monthOfMarriage.text}" +
              "-" +
              "${_dateOfMarriage.text}")
        };
      } else {
        data_map = {
          "firstName": _firstnameTextController.text,
          "lastName": _lastnameTextController.text,
          "email": _emailTextController.text,
          "phone": int.parse(_phoneNumberController.text),
          "gender": gender,
          "username": "${_firstnameTextController.text}" +
              " " +
              "${_lastnameTextController.text}",
          "dateOfBirth": DateTime.parse("${_yearOfBirth.text}" +
              "-" +
              "${_monthOfBirth.text}" +
              "-" +
              "${_dateOfBirth.text}"),
          "married": married,
        };
      }

      dynamic result = await _auth.registerWithEmailAndPassword(
          _emailTextController.text, _passwordTextController.text, data_map);

      if (result == null) {
        if (this.mounted) {
          setState(() {
            loading = false;
            _error = 'Invalid Form Entry or Field left empty';
            print(_error);
          });
        }
      } else if (result == "ERROR_EMAIL_ALREADY_IN_USE") {
        if (this.mounted) {
          setState(() {
            loading = false;
            _error = 'Email Already in Use!';
            print(_error);
          });
        }
      }
    } else {
      setState(() {
        loading = false;
        _error = 'Invalid Form Entry or Field left empty';
        print(_error);
      });
    }
  }
}
