import 'package:flutter/material.dart';
import 'package:flutter_ui_design/Job%20Finder%20App%20UI/Common/job_items.dart';
import 'package:flutter_ui_design/Job%20Finder%20App%20UI/Common/search_bar.dart';
import 'package:flutter_ui_design/Job%20Finder%20App%20UI/Model/job_opportunity_model.dart';

class AllJobsPage extends StatefulWidget {
  const AllJobsPage({
    super.key,
  });
  @override
  _AllJobsPageState createState() => _AllJobsPageState();
}

class _AllJobsPageState extends State<AllJobsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        forceMaterialTransparency: true,
        title: const Text(
          "See All Jobs",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body:  SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const MySearchBar(),
            const SizedBox(height: 15),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20),
               child: SizedBox(
                height:double.maxFinite,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: jobOpportunities
                      .map((job) => JobItems(job: job,),)
                      .toList(),
                ),
                           ),
             ),
          ],
        ),
      ),
    );
  }

  
}
