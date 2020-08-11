
/*=============================================
=                Variables                    =
=============================================*/
const utils = require('../utils.js');

/*=============================================
=                  Class                      =
=============================================*/
class Book {
  defaultQuests;

  constructor(path) {
    this.defaultQuests = utils.loadJson(path)
  }
  

  questByID(id) {
    var quests = this.defaultQuests["questDatabase:9"];

    for (const key in quests) {
      if (quests.hasOwnProperty(key)) {
        const quest = quests[key];
        
        if (quest["questID:3"] === id) return quest;
      }
    }
  }


  forEachQuestInChapter(chapterName, fnc) {
    var chapters = this.defaultQuests["questLines:9"];
    for (const chap in chapters) {
      if (chapters.hasOwnProperty(chap)) {
        const chapter = chapters[chap];
        
        if (chapter["properties:10"]["betterquesting:10"]["name:8"] === chapterName) {
          for (const key in chapter["quests:9"]) {
            if (chapter["quests:9"].hasOwnProperty(key)) {
              const questLine = chapter["quests:9"][key];

              var quest = this.questByID(questLine["id:3"]);
              if (quest) fnc(quest);
            }
          }
          return;
        }
      }
    }
  }
}

/*=============================================
=                  Helpers                    =
=============================================*/
function bq_item(itemName, meta = 0, count = 1) {
  return {
    "id:8": itemName,
    "Count:3": count,
    "Damage:2": meta
  };
}

function bq_rewardItem(itemName, meta = 0, count = 1, index = 0) {
  return {
    "0:10": {
      "rewardID:8": "bq_standard:item",
      "index:3": index,
      "rewards:9": {
        "0:10": bq_item(itemName, meta, count)
      }
    }
  };
}


function bq_rewardChoice(lootchestLevel, itemName1, meta1=0, count1=1, itemName2, meta2=0, count2=1) {
  var r = {
    "0:10": {
      "rewardID:8": "bq_standard:choice",
      "index:3": 0,
      "choices:9": {
        "0:10": {
          "id:8": "bq_standard:loot_chest",
          "Count:3": 1,
          "Damage:2": lootchestLevel
        },
        "1:10": bq_item(itemName1, meta1, count1)
      }
    }
  };
  if (itemName2) {
    r["0:10"]["choices:9"]["2:10"] = bq_item(itemName2, meta2, count2);
  }

  return r;
}



/*=============================================
=           Working with class                =
=============================================*/
const questsPath = "../config/betterquesting/DefaultQuests.json";
var book = new Book(questsPath);


/*=============================================
=           Rewards replacer
=============================================*/

function replaceReward(quest, newReward) {
  if (Object.keys(quest["rewards:9"]).length <= 1 && quest["rewards:9"]["0:10"]["rewardID:8"] === "bq_standard:item") {
    quest["rewards:9"] = newReward;
    console.log('replaced  :>> ', quest["properties:10"]["betterquesting:10"]["name:8"]);
  } else {
    console.log(' !skipped :>> ', quest["properties:10"]["betterquesting:10"]["name:8"]);
  }
}

function replaceRewards(args) {

  book.forEachQuestInChapter(args.chapterName, quest => {
    var id = quest["questID:3"];

    if        (args.idsByTier[0].includes(id)) {
      replaceReward(quest, args.rewardByTier[0]);
    } else if (args.idsByTier[1].includes(id)) {
      replaceReward(quest, args.rewardByTier[1]);

      quest["preRequisites:11"].forEach(midQuestID => {
        var midQuestParent = book.questByID(midQuestID);
        replaceReward(midQuestParent, args.rewardByTier[2]);
      });
    } else {
      replaceReward(quest, args.rewardByTier[3]);
    }
  });
}

/* 

Replace all rewards in Thaumcraft chapter to choice
between loot chest and curiocity

*/

replaceRewards({
  chapterName: "Thaumcraft",
  idsByTier: [
    [654, 673, 679, 675, 680, 674],
    [681, 666, 677, 648, 651, 676, 678, 670, 653, 647],
  ],
  rewardByTier: [
    bq_rewardChoice(25, "thaumcraft:curio", 4, 1, "thaumcraft:curio", 3, 1),
    bq_rewardChoice(50, "thaumcraft:curio", 0, 1, "thaumcraft:curio", 2, 1),
    bq_rewardChoice(75, "thaumcraft:curio", 1, 3),
    bq_rewardItem("bq_standard:loot_chest", 100),
  ],
});


/* 

Change rewards for Draconic Evolution quests to better chests

*/
replaceRewards({
  chapterName: "Draconic Evolution",
  idsByTier: [
    [546,563,561,553,530],
    [537,7524,534,538,545,556,544],
  ],
  rewardByTier: [
    bq_rewardItem("bq_standard:loot_chest", 0),
    bq_rewardItem("bq_standard:loot_chest", 25),
    bq_rewardItem("bq_standard:loot_chest", 50),
    bq_rewardItem("bq_standard:loot_chest", 75),
  ],
});

/*=============================================
=           Save all changes                  =
=============================================*/
utils.saveObjAsJson(book.defaultQuests, questsPath);