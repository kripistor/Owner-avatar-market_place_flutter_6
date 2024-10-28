import 'package:flutter/material.dart';
import '../models/product_model.dart';

class AddProductPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _imageController = TextEditingController();
  final _priceController = TextEditingController();
  final _brandController = TextEditingController();
  final _processorController = TextEditingController();
  final _ramController = TextEditingController();
  final _storageController = TextEditingController();
  final _displayController = TextEditingController();
  final _articleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Добавить товар'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Название'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Пожалуйста, введите название';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Описание'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Пожалуйста, введите описание';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _imageController,
                decoration: const InputDecoration(labelText: 'URL изображения'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Пожалуйста, введите URL изображения';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _priceController,
                decoration: const InputDecoration(labelText: 'Цена'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Пожалуйста, введите цену';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _brandController,
                decoration: const InputDecoration(labelText: 'Бренд'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Пожалуйста, введите бренд';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _processorController,
                decoration: const InputDecoration(labelText: 'Процессор'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Пожалуйста, введите процессор';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _ramController,
                decoration:
                    const InputDecoration(labelText: 'Оперативная память'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Пожалуйста, введите оперативную память';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _storageController,
                decoration: const InputDecoration(labelText: 'Хранилище'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Пожалуйста, введите хранилище';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _displayController,
                decoration: const InputDecoration(labelText: 'Дисплей'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Пожалуйста, введите информацию о дисплее';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _articleController,
                decoration: const InputDecoration(labelText: 'Артикул'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Пожалуйста, введите артикул';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final newProduct = Product(
                      id: products.length + 1,
                      name: _nameController.text,
                      description: _descriptionController.text,
                      image: _imageController.text,
                      price: double.parse(_priceController.text),
                      brand: _brandController.text,
                      processor: _processorController.text,
                      ram: _ramController.text,
                      storage: _storageController.text,
                      display: _displayController.text,
                      article: int.parse(_articleController.text),
                    );

                    Navigator.pop(context, newProduct);
                  }
                },
                child: const Text('Добавить'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
