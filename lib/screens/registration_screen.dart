
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Registration Form"),
        centerTitle: true,
      ),

      body: Padding(

        padding: const EdgeInsets.all(20),

        child: Form(

          key: _formKey,

          child: Column(

            children: [

              // NAME FIELD
              TextFormField(

                controller: nameController,

                decoration: const InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(),
                ),

                validator: (value) {

                  if (value == null || value.isEmpty) {
                    return "Name is required";
                  }

                  if (value.length < 3) {
                    return "Name must be greater than 3 characters";
                  }

                  return null;

                },

              ),

              const SizedBox(height: 20),

              // EMAIL FIELD
              TextFormField(

                controller: emailController,

                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),

                validator: (value) {

                  if (value == null || value.isEmpty) {
                    return "Email is required";
                  }

                  if (!value.contains("@")) {
                    return "Email must contain @";
                  }

                  return null;

                },

              ),

              const SizedBox(height: 20),

              // PASSWORD FIELD
              TextFormField(

                controller: passwordController,

                obscureText: true,

                decoration: const InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),

                validator: (value) {

                  if (value == null || value.isEmpty) {
                    return "Password is required";
                  }

                  if (value.length < 6) {
                    return "Password must be at least 6 characters";
                  }

                  return null;

                },

              ),

              const SizedBox(height: 30),

              // SUBMIT BUTTON
              SizedBox(

                width: double.infinity,

                child: ElevatedButton(

                  onPressed: () {

                    if (_formKey.currentState!.validate()) {

                      ScaffoldMessenger.of(context).showSnackBar(

                        const SnackBar(
                          content: Text("Registration Successful"),
                        ),

                      );

                    }

                  },

                  child: const Text("Submit"),

                ),

              ),

            ],

          ),

        ),

      ),

    );

  }

}