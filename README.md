# Лабораторная #5
## Shared Preferences
Постоянное хранилище, используемое приложениями для хранения простых данных. Это хранилище является относительно постоянным, пользователь может зайти в настройки приложения и очистить данные приложения, тем самым очистив все данные в хранилище. Принимает данные в формате ключ – значения.
### Хранит типы данных: int, double, bool, String и List<String>
### Инициализация Shared 
``` dart
final prefs = await SharedPreferences.getInstance();
await prefs.setInt('counter', 1);
await prefs.setBool('repeat', true);
await prefs.setDouble('decimal', 1.5);
await prefs.setString('action', 'start');
await prefs.setStringList('items', <String>['Sun', 'Earth', 'Moon']);
```
### Получение данных 
``` dart
final int? counter = prefs.getInt('counter');
final bool? repeat = prefs.getBool('repeat');
final double? decimal = prefs.getDouble('decimal');
final String? action = prefs.getString('action');
final List<String>? items = prefs.getStringList('items');
```
### Удаление записи
```dart
final success = await prefs.remove('counter');
```

## SQflite
Библиотека для Flutter для работы с реляционными базами данных, которая совмещает в себе элементы ORM и SQL DDL. Наиболее надёжное средство хранения данных с поддержкой миграций.
### Инициализация 
``` dart
class DBProvide{
    DBProvider._();
    static final DBProvider db  = DBProvider._();
    static Database? _database;

    Future<Database> get database async {
        if (_database != null) {
            return _database!;
        }

        _database = await _initDB();
        return _database;
    }

    Future<Database> _initDB async {
        Directory dir = await getApplicationDirectory();
        String path = dir.path + 'mybase.db';
        return await openDatabase(path, version: 1, onCreate: _createDB);
    }

    Future<void> _createDB(Database db, int version){
        await db.execute('''CREATE TABLE persons(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            phone TEXT
        )''')
    }
}
```