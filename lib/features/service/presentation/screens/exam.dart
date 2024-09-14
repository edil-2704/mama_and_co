import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Категории', style: TextStyle(color: Colors.purple)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            buildCategory('Здоровье ребенка', 30, [
              buildSubCategory('Чек-листы по здоровью', 2),
              buildSubCategory('Сыпь: нормы и отклонения', 4),
              buildSubCategory('Стул', 3),
              buildSubCategory('ОРВИ', 4),
              buildSubCategory('Прогулка с малышом', 2),
              buildSubCategory('Витамины', 5),
              buildSubCategory('Купание', 2),
              buildSubCategory('Зубы', 3),
              buildSubCategory('Массаж', 3),
              buildSubCategory('Остеопатия', 2),
            ]),
          ],
        ),
      ),
    );
  }
}

Widget buildCategory(String title, int count, List<Widget> subCategories) {
  return ExpansionTile(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        Text(count.toString(), style: TextStyle(color: Colors.grey)),
      ],
    ),
    children: subCategories,
  );
}

Widget buildSubCategory(String title, int count) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Row(
          children: [
            Text(count.toString(), style: TextStyle(color: Colors.grey)),
            SizedBox(width: 16),
            Checkbox(value: false, onChanged: (bool? value) {}),
          ],
        ),
      ],
    ),
  );
}

/// Flutter code sample for [ExpansionTile].

class ExpansionTileApp extends StatelessWidget {
  const ExpansionTileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(title: const Text('ExpansionTile Sample')),
        body: const ExpansionTileExample(),
      ),
    );
  }
}

class ExpansionTileExample extends StatefulWidget {
  const ExpansionTileExample({super.key});

  @override
  State<ExpansionTileExample> createState() => _ExpansionTileExampleState();
}

class _ExpansionTileExampleState extends State<ExpansionTileExample> {
  bool _customTileExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const ExpansionTile(
          title: Text('ExpansionTile 1'),
          subtitle: Text('Trailing expansion arrow icon'),
          children: <Widget>[
            ListTile(title: Text('This is tile number 1')),
          ],
        ),
        ExpansionTile(
          onExpansionChanged: (bool expanded) {
            setState(() {
              _customTileExpanded = expanded;
            });
          },
          showTrailingIcon: false,
          leading: Image.asset(
            _customTileExpanded
                ? 'assets/images/up.png'
                : 'assets/images/down.png',
            height: 18,
            width: 18,
          ),
          title: Text('ExpansionTile 3'),
          subtitle: Text('Leading expansion arrow icon'),
          children: <Widget>[
            ListTile(title: Text('This is tile number 3')),
          ],
        ),
      ],
    );
  }
}
