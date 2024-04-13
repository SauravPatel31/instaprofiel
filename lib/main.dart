
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

void main() async{
  runApp(const Myapp());

}

class Myapp extends StatelessWidget{
  const Myapp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram Profile',
      darkTheme: ThemeData.dark(useMaterial3: true),
      home: const InstaProfile(),
    );
  }

}

class InstaProfile extends StatefulWidget{
  const InstaProfile({super.key});

  @override
  State<InstaProfile> createState() => _InstaProfileState();
}

class _InstaProfileState extends State<InstaProfile> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initStvar ate
    super.initState();
     _tabController =TabController(length: 3, vsync: this);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('sauravpatel495',style: TextStyle(fontWeight: FontWeight.bold),),
            Icon(Icons.format_list_bulleted_outlined)
          ],
        ),
        
      ),
      body: Column(
        children: [
          SizedBox(
            height: 80,
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10,right: 5),
                  width: 80,
                  child: const CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage("assets/images/me.jpg",),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(top: 17),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Profiledetails('140', 'Posts'),
                        Profiledetails('953', 'Followers'),
                        Profiledetails('320', 'Following'),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          //insta Bio
          Container(
            margin: const EdgeInsets.only(left: 7),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 300),
                    child: const Text('Saurav Patel | Flutter Developer',style: TextStyle(fontWeight:FontWeight.bold),)),
                ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 300),
                    child: const Text('Developer 💻')),
                ConstrainedBox(constraints: const BoxConstraints(maxWidth: 200),
                child:const Text("Passionate Flutter Developer|Turning ideas into beautiful apps 🚀 | Let's build something amazing together!"),
                )
              ],
            ),
          ),
          const SizedBox(height: 10,),
          //insta Following Button
          SizedBox(
            height: 40,
            width: double.infinity,

            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: ElevatedButton(onPressed: (){}, child: const Text('Follow',style: TextStyle(color: Colors.white),),
                      style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(Colors.blue),
                      shape: const MaterialStatePropertyAll(LinearBorder.none),

                      minimumSize: MaterialStatePropertyAll(Size(MediaQuery.of(context).size.width,MediaQuery.of(context).size.height)),
                        side: const MaterialStatePropertyAll(BorderSide(style: BorderStyle.none)),
                    ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10,),
          //insta highlights
          SizedBox(
            height:78,
            child: ListView.builder(itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 5),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 1,style: BorderStyle.solid,color: Colors.grey)
                    ),
                    child:CircleAvatar(
                      backgroundColor: Colors.black.withOpacity(0.2),
                      radius: 25,
                      child: const Icon(Icons.add,size: 17,),

                    ) ,
                  ),
                  Container(margin: const EdgeInsets.only(left: 10),child: const Text('highlights'))
                ],
              );

            },
            itemCount: 1,
              scrollDirection: Axis.horizontal,
            ),
          ),

          //TabBar
          DefaultTabController(
              length: 3, child: TabBar(tabs: const [
                Tab(icon: Icon(Icons.grid_on),),
                Tab(icon: Icon(Icons.slow_motion_video),),
                Tab(icon: Icon(Icons.person_pin_outlined),)
          ],
          controller: _tabController,
            unselectedLabelColor: Colors.grey.shade600,
            labelColor: Colors.black,
            indicatorColor: Colors.black,

          )
          ),
          //TabBarview
          Expanded(
            child:TabBarView(
                controller: _tabController,
                children: [
                  //Post
                  GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(1.5),
                      height: 500,
                      width: 500,
                      color: Colors.grey.shade200,
                    );
                  },
              itemCount: 5,

              ),
                  //reals
                  const Icon(Icons.slow_motion_video,size: 50,),
                //tag
                  GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(1.5),
                        height: 500,
                        width: 500,
                        color: Colors.grey.shade200,
                      );
                    },
                    itemCount: 8,
                  ),
            ]),
          )
        ],
      ),
    );
  }

Widget Profiledetails(String txt1,String txt2){
    return Column(
      children: [
        Text(txt1,style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 21),),
        Text(txt2,style: const TextStyle(fontSize: 15),),
      ],
    );
}
}

