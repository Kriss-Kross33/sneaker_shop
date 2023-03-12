import 'package:flutter/material.dart';
import 'package:sneaker_shop/src/utils/utils.dart';

class SneakerTabView extends StatelessWidget {
  final Color selectedColor;
  const SneakerTabView({
    super.key,
    required this.selectedColor,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return DefaultTabController(
      length: 3,
      child: SizedBox(
        height: 45,
        child: Theme(
          data: theme.copyWith(
            colorScheme: theme.colorScheme.copyWith(
              surfaceVariant: Colors.transparent,
            ),
          ),
          child: TabBar(
            indicatorColor: Colors.transparent,

            //unselectedLabelColor: Colors.black,

            labelPadding: const EdgeInsets.symmetric(horizontal: 10),
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
            tabs: [
              Tab(
                child: Text(
                  'Basketball',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: selectedColor,
                        fontSize: 24,
                      ),
                ),
              ),
              Tab(
                child: Text(
                  'Running',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: AppColor.white,
                        fontSize: 24,
                      ),
                ),
              ),
              Tab(
                child: Text(
                  'Training',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: AppColor.white,
                        fontSize: 24,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
