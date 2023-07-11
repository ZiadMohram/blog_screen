
import 'package:flutter/material.dart';

import 'add_blog_screen.dart';
import 'blog.dart';


class BlogScreen extends StatefulWidget {
  const BlogScreen({Key? key}) : super(key: key);

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  final String imageUrl =
      'https://blog.logrocket.com/wp-content/uploads/2021/05/intro-dart-flutter-feature.png';

  final String name = ' ziad';

  List<Blog> blogs = [
    Blog(
      title: "Piano",
      content:
      "a large keyboard musical instrument with a wooden case enclosing a soundboard and metal strings, which are struck by hammers when the keys are depressed. The strings' vibration is stopped by dampers when the keys are released and can be regulated for length and volume by two or three pedals.",
      imageUrl:
      "https://cdn1.img.sputnikarabic.ae/img/104012/71/1040127161_0:171:4032:2439_600x0_80_0_0_bf877107b21a7dab90c7ce76c503464d.jpg",
    ),
    Blog(
      title: "Titanic submarine",
      content:
      "Missing Titanic submarine LIVE: Can bodies be retrieved after implosion? Experts weigh in",
      imageUrl:
      "https://www.oilandgasmiddleeast.com/cloud/2023/06/23/moNMNmA5-titanic-submarine-1200x800.jpg",
    ),
    Blog(
      title: "Customization Cars",
      content:
      "Two Customized Cars Rolling Through A City Street Photo Photo of two customized cars on a city side street. One car is raised up and the other is very low.",
      imageUrl:
      "https://burst.shopifycdn.com/photos/two-customized-cars-rolling-through-a-city-street.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Blog'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => navigateToAddBlogScreen(),
        backgroundColor: blogs.length < 2 ? Colors.blueGrey : Colors.white,
        child: Icon(
          Icons.add,
          color: blogs.length < 2 ? Colors.white : Colors.blueGrey,
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100,
            child: ListView.builder(
              itemCount: 7,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, idex) {
                return InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(9),
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(imageUrl
                              ),
                            ),
                            const CircleAvatar(
                              radius: 11,
                              backgroundColor: Colors.white,
                            ),
                            const CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.green,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(name.length > 7
                            ? " ${name.substring(0, 7)}..."
                            : name),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: blogs.length,
                itemBuilder: (context, index) {
                  return blogItem(index);
                }),
          ),
        ],
      ),
    );
  }

  Widget blogItem(int index) {
    final blog = blogs[index];

    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.blueGrey,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            child: Image.network(
              blog.imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    blog.title,
                    style: const TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    blogs.removeAt(index);
                    setState(() {

                    });
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.deepOrange,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              blog.content,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  navigateToAddBlogScreen() {
    Navigator.push(context,
      MaterialPageRoute(builder: (context) => const AddBlogScreen(),
      ),
    ).then((value) {
      print(value);
      if ( value == null ) return ;
      blogs.add(value);
      setState(() {});
    });
  }
}