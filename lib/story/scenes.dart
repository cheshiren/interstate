import 'package:flutter/material.dart';

import '../init.dart';
// import '../models/game_object.dart';
import '../models/game_scene.dart';

GameScene sceneStub = GameScene(
  id: 'stub',
  name: 'STUB',
  themeData: mainTheme,
  description: [
    TextSpan(
        style: mainTheme.textTheme.bodyText1,
        text:
            'Продолжение следует.'),
  ],
);

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
            'Мы ещё немного посидели и, собрав выпотрошенные рюкзаки, поплелись на выход из переулка.\n\nВ тот день у меня появился лучший друг.'),
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
        text: 'Стараясь меньше наступать на нагретые солнцем участки дороги, подхожу к водительской двери.'),
  ],
);

GameScene locationInsideTA = GameScene(
  id: 'insideTA',
  name: 'Inside Trans Am',
  type: TypeOfScene.location,
  themeData: mainTheme,
  description: [TextSpan(text: '')],
);

GameScene cutsceneMJLeaf = GameScene(
  id: 'flashback2',
  name: 'Marijuana`s leaf',
  type: TypeOfScene.cutscene,
  themeData: mjLeafTheme,
  description: [
    TextSpan(
        style: mjLeafTheme.textTheme.bodyText1,
        text:
            '«…Не даст она тебе, Макс».\n«Даст, вот увидишь».\n«Да ты посмотри на неё. Маленькая, бледная, в очочках. Что ты там увидел?»\n«Ничего ты не понимаешь, Ким. У меня, может, чувство?»\n«Напомню, в прошлый раз твоё чувство обошлось тебе в два сломанных зуба».\n«Не, в этот раз всё по-настоящему».\n«Ну ещё бы. Ставлю свою стипендию, что у тебя ничего не выгорит».\n«Замётано».'),
    TextSpan(
        style: mjLeafTheme.textTheme.bodyText1,
        text:
            'Мы лежали на белоснежных шезлонгах посреди леса, смотрели на звёзды над верхушками сосен и курили один на двоих джойнт. Со стороны основного лагеря всё ещё доносились голоса и музыка, но уже тише — все постепенно расходились по палаткам. Вскоре оттуда доносилось лишь слабое треньканье — кому-то тоже не спалось.'),
    TextSpan(
        style: mjLeafTheme.textTheme.bodyText1,
        text:
            '«Смотри, вон те четыре звезды и вон те три, вместе похожи на лист конопли. Видишь?»\n«Тебе, похоже, уже хватит. Давай, передавай».\nИ в этот момент небо прочертил метеорит.\n«Видел? Звезда упала!»\n«Да, надо желания загадывать».\n«Так-так, что бы загадать? Так… А, вот! Всё, я загадал, а ты?»\n«Ещё раньше тебя».\n«Ага, конечно. И что ты загадал?»\n«Не скажу, не сбудется».\n«Ладно ломаться, Ким, что загадал-то?»\n«Ты же ржать будешь».\n«Не буду, честно».'),
    TextSpan(
        style: mjLeafTheme.textTheme.bodyText1,
        text:
            '«…Я хочу увидеть океан».\nЯ держался секунд пять прежде, чем засмеятся:\n«Океа-а-ан?»\n«Ну ты и козёл, Макс…»\n«Ах-ха-ха. Да кто загадывает увидеть океан? Что это за фигня такая?»\nЯ давился ещё несколько минут, пока не успокоился.\n«Ладно, Ким, извини. Вполне нормальное желание на самом деле. Я бы тоже непрочь посмотреть на океан. Да не дуйся ты. Хочешь, я скажу тебе, что я загадал?»\n«Я и так знаю, что ты загадал. Только она тебе всё равно не даст».\nСначала смешок, потом ещё, и мы уже катались на своих шезлонгах, задыхаясь и заливаясь слезами от смеха.'),
    TextSpan(
        style: mjLeafTheme.textTheme.bodyText1,
        text:
            '«Фу-ух, вроде отпустило».\n«Есть охота».\n«Ага. Пошли, сожрём чей-нибудь завтрак».\nИ мы поплелись в сторону лагеря, таща за собой шезлонги.\nСвою стипендию я таки проиграл.'),
  ],
  nextScene: sceneGasStation,
);

GameScene sceneGasStation = GameScene(
  id: 'gas1',
  name: 'Gas Station',
  themeData: mainTheme,
  description: [
    TextSpan(
        style: mainTheme.textTheme.bodyText1,
        text:
            'Судя по одометру, до заправочной станции остаётся совсем немного. Вскоре на горизонте появляется светлое пятно. Оно всё увеличивается и через некоторое время я уже могу различить марки топлива на высокой стойке у въезда, шесть колонок, стоящих под навесом, и опущенные металлические ставни небольшого здания.'),
    TextSpan(
        style: mainTheme.textTheme.bodyText1,
        text:
            'Не доезжая до заправки метров двести, я останавливаю Транс-Эм прямо посреди дороги. Нужно понаблюдать прежде, чем соваться туда.'),
  ],
  nextScene: cutsceneNewFriend,
);

final scenes = [
  sceneStub,
  sceneHeyYou,
  cutsceneNewFriend,
  sceneWater,
  locationBesideTA,
  locationBehindTA,
  locationDesert,
  locationBesideTA2,
  locationInsideTA,
  cutsceneMJLeaf,
  sceneGasStation,
];
