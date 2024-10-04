import '../../widgets/loading_button.dart';
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
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddProperty extends StatefulWidget {
  const AddProperty({super.key});

  @override
  State<AddProperty> createState() => _AddPropertyState();
}

class _AddPropertyState extends State<AddProperty> {
  
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PropertyCubit>();
    final List<String> propertyTypes = [
      'House',
      'Apartment',
      'Villa'];
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey, 
          child: Column(
            children: [
              Text(
                AppLocalizations.of(context)!.addProperty,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              20.verticalSpace,
              CustomInput(
                  hintText: AppLocalizations.of(context)!.title,
                  controller: cubit.titleController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppLocalizations.of(context)!.titleEmpty;
                    }
                    return null;
                  }),
              10.verticalSpace,
              CustomInput(
                  hintText: AppLocalizations.of(context)!.description,
                  controller: cubit.descriptionController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppLocalizations.of(context)!.descriptionEmpty;
                    }
                    return null;
                  }),
              10.verticalSpace,
              CustomInput(
                  hintText: AppLocalizations.of(context)!.location,
                  controller: cubit.locationController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppLocalizations.of(context)!.locationEmpty;
                    }
                    return null;
                  }),
              10.verticalSpace,
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: CustomInput(
                        hintText: AppLocalizations.of(context)!.price,
                        controller: cubit.priceController,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return AppLocalizations.of(context)!.priceEmpty;
                          }
                          return null;
                        }),
                  ),
                  20.horizontalSpace,
                  Expanded(
                    flex: 1,
                    child: CustomInput(
                        hintText: AppLocalizations.of(context)!.size,
                        controller: cubit.sizeController,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return AppLocalizations.of(context)!.sizeEmpty;
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
                  Text(AppLocalizations.of(context)!.propertyType, style: Theme.of(context).textTheme.bodyLarge,),
                  DropdownButton<String>(
                    value: cubit.selectedCategory.value,
                    items: propertyTypes
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
                room: AppLocalizations.of(context)!.bedroom,
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
                room: AppLocalizations.of(context)!.bathroom,
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
                room: AppLocalizations.of(context)!.kitchen,
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
                child: Text(AppLocalizations.of(context)!.selectLocation, style: Theme.of(context).textTheme.labelLarge,),
              ),
              20.verticalSpace,
              const SelectImage(),
              20.verticalSpace,
              BlocConsumer<PropertyCubit, PropertyState>(
                listener: (context, state) {
                  if (state is PropertyFailure) {
                    Snacks.error(context, state.message);
                  } else if (state is PropertySuccess) {
                    Snacks.success(context, AppLocalizations.of(context)!.successfullyAdded);
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
                    text: AppLocalizations.of(context)!.save, 
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
