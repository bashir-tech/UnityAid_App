import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 5, 8, 26),
      
      appBar: AppBar(
      
        backgroundColor: Color.fromARGB(255, 5, 8, 26),
        title: Text('AnaSayfa'),
        actions: [
  Row(
    children: [
      Padding(
        padding: EdgeInsets.only(right: 0),
        child: IconButton(
          icon: Icon(Icons.person, size: 35),
          onPressed: () {
            // Perform profile action
          },
        ),
        
      ),
        const SizedBox(height: 15),
               Text("Profile",
               style:TextStyle(
                color:Colors.white,
                fontSize:18
               )),
    ],
  ),
],

      ),
      body: Center(
        child: Column(
            children: [
              Image.asset(
                'assets/img/back.png', // Replace with your image path
                width: 200,
                colorBlendMode: BlendMode.colorDodge,
              ),
              const SizedBox(height: 10),
              const Text(
                "Bir El Uzat, Bir Fark Yarat!",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
                const SizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children:[
                    IconButton(
                  color:Colors.white,
              icon: Icon(Icons.help_outline,
               size:50,),
                onPressed: () {
                  // Perform yardim isle action
                },
              ),
              const SizedBox(height: 15),
               Text("Yardim Iste",
               style:TextStyle(
                color:Colors.white,
                fontSize:18
               )),
                ]
              ),
            
               const SizedBox(width: 100),
              Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  
                  IconButton(
                  color:Colors.white,
                icon: Icon(Icons.mic,
                 size:50),
                
                onPressed: () {
                  // Perform voice icon action
                },
                

              ),
                const SizedBox(height: 15),
               Text("Mikrofonu Ac",
               style:TextStyle(
                color:Colors.white,
                fontSize:18
               )),
            ],

          ),
                ]
              ),
           const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Column(
                children:[
                    IconButton(
                  color:Colors.white,
              icon: Icon(Icons.help,
               size:50,),
                onPressed: () {
                  // Perform yardim isle action
                },
              ),
              const SizedBox(height: 15),
               Text("Yardim Istekleri",
               style:TextStyle(
                color:Colors.white,
                fontSize:18
               )),
                ]
              ),
                const SizedBox(width: 100),

              Column(
                children:[
                    IconButton(
                      
                  color:Colors.white,
              icon: Icon(Icons.location_on, size:50,),
             
                onPressed: () {
                  // Perform yardim isle action
                },
              ),
              const SizedBox(height: 15),
               Text("Konumu Ac",
               style:TextStyle(
                color:Colors.white,
                fontSize:18
               )),
                ]
              ),
            ],
          ),
        ],
      ),


      )
    );
  }
}

 class CustomIcons {
  static const IconData hand = IconData(0xe900, fontFamily: 'CustomIconFont');
}