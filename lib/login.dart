import 'package:flutter/material.dart';
import 'home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final double verticalSpace = 10.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login UI")),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                  labelText: "Email",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your email";
                  } else if (value.endsWith("@gmail.com")) {
                    return "Gmail not allowed";
                  } else if (value.endsWith("@hotmail.com")) {
                    return "Hotmail not allowed";
                  }
                  return null;
                },
              ),
              SizedBox(height: verticalSpace),
              TextFormField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                    icon: Icon(Icons.password),
                    border: OutlineInputBorder(),
                    labelText: "Password"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password is required";
                  }
                  return null;
                },
              ),
              SizedBox(height: verticalSpace),
              ElevatedButton.icon(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Null Safety
                    doValidation();
                  }
                },
                icon: const Icon(Icons.send),
                label: const Text("Login"),
              )
            ],
          ),
        ),
      ),
    );
  }

  void doValidation() {
    // debugPrint("Login Button CLicked");
    if (emailController.text == "test@test.com" &&
        passwordController.text == "1234") {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Login is valid"),
        backgroundColor: Colors.green,
      ));
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Home(email: emailController.text),
          ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Invalid email or password"),
        backgroundColor: Colors.red,
      ));
    }
  }
}
