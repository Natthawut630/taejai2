import 'package:flutter/material.dart';
import 'package:taejai2/models/project.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class ProjectDetailsPage extends StatelessWidget {
  final Project project;


  const ProjectDetailsPage({Key? key, required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var amountStyle = const TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
        color: Colors.black54);
    var descriptionStyle = const TextStyle(
      fontSize: 12.0,
      color: Colors.black54);
    var percentText =
    ((project.receiveAmount / project.targetAmount) * 100)
        .toStringAsFixed(0);
    var percentTexts = ((project.receiveAmount / project.targetAmount) * 100)
        .toStringAsFixed(0);
    var percent = int.tryParse(percentTexts);

    return Scaffold(
      appBar: AppBar(
          title: Text(
        project.title,
        overflow: TextOverflow.ellipsis,
      )),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index){
          return Card(child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.pinkAccent.withOpacity(0.2)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          project.title,
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            project.imageUrl,
                            width: 400,
                            height: 250.0,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                      const SizedBox(height: 12.0),
                      Text(project.description),
                      const SizedBox(height: 8.0),
                      Text('ระยะเวลาโครงการ: ${project.timeProject}'),
                      const SizedBox(height: 8.0),
                      Text('พื้นที่ดำเนินโครงการ: ${project.areaProject} '),
                      const SizedBox(height: 8.0),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            const Text('ยอดบริจาคขณะนี้'),
                          ],
                        ),
                        Row(
                          children: [
                            Text('${project.receiveAmount} บาท', style: const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.orange,),),
                          ],
                        ),
                        const SizedBox(height: 12.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('เป้าหมาย', style: descriptionStyle),
                                Text('${project.targetAmount} บาท', style: amountStyle),
                              ],
                            ),
                            Text('$percentText%', style: descriptionStyle),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: percent!,
                              child: Container(
                                height: 10.0,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 0.0),
                                color: Colors.orange,
                              ),
                            ),
                            Expanded(
                              flex: 100 - percent,
                              child: Container(
                                height: 10.0,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 0.0),
                                color: const Color(0xFFE8E8E8), //Colors.grey[200],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('${project.duration} วัน', style: descriptionStyle),
                            Row(
                              children: [
                                const Icon(Icons.person, size: 14.0),
                                Text('${project.donateCount}',
                                    style: descriptionStyle),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 12.0),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top : 10.0,bottom: 10.0),
                              child: Row(
                                children: [
                                  Expanded(child: OutlinedButton(onPressed: (){}, child: const Text('ร่วมบริจาค'))),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(child: OutlinedButton(onPressed: (){}, child: const Text('หยิบใส่ตะกร้า'))),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('เเชร์ให้เพื่อน',style: descriptionStyle,),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    icon: const FaIcon(FontAwesomeIcons.line),
                                   onPressed: () { print("Pressed");},),
                                IconButton(
                                  icon: const FaIcon(FontAwesomeIcons.facebook),
                                  onPressed: () { print("Pressed");},),
                                IconButton(
                                  icon: const FaIcon(FontAwesomeIcons.twitter),
                                  onPressed: () { print("Pressed");},),
                              ],
                            ),

                          ],
                        ),
                      ],
                    ),
                  ),
                ),



              ],
            ),
          ));
        },

      ),
    );
  }
  Widget _buildButton2() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 75.0,
        height: 75.0,
        //color: Colors.yellow, // ห้ามกำหนด color ตรงนี้ ถ้าหากกำหนดใน BoxDecoration แล้ว
        decoration: BoxDecoration(
          color: Colors.yellow,
          border: Border.all(color: Colors.blue, width: 3.0),
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
    );
  }
}
