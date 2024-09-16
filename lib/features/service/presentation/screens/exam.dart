import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Категории',
          style: TextStyle(
            color: Color(0xff4D4DE8),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  const BuildCategory(
                    title: 'Здоровье ребенка',
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
                  const BuildCategory(
                    title: 'Первая помощь',
                    count: 19,
                    subCategories: [
                      BuildSubCategory(
                        title: 'Чек-листы по здоровью',
                        count: 2,
                      )
                    ],
                  ),
                  const BuildCategory(
                    title: 'Грудное и искусственное вскармливание',
                    count: 19,
                    subCategories: [
                      BuildSubCategory(
                        title: 'Чек-листы по здоровью',
                        count: 2,
                      )
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

class BuildCategory extends StatefulWidget {
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
  State<BuildCategory> createState() => _BuildCategoryState();
}

class _BuildCategoryState extends State<BuildCategory> {
  bool isChecked = false;
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
                widget.title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Text(
                widget.count.toString(),
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Expanded(
              child: CheckboxListTile(
                value: isChecked,
                onChanged: (bool? newValue) {
                  setState(() {
                    isChecked = newValue!;
                  });
                },
                activeColor: Color(0xff4D4DE8),
              ),
            )
          ],
        ),
        children: widget.subCategories,
      ),
    );
  }
}

class BuildSubCategory extends StatefulWidget {
  final String title;
  final int count;

  const BuildSubCategory({
    super.key,
    required this.title,
    required this.count,
  });

  @override
  State<BuildSubCategory> createState() => _BuildSubCategoryState();
}

class _BuildSubCategoryState extends State<BuildSubCategory> {
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.title,
            style: TextStyle(fontSize: 17),
          ),
          Row(
            children: [
              Text(
                widget.count.toString(),
                style: TextStyle(color: Colors.grey, fontSize: 17),
              ),
              Checkbox(
                  activeColor: Color(0xff4D4DE8),
                  value: isCheck,
                  onChanged: (bool? value) {
                    setState(() {
                      isCheck = value!;
                    });
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
