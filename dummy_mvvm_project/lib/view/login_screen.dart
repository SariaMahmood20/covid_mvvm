import 'package:flutter/material.dart';
import 'package:dummy_mvvm_project/resources/components/round_button.dart';
import 'package:dummy_mvvm_project/utilities/utilities.dart';
import 'package:dummy_mvvm_project/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';
import 'package:dummy_mvvm_project/utilities/routes/route_name.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override

  Widget build(BuildContext context) {
    final _authViewModel =Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            "Login",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "Enter your email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15)
                  )
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Enter your password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15)
                  ),
                ),
                obscureText: true,
                obscuringCharacter: "*",
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
              RoundButton("Login", (){
                if(_emailController.text.isEmpty){
                  Utilities.flushBarErrorMessage("Please enter email", context, Colors.red);
                }
                else if(_passwordController.text.isEmpty){
                  Utilities.flushBarErrorMessage("Please enter password", context, Colors.red);
                }
                else if(_passwordController.text.length<6){
                  Utilities.flushBarErrorMessage("Enter more than 6 characters", context, Colors.red);
                }
                else{
                  Map data = {
                    "email": _emailController.text,
                    "password": _passwordController.text
                  };
                  print("1");
                  _authViewModel.LoginApi(data, context);
                }
              }),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
              InkWell(
                child: Text("Don't have an account? Click to Signup"),
                onTap: (){
                  Navigator.pushReplacementNamed(context, RouteName.signup);
                },
              )

            ]
          )
        ),
      ),
    );
  }
}
