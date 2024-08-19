import 'package:dummy_mvvm_project/resources/components/round_button.dart';
import 'package:dummy_mvvm_project/utilities/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dummy_mvvm_project/view_model/auth_view_model.dart';
import 'package:dummy_mvvm_project/utilities/utilities.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

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
    final _authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Signup", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: SafeArea(
          child:Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: "Email",
                      hintText: "Enter the email",
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                  TextField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      labelText: "Password",
                      hintText: "Enter the password",
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                  RoundButton("Signup", (){
                    if (_emailController.text.isEmpty){
                      Utilities.flushBarErrorMessage("Please enter email", context, Colors.red);
                    }else if (_passwordController.text.isEmpty){
                      Utilities.flushBarErrorMessage("Please enter password", context, Colors.red);
                    }else if (_passwordController.text.length<6){
                      Utilities.flushBarErrorMessage("Enter a strong password", context, Colors.red);
                    }else{
                      Map data = {
                        "email": _emailController.text,
                        "password": _passwordController.text,
                      };
                      _authViewModel.RegisterApi(data, context);
                    }
                  }),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                  InkWell(
                    child: Text("Already have an account? Login"),
                    onTap: (){
                      Navigator.pushReplacementNamed(context, RouteName.login);
                    },
                  )
                ],
              ),
            ),
          )
      )

    );
  }
}
