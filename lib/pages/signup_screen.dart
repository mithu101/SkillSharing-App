import 'package:flutter/material.dart';

class Signup_Page extends StatefulWidget {
  const Signup_Page({Key? key}) : super(key: key);

  @override
  _Signup_PageState createState() => _Signup_PageState();
}

class _Signup_PageState extends State<Signup_Page> {
  String? selectedHall; // Variable to hold the selected hall name
  DateTime? selectedDate; // Variable to hold selected date

  final List<String> hallNames = [
    'A.F. Rahman Hall',
    'Amar Ekushey Hall',
    'Bangamata Sheikh Fazilatunnesa Mujib Hall',
    'Bangladesh-Kuwait Maitree Hall',
    'Bijoy Ekattor Hall',
    'Dr. Muhammad Shahidullah Hall',
    'Fazlul Huq Muslim Hall',
    'Haji Muhammad Mohsin Hall',
    'Jagannath Hall',
    'Jatir Janak Bangabandhu Sheikh Mujibur Rahman Hall',
    'Kabi Jasimuddin Hall',
    'Kabi Sufia Kamal Hall',
    'Muktijoddha Ziaur Rahman Hall',
    'Ruqayyah Hall',
    'Salimullah Muslim Hall',
    'Shahid Sergeant Zahurul Huq Hall',
    'Sir P.J. Hartog International Hall',
    'Surja Sen Hall',
  ]; // Updated hall names in alphabetical order

  // Focus nodes for each text field
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _registrationNumberFocusNode = FocusNode();
  final FocusNode _contactNumberFocusNode = FocusNode();
  final FocusNode _emergencyContactNumberFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();
  final FocusNode _dobFocusNode = FocusNode();

  @override
  void dispose() {
    // Dispose of the focus nodes when no longer needed
    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _registrationNumberFocusNode.dispose();
    _contactNumberFocusNode.dispose();
    _emergencyContactNumberFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    _dobFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 30.0),
              const Center(
                child: Text(
                  "Sign up",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  "Create your account",
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
              ),
              const SizedBox(height: 10),
              _buildTextField("Name", Icons.person, focusNode: _nameFocusNode),
              const SizedBox(height: 10),
              _buildTextField("Email", Icons.email, focusNode: _emailFocusNode),
              const SizedBox(height: 10),
              _buildTextField("Registration Number", Icons.confirmation_number, focusNode: _registrationNumberFocusNode),
              const SizedBox(height: 10),
              _buildDOBField(),
              const SizedBox(height: 10),
              _buildTextField("Hall Name (Optional)", Icons.apartment),
              const SizedBox(height: 10),
              _buildTextField("Contact Number", Icons.phone, isPhone: true, focusNode: _contactNumberFocusNode),
              const SizedBox(height: 10),
              _buildTextField("Emergency Contact Number", Icons.phone, isPhone: true, focusNode: _emergencyContactNumberFocusNode),
              const SizedBox(height: 10),
              _buildTextField("Password", Icons.lock, obscureText: true, focusNode: _passwordFocusNode),
              const SizedBox(height: 10),
              _buildTextField("Confirm Password", Icons.lock, obscureText: true, focusNode: _confirmPasswordFocusNode),
              const SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle signup logic here
                  },
                  child: const Text(
                    "Sign up",
                    style: TextStyle(
                        fontSize: 15, color: Colors.black), // Black text color
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    backgroundColor: Colors.green,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text("Already have an account?"),
                  TextButton(
                    onPressed: () {
                      // Navigate to login page
                    },
                    child: const Text("Login",
                        style: TextStyle(color: Colors.greenAccent)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Build Text Field
  Widget _buildTextField(String hintText, IconData icon,
      {bool obscureText = false, bool isPhone = false, FocusNode? focusNode}) {
    return Container(
      height: 40,
      child: TextField(
        focusNode: focusNode,
        keyboardType: isPhone ? TextInputType.phone : TextInputType.text,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none,
          ),
          fillColor: Colors.blueGrey.withOpacity(0.1),
          filled: true,
          prefixIcon: Icon(icon),
        ),
        obscureText: obscureText,
      ),
    );
  }

  // Build Date of Birth field
  Widget _buildDOBField() {
    return GestureDetector(
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: selectedDate ?? DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );
        if (pickedDate != null) {
          setState(() {
            selectedDate = pickedDate;
          });
        }
      },
      child: AbsorbPointer(
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: Colors.blueGrey.withOpacity(0.1),
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: selectedDate != null
                  ? "${selectedDate!.toLocal()}".split(' ')[0]
                  : "Date of Birth (YYYY-MM-DD)",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none,
              ),
              fillColor: Colors.white.withOpacity(0.1),
              filled: true,
              prefixIcon: const Icon(Icons.calendar_today),
            ),
            readOnly: true,
          ),
        ),
      ),
    );
  }
}
