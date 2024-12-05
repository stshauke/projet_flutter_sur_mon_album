import 'package:flutter/material.dart';
import 'package:tp02/exemple/LyricsPage.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'apcpedagogie.com',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      
      home: const MyHomePage(
        singerName: 'Céline Dion',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String singerName;

  const MyHomePage({Key? key, required this.singerName}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  final List<Map<String, String>> songs = [
    {
      "title": "The Power of Love",
      "subtitle": "Album: The Colour of My Love",
      "lyrics": "Paroles de la chanson The Power of Love...",
      "url": "https://www.youtube.com/watch?v=Y8HOfcYWZoo", // Lien YouTube
    },
    {
      "title": "Misled",
      "subtitle": "Album: The Colour of My Love",
      "lyrics": "Paroles de la chanson Misled...",
      "url": "https://www.youtube.com/watch?v=c1vuzMuOF7g", // Lien YouTube
    },
    {
      "title": "Think Twice",
      "subtitle": "Album: The Colour of My Love",
      "lyrics": "Paroles de la chanson Think Twice...",
      "url": "https://www.youtube.com/watch?v=vGwIaL0jOUg", // Lien YouTube
    },
    {
      "title": "Only One Road",
      "subtitle": "Album: The Colour of My Love",
      "lyrics": "Paroles de la chanson Only One Road...",
      "url": "https://www.youtube.com/watch?v=przJ8xNAJ1Y", // Lien YouTube
    },
    {
      "title": "Everybody's Talking My Baby Down",
      "subtitle": "Album: The Colour of My Love",
      "lyrics": "Paroles de la chanson Everybody's Talking My Baby Down...",
      "url": "https://www.youtube.com/watch?v=InCM18HJLnU", // Lien YouTube
    },
    {
      "title": "Next Plane Out",
      "subtitle": "Album: The Colour of My Love",
      "lyrics": "Paroles de la chanson Next Plane Out...",
      "url": "https://www.youtube.com/watch?v=AaPwnlrPLgs", // Lien YouTube
    },
    {
      "title": "Real Emotion",
      "subtitle": "Album: The Colour of My Love",
      "lyrics": "Paroles de la chanson Real Emotion...",
      "url": "https://www.youtube.com/watch?v=gIJDxVbMSOI", // Lien YouTube
    },
    {
      "title": "When I Fall In Love",
      "subtitle": "Album: The Colour of My Love",
      "lyrics": "Paroles de la chanson When I Fall In Love...",
      "url": "https://www.youtube.com/watch?v=FUTH1plKYhw", // Lien YouTube
    },
    {
      "title": "Love Doesn't Ask Why",
      "subtitle": "Album: The Colour of My Love",
      "lyrics": "Paroles de la chanson Love Doesn't Ask Why...",
      "url": "https://www.youtube.com/watch?v=ysYcaN1HU6Y", // Lien YouTube
    },
    {
      "title": "Refuse to Dance",
      "subtitle": "Album: The Colour of My Love",
      "lyrics": "Paroles de la chanson Refuse to Dance...",
      "url": "https://www.youtube.com/watch?v=O6wqEeZVD5Y", // Lien YouTube
    },
    {
      "title": "I Remember L.A.",
      "subtitle": "Album: The Colour of My Love",
      "lyrics": "Paroles de la chanson I Remember L.A....",
      "url": "https://www.youtube.com/watch?v=IVaUx_0KVZo", // Lien YouTube
    },
    {
      "title": "No Living Without Loving You",
      "subtitle": "Album: The Colour of My Love",
      "lyrics": "Paroles de la chanson No Living Without Loving You...",
      "url": "https://www.youtube.com/watch?v=MHwKmuH4Rjc", // Lien YouTube
    },
    {
      "title": "Lovin' Proof",
      "subtitle": "Album: The Colour of My Love",
      "lyrics": "Paroles de la chanson Lovin' Proof...",
      "url": "https://www.youtube.com/watch?v=gq0PVaoD06M", // Lien YouTube
    },
    {
      "title": "Just Walk Away",
      "subtitle": "Album: The Colour of My Love",
      "lyrics": "Paroles de la chanson Just Walk Away...",
      "url": "https://www.youtube.com/watch?v=kcUK2zkbQg0", // Lien YouTube
    },
    {
      "title": "To Love You More",
      "subtitle": "Album: The Colour of My Love",
      "lyrics": "Paroles de la chanson To Love You More...",
      "url": "https://www.youtube.com/watch?v=HLeYvefzUFA", // Lien YouTube
    },
  ];

  List<Map<String, String>> filteredSongs = [];
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    filteredSongs = songs;
  }

  void updateSearchQuery(String query) {
    setState(() {
      searchQuery = query;
      filteredSongs = songs
          .where((song) =>
              song['title']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
        const Color appBarColor = Color.fromARGB(255, 193, 235, 194); // Couleur à utiliser

     return Scaffold(
    appBar: AppBar(
      title: Text(widget.singerName),
      centerTitle: true,
        backgroundColor:Color.fromARGB(255, 193, 235, 194),
        elevation: 4,
    ),
    body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Rechercher une chanson',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onChanged: updateSearchQuery,
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: filteredSongs.length,
              itemBuilder: (context, index) {
                final song = filteredSongs[index];
                bool isFavorite = index % 2 == 0; // Exemple de condition pour alterner l'icône

                return MusicCard(
                  color: index % 2 == 0
                      ? const Color.fromARGB(210, 220, 235, 194)
                      : const Color.fromRGBO(210, 243, 156, 1),
                  icon: isFavorite ? Icons.favorite : Icons.file_present, // Changer d'icône
                  title: song["title"]!,
                  subtitle: song["subtitle"]!,
                  lyrics: song["lyrics"]!,
                  url: song["url"]!,
                );
              },
            ),
          ),
        ],
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

class MusicCard extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String title;
  final String subtitle;
  final String lyrics;
  final String url;

  const MusicCard({
    Key? key,
    required this.color,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.lyrics,
    required this.url,
  }) : super(key: key);

  void _navigateToLyricsPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            LyricsPage(title: title, lyrics: lyrics, url: url),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _navigateToLyricsPage(context),
      child: Card(
        color: color,
        shadowColor: Colors.blueGrey,
        elevation: 10,
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: ListTile(
          leading: Icon(icon, color: Colors.cyan, size: 45),
          title: Text(title, style: const TextStyle(fontSize: 20)),
          subtitle: Text(subtitle),
        ),
      ),
    );
  }
}
