import 'package:flutter/material.dart';
import '../models/post_model.dart';
import '../services/api_service.dart';
import 'post_detail_screen.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {

  late Future<List<Post>> futurePosts;

  List<Post> allPosts = [];
  List<Post> filteredPosts = [];

  @override
  void initState() {
    super.initState();
    futurePosts = ApiService().fetchPosts();
  }

  void searchPosts(String query) {

    final results = allPosts.where((post) {

      final title = post.title.toLowerCase();
      final body = post.body.toLowerCase();
      final input = query.toLowerCase();

      return title.contains(input) || body.contains(input);

    }).toList();

    setState(() {
      filteredPosts = results;
    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("API Posts"),
        centerTitle: true,

        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(

              onChanged: searchPosts,

              decoration: InputDecoration(
                hintText: "Search posts...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),

            ),
          ),
        ),
      ),

      body: FutureBuilder<List<Post>>(

        future: futurePosts,

        builder: (context, snapshot) {

          if (snapshot.connectionState == ConnectionState.waiting) {

            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 12),
                  Text(
                    "Loading Posts...",
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
            );
          }

          else if (snapshot.hasError) {

            return Center(
              child: Text(
                snapshot.error.toString(),
                style: const TextStyle(fontSize: 16),
              ),
            );
          }

          else if (snapshot.hasData) {

            allPosts = snapshot.data!;
            filteredPosts = filteredPosts.isEmpty ? allPosts : filteredPosts;

            return ListView.builder(

              itemCount: filteredPosts.length,

              itemBuilder: (context, index) {

                final post = filteredPosts[index];

                return GestureDetector(

                  onTap: () {

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PostDetailScreen(post: post),
                      ),
                    );

                  },

                  child: Card(

                    margin: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 8),

                    elevation: 4,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),

                    child: Padding(

                      padding: const EdgeInsets.all(16),

                      child: Column(

                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [

                          Text(
                            post.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 10),

                          Text(
                            post.body,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.black87,
                            ),
                          ),

                          const SizedBox(height: 12),

                          const Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(Icons.arrow_forward_ios, size: 16),
                            ],
                          )

                        ],
                      ),
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