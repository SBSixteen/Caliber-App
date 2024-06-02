import 'package:calibre/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountsScreen extends ConsumerStatefulWidget {
  const AccountsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    // TODO: implement createState
    return _AccountsScreenState();
  }
}

class _AccountsScreenState extends ConsumerState<AccountsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(constants.someUser!.email!,
            style: const TextStyle(fontFamily: "Inter", color: Colors.white)),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.chevron_left,
              color: Colors.white,
            )),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text(
              "Wishlist",
              style: constants.blacksubheadings,
            ),
            leading: const Icon(Icons.favorite, color: Colors.grey,),
            trailing: const Icon(Icons.chevron_right, color: Colors.grey),
          ),
        ListTile(
            title: Text(
              "Past Orders",
              style: constants.blacksubheadings,
            ),
            leading: const Icon(Icons.shopping_basket_outlined, color: Colors.grey,),
            trailing: const Icon(Icons.chevron_right, color: Colors.grey),
          ),
                  ListTile(
            title: Text(
              "About",
              style: constants.blacksubheadings,
            ),
            leading: const Icon(Icons.info_outline, color: Colors.grey,),
            trailing: const Icon(Icons.chevron_right, color: Colors.grey),
          )
        ],
      ),
    );
  }
}
