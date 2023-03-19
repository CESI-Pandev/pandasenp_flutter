import 'package:flutter/material.dart';
import 'package:pandasenp_flutter/pages/app_base.dart';

class NewRessourcePage extends StatelessWidget {
  const NewRessourcePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBase(
      title: "Nouvelle Ressource",
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            child: Column(
              children: [
                DropdownButtonFormField(
                  items: const [
                    DropdownMenuItem(
                      value: "draft",
                      child: Text("Draft"),
                    ),
                    DropdownMenuItem(
                      value: "published",
                      child: Text("Published"),
                    ),
                    DropdownMenuItem(
                        value: "archived", child: Text("Archived")),
                  ],
                  onChanged: (value) {},
                  decoration: const InputDecoration(
                    labelText: "Status",
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors
                              .black), // Bordure inférieure lorsque le champ n'est pas en focus
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors
                              .black), // Bordure inférieure lorsque le champ est en focus
                    ),
                  ),
                ),
                DropdownButtonFormField(
                  items: const [
                    DropdownMenuItem(
                      value: "course",
                      child: Text("Course"),
                    ),
                    DropdownMenuItem(
                      value: "need help",
                      child: Text("Need help"),
                    ),
                    DropdownMenuItem(
                      value: "discussion",
                      child: Text("Discussion"),
                    ),
                  ],
                  onChanged: (value) {},
                  decoration: const InputDecoration(
                    labelText: "Type",
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors
                              .black), // Bordure inférieure lorsque le champ n'est pas en focus
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors
                              .black), // Bordure inférieure lorsque le champ est en focus
                    ),
                  ),
                ),
                DropdownButtonFormField(
                  items: const [
                    DropdownMenuItem(
                      value: "developement",
                      child: Text("Developement"),
                    ),
                    DropdownMenuItem(
                      value: "Math",
                      child: Text("Math"),
                    ),
                  ],
                  onChanged: (value) {},
                  decoration: const InputDecoration(
                    labelText: "Catégorie",
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors
                              .black), // Bordure inférieure lorsque le champ n'est pas en focus
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors
                              .black), // Bordure inférieure lorsque le champ est en focus
                    ),
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Title",
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors
                              .black), // Bordure inférieure lorsque le champ n'est pas en focus
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors
                              .black), // Bordure inférieure lorsque le champ est en focus
                    ),
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Content",
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors
                              .black), // Bordure inférieure lorsque le champ n'est pas en focus
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors
                              .black), // Bordure inférieure lorsque le champ est en focus
                    ),
                  ),
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black.withOpacity(0.7),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                    ),
                    child: const Text("Publier"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
