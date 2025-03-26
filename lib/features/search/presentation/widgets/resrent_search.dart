import 'package:dalel/core/utils/colors.dart';
import 'package:flutter/material.dart';

class ResentSearch extends StatelessWidget {
  final Set savedData;
  const ResentSearch({super.key, required this.savedData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 15,
          ),
          Text(
            'Recent',
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: AppColors.headertext),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 200,
            child: GridView.builder(
              itemCount: savedData.length,
              itemBuilder: (c, i) {
                final savedDataList = savedData.toList();
                return Card(
                  color: Colors.white,
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      savedDataList[i],
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, crossAxisSpacing: 3),
            ),
          ),
        ],
      ),
    );
  }
}
