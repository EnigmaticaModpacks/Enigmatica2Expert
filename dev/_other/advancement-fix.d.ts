export interface Advancement {
  display: Display;
  parent: string;
  criteria: Criteria;
  requirements: string[][]
  rewards: Rewards;
}

interface Rewards {
  recipes?: string[]
  loot?: string[]
  experience?: number
  function?: any
}

interface Criteria {
  [key: string]: CriteriaEntry;
}

interface CriteriaEntry {
  trigger: string;
  conditions: Conditions;
}

interface Conditions {
  items: Item[];
  recipe: string
}

interface Item {
  type: string;
  ore: string;
}

interface Display {
  icon: Icon;
  title: Title;
  description: Title;
  frame: string;
}

interface Title {
  translate: string;
}

interface Icon {
  item: string;
  data: number;
}

interface Description {
  translate: string;
}