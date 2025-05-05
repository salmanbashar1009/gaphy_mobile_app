import 'package:flutter/material.dart';

class Post {
  String text;
  int likes;

  Post(this.text, {this.likes = 0});
}

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  List<Post> posts = [
    Post("Hello, this is my first post!"),
    Post("Loving Flutter! ❤️"),
    Post("Just another simulated post."),
  ];

  void _showCommentModal(Post post) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Comments"),
          content: Text("This is a comment modal for: \"${post.text}\""),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: Text("Close")),
          ],
        );
      },
    );
  }

  void _addNewPost() {
    TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text("Create New Post"),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(hintText: "Enter post text"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                String newText = controller.text.trim();
                if (newText.isNotEmpty) {
                  setState(() {
                    posts.insert(0, Post(newText));
                  });
                }
                Navigator.pop(context);
              },
              child: Text("Post"),
            ),
            TextButton(onPressed: () => Navigator.pop(context), child: Text("Cancel")),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Simulated Posts")),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (_, index) {
          final post = posts[index];
          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              title: Text(post.text),
              subtitle: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.thumb_up),
                    onPressed: () {
                      setState(() => post.likes++);
                    },
                  ),
                  Text('${post.likes}'),
                  SizedBox(width: 20),
                  IconButton(
                    icon: Icon(Icons.comment),
                    onPressed: () => _showCommentModal(post),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewPost,
        child: Icon(Icons.add),
      ),
    );
  }
}
