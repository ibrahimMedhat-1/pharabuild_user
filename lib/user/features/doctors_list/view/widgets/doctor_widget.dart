import 'package:flutter/material.dart';
import 'package:intelligent_pharmacy/user/features/doctors_list/view/doctor_details.dart';

class DoctorListWidget extends StatelessWidget {
  const DoctorListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (builder) => DoctorDetails(
                  image: 'assets/test/doctor_img.jpg',
                  tag: '$index',
                  doctorName: 'Doctor Name',
                  doctorNo: '01064172976',
                  address: 'Maadi - cairo - Egypt',
                  speciality: 'Bones',
                ),
              ),
            );
          },
          child: Hero(
            tag: index.toString(),
            child: AspectRatio(
              aspectRatio: 1 / 1.1,
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.all(20),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 5,
                      color: Colors.grey,
                    )
                  ],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        child: Image.asset(
                          'assets/test/doctor_img.jpg',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        children: [
                          Text(
                            'Doctor Name',
                            style: Theme.of(context).textTheme.titleLarge!.copyWith(height: 2),
                          ),
                          Text(
                            'Doctor phone',
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(height: 2),
                          ),
                          Text(
                            'Doctor Address',
                            style: Theme.of(context).textTheme.titleSmall!.copyWith(height: 3),
                          ),
                          Text(
                            'Doctor Speciality',
                            style: Theme.of(context).textTheme.titleSmall!.copyWith(height: 3),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        itemCount: 5,
      ),
    );
  }
}
