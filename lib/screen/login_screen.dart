import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/bloc/login_bloc.dart';
import 'package:movieapp/model/login_model.dart';
import 'package:movieapp/persistance/repository.dart';
import 'package:movieapp/screen/alertDialog.dart';
import 'package:movieapp/screen/loader_screen.dart';


import 'mytextfiled_form_screen.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  final GlobalKey<State> _alertLoader = new GlobalKey<State>();
  final _loginformKey = GlobalKey<FormState>();
  final userNameTextField = TextEditingController();
  final passwordTextField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _loginformKey,
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Login',style: Theme.of(context).textTheme.headline6,),
              ),
              Padding(
                padding: const  EdgeInsets.only(left: 8,right: 8,bottom: 4),
                child: MyTextFormField(
                  controller: userNameTextField,
                  hintText: 'User Name',
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please enter Movie Name ';
                    }
                    return null;
                  },
                  onSaved: (String value) {
                    setState(() {

                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8,right: 8,bottom: 8),
                child: MyTextFormField(
                  controller: passwordTextField,
                  isPassword: true,
                  hintText: 'Password',
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please enter Password';
                    }
                    return null;
                  },
                  onSaved: (String value) {
                    setState(() {

                    });
                  },
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left: 14,right: 14),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.green,
                      width: 1.0
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                  color: Theme.of(context).accentColor
                ),
                child: FlatButton(
                  child: Text('Login',
                      style: TextStyle(fontSize: 20,fontFamily: 'RubikMedium',color: Colors.white)),
                  onPressed: (){
                    _handleSubmit(context);

                  },
                ),
              )

            ],
          ),
        ),
      ),
    );
  }

  Future<void> _handleSubmit(BuildContext context) async {

    if(userNameTextField.text == "" || userNameTextField.text == null){
      print('Please enter user name');
      return;
    }

    if(passwordTextField.text == "" || passwordTextField.text == null){
      print('Please enter password');
      return;
    }
    try {
      Dialogs.showLoadingDialog(context, _keyLoader);//invoking login
      Repository _repository = Repository();
      LoginResponse userResponse = await _repository.fetchMovie(userNameTextField.text);
      Navigator.of(_keyLoader.currentContext,rootNavigator: true).pop();//close the dialoge
      if(userResponse.title != null) {
        if (userNameTextField.text.toLowerCase() ==
            userResponse.title.toLowerCase() &&
            passwordTextField.text.toLowerCase() ==
                userResponse.year.toLowerCase()) {
          Navigator.pushReplacementNamed(context, "Home");
        } else {
          AlertDialogs.showAlertDialog(context, _alertLoader,
              'Please enter valid user name as movie name and password as release year');
        }
      }else{
        AlertDialogs.showAlertDialog(context, _alertLoader,
            'Movie not found!');
      }
    } catch (error) {
      print(error);
    }
  }

}
