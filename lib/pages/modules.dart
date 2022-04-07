import 'package:flutter/material.dart';
import 'package:senior_project/main_layout/custom_page.dart';
import 'package:senior_project/models/module.dart';
import 'package:senior_project/modules/module_button.dart';
import 'package:senior_project/modules/module_difficulty_selection.dart';
import 'package:senior_project/util.dart';

// Use this function to get some data from the database.
// Future<List<Map>> getData() async {
//   Database db = await getDatabase();
//   return await db.rawQuery('SELECT * FROM vocab_table');
// }

// class ModulesPageChild extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         children: <Widget>[
//           ElevatedButton(
//               child: Text('Pre Operation'),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => const PreOperationPage()),
//                 );
//               }),
//           ElevatedButton(
//               child: Text('During Operation'),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => const DuringOperationPage()),
//                 );
//               }),
//           ElevatedButton(
//               child: Text('Post Operation'),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => const PostOperationPage()),
//                 );
//               }),

//           // The below widget will render a VocabCard for the first row of the
//           // result from the database query (see the getData function above).
//           // We should probably have better type safety somehow instead of
//           // doing "snapshot.data as a List<Map>" but for now this works.
//           FutureBuilder(
//             future: getData(),
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return VocabCard(
//                     term: (snapshot.data as List<Map>)[0]['term'],
//                     definition: (snapshot.data as List<Map>)[0]['def']);
//               }
//               if (snapshot.hasError) {
//                 return Text('Error: ${snapshot.error}');
//               }
//               return const CircularProgressIndicator();
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ModulesPage extends CustomPage {
//   ModulesPage({Key? key})
//       : super(
//             title: 'Modules',
//             icon: Icons.library_books,
//             child: ModulesPageChild());
// }

Future<List<Module>> _getData() async {
  final db = await getDatabase();
  final List<Map<String, dynamic>> maps = await db.query('modules');
  return List.generate(maps.length, (index) => Module.fromJson(maps[index]));
}

final modules = CustomPage(
  title: 'Modules',
  icon: Icons.library_books,
  child: FutureBuilder<List<Module>>(
    future: _getData(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        final List<Module> modules = snapshot.data ?? [];

        return Wrap(
          spacing: 25,
          runSpacing: 25,
          children: modules
              .map((e) => ModuleButton(
                    module: e,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Scaffold(
                            body: ModuleDifficultySelection(module: e),
                          ),
                        ),
                      );
                    },
                  ))
              .toList(),
        );
      }
      if (snapshot.hasError) {
        return Text('Error: ${snapshot.error}');
      }
      return const CircularProgressIndicator();
    },
  ),
);
