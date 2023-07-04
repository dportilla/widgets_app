import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const String name = 'infinite_scroll_screen';
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {

  List<int> imagesIds = [10,11,12,13,14,15,16,17,18,19,20];

  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        loadNextImages();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }


  Future loadNextImages() async {
    if (isLoading) return;

    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 2));
    addTenImages();
    isLoading = false;

    // revisar si esta montado el widget
    if (!isMounted) return;
    setState(() {});

    moveScrollToBottom();
  }

  Future<void> onrefresh() async {
    isLoading = true;
    setState(() {
      
    });

    await Future.delayed(const Duration(seconds: 2));
    if (!isMounted) return;

    isLoading = false;
    final lastID = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastID + 1);
    addTenImages();

    setState(() {});
    
  }

  void moveScrollToBottom() {

    if (scrollController.position.pixels + 100 <= scrollController.position.maxScrollExtent) return;

    scrollController.animateTo(
      scrollController.position.pixels + 100,
      duration: const Duration(milliseconds: 250),
      curve: Curves.fastOutSlowIn
    );
  }

  void addTenImages() {
    final lastImageId = imagesIds.last;

    imagesIds.addAll(
      List.generate(10, (index) => lastImageId + index + 1)
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: RefreshIndicator(
        onRefresh: onrefresh,
        edgeOffset: 10,
        child: ListView.builder(
          controller: scrollController,
          itemCount: imagesIds.length,
          itemBuilder: (context, index) {
            return FadeInImage(
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
              placeholder: const AssetImage('assets/images/jar-loading.gif'), 
              image: NetworkImage('https://picsum.photos/id/${ imagesIds[index] }/500/300')
            );
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child: isLoading ? const CircularProgressIndicator() : const Icon(Icons.arrow_back),
      ),


    );
  }
}