import 'package:flutter/material.dart';
import '../models/post_model.dart';
import '../services/api_service.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {

  late Future<List<Post>> futurePosts;

  @override
  void initState() {
    super.initState();
    futurePosts = ApiService().fetchPosts();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("API Posts"),
        centerTitle: true,
      ),

      body: FutureBuilder<List<Post>>(

        future: futurePosts,

        builder: (context, snapshot) {

          // Loading
          if (snapshot.connectionState == ConnectionState.waiting) {

            return const Center(
              child: CircularProgressIndicator(),
            );

          }

          // Error
          else if (snapshot.hasError) {

            return Center(
              child: Text(
                snapshot.error.toString(),
                style: const TextStyle(fontSize: 16),
              ),
            );

          }

          // Data Loaded
          else if (snapshot.hasData) {

            final posts = snapshot.data!;

            return ListView.builder(

              itemCount: posts.length,

              itemBuilder: (context, index) {

                final post = posts[index];

                return Card(

                  margin: const EdgeInsets.symmetric(
                      horizontal: 15, vertical: 8),

                  elevation: 3,

                  child: Padding(

                    padding: const EdgeInsets.all(15),

                    child: Column(

                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [

                        Text(
                          post.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 10),

                        Text(
                          post.body,
                          style: const TextStyle(fontSize: 16),
                        ),

                      ],

                    ),

                  ),

                );

              },

            );

          }

          return const SizedBox();

        },

      ),

    );

  }

}