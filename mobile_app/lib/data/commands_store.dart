
import 'package:mobile_app/models/command.dart';
import 'package:mobile_app/models/command_request.dart';

class CommandsStore {
  static final List<Command> _commands = [
    // NEEDS
    const Command(
      id: 'water',
      category: CommandType.needs,
      iconKey: 'water',
      titleKey: 'commands.water',
      order: 1,
    ),
    const Command(
      id: 'food',
      category: CommandType.needs,
      iconKey: 'food',
      titleKey: 'commands.food',
      order: 2,
    ),
    const Command(
      id: 'toilet',
      category: CommandType.needs,
      iconKey: 'toilet',
      titleKey: 'commands.toilet',
      order: 3,
    ),

    // CARE
    const Command(
      id: 'medicine',
      category: CommandType.care,
      iconKey: 'medicine',
      titleKey: 'commands.medicine',
      order: 1,
    ),
    const Command(
      id: 'pain',
      category: CommandType.care,
      iconKey: 'pain',
      titleKey: 'commands.pain',
      order: 2,
    ),
    const Command(
      id: 'nurse',
      category: CommandType.care,
      iconKey: 'nurse',
      titleKey: 'commands.nurse',
      order: 3,
    ),

    // COMFORT
    const Command(
      id: 'pillow',
      category: CommandType.comfort,
      iconKey: 'pillow',
      titleKey: 'commands.pillow',
      order: 1,
    ),
    const Command(
      id: 'blanket',
      category: CommandType.comfort,
      iconKey: 'blanket',
      titleKey: 'commands.blanket',
      order: 2,
    ),
    const Command(
      id: 'light',
      category: CommandType.comfort,
      iconKey: 'light',
      titleKey: 'commands.light',
      order: 3,
    ),

    // TALK
    const Command(
      id: 'yes',
      category: CommandType.talk,
      iconKey: 'yes',
      titleKey: 'commands.yes',
      order: 1,
    ),
    const Command(
      id: 'no',
      category: CommandType.talk,
      iconKey: 'no',
      titleKey: 'commands.no',
      order: 2,
    ),
    const Command(
      id: 'thanks',
      category: CommandType.talk,
      iconKey: 'thanks',
      titleKey: 'commands.thanks',
      order: 3,
    ),
  ];

  static List<Command> get all {
    final commands = _commands
        .where((command) => command.enabled)
        .toList();

    commands.sort((a, b) => a.order.compareTo(b.order));

    return commands;
  }

  static List<Command> byCategory(CommandType category) {
    return all
        .where((command) => command.category == category)
        .toList();
  }

  static List<CommandType> get categories => [
    CommandType.needs,
    CommandType.care,
    CommandType.comfort,
    CommandType.talk,
  ];
}
