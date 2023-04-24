import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class test extends StatefulWidget {
  const test({Key? key}) : super(key: key);

  @override
  _testState createState() => _testState();
}

class _testState extends State<test> {
  late Future<List<usermodel>> _futurePosts;

  @override
  void initState() {
    super.initState();
    _futurePosts = fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(
      appBar: AppBar(
        title: Text('API Example'),
      ),
      body: FutureBuilder<List<usermodel>>(
        future: _futurePosts,
        builder: (context, snapshot) {
          print(snapshot.data);
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                print(snapshot);
                final post = snapshot.data![index];
                return ListTile(
                  title: Text(post.name.toString()),
                  subtitle: Text(post.id.toString()),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    ),);
  }

  Future<List<usermodel>> fetchPosts() async {
    final response =
    await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));


    // if(response.statusCode==200){
    //   //print(response.body);
    //   final List<dynamic> rawdata = jsonDecode(response.body);
    //   print(rawdata.runtimeType);
    //   final List<usermodel> raw =
    //   rawdata.map((rawdata) => usermodel.fromJson(rawdata)).toList();
    //   print(raw.runtimeType);
    //
    // }
    // else{
    //   throw Exception("Bhutan");
    // }

    if (response.statusCode == 200) {
      final List<dynamic> rawPosts = jsonDecode(response.body);
      final List<usermodel> posts =
      rawPosts.map((post) => usermodel.fromJson(post)).toList();

      return posts;
    } else {
      throw Exception('Failed to load posts');
    }
  }
}

class Post {
  final int id;
  final String title;
  final String body;

  Post({required this.id, required this.title, required this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

class usermodel {
   final int id;
   final String name;
   final String username;
   final String email;

  usermodel(
      {required this.id, required this.name, required this.username, required this.email});

  factory usermodel.fromJson(Map<String, dynamic> json){
    return usermodel(id: json['id'],
        name: json['name'],
        username: json['title'],
        email: json['email']);
  }
}