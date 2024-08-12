/*import 'package:flutter/material.dart';
import 'package:image_app/post_card.dart';

class Assignment8 extends StatefulWidget{
  const Assignment8({super.key});

  @override
  State<Assignment8> createState() => _Assignment8State();
}

class _Assignment8State extends State<Assignment8>{
  bool c1 = false;
  bool c2 = false;
  bool c3 = false;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Instagram",
          style: TextStyle(
            fontStyle: FontStyle.italic,
            color: Colors.black,
            fontSize: 30,
          ),
        ),
        actions: [
          const Icon(
            Icons.favorite_rounded,
            color: Colors.red,
          )
        ],
      ),
      body: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg",
                width: double.infinity,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite_outline_outlined,
                    ),
                  ),
                  IconButton(
                    onPressed: () {}, 
                    icon: const Icon(
                      Icons.comment_outlined,
                    ),
                  ),
                  IconButton(
                    onPressed: () {}, 
                    icon: const Icon(
                      Icons.send,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}*/

//Instagram Home Page
import 'package:flutter/material.dart';

class Assignment8 extends StatefulWidget{
  const Assignment8({super.key});

  @override
  State<Assignment8> createState() => _Assignment8State();
}

class _Assignment8State extends State<Assignment8> {
  bool c1=false;
  bool c2=false;
  bool c3=false;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Instagram",
          style: TextStyle(
            fontStyle: FontStyle.italic,
            color: Colors.black,
            fontSize: 30,
          ),
        ),
        actions: const [
          Icon(
            Icons.favorite_rounded,
            color:Colors.red
            )
        ],
      ),

     /* body: ListView(
        children: [
           Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(

              color: Colors.amber,
              child :Image.network(

                "https://media.assettype.com/freepressjournal/2023-10/fc7cb71e-2222-4d51-b3fb-5b207a94e725/F8lLe2TXoAAJEVO.jpeg",

                width: double.infinity,
                height: 200,
              ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite_outline_outlined,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon (
                      Icons.comment_outlined,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.send,
                    ),
                  ),
                ],
              ),
            ],
            
          ),
           Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(

              color: Colors.amber,
              child :Image.network(

                "https://media.assettype.com/freepressjournal/2023-10/fc7cb71e-2222-4d51-b3fb-5b207a94e725/F8lLe2TXoAAJEVO.jpeg",

                width: double.infinity,
                height: 200,
              ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite_outline_outlined,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon (
                      Icons.comment_outlined,
                    ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.send,
                      ),
                    ),
                ],
              ),
            ],
            
          ),
           Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(

              color: Colors.lightBlue,
              child :Image.network(

                "https://liveindia.tv/wp-content/uploads/2023/11/ICC-CWC-2023-Virat-Kohli-becomes-first-player-in-history-of-ODIs-to-score-50-tons.webp",

                width: double.infinity,
                height: 200,
              ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite_outline_outlined,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon (
                      Icons.comment_outlined,
                    ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.send,
                      ),
                    ),
                ],
              ),
            ],
            
          ),
        ],
      ),*/
      

     body :SingleChildScrollView(
     child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.amber,
                child :Image.network(
                  "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg",
                  width: double.infinity,
                  height: 200,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        c1 = !c1;
                      });
                    },
                    icon: c1? const Icon(
                      Icons.favorite_rounded,
                      color: Colors.red,)
                    :const Icon(
                       Icons.favorite_outline,
                       )
                  ),
              
                  IconButton(
                    onPressed: () {},
                    icon: const Icon (
                      Icons.comment_outlined,
                    ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.send,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.bookmark_border_outlined,
                      ),
                      ),
                    
                ],
              ),
            ],
            
          ),
         Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(

              color: Colors.amber,
              child :Image.network(

                "https://images.ctfassets.net/hrltx12pl8hq/28ECAQiPJZ78hxatLTa7Ts/2f695d869736ae3b0de3e56ceaca3958/free-nature-images.jpg?fit=fill&w=1200&h=630",

                width: double.infinity,
                height: 200,
              ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        c2 = !c2;
                      });},
                     icon: c2? const Icon(
                      Icons.favorite_rounded,
                      color: Colors.red,)
                    :const Icon(
                       Icons.favorite_outline,
                       )
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon (
                      Icons.comment_outlined,
                    ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.send,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.bookmark_border_outlined,
                      ),
                      ),
                ],
              ),
            ],
            
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(

              color: Colors.amber,
              child :Image.network(

                "https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w1200/2023/10/free-images.jpg",

                width: double.infinity,
                height: 200,
              ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      
                      setState(() {
                        c3 = !c3;
                      });
                    },
                     icon: c3? const Icon(
                      Icons.favorite_rounded,
                      color: Colors.red,)
                    :const Icon(
                       Icons.favorite_outline,
                       )
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon (
                      Icons.comment_outlined,
                    ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.send,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.bookmark_border_outlined,
                      ),
                      ),
                ],
              ),
            ],
            
          ),
        ],),
      ),
    );
  }
}