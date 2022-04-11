#priority 4000

val localizationMap as string[string][string] = {
  en_us: {
    'ic2.dust.coal'            : 'Blackened Fruit',
    'ic2.dust.ender_pearl'     : 'Spectral Fruit',
    'ic2.dust.small_tin'       : 'Tiny Fruit',
    'ic2.dust.small_copper'    : 'Coppery Fruit',
    'ic2.dust.small_diamond'   : 'Gelided Fruit',
    'ic2.dust.small_gold'      : 'Golden Fruit',
    'ic2.dust.small_iron'      : 'Irony Fruit',
    'ic2.dust.small_lead'      : 'Leaden Fruit',
    'ic2.dust.small_silver'    : 'Silvery Fruit',
    'ic2.dust.sulfur'          : 'Fiery Fruit',
    'ic2.crop_res.coffee_beans': 'Arabica',
    'item.singularity.silver.name'  : '§eFur Singularity',

    'commands.lang.usage'                  : '"/lang" or "/lang hand" to dump inventory or held item into crafttweaker.log file',
    'commands.lang.output'                 : 'Output %s items into crafttweaker.log file',
    'commands.lang.empty'                  : 'Your inventory is empty. Put untranslated item in',
    'commands.lang.hand'                   : 'Output held item into crafttweaker.log file',
    'commands.addtooltip.usage'            : '"§e/addtooltip §6[Item Description]§r" to describe item into crafttweaker.log file',
    'commands.addtooltip.needtext'         : '§e/addtooltip§r command need tooltip string. Try §e/addtooltip §6Hello world!',
    'commands.addtooltip.needitem'         : '§e/addtooltip§r command need item to be hold. Take something in hand.',
    'commands.addtooltip.succes'           : '§7Tooltip exported to §n§fcrafttweaker.log',
    'commands.addtooltip.notag'            : '§8Be aware that §7/addtooltip§8 not account nbt tags',
    'commands.restart_server.usage'        : '§8[§6ø§8]§r All players on server should execute this command to restart server',
    'commands.restart_server.query'        : '§8[§6ø§8]§r %s wants to §nrestart server§r. Write §a/restart§r if you want §nrestart server§r too.',
    'commands.restart_server.failed'       : '§8[§6ø§8]§r Failed to vote for restart. This players refuse to enter §a/restart§r: %s',
    'commands.restart_server.cancelled'    : '§8[§6ø§8]§r Vote for §nrestart server§r is cancelled',
    'commands.restart_server.already_voted': '§8[§6ø§8]§r You already voted for §nrestart server§r and waiting this players to vote: %s',
    'commands.restart_server.awaiting'     : '§8[§6ø§8]§r This players should write §a/restart§r too: %s',
    'commands.restart_server.in_process'   : '§8[§6ø§8]§r §c§nServer restarts§r in few seconds...',
    'commands.restart_server.delay'        : '§8[§6ø§8]§r §cServer would be stopped in 3 seconds!',
    'commands.restart_server.stopping'     : '§8[§6ø§8]§r §4Server stopping...',
  },

  ru_ru: {
    'ic2.dust.coal'            : 'Почерневший фрукт',
    'ic2.dust.ender_pearl'     : 'Спектральный фрукт',
    'ic2.dust.small_tin'       : 'Оловяный фрукт',
    'ic2.dust.small_copper'    : 'Медный фрукт',
    'ic2.dust.small_diamond'   : 'Желированный фрукт',
    'ic2.dust.small_gold'      : 'Золотой фрукт',
    'ic2.dust.small_iron'      : 'Железный фрукт',
    'ic2.dust.small_lead'      : 'Свинцовый фрукт',
    'ic2.dust.small_silver'    : 'Серебристый фрукт',
    'ic2.dust.sulfur'          : 'Огневой фрукт',
    'ic2.crop_res.coffee_beans': 'Арабика',
    'item.singularity.silver.name'  : '§eМеховая сингулярность',

    'commands.lang.usage'                  : '"/lang" или "/lang hand" чтобы вывести список предметов инвентаня в файл crafttweaker.log',
    'commands.lang.output'                 : 'Выведено %s предметов в файл crafttweaker.log',
    'commands.lang.empty'                  : 'Ваш инвентарь пуст. Положите туда непереведенные предметы',
    'commands.lang.hand'                   : 'Выведен предмет из руки в файл crafttweaker.log',
    'commands.addtooltip.usage'            : '"§e/addtooltip §6[Описание предмета]§r" для описания предмета в файле crafttweaker.log',
    'commands.addtooltip.needtext'         : 'Команде §e/addtooltip§r нужна строка подсказки. Попробуйте §e/addtooltip §6Hello world!',
    'commands.addtooltip.needitem'         : 'Команда §e/addtooltip§r требует, чтобы предмет был в руках. Возьмите что-нибудь в руку.',
    'commands.addtooltip.succes'           : '§7Толтип экспортируется в §n§fcrafttweaker.log',
    'commands.addtooltip.notag'            : '§8Ведь §7/addtooltip§8 не учитывает теги nbt.',
    'commands.restart_server.usage'        : '§8[§6ø§8]§r Все игроки на сервере должны выполнить эту команду для перезапуска сервера',
    'commands.restart_server.query'        : '§8[§6ø§8]§r %s хочет §nrestart server§r. Напишите §a/restart§r, если вы тоже хотите §nrestart server§r.',
    'commands.restart_server.failed'       : '§8[§6ø§8]§r Не удалось проголосовать за перезапуск. Этот игрок отказывается войти в §a/restart§r: %s',
    'commands.restart_server.cancelled'    : '§8[§6ø§8]§r Голосование за §nrestart server§r отменено',
    'commands.restart_server.already_voted': '§8[§6ø§8]§r Вы уже проголосовали за §nrestart server§r и ждете, что эти игроки проголосуют: %s',
    'commands.restart_server.awaiting'     : '§8[§6ø§8]§r Этот игрок тоже должен написать §а/restart§r: %s',
    'commands.restart_server.in_process'   : '§8[§6ø§8]§r §c§nСервер перезапустится§r через несколько секунд...',
    'commands.restart_server.delay'        : '§8[§6ø§8]§r §cСервер будет остановлен через 3 секунды!',
    'commands.restart_server.stopping'     : '§8[§6ø§8]§r §4Сервер останавливается...',
  }
};


for lang, entries in localizationMap {
  for k, v in entries {
    game.setLocalization(lang, k, v);
  }
}