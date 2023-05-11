import 'package:app_fluttr/Homepage.dart';
import 'package:app_fluttr/main.dart';
import 'package:app_fluttr/navBar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'service/auth_services.dart';

class SignInPage1 extends StatefulWidget {
  const SignInPage1({Key? key}) : super(key: key);

  @override
  State<SignInPage1> createState() => _SignInPage1State();
}

class _SignInPage1State extends State<SignInPage1> {
  bool _isPasswordVisible = false;
  bool _rememberMe = false;
  //declaration de la variable utiliser par cnx
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  //variable bool mssgerror
  bool msgerror = false;
  //chargement loding
  bool chargement = false;
  SetUserId(String id) async {
    //
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('id', id);
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    showDial() {
      return showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Icon(
                Icons.cancel_outlined,
                color: Colors.red,
                size: 100,
              ),
              content: const Text(
                'mot de passe ou \n email incorrect',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              actions: <Widget>[
                // TextButton(
                //   style: TextButton.styleFrom(
                //     textStyle: Theme.of(context).textTheme.labelLarge,
                //   ),
                //   child: const Text('Disable'),
                //   onPressed: () {
                //     Navigator.of(context).pop();
                //   },
                // ),
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge,
                  ),
                  child: const Text('Ok'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    }

    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: Card(
            elevation: 8,
            child: Container(
              padding: const EdgeInsets.all(32.0),
              constraints: const BoxConstraints(maxWidth: 350),
              child: SingleChildScrollView(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Image(
                        fit: BoxFit
                            .contain, // Valeur de la propriété fit modifiée
                        image: AssetImage(
                            'images/logohne.jpeg'), // Chemin d'accès modifié
                      ),
                      _gap(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        // child: Text(
                        //   "Mauri urgence",
                        //   style: Theme.of(context).textTheme.headlineSmall,
                        // ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          "Entrer vos  donées pour continuer.",
                          style: Theme.of(context).textTheme.bodySmall,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      _gap(),
                      TextFormField(
                        //meme password
                        controller: email,
                        validator: (value) {
                          // add email validation
                          if (value == null || value.isEmpty) {
                            return 'Saisir quelque chose';
                          }

                          bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value);
                          if (!emailValid) {
                            return 'Veuillez saisir un e-mail valide';
                          }

                          return null;
                        },
                        decoration: const InputDecoration(
                          labelText: 'email',
                          hintText: 'Votre e-mail',
                          prefixIcon: Icon(Icons.email_outlined),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      _gap(),
                      TextFormField(
                        //appele de la variable declarer en haut
                        controller: password,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Les champs sont vides!';
                          }

                          if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                        obscureText: !_isPasswordVisible,
                        decoration: InputDecoration(
                            labelText: 'password',
                            hintText: 'Votre mot de passe',
                            prefixIcon: const Icon(Icons.lock_outline_rounded),
                            border: const OutlineInputBorder(),
                            suffixIcon: IconButton(
                              icon: Icon(_isPasswordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                            )),
                      ),
                      _gap(),
                      CheckboxListTile(
                        value: _rememberMe,
                        onChanged: (value) {
                          if (value == null) return;
                          setState(() {
                            _rememberMe = value;
                          });
                        },
                        title: const Text('se souvenir de moi'),
                        controlAffinity: ListTileControlAffinity.leading,
                        dense: true,
                        contentPadding: const EdgeInsets.all(0),
                      ),
                      _gap(),
                      // bool true et false
                      chargement
                          ? CircularProgressIndicator()
                          : SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4)),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                    'Connexion',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                onPressed: () async {
                                  if (_formKey.currentState?.validate() ??
                                      false) {
                                    /// do something
                                    setState(() {
                                      chargement = true;
                                    });
                                    //appele de conexion page
                                    await AuthServices.Login(
                                            email.text, password.text)
                                        .then((value) {
                                      if (value['succes']) {
                                        setState(() {
                                          //message de ereur si mot passe incorect ou passeword
                                          msgerror = false;
                                        });
                                        SetUserId(
                                            value['agents']['id'].toString());
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Home()));
                                      } else {
                                        //loding tezknin 2li net7ara cnx
                                        setState(() {
                                          msgerror = true;
                                        });
                                        //apppele methode showDialoge
                                        showDial();
                                      }
                                    });
                                    setState(() {
                                      chargement = false;
                                    });
                                  }
                                },
                              ),
                            ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: const Divider(
                                color: Colors.grey,
                                height: 1,
                              ),
                            ),
                          ),
                          const Text(
                            'OU',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: const Divider(
                                color: Colors.black,
                                height: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                      _gap(),
                      TextButton(
                        onPressed: () {
                          // Add your navigation logic here
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()));
                        },
                        child: const Text(
                          'Entrer sans se connecter',
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _gap() => const SizedBox(height: 16);
}
