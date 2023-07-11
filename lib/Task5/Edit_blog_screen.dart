import 'package:flutter/material.dart';

class EditBlogScreen extends StatefulWidget {
  const EditBlogScreen({Key? key}) : super(key: key);


  @override
  State<EditBlogScreen> createState() => _EditBlogScreenState();
}

class _EditBlogScreenState extends State<EditBlogScreen> {
  final titleController =TextEditingController();
  final contentController =TextEditingController();
  final imageUrlController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Add Blog'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Content"
              ),
            ),
            const SizedBox(height: 12,),
            TextFormField(
              controller: titleController,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "title"
              ),
            ),

            const SizedBox(height: 10,),
            TextFormField(
              controller: imageUrlController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "image Url"
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (){
                  addNewNote();
                },
                style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
                child: const Text("Add"),
              ),
            )
          ],
        ),
      ),
    );
  }
  void addNewNote(){
    String title = titleController.text;
    String content = contentController.text;
    String imageUrl = imageUrlController.text;
    final blog = Blog (
      title :title,
      content: content,
      imageUrl:imageUrl,
    );
    Navigator.pop(context,blog);
  }

  Blog({required String title, required String content, required String imageUrl}) {}
}