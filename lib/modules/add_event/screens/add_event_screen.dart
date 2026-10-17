import 'package:evently/modules/add_event/manager/event_manager.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../core/constant/app_category.dart';
import '../../../core/models/event_model.dart';
import '../../../core/services/db_services.dart';
import '../../layouts/widgets/tab_widget.dart';

class AddEventScreen extends StatefulWidget {
  static const String routeName = "AddEventScreen";
  final EventModel? eventModel; // 1. استقبال الـ eventModel في حالة التعديل

  const AddEventScreen({super.key, this.eventModel});

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    bool isEdit = widget.eventModel != null; // 2. معرفة هل نحن في وضع التعديل أم الإضافة

    return ChangeNotifierProvider(
      create: (context) {
        var provider = EventProvider();
        // 3. إذا كنا في وضع التعديل، نقوم بتعبئة البيانات القديمة في الحقول
        if (isEdit) {
          provider.initForEdit(widget.eventModel!);
        }
        return provider;
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,

          title: Text(isEdit ? "Edit event" : "Add Event"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Consumer<EventProvider>(
            builder: (context, provider, child) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(provider.selectedCategory.image),
                    ),
                    DefaultTabController(
                      length: AppCategory.categories.length,
                      initialIndex: provider.index,
                      child: TabBar(
                        dividerColor: Colors.transparent,
                        indicator: const BoxDecoration(color: Colors.transparent),
                        isScrollable: true,
                        onTap: (value) {
                          provider.changeIndex(value);
                        },
                        padding: const EdgeInsets.all(0),
                        tabAlignment: TabAlignment.start,
                        labelPadding: const EdgeInsets.all(8),
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.black,

                        tabs: [
                          ...AppCategory.categories.map((e) {
                            int cattegoreIndex = AppCategory.categories.indexOf(
                              e,
                            );
                            return TabWidget(
                              isSelected: provider.index == cattegoreIndex,
                              category: e,
                            );
                          }).toList(),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text("Title", style: theme.textTheme.titleLarge),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: provider.titleController,
                      decoration: InputDecoration(
                        hintText: "Event title",
                        hintStyle: theme.textTheme.bodyMedium,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text("Description ", style: theme.textTheme.titleLarge),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 168,
                      child: TextFormField(
                        controller: provider.descController,
                        expands: true,
                        maxLines: null,
                        textAlignVertical: TextAlignVertical.top,
                        decoration: InputDecoration(
                          hintText: "Event Description....",
                          hintStyle: theme.textTheme.bodyMedium,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Icon(Icons.date_range, color: theme.primaryColor),
                        const SizedBox(width: 8),
                        Text("Event Date", style: theme.textTheme.titleLarge),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            showDatePicker(
                              context: context,
                              initialDate: provider.selectedDateTime ?? DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime.now().add(const Duration(days: 365)),
                            ).then((value) {
                              if (value != null) {
                                provider.ChangeDate(value);
                              }
                            });
                          },
                          child: Text(
                            provider.selectedDateTime == null
                                ? "Choose date"
                                : DateFormat.yMd().format(provider.selectedDateTime!),
                            style: theme.textTheme.titleMedium!.copyWith(
                              decoration: TextDecoration.underline,
                              decorationColor: theme.primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Icon(Icons.timer, color: theme.primaryColor),
                        const SizedBox(width: 8),
                        Text("Event Time", style: theme.textTheme.titleLarge),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            showTimePicker(
                              context: context,
                              initialTime: provider.selectTimeofDay ?? TimeOfDay.now(),
                            ).then((value) {
                              if (value != null) {
                                provider.ChangeTime(value);
                              }
                            });
                          },
                          child: Text(
                            provider.selectTimeofDay == null
                                ? "Choose Time"
                                : provider.selectTimeofDay!.format(context),
                            style: theme.textTheme.titleMedium!.copyWith(
                              decoration: TextDecoration.underline,
                              decorationColor: theme.primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {

                        if (isEdit) {
                          provider.updateEvent(context, widget.eventModel!.id);
                        } else {
                          provider.addEvent(context);
                        }
                      },
                      child: Center(
                        child: provider.isLoading
                            ? const SizedBox(
                          width: 30,
                          height: 30,
                          child: CircularProgressIndicator(color: Colors.white),
                        )
                            : Text(isEdit ? "Update event" : "Add event"),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}