import 'package:flutter/material.dart';
import 'package:n8_default_project/ui/home/widgets/page_item_view.dart';
import 'package:n8_default_project/ui/home/widgets/universal_input.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController controller = TextEditingController();
  final ScrollController listController = ScrollController();
  final PageController pageController = PageController();
  bool isObscure = false;
  late int counter;

  int activeIndex = 0;

  @override
  void initState() {
    print("NAME:${widget.name}");
    counter = 0;
    listController.addListener(() {
      print("CURRENT  PIXELS:${listController.position.pixels}");
      print("CURRENT MAX EXTENT:${listController.position.maxScrollExtent}");
      print("CURRENT MIN EXTENT:${listController.position.minScrollExtent}");

      if (listController.position.pixels ==
          listController.position.maxScrollExtent) {
        print("THE END");
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text(
                counter.toString(),
                style: const TextStyle(fontSize: 45),
              ),
              UniversalInput(
                isObscure: isObscure,
                controller: controller,
                obscureTap: () => setState(() {
                  isObscure = !isObscure;
                }),
              ),
              Expanded(
                child: ListView(
                  controller: listController,
                  children: [
                    ...List.generate(
                      30,
                      (index) => ListTile(
                        title: Text("HELLO   $index"),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * (110 / 812) + 32,
                child: PageView(
                  onPageChanged: (index) {
                    activeIndex = index;
                  },
                  controller: pageController,
                  children: [
                    ...List.generate(
                      5,
                      (index) => PageItemView(
                        number: index,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                  onPressed: () {
                    if (activeIndex < 5) {
                      activeIndex++;
                    }
                    setState(() {
                      pageController.animateToPage(
                        activeIndex,
                        duration: Duration(seconds: 1),
                        curve: Curves.bounceOut,
                      );
                    });
                  },
                  child: Text("Next"))
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: () {
      //     counter = controller.text.length;
      //     setState(() {});
      //   },
      // ),
    );
  }
}
