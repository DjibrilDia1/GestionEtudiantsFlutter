import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final confirmPassword = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            "Bienvenue",
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: const Color(0xFF3AB78D),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Connectez-vous pour continuer",
            style: TextStyle(color: Colors.grey[700], fontSize: 15),
          ),
          const SizedBox(height: 30),

          // Champ nom
          TextFormField(
            controller: _emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "L'email est requis";
              }
              if (!value.contains('@')) {
                return "Entrez un email valide";
              }
              return null;
            },
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.email_outlined),
              hintText: "Email",
              filled: true,
              fillColor: Colors.grey.shade200,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Champ Email
          TextFormField(
            controller: _passwordController,
            //obscureText: !_isVisible,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Le mot de passe est requis";
              }
              if (value.length < 6) {
                return "Minimum 6 caractères";
              }
              return null;
            },
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.lock_outline),
              hintText: "Mot de passe",
              filled: true,
              fillColor: Colors.grey.shade200,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  //_isVisible ? Icons.visibility_off : Icons.visibility,
                  Icons.visibility
                ),
                onPressed: () {
                  setState(() {
                    //_isVisible = !_isVisible;
                  });
                },
              ),
            ),
          ),
          const SizedBox(height: 25),

          // Bouton Connexion
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3AB78D),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 3,
              ),
              onPressed: () {
                // if (_formKey.currentState!.validate()) {
                //   // Bouton de register
                // }
              },
              child: const Text(
                "Se connecter",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
