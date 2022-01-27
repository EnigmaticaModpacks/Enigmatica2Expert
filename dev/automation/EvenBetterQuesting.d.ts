export interface RootObject {
  'questSettings:10': QuestSettings;
  'questDatabase:9': QuestDatabase;
  'questLines:9': QuestLines;
  'format:8': string;
}

interface QuestSettings {
  'betterquesting:10': QuestSettingsBetterquesting;
}

interface QuestSettingsBetterquesting {
  'editmode:1': number;
  'editMode:8': string;
  'hardcore:1': number;
  'home_anchor_x:5': number;
  'home_anchor_y:5': number;
  'home_image:8': string;
  'home_offset_x:3': number;
  'home_offset_y:3': number;
  'livesdef:3': number;
  'livesDef:4': number;
  'livesmax:3': number;
  'livesMax:4': number;
  'pack_name:8': string;
  'pack_version:3': number;
  'party_enable:1': number;
}

interface QuestDatabase {
  [key: string]: Quest;
}

export interface Quest {
  'properties:10': QuestProperties;
  'tasks:9': Tasks;
  'rewards:9': Rewards;
  'preRequisites:11': number[];
  'questID:3': number;
}

interface Rewards {
  [key: string]: Reward;
}

interface Reward {
  'command:8': string;
  'title:8': string;
  'description:8': string;
  'viaPlayer:1': number;
  'hideBlockIcon:1': number;
  'asScript:1': number;
  'rewardID:8': string;
  'index:3': number;
}

interface Tasks {
  [key: string]: Task;
}

interface Task {
  'partialMatch:1': number;
  'ignoreNBT:1': number;
  'consume:1': number;
  'groupDetect:1': number;
  'autoConsume:1': number;
  'requiredItems:9': RequiredItems;
  'taskID:8': string;
  'index:3': number;
}

interface RequiredItems {
  [key: string]: RequiredItemsIcon;
}

interface RequiredItemsIcon {
  'id:8': string;
  'Count:3': number;
  'Damage:2': number;
  'tag:10': Tag;
  'OreDict:8': string;
}

interface Tag {
  [key: string]: any
}

interface QuestProperties {
  'betterquesting:10': QuestPropertiesBetterquesting;
}

interface QuestPropertiesBetterquesting {
  'autoclaim:1': number;
  'desc:8': string;
  'globalshare:1': number;
  'icon:10': Icon;
  'ismain:1': number;
  'issilent:1': number;
  'lockedprogress:1': number;
  'name:8': string;
  'partysinglereward:1': number;
  'partySingleReward:8': string;
  'questlogic:8': string;
  'repeat_relative:1': number;
  'repeattime:3': number;
  'simultaneous:1': number;
  'snd_complete:8': string;
  'snd_update:8': string;
  'tasklogic:8': string;
  'visibility:8': string;
}

interface QuestLines {
  [key: string]: QuestLine;
}

interface QuestLine {
  'properties:10': QuestLineProperties;
  'quests:9': QuestLineEntries;
  'lineID:3': number;
  'order:3': number;
}

interface QuestLineProperties {
  'betterquesting:10': QuestLinePropertiesBetterquesting;
}

interface QuestLinePropertiesBetterquesting {
  'bg_image:8': string;
  'bg_size:3': number;
  'desc:8': string;
  'icon:10': Icon;
  'name:8': string;
  'visibility:8': string;
}

interface Icon {
  'id:8': string;
  'Count:3': number;
  'Damage:2': number;
  'OreDict:8': string;
}

interface QuestLineEntries {
  [key: string]: QuestLineEntry;
}

export interface QuestLineEntry {
  'sizeX:3': number;
  'sizeY:3': number;
  'x:3': number;
  'y:3': number;
  'id:3': number;
}