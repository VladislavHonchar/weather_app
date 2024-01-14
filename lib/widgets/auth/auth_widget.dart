import 'dart:ui';

import 'package:flutter/material.dart';

class AuthFormWidget extends StatefulWidget {
  const AuthFormWidget({super.key});

  @override
  State<AuthFormWidget> createState() => _AuthFormWidgetState();
}

class _AuthFormWidgetState extends State<AuthFormWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Weather",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.cloud,
              color: Colors.white,
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 10, 58, 15),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/assets/img/aesthetic_forest.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            color: const Color.fromARGB(33, 255, 254, 254),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Center(
                child: Column(children: [
                  _TextAuthWidget(),
                  SizedBox(height: 40,),
                  _WeatherFormAuthWidget(),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TextAuthWidget extends StatelessWidget {
  const _TextAuthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 35),
        Text(
          "Welcome",
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 60,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10),
        Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor neque sed pretium luctus",
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.w200
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _WeatherFormAuthWidget extends StatefulWidget {
  const _WeatherFormAuthWidget({super.key});

  @override
  State<_WeatherFormAuthWidget> createState() => __WeatherFormAuthWidgetState();
}

class __WeatherFormAuthWidgetState extends State<_WeatherFormAuthWidget> {
  final _loginTextController = TextEditingController(text: 'admin');
  final _passwordTextController = TextEditingController(text: 'admin');
  
  void _auth(){
    final login = _loginTextController.text;
    final pass = _passwordTextController.text;
    if(login == "admin" && pass == "admin"){
      Navigator.of(context).pushReplacementNamed('/main_screen');
    }else{
      print("Wrong pass or login");
    }
    setState(() {
      
    });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _loginTextController,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18
          ),
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            labelText: "Email Address",
            labelStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w300
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              borderSide: BorderSide(color: Colors.white)
            ),
          ),
        ),
         const SizedBox(height: 25,),
        TextField(
          controller: _passwordTextController,
          obscureText: true,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18
          ),
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            labelText: "Password",
            labelStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w300
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              borderSide: BorderSide(color: Colors.white)
            ),
          ),
          ),
          const SizedBox(height: 25,),
        ElevatedButton(
          style: const ButtonStyle(
            padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 150, vertical: 15)),
            backgroundColor: MaterialStatePropertyAll(Colors.green)
          ),
          onPressed: _auth, 
          child: const Text("Login",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w300
          ),)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: (){}, 
              child: const Text("Password", 
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w300
              ),)),
            Container(width: 1, height: 20,decoration: const BoxDecoration(color: Colors.white),),
            TextButton(
              onPressed: (){}, 
              child: const Text("Register",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w300
              )
              )),
          ],
        ),
      ],
    );
  }
}
