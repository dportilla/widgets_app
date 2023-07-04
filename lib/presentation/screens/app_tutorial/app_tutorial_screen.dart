import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo('Busca la comida', 'Laboris veniam eiusmod qui Lorem do dolore nisi enim irure tempor aliqua duis.', 'assets/images/1.png'),
  SlideInfo('Entrega rápida', 'Consectetur minim dolor dolore commodo dolor ex aliqua fugiat amet veniam tempor fugiat anim et.', 'assets/images/2.png'),
  SlideInfo('Disfruta la comida', 'Sint tempor sint minim commodo ipsum ea elit non culpa ut.', 'assets/images/3.png'),
];

class ApptutorialScreen extends StatefulWidget {
  static const String name = 'apptutorial_screen';
  const ApptutorialScreen({super.key});

  @override
  State<ApptutorialScreen> createState() => _ApptutorialScreenState();
}

class _ApptutorialScreenState extends State<ApptutorialScreen> {

  late final PageController pageViewController = PageController();
  bool isLastPage = false;

  @override
  void initState() {
    
    super.initState();

    pageViewController.addListener(() {
        final page = pageViewController.page ?? 0;

        if (!isLastPage && page >= (slides.length - 1.5)) {
          setState(() {
            isLastPage = true;
          });
        }
     });
  }


  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: slides.map(
              (slideData) => _Slide(
                title: slideData.title,
                caption: slideData.caption,
                imageUrl: slideData.imageUrl,
              )
            ).toList(),
          ),

          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              onPressed: () => context.pop(), 
              child: const Text('Salir', style: TextStyle(color: Colors.black, fontSize: 18))
            ),
          ),

          isLastPage ? Positioned(
            bottom: 30,
            right: 30,
            child: FadeInRight(
              from: 15,
              delay: const Duration(seconds: 1),
              child: FilledButton(
                onPressed: () {
                  
                },
                child: const Text('Comenzar', style: TextStyle(color: Colors.white, fontSize: 18))
              ),
            )
          ) : const SizedBox(),


        ],
      ),
    );
  }
}


class _Slide extends StatelessWidget {

  final String title;
  final String caption;
  final String imageUrl;
  
  const _Slide({
    required this.title, 
    required this.caption, 
    required this.imageUrl
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imageUrl),
            const SizedBox(height: 40),
            Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Text(caption, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}