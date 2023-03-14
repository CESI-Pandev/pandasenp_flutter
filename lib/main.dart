import 'package:directus/directus.dart';
import 'package:flutter/material.dart';
import 'package:pandasenp_flutter/pages/welcome.dart';
import 'package:pandasenp_flutter/directus/directus.dart';
import 'package:pandasenp_flutter/env.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  directus = await Directus(Env.directusServer).init();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,

  });
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.green,
      ),
      home: WelcomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  addPost() {
    if (directus == null) {
      throw Exception('Directus not initialized');
    }

    if (!directus!.auth.isLoggedIn) {
      throw Exception('Not authenticated');
    }

    directus!.items('post').createOne({
      'title': 'My first post',
      'content': 'This is my first post',
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = directus?.auth.isLoggedIn ?? false;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: FutureBuilder<DirectusListResponse<Map<String, dynamic>>>(
            future: directus!.items('post').readMany(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var posts = snapshot.data!.data;
                print(posts);
                return Column(
                  children: [
                    Text('Logged in : $isLoggedIn'),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Wrap(
                        children: posts.map((post) {
                          return PostCardWidget(
                            title: post['title'] as String,
                            content: post['content'] as String,
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                if (snapshot.error is DirectusError) {
                  var error = snapshot.error as DirectusError;
                  return Text('Error : ${error.message}');
                }
                return Text('${snapshot.error}');
              } else {
                return const Text('No data');
              }
            },
          ),
        ),
      ),
      floatingActionButton: !isLoggedIn
        ? null
        :FloatingActionButton(
        onPressed: () {
          addPost();
        },
        tooltip: 'Add Post',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class PostCardWidget extends StatelessWidget {
  final String title;
  final String content;
  const PostCardWidget({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      constraints: const BoxConstraints(
        maxWidth: 400,
        maxHeight: 300,
      ),
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              FittedBox(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headline4,
                  // overflow: TextOverflow.ellipsis,
                ),
              ),
              Flexible(
                child: Text(
                  content,
                  style: Theme.of(context).textTheme.bodyText1,
                  overflow: TextOverflow.fade,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}