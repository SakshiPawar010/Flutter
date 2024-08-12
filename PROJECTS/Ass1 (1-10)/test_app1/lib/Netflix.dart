//Netflix

import 'package:flutter/material.dart';

class Netflix extends StatefulWidget{
    const Netflix({super.key});

@override
State<Netflix> createState()=> _NetflixState();

}

class _NetflixState extends State<Netflix>{


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
      title: const Text(
        "NETFLIX",
        style: TextStyle(fontStyle: FontStyle.normal,fontWeight: FontWeight.bold,color: Colors.red),
  
       ),
       actions:  <Widget>[
        IconButton(
            icon: const Icon(Icons.search),
            onPressed: (){},
        ),
        IconButton(
            icon: const Icon(Icons.favorite_outline),
            onPressed: (){},
        ),
       
       ],
       backgroundColor: Color.fromARGB(255, 0, 0, 0),
       
       ),

       bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon:
           Icon(Icons.home,
           color: Colors.white,
           ),
           label: '',
          ),
          BottomNavigationBarItem(icon:
           Icon(Icons.person,
           color: Colors.white,
           ),
           label: '',
          ),
          BottomNavigationBarItem(icon:
           Icon(Icons.monetization_on,
           color: Colors.white,
           ),
           label: '',
          ),
          
        ],
        backgroundColor: Colors.black,
        ),

       backgroundColor: Color.fromARGB(255, 0, 0, 0),

       body:  SingleChildScrollView (
        
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            
           const Text(
              " Movies",
              style: TextStyle(fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              fontSize:30,
              color: Colors.white ),
            ),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  
                  Image.network(
                  "https://assets-in.bmscdn.com/discovery-catalog/events/tr:w-400,h-600,bg-CCCCCC/et00311762-lmdexnggxy-portrait.jpg",
                  width: 300,
                  height: 380,
                  ),

                  const SizedBox(
                    width: 10,
                  ),
            
                  Image.network(
                  "https://assets-in.bmscdn.com/discovery-catalog/events/tr:w-400,h-600,bg-CCCCCC/et00311762-lmdexnggxy-portrait.jpg",
                  width: 300,
                  height: 400,
            
                  
                  ),

                  const SizedBox(
                    width: 10,
                  ),
            
                  Image.network(
                  "https://assets-in.bmscdn.com/discovery-catalog/events/tr:w-400,h-600,bg-CCCCCC/et00311762-lmdexnggxy-portrait.jpg",
                  width: 300,
                  height: 380,                  
                  ),
                ],
              ),
            ),
            

            const SizedBox(
              height: 20,
            ),

             const Text(
              " Web Series",
              style: TextStyle(fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              fontSize:25,
              color: Colors.white, ),
            ),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Image.network(
                  "https://assetscdn1.paytm.com/images/catalog/product/H/HO/HOMSHERLOCK-HOLHK-P63024784A1CC1B/1563111214645_0..jpg",
                  width: 400,
                  height: 300,),


                  const SizedBox(
                    width: 10,
                  ),
            
                  Image.network(
                  "https://dnm.nflximg.net/api/v6/2DuQlx0fM4wd1nzqm5BFBi6ILa8/AAAAQeIeKt7LlqIJPKrT4aQijclj7K43xRSU3dQXNESNdNbnnJbT6LLWVRT9srUUbHbOo-iOH-8v3o16pUDMQ6tCgNGlkvfwvDOprROIZpQ2rgHtop9rHvbYlvzavMmUSGBCXjynJ80dn4nqZzZmzIUJMQpS.jpg?r=943",
                  width: 400,
                  height: 300,
            
                  
                  ),

                  const SizedBox(
                    width: 10,
                  ),
            
                  Image.network(
                  "https://www.tallengestore.com/cdn/shop/products/PeakyBlinders-NetflixTVShow-ArtPoster_125897c4-6348-41e8-b195-d203700ebcca.jpg?v=1619864555",
                  width: 400,
                  height: 300,                  
                  ),
                ],
              ),
            ),

            const SizedBox(
              height:20,
            ),

            const Text(" Most Popular",
            style:TextStyle(fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.white,),),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0kR0gMemRl9ylPTzmmuQQVb10vo8n7kXL7BeHkeo_4lmJS56C8-WKIy_GYK12wnEmPlc",
                  width:  400,
                  height: 270,),

                  const SizedBox(
                    width: 10,
                  ),

                  Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZ5Cq8kozpWIaq5Aohw4rjKkh_eE7nUkDV5zcHClQaYw&s",
                  width: 400,
                  height: 270,),

                  const SizedBox(
                    width: 10,
                  ),

                  Image.network(
                  "https://dbdzm869oupei.cloudfront.net/img/posters/preview/91008.png",
                  width: 400,
                  height: 270,
                  ),
                ],
              ),
              
            )
                
              ],
            ),

              
          

          

          

          
        ),
        );
        

  }
}