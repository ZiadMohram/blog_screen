import 'package:flutter/material.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const NotesScreen(),
    );
  }
}

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  List<String> time = ["15:20", "20:20", "20:52", "16:40", "17:00"];
  List<String> names = ["Ziad", "Moharam", "Mahmoud", "Ahmed", "Youssef"];
  List<String> messages = ["I'm on my way", "send me your location", "How are you, today", "I'm busy right now, call me later", "Good evening"];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Messages",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView.builder(
            itemCount: names.length,
            itemBuilder: (context, index) {
              return namesItem(index);
            }
        ),
      ),
    );
  }

  Widget namesItem(int index){
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(
                  "https://th.bing.com/th/id/R.e6e5ba63e95200efa5a20649428b258c?rik=QHK4sP9rFm30EQ&pid=ImgRaw&r=0",
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        names[index],
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          time[index],
                        ),
                      ),
                    ],
                  ),
                  Text(
                    messages[index],
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                onPressed: (){},
                icon: const Icon(
                    Icons.arrow_forward_ios
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}