import 'package:bloc_travel_app/app_color.dart';
import 'package:bloc_travel_app/cubit/app_cubit_states.dart';
import 'package:bloc_travel_app/cubit/app_cubits.dart';
import 'package:bloc_travel_app/models/data_model.dart';
import 'package:bloc_travel_app/widgets/app_large_texts.dart';
import 'package:bloc_travel_app/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
   'assets/images/balloning.png':'Balloning',
   'assets/images/hiking.png':'Hiking',
   'assets/images/kayaking.png':'Kayaking',
    'assets/images/snorkling.png':'Snorking'
  };
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocBuilder<AppCubits, CubitStates>(
          builder: (context,state){
            if(state is LoadedState)
              {
              final datas = state.places;
               return  Column (
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //menu
                    Container(
                      padding: const EdgeInsets.only(top: 50, left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Icon(
                            Icons.menu,
                            size: 30,
                            color: Colors.black54,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage('assets/images/porfolio.jpeg'),
                            ),
                          )
                          // Container(
                          //   margin: EdgeInsets.only(right: 20),
                          //   width: 50,
                          //   height: 50,
                          //   decoration: BoxDecoration(
                          //       image: const DecorationImage(
                          //           image: AssetImage('assets/images/porfolio.jpeg'),
                          //           fit: BoxFit.cover),
                          //       borderRadius: BorderRadius.circular(100),
                          //       color: Colors.grey.withOpacity(0.5)),
                          // ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: AppLargeText(text: 'Discover')),
                    const SizedBox(
                      height: 40,
                    ),
                    //tab bar
                    Container(
                      child: TabBar(
                        controller: _tabController,
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        indicator:
                        CircleTabIndicator(color: AppColors.mainColor, radius: 5),
                        tabs: const [
                          Tab(
                            text: 'Places',
                          ),
                          Tab(
                            text: 'Inspiration',
                          ),
                          Tab(
                            text: 'Emotion',
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 5.0, right: 5.0),
                      height: 250,
                      width: double.maxFinite,
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          PlacesWidget(datas: datas),
                          Text('There'),
                          Text('Bye'),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppLargeText(
                            text: "Explore more",
                            size: 22,
                            color: AppColors.textColor2,
                          ),
                          AppText(
                            text: "See All",
                            color: AppColors.textColor1,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 120,
                      width: double.maxFinite,
                      margin: const EdgeInsets.only(left: 20),
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: images.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Container(
                                  width: 80,
                                  height: 80,
                                  margin: EdgeInsets.only(right: 30),
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                          image:
                                          AssetImage(images.keys.elementAt(index)),
                                          fit: BoxFit.cover)),
                                ),
                                SizedBox(height: 15,)
                                ,
                                Container(
                                    margin: EdgeInsets.only(right: 30),
                                    child: AppText(text: images.values.elementAt(index), color: AppColors.textColor2,))
                              ],
                            );
                          }),
                    )
                  ],
                );
              }else{
              return Container();
            }

          },
        )
      ),
    );
  }
}

class PlacesWidget extends StatelessWidget {
  const PlacesWidget({Key? key, required this.datas}) : super(key: key);
 final List<DataModel> datas;
  @override
  Widget build(BuildContext context) {

    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: datas.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              BlocProvider.of<AppCubits>(context).goDetail(datas[index]);
            },
            child: Container(
              margin: EdgeInsets.all(8),
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(2.0, 2.0),
                        blurRadius: 2.0,
                        spreadRadius: 1.0)
                  ],
                  image: DecorationImage(
                      image: NetworkImage("http://mark.bslmeiyu.com/uploads/"+datas[index].img), fit: BoxFit.cover)),
            ),
          );
        });
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;

  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;

  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);

    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
