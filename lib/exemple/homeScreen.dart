import 'package:flutter/material.dart';
import 'chansons.dart'; // Assuming MyHomePage with song list is here
import 'singer.dart'; // Importer le modèle si utilisé

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Singer> singers = [
      Singer(name: "Céline Dion", imageUrl: "images/celine_dion.jpg"),
      Singer(name: "Ed Sheeran", imageUrl: "images/ed_sheeran.jpg"),
      Singer(name: "Adele", imageUrl: "images/adele.jpg"),
      Singer(name: "Taylor Swift", imageUrl: "images/taylor_swift.jpg"),
      Singer(name: "Édith Piaf", imageUrl: "images/edith_piaf.jpg"),
      Singer(name: "Charles Aznavour", imageUrl: "images/charles_aznavour.jpg"),
      Singer(name: "Stromae", imageUrl: "images/stromae.jpg"),
      Singer(name: "Fairuz", imageUrl: "images/fairuz.jpg"),
      Singer(name: "Amr Diab", imageUrl: "images/amr_diab.jpg"),
      Singer(name: "Majida El Roumi", imageUrl: "images/majida_el_roumi.jpg"),
    ];

    const Color appBarColor = Color.fromARGB(255, 193, 235, 194); // Couleur à utiliser

    return Scaffold(
      appBar: AppBar(
        title: const Text("Mon Album des Chanteurs"),
        centerTitle: true,
        backgroundColor: appBarColor,
        elevation: 4,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: appBarColor, // Couleur de fond du header
              ),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Liste des Chanteurs',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: singers.length,
                itemBuilder: (context, index) {
                  final singer = singers[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(singer.imageUrl),
                    ),
                    title: Text(singer.name),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyHomePage(singerName: singer.name)),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 4,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          ),
          itemCount: singers.length,
          itemBuilder: (context, index) {
            final singer = singers[index];
            return GestureDetector(
              onTap: () {
                if (singer.name == "Céline Dion") {
                  Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => MyHomePage(singerName: singer.name)),
);
                }
              },
              child: Card(
                elevation: 8,
                shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipOval(
                      child: Image.asset(
                        singer.imageUrl,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      singer.name,
                      style:
                          const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.green),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked, // Position au centre du menu en bas
      floatingActionButton:
          FloatingActionButton(
        backgroundColor:
            appBarColor, // Appliquer la même couleur que l'AppBar
        onPressed:
            () async { Navigator.pushNamed(context, '/singers');
},
        child:
            Icon(Icons.add),
      ),
      bottomNavigationBar:
          BottomAppBar(
        color:
            appBarColor, // Appliquer la même couleur que l'AppBar
        shape:
            CircularNotchedRectangle(), // Crée une découpe pour le FAB
        notchMargin:
            8.0, // Marge entre le FAB et le BottomAppBar
        child:
            Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
          children:
              [
            IconButton(
              icon:
                  Icon(Icons.home),
              onPressed:
                  () {},
            ),
            IconButton(
              icon:
                  Icon(Icons.settings),
              onPressed:
                  () {Navigator.pushNamed(context, '/settings');},
            ),
          ],
        ),
      ),
    );
  }
}