import 'package:flutter/material.dart';
import 'package:movieapp/homepage/provider/home_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    var home = Provider.of<HomeProvider>(context, listen: false);
    home.getMovie(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title: const Text(
            "HomePage",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              SizedBox(
                height: size.height * 0.02,
              ),
              // const DrawerHeader(
              //   decoration: BoxDecoration(
              //       color: Colors.grey,
              //       borderRadius:
              //           BorderRadius.vertical(bottom: Radius.circular(15))),
              //   child: CircleAvatar(
              //       radius: 40,
              //       backgroundColor: Colors.white,
              //       child: Icon(Icons.image)),
              // ),
              ExpansionTile(
                leading: const Icon(Icons.info_outline,
                    size: 30, color: Colors.black),
                title: const Text('Company Info',
                    style: TextStyle(color: Colors.black, fontSize: 20)),
                children: [
                  Container(
                    height: size.height * 0.15,
                    width: size.width * 0.9,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Company: Geeksynergy Technologies Pvt Ltd"),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        const Text("Address: Sanjayanagar, Bengaluru-56"),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        const Text("Phone: XXXXXXXXX09"),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        const Text("Email: XXXXXX@gmail.com"),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        body: Consumer<HomeProvider>(
            builder: (context, home, child) => Form(
                    child: SingleChildScrollView(
                  child: ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: home.result.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            height: size.height * 0.40,
                            width: size.width * 0.9,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    offset: const Offset(0, 3),
                                  )
                                ],
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: size.height * 0.30,
                                      width: size.width * 0.2,
                                      color: Colors.white,
                                      child: Column(
                                        children: [
                                          const Icon(
                                            Icons.arrow_drop_up,
                                            size: 70,
                                          ),
                                          SizedBox(
                                            height: size.height * 0.01,
                                          ),
                                          Text(
                                            "${home.result[index].totalVoted}",
                                            style:
                                                const TextStyle(fontSize: 20),
                                          ),
                                          SizedBox(
                                            height: size.height * 0.01,
                                          ),
                                          const Icon(
                                            Icons.arrow_drop_down,
                                            size: 70,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width * 0.02,
                                    ),
                                    Container(
                                      height: size.height * 0.30,
                                      width: size.width * 0.2,
                                      color: Colors.white,
                                      child: Image.network(
                                        "${home.result[index].poster}",
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width * 0.02,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      height: size.height * 0.30,
                                      width: size.width * 0.47,
                                      color: Colors.white,
                                      child: Row(
                                        children: [
                                          Column(
                                            children: [
                                              Container(
                                                height: size.height * 0.04,
                                                width: size.width * 0.4,
                                                color: Colors.white,
                                                child: Text(
                                                  "${home.result[index].title}",
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                ),
                                              ),
                                              SizedBox(
                                                height: size.height * 0.01,
                                              ),
                                              Container(
                                                height: size.height * 0.04,
                                                width: size.width * 0.4,
                                                color: Colors.white,
                                                child: Text(
                                                    "Genre:${home.result[index].genre}"),
                                              ),
                                              SizedBox(
                                                height: size.height * 0.01,
                                              ),
                                              Container(
                                                height: size.height * 0.04,
                                                width: size.width * 0.4,
                                                color: Colors.white,
                                                child: Center(
                                                  child: Text(
                                                      "Director:${home.result[index].director![0]}"),
                                                ),
                                              ),
                                              SizedBox(
                                                height: size.height * 0.01,
                                              ),
                                              Container(
                                                height: size.height * 0.04,
                                                width: size.width * 0.4,
                                                color: Colors.white,
                                                child: Center(
                                                  child: Text(
                                                      "Starring:${home.result[index].stars![0]}"),
                                                ),
                                              ),
                                              SizedBox(
                                                height: size.height * 0.01,
                                              ),
                                              Container(
                                                height: size.height * 0.06,
                                                width: size.width * 0.4,
                                                color: Colors.white,
                                                child: Row(
                                                  children: [
                                                    Text(
                                                        "${home.result[index].language}")
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: size.height * 0.01,
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: size.height * 0.02,
                                ),
                                Container(
                                  height: size.height * 0.05,
                                  width: size.width * 0.9,
                                  decoration: const BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                  child: const Center(
                                      child: Text(
                                    "Watch Trailer",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  )),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ))));
  }
}
