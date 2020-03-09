import 'package:flutter/material.dart';

import '../init.dart';
// import '../models/game_object.dart';
import '../models/game_scene.dart';

GameScene sceneHeyYou = GameScene(
  id: 'road1',
  name: 'Hey you',
  themeData: mainTheme,
  description: [
    TextSpan(
        style: mainTheme.textTheme.bodyText1,
        text:
            'Пейзаж уже много часов остается неизменным. Плоская, от горизонта до горизонта, степь с высохшими кустами, сизая полоска гор на западе, идеально прямая лента шоссе и мелькающие вдоль обочины опоры линий электропередачи.'),
    TextSpan(
        style: mainTheme.textTheme.bodyText1,
        text:
            'Мотор урчит низко и ровно, Транс-Эм отлично держит дорогу. Я себя не сдерживаю — стрелка спидометра указывает на значение, раза в полтора превышающее допустимый здесь предел скорости.'),
    TextSpan(
        style: mainTheme.textTheme.bodyText1,
        text:
            'Солнце палит с самой вершины блёкло-голубого неба. Встречный ветер треплет рукав рубашки и безуспешно пытается заглушить рокот мотора.'),
  ],
  nextScene: cutsceneNewFriend,
);

GameScene cutsceneNewFriend = GameScene(
  id: 'flashback1',
  name: 'New friend',
  type: TypeOfScene.cutscene,
  themeData: newFriendTheme,
  description: [
    TextSpan(
        style: newFriendTheme.textTheme.bodyText1,
        text:
            'Их было трое против одного.\nОни — здоровые тупые быки из старших классов, он — высокий, худой, с копной черных волос и раскосыми глазами.\n«Слышь, узкоглазый, вали в свой вонючий Китай!»\n«Я кореец, придурок! И живу здесь всю жизнь. Можешь засунуть свой Китай себе в зад! Вам, кучке педиков, к этому не привыкать».\n«Что ты сейчас сказал?»'),
    TextSpan(
        style: newFriendTheme.textTheme.bodyText1,
        text:
            'Не лезь в чужую драку. Вся моя жизнь до этого момента была подтверждением этого простого правила: нкогда не лезь в чужую драку.\nЯ и не хотел. Если бы этот переулок не был моим единственным путём из школы, меня бы вообще там не было.\nДа и что я мог, тощий заучка с длинными пальцами и застёгнутой на все пуговицы рубашкой?\nМда.'),
    TextSpan(
        style: newFriendTheme.textTheme.bodyText1,
        text:
            'Уже потом, мы сидели бок о бок, прислонившись к стене, и затыкали разбитые носы моим оторванным рукавом.\n«Я Ким», — он протянул свою узкую ладонь.\n«Макс», — я пожал её, походя отметив свои сбитые костяшки.\n«Зачем полез-то? Не твоё ж дело».\nЯ неопределённо мотнул головой.\n«Ну… Спасибо, всё равно».'),
    TextSpan(
        style: newFriendTheme.textTheme.bodyText1,
        text:
            '«А разве Ким не девчоночье имя?» — спросил я через пару минут молчания.\n«Ещё раз такое скажешь, я тебя похлеще них отметелю».\n«Ну, у меня просто сестру так двоюродную зовут».\n«В последний раз предупреждаю: завязывай».'),
    TextSpan(
        style: newFriendTheme.textTheme.bodyText1,
        text:
            'Мы ещё немного посидели и, собрав выпотрошенные рюкзаки, поплелись на выход из переулка.\nВ тот день у меня появился лучший друг.'),
  ],
  nextScene: sceneWater,
);

GameScene sceneWater = GameScene(
  id: 'road2',
  name: 'Water',
  themeData: mainTheme,
  description: [
    TextSpan(
        style: mainTheme.textTheme.bodyText1,
        text:
            'Чёрная лента шоссе бежит под колесами, подтягивая горы всё ближе. По сторонам — тот же унылый, выжженный пейзаж до горизонта.'),
    TextSpan(
        style: mainTheme.textTheme.bodyText1,
        text:
            'На обочине мелькает указатель — где-то впереди будет автозаправка. Я смотрю на уровень бензина в баке: стрелка приближается к «Е». Придётся заехать. Но это потом, сейчас же страшно хочется пить. Солнце сквозь прозрачную крышу палит нещадно, а бутылку с водой я допил минут пятнадцать назад.'),
    TextSpan(
        style: mainTheme.textTheme.bodyText1,
        text: 'Нужно остановиться и взять из багажника новую.'),
  ],
);

GameScene locationBesideTA = GameScene(
  id: 'besideTA',
  name: 'Beside Trans Am',
  type: TypeOfScene.location,
  themeData: mainTheme,
  description: [
    TextSpan(
        style: mainTheme.textTheme.bodyText1,
        text:
            'Жара невыносимая. Раскалённый, чуть податливый асфальт печёт сквозь подошвы. Прикрыв глаза ладонью, я смотрю сначала в ту сторону, откуда приехал, потом в ту, куда ещё поеду. Ничего, кроме клубящегося марева.\n\nИ осязаемая, тягучая тишина, нарушаемая только пощёлкиванием остывающего мотора.'),
    TextSpan(
        style: mainTheme.textTheme.bodyText1,
        text:
            'Солнце, жара, марево горячего воздуха. Из-за тишины всё кажется нереальным, замершим во времени.'),
  ],
);

GameScene locationBehindTA = GameScene(
  id: 'behindTA',
  name: 'Behind Trans Am',
  type: TypeOfScene.location,
  themeData: mainTheme,
  description: [TextSpan(text: '')],
);

GameScene locationDesert = GameScene(
  id: 'desert',
  name: 'In the middle of Great Nowhere',
  type: TypeOfScene.location,
  themeData: mainTheme,
  description: [
    TextSpan(
        style: mainTheme.textTheme.bodyText1,
        text:
            'Наконец, я добираюсь до цели своей вылазки и вижу помятый мотоциклетный бак. Когда-то хромированный, теперь с пятнами ржавчины, он лежит на ровной поверхности большого выбеленного валуна, словно на постаменте.'),
    TextSpan(
        style: mainTheme.textTheme.bodyText1,
        text: 'Кто-то установил его сюда с определённой целью.'),
  ],
  nextScene: locationBesideTA2,
);

GameScene locationBesideTA2 = GameScene(
  id: 'besideTA2',
  name: 'Beside Trans Am',
  type: TypeOfScene.location,
  themeData: mainTheme,
  description: [
    TextSpan(
        style: mainTheme.textTheme.bodyText1,
        text:
            'Добираюсь к Транс-Эму как раз, когда допиваю первую бутылку воды. Делаю два широких шага по пыльному асфальту и зашвыриваю её подальше в сторону линии электропередачи. Бутылка звякает где-то в сухих кустах. К чёрту экологию.'),
    TextSpan(
        style: mainTheme.textTheme.bodyText1,
        text: 'Шаркая, подхожу к водительской двери.'),
  ],
);

GameScene locationInsideTA = GameScene(
  id: 'insideTA',
  name: 'Inside Trans Am',
  type: TypeOfScene.location,
  themeData: mainTheme,
  description: [TextSpan(text: '')],
);

final scenes = [
  sceneHeyYou,
  cutsceneNewFriend,
  sceneWater,
  locationBesideTA,
  locationBehindTA,
  locationDesert,
  locationBesideTA2,
  locationInsideTA,
];
