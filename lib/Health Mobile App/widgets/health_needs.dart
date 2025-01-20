import 'package:flutter/material.dart';
import 'package:flutter_ui_design/Health%20Mobile%20App/models/needed_category.dart';
import 'package:flutter_ui_design/Health%20Mobile%20App/utils/color.dart';

class HealthNeeds extends StatelessWidget {
  const HealthNeeds({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(customIcons.length, (index) {
        return Column(
          children: [
            InkWell(
              onTap: () {
                if (index == customIcons.length - 1) {
                  showModalBottomSheet(
                      context: context,
                      showDragHandle: true,
                      backgroundColor: Colors.white,
                      builder: (context) {
                        return Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(20),
                          height: 410,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Health Needs",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 15),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: List.generate(
                                  healthNeeds.length,
                                  (index) {
                                    return Column(
                                      children: [
                                        Container(
                                          width: 80,
                                          height: 80,
                                          padding: const EdgeInsets.all(20),
                                          decoration: const BoxDecoration(
                                            color: secondaryBgColor,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.asset(
                                              healthNeeds[index].icon),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(healthNeeds[index].name),
                                      ],
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(height: 30),
                              const Text(
                                "Health Needs",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: List.generate(
                                  specialisedCared.length,
                                  (index) {
                                    return Column(
                                      children: [
                                        Container(
                                          width: 80,
                                          height: 80,
                                          padding: const EdgeInsets.all(18),
                                          decoration: const BoxDecoration(
                                            color: secondaryBgColor,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.asset(
                                              specialisedCared[index].icon),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(specialisedCared[index].name),
                                      ],
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        );
                      });
                }
              },
              borderRadius: BorderRadius.circular(190),
              child: Container(
                width: 80,
                height: 80,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: secondaryBgColor,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(customIcons[index].icon),
              ),
            ),
            const SizedBox(height: 12),
            Text(customIcons[index].name),
          ],
        );
      }),
    );
  }
}
