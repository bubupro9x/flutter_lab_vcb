import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:lab6_image_picker/users_model.dart';
import 'package:lab6_image_picker/users_view_model.dart';
import 'package:provider/provider.dart';

import 'detail_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UsersViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: (setting) {
          if (setting.name == '/detail') {
            return MaterialPageRoute(
                builder: (_) => DetailPage(
                      user: setting.arguments as UsersModel,
                    ));
          }
        },
        home: const ContactsPage(title: 'Contacts'),
      ),
    );
  }
}

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key, required this.title});

  final String title;

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<UsersViewModel>(context, listen: false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
          color: Colors.grey.shade400,
        ),
        centerTitle: true,
        actions: [
          Icon(
            Icons.search,
            color: Colors.grey.shade400,
          ),
          const SizedBox(
            width: 8,
          )
        ],
        backgroundColor: Colors.white,
        elevation: 0.4,
        title: Text(
          widget.title,
          style: TextStyle(
              color: Colors.grey.shade700, fontWeight: FontWeight.w600),
        ),
      ),
      backgroundColor: Colors.grey.shade100,
      body: RefreshIndicator(
        onRefresh: () async {
          await Provider.of<UsersViewModel>(context, listen: false).getUsers();
        },
        child: Center(
            child: Consumer<UsersViewModel>(
          builder: (_, vm, __) => vm.users.isEmpty
              ? const Center(
                  child: CupertinoActivityIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemBuilder: (_, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/detail',
                              arguments: vm.users[index]);
                        },
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Hero(
                            tag: vm.users[index].id,
                            child: CircleAvatar(
                              maxRadius: 35,
                              backgroundColor: Colors.blue.withOpacity(0.4),
                              child: Image.network(
                                vm.users[index].avatar,
                                width: 50,
                                height: 50,
                              ),
                            ),
                          ),
                          subtitle: Text(vm.users[index].employment.title),
                          title: Text(
                            '${vm.users[index].lastName} ${vm.users[index].firstName}',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Colors.grey.shade700),
                          ),
                        ),
                      );
                    },
                    itemCount: vm.users.length,
                  ),
                ),
        )),
      ),
    );
  }
}
