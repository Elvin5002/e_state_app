import '../../widgets/loading_button.dart';
import '../../../utilities/constants/app_text_styles.dart';
import '../../../utilities/helpers/pager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'select_image.dart';
import '../../../cubits/property/property_cubit.dart';
import 'widgets/count_icons.dart';
import '../../widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utilities/helpers/snacks.dart';

class AddProperty extends StatefulWidget {
  AddProperty({Key? key}) : super(key: key);

  @override
  State<AddProperty> createState() => _AddPropertyState();
}

class _AddPropertyState extends State<AddProperty> {
  final List<String> _propertyTypes = ['House', 'Apartment', 'Villa'];
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PropertyCubit>();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Text(
                'Add Property',
                style: AppTextStyles.poppinsS16W500Black,
              ),
              20.verticalSpace,
              CustomInput(
                  hintText: 'Title',
                  controller: cubit.titleController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Title cannot be empty';
                    }
                    return null;
                  }),
              10.verticalSpace,
              CustomInput(
                  hintText: 'Description',
                  controller: cubit.descriptionController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Description cannot be empty';
                    }
                    return null;
                  }),
              10.verticalSpace,
              CustomInput(
                  hintText: 'Location',
                  controller: cubit.locationController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Location cannot be empty';
                    }
                    return null;
                  }),
              10.verticalSpace,
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: CustomInput(
                        hintText: 'Price',
                        controller: cubit.priceController,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Price cannot be empty';
                          }
                          return null;
                        }),
                  ),
                  20.horizontalSpace,
                  Expanded(
                    flex: 1,
                    child: CustomInput(
                        hintText: 'Size',
                        controller: cubit.sizeController,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Size cannot be empty';
                          }
                          return null;
                        }),
                  ),
                ],
              ),
              15.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Proprety type', style: AppTextStyles.poppinsS14W500Black,),
                  DropdownButton<String>(
                    value: cubit.selectedCategory.value,
                    items: _propertyTypes
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        cubit.selectedCategory.value = newValue;
                      });
                    },
                  ),
                ],
              ),
              15.verticalSpace,
              CountIcons(
                minusClick: () {
                  setState(() {
                    if (cubit.bedroomCount.value > 1) {
                      cubit.bedroomCount.value--;
                    }
                  });
                },
                plusClick: () {
                  setState(() {
                    if (cubit.bedroomCount.value < 10) {
                      cubit.bedroomCount.value++;
                    }
                  });
                },
                count: '${cubit.bedroomCount.value}',
                room: 'Bedroom',
              ),
              10.verticalSpace,
              CountIcons(
                minusClick: () {
                  setState(() {
                    if (cubit.bathroomCount.value > 1) {
                      cubit.bathroomCount.value--;
                    }
                  });
                },
                plusClick: () {
                  setState(() {
                    if (cubit.bathroomCount.value < 10) {
                      cubit.bathroomCount.value++;
                    }
                  });
                },
                count: '${cubit.bathroomCount.value}',
                room: 'Bathroom',
              ),
              10.verticalSpace,
              CountIcons(
                minusClick: () {
                  setState(() {
                    if (cubit.kitchenCount.value > 1) {
                      cubit.kitchenCount.value--;
                    }
                  });
                },
                plusClick: () {
                  setState(() {
                    if (cubit.kitchenCount.value < 10) {
                      cubit.kitchenCount.value++;
                    }
                  });
                },
                count: '${cubit.kitchenCount.value}',
                room: 'Kitchen',
              ),
              20.verticalSpace,
              ElevatedButton(
                onPressed: () async {
                  LatLng? selectedLocation = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Pager.selectLocation,
                    ),
                  );
                  if (selectedLocation != null) {
                    cubit.updateLocation(selectedLocation);
                  }
                },
                child: Text("Select Location", style: AppTextStyles.poppinsS14W400Black,),
              ),
              20.verticalSpace,
              const SelectImage(),
              20.verticalSpace,
              BlocConsumer<PropertyCubit, PropertyState>(
                listener: (context, state) {
                  if (state is PropertyFailure) {
                    Snacks.error(context, state.message);
                  } else if (state is PropertySuccess) {
                    Snacks.success(context, 'Successfully Added');
                    cubit.clearInputs();
                  }
                },
                builder: (context, state) {
                  final isLoading = state is PropertyLoading;
                  return LoadingButton(
                    onTap: () {
                      if (formKey.currentState?.validate() ?? false) {
                        cubit.addProperty();
                      }
                    },
                    text: 'Save', 
                    isLoading: isLoading
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
