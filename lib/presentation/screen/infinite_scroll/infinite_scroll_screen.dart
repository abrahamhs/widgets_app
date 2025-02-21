import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScroollScreen extends StatefulWidget {
  static const String routeName = 'infinite_scroll_screen';
  const InfiniteScroollScreen({super.key});

  @override
  State<InfiniteScroollScreen> createState() => _InfiniteScroollScreenState();
}

class _InfiniteScroollScreenState extends State<InfiniteScroollScreen> {

  List<int> imagesIds = [1, 2, 3, 4, 5];
  final ScrollController _scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;

  @override
  void initState() {
    
    super.initState();
    _scrollController.addListener(() {
      if(_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 300){
       loadNextImages();
      }
    });
  }
  void addFiveMoreImages() {
    final lastId = imagesIds.last;
    imagesIds.addAll([
      lastId + 1, 
      lastId + 2, 
      lastId + 3, 
      lastId + 4, 
      lastId + 5
      ]);
  }

  @override
  void dispose() {
    
    _scrollController.dispose();
    isMounted = false;
    super.dispose();
  }
  Future loadNextImages() async {
    if(isLoading) return;
    isLoading = true;

  
    
    setState(() {});
    await Future.delayed(const Duration(seconds: 2));
    addFiveMoreImages();
    isLoading = false;
    //todo revisar si esta montado el componente
    if (!isMounted) return;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: ListView.builder(
          controller: _scrollController,
          itemCount: imagesIds.length,
          itemBuilder: (context, index){
            return FadeInImage(
              fit: BoxFit.cover,
              width: double.infinity,
              height: 300,
              placeholder: const AssetImage('assets/images/jar-loading.gif'),
              image: NetworkImage('https://picsum.photos/id/${imagesIds[index]}/500/300'),
            );
          }
          ),
      ),
        floatingActionButton: FloatingActionButton(
           onPressed: ()=> !isLoading ? context.pop() : null,
            child: isLoading ? SpinPerfect(
              infinite: true,
              child: const Icon(Icons.refresh_rounded)): FadeInRight( from: 20, child: const Icon(Icons.arrow_back_ios_new_outlined)) 
    )
    );
  }
}