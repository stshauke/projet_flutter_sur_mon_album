import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Color selectedColor = Colors.black; // Couleur par défaut
  String colorText = "Cliquez pour choisir une couleur"; // Texte par défaut
  FontWeight selectedFontWeight = FontWeight.normal; // Poids de police par défaut
  FontStyle selectedFontStyle = FontStyle.normal; // Style de police par défaut
  String fontStyleText = "Cliquez pour choisir un style"; // Texte par défaut
  bool isDarkMode = false; // Par défaut, mode clair
  String colorChoose = "Cliquez pour afficher la palette des couleurs"; // Texte par défaut
  Color choosedColor = Colors.black; // Couleur par défaut

  void changeColor(Color color) {
    setState(() {
      selectedColor = color;
      colorText = "Vous avez choisi la couleur ${color.toString()}";
    });
  }

  void changeFontWeight(FontWeight weight) {
    setState(() {
      selectedFontWeight = weight;
      fontStyleText = "Vous avez choisi le style ${weight == FontWeight.bold ? 'Gras' : 'Normal'}";
    });
  }

  void changeFontStyle(FontStyle style) {
    setState(() {
      selectedFontStyle = style;
      fontStyleText = "Vous avez choisi le style ${style == FontStyle.italic ? 'Italique' : 'Normal'}";
    });
  }
 // Méthode pour ouvrir le sélecteur de couleur
  void pickColor() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        Color tempColor = choosedColor;
        return AlertDialog(
          title: Text("Choisissez une couleur"),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: tempColor,
              onColorChanged: (Color color) {
                tempColor = color;
              },
            ),
          ),
          actions: [
            TextButton(
              child: Text("Annuler"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Valider"),
              onPressed: () {
                setState(() {
                  choosedColor = tempColor;
                  colorChoose = "Couleur sélectionnée : ${tempColor.toString()}";
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        title: Text("Paramètres"),
         centerTitle: true,
        backgroundColor: Color.fromARGB(255, 193, 235, 194),
      ),
      body: Container(
    color: isDarkMode ? const Color.fromARGB(41, 0, 0, 0) : Colors.white, // Arrière-plan dynamique
    padding: const EdgeInsets.all(16.0),
    child: Column(
      children: [
            // Section pour choisir la couleur
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => changeColor(Colors.red),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: Text("Rouge"),
                ),
                ElevatedButton(
                  onPressed: () => changeColor(Colors.green),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: Text("Vert"),
                ),
                ElevatedButton(
                  onPressed: () => changeColor(Colors.blue),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: Text("Bleu"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Center(
  child: Text(
    colorText,
    style: TextStyle(color: selectedColor, fontSize: 18),
    textAlign: TextAlign.center,
  ),
),

            const SizedBox(height: 40),

            // Section pour choisir le style de texte
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => changeFontWeight(FontWeight.bold),
                  child: Text("Gras"),
                ),
                ElevatedButton(
                  onPressed: () => changeFontWeight(FontWeight.normal),
                  child: Text("Normal"),
                ),
                ElevatedButton(
                  onPressed: () => changeFontStyle(FontStyle.italic),
                  child: Text("Italique"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              fontStyleText,
              style: TextStyle(fontSize: 18, fontWeight: selectedFontWeight, fontStyle: selectedFontStyle),
            ),
            SwitchListTile(
          title: Text(
            "Activer le mode sombre",
            style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
          ),
          value: isDarkMode,
          onChanged: (bool value) {
            setState(() {
              isDarkMode = value;
            });
          },
          secondary: Icon(
            isDarkMode ? Icons.dark_mode : Icons.light_mode,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
         
                ElevatedButton(
                  onPressed: pickColor,
                  child: Text("Choisir une couleur"),
                ),
                const SizedBox(height: 10),
            Text(
              colorChoose,
              style: TextStyle(color: choosedColor, fontSize: 18),
            ),
              ],
          
          
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(255, 193, 235, 194), // Appliquer la même couleur que l'AppBar
        shape: CircularNotchedRectangle(), // Crée une découpe pour le FAB
        notchMargin: 8.0, // Marge entre le FAB et le BottomAppBar
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                // Naviguer vers la page d'accueil (remplacez '/home' par votre route d'accueil)
                Navigator.pushNamed(context, '/');
              },
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                // Si vous êtes déjà sur cette page, vous pouvez choisir de ne rien faire ou de naviguer ailleurs.
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Vous êtes déjà sur les paramètres.")));
              },
            ),

          ],
        ),
      ),
      
    );
  }
}