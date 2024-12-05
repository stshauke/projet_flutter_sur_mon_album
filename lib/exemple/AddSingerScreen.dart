import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'singer.dart'; // Assurez-vous que le chemin d'importation est correct

class AddSingerScreen extends StatefulWidget {
  @override
  _AddSingerScreenState createState() => _AddSingerScreenState();
}

class _AddSingerScreenState extends State<AddSingerScreen> {
  final TextEditingController nameController = TextEditingController();
  String? imagePath; // Pour stocker le chemin de l'image sélectionnée

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      // Obtenir le chemin du dossier où enregistrer l'image
      final directory = await getApplicationDocumentsDirectory();
      final String newPath = '${directory.path}/images/${image.name}';

      // Créer le dossier images s'il n'existe pas
      final Directory newDirectory = Directory('${directory.path}/images');
      if (!await newDirectory.exists()) {
        await newDirectory.create(recursive: true);
      }

      // Déplacer l'image sélectionnée vers le nouveau chemin
      final File newImage = File(newPath);
      await newImage.writeAsBytes(await image.readAsBytes());

      setState(() {
        imagePath = newPath; // Mettre à jour le chemin de l'image
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajouter un Chanteur'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Nom du Chanteur'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage,
              child: const Text('Choisir une Image'),
            ),
            if (imagePath != null) ...[
              const SizedBox(height: 20),
              Image.file(File(imagePath!), height: 100), // Afficher l'image sélectionnée
            ],
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Créer une nouvelle instance de Singer avec le chemin de l'image
                final newSinger = Singer(
                  name: nameController.text,
                  imageUrl: imagePath ?? '', // Utiliser un chemin vide si aucune image n'est sélectionnée
                );

                // Retourner à la page précédente avec l'objet Singer
                Navigator.pop(context, newSinger);
              },
              child: const Text('Ajouter'),
            ),
          ],
        ),
      ),
    );
  }
}