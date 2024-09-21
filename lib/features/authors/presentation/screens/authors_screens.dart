import 'package:flutter/material.dart';

class AuthorsScreen extends StatelessWidget {
  const AuthorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Автор',
          style: TextStyle(
            color: Color(0xff4D4DE8),
          ),
        ),
        leading: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_new),
            ),
            // Text('Назад'),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset('assets/images/save.png'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: const [
                  BuildCategory(
                    title: 'Специалисты',
                    count: 30,
                    subCategories: [
                      BuildSubCategory(
                        title: 'Чек-листы по здоровью',
                        count: 2,
                      ),
                      BuildSubCategory(
                        title: 'Стул',
                        count: 2,
                      ),
                      BuildSubCategory(
                        title: 'ОРВИ',
                        count: 2,
                      ),
                      BuildSubCategory(
                        title: 'Прогулка с малышом',
                        count: 2,
                      ),
                      BuildSubCategory(
                        title: 'Витамины',
                        count: 2,
                      ),
                      BuildSubCategory(
                        title: 'Зубы',
                        count: 2,
                      ),
                      BuildSubCategory(
                        title: 'Массаж',
                        count: 2,
                      ),
                      BuildSubCategory(
                        title: 'Остеопатия',
                        count: 2,
                      ),
                    ],
                  ),
                  BuildCategory(
                    title: 'Первая помощь',
                    count: 19,
                    subCategories: [
                      BuildSubCategory(
                        title: 'Чек-листы по здоровью',
                        count: 2,
                      )
                    ],
                  ),
                  BuildCategory(
                    title: 'Грудное и искусственное вскармливание',
                    count: 19,
                    subCategories: [
                      BuildSubCategory(
                        title: 'Чек-листы по здоровью',
                        count: 2,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffCED1D9),
                        fixedSize: Size(109, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Очистить',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffE1E6FF),
                          fixedSize: Size(241, 48),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          foregroundColor: Color(0xff4D4DE8)),
                      child: Text('Подтвердить'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BuildCategory extends StatelessWidget {
  final String title;
  final int count;
  final List<Widget> subCategories;

  const BuildCategory({
    super.key,
    required this.title,
    required this.count,
    required this.subCategories,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData().copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        iconColor: Color(0xff4D4DE8),
        controlAffinity: ListTileControlAffinity.leading,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 10,
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Text(
                count.toString(),
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Expanded(
              child: CommonCheckBoxWidget(),
            )
          ],
        ),
        children: subCategories,
      ),
    );
  }
}

class CommonCheckBoxWidget extends StatefulWidget {
  const CommonCheckBoxWidget({
    super.key,
  });

  @override
  State<CommonCheckBoxWidget> createState() => _CommonCheckBoxWidgetState();
}

class _CommonCheckBoxWidgetState extends State<CommonCheckBoxWidget> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isChecked,
      activeColor: Color(0xff4D4DE8),
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}

class BuildSubCategory extends StatelessWidget {
  final String title;
  final int count;

  const BuildSubCategory({
    super.key,
    required this.title,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage('assets/images/img.png'),
        ),
        SizedBox(width: 10),
        Flexible(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 17),
              ),
              SizedBox(width: 3),
              Container(
                alignment: Alignment.center,
                height: 12,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  'data',
                  style: TextStyle(fontSize: 10),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 40),
        Row(
          children: [
            Text(
              count.toString(),
              style: TextStyle(color: Colors.grey, fontSize: 17),
            ),
            CommonCheckBox(),
          ],
        ),
      ],
    );
  }
}

class CommonCheckBox extends StatefulWidget {
  const CommonCheckBox({
    super.key,
  });

  @override
  State<CommonCheckBox> createState() => _CommonCheckBoxState();
}

class _CommonCheckBoxState extends State<CommonCheckBox> {
  bool firstValue = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
        activeColor: Color(0xff4D4DE8),
        value: firstValue,
        onChanged: (bool? value) {
          setState(() {
            firstValue = value!;
          });
        });
  }
}
