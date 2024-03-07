import 'package:api_app/userService.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final items = List.generate(20, (i) => i);

  late Future<List<User>> futureUser;

  void initState() {
    super.initState();

    futureUser = Userservice().getuser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "People",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: FutureBuilder<List<User>>(
            future: futureUser,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    User user = snapshot.data?[index];
                    
                    return ListTile(
                      title: Text(user.email),
                      subtitle: Text(user.name.first)
                    );
                    
                  },
                );
              } else if (snapshot.hasError) {
                return Text('ERROR ${snapshot.hasError}');
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ));
  }
}
